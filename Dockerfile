FROM alpine:3.12

LABEL maintainer="HenryYee-2020/11/16"

EXPOSE 8000

COPY Yearning  /opt/Yearning
COPY conf.toml /opt/conf.toml

RUN echo "http://mirrors.ustc.edu.cn/alpine/v3.12/main/" > /etc/apk/repositories && \
      apk add --no-cache tzdata libc6-compat && \
      ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
      echo "Asia/Shanghai" >> /etc/timezone && \
      echo 'hosts: files mdns4_minimal [NOTFOUND=return] dns mdns4' >> /etc/nsswitch.conf

WORKDIR /opt

CMD /opt/Yearning install && /opt/Yearning run
