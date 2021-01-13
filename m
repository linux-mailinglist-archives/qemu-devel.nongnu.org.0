Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6DC12F4E5F
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 16:21:11 +0100 (CET)
Received: from localhost ([::1]:56344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzhxO-0002F6-8I
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 10:21:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kzhqr-0005iS-LS
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 10:14:25 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:54202)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kzhqq-00007E-3w
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 10:14:25 -0500
Received: by mail-wm1-x32d.google.com with SMTP id k10so1914751wmi.3
 for <qemu-devel@nongnu.org>; Wed, 13 Jan 2021 07:14:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vqnOb9f6RdPAtD9oWhgI1kyYb0MroTHpdmyrfz9hrbA=;
 b=JK105xGKwJjTXEkRaQW9VAcwR4eGqmpBkWeT+qKGOYrTtfnS8tmSEsGwsFuM08nMdx
 a6UrdoprdxqMujSA1cvyoUm3d2IIvNH2PXgE8X2ssLGoCO89nQOQhaKKe2QOairyDYSH
 j5AlAWNATI66VAkK4Sgtuh+89TVBzzghKKnos0OHYpJc2Hz5eBxcxF9Fo/uoDNQQ7kdS
 k9Uimi5vo0OwKgt0Zg4IfLSayDiJU6TM/7DnT/tS2Fg/wGyJRRarHZOHkY4ipFCjrM55
 KUaFiz408ObKv4mx3AMZg5yiXpmQAMATds5fazS0U6r+2F3135s19+n0aOhsXeNDFlEE
 OI2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vqnOb9f6RdPAtD9oWhgI1kyYb0MroTHpdmyrfz9hrbA=;
 b=tWa7aAlmB7eAO3iPR0gdiZm2atUa+3y5m6pvXerWO1bjYi1Behl3YM37hET45ntZ34
 gNd6xwj8xkK++PLTrzQUqOe5bXnBuZ/b6JmGtJV4Nhk1osZecEwRsLGCsTNb0/GA2i68
 U5HJmIiXbKcJ9DFEbKswfCQP4CYk36PeZtBmeUxKkoOoJM46yK0nPQscV2+yCrM2ky5S
 oyki2ASesFIlOjihcQo9skKtNN2U4rvh9/0fgt7UvsSujdcZnkIz7kj1gO7qjJkJuy0w
 aObsNWln6g2bbDXbUg4/oU9DbFfwHGDeW8T62om421labAZiYBcS0RAlGLC12wukjGIm
 6/fg==
X-Gm-Message-State: AOAM531Wn9WzTrdMYS7l8XWqkh9x08Tbw4JBrlj0K/yDFv2E/CxiSbHU
 /pZ5P3WNMfcXCCimoUMa3vTrOQ==
X-Google-Smtp-Source: ABdhPJwCGivrwBs3f86+HdnyLNVPl37poG3YgwyGkdXLikngwSR+BzyhYL14H7h/EnIWD7fqMI8kgA==
X-Received: by 2002:a1c:a145:: with SMTP id k66mr2600236wme.11.1610550862762; 
 Wed, 13 Jan 2021 07:14:22 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id i11sm3343419wmd.47.2021.01.13.07.14.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Jan 2021 07:14:13 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 4A88A1FF96;
 Wed, 13 Jan 2021 15:14:09 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 8/9] docker: expand debian-amd64 image to include tag tools
Date: Wed, 13 Jan 2021 15:14:07 +0000
Message-Id: <20210113151408.27939-9-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210113151408.27939-1-alex.bennee@linaro.org>
References: <20210113151408.27939-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Fam Zheng <fam@euphon.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is going to be helpful when we want to both test the tool
integration and in the case of global generate a xref doc build.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/docker/dockerfiles/debian-amd64.docker | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/tests/docker/dockerfiles/debian-amd64.docker b/tests/docker/dockerfiles/debian-amd64.docker
index 55075d9fce..a98314757d 100644
--- a/tests/docker/dockerfiles/debian-amd64.docker
+++ b/tests/docker/dockerfiles/debian-amd64.docker
@@ -1,7 +1,7 @@
 #
 # Docker x86_64 target
 #
-# This docker target builds on the debian Stretch base image. Further
+# This docker target builds on the Debian Buster base image. Further
 # libraries which are not widely available are installed by hand.
 #
 FROM qemu/debian10
@@ -14,7 +14,10 @@ RUN apt update && \
 RUN apt update && \
     DEBIAN_FRONTEND=noninteractive eatmydata \
     apt install -y --no-install-recommends \
+        cscope \
         genisoimage \
+        exuberant-ctags \
+        global \
         libbz2-dev \
         liblzo2-dev \
         libgcrypt20-dev \
-- 
2.20.1


