Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BF885B8CC9
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Sep 2022 18:22:47 +0200 (CEST)
Received: from localhost ([::1]:51022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYV9y-0000g4-FK
	for lists+qemu-devel@lfdr.de; Wed, 14 Sep 2022 12:22:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oYUnw-0006Xb-Aj
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 12:00:00 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:40938)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oYUnu-0002nc-Jc
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 12:00:00 -0400
Received: by mail-wr1-x429.google.com with SMTP id e16so26442494wrx.7
 for <qemu-devel@nongnu.org>; Wed, 14 Sep 2022 08:59:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=MGW8Qx1J0PF0RJwo76xRbma2CeONhBpz+sH8ADGaVWQ=;
 b=T/mxWEfU+k0ggsEs9j+Qff0UnLhnysiQ/tNPwr4KYXWA+0YJfRDidXhrx8og9hqIFc
 zu951AjFZNanT99iiciTbUdqTjBzIwJrIYGpv19p4p3djPxvNPLdaknAlq4hiMw/PKYe
 tvO3TU/wIjfKwIPettTjSdethmsoldlJUfdY4e8A5sfYHBBTxJBAiOpPXUb4cUobWTU6
 xad23hS3u6YQxjakH7rhH/wLtGgXJ6DvZG3CQhLf4sEcDqobODF2jIffDeJOmbSusrLs
 NnDXpTEVjG4SmDDnu7VqUoE/3tmeuijeXHMRvaO6wu4roCy+Z/wVxvEYEtuJTtdcoxdY
 J0Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=MGW8Qx1J0PF0RJwo76xRbma2CeONhBpz+sH8ADGaVWQ=;
 b=3/AhuDeN4llOGkLndPyI21I8R/HVTggpHgXScXTTsj/hxbH470GhdbbM/zOOfh6dGj
 jBTl8mTqbWjucdQhAU1dhWk+OI6DXd45YW51f9fwRR5htaJ77wH4KswX/o+hVXBj2fxR
 WRfXhsl7qWNhHnu1wHKkM037bISBFbMiOSfv1Qk0WjrUCcLCNfF5oD1596ki0nGUQnsV
 QuB2Anx3ICqMu+PZ5fzA/AKopynLSepGs0aRtayTpnyETjYVm/uV/VpPmup6YyZMBv4r
 0cF1f93GWeaNxRpr2JEw/ZwqtF6wITMunaBhvlwL5K2pN8fa/iWriIs1eHauhFx03qEK
 enkg==
X-Gm-Message-State: ACgBeo1WJzNmj944qt1Y3L1b27TqKEYka5D49FDeSZQZwWEch2nU8JuQ
 rc8QiZS8YofQhbtocMIhJd7sZA==
X-Google-Smtp-Source: AA6agR5OiGcn7BYXY8crtBi+glmKiAG7ztX/z7V3PRFBGsQPehut85rKpSpqwZUphL6BhehC4RFf5Q==
X-Received: by 2002:adf:fa82:0:b0:228:6122:9903 with SMTP id
 h2-20020adffa82000000b0022861229903mr21846137wrr.144.1663171197247; 
 Wed, 14 Sep 2022 08:59:57 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 id11-20020a05600ca18b00b003b332a7b898sm17207403wmb.45.2022.09.14.08.59.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Sep 2022 08:59:54 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 644B81FFC4;
 Wed, 14 Sep 2022 16:59:51 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PATCH  v2 12/30] tests/docker: update and flatten debian-sh4-cross
Date: Wed, 14 Sep 2022 16:59:32 +0100
Message-Id: <20220914155950.804707-13-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220914155950.804707-1-alex.bennee@linaro.org>
References: <20220914155950.804707-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x429.google.com
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
single dockerfile. We really don't need the rest of the stuff from
the QEMU base image just to compile test images.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20220826172128.353798-8-alex.bennee@linaro.org>
---
 .gitlab-ci.d/container-cross.yml                 |  1 -
 tests/docker/Makefile.include                    |  1 -
 tests/docker/dockerfiles/debian-sh4-cross.docker | 12 +++++++-----
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/.gitlab-ci.d/container-cross.yml b/.gitlab-ci.d/container-cross.yml
index a3bfa483bf..8a611fc824 100644
--- a/.gitlab-ci.d/container-cross.yml
+++ b/.gitlab-ci.d/container-cross.yml
@@ -137,7 +137,6 @@ s390x-debian-cross-container:
 sh4-debian-cross-container:
   extends: .container_job_template
   stage: containers
-  needs: ['amd64-debian10-container']
   variables:
     NAME: debian-sh4-cross
 
diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
index 6c2ee3b175..37c4ea913f 100644
--- a/tests/docker/Makefile.include
+++ b/tests/docker/Makefile.include
@@ -89,7 +89,6 @@ DOCKER_PARTIAL_IMAGES += fedora
 endif
 
 docker-image-debian-mips-cross: docker-image-debian10
-docker-image-debian-sh4-cross: docker-image-debian10
 docker-image-debian-sparc64-cross: docker-image-debian10
 
 # The native build should never use the registry
diff --git a/tests/docker/dockerfiles/debian-sh4-cross.docker b/tests/docker/dockerfiles/debian-sh4-cross.docker
index fd3af89575..d48ed9065f 100644
--- a/tests/docker/dockerfiles/debian-sh4-cross.docker
+++ b/tests/docker/dockerfiles/debian-sh4-cross.docker
@@ -1,12 +1,14 @@
 #
 # Docker cross-compiler target
 #
-# This docker target builds on the debian Buster base image.
+# This docker target builds on the Debian Bullseye base image.
 #
-FROM qemu/debian10
+FROM docker.io/library/debian:11-slim
 
-RUN apt update && \
-    DEBIAN_FRONTEND=noninteractive eatmydata \
-    apt install -y --no-install-recommends \
+RUN export DEBIAN_FRONTEND=noninteractive && \
+    apt-get update && \
+    apt-get install -y eatmydata && \
+    eatmydata apt-get dist-upgrade -y && \
+    eatmydata apt-get install --no-install-recommends -y \
         gcc-sh4-linux-gnu \
         libc6-dev-sh4-cross
-- 
2.34.1


