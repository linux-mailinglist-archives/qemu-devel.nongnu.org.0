Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0FEB5BEF2D
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Sep 2022 23:32:36 +0200 (CEST)
Received: from localhost ([::1]:54876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oakr5-0008Oh-UH
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 17:32:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oagzd-00062I-2I
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 13:25:09 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:39849)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oagzZ-000208-JN
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 13:25:08 -0400
Received: by mail-ed1-x531.google.com with SMTP id f20so4867470edf.6
 for <qemu-devel@nongnu.org>; Tue, 20 Sep 2022 10:25:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=FCp0ZhdcLPVYE2rXlJfbfkU6sxhsi+xnGbJPXBfntxo=;
 b=vC5HU+ggUYZaLzkjLtyK/sIDCmA67JJdotLk69w2djB8KVhMdGlNGv4Qj8pmTfYd8T
 kJTiby/pEt4bkWkU/ORl/VfHBvSgOSyB5G6032Jq7Hh6h1dPyk9D9gjjIQ63GiRhfsP7
 zrONnNQvVafDzRrBfF8tQOWodTQbQufzqrfYWys+2P5wg4LEnJKiEhR8zfL3xh0PvtAv
 ATpCrxxOsdzCtysVJK4xEg7RZVe99fLMILPC2roRHDgITlNc+MDuV6Iif3I++hz9bRED
 XoUt2t1KraDKK2t87l13ylQhE9InTlZz8pQlw9t0clXpuSV78M+8UbffObpHV13RTHak
 6bYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=FCp0ZhdcLPVYE2rXlJfbfkU6sxhsi+xnGbJPXBfntxo=;
 b=wKL/3Tvd9AlBt4sx+to8T7ilZ6yD2B3IKhLHNO9ZIDwcWxlMgbziSHErvHpN1yATix
 y4VK3ueA85EPaqni0isx8TvOU/PCUeT5rcw8OYDFGfNHzYGQQ9qVeOAnjjKXROPGWXed
 R5sjCA00lk/ylNmuxcxLc9RyAO8g8n6B0kMY8xra+k9zlox5K7QC98BG1Qr8LUan8AGo
 IiA2mif9GtxdLR9/+0OFwGivUQ7C3nFEAJ0cYcsfBET28Fv7b5rRW++i3xuxxQiMcJYl
 aqsUH5QRagkQIxAVoWRKOsvSmzknZFHIXXB0Lwg+PR7rvYuRXMrv/5XDk+YP6dYjipN5
 2C6Q==
X-Gm-Message-State: ACrzQf2hRMJv15wV2To11wD92l7b814Ukbv3T9Tv80sP7Gq3NOBqhHsA
 MObnGCuyHfrPnDGrLZYbkvxl0koEeU/75w==
X-Google-Smtp-Source: AMsMyM4gPWQ/q9A2YJ6osESQleDCwZHbMF9gIPXkKaTIaaVfP/zA5UyaIQhfajV1i5RxRGrxxHv2mQ==
X-Received: by 2002:a05:6402:1cc5:b0:453:ed3f:6a38 with SMTP id
 ds5-20020a0564021cc500b00453ed3f6a38mr11352385edb.346.1663694704231; 
 Tue, 20 Sep 2022 10:25:04 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 25-20020a170906319900b0073ae9ba9ba8sm216903ejy.3.2022.09.20.10.24.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Sep 2022 10:24:57 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E72111FFC4;
 Tue, 20 Sep 2022 18:15:34 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PULL 12/30] tests/docker: update and flatten debian-sh4-cross
Date: Tue, 20 Sep 2022 18:15:15 +0100
Message-Id: <20220920171533.1098094-13-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220920171533.1098094-1-alex.bennee@linaro.org>
References: <20220920171533.1098094-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x531.google.com
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

Update to the latest stable Debian. While we are at it flatten into a
single dockerfile. We really don't need the rest of the stuff from
the QEMU base image just to compile test images.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20220914155950.804707-13-alex.bennee@linaro.org>

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


