Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D6A55BEFA2
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 00:05:46 +0200 (CEST)
Received: from localhost ([::1]:50944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oalNB-0000Ab-8x
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 18:05:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oagqj-0000b3-1G
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 13:16:00 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:43821)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oagqh-0000ii-Gl
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 13:15:56 -0400
Received: by mail-ej1-x629.google.com with SMTP id lh5so7754877ejb.10
 for <qemu-devel@nongnu.org>; Tue, 20 Sep 2022 10:15:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=kgOtjYfIt+ylJV73NEowm0ceMrq4o4dFJuDidaHM5To=;
 b=F2nUPLK8zfJyr86IVAOceQrKpw9rbGkAWVTf1TVzguqH/EOBIIIt+jTXec9SNf7nD+
 qW5pK6ZZLiytc3par8qifQmFElMTVsb2skAgQtyZQhskUX8BsaMgnypGpLCS7/dBR/J8
 L7fI+HrVjAmJ1XqicImIX+PI+BYJW2cDbINshaHltMp7FBe1HlBqLM1wzdvqws2vLJGQ
 61M5RwHpzVRopB41ZAHQIMuDaVrOkk0x9DXW2Cbiov2c8HbI4fAmpUcxeltje7GPcxwn
 4npwKCSE3oERHy78usxB/PR0VIEFMBFBJO+zVgUNFkyJayrRNN57/nzioKyEAUgmnjal
 lj/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=kgOtjYfIt+ylJV73NEowm0ceMrq4o4dFJuDidaHM5To=;
 b=uTvAnCuE2WWXVzvxW79kpOaODJSNIjjNB2DeLdxsxB7ibWS4c8LORdTkE2wRCCq22J
 d+U6gEaGzBqI4li/vVVHfzRcPEs1mzIJlrw3jhjYejEWS/InkifzVSevyELNT7KxKYIL
 +bFR3zHrdBL6mzHpwp2jHQNrejFoN8cIZ/9WM8fNaTq9N6aDQRrPmvt/HB6Ulrg5it8P
 IB85aZvwS0QPzZU5cjqh3jraeRwK5hcdnvPJKdlMBxNc5pSD6xCDG6IosB7W8X1x+CnF
 z0WWvi5s939VUieiLYFAx8a3kyzhx2iYtYlgHw/ClxdXBlnnDPel4L+Bx6mI33dFT66D
 PNCg==
X-Gm-Message-State: ACrzQf0zhsGBHc+c9ZckRHDPmewmGp9gp+8U3ElLN+KurkUTOa2JbZ3k
 qThp1H1sv4L0DXCfifZvZTZPcQ==
X-Google-Smtp-Source: AMsMyM7GmSpr5h/JTJhYCrYWSxXzdyBGhUyL5no4EqDgzFD42IRrfyeYqz22ECnrSypY8zUGV+/rhQ==
X-Received: by 2002:a17:906:7f03:b0:781:6462:4214 with SMTP id
 d3-20020a1709067f0300b0078164624214mr7764544ejr.274.1663694154053; 
 Tue, 20 Sep 2022 10:15:54 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 o10-20020a170906768a00b00781e7d364ebsm134186ejm.144.2022.09.20.10.15.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Sep 2022 10:15:45 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 957091FFC1;
 Tue, 20 Sep 2022 18:15:34 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PULL 09/30] tests/docker: update and flatten debian-hppa-cross
Date: Tue, 20 Sep 2022 18:15:12 +0100
Message-Id: <20220920171533.1098094-10-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220920171533.1098094-1-alex.bennee@linaro.org>
References: <20220920171533.1098094-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x629.google.com
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
Message-Id: <20220914155950.804707-10-alex.bennee@linaro.org>

diff --git a/.gitlab-ci.d/container-cross.yml b/.gitlab-ci.d/container-cross.yml
index 802e332205..6c1d765463 100644
--- a/.gitlab-ci.d/container-cross.yml
+++ b/.gitlab-ci.d/container-cross.yml
@@ -65,7 +65,6 @@ hexagon-cross-container:
 hppa-debian-cross-container:
   extends: .container_job_template
   stage: containers
-  needs: ['amd64-debian10-container']
   variables:
     NAME: debian-hppa-cross
 
diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
index c565aa5e7b..e39597d35c 100644
--- a/tests/docker/Makefile.include
+++ b/tests/docker/Makefile.include
@@ -88,7 +88,6 @@ DOCKER_PARTIAL_IMAGES += debian-s390x-cross
 DOCKER_PARTIAL_IMAGES += fedora
 endif
 
-docker-image-debian-hppa-cross: docker-image-debian10
 docker-image-debian-m68k-cross: docker-image-debian10
 docker-image-debian-mips-cross: docker-image-debian10
 docker-image-debian-mips64-cross: docker-image-debian10
diff --git a/tests/docker/dockerfiles/debian-hppa-cross.docker b/tests/docker/dockerfiles/debian-hppa-cross.docker
index 3d6c65a3ef..af1c8403d8 100644
--- a/tests/docker/dockerfiles/debian-hppa-cross.docker
+++ b/tests/docker/dockerfiles/debian-hppa-cross.docker
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
         gcc-hppa-linux-gnu \
         libc6-dev-hppa-cross
-- 
2.34.1


