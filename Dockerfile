FROM alpine:latest
MAINTAINER tinyproxy <tinyproxy@gmail.com>

RUN echo "https://mirrors.ustc.edu.cn/alpine/v3.5/main" > /etc/apk/repositories
RUN echo "https://mirrors.ustc.edu.cn/alpine/v3.5/community" >> /etc/apk/repositories
RUN apk update
RUN apk --update upgrade && \
    apk add curl ca-certificates wget && \
    update-ca-certificates && \
    rm -rf /var/cache/apk/*

RUN mkdir -p /opt/
WORKDIR /opt/
COPY cmd/registry/registry /opt/registry
EXPOSE 5000

CMD /opt/registry serve /opt/config.yml

