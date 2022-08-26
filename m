Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADC8C5A2DD4
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 19:51:01 +0200 (CEST)
Received: from localhost ([::1]:40762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRdTw-0000qg-7x
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 13:51:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oRdA2-0005qx-2g
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 13:30:26 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:40861)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oRdA0-0003lx-8L
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 13:30:25 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 h204-20020a1c21d5000000b003a5b467c3abso4762088wmh.5
 for <qemu-devel@nongnu.org>; Fri, 26 Aug 2022 10:30:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=AcIhrnEo/jsi7L6ojahvmIlXYQW4m/medhgo10JCLYM=;
 b=hBsh+uMG2awt53suNTQBupj6o7GGMVxEWNu3Q2PDG9XMUuY/F/LBw/OVV7xmp6GTN1
 z0YWIgLhGU0WTM2poOYhDd2dPz+N1BzrLgYvyMduxyiFJKpIdv59Sfe4Q3vZ3pBtrEbb
 +2j2vJY5o79Yt4ieG9izeS/mpgXLqUG2PXV7rsPze/rGJsv21IMaw2uk+kXNKajlL+po
 RPwB0G/aC8SUqHJ7ocBIX/7q/lPNfuzYhgQ3tRojyw4plJ9Y1423OM8kQ8O5dxTEnvWS
 XrGe/ncbSXLjr1QXbQTPsaFk8JPRup/ISqjb2vUtzxdbEDRkl7zQ+z3z7OEnjfhn1I0G
 JXkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=AcIhrnEo/jsi7L6ojahvmIlXYQW4m/medhgo10JCLYM=;
 b=0qaS2FFWgJrXaGG9gPxsgbahZmrOHCcRDVatTtnGTK/wVUtnKuaxVO1sGTBwFHjB+c
 2emx2JwmctIPm0AQPovAglFvibfueVVlaafnBqMIReiGRxAx0tI2D6k2G3qOYmWAUD71
 yricibwJKvHNIiG2rOhImnbF4vt/wre51Z17Nhmn4r2TKAYmu46nipm8ktMt+AB1Ow59
 1i4VrcFTcuTFoa4rTs8ZgAKZbBE/hxgsq7KxDGbB3uFsMs8wIJSMw3WWd5ISWx0KmVyO
 9ZwFIyR0aMk3JF9GxOx2tu1FlHiUxjWGnvyffWjt2jk2Ic1oRrGO0bvtFNDd6t+C7DwT
 PIGA==
X-Gm-Message-State: ACgBeo307BxTfr1blR741r9NNZ0ml4ipueDCupIrdf53yZPEPjaqKSfZ
 M380q+MP3OnWYQBpiYq1qqzK5Q==
X-Google-Smtp-Source: AA6agR7TD86DvlSd0XnPFFDFXviILstQ3tEpWRhrXuwBHDavHkFYpxq6jeqmRl0fcfWoMM3Hr7QggA==
X-Received: by 2002:a7b:c851:0:b0:3a5:f211:45cd with SMTP id
 c17-20020a7bc851000000b003a5f21145cdmr411618wml.156.1661535022688; 
 Fri, 26 Aug 2022 10:30:22 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 g2-20020a5d4882000000b002254880c049sm292112wrq.31.2022.08.26.10.30.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Aug 2022 10:30:18 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 83F6A1FFCA;
 Fri, 26 Aug 2022 18:21:30 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PATCH v1 20/25] tests/docker: update and flatten
 debian-loongarch-cross
Date: Fri, 26 Aug 2022 18:21:23 +0100
Message-Id: <20220826172128.353798-21-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220826172128.353798-1-alex.bennee@linaro.org>
References: <20220826172128.353798-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x332.google.com
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
single dockerfile. We really don't need the rest of the stuff from the
QEMU base image just to compile test images. In this case it is a
binary distribution of the toolchain anyway.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/docker/Makefile.include                          | 1 -
 tests/docker/dockerfiles/debian-loongarch-cross.docker | 5 ++++-
 2 files changed, 4 insertions(+), 2 deletions(-)

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
index ca2469d2a8..48fe64c51b 100644
--- a/tests/docker/dockerfiles/debian-loongarch-cross.docker
+++ b/tests/docker/dockerfiles/debian-loongarch-cross.docker
@@ -5,7 +5,10 @@
 # using a prebuilt toolchains for LoongArch64 from:
 # https://github.com/loongson/build-tools/releases
 #
-FROM qemu/debian11
+FROM docker.io/library/debian:bullseye-slim
+
+# Duplicate deb line as deb-src
+RUN cat /etc/apt/sources.list | sed "s/^deb\ /deb-src /" >> /etc/apt/sources.list
 
 RUN apt-get update && \
     DEBIAN_FRONTEND=noninteractive apt install -yy eatmydata && \
-- 
2.30.2


