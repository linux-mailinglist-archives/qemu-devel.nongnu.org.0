Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4047A5B8CFC
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Sep 2022 18:28:43 +0200 (CEST)
Received: from localhost ([::1]:40448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYVFi-0006QD-CB
	for lists+qemu-devel@lfdr.de; Wed, 14 Sep 2022 12:28:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oYUny-0006cI-Sf
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 12:00:02 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:45957)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oYUnx-0002or-0D
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 12:00:02 -0400
Received: by mail-wr1-x432.google.com with SMTP id bj14so26394903wrb.12
 for <qemu-devel@nongnu.org>; Wed, 14 Sep 2022 09:00:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=b37tM16YW2hM4J2q/2/cHZ/O4ghItjIzNOwocMzl0HY=;
 b=Zi+DQhoSm/INAb+dWyd9jb6OshLkQ7zt3ksZPsRE+15i5y5gTza5H1jOBc7LpWVTFS
 7EOEzKBmcFyutxLtiUHRXmyP3evhlRpfwDs8tbVbs1SLBFOVtO64mQIEf/eUi15BFzOr
 59Q1VItBwgvXeB7eRJ2sMPfxlR2Ye/4fytD/vp22eym9FZvctY6rQ+NU24guN2w4CwMZ
 afgJFg4Ve3zvhPg2S9cwfTAqs+w8A2LHHV3o8KwCLmbIOMq7qej4v1HSdH7Zc/Yr+QyV
 K9k6/R+JANqz+ryjB8vxBvcKnECVHtViLlBmVbgwBW5JIeAJ4vTbtoPd4fZD5vDtRqHp
 Czvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=b37tM16YW2hM4J2q/2/cHZ/O4ghItjIzNOwocMzl0HY=;
 b=FbetOC/ms4BHl9dXt5XQmLLKux7OrOVq/yCS5V8j8u7rCzvfr/EfrnD9KkCkPrmpQx
 ojW/D23ZT0HcYCuUSS1kmL5YTqez46WrZPDBZLk8PAobrUvblhEWxMRBQn7a+kTw8BTe
 Jz6QqmedJSRdCRsyHQ2AmWjFpOuYM+yueFFwtgujsyMURt4Z8o9ErR+KyyVkB5RUcue/
 bDfLRz47ksNPPQRSSWq9033mckhTLLqeav+1CAdX269cvtku+JfTSej7jocjZrR3dPBe
 Q1zQVoPxuPztsnmlLYngcF0EvcgosPBOVUhPfaOyFRVI5g0uydujTaVKFi47sdkLsMX6
 JMfA==
X-Gm-Message-State: ACgBeo0jklDChBKhFyf6A+wH277VoZYTvpdJHnc9J7HQpBCkPBU0jOot
 o187j3iE0gjpLjrREIvhtfHlkA==
X-Google-Smtp-Source: AA6agR6wblAMBg+noLYndemPMFVJMmBp0T/R2+7l/FceicAAobgNWIPVQSNBQMKQt91TTAY25Gk93A==
X-Received: by 2002:a05:6000:1d8b:b0:22a:c046:946d with SMTP id
 bk11-20020a0560001d8b00b0022ac046946dmr5398549wrb.249.1663171199647; 
 Wed, 14 Sep 2022 08:59:59 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 f10-20020a05600c4e8a00b003b31fc77407sm20128857wmq.30.2022.09.14.08.59.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Sep 2022 08:59:57 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 7EBC11FFC5;
 Wed, 14 Sep 2022 16:59:51 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PATCH v2 13/30] tests/docker: update and flatten debian-sparc64-cross
Date: Wed, 14 Sep 2022 16:59:33 +0100
Message-Id: <20220914155950.804707-14-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220914155950.804707-1-alex.bennee@linaro.org>
References: <20220914155950.804707-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x432.google.com
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
Message-Id: <20220826172128.353798-9-alex.bennee@linaro.org>
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
2.34.1


