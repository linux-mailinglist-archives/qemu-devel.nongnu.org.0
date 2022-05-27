Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E97BD536551
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 17:59:05 +0200 (CEST)
Received: from localhost ([::1]:60588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nucMj-0002w1-2h
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 11:59:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nuc8O-00039m-Is
 for qemu-devel@nongnu.org; Fri, 27 May 2022 11:44:18 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:54917)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nuc8M-0003st-GV
 for qemu-devel@nongnu.org; Fri, 27 May 2022 11:44:16 -0400
Received: by mail-wm1-x336.google.com with SMTP id bg25so2850733wmb.4
 for <qemu-devel@nongnu.org>; Fri, 27 May 2022 08:44:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=r14EC0AWRs0CmHXyWi9kq+yq0zhM/QceJkq5zOAgbeM=;
 b=Hw2vIUF3x/TF38J27q2kPu6eV51mjMHTJKOdiXZ94Br+KKS+tQksKWsb6PUumFTeLx
 rx6YtlRRUNIYGlkru9sIDHyjRJuYnq+yNY2g3t3g0om/l1y0p/ScXq5+jrUVLXMbN+uL
 pkTHnirPi1A2LRR3xZ7Tfs5WCIAT7XCR9rBxf3uq9t4ynfhb2/HlvITaixLkmc4z+gdN
 6uwQU/9o0uXgJI/NOjgczrje9wMD6glG39f6WAFZXCawNBSqPPFy7WAHjtgM9CT8ret2
 f3ED0ERB0G+L4rC0oq96OYzk904TQEKaIflzrZ3PASpf7OOVP5KfzXf1VDZBfbCMKqYe
 JWBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=r14EC0AWRs0CmHXyWi9kq+yq0zhM/QceJkq5zOAgbeM=;
 b=bQjuMOCylPhLeNtTakpb+25ETdeNrk0en1VL7+SrPbI0lwTPlYfjVDiT1YUVDFkAdr
 6Nro/a4NbdnmBQXHIP+j5bpf2tiMBCg9mQ5npr3x+U7UbVde+ukKJNgW9x3Dqhf8BeJR
 vtrTr2iLvQdUPjtW722iQeNLUkjEHTtn3KbjQmrd3xBDxqmBVPG6NPvGdAvxHyndBt0O
 uF0/0dQsdJbrLI4Du4Xjw0TFhEUm/kjG5MY/jxYWlbRrOVAZvRTOOBasPQKuUh3vVMAj
 ZFRxk/pqKxyYKCkUAiVRziFXulrfvGJV25SzhteUCJ5fPRJBCnUQ9YJEU9hVALLGwokf
 sj+A==
X-Gm-Message-State: AOAM533jMFLYPKx+8fXQN6pfHB7P3yTuctNMgGUTqtK3ipOID/TgyqX7
 isynnxHfrvJQLh9oZmvc87iv4PHnx+uIqg==
X-Google-Smtp-Source: ABdhPJxqAOp5kDyOqrTfB0CY34krjvHBX+u8EOufzppgQTapnQmLvO9OuWO+NkqA+eW6FDQm1DBWTQ==
X-Received: by 2002:a05:600c:4fd2:b0:397:4c02:9592 with SMTP id
 o18-20020a05600c4fd200b003974c029592mr7687271wmq.60.1653666252886; 
 Fri, 27 May 2022 08:44:12 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 o1-20020a5d47c1000000b0020fff0ea0a3sm2013950wrc.116.2022.05.27.08.44.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 08:44:06 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id DC3B51FFC3;
 Fri, 27 May 2022 16:36:04 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Luigi Rizzo <rizzo@iet.unipi.it>,
 Giuseppe Lettieri <g.lettieri@iet.unipi.it>,
 Vincenzo Maffione <v.maffione@gmail.com>, Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PATCH  v1 11/33] tests/docker: update debian-amd64 with lcitool
Date: Fri, 27 May 2022 16:35:41 +0100
Message-Id: <20220527153603.887929-12-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220527153603.887929-1-alex.bennee@linaro.org>
References: <20220527153603.887929-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x336.google.com
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

The one minor wrinkle we need to account for is the netmap support
still requires building from source. We also include cscope and GNU
global as they are used in one of the builds.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
Cc: Luigi Rizzo <rizzo@iet.unipi.it>
Cc: Giuseppe Lettieri <g.lettieri@iet.unipi.it>
Cc: Vincenzo Maffione <v.maffione@gmail.com>
---
 .gitlab-ci.d/containers.yml                  |   3 +-
 tests/docker/dockerfiles/debian-amd64.docker | 194 ++++++++++++++-----
 tests/lcitool/refresh                        |  19 ++
 3 files changed, 164 insertions(+), 52 deletions(-)

