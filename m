Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2308698486
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 20:27:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSNPi-0007AA-U4; Wed, 15 Feb 2023 14:25:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pSNPQ-0006io-7t
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 14:25:40 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pSNPM-0001h9-7O
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 14:25:39 -0500
Received: by mail-wm1-x32d.google.com with SMTP id z13so14127682wmp.2
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 11:25:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gSmn1T2ZUVhv/JvfYoFnkq+8tSAXjNfRrUM4DhYmMNU=;
 b=ZLfsxiVkLWmyo0Z1jjw4DTiw8uUc6U8gVb/QQKxuFHgazytsWEpcWhv9SC9bm0Tcd8
 0CeuuElCXcxvtOfQ0wIMUT19pn4GSbO74QUTS5KVXFNeptySvtppmz5dSG8/eMrkZ7PV
 Oqr+5Q1B6fRcWFLPzVK1obtaut5JZvFAPrcOg/EXidLOXjTTcVV3tn5NnAHG/QhAseZK
 zZNnq95ahR94OoOWcNY/XXih9NNR2essj8ocWwpKBtqnavH5ABM7eu8CWKjFsBAUaH20
 O8D2omQ51DYuQMHZSxLtGa7AeIbCPerN7UhdxqVoL5rvX6ptdMboGq9bSdu2bU966Ugo
 vbhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gSmn1T2ZUVhv/JvfYoFnkq+8tSAXjNfRrUM4DhYmMNU=;
 b=tOCx5lrvPYJhDCq2m3atqqEHjq8yX4kSiUCbjNOM5mRVjrzVI9KSl4I0x+oEcYNx0D
 O72jRkwaH67s1jPq0EeZCsXveFIhfUFRwAUpgoBEpogfSFoRnShSpTWkQdC4oBV15c8P
 nrnIw1/DiEBqO6idEItb24BiT4iftZxJUf0Fp/Ca/40FedVoZE4lXPSCb1LSyyVIgcjA
 KnMrAPVwZXZ4RXSlsI9l4YpMmFusazSz3m8fNbicDtEXtfwHjUhvkbSTzW4jbB60wsXD
 +YvZ1z1qabmf0WDqp7CSglQPNXOTADJpID93BgPWgQHv/dZ03WPkAEXmytLJ6+5E7YDi
 THnA==
X-Gm-Message-State: AO0yUKUShgVy3SktEFfZ0wlP1yEm/evHx8ZcETp0w+a1arZ5t7erph0A
 lXATA+50EBR3Bd6gOXxAOCdCSA==
X-Google-Smtp-Source: AK7set/+fhh2Cj+vGTOx2d1i3U9XEeqxvzgo/eHr85oVS7AVCnE+YWJ8SBe5itcqHKht9pk8SErfCg==
X-Received: by 2002:a05:600c:2b0f:b0:3dc:1054:3acd with SMTP id
 y15-20020a05600c2b0f00b003dc10543acdmr2685631wme.17.1676489134663; 
 Wed, 15 Feb 2023 11:25:34 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 j17-20020a05600c191100b003dd1c45a7b0sm3432149wmq.23.2023.02.15.11.25.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Feb 2023 11:25:32 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 66D961FFBE;
 Wed, 15 Feb 2023 19:25:31 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Michael Roth <michael.roth@amd.com>, Alexander Bulekov <alxndr@bu.edu>,
 Qiuhao Li <Qiuhao.Li@outlook.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm@nongnu.org, John Snow <jsnow@redhat.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Darren Kenny <darren.kenny@oracle.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Bandan Das <bsd@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Yonggang Luo <luoyonggang@gmail.com>, Li-Wen Hsu <lwhsu@freebsd.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Ed Maste <emaste@freebsd.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Subject: [PATCH 07/12] testing: update ubuntu2004 to ubuntu2204
Date: Wed, 15 Feb 2023 19:25:25 +0000
Message-Id: <20230215192530.299263-8-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230215192530.299263-1-alex.bennee@linaro.org>
References: <20230215192530.299263-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The 22.04 LTS release has been out for almost a year now so its time
to update all the remaining images to the current LTS. We can also
drop some hacks we need for older clang TSAN support.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 docs/devel/testing.rst                        |  4 ++--
 .gitlab-ci.d/buildtest.yml                    | 22 +++++++++----------
 .gitlab-ci.d/containers.yml                   |  4 ++--
 .../{ubuntu2004.docker => ubuntu2204.docker}  | 16 +++++---------
 tests/docker/test-tsan                        |  2 +-
 tests/lcitool/refresh                         | 10 +--------
 6 files changed, 23 insertions(+), 35 deletions(-)
 rename tests/docker/dockerfiles/{ubuntu2004.docker => ubuntu2204.docker} (91%)

