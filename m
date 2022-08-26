Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7F9D5A2D7D
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 19:29:19 +0200 (CEST)
Received: from localhost ([::1]:54590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRd8x-00039w-0L
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 13:29:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oRd1X-0004Gp-3R
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 13:21:40 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:40787)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oRd1V-0002Jw-CJ
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 13:21:38 -0400
Received: by mail-wr1-x42e.google.com with SMTP id h5so2551630wru.7
 for <qemu-devel@nongnu.org>; Fri, 26 Aug 2022 10:21:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=n4blPdwRihEe7dtoUa8W4JMnb8ExjDqzsFVtA0+evNE=;
 b=Xb8vVPyzmuAYHXEhdNiKy7TedQDZZ7imzLOOGDghvkHbsnkMENOkRBhnBwgrLoj5JX
 R08PN2IaZrcn5CewcvXZH3V674GwAsT9z5zz0OGrvoHZOweRwu7Jx1J0YLyUnt7opOBO
 5c1ChY+j9lCvqVyf1qXmT+z3WHjj304xJPsJO6Z7l83+NfT84gYiVcQyRlqfSnvNnvul
 m7X5h5XV2oTW/NjhxGMr2qHUt7S4jGKKi5ubaipPEwN78Oh2dwT56gCzpzOz4+VmDSTE
 IJWSCoaRYERkWCA60fmW/BY798VBHe8BjzGjLjdxHNsdz/F1phcJkqfFgudXHlYWgE6x
 KEKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=n4blPdwRihEe7dtoUa8W4JMnb8ExjDqzsFVtA0+evNE=;
 b=PYH46GvW/fAa+rj6nsauqSjtQEMWHjvpCypVEMfA4KizjkTKKwEcrDlNLKNwK1VIIH
 rIt4RrVESOmFTPCCAq4UM1ZIX7nL1vXLLKGX3dr762wdzRa05OumNdZURPd61ayTMOmW
 5duIrSROaTUjh+phR2u9dRyqHMEtFVK9SBz1BysuEI/hmYEel7+5C2MD1aLrKVjRj3bl
 pMucrO5x5oMIcYcJyn8Egi8QssDuu5Gg0WDpvzwQhVvyNBKPf2snOge5TEGWeuKYzahy
 sUyfAx0hNzA6X0OyRprW0KcCGR70tFefmbNMsYmYl0DN9KkS1BnOMz+JPRF68i4NUmTF
 7Xnw==
X-Gm-Message-State: ACgBeo1ezWyryqiDHElrYs/7zsUHZQ4w9VbHEFCAMtP624XdBjeZ4rBa
 N7d0zXT1L4x03TkgWsD1+Z4TYg==
X-Google-Smtp-Source: AA6agR5QplzUl0Gk3g57U2dH5a2YqI/U/G7tpLbaPnH0U1/0Xzlp6SWg20xZwUWEzHdAKJrRjYbRuA==
X-Received: by 2002:adf:e5cc:0:b0:225:4d26:ddad with SMTP id
 a12-20020adfe5cc000000b002254d26ddadmr369932wrn.426.1661534496701; 
 Fri, 26 Aug 2022 10:21:36 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 q128-20020a1c4386000000b003a35ec4bf4fsm241380wma.20.2022.08.26.10.21.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Aug 2022 10:21:33 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 6B2871FFC0;
 Fri, 26 Aug 2022 18:21:29 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PATCH v1 08/25] tests/docker: update and flatten debian-sparc64-cross
Date: Fri, 26 Aug 2022 18:21:11 +0100
Message-Id: <20220826172128.353798-9-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220826172128.353798-1-alex.bennee@linaro.org>
References: <20220826172128.353798-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42e.google.com
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
---
 .gitlab-ci.d/container-cross.yml                     |  1 -
 tests/docker/Makefile.include                        |  1 -
 tests/docker/dockerfiles/debian-sparc64-cross.docker | 12 +++++++-----
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/.gitlab-ci.d/container-cross.yml b/.gitlab-ci.d/container-cross.yml
index 8a611fc824..db0ea15d0d 100644
--- a/.gitlab-ci.d/container-cross.yml
+++ b/.gitlab-ci.d/container-cross.yml
@@ -143,7 +143,6 @@ sh4-debian-cross-container:
 sparc64-debian-cross-container:
   extends: .container_job_template
   stage: containers
-  needs: ['amd64-debian10-container']
   variables:
     NAME: debian-sparc64-cross
 
diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
index 37c4ea913f..8828b6b8fa 100644
--- a/tests/docker/Makefile.include
+++ b/tests/docker/Makefile.include
@@ -89,7 +89,6 @@ DOCKER_PARTIAL_IMAGES += fedora
 endif
 
 docker-image-debian-mips-cross: docker-image-debian10
-docker-image-debian-sparc64-cross: docker-image-debian10
 
 # The native build should never use the registry
 docker-image-debian-native: DOCKER_REGISTRY=
diff --git a/tests/docker/dockerfiles/debian-sparc64-cross.docker b/tests/docker/dockerfiles/debian-sparc64-cross.docker
index f4bb9b561c..8d3d306bc1 100644
--- a/tests/docker/dockerfiles/debian-sparc64-cross.docker
+++ b/tests/docker/dockerfiles/debian-sparc64-cross.docker
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
         gcc-sparc64-linux-gnu \
         libc6-dev-sparc64-cross
-- 
2.30.2


