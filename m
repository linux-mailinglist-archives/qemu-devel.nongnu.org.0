Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B94CF5A2DC8
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 19:44:51 +0200 (CEST)
Received: from localhost ([::1]:59808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRdNt-0004Ge-RV
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 13:44:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oRd9w-0005fE-TP
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 13:30:20 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:33564)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oRd9u-0003fq-29
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 13:30:20 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 m3-20020a05600c3b0300b003a5e0557150so4330769wms.0
 for <qemu-devel@nongnu.org>; Fri, 26 Aug 2022 10:30:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=pEPFWdQjAsz6lWwwj1JEnyFouBIXvFzmMJZyiLVC3g4=;
 b=Uw3kKnwJEqHuvsZtceYg1abZVB2MpzUpTRmlhsXX4hgdFCNOpin4FWYO4Efnv6o06B
 1D/LlcdX+nZXlRxj+W7ThXJp9NUgOcrXiXrINkUmfPRPXqt2YFYNzQX3SuoeudmsRC9Q
 XbFMBWPsL3mSeOORn5/Vp81rdepTbJowFgTR0J+MNi1azznGzDjojSSWkCvP5Pt26Wv8
 qMWTiTSpSzzw+p9n/fph2vKN5NidexoysLeq9PnsGHu8vjovY9Fw4/VotgKXavux7lNZ
 LOcjYgnWJy2IxmacizLczrQC3aWUgbJrhS2HkVTs1IhXfnom1wFx4hrKif/iiCScuPAg
 RM/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=pEPFWdQjAsz6lWwwj1JEnyFouBIXvFzmMJZyiLVC3g4=;
 b=m8x+R+ROSc8RZP9GMznibia4cfx2RLmQzseXjpTllGrt1HWlsrZhwMVM4DNIIo7Knc
 /OTfvrHxmbNasYhBjSfL3LxWshgDK8PrartO3MasuJr/KQFkwYUPE/ywjgXycZw1Dr7F
 h+JDdS5IFaymXtNnrPCTymXJCWnTfaoswgKMAAdz5l4yIbd+afS5wf9KjHwvOLs0FAQo
 Yw6lFHYMS5uQ+dck5aLH28J0e8NAbWdrak1XdNvTeXDoBoJLhJI98SZ9bPGU/qKKuBii
 q4gXqe1TRMqNzyQDJyJCbqfmg5ijB0goTC/gzy1jPYt6zQhLmOCxixji05pDzBdw+B7z
 Q4zA==
X-Gm-Message-State: ACgBeo1iyKkGVlfbWW1LdjOnq3LL79pISygDQfRtJLhDaixEA1WJFrAH
 4iK1q6NVff8nH2WpE1IcznS43g==
X-Google-Smtp-Source: AA6agR5bNR24H6oGBQiUxlR1MfjeNEciurnenmuMlyJa5dJe+JjrdCzV02pEAOKaCLko5eZnDv5gBw==
X-Received: by 2002:a05:600c:190b:b0:3a5:f8a3:7abe with SMTP id
 j11-20020a05600c190b00b003a5f8a37abemr393050wmq.81.1661535016285; 
 Fri, 26 Aug 2022 10:30:16 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 t17-20020a05600c199100b003a5f2cc2f1dsm218448wmq.42.2022.08.26.10.30.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Aug 2022 10:30:14 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 11FAC1FFC6;
 Fri, 26 Aug 2022 18:21:30 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>,
 libvir-list@redhat.com (reviewer:Incompatible changes),
 Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH  v1 15/25] Deprecate 32 bit big-endian MIPS
Date: Fri, 26 Aug 2022 18:21:18 +0100
Message-Id: <20220826172128.353798-16-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220826172128.353798-1-alex.bennee@linaro.org>
References: <20220826172128.353798-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32c.google.com
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

It's becoming harder to maintain a cross-compiler to test this host
architecture as the old stable Debian 10 ("Buster") moved into LTS
which supports fewer architectures. For now:

  - mark it's deprecation in the docs
  - downgrade the containers to build TCG tests only
  - drop the cross builds from our CI

Users with an appropriate toolchain and user-space can still take
their chances building it.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 docs/about/build-platforms.rst                |  2 +-
 docs/about/deprecated.rst                     | 13 ++++++
 .gitlab-ci.d/container-cross.yml              |  1 -
 .gitlab-ci.d/crossbuilds.yml                  | 14 -------
 tests/docker/Makefile.include                 |  5 +--
 .../dockerfiles/debian-mips-cross.docker      | 40 +++++--------------
 6 files changed, 27 insertions(+), 48 deletions(-)

diff --git a/docs/about/build-platforms.rst b/docs/about/build-platforms.rst
index 26028756d0..1ca9144a7d 100644
--- a/docs/about/build-platforms.rst
+++ b/docs/about/build-platforms.rst
@@ -41,7 +41,7 @@ Those hosts are officially supported, with various accelerators:
      - Accelerators
    * - Arm
      - kvm (64 bit only), tcg, xen
-   * - MIPS
+   * - MIPS (LE only)
      - kvm, tcg
    * - PPC
      - kvm, tcg
diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
index 91b03115ee..22c2f4f4de 100644
--- a/docs/about/deprecated.rst
+++ b/docs/about/deprecated.rst
@@ -213,6 +213,19 @@ MIPS ``Trap-and-Emul`` KVM support (since 6.0)
 The MIPS ``Trap-and-Emul`` KVM host and guest support has been removed
 from Linux upstream kernel, declare it deprecated.
 
