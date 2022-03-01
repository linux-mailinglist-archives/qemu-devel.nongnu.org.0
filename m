Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C8F74C88F1
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 11:07:13 +0100 (CET)
Received: from localhost ([::1]:52748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOzPT-0003F5-VI
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 05:07:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nOz6Q-0003Hx-0v
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 04:47:30 -0500
Received: from [2a00:1450:4864:20::42e] (port=34345
 helo=mail-wr1-x42e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nOz6M-00077d-I6
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 04:47:29 -0500
Received: by mail-wr1-x42e.google.com with SMTP id d3so19554135wrf.1
 for <qemu-devel@nongnu.org>; Tue, 01 Mar 2022 01:47:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HVZdgancV6HY+C+1L2V0hYnmdXSRS3bHLzlHa8HpzLU=;
 b=Fi6D6rW8+8ytkO36QjF5mnYwyOXITCtVfFOz3YBubbIUdFtRlJnUbeYVM0+sSA/mUx
 HKjU1MjjPt8MIWmtZTFOOELDeWbJPjfaQ9IcJv5E92xbaPz4l0n2VvUL7Q6Lat7dNUdQ
 Eb1PeW3FMB0qR0bllJmatBXOhVujsG2SSPLayzEpHT4p7FZlTI4e0RBC8a2Fxh7TZnQZ
 /T75Ed3zxrLXzOJ2LsosmLJQXrhkUKnutPImpFFoOJJt4om1nkQLwVcHcZRsmzyy54nb
 eRJoqfDhcWu+6DbEVidy/ex++OCLyAN7E+UGotozHq0ZtRRXSLbMOKdeJIIeDLFIc47b
 Ha0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HVZdgancV6HY+C+1L2V0hYnmdXSRS3bHLzlHa8HpzLU=;
 b=NnA0BWECyESDYK1YkQELpCpu6w1cRQts5GPqqB3cxdtBH7qg/FyaRj5snNmp8qluNq
 k+/jVfgr3vKnJHuBZzv+Dk7ivZTLwmS6Yg3DOaZ6PcmNiGlu5Pf7xFbXwm5n9xsE2nK6
 8kKkziCX4JTE+01qd2CfQOQOihWPhD7CghY8CLNYHzPV88UCDdr1t89LKnBtscu0xO90
 ypayVS/FvCj7C01LJCgcSmajWn3cagZRaMymHQON6p6QsfhlZqhn7YOsiE+Hlvv1Byq0
 Jh8lW7sh7oAW6BC+wjozSLMw5PBTggJaBjtnvkrNoHpnvg1zBPYwV0Y8AGNRPYLlkW32
 l59Q==
X-Gm-Message-State: AOAM530s4yNx+n3CusrERvGU6jXC4npG+gzxStO9oid8OKCmheeHCLYw
 dvobb9Wa0MDI/nGFJnO10X81BA==
X-Google-Smtp-Source: ABdhPJwa5i2R6hdNLJ2FLf3f1z7C8h6a1Z+2YC2e5Iqs2tUxk/usVMHG3MrPXD4PZMgcjr0WQYroDw==
X-Received: by 2002:adf:f206:0:b0:1ef:fdb3:4b2b with SMTP id
 p6-20020adff206000000b001effdb34b2bmr3447012wro.179.1646128045221; 
 Tue, 01 Mar 2022 01:47:25 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 c14-20020a7bc84e000000b0038100c9a593sm2804934wml.45.2022.03.01.01.47.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Mar 2022 01:47:22 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D6DE11FFBD;
 Tue,  1 Mar 2022 09:47:15 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 05/18] tests/docker: update debian-s390x-cross with lcitool
Date: Tue,  1 Mar 2022 09:47:02 +0000
Message-Id: <20220301094715.550871-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220301094715.550871-1-alex.bennee@linaro.org>
References: <20220301094715.550871-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 David Hildenbrand <david@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-devel@nongnu.org,
 "open list:S390 general arch..." <qemu-s390x@nongnu.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

A later compiler is needed for some upcomming tests so we might as
well migrate to an lcitool generated docker file.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: David Hildenbrand <david@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220225172021.3493923-6-alex.bennee@linaro.org>

diff --git a/.gitlab-ci.d/container-cross.yml b/.gitlab-ci.d/container-cross.yml
index ed620620f8..d38f657131 100644
--- a/.gitlab-ci.d/container-cross.yml
+++ b/.gitlab-ci.d/container-cross.yml
@@ -133,8 +133,7 @@ riscv64-debian-cross-container:
 
 s390x-debian-cross-container:
   extends: .container_job_template
-  stage: containers-layer2
-  needs: ['amd64-debian10-container']
+  stage: containers
   variables:
     NAME: debian-s390x-cross
 
diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
index eeee1e6bdf..cce9faab36 100644
--- a/tests/docker/Makefile.include
+++ b/tests/docker/Makefile.include
@@ -146,7 +146,6 @@ docker-image-debian-mips64-cross: docker-image-debian10
 docker-image-debian-mips64el-cross: docker-image-debian10
 docker-image-debian-mipsel-cross: docker-image-debian10
 docker-image-debian-ppc64el-cross: docker-image-debian10
-docker-image-debian-s390x-cross: docker-image-debian10
 docker-image-debian-sh4-cross: docker-image-debian10
 docker-image-debian-sparc64-cross: docker-image-debian10
 
diff --git a/tests/docker/dockerfiles/debian-s390x-cross.docker b/tests/docker/dockerfiles/debian-s390x-cross.docker
index 9f2ab51eb0..aa1bd6eb4c 100644
--- a/tests/docker/dockerfiles/debian-s390x-cross.docker
+++ b/tests/docker/dockerfiles/debian-s390x-cross.docker
@@ -1,33 +1,164 @@
+# THIS FILE WAS AUTO-GENERATED
 #
-# Docker s390 cross-compiler target
+#  $ lcitool dockerfile --layers all --cross s390x debian-11 qemu
 #
-# This docker target builds on the debian Stretch base image.
-#
-FROM qemu/debian10
+# https://gitlab.com/libvirt/libvirt-ci
+
+FROM docker.io/library/debian:11-slim
 
-# Add the s390x architecture
-RUN dpkg --add-architecture s390x
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
+            libtest-harness-perl \
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
 
-# Grab the updated list of packages
-RUN apt update && apt dist-upgrade -yy
-RUN apt update && \
-    DEBIAN_FRONTEND=noninteractive eatmydata \
-    apt install -y --no-install-recommends \
-        gcc-multilib-s390x-linux-gnu
+ENV LANG "en_US.UTF-8"
+ENV MAKE "/usr/bin/make"
+ENV NINJA "/usr/bin/ninja"
+ENV PYTHON "/usr/bin/python3"
+ENV CCACHE_WRAPPERSDIR "/usr/libexec/ccache-wrappers"
 
-RUN apt update && \
-    DEBIAN_FRONTEND=noninteractive eatmydata \
-    apt build-dep -yy -a s390x --arch-only qemu
+RUN export DEBIAN_FRONTEND=noninteractive && \
+    dpkg --add-architecture s390x && \
+    eatmydata apt-get update && \
+    eatmydata apt-get dist-upgrade -y && \
+    eatmydata apt-get install --no-install-recommends -y dpkg-dev && \
+    eatmydata apt-get install --no-install-recommends -y \
+            g++-s390x-linux-gnu \
+            gcc-s390x-linux-gnu \
+            libaio-dev:s390x \
+            libasan5:s390x \
+            libasound2-dev:s390x \
+            libattr1-dev:s390x \
+            libbpf-dev:s390x \
+            libbrlapi-dev:s390x \
+            libbz2-dev:s390x \
+            libc6-dev:s390x \
+            libcacard-dev:s390x \
+            libcap-ng-dev:s390x \
+            libcapstone-dev:s390x \
+            libcurl4-gnutls-dev:s390x \
+            libdaxctl-dev:s390x \
+            libdrm-dev:s390x \
+            libepoxy-dev:s390x \
+            libfdt-dev:s390x \
+            libffi-dev:s390x \
+            libfuse3-dev:s390x \
+            libgbm-dev:s390x \
+            libgcrypt20-dev:s390x \
+            libglib2.0-dev:s390x \
+            libglusterfs-dev:s390x \
+            libgnutls28-dev:s390x \
+            libgtk-3-dev:s390x \
+            libibumad-dev:s390x \
+            libibverbs-dev:s390x \
+            libiscsi-dev:s390x \
+            libjemalloc-dev:s390x \
+            libjpeg62-turbo-dev:s390x \
+            liblttng-ust-dev:s390x \
+            liblzo2-dev:s390x \
+            libncursesw5-dev:s390x \
+            libnfs-dev:s390x \
+            libnuma-dev:s390x \
+            libpam0g-dev:s390x \
+            libpixman-1-dev:s390x \
+            libpng-dev:s390x \
+            libpulse-dev:s390x \
+            librbd-dev:s390x \
+            librdmacm-dev:s390x \
+            libsasl2-dev:s390x \
+            libsdl2-dev:s390x \
+            libsdl2-image-dev:s390x \
+            libseccomp-dev:s390x \
+            libselinux1-dev:s390x \
+            libslirp-dev:s390x \
+            libsnappy-dev:s390x \
+            libssh-gcrypt-dev:s390x \
+            libsystemd-dev:s390x \
+            libtasn1-6-dev:s390x \
+            libubsan1:s390x \
+            libudev-dev:s390x \
+            liburing-dev:s390x \
+            libusb-1.0-0-dev:s390x \
+            libusbredirhost-dev:s390x \
+            libvdeplug-dev:s390x \
+            libvirglrenderer-dev:s390x \
+            libvte-2.91-dev:s390x \
+            libzstd-dev:s390x \
+            nettle-dev:s390x \
+            systemtap-sdt-dev:s390x \
+            xfslibs-dev:s390x \
+            zlib1g-dev:s390x && \
+    eatmydata apt-get autoremove -y && \
+    eatmydata apt-get autoclean -y && \
+    mkdir -p /usr/local/share/meson/cross && \
+    echo "[binaries]\n\
+c = '/usr/bin/s390x-linux-gnu-gcc'\n\
+ar = '/usr/bin/s390x-linux-gnu-gcc-ar'\n\
+strip = '/usr/bin/s390x-linux-gnu-strip'\n\
+pkgconfig = '/usr/bin/s390x-linux-gnu-pkg-config'\n\
+\n\
+[host_machine]\n\
+system = 'linux'\n\
+cpu_family = 's390x'\n\
+cpu = 's390x'\n\
+endian = 'big'" > /usr/local/share/meson/cross/s390x-linux-gnu && \
+    dpkg-query --showformat '${Package}_${Version}_${Architecture}\n' --show > /packages.txt && \
+    mkdir -p /usr/libexec/ccache-wrappers && \
+    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/s390x-linux-gnu-c++ && \
+    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/s390x-linux-gnu-cc && \
+    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/s390x-linux-gnu-g++ && \
+    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/s390x-linux-gnu-gcc
 
-# Specify the cross prefix for this image (see tests/docker/common.rc)
+ENV ABI "s390x-linux-gnu"
+ENV MESON_OPTS "--cross-file=s390x-linux-gnu"
 ENV QEMU_CONFIGURE_OPTS --cross-prefix=s390x-linux-gnu-
 ENV DEF_TARGET_LIST s390x-softmmu,s390x-linux-user
-
-# Install extra libraries to increase code coverage
-RUN apt update && \
-    DEBIAN_FRONTEND=noninteractive eatmydata \
-    apt install -y --no-install-recommends \
-        libbz2-dev:s390x \
-        liblzo2-dev:s390x \
-        librdmacm-dev:s390x \
-        libsnappy-dev:s390x
diff --git a/tests/lcitool/refresh b/tests/lcitool/refresh
index ada73f7045..1f00281b44 100755
--- a/tests/lcitool/refresh
+++ b/tests/lcitool/refresh
@@ -97,6 +97,11 @@ try:
                        trailer=debian_cross_build("aarch64-linux-gnu-",
                                                   "aarch64-softmmu,aarch64-linux-user"))
 
+   generate_dockerfile("debian-s390x-cross", "debian-11",
+                       cross="s390x",
+                       trailer=debian_cross_build("s390x-linux-gnu-",
+                                                  "s390x-softmmu,s390x-linux-user"))
+
    generate_cirrus("freebsd-12")
    generate_cirrus("freebsd-13")
    generate_cirrus("macos-11")
-- 
2.30.2