diff --git a/.gitlab-ci.d/containers.yml b/.gitlab-ci.d/containers.yml
index e9df90bbdd..be34cbc7ba 100644
--- a/.gitlab-ci.d/containers.yml
+++ b/.gitlab-ci.d/containers.yml
@@ -14,8 +14,7 @@ amd64-debian11-container:
 
 amd64-debian-container:
   extends: .container_job_template
-  stage: containers-layer2
-  needs: ['amd64-debian10-container']
+  stage: containers
   variables:
     NAME: debian-amd64
 
diff --git a/tests/docker/dockerfiles/debian-amd64.docker b/tests/docker/dockerfiles/debian-amd64.docker
index ed546edcd6..503e282802 100644
--- a/tests/docker/dockerfiles/debian-amd64.docker
+++ b/tests/docker/dockerfiles/debian-amd64.docker
@@ -1,59 +1,153 @@
+# THIS FILE WAS AUTO-GENERATED
 #
-# Docker x86_64 target
+#  $ lcitool dockerfile --layers all debian-11 qemu
 #
-# This docker target builds on the Debian Buster base image. Further
-# libraries which are not widely available are installed by hand.
-#
-FROM qemu/debian10
-MAINTAINER Philippe Mathieu-Daudé <f4bug@amsat.org>
-
-RUN apt update && \
-    DEBIAN_FRONTEND=noninteractive eatmydata \
-    apt build-dep -yy qemu
+# https://gitlab.com/libvirt/libvirt-ci
 
-RUN apt update && \
-    DEBIAN_FRONTEND=noninteractive eatmydata \
-    apt install -y --no-install-recommends \
-        cscope \
-        genisoimage \
-        exuberant-ctags \
-        global \
-        libbz2-dev \
-        liblzo2-dev \
-        libgcrypt20-dev \
-        libfdt-dev \
-        librdmacm-dev \
-        libsasl2-dev \
-        libsnappy-dev \
-        libvte-dev \
-        netcat-openbsd \
-        openssh-client \
-        python3-numpy \
-        python3-opencv \
-        python3-venv
+FROM docker.io/library/debian:11-slim
 
-# virgl
-RUN apt update && \
-    DEBIAN_FRONTEND=noninteractive eatmydata \
-    apt install -y --no-install-recommends \
-        libegl1-mesa-dev \
-        libepoxy-dev \
-        libgbm-dev
-RUN git clone https://gitlab.freedesktop.org/virgl/virglrenderer.git /usr/src/virglrenderer && \
-    cd /usr/src/virglrenderer && git checkout virglrenderer-0.8.0
-RUN cd /usr/src/virglrenderer && ./autogen.sh && ./configure --disable-tests && make install
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
+            clang \
+            dbus \
+            debianutils \
+            diffutils \
+            exuberant-ctags \
+            findutils \
+            g++ \
+            gcc \
+            gcovr \
+            genisoimage \
+            gettext \
+            git \
+            hostname \
+            libaio-dev \
+            libasan5 \
+            libasound2-dev \
+            libattr1-dev \
+            libbpf-dev \
+            libbrlapi-dev \
+            libbz2-dev \
+            libc6-dev \
+            libcacard-dev \
+            libcap-ng-dev \
+            libcapstone-dev \
+            libcurl4-gnutls-dev \
+            libdaxctl-dev \
+            libdrm-dev \
+            libepoxy-dev \
+            libfdt-dev \
+            libffi-dev \
+            libfuse3-dev \
+            libgbm-dev \
+            libgcrypt20-dev \
+            libglib2.0-dev \
+            libglusterfs-dev \
+            libgnutls28-dev \
+            libgtk-3-dev \
+            libibumad-dev \
+            libibverbs-dev \
+            libiscsi-dev \
+            libjemalloc-dev \
+            libjpeg62-turbo-dev \
+            liblttng-ust-dev \
+            liblzo2-dev \
+            libncursesw5-dev \
+            libnfs-dev \
+            libnuma-dev \
+            libpam0g-dev \
+            libpcre2-dev \
+            libpixman-1-dev \
+            libpmem-dev \
+            libpng-dev \
+            libpulse-dev \
+            librbd-dev \
+            librdmacm-dev \
+            libsasl2-dev \
+            libsdl2-dev \
+            libsdl2-image-dev \
+            libseccomp-dev \
+            libselinux1-dev \
+            libslirp-dev \
+            libsnappy-dev \
+            libspice-protocol-dev \
+            libspice-server-dev \
+            libssh-gcrypt-dev \
+            libsystemd-dev \
+            libtasn1-6-dev \
+            libubsan1 \
+            libudev-dev \
+            liburing-dev \
+            libusb-1.0-0-dev \
+            libusbredirhost-dev \
+            libvdeplug-dev \
+            libvirglrenderer-dev \
+            libvte-2.91-dev \
+            libxen-dev \
+            libzstd-dev \
+            llvm \
+            locales \
+            make \
+            meson \
+            multipath-tools \
+            ncat \
+            nettle-dev \
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
+            systemtap-sdt-dev \
+            tar \
+            tesseract-ocr \
+            tesseract-ocr-eng \
+            texinfo \
+            xfslibs-dev \
+            zlib1g-dev && \
+    eatmydata apt-get autoremove -y && \
+    eatmydata apt-get autoclean -y && \
+    sed -Ei 's,^# (en_US\.UTF-8 .*)$,\1,' /etc/locale.gen && \
+    dpkg-reconfigure locales && \
+    dpkg-query --showformat '${Package}_${Version}_${Architecture}\n' --show > /packages.txt && \
+    mkdir -p /usr/libexec/ccache-wrappers && \
+    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/c++ && \
+    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/cc && \
+    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/clang && \
+    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/g++ && \
+    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/gcc
 
