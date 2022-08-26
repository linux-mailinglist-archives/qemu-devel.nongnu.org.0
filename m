Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06D975A2D71
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 19:27:20 +0200 (CEST)
Received: from localhost ([::1]:55942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRd71-00075M-4t
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 13:27:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oRd1W-0004Gg-4P
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 13:21:38 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:45827)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oRd1U-0002KV-Ct
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 13:21:37 -0400
Received: by mail-wr1-x435.google.com with SMTP id bq11so2536362wrb.12
 for <qemu-devel@nongnu.org>; Fri, 26 Aug 2022 10:21:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=2yNc8usUqo6Q33AsamNux4gFM4GyK/SLmXIzDRoATm8=;
 b=DawtFSk8iZqOkQIjcOg6JxJieHoWOu2AkXfkq3RTvOYOLFcFXhWjsBd+qEdHrrlgbN
 FxSxHoEvm8ZSMFO3vcxJP4t2JI7BdkPeJF7H4UE7/fxoGO1vUl43zWol/Ij0JvNrH0MO
 bUGA0I6QLcyWDOz0+1HuuFmOXyK3B+1SCQCJZDNorXTXlS55tSj3eF7yWaAIMceUIyBZ
 +jkSVZ/OjTW/E6/kqZd94FaX5lA9ybz9F2HuzEmY2xx86Wk7m33yI3wfQT5J8KqDzXaw
 AdlATQ0w3c0kQmIB1mIv3ikwOTjFt6p/GEpiOln+H5nROERjo1RoTqbJdYio7EUpgnrw
 Mgwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=2yNc8usUqo6Q33AsamNux4gFM4GyK/SLmXIzDRoATm8=;
 b=vJTjfhdBPpRtbXGztrm8FGijYv1J8a8ErGBHdeEoa9ixeTW15zAXp0U+wmk99YTB9S
 g59wsi70+mvfMAEVMuHKKQnPMSFoqtw8ryKya2Oz8zXOKI3IGZTwZOOKfTBl/h0NIsPB
 +eQu8ghKNHOzXcSvtPfo9JYORr/9gXkoVpU/vaGfij6P7+omWnBVYyyjYrbJKkDGLEIL
 VVP36uvWzkNyG5GjtPCNfvD1WhlEMkjg78TLyahSOdUzV4nJIuCUp1E/KAzdd4pQjeqo
 SRHWaJUPr+o0Dx+i5BosgyQYdd7aaXb6vhBddYU1zdQ0to2Yk5/lb8RxC69pa/ueC4ZX
 Aweg==
X-Gm-Message-State: ACgBeo1Rh+HRCtkCXgPyabgZXgi4PQQrZmljp5N2vcWzrF+Cy5SorIAS
 sXu5l0I+JklGoZjEyZ9VQl4D0g==
X-Google-Smtp-Source: AA6agR6yIOZ4DGpJ1+JClC2pRtYRZ2jVeIYFjRq+Fm7rXH9ctkOXQsS2ybPPmpqqyaR4qOo2rcezUQ==
X-Received: by 2002:a05:6000:18a2:b0:221:7db8:de02 with SMTP id
 b2-20020a05600018a200b002217db8de02mr396814wri.132.1661534493948; 
 Fri, 26 Aug 2022 10:21:33 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 u6-20020a5d4346000000b0020fff0ea0a3sm213123wrr.116.2022.08.26.10.21.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Aug 2022 10:21:31 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 3E6811FFBE;
 Fri, 26 Aug 2022 18:21:29 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PATCH v1 06/25] tests/docker: update and flatten debian-mips64-cross
Date: Fri, 26 Aug 2022 18:21:09 +0100
Message-Id: <20220826172128.353798-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220826172128.353798-1-alex.bennee@linaro.org>
References: <20220826172128.353798-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x435.google.com
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
 .gitlab-ci.d/container-cross.yml                    |  1 -
 tests/docker/Makefile.include                       |  1 -
 tests/docker/dockerfiles/debian-mips64-cross.docker | 12 +++++++-----
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/.gitlab-ci.d/container-cross.yml b/.gitlab-ci.d/container-cross.yml
index 15a5270f6d..a3bfa483bf 100644
--- a/.gitlab-ci.d/container-cross.yml
+++ b/.gitlab-ci.d/container-cross.yml
@@ -77,7 +77,6 @@ m68k-debian-cross-container:
 mips64-debian-cross-container:
   extends: .container_job_template
   stage: containers
-  needs: ['amd64-debian10-container']
   variables:
     NAME: debian-mips64-cross
 
diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
index 95790e974e..6c2ee3b175 100644
--- a/tests/docker/Makefile.include
+++ b/tests/docker/Makefile.include
@@ -89,7 +89,6 @@ DOCKER_PARTIAL_IMAGES += fedora
 endif
 
 docker-image-debian-mips-cross: docker-image-debian10
-docker-image-debian-mips64-cross: docker-image-debian10
 docker-image-debian-sh4-cross: docker-image-debian10
 docker-image-debian-sparc64-cross: docker-image-debian10
 
diff --git a/tests/docker/dockerfiles/debian-mips64-cross.docker b/tests/docker/dockerfiles/debian-mips64-cross.docker
index 09c2ba584e..afcff9726f 100644
--- a/tests/docker/dockerfiles/debian-mips64-cross.docker
+++ b/tests/docker/dockerfiles/debian-mips64-cross.docker
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
         gcc-mips64-linux-gnuabi64 \
         libc6-dev-mips64-cross
-- 
2.30.2


