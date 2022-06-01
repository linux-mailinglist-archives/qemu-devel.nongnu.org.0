Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64ED353AC82
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Jun 2022 20:11:29 +0200 (CEST)
Received: from localhost ([::1]:54590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwSoa-0000wp-CP
	for lists+qemu-devel@lfdr.de; Wed, 01 Jun 2022 14:11:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nwSjA-0000sS-Bf
 for qemu-devel@nongnu.org; Wed, 01 Jun 2022 14:05:53 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:39646)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nwSj5-0004x9-Vd
 for qemu-devel@nongnu.org; Wed, 01 Jun 2022 14:05:49 -0400
Received: by mail-ed1-x535.google.com with SMTP id v25so3267441eda.6
 for <qemu-devel@nongnu.org>; Wed, 01 Jun 2022 11:05:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lQ0e939MO+IsOcIGdZgx+oYWWPC+iEjbM9XxZeVIT50=;
 b=AIoMPdvzsnx3BRLLGaolXjCANGmWkQLeYnccAK7C0BRjlCt4556KpJTp7CG5Jq6Z8Z
 zUdEVo0UP+Mh3D8ahQ9qC4yu6lIkmYPXvUUqeegW8y4luhDP6z0fB1mmaMnvUxvOy/6x
 XC2OIuIKJz4fUEb1jOvpRggseXiLz8a1vesB69QHC3UV4+9/dQbYoSzDMdHOzocjiCuq
 2FAsBdLoRTWPWYjZ4rg+9K1hrpwOUTBL8/MFKtgor/y1gw6y3wQteW8LrhmwQw1C7pjI
 uSqnrtQMug5tB9sz71nRJf96Zk3k4jVRTIsTsF+ZoITZbObJrRQjSKDAjSqh+4pXoE1u
 AEqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lQ0e939MO+IsOcIGdZgx+oYWWPC+iEjbM9XxZeVIT50=;
 b=iMxuuJPghP8/CqV/RRJkdXNGnPR/wbVdB8D33lEZCu34CFLruTEyNjheGFw/WsDD9o
 JzfPk/SddAGLioMrQBLIyuARRXOgIbO9ZOf+idlggyOmyAxZxsYcksyoXTfDHCyblwWi
 1nPjL8Su+Jg/du5DR0Jnr90V6z1fn7Fnz8gjRk2XLkDMsecw5L97+NOTemfgflvcOovN
 zl2kzKOv4AUwWUkAYuqcfTyGSWoWDwcdhiON6DEVfqh9FTZK+VKBf5o48hV+ZQV+0ZU9
 GL0zfI0Djf8p0PcQXFwgGk4aMmv1bCAnQATmXtAR7sqSKtBNVhhLzi6DQXuf/vgthqIO
 mrGw==
X-Gm-Message-State: AOAM533g5JwxU6Ultt3yCWBArw4ucMcVXcQxyMfQwA/uRs5YV1aP5uM6
 A/aoBqZYUqV70LY+BZAfscAbDg==
X-Google-Smtp-Source: ABdhPJxE+Epg1bqCufSlySXI8aiwOgRxXlHR1a829BY4yjNCH/yLO7W8zC/TAAZj38EFndjoChW7nw==
X-Received: by 2002:aa7:c852:0:b0:42d:70d8:2864 with SMTP id
 g18-20020aa7c852000000b0042d70d82864mr1018508edt.379.1654106746594; 
 Wed, 01 Jun 2022 11:05:46 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 f3-20020a056402150300b0042dd3bf1403sm1271800edw.54.2022.06.01.11.05.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jun 2022 11:05:43 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 47F451FFBE;
 Wed,  1 Jun 2022 19:05:38 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org,
	richard.henderson@linaro.org
Cc: qemu-devel@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PULL 06/33] tests/docker: update debian-armhf-cross with lcitool
Date: Wed,  1 Jun 2022 19:05:10 +0100
Message-Id: <20220601180537.2329566-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220601180537.2329566-1-alex.bennee@linaro.org>
References: <20220601180537.2329566-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x535.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use lcitool to update debian-armhf-cross to a Debian 11 based system.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20220527153603.887929-7-alex.bennee@linaro.org>

diff --git a/.gitlab-ci.d/container-cross.yml b/.gitlab-ci.d/container-cross.yml
index ac15fce9b6..4d1830f3fc 100644
--- a/.gitlab-ci.d/container-cross.yml
+++ b/.gitlab-ci.d/container-cross.yml
@@ -34,8 +34,7 @@ armel-debian-cross-container:
 
 armhf-debian-cross-container:
   extends: .container_job_template
-  stage: containers-layer2
-  needs: ['amd64-debian10-container']
+  stage: containers
   variables:
     NAME: debian-armhf-cross
 
diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
index ca2157db46..d6e0710554 100644
--- a/tests/docker/Makefile.include
+++ b/tests/docker/Makefile.include
@@ -90,7 +90,6 @@ endif
 
 docker-image-debian-alpha-cross: docker-image-debian10
 docker-image-debian-armel-cross: docker-image-debian10
-docker-image-debian-armhf-cross: docker-image-debian10
 docker-image-debian-hppa-cross: docker-image-debian10
 docker-image-debian-m68k-cross: docker-image-debian10
 docker-image-debian-mips-cross: docker-image-debian10
diff --git a/tests/docker/dockerfiles/debian-armhf-cross.docker b/tests/docker/dockerfiles/debian-armhf-cross.docker
index 25d7618833..a2ebce96f8 100644
--- a/tests/docker/dockerfiles/debian-armhf-cross.docker
+++ b/tests/docker/dockerfiles/debian-armhf-cross.docker
@@ -1,29 +1,165 @@
+# THIS FILE WAS AUTO-GENERATED
 #
-# Docker armhf cross-compiler target
+#  $ lcitool dockerfile --layers all --cross armv7l debian-11 qemu
 #
-# This docker target builds on the debian Stretch base image.
-#
-FROM qemu/debian10
+# https://gitlab.com/libvirt/libvirt-ci
 
-# Add the foreign architecture we want and install dependencies
-RUN dpkg --add-architecture armhf
-RUN apt update && \
-    DEBIAN_FRONTEND=noninteractive eatmydata \
-    apt install -y --no-install-recommends \
-        crossbuild-essential-armhf
-RUN apt update && \
-    DEBIAN_FRONTEND=noninteractive eatmydata \
-    apt build-dep -yy -a armhf --arch-only qemu
+FROM docker.io/library/debian:11-slim
 
-# Specify the cross prefix for this image (see tests/docker/common.rc)
-ENV QEMU_CONFIGURE_OPTS --cross-prefix=arm-linux-gnueabihf-
-ENV DEF_TARGET_LIST arm-softmmu,arm-linux-user,armeb-linux-user
+RUN export DEBIAN_FRONTEND=noninteractive && \
+    apt-get update && \
+    apt-get install -y eatmydata && \
+    eatmydata apt-get dist-upgrade -y && \
+    eatmydata apt-get install --no-install-recommends -y \
+            bash \
+            bc \
+            bsdextrautils \
+            bzip2 \
+            ca-certificates \
+            ccache \
+            dbus \
+            debianutils \
+            diffutils \
+            exuberant-ctags \
+            findutils \
+            gcovr \
+            genisoimage \
+            gettext \
+            git \
+            hostname \
+            libpcre2-dev \
+            libspice-protocol-dev \
+            llvm \
+            locales \
+            make \
+            meson \
+            ncat \
+            ninja-build \
+            openssh-client \
+            perl-base \
+            pkgconf \
+            python3 \
+            python3-numpy \
+            python3-opencv \
+            python3-pillow \
+            python3-pip \
+            python3-sphinx \
+            python3-sphinx-rtd-theme \
+            python3-venv \
+            python3-yaml \
+            rpm2cpio \
+            sed \
+            sparse \
+            tar \
+            tesseract-ocr \
+            tesseract-ocr-eng \
+            texinfo && \
+    eatmydata apt-get autoremove -y && \
+    eatmydata apt-get autoclean -y && \
+    sed -Ei 's,^# (en_US\.UTF-8 .*)$,\1,' /etc/locale.gen && \
+    dpkg-reconfigure locales
+
+ENV LANG "en_US.UTF-8"
+ENV MAKE "/usr/bin/make"
+ENV NINJA "/usr/bin/ninja"
+ENV PYTHON "/usr/bin/python3"
+ENV CCACHE_WRAPPERSDIR "/usr/libexec/ccache-wrappers"
 
