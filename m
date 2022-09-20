Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7824B5BEFD2
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 00:11:02 +0200 (CEST)
Received: from localhost ([::1]:36228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oalSH-0001ko-Hs
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 18:11:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oagzd-00063O-Hf
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 13:25:09 -0400
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:34505)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oagza-0001ot-FU
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 13:25:09 -0400
Received: by mail-ej1-x631.google.com with SMTP id y3so7922746ejc.1
 for <qemu-devel@nongnu.org>; Tue, 20 Sep 2022 10:25:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=aqXnnX8jlTZ0XZtDvIycK9gnBUppEqoHxatpad3BDw0=;
 b=eJnTGlGd+g2BnmvLBdavrJ+oTvsdJyfOu2aze5QO1ENmvL/B19YGgQQ8e+NPXVN2en
 DIFd4BSwEpbd5n5Q1fIFfgbjcDmZN4m5+49kfRZJ62jE/Ykww0i6JwQy2YpwrLaV17H9
 a5BbSc8Q26w4CDNKCuayAF9w2NB3CZHu0iA06A2PrkO/QDsQLeLpYm8l2K8IW63cds/Q
 81grgUS0/+X2CIGSib2GjPUteJ+5hKKiq96Tb3Nv2Iu1qRvXIBfBxSdniVdW3wszie5q
 4sEL9GdO8TfBxEDi9THwFUgSaZuibJwBfA3iyG3VtSGdeIlVDbUxAQljl9IwiLvjTbZC
 K1PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=aqXnnX8jlTZ0XZtDvIycK9gnBUppEqoHxatpad3BDw0=;
 b=ZAem35JM/J9PwCAEOt0ypsAfmK2dkLBBX8HNdcvnUIS65sJyct0ooIDkhHQziKcHeh
 PQDUg3zHlYCmIF0bYRFRK7ZvYzoCoFPtp9uDwuI2vGsmFGdeC8idM+s4azXwzhSQjGaX
 VB65AhryjLY+PfQE+dxBvS/t5qEpJwhZHOzY0XdkYuttOX0lCoqvNzVS2aGRR46OR31w
 boHSpH24eRd6YHI6qhMuVwzHrr/Pq/rxWZX/bzWhi9bGz4ODFqulaw+8RsgJKfJsFEIV
 7qc6BZx8aIcaSqzPFK2+zITfoJ82KOOtgVf+ezmAReIaUiQ6TquAmzza2jJvP4DU0e5D
 koVQ==
X-Gm-Message-State: ACrzQf0dHjq0j4S08ZE6ZTOtt611W0kuWLNC2TqD3arWp3WsIgbqRMZ3
 rcJyGIYPf2Cd+ZzBWePoFmaumQ==
X-Google-Smtp-Source: AMsMyM7EGOcw/iwABkQjJbhK91g29+DxdnhdBLmQ2hcTV6rlX6K0NhOyIdSeNchaJuqYuY9tFd+QSQ==
X-Received: by 2002:a17:907:7f18:b0:780:7a0a:110c with SMTP id
 qf24-20020a1709077f1800b007807a0a110cmr17753295ejc.446.1663694705730; 
 Tue, 20 Sep 2022 10:25:05 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 w8-20020a1709067c8800b007815ca7ae57sm120985ejo.212.2022.09.20.10.24.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Sep 2022 10:24:59 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E59781FFCC;
 Tue, 20 Sep 2022 18:15:35 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>,
 libvir-list@redhat.com (reviewer:Incompatible changes),
 Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PULL 21/30] Deprecate 32 bit big-endian MIPS
Date: Tue, 20 Sep 2022 18:15:24 +0100
Message-Id: <20220920171533.1098094-22-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220920171533.1098094-1-alex.bennee@linaro.org>
References: <20220920171533.1098094-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220914155950.804707-22-alex.bennee@linaro.org>

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


