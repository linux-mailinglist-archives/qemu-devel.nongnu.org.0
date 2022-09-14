Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CE0D5B8D38
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Sep 2022 18:38:47 +0200 (CEST)
Received: from localhost ([::1]:41328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYVPS-0007QD-La
	for lists+qemu-devel@lfdr.de; Wed, 14 Sep 2022 12:38:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oYUu1-0001RP-Er
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 12:06:17 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:41949)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oYUty-0003qs-8x
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 12:06:16 -0400
Received: by mail-ej1-x636.google.com with SMTP id gh9so35860317ejc.8
 for <qemu-devel@nongnu.org>; Wed, 14 Sep 2022 09:06:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=yAaFojbQkLuJrmRuutKbjfhF8VqtzVDMFoLs4p+0R1k=;
 b=pp1Wbqo/wVC0N96asZpYIdvNR+XUZvzvh35mgXDdj9vZq6dUK/0nDtvacy5ooB5xdT
 JoO4vaiBuiRF3WgaUv1t+UCUHIBEStnjrb7+Jqm3SS7+QmnEX6AVwGC9mYoIlMMlOiw5
 9JPIFGvjzmuaTPgfmrx1YhBeu42Bi5cDRv7Sb4JJABhcyHFT/O1+wmLmNIcT4zcBYkFf
 cPIHf9/BHASxPAqppknMWt7N9L/BjxUbJu9TkZkVFXCmwg/ZFXiyxzkGHV0cWd1S5w8X
 x5Vz1eP1B/0/peksvfNYEIDf+K0VwL2+496+/+Jne647JR18F7x7K9qPL88IMVP434Uq
 mRVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=yAaFojbQkLuJrmRuutKbjfhF8VqtzVDMFoLs4p+0R1k=;
 b=lm48Fn9mh9TIgh9na5hfLuZ1ua+csy52mvKajEeHcU3bFCEAOuN1sp73DAgz3tuOjc
 l14Q/GUYZ/kM8+aEO09KbY03H/LynSmW/WYo+SjjQb0pr6jb+7mNwPfJ1Fk/4Wp3V6E6
 oI3ActFQxxLJbI4mdkRdixKHI/RJ8jZs6mlA0QCRoOA0x9helPMWDIZTQulCVSsX646R
 snYtf8IRyNYyugr1wvyIXNqWGDcaf5AOKcNx5YB9vbIlUNCiJ5w6H/LWMpZpbYlpQTkE
 BXXF2z8xv3xx+kawi0s4y91J8Ugx+9PvZH+qRpzIgUYG0BkWqPedaoOsDeTa7oDDocUp
 hYxg==
X-Gm-Message-State: ACgBeo1UbDstrIPnFSQDHMiE2HJdiqhvlScvDQcd4x3NB6qV4OO5yXEH
 u5jF3I29vnp1Xkp+UQfLX1oAuA==
X-Google-Smtp-Source: AA6agR7skEdWnwOHfyOkT3SEIG4StYt441HBYaPjY0Yp2ncXZh8vm0UOw6nuSCvTnL2sYE+uqaLVFw==
X-Received: by 2002:a17:907:983:b0:77b:6e40:8435 with SMTP id
 bf3-20020a170907098300b0077b6e408435mr13766391ejc.570.1663171571835; 
 Wed, 14 Sep 2022 09:06:11 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 j10-20020a17090623ea00b007789e7b47besm7752771ejg.25.2022.09.14.09.06.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Sep 2022 09:06:09 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 469301FFCD;
 Wed, 14 Sep 2022 16:59:52 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Huacai Chen <chenhuacai@kernel.org>, Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>,
 libvir-list@redhat.com (reviewer:Incompatible changes),
 Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH  v2 21/30] Deprecate 32 bit big-endian MIPS
Date: Wed, 14 Sep 2022 16:59:41 +0100
Message-Id: <20220914155950.804707-22-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220914155950.804707-1-alex.bennee@linaro.org>
References: <20220914155950.804707-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x636.google.com
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
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Huacai Chen <chenhuacai@kernel.org>
Message-Id: <20220826172128.353798-16-alex.bennee@linaro.org>

---
v2
  - explicit little endian instead of LE
  - s/A/As/
  - restore mips to dockerfile
---
 docs/about/build-platforms.rst                |  2 +-
 docs/about/deprecated.rst                     | 13 +++++++
 .gitlab-ci.d/container-cross.yml              |  1 -
 .gitlab-ci.d/crossbuilds.yml                  | 14 -------
 tests/docker/Makefile.include                 |  5 +--
 .../dockerfiles/debian-mips-cross.docker      | 38 +++++--------------
 6 files changed, 26 insertions(+), 47 deletions(-)

diff --git a/docs/about/build-platforms.rst b/docs/about/build-platforms.rst
index a2fee53248..1c1e7b9e11 100644
--- a/docs/about/build-platforms.rst
+++ b/docs/about/build-platforms.rst
@@ -41,7 +41,7 @@ Those hosts are officially supported, with various accelerators:
      - Accelerators
    * - Arm
      - kvm (64 bit only), tcg, xen
-   * - MIPS
+   * - MIPS (little endian only)
      - kvm, tcg
    * - PPC
      - kvm, tcg
diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
index c75a25daad..0d1fd4469b 100644
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
+As Debian 10 ("Buster") moved into LTS the big endian 32 bit version of
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
index 26c154014d..7b55f0f3b2 100644
--- a/tests/docker/dockerfiles/debian-mips-cross.docker
+++ b/tests/docker/dockerfiles/debian-mips-cross.docker
@@ -1,32 +1,14 @@
 #
 # Docker mips cross-compiler target
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
2.34.1