-RUN apt update && \
-    DEBIAN_FRONTEND=noninteractive eatmydata \
-    apt install -y --no-install-recommends \
-        libbz2-dev:armhf \
-        liblzo2-dev:armhf \
-        librdmacm-dev:armhf \
-        libsnappy-dev:armhf \
-        libxen-dev:armhf
+RUN export DEBIAN_FRONTEND=noninteractive && \
+    dpkg --add-architecture armhf && \
+    eatmydata apt-get update && \
+    eatmydata apt-get dist-upgrade -y && \
+    eatmydata apt-get install --no-install-recommends -y dpkg-dev && \
+    eatmydata apt-get install --no-install-recommends -y \
+            g++-arm-linux-gnueabihf \
+            gcc-arm-linux-gnueabihf \
+            libaio-dev:armhf \
+            libasan5:armhf \
+            libasound2-dev:armhf \
+            libattr1-dev:armhf \
+            libbpf-dev:armhf \
+            libbrlapi-dev:armhf \
+            libbz2-dev:armhf \
+            libc6-dev:armhf \
+            libcacard-dev:armhf \
+            libcap-ng-dev:armhf \
+            libcapstone-dev:armhf \
+            libcurl4-gnutls-dev:armhf \
+            libdaxctl-dev:armhf \
+            libdrm-dev:armhf \
+            libepoxy-dev:armhf \
+            libfdt-dev:armhf \
+            libffi-dev:armhf \
+            libfuse3-dev:armhf \
+            libgbm-dev:armhf \
+            libgcrypt20-dev:armhf \
+            libglib2.0-dev:armhf \
+            libglusterfs-dev:armhf \
+            libgnutls28-dev:armhf \
+            libgtk-3-dev:armhf \
+            libibumad-dev:armhf \
+            libibverbs-dev:armhf \
+            libiscsi-dev:armhf \
+            libjemalloc-dev:armhf \
+            libjpeg62-turbo-dev:armhf \
+            liblttng-ust-dev:armhf \
+            liblzo2-dev:armhf \
+            libncursesw5-dev:armhf \
+            libnfs-dev:armhf \
+            libnuma-dev:armhf \
+            libpam0g-dev:armhf \
+            libpixman-1-dev:armhf \
+            libpng-dev:armhf \
+            libpulse-dev:armhf \
+            librbd-dev:armhf \
+            librdmacm-dev:armhf \
+            libsasl2-dev:armhf \
+            libsdl2-dev:armhf \
+            libsdl2-image-dev:armhf \
+            libseccomp-dev:armhf \
+            libselinux1-dev:armhf \
+            libslirp-dev:armhf \
+            libsnappy-dev:armhf \
+            libspice-server-dev:armhf \
+            libssh-gcrypt-dev:armhf \
+            libsystemd-dev:armhf \
+            libtasn1-6-dev:armhf \
+            libubsan1:armhf \
+            libudev-dev:armhf \
+            liburing-dev:armhf \
+            libusb-1.0-0-dev:armhf \
+            libusbredirhost-dev:armhf \
+            libvdeplug-dev:armhf \
+            libvirglrenderer-dev:armhf \
+            libvte-2.91-dev:armhf \
+            libxen-dev:armhf \
+            libzstd-dev:armhf \
+            nettle-dev:armhf \
+            systemtap-sdt-dev:armhf \
+            xfslibs-dev:armhf \
+            zlib1g-dev:armhf && \
+    eatmydata apt-get autoremove -y && \
+    eatmydata apt-get autoclean -y && \
+    mkdir -p /usr/local/share/meson/cross && \
+    echo "[binaries]\n\
+c = '/usr/bin/arm-linux-gnueabihf-gcc'\n\
+ar = '/usr/bin/arm-linux-gnueabihf-gcc-ar'\n\
+strip = '/usr/bin/arm-linux-gnueabihf-strip'\n\
+pkgconfig = '/usr/bin/arm-linux-gnueabihf-pkg-config'\n\
+\n\
+[host_machine]\n\
+system = 'linux'\n\
+cpu_family = 'arm'\n\
+cpu = 'armhf'\n\
+endian = 'little'" > /usr/local/share/meson/cross/arm-linux-gnueabihf && \
+    dpkg-query --showformat '${Package}_${Version}_${Architecture}\n' --show > /packages.txt && \
+    mkdir -p /usr/libexec/ccache-wrappers && \
+    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/arm-linux-gnueabihf-c++ && \
+    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/arm-linux-gnueabihf-cc && \
+    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/arm-linux-gnueabihf-g++ && \
+    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/arm-linux-gnueabihf-gcc
+
+ENV ABI "arm-linux-gnueabihf"
+ENV MESON_OPTS "--cross-file=arm-linux-gnueabihf"
+ENV QEMU_CONFIGURE_OPTS --cross-prefix=arm-linux-gnueabihf-
+ENV DEF_TARGET_LIST arm-softmmu,arm-linux-user
diff --git a/tests/lcitool/refresh b/tests/lcitool/refresh
index dc1fc21ef9..7e4a92f630 100755
--- a/tests/lcitool/refresh
+++ b/tests/lcitool/refresh
@@ -105,6 +105,11 @@ try:
                         trailer=debian_cross_build("aarch64-linux-gnu-",
                                                    "aarch64-softmmu,aarch64-linux-user"))
 
+    generate_dockerfile("debian-armhf-cross", "debian-11",
+                        cross="armv7l",
+                        trailer=debian_cross_build("arm-linux-gnueabihf-",
+                                                   "arm-softmmu,arm-linux-user"))
+
     generate_dockerfile("debian-s390x-cross", "debian-11",
                         cross="s390x",
                         trailer=debian_cross_build("s390x-linux-gnu-",
-- 
2.30.2