diff --git a/docs/devel/testing.rst b/docs/devel/testing.rst
index e10c47b5a7..309a575abe 100644
--- a/docs/devel/testing.rst
+++ b/docs/devel/testing.rst
@@ -574,13 +574,13 @@ https://github.com/google/sanitizers/wiki/ThreadSanitizerCppManual
 
 Thread Sanitizer in Docker
 ~~~~~~~~~~~~~~~~~~~~~~~~~~
-TSan is currently supported in the ubuntu2004 docker.
+TSan is currently supported in the ubuntu2204 docker.
 
 The test-tsan test will build using TSan and then run make check.
 
 .. code::
 
-  make docker-test-tsan@ubuntu2004
+  make docker-test-tsan@ubuntu2204
 
 TSan warnings under docker are placed in files located at build/tsan/.
 
diff --git a/.gitlab-ci.d/buildtest.yml b/.gitlab-ci.d/buildtest.yml
index 8f332fc36f..be319ab2d0 100644
--- a/.gitlab-ci.d/buildtest.yml
+++ b/.gitlab-ci.d/buildtest.yml
@@ -38,9 +38,9 @@ avocado-system-alpine:
 build-system-ubuntu:
   extends: .native_build_job_template
   needs:
-    job: amd64-ubuntu2004-container
+    job: amd64-ubuntu2204-container
   variables:
-    IMAGE: ubuntu2004
+    IMAGE: ubuntu2204
     CONFIGURE_ARGS: --enable-docs --enable-fdt=system --enable-capstone
     TARGETS: aarch64-softmmu alpha-softmmu cris-softmmu hppa-softmmu
       microblazeel-softmmu mips64el-softmmu
@@ -56,7 +56,7 @@ check-system-ubuntu:
     - job: build-system-ubuntu
       artifacts: true
   variables:
-    IMAGE: ubuntu2004
+    IMAGE: ubuntu2204
     MAKE_CHECK_ARGS: check
 
 avocado-system-ubuntu:
@@ -65,7 +65,7 @@ avocado-system-ubuntu:
     - job: build-system-ubuntu
       artifacts: true
   variables:
-    IMAGE: ubuntu2004
+    IMAGE: ubuntu2204
     MAKE_CHECK_ARGS: check-avocado
 
 build-system-debian:
@@ -459,10 +459,10 @@ avocado-cfi-x86_64:
 tsan-build:
   extends: .native_build_job_template
   needs:
-    job: amd64-ubuntu2004-container
+    job: amd64-ubuntu2204-container
   variables:
-    IMAGE: ubuntu2004
-    CONFIGURE_ARGS: --enable-tsan --cc=clang-10 --cxx=clang++-10
+    IMAGE: ubuntu2204
+    CONFIGURE_ARGS: --enable-tsan --cc=clang --cxx=clang++
           --enable-trace-backends=ust --enable-fdt=system --disable-slirp
     TARGETS: x86_64-softmmu ppc64-softmmu riscv64-softmmu x86_64-linux-user
     MAKE_CHECK_ARGS: bench V=1
@@ -471,10 +471,10 @@ tsan-build:
 gcov:
   extends: .native_build_job_template
   needs:
-    job: amd64-ubuntu2004-container
+    job: amd64-ubuntu2204-container
   timeout: 80m
   variables:
-    IMAGE: ubuntu2004
+    IMAGE: ubuntu2204
     CONFIGURE_ARGS: --enable-gcov
     TARGETS: aarch64-softmmu ppc64-softmmu s390x-softmmu x86_64-softmmu
     MAKE_CHECK_ARGS: check
@@ -539,9 +539,9 @@ build-tci:
 build-coroutine-sigaltstack:
   extends: .native_build_job_template
   needs:
-    job: amd64-ubuntu2004-container
+    job: amd64-ubuntu2204-container
   variables:
-    IMAGE: ubuntu2004
+    IMAGE: ubuntu2204
     CONFIGURE_ARGS: --with-coroutine=sigaltstack --disable-tcg
                     --enable-trace-backends=ftrace
     MAKE_CHECK_ARGS: check-unit
diff --git a/.gitlab-ci.d/containers.yml b/.gitlab-ci.d/containers.yml
index 96d2a3b58b..8637a13d86 100644
--- a/.gitlab-ci.d/containers.yml
+++ b/.gitlab-ci.d/containers.yml
@@ -13,10 +13,10 @@ amd64-debian-container:
   variables:
     NAME: debian-amd64
 
-amd64-ubuntu2004-container:
+amd64-ubuntu2204-container:
   extends: .container_job_template
   variables:
-    NAME: ubuntu2004
+    NAME: ubuntu2204
 
 amd64-opensuse-leap-container:
   extends: .container_job_template
