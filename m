Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADF515B8DE4
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Sep 2022 19:10:47 +0200 (CEST)
Received: from localhost ([::1]:60472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYVuP-0005VS-F0
	for lists+qemu-devel@lfdr.de; Wed, 14 Sep 2022 13:10:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oYUuF-0001e8-Fq
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 12:06:31 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:55125)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oYUu0-0003rb-8u
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 12:06:31 -0400
Received: by mail-wm1-x32f.google.com with SMTP id az6so11958912wmb.4
 for <qemu-devel@nongnu.org>; Wed, 14 Sep 2022 09:06:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=YliCTsRpMw4ev/s9tqMpyIV52FVHUEOsSSKUVnWbVIc=;
 b=sjwCTR7PmJx8+DRWxVBvgcAqG4qLkTz2TrfWfaHptV5znz7L7aolf0EJBIum9OHra/
 k3Y3dFJebVC8nIZkms2QQLIY8LOM7TnIWHeMNfI1IoMGaGH/4pDF2P2ApEbMdnlTePwR
 fsJ4z5kNv//b/G5k/kdJjggvycOY4vuQsb4y9GELOeUGqCLsNDhU8gYQdvVjKKiUuQF8
 vGTW9zs9GHz9e2NmU5uhG/tlyVixWXXzZUwGs6VFtBX61P/LzNyZJsq0i+hRnQbsZQgi
 VXM1YaIShI+AMtsT3Gm/h2rvM4C/IJB3xvClT41gEoEIkm3f5I9COz+6RzgiSg6ZulUu
 TADA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=YliCTsRpMw4ev/s9tqMpyIV52FVHUEOsSSKUVnWbVIc=;
 b=LO4MvJvb3uIw3ie9FbaAGqAQlFJWQrprYP8XhGIC0CsrbxAGH0VWhJe9j5W2wsKv2q
 EkpLGuROBitpO7uSZWZ+thiLgo079wMNF1pSei3TxnlK8j+YjfUPo1kL7NHElrR7bNrT
 jJ2DTfdFCItOkDJ46FbhrPUd3sBBDh3kWF2ClmYCYG21kcY54FhoYVOxn3mHt4vtyAIz
 0VTSDiOO8VsfT3QqUad+XKgvHnYyi8oXoilCmvML4NnP5cZ2XAxjP17ZkXG+VM7K4qDb
 v1uyaYS2ERKYcziHf9JV60XwfJApLcm5WIh45JVKm4KNhjWzFlxfyQGT93cuYg1+y9xV
 galA==
X-Gm-Message-State: ACgBeo1W0t64bYzAtKqX/PhnETG9ySUnsPs5lQTuk3R9g+t/AVzU6cfk
 2uzX4NOsc17Y9JDvUVEWnoNcsw==
X-Google-Smtp-Source: AA6agR7FuzmUdMqp3x/zzA9Kk+uki6GzZbhuk7+Qt35NmwWeG3wB7NwBoxSSuhlnqvs/FMJAl2v0/w==
X-Received: by 2002:a05:600c:294:b0:3b4:794d:fb6a with SMTP id
 20-20020a05600c029400b003b4794dfb6amr3708906wmk.128.1663171574756; 
 Wed, 14 Sep 2022 09:06:14 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 v8-20020a05600c12c800b003a844885f88sm16592326wmd.22.2022.09.14.09.06.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Sep 2022 09:06:12 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 7404F1FFB7;
 Wed, 14 Sep 2022 16:59:52 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PATCH v2 23/30] tests/docker: update and flatten
 debian-all-test-cross
Date: Wed, 14 Sep 2022 16:59:43 +0100
Message-Id: <20220914155950.804707-24-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220914155950.804707-1-alex.bennee@linaro.org>
References: <20220914155950.804707-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Update to the latest stable Debian. While we are at it flatten into a
single dockerfile. We also need to ensure we install clang as it is
used for those builds as well.

It would be nice to port this to lcitool but for now this will do.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20220826172128.353798-18-alex.bennee@linaro.org>

---
v2
  - move ccache/clang/git/ninja-build to main insall stanza
  - minor comment tweaks
---
 .gitlab-ci.d/container-cross.yml               |  1 -
 tests/docker/Makefile.include                  |  1 -
 .../dockerfiles/debian-all-test-cross.docker   | 18 +++++++++++++-----
 3 files changed, 13 insertions(+), 7 deletions(-)

diff --git a/.gitlab-ci.d/container-cross.yml b/.gitlab-ci.d/container-cross.yml
index 3a8bd75473..091c0d8fcb 100644
--- a/.gitlab-ci.d/container-cross.yml
+++ b/.gitlab-ci.d/container-cross.yml
@@ -14,7 +14,6 @@ amd64-debian-cross-container:
 amd64-debian-user-cross-container:
   extends: .container_job_template
   stage: containers
-  needs: ['amd64-debian10-container']
   variables:
     NAME: debian-all-test-cross
 
diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
index 24cd44e667..ddcc502049 100644
--- a/tests/docker/Makefile.include
+++ b/tests/docker/Makefile.include
@@ -129,7 +129,6 @@ docker-image-debian-nios2-cross: $(DOCKER_FILES_DIR)/debian-toolchain.docker \
 	$(call debian-toolchain, $@)
 
 # Specialist build images, sometimes very limited tools
-docker-image-debian-all-test-cross: docker-image-debian10
 docker-image-debian-loongarch-cross: docker-image-debian11
 docker-image-debian-microblaze-cross: docker-image-debian10
 docker-image-debian-nios2-cross: docker-image-debian10
diff --git a/tests/docker/dockerfiles/debian-all-test-cross.docker b/tests/docker/dockerfiles/debian-all-test-cross.docker
index dedcea58b4..2beb077fb4 100644
--- a/tests/docker/dockerfiles/debian-all-test-cross.docker
+++ b/tests/docker/dockerfiles/debian-all-test-cross.docker
@@ -6,16 +6,24 @@
 # basic compilers for as many targets as possible. We shall use this
 # to build and run linux-user tests on GitLab
 #
-FROM qemu/debian10
+FROM docker.io/library/debian:11-slim
 
-# What we need to build QEMU itself
-RUN apt update && \
-    DEBIAN_FRONTEND=noninteractive eatmydata \
+# Duplicate deb line as deb-src
+RUN cat /etc/apt/sources.list | sed "s/^deb\ /deb-src /" >> /etc/apt/sources.list
+
+RUN export DEBIAN_FRONTEND=noninteractive && \
+    apt-get update && \
+    apt-get install -y eatmydata && \
+    eatmydata apt-get dist-upgrade -y && \
     apt build-dep -yy qemu
 
-# Add the foreign architecture we want and install dependencies
+# Add extra build tools and as many cross compilers as we can for testing
 RUN DEBIAN_FRONTEND=noninteractive eatmydata \
         apt install -y --no-install-recommends \
+        ccache \
+        clang  \
+        git \
+        ninja-build \
         gcc-aarch64-linux-gnu \
         libc6-dev-arm64-cross \
         gcc-alpha-linux-gnu \
-- 
2.34.1


