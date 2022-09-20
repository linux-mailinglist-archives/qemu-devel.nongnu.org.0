Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42B645BEFED
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 00:14:53 +0200 (CEST)
Received: from localhost ([::1]:40964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oalW0-0007YX-AW
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 18:14:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oagze-00065s-Pk
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 13:25:10 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c]:41741)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oagzd-00020o-3M
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 13:25:10 -0400
Received: by mail-ed1-x52c.google.com with SMTP id z97so4843596ede.8
 for <qemu-devel@nongnu.org>; Tue, 20 Sep 2022 10:25:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=uWDiF1jWgciTeV2Qg8CZ4j2xTGM9MuFQveZ8m5IhBP0=;
 b=pP4CILQrgbH4zok1CZ7EWVql/NlX8q/s2f559164fUK7rBw0vHbaDluXuegSvvHN82
 WqizcRsdhKRKXabMnZ+V6XOnSSJ2lxNKnMSId0LDLC3gDqMkfFmGRJl+SQPBx+mypjxk
 l3lrj17AHvp3VhRFNP7XK4W+ZTSCUzy9cEKfkU/rtkk5AvYjA69cl3/sbpVmngefSvkr
 3tsfsnrMHeKsLidzyGAtjLGPnR6JpawHUThFxLsycBWxYsLVnlVG7WIO07scoKYbzVfz
 jTVjv7YC5n7+EIiLucfifA9M8/cz7V31w+hmqKWjaLRVjs8Vs23Y5nPKCcBiNvyfsyAR
 UceQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=uWDiF1jWgciTeV2Qg8CZ4j2xTGM9MuFQveZ8m5IhBP0=;
 b=KbO/t939m7m16bwDl39dFlhV3Kc/EKSk7J7xnnjrOm+hPrTiOGAOQxIXN+MHNJ2cC1
 pA1QvSWEuj6kDtpff6M7Uv2sa+YjMrErpRwTU/W/vX2zcm/g4fT/sMyu1Wm6EkgySE4p
 gOC/Sx2iRBs0Djo3CQ8zH/WJUo5+lRGysl7lyQmqxyDlmp/x9rcfwt1WnGH0Kz1B/2FK
 pYVjO9ie7tRjsBk+JAznq8Br0xNvMSD8ajCXLlFSClQx4fxzMx3+CWQgF3qBzYlfEl2H
 iFT5TNRojomaysCfb0DRuBomndJmyMgx93jppNltAswp4i9nQg274kVoTeWdQlaabAkY
 rS/Q==
X-Gm-Message-State: ACrzQf3dNV+8myKmISqiD8FspufKFnGpji97yFwPOqWTjn7/fkeZ2ndE
 2nn6yd26jV07z9alKuJ28an1vQ==
X-Google-Smtp-Source: AMsMyM732kMLeyHgdJ56RHLPssBOBvSt9tFKVro7ePE7D7InJ+sKzsqtI5EP+3pAd+8sfz0xyyAd3g==
X-Received: by 2002:a05:6402:35cb:b0:451:6a0a:6688 with SMTP id
 z11-20020a05640235cb00b004516a0a6688mr21251120edc.415.1663694707648; 
 Tue, 20 Sep 2022 10:25:07 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 d22-20020a1709061f5600b0077b2b0563f4sm143721ejk.173.2022.09.20.10.24.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Sep 2022 10:25:02 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 83CCE1FFD1;
 Tue, 20 Sep 2022 18:15:36 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PULL 26/30] tests/docker: update and flatten debian-loongarch-cross
Date: Tue, 20 Sep 2022 18:15:29 +0100
Message-Id: <20220920171533.1098094-27-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220920171533.1098094-1-alex.bennee@linaro.org>
References: <20220920171533.1098094-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x52c.google.com
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
single dockerfile. We really don't need the rest of the stuff from the
QEMU base image just to compile test images. In this case it is a
binary distribution of the toolchain anyway.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20220914155950.804707-27-alex.bennee@linaro.org>

diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
index a0f5109628..1d5a6f1fb4 100644
--- a/tests/docker/Makefile.include
+++ b/tests/docker/Makefile.include
@@ -128,7 +128,6 @@ docker-image-debian-nios2-cross: $(DOCKER_FILES_DIR)/debian-toolchain.docker \
 	$(call debian-toolchain, $@)
 
 # Specialist build images, sometimes very limited tools
-docker-image-debian-loongarch-cross: docker-image-debian11
 docker-image-debian-microblaze-cross: docker-image-debian10
 docker-image-debian-nios2-cross: docker-image-debian10
 
diff --git a/tests/docker/dockerfiles/debian-loongarch-cross.docker b/tests/docker/dockerfiles/debian-loongarch-cross.docker
index ca2469d2a8..a8e8e98909 100644
--- a/tests/docker/dockerfiles/debian-loongarch-cross.docker
+++ b/tests/docker/dockerfiles/debian-loongarch-cross.docker
@@ -1,11 +1,13 @@
 #
 # Docker cross-compiler target
 #
-# This docker target builds on the debian11 base image,
-# using a prebuilt toolchains for LoongArch64 from:
+# This docker target uses prebuilt toolchains for LoongArch64 from:
 # https://github.com/loongson/build-tools/releases
 #
-FROM qemu/debian11
+FROM docker.io/library/debian:11-slim
+
+# Duplicate deb line as deb-src
+RUN cat /etc/apt/sources.list | sed "s/^deb\ /deb-src /" >> /etc/apt/sources.list
 
 RUN apt-get update && \
     DEBIAN_FRONTEND=noninteractive apt install -yy eatmydata && \
-- 
2.34.1