diff --git a/tests/docker/dockerfiles/ubuntu2004.docker b/tests/docker/dockerfiles/ubuntu2204.docker
similarity index 91%
rename from tests/docker/dockerfiles/ubuntu2004.docker
rename to tests/docker/dockerfiles/ubuntu2204.docker
index f34d88d33d..30b9e56793 100644
--- a/tests/docker/dockerfiles/ubuntu2004.docker
+++ b/tests/docker/dockerfiles/ubuntu2204.docker
@@ -1,10 +1,10 @@
 # THIS FILE WAS AUTO-GENERATED
 #
-#  $ lcitool dockerfile --layers all ubuntu-2004 qemu
+#  $ lcitool dockerfile --layers all ubuntu-2204 qemu
 #
 # https://gitlab.com/libvirt/libvirt-ci
 
-FROM docker.io/library/ubuntu:20.04
+FROM docker.io/library/ubuntu:22.04
 
 RUN export DEBIAN_FRONTEND=noninteractive && \
     apt-get update && \
@@ -14,7 +14,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
                       bash \
                       bc \
                       bison \
-                      bsdmainutils \
+                      bsdextrautils \
                       bzip2 \
                       ca-certificates \
                       ccache \
@@ -36,6 +36,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
                       libasan5 \
                       libasound2-dev \
                       libattr1-dev \
+                      libbpf-dev \
                       libbrlapi-dev \
                       libbz2-dev \
                       libc6-dev \
@@ -90,6 +91,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
                       libtasn1-6-dev \
                       libubsan1 \
                       libudev-dev \
+                      liburing-dev \
                       libusb-1.0-0-dev \
                       libusbredirhost-dev \
                       libvdeplug-dev \
@@ -100,6 +102,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
                       llvm \
                       locales \
                       make \
+                      meson \
                       multipath-tools \
                       ncat \
                       nettle-dev \
@@ -111,11 +114,9 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
                       python3-opencv \
                       python3-pillow \
                       python3-pip \
-                      python3-setuptools \
                       python3-sphinx \
                       python3-sphinx-rtd-theme \
                       python3-venv \
-                      python3-wheel \
                       python3-yaml \
                       rpm2cpio \
                       sed \
@@ -139,13 +140,8 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
     ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/g++ && \
     ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/gcc
 
-RUN /usr/bin/pip3 install meson==0.56.0
-
 ENV CCACHE_WRAPPERSDIR "/usr/libexec/ccache-wrappers"
 ENV LANG "en_US.UTF-8"
 ENV MAKE "/usr/bin/make"
 ENV NINJA "/usr/bin/ninja"
 ENV PYTHON "/usr/bin/python3"
-# Apply patch https://reviews.llvm.org/D75820
-# This is required for TSan in clang-10 to compile with QEMU.
-RUN sed -i 's/^const/static const/g' /usr/lib/llvm-10/lib/clang/10.0.0/include/sanitizer/tsan_interface.h
diff --git a/tests/docker/test-tsan b/tests/docker/test-tsan
index 53d90d2f79..f6d6590e39 100755
--- a/tests/docker/test-tsan
+++ b/tests/docker/test-tsan
@@ -21,7 +21,7 @@ setup_tsan()
     tsan_log_dir="/tmp/qemu-test/build/tsan"
     mkdir -p $tsan_log_dir > /dev/null || true
     EXTRA_CONFIGURE_OPTS="${EXTRA_CONFIGURE_OPTS} --enable-tsan \
-                          --cc=clang-10 --cxx=clang++-10 \
+                          --cc=clang --cxx=clang++ \
                           --disable-werror --extra-cflags=-O0"
     # detect deadlocks is false currently simply because
     # TSan crashes immediately with deadlock detector enabled.
diff --git a/tests/lcitool/refresh b/tests/lcitool/refresh
index a5ea0efc3b..eeee9a7b34 100755
--- a/tests/lcitool/refresh
+++ b/tests/lcitool/refresh
@@ -69,13 +69,6 @@ def generate_cirrus(target, trailer=None):
     generate(filename, cmd, trailer)
 
 
-ubuntu2004_tsanhack = [
-    "# Apply patch https://reviews.llvm.org/D75820\n",
-    "# This is required for TSan in clang-10 to compile with QEMU.\n",
-    "RUN sed -i 's/^const/static const/g' /usr/lib/llvm-10/lib/clang/10.0.0/include/sanitizer/tsan_interface.h\n"
-]
-
-
 # Netmap still needs to be manually built as it is yet to be packaged
 # into a distro. We also add cscope and gtags which are used in the CI
 # test
@@ -113,8 +106,7 @@ try:
                         trailer="".join(debian11_extras))
     generate_dockerfile("fedora", "fedora-37")
     generate_dockerfile("opensuse-leap", "opensuse-leap-153")
-    generate_dockerfile("ubuntu2004", "ubuntu-2004",
-                        trailer="".join(ubuntu2004_tsanhack))
+    generate_dockerfile("ubuntu2204", "ubuntu-2204")
 
     #
     # Cross compiling builds
-- 
2.39.1


