Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 721585A2DA1
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 19:39:27 +0200 (CEST)
Received: from localhost ([::1]:53116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRdIi-0006LB-Ps
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 13:39:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oRd9v-0005e7-Oi
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 13:30:19 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:36679)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oRd9t-0003f2-D1
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 13:30:19 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 v7-20020a1cac07000000b003a6062a4f81so4772620wme.1
 for <qemu-devel@nongnu.org>; Fri, 26 Aug 2022 10:30:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=VKq4HdjnbagPKU83hkUmlke9fywEnShvMG1y8ode+Zw=;
 b=AamiD3sZvzdafT+LBbhKeyA3F5Sr5UPrnTjirYfDz8eWBWCAKP9blmyIqOXyCNuHAV
 tkVOrR/zTvrBbDRgSl5qs3AF7t5AotEXuU6GWNcULiE67fc0AsjdRFurBAC6ZPdeCK14
 0KzHDl5sFzS4SQY77dH5s2abdCRtbhbgDkRYdxgaBA8e+AgdqAU1WlIJ0yrLysyq0QUA
 geV8qzh/8VnLTpTCnxPniIg/J0d7UdGz9jlx8F0oIgYuMgDxTT0jos/JrhZfyRwHdhgX
 PeTBoHEnUg0BPA42lvvhPB0WJgtIInbgr2e4iOYkzvXkCSL6rO1UCvCan9AmfYjIGLiw
 ePaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=VKq4HdjnbagPKU83hkUmlke9fywEnShvMG1y8ode+Zw=;
 b=zaGvhEQKur16kB+sH7+aJPXGDUXGWiK++kEjmbGBOndQKoo1CFuW8RglmcdUzaKjag
 ekcQiBlN+WyiRLw8QvbEGXYQak4GC6D5cDF1z6E4piXIpgF30KaSoBlnPr6ud2ilwteW
 z5w81oPSfjyWAt7WXyJ3uTc+3MUlALRLKMCFm4qjFmN8fByXD+07XOtjDMHx4P20c+qq
 DW0tzSHXXL1VTwbhc4PxzQ6XWwjQsjXPXiJ6xGEdxwXIqYEHkRVWc60mCnr9RHMIRia4
 3wzI+B0TT6EQSaYA24YYPbSnydoq5az4FQsOVd44liXErw2SR64sHzEgrsh+raI8iHVa
 daAw==
X-Gm-Message-State: ACgBeo2RYGtzE0z4ILoSWakMm7jeKHx8QPtPLcQ3HLvssyI9SLFDcTnt
 1att2Oi5LiTebDNeJdDzJSf1Tw==
X-Google-Smtp-Source: AA6agR7Z4sKmEgAgD5C9fSwIriwNbQor3AdCj3lePCRkSlBXCmWzH1PDYL6LB3U/85nyix3ryKCrEQ==
X-Received: by 2002:a05:600c:198e:b0:3a5:d4a2:8896 with SMTP id
 t14-20020a05600c198e00b003a5d4a28896mr391249wmq.140.1661535014654; 
 Fri, 26 Aug 2022 10:30:14 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 w5-20020a5d6805000000b0021e8d205705sm267333wru.51.2022.08.26.10.30.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Aug 2022 10:30:14 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 407931FFB8;
 Fri, 26 Aug 2022 18:21:30 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PATCH v1 17/25] tests/docker: update and flatten
 debian-all-test-cross
Date: Fri, 26 Aug 2022 18:21:20 +0100
Message-Id: <20220826172128.353798-18-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220826172128.353798-1-alex.bennee@linaro.org>
References: <20220826172128.353798-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x329.google.com
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

Update to the latest stable Debian. While we are at it flatten into a
single dockerfile. We also need to ensure we install clang as it is
used for those builds as well.

It would be nice to port this to lcitool but for now this will do.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 .gitlab-ci.d/container-cross.yml               |  1 -
 tests/docker/Makefile.include                  |  1 -
 .../dockerfiles/debian-all-test-cross.docker   | 18 ++++++++++++++----
 3 files changed, 14 insertions(+), 6 deletions(-)

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
index dedcea58b4..508a914c22 100644
--- a/tests/docker/dockerfiles/debian-all-test-cross.docker
+++ b/tests/docker/dockerfiles/debian-all-test-cross.docker
@@ -6,11 +6,21 @@
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
+    apt install -y --no-install-recommends \
+      ccache \
+      clang  \
+      git \
+      ninja-build \
+    && \
     apt build-dep -yy qemu
 
 # Add the foreign architecture we want and install dependencies
-- 
2.30.2


