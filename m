Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E232D4C4D53
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 19:08:00 +0100 (CET)
Received: from localhost ([::1]:47054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNf0Z-0007E1-Ph
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 13:07:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nNeGl-0003oz-1v
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 12:20:39 -0500
Received: from [2a00:1450:4864:20::62f] (port=33655
 helo=mail-ej1-x62f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nNeGf-0002LO-UM
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 12:20:38 -0500
Received: by mail-ej1-x62f.google.com with SMTP id vz16so12271667ejb.0
 for <qemu-devel@nongnu.org>; Fri, 25 Feb 2022 09:20:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZnSDnS26O+We8tj2s8QP2w5gvYU8tgP2p7nPv2ljHq4=;
 b=SoCYPLt5RuWOGv4ZFpUO81SNX7L2sz67aALqZwAaO0weDpkfc9m32bCPcIAHKDAxP1
 q4YU7wvdgjfWfrI5F08q7OZfo7qHFsU588MCc9JemYwtPO50ifH8QzWxxY/N7j+bDo3c
 9PSyilMVaNT2F015qwzbq45QRHNRszcVO4J7meXSc5RDptZZhOVGouzTigYyDStfIMdf
 ysSuF7LCtQ3JtrLx2TaCdss5V0QdhoQpLp3uyYlk7sk6nM1ihCqmidKFgpejGvvluBMX
 RjsxZEGBKrmWGbrGfhy7EIa6xXw3ZK9fjGlAKX/wXHcBTlqnU5uiH/q8aE6D4fMXCOai
 I9uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZnSDnS26O+We8tj2s8QP2w5gvYU8tgP2p7nPv2ljHq4=;
 b=B5be8xme3jP102DNeZtLizVEpScUgEFjvq0NTl271fUuY3AdkxcHWv0eoDUKORpydF
 pEcwEPeUd013vjp4r9nvDcF/hFl+ap19qGV3IBCvetwHgDDvnGQrzwU828ksazABF6Qz
 Izplp8vDbjsDUim2ds/euUUytBFQWiMNhNO5RZwOTnw1IbROhd3cVnp3Q9Gkgg0dLUUW
 ak2FcoY/IOLQ3xZYSD6nUpQj6URtXpRxkBMWcnlyDPvdmYHsDUbNzdmfGi4iEUyH40/s
 SftqFwG6ctArho1XvhRfdFOdJnV6+5bi6aobpxyr0lyS+QV7L/WfeBmmvDGQhoFyQMs5
 Q4lg==
X-Gm-Message-State: AOAM532MA7PrEdO1pZgef3Uizb1StiilZpeRKUsle/YcviukAH4bT+2C
 bVLhGpk1oE2L41SWkRXfyHI2Nw==
X-Google-Smtp-Source: ABdhPJxJ6mREuOlqeVuJ/U8nO6JtPPFGMuJN4GrRnT02TbHZW99mXCjyTj5G8+bGJ9U1BnQMLlXZzQ==
X-Received: by 2002:a17:906:354f:b0:6b4:1449:2d03 with SMTP id
 s15-20020a170906354f00b006b414492d03mr7318771eja.197.1645809629921; 
 Fri, 25 Feb 2022 09:20:29 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 z60-20020a509e42000000b00410d28fc82bsm1592557ede.19.2022.02.25.09.20.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Feb 2022 09:20:27 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 66A191FFBC;
 Fri, 25 Feb 2022 17:20:22 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 04/18] tests/docker: update debian-arm64-cross with lci-tool
Date: Fri, 25 Feb 2022 17:20:07 +0000
Message-Id: <20220225172021.3493923-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220225172021.3493923-1-alex.bennee@linaro.org>
References: <20220225172021.3493923-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::62f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62f.google.com
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
Cc: fam@euphon.net, Thomas Huth <thuth@redhat.com>, berrange@redhat.com,
 Beraldo Leal <bleal@redhat.com>, sw@weilnetz.de, richard.henderson@linaro.org,
 f4bug@amsat.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 qemu-arm@nongnu.org, stefanha@redhat.com, crosa@redhat.com,
 pbonzini@redhat.com, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Using lci-tool update debian-arm64-cross to a Debian 11 based system.
As a result we can drop debian-arm64-test-cross just for building
tests.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220211160309.335014-5-alex.bennee@linaro.org>
---
 .gitlab-ci.d/container-cross.yml              |  10 +-
 tests/docker/Makefile.include                 |   3 -
 .../dockerfiles/debian-arm64-cross.docker     | 186 +++++++++++++++---
 .../debian-arm64-test-cross.docker            |  13 --
 tests/lcitool/refresh                         |  11 ++
 tests/tcg/configure.sh                        |   2 +-
 6 files changed, 173 insertions(+), 52 deletions(-)
 delete mode 100644 tests/docker/dockerfiles/debian-arm64-test-cross.docker

diff --git a/.gitlab-ci.d/container-cross.yml b/.gitlab-ci.d/container-cross.yml
index a3b5b90552..ed620620f8 100644
--- a/.gitlab-ci.d/container-cross.yml
+++ b/.gitlab-ci.d/container-cross.yml
@@ -21,18 +21,10 @@ amd64-debian-user-cross-container:
 
 arm64-debian-cross-container:
   extends: .container_job_template
-  stage: containers-layer2
-  needs: ['amd64-debian10-container']
+  stage: containers
   variables:
     NAME: debian-arm64-cross
 
-arm64-test-debian-cross-container:
-  extends: .container_job_template
-  stage: containers-layer2
-  needs: ['amd64-debian11-container']
-  variables:
-    NAME: debian-arm64-test-cross
-
 armel-debian-cross-container:
   extends: .container_job_template
   stage: containers-layer2
diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
index 286f0ac5b5..eeee1e6bdf 100644
--- a/tests/docker/Makefile.include
+++ b/tests/docker/Makefile.include
@@ -137,7 +137,6 @@ DOCKER_PARTIAL_IMAGES += fedora
 endif
 
 docker-image-debian-alpha-cross: docker-image-debian10
-docker-image-debian-arm64-cross: docker-image-debian10
 docker-image-debian-armel-cross: docker-image-debian10
 docker-image-debian-armhf-cross: docker-image-debian10
 docker-image-debian-hppa-cross: docker-image-debian10
@@ -213,14 +212,12 @@ docker-image-debian-nios2-cross: $(DOCKER_FILES_DIR)/debian-toolchain.docker \
 # Specialist build images, sometimes very limited tools
 docker-image-debian-tricore-cross: docker-image-debian10
 docker-image-debian-all-test-cross: docker-image-debian10
-docker-image-debian-arm64-test-cross: docker-image-debian11
 docker-image-debian-microblaze-cross: docker-image-debian10
 docker-image-debian-nios2-cross: docker-image-debian10
 docker-image-debian-powerpc-test-cross: docker-image-debian11
 
 # These images may be good enough for building tests but not for test builds
 DOCKER_PARTIAL_IMAGES += debian-alpha-cross
-DOCKER_PARTIAL_IMAGES += debian-arm64-test-cross
 DOCKER_PARTIAL_IMAGES += debian-powerpc-test-cross
 DOCKER_PARTIAL_IMAGES += debian-hppa-cross
 DOCKER_PARTIAL_IMAGES += debian-m68k-cross debian-mips64-cross
diff --git a/tests/docker/dockerfiles/debian-arm64-cross.docker b/tests/docker/dockerfiles/debian-arm64-cross.docker
index 166e24df13..589510a7be 100644
--- a/tests/docker/dockerfiles/debian-arm64-cross.docker
+++ b/tests/docker/dockerfiles/debian-arm64-cross.docker
@@ -1,32 +1,166 @@
+# THIS FILE WAS AUTO-GENERATED
 #
-# Docker arm64 cross-compiler target
+#  $ lcitool dockerfile --layers all --cross aarch64 debian-11 qemu
 #
-# This docker target builds on the debian Buster base image.
-#
-FROM qemu/debian10
+# https://gitlab.com/libvirt/libvirt-ci
 
-# Add the foreign architecture we want and install dependencies
-RUN dpkg --add-architecture arm64
-RUN apt update && \
-    DEBIAN_FRONTEND=noninteractive eatmydata \
-    apt install -y --no-install-recommends \
-        crossbuild-essential-arm64
-RUN apt update && \
-    DEBIAN_FRONTEND=noninteractive eatmydata \
-    apt build-dep -yy -a arm64 --arch-only qemu
+FROM docker.io/library/debian:11-slim
 
-# Specify the cross prefix for this image (see tests/docker/common.rc)
-ENV QEMU_CONFIGURE_OPTS --cross-prefix=aarch64-linux-gnu-
-ENV DEF_TARGET_LIST aarch64-softmmu,aarch64-linux-user
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
 
-RUN apt update && \
-    DEBIAN_FRONTEND=noninteractive eatmydata \
-    apt install -y --no-install-recommends \
-        libbz2-dev:arm64 \
-        liblzo2-dev:arm64 \
-        librdmacm-dev:arm64 \
-        libsnappy-dev:arm64 \
-        libxen-dev:arm64
+ENV LANG "en_US.UTF-8"
+ENV MAKE "/usr/bin/make"
+ENV NINJA "/usr/bin/ninja"
+ENV PYTHON "/usr/bin/python3"
+ENV CCACHE_WRAPPERSDIR "/usr/libexec/ccache-wrappers"
 
-# nettle
-ENV QEMU_CONFIGURE_OPTS $QEMU_CONFIGURE_OPTS --enable-nettle
+RUN export DEBIAN_FRONTEND=noninteractive && \
+    dpkg --add-architecture arm64 && \
+    eatmydata apt-get update && \
+    eatmydata apt-get dist-upgrade -y && \
+    eatmydata apt-get install --no-install-recommends -y dpkg-dev && \
+    eatmydata apt-get install --no-install-recommends -y \
+            g++-aarch64-linux-gnu \
+            gcc-aarch64-linux-gnu \
+            libaio-dev:arm64 \
+            libasan5:arm64 \
+            libasound2-dev:arm64 \
+            libattr1-dev:arm64 \
+            libbpf-dev:arm64 \
+            libbrlapi-dev:arm64 \
+            libbz2-dev:arm64 \
+            libc6-dev:arm64 \
+            libcacard-dev:arm64 \
+            libcap-ng-dev:arm64 \
+            libcapstone-dev:arm64 \
+            libcurl4-gnutls-dev:arm64 \
+            libdaxctl-dev:arm64 \
+            libdrm-dev:arm64 \
+            libepoxy-dev:arm64 \
+            libfdt-dev:arm64 \
+            libffi-dev:arm64 \
+            libfuse3-dev:arm64 \
+            libgbm-dev:arm64 \
+            libgcrypt20-dev:arm64 \
+            libglib2.0-dev:arm64 \
+            libglusterfs-dev:arm64 \
+            libgnutls28-dev:arm64 \
+            libgtk-3-dev:arm64 \
+            libibumad-dev:arm64 \
+            libibverbs-dev:arm64 \
+            libiscsi-dev:arm64 \
+            libjemalloc-dev:arm64 \
+            libjpeg62-turbo-dev:arm64 \
+            liblttng-ust-dev:arm64 \
+            liblzo2-dev:arm64 \
+            libncursesw5-dev:arm64 \
+            libnfs-dev:arm64 \
+            libnuma-dev:arm64 \
+            libpam0g-dev:arm64 \
+            libpixman-1-dev:arm64 \
+            libpng-dev:arm64 \
+            libpulse-dev:arm64 \
+            librbd-dev:arm64 \
+            librdmacm-dev:arm64 \
+            libsasl2-dev:arm64 \
+            libsdl2-dev:arm64 \
+            libsdl2-image-dev:arm64 \
+            libseccomp-dev:arm64 \
+            libselinux1-dev:arm64 \
+            libslirp-dev:arm64 \
+            libsnappy-dev:arm64 \
+            libspice-server-dev:arm64 \
+            libssh-gcrypt-dev:arm64 \
+            libsystemd-dev:arm64 \
+            libtasn1-6-dev:arm64 \
+            libubsan1:arm64 \
+            libudev-dev:arm64 \
+            liburing-dev:arm64 \
+            libusb-1.0-0-dev:arm64 \
+            libusbredirhost-dev:arm64 \
+            libvdeplug-dev:arm64 \
+            libvirglrenderer-dev:arm64 \
+            libvte-2.91-dev:arm64 \
+            libxen-dev:arm64 \
+            libzstd-dev:arm64 \
+            nettle-dev:arm64 \
+            systemtap-sdt-dev:arm64 \
+            xfslibs-dev:arm64 \
+            zlib1g-dev:arm64 && \
+    eatmydata apt-get autoremove -y && \
+    eatmydata apt-get autoclean -y && \
+    mkdir -p /usr/local/share/meson/cross && \
+    echo "[binaries]\n\
+c = '/usr/bin/aarch64-linux-gnu-gcc'\n\
+ar = '/usr/bin/aarch64-linux-gnu-gcc-ar'\n\
+strip = '/usr/bin/aarch64-linux-gnu-strip'\n\
+pkgconfig = '/usr/bin/aarch64-linux-gnu-pkg-config'\n\
+\n\
+[host_machine]\n\
+system = 'linux'\n\
+cpu_family = 'aarch64'\n\
+cpu = 'aarch64'\n\
+endian = 'little'" > /usr/local/share/meson/cross/aarch64-linux-gnu && \
+    dpkg-query --showformat '${Package}_${Version}_${Architecture}\n' --show > /packages.txt && \
+    mkdir -p /usr/libexec/ccache-wrappers && \
+    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/aarch64-linux-gnu-c++ && \
+    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/aarch64-linux-gnu-cc && \
+    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/aarch64-linux-gnu-g++ && \
+    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/aarch64-linux-gnu-gcc
+
+ENV ABI "aarch64-linux-gnu"
+ENV MESON_OPTS "--cross-file=aarch64-linux-gnu"
+ENV QEMU_CONFIGURE_OPTS --cross-prefix=aarch64-linux-gnu-
+ENV DEF_TARGET_LIST aarch64-softmmu,aarch64-linux-user
diff --git a/tests/docker/dockerfiles/debian-arm64-test-cross.docker b/tests/docker/dockerfiles/debian-arm64-test-cross.docker
deleted file mode 100644
index 53a9012beb..0000000000
--- a/tests/docker/dockerfiles/debian-arm64-test-cross.docker
+++ /dev/null
@@ -1,13 +0,0 @@
-#
-# Docker arm64 cross-compiler target (tests only)
-#
-# This docker target builds on the debian Bullseye base image.
-#
-FROM qemu/debian11
-
-# Add the foreign architecture we want and install dependencies
-RUN dpkg --add-architecture arm64
-RUN apt update && \
-    DEBIAN_FRONTEND=noninteractive eatmydata \
-        apt install -y --no-install-recommends \
-        crossbuild-essential-arm64 gcc-10-aarch64-linux-gnu
diff --git a/tests/lcitool/refresh b/tests/lcitool/refresh
index 4ab90a310a..ada73f7045 100755
--- a/tests/lcitool/refresh
+++ b/tests/lcitool/refresh
@@ -76,6 +76,12 @@ ubuntu2004_tsanhack = [
    "RUN sed -i 's/^const/static const/g' /usr/lib/llvm-10/lib/clang/10.0.0/include/sanitizer/tsan_interface.h\n"
 ]
 
+def debian_cross_build(prefix, targets):
+   conf = "ENV QEMU_CONFIGURE_OPTS --cross-prefix=%s\n" % (prefix)
+   targets = "ENV DEF_TARGET_LIST %s\n" % (targets)
+   return "".join([conf, targets])
+
+
 try:
    generate_dockerfile("centos8", "centos-stream-8")
    generate_dockerfile("fedora", "fedora-35")
@@ -86,6 +92,11 @@ try:
    generate_dockerfile("opensuse-leap", "opensuse-leap-152")
    generate_dockerfile("alpine", "alpine-edge")
 
+   generate_dockerfile("debian-arm64-cross", "debian-11",
+                       cross="aarch64",
+                       trailer=debian_cross_build("aarch64-linux-gnu-",
+                                                  "aarch64-softmmu,aarch64-linux-user"))
+
    generate_cirrus("freebsd-12")
    generate_cirrus("freebsd-13")
    generate_cirrus("macos-11")
diff --git a/tests/tcg/configure.sh b/tests/tcg/configure.sh
index 763e9b6ad8..adc95d6a44 100755
--- a/tests/tcg/configure.sh
+++ b/tests/tcg/configure.sh
@@ -97,7 +97,7 @@ for target in $target_list; do
     aarch64-*)
       # We don't have any bigendian build tools so we only use this for AArch64
       container_hosts="x86_64 aarch64"
-      container_image=debian-arm64-test-cross
+      container_image=debian-arm64-cross
       container_cross_cc=aarch64-linux-gnu-gcc-10
       ;;
     alpha-*)
-- 
2.30.2


