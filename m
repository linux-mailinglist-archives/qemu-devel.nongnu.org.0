Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B756F5A2DA0
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 19:39:15 +0200 (CEST)
Received: from localhost ([::1]:53114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRdIY-0006GV-Ge
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 13:39:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oRd1a-0004Iq-HA
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 13:21:42 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:42951)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oRd1Y-0002Lh-Ew
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 13:21:42 -0400
Received: by mail-wr1-x432.google.com with SMTP id m16so2545101wru.9
 for <qemu-devel@nongnu.org>; Fri, 26 Aug 2022 10:21:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=fYgRCdRIiVNTnbdRi8F/piAWM2mBMcNmROHYK2H+FtA=;
 b=KLXpPJNPXgwVShqPqSUIKvEqxRQomykc2HVMNCGw5VV9LDb9Q0O1Oxu3tmfnwTCTsb
 MxVJDcmR0Url/9A2cO7siW1ayEHEjHly6EG/GbooNU01CYPZnaRRsvjThUUh6c5lgT2Y
 qbbQ67xYvhT2nVkWGe+PkpflbK8Goc4VOvzmk35QoAuhOoyhTwh9oowRz5VKUxnQLYE2
 M0dmM1jhWviS79+tHxAX74ctOkRh1K/0PU4Y+gwPW+c+oqiRhDS98RSGLlWRcV3IEduW
 RVoZtKxHIWq+Miak6R8XlWFDeFWMBT/QtOorbdYRuOHZ0DODw8iIoq6uINi06QqMzmnl
 eNyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=fYgRCdRIiVNTnbdRi8F/piAWM2mBMcNmROHYK2H+FtA=;
 b=cXaxPNcZyRhROBSpoFbpTZzjHQn67vOwG9D9NOqHwQoYeveryajoDsGKGSmDxWvSMf
 mEB0BQ9DgYo0w2bGkSxdxviYe7aRjrShwQ+m0taondqofXTTXFJDGX73rX+2WEyHx4uT
 N50HyYVm9S3wqGsJh/2p7L8AMJNIpowkHWyOeHMY+4oD4NKoVS9lBqaJdUEdznspnPrT
 ck1VCULiRr98x2diEhFQaXyRx8V6lZ3FclLiPwIAXfGI3uUe73fCisYCarG6guxDHM1v
 3uS5ZXR0JIFYqvEc8/WpbX49pupfkeOTVkZfFDOofITN+ZPtxmOhV+THZVOxbb+Wmc9B
 tWJA==
X-Gm-Message-State: ACgBeo2TrIcapKFftojMsav58HzSawqTX9d/DVRVNEgKTmW/zq5/ygRf
 1njxL2RIpksGDxqY+kKmTp6ECQ==
X-Google-Smtp-Source: AA6agR4X2zUaW7PqW3SMnMBT3gX56cBpML6vJMcKK6TuD2OeUcA5HQMxozKqQAsZdQa3p+Rv87VCzg==
X-Received: by 2002:a05:6000:1149:b0:225:29d4:67eb with SMTP id
 d9-20020a056000114900b0022529d467ebmr393495wrx.254.1661534498862; 
 Fri, 26 Aug 2022 10:21:38 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 t8-20020adfdc08000000b002258413c310sm237161wri.88.2022.08.26.10.21.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Aug 2022 10:21:34 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 7B9BA1FFC1;
 Fri, 26 Aug 2022 18:21:29 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PATCH  v1 09/25] tests/docker: flatten debian-powerpc-test-cross
Date: Fri, 26 Aug 2022 18:21:12 +0100
Message-Id: <20220826172128.353798-10-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220826172128.353798-1-alex.bennee@linaro.org>
References: <20220826172128.353798-1-alex.bennee@linaro.org>
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

Flatten into a single dockerfile. We really don't need the rest of the
stuff from the QEMU base image just to compile test images.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 .gitlab-ci.d/container-cross.yml                     |  1 -
 tests/docker/Makefile.include                        |  1 -
 .../dockerfiles/debian-powerpc-test-cross.docker     | 12 +++++++-----
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/.gitlab-ci.d/container-cross.yml b/.gitlab-ci.d/container-cross.yml
index db0ea15d0d..67bbf19a27 100644
--- a/.gitlab-ci.d/container-cross.yml
+++ b/.gitlab-ci.d/container-cross.yml
@@ -102,7 +102,6 @@ mipsel-debian-cross-container:
 powerpc-test-cross-container:
   extends: .container_job_template
   stage: containers
-  needs: ['amd64-debian11-container']
   variables:
     NAME: debian-powerpc-test-cross
 
diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
index 8828b6b8fa..e034eca3af 100644
--- a/tests/docker/Makefile.include
+++ b/tests/docker/Makefile.include
@@ -137,7 +137,6 @@ docker-image-debian-all-test-cross: docker-image-debian10
 docker-image-debian-loongarch-cross: docker-image-debian11
 docker-image-debian-microblaze-cross: docker-image-debian10
 docker-image-debian-nios2-cross: docker-image-debian10
-docker-image-debian-powerpc-test-cross: docker-image-debian11
 docker-image-debian-riscv64-test-cross: docker-image-debian11
 
 # These images may be good enough for building tests but not for test builds
diff --git a/tests/docker/dockerfiles/debian-powerpc-test-cross.docker b/tests/docker/dockerfiles/debian-powerpc-test-cross.docker
index 36b336f709..d6b2909cc4 100644
--- a/tests/docker/dockerfiles/debian-powerpc-test-cross.docker
+++ b/tests/docker/dockerfiles/debian-powerpc-test-cross.docker
@@ -1,13 +1,15 @@
 #
 # Docker powerpc/ppc64/ppc64le cross-compiler target
 #
-# This docker target builds on the debian Bullseye base image.
+# This docker target builds on the Debian Bullseye base image.
 #
-FROM qemu/debian11
+FROM docker.io/library/debian:11-slim
 
-RUN apt update && \
-    DEBIAN_FRONTEND=noninteractive eatmydata \
-    apt install -y --no-install-recommends \
+RUN export DEBIAN_FRONTEND=noninteractive && \
+    apt-get update && \
+    apt-get install -y eatmydata && \
+    eatmydata apt-get dist-upgrade -y && \
+    eatmydata apt-get install --no-install-recommends -y \
         gcc-powerpc-linux-gnu \
         libc6-dev-powerpc-cross \
         gcc-10-powerpc64-linux-gnu \
-- 
2.30.2