-# netmap
-RUN apt update && \
-    DEBIAN_FRONTEND=noninteractive eatmydata \
-    apt install -y --no-install-recommends \
-        linux-headers-amd64
+ENV LANG "en_US.UTF-8"
+ENV MAKE "/usr/bin/make"
+ENV NINJA "/usr/bin/ninja"
+ENV PYTHON "/usr/bin/python3"
+ENV CCACHE_WRAPPERSDIR "/usr/libexec/ccache-wrappers"
+# netmap/cscope/global
+RUN DEBIAN_FRONTEND=noninteractive eatmydata \
+  apt install -y --no-install-recommends \
+  cscope\
+  global\
+  linux-headers-amd64
 RUN git clone https://github.com/luigirizzo/netmap.git /usr/src/netmap
 RUN cd /usr/src/netmap && git checkout v11.3
 RUN cd /usr/src/netmap/LINUX && ./configure --no-drivers --no-apps --kernel-dir=$(ls -d /usr/src/linux-headers-*-amd64) && make install
 ENV QEMU_CONFIGURE_OPTS --enable-netmap
-
-RUN ldconfig
-
-# gcrypt
-ENV QEMU_CONFIGURE_OPTS $QEMU_CONFIGURE_OPTS --enable-gcrypt
diff --git a/tests/lcitool/refresh b/tests/lcitool/refresh
index b947bb170d..5e260f8cd6 100755
--- a/tests/lcitool/refresh
+++ b/tests/lcitool/refresh
@@ -76,6 +76,23 @@ ubuntu2004_tsanhack = [
 ]
 
 
+# Netmap still needs to be manually built as it is yet to be packaged
+# into a distro. We also add cscope and gtags which are used in the CI
+# test
+debian11_extras = [
+    "# netmap/cscope/global\n",
+    "RUN DEBIAN_FRONTEND=noninteractive eatmydata \\\n",
+    "  apt install -y --no-install-recommends \\\n",
+    "  cscope\\\n",
+    "  global\\\n",
+    "  linux-headers-amd64\n",
+    "RUN git clone https://github.com/luigirizzo/netmap.git /usr/src/netmap\n",
+    "RUN cd /usr/src/netmap && git checkout v11.3\n",
+    "RUN cd /usr/src/netmap/LINUX && ./configure --no-drivers --no-apps --kernel-dir=$(ls -d /usr/src/linux-headers-*-amd64) && make install\n",
+    "ENV QEMU_CONFIGURE_OPTS --enable-netmap\n"
+]
+
+
 def debian_cross_build(prefix, targets):
     conf = "ENV QEMU_CONFIGURE_OPTS --cross-prefix=%s\n" % (prefix)
     targets = "ENV DEF_TARGET_LIST %s\n" % (targets)
@@ -92,6 +109,8 @@ try:
     #
     generate_dockerfile("alpine", "alpine-edge")
     generate_dockerfile("centos8", "centos-stream-8")
+    generate_dockerfile("debian-amd64", "debian-11",
+                        trailer="".join(debian11_extras))
     generate_dockerfile("fedora", "fedora-35")
     generate_dockerfile("opensuse-leap", "opensuse-leap-152")
     generate_dockerfile("ubuntu2004", "ubuntu-2004",
-- 
2.30.2