+Host Architectures
+------------------
+
+BE MIPS (since 7.2)
+'''''''''''''''''''
+
+A Debian 10 ("Buster") moved into LTS the big endian 32 bit version of
+MIPS moved out of support making it hard to maintain our
+cross-compilation CI tests of the architecture. As we no longer have
+CI coverage support may bitrot away before the deprecation process
+completes. The little endian variants of MIPS (both 32 and 64 bit) are
+still a supported host architecture.
+
 QEMU API (QAPI) events
 ----------------------
 
diff --git a/.gitlab-ci.d/container-cross.yml b/.gitlab-ci.d/container-cross.yml
index 611c6c0b39..95d57e1c5d 100644
--- a/.gitlab-ci.d/container-cross.yml
+++ b/.gitlab-ci.d/container-cross.yml
@@ -89,7 +89,6 @@ mips64el-debian-cross-container:
 mips-debian-cross-container:
   extends: .container_job_template
   stage: containers
-  needs: ['amd64-debian10-container']
   variables:
     NAME: debian-mips-cross
 
diff --git a/.gitlab-ci.d/crossbuilds.yml b/.gitlab-ci.d/crossbuilds.yml
index 4a5fb6ea2a..c4cd96433d 100644
--- a/.gitlab-ci.d/crossbuilds.yml
+++ b/.gitlab-ci.d/crossbuilds.yml
@@ -70,20 +70,6 @@ cross-i386-tci:
     EXTRA_CONFIGURE_OPTS: --target-list=i386-softmmu,i386-linux-user,aarch64-softmmu,aarch64-linux-user,ppc-softmmu,ppc-linux-user
     MAKE_CHECK_ARGS: check check-tcg
 
-cross-mips-system:
-  extends: .cross_system_build_job
-  needs:
-    job: mips-debian-cross-container
-  variables:
-    IMAGE: debian-mips-cross
-
-cross-mips-user:
-  extends: .cross_user_build_job
-  needs:
-    job: mips-debian-cross-container
-  variables:
-    IMAGE: debian-mips-cross
-
 cross-mipsel-system:
   extends: .cross_system_build_job
   needs:
diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
index c3375f89c5..b1bf56434f 100644
--- a/tests/docker/Makefile.include
+++ b/tests/docker/Makefile.include
@@ -81,14 +81,12 @@ endif
 
 # For non-x86 hosts not all cross-compilers have been packaged
 ifneq ($(HOST_ARCH),x86_64)
-DOCKER_PARTIAL_IMAGES += debian-mips-cross debian-mipsel-cross debian-mips64el-cross
+DOCKER_PARTIAL_IMAGES += debian-mipsel-cross debian-mips64el-cross
 DOCKER_PARTIAL_IMAGES += debian-ppc64el-cross
 DOCKER_PARTIAL_IMAGES += debian-s390x-cross
 DOCKER_PARTIAL_IMAGES += fedora
 endif
 
-docker-image-debian-mips-cross: docker-image-debian10
-
 # The native build should never use the registry
 docker-image-debian-native: DOCKER_REGISTRY=
 
@@ -144,6 +142,7 @@ DOCKER_PARTIAL_IMAGES += debian-hppa-cross
 DOCKER_PARTIAL_IMAGES += debian-loongarch-cross
 DOCKER_PARTIAL_IMAGES += debian-m68k-cross debian-mips64-cross
 DOCKER_PARTIAL_IMAGES += debian-microblaze-cross
+DOCKER_PARTIAL_IMAGES += debian-mips-cross
 DOCKER_PARTIAL_IMAGES += debian-nios2-cross
 DOCKER_PARTIAL_IMAGES += debian-riscv64-test-cross
 DOCKER_PARTIAL_IMAGES += debian-sh4-cross debian-sparc64-cross
diff --git a/tests/docker/dockerfiles/debian-mips-cross.docker b/tests/docker/dockerfiles/debian-mips-cross.docker
index 26c154014d..75943619df 100644
--- a/tests/docker/dockerfiles/debian-mips-cross.docker
+++ b/tests/docker/dockerfiles/debian-mips-cross.docker
@@ -1,32 +1,14 @@
 #
-# Docker mips cross-compiler target
+# Docker cross-compiler target
 #
-# This docker target builds on the debian Buster base image.
+# This docker target builds on the Debian Bullseye base image.
 #
-FROM qemu/debian10
-
-MAINTAINER Philippe Mathieu-Daudé <f4bug@amsat.org>
-
-# Add the foreign architecture we want and install dependencies
-RUN dpkg --add-architecture mips
-RUN apt update && \
-    DEBIAN_FRONTEND=noninteractive eatmydata \
-    apt install -y --no-install-recommends \
-        gcc-mips-linux-gnu
-
-RUN apt update && \
-    DEBIAN_FRONTEND=noninteractive eatmydata \
-    apt build-dep -yy -a mips --arch-only qemu
-
-# Specify the cross prefix for this image (see tests/docker/common.rc)
-ENV QEMU_CONFIGURE_OPTS --cross-prefix=mips-linux-gnu-
-ENV DEF_TARGET_LIST mips-softmmu,mipsel-linux-user
-
-# Install extra libraries to increase code coverage
-RUN apt update && \
-    DEBIAN_FRONTEND=noninteractive eatmydata \
-    apt install -y --no-install-recommends \
-        libbz2-dev:mips \
-        liblzo2-dev:mips \
-        librdmacm-dev:mips \
-        libsnappy-dev:mips
+FROM docker.io/library/debian:11-slim
+
+RUN export DEBIAN_FRONTEND=noninteractive && \
+    apt-get update && \
+    apt-get install -y eatmydata && \
+    eatmydata apt-get dist-upgrade -y && \
+    eatmydata apt-get install --no-install-recommends -y \
+            gcc-mips-linux-gnu \
+            libc6-dev-mips-cross
-- 
2.30.2


