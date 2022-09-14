Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFB225B8D52
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Sep 2022 18:44:10 +0200 (CEST)
Received: from localhost ([::1]:39746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYVUf-0005CI-Kp
	for lists+qemu-devel@lfdr.de; Wed, 14 Sep 2022 12:44:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oYUu4-0001UU-1h
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 12:06:20 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:44859)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oYUtz-0003rW-Ue
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 12:06:18 -0400
Received: by mail-wr1-x42a.google.com with SMTP id c11so26445906wrp.11
 for <qemu-devel@nongnu.org>; Wed, 14 Sep 2022 09:06:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=BzWKln5PytAzOwwrEI5gVpszKbRJrpWZUaBdq/kcO8c=;
 b=MZctr4eVrNq7SUz7KTP2/QjslavlATnJvXPYekQS48H21gnAbjJJFnHGT9/+mo3GvT
 rLSVu+IxiGKj9liKwKcHAOq63pX+Hekfp/GoZb1DiNLn0qkqH1LmXd9f870ci0sgAKCL
 JrXo4e+bHul9SlCp+u9eozxgyc7cA7EBdnS4J8eFaJzfe3+0/s11dlzrV7O0rA+YTexf
 aSratoqdt5H0voZnoWlAIQPBZQDy+E1dmqm6pKAYy3s3kTeBUKSswL/ajuF0nVvDCfxl
 8F5UfHlgzVseuWdKNVyWAfxAkWM+J9m4ziGmGPixHWXU99oahJyKB8fW91X28O7hl1AM
 FK6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=BzWKln5PytAzOwwrEI5gVpszKbRJrpWZUaBdq/kcO8c=;
 b=QtaFHwhBQMAjq6/DJ+PYCRXyWz8N/LMFJMMIcCQqUKq2aX4T4wiq+SFQhiBlsjcrFc
 fDWpevYVInFxjvHnvg7OQcuk1018XHntySSIKgZAksvZ9rMTXJDuU8B7WdF+pi3x7HDm
 84XyyGNywRo1c2KT3yOJe7Pm0WFx05Xud9khrRSHNunusJK8mjzbqpXoT6fV9guRXx2h
 1aA+ZcSIsIHdAZFYDXIxxwy4z3isdZweblzzZZXZa0ToATdBRf1zbp9ulQirTn9SDR3E
 4ws2kH6NrwIBw7ntdjrxEpowq1EmiOFSyYRVest1LNMQumYv1qwZBnEOIgSXCVwU+88I
 n13g==
X-Gm-Message-State: ACgBeo1k85QvFYSSVe5/Vvy8h9itsP+zUlqMxM6S+3i7HQqBbw2EyZD3
 zczItK9Haoswld3mYmAIFv0KNCgx8UqIcdVf
X-Google-Smtp-Source: AA6agR4CkZYHjBU/8fbKNMf5He0g8t+D4YfNdl22PPy3y6O+Pa4yn3zTaGNCcSiVb5QhbEbpEb9Ppg==
X-Received: by 2002:a5d:48c5:0:b0:225:2f99:430d with SMTP id
 p5-20020a5d48c5000000b002252f99430dmr23876985wrs.358.1663171574483; 
 Wed, 14 Sep 2022 09:06:14 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 b15-20020adfe30f000000b0021e6c52c921sm16874931wrj.54.2022.09.14.09.06.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Sep 2022 09:06:12 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E86521FFD2;
 Wed, 14 Sep 2022 16:59:52 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PATCH  v2 28/30] tests/docker: update and flatten debian-toolchain
Date: Wed, 14 Sep 2022 16:59:48 +0100
Message-Id: <20220914155950.804707-29-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220914155950.804707-1-alex.bennee@linaro.org>
References: <20220914155950.804707-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42a.google.com
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
single dockerfile as we do not need anything from the base image to
build the toolchain. This is used to build both the nios and
microblaze toolchains.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20220826172128.353798-23-alex.bennee@linaro.org>
---
 tests/docker/Makefile.include                    | 4 ----
 tests/docker/dockerfiles/debian-toolchain.docker | 5 +++--
 2 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
index 1d5a6f1fb4..a3174346da 100644
--- a/tests/docker/Makefile.include
+++ b/tests/docker/Makefile.include
@@ -127,10 +127,6 @@ docker-image-debian-nios2-cross: $(DOCKER_FILES_DIR)/debian-toolchain.docker \
     $(DOCKER_FILES_DIR)/debian-nios2-cross.d/build-toolchain.sh
 	$(call debian-toolchain, $@)
 
-# Specialist build images, sometimes very limited tools
-docker-image-debian-microblaze-cross: docker-image-debian10
-docker-image-debian-nios2-cross: docker-image-debian10
-
 # These images may be good enough for building tests but not for test builds
 DOCKER_PARTIAL_IMAGES += debian-alpha-cross
 DOCKER_PARTIAL_IMAGES += debian-powerpc-test-cross
diff --git a/tests/docker/dockerfiles/debian-toolchain.docker b/tests/docker/dockerfiles/debian-toolchain.docker
index 738d808aa6..c723377495 100644
--- a/tests/docker/dockerfiles/debian-toolchain.docker
+++ b/tests/docker/dockerfiles/debian-toolchain.docker
@@ -4,7 +4,7 @@
 # This dockerfile is used for building a cross-compiler toolchain.
 # The script for building the toolchain is supplied via extra-files.
 #
-FROM qemu/debian10
+FROM docker.io/library/debian:bullseye-slim
 
 # Install build utilities for building gcc and glibc.
 # ??? The build-dep isn't working, missing a number of
@@ -15,6 +15,7 @@ RUN apt update && \
     DEBIAN_FRONTEND=noninteractive eatmydata \
     apt install -y --no-install-recommends \
         bison \
+        ca-certificates \
         flex \
         gawk \
         libmpc-dev \
@@ -32,5 +33,5 @@ RUN cd /root && ./build-toolchain.sh
 # Throw away the extra toolchain build deps, the downloaded source,
 # and the build trees by restoring the original debian10 image,
 # then copying the built toolchain from stage 0.
-FROM qemu/debian10
+FROM docker.io/library/debian:bullseye-slim
 COPY --from=0 /usr/local /usr/local
-- 
2.34.1


