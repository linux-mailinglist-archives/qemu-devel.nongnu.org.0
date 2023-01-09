Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 828106625C0
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 13:41:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEqqx-0005sJ-NM; Mon, 09 Jan 2023 07:02:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEqqt-0005oa-6o
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 07:02:07 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEqqp-0001uW-PN
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 07:02:06 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 p3-20020a05600c1d8300b003d9ee5f125bso2312206wms.4
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 04:02:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=c6I1HLCSYyw0uAOoILOG7NYLqOybQWcLBPyeCZd7TC0=;
 b=xg9IfuLI7eQOsq6ONF5YgbO9EswzewJzZ7mXUWKY/+tkBLy+bo33lQNdSBahGMH/I7
 q6Cfnd2GL8D6M7dnejza88qrS61xE+g8FLsF/1tQCiOJCEsUxkpJ9j030wm7LZnT9Q3h
 jOkddAkCxp13S7/X2b4RNi1htgt7pCdicYSG1Qej3TqdJ9uqEzNdvakjetrlrLNVjsw2
 O4oXPYAJp+8a7Ib8C8ahMnrexrfrHSfp09qjtxwnt89dnZxfNTXZm5O+7iQtYxSVpWcC
 6DyN3wOqYJN3iEwe8zY7NJW7LI9ALFQR8QZM2bUTMNGwrez8zfzX6wOqgTy9wtzB3KZM
 ZGkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=c6I1HLCSYyw0uAOoILOG7NYLqOybQWcLBPyeCZd7TC0=;
 b=nKNePpQ80tmS5pqMZJU90xoMB7qGo/AlLTfLk6XUGbMC/ES+D0Qse5ruiRJIHrclhn
 Ieqdpwld2n6ndK2tf3cX1ZCO0id1SvJCsU+wBy0X4pWwKZntNaPb54cVFSLn7QdiY2Ch
 38aVZ5FIEx2gniZZIp7ToTbrWfukp35n7dB3m/00dj0vJKWvjkUnlC2j+zGRD2O/Fh70
 9QwpIB4xHGLldUTk/FV1jaxzwuCQ9MoYalLBkD3nLkc6hfISMHa26DWXLzPE0Vfoh5Ll
 cxs9d44KkL5Uw5HiwpwBQ2NdhVauc+F/lRQQq10n/kqTuBITatUOtVnieOYRyqmmtFQy
 j1RA==
X-Gm-Message-State: AFqh2krtTPtX0xxddvCw7BMsVKAVprKikXLxPbqqAXjtAABTvY6CRRit
 zm8norqtg+MuQSJj64RLUARhmgbeeJerauwv
X-Google-Smtp-Source: AMrXdXu1ZGkSk0WGtMytH4NKZzxuRWX73Ve68/XnfpSEN7YD22gJgESRjCP6z3D7IOaOmd2OH3V5xQ==
X-Received: by 2002:a05:600c:4d14:b0:3d3:5c7d:a5f3 with SMTP id
 u20-20020a05600c4d1400b003d35c7da5f3mr49498434wmp.37.1673265721968; 
 Mon, 09 Jan 2023 04:02:01 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 bi22-20020a05600c3d9600b003d208eb17ecsm11123199wmb.26.2023.01.09.04.02.00
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 09 Jan 2023 04:02:01 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Magnus Damm <magnus.damm@gmail.com>,
 qemu-ppc@nongnu.org, BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH 1/5] hw/ppc/sam460ex: Remove unreachable code calling
 pflash_cfi01_register()
Date: Mon,  9 Jan 2023 13:01:50 +0100
Message-Id: <20230109120154.2868-2-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230109120154.2868-1-philmd@linaro.org>
References: <20230109120154.2868-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Since its QOM'ification in commit 368a354f02 ("pflash_cfi0x:
QOMified") the pflash_cfi01_register() function does not fail.

This call was later converted with a script to use &error_fatal,
still unable to fail. Remove the unreachable code.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/ppc/sam460ex.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/hw/ppc/sam460ex.c b/hw/ppc/sam460ex.c
index 4a22ce3761..cf7213f7c9 100644
--- a/hw/ppc/sam460ex.c
+++ b/hw/ppc/sam460ex.c
@@ -103,14 +103,10 @@ static int sam460ex_load_uboot(void)
     DriveInfo *dinfo;
 
     dinfo = drive_get(IF_PFLASH, 0, 0);
-    if (!pflash_cfi01_register(FLASH_BASE | ((hwaddr)FLASH_BASE_H << 32),
-                               "sam460ex.flash", FLASH_SIZE,
-                               dinfo ? blk_by_legacy_dinfo(dinfo) : NULL,
-                               64 * KiB, 1, 0x89, 0x18, 0x0000, 0x0, 1)) {
-        error_report("Error registering flash memory");
-        /* XXX: return an error instead? */
-        exit(1);
-    }
+    pflash_cfi01_register(FLASH_BASE | ((hwaddr)FLASH_BASE_H << 32),
+                          "sam460ex.flash", FLASH_SIZE,
+                          dinfo ? blk_by_legacy_dinfo(dinfo) : NULL,
+                          64 * KiB, 1, 0x89, 0x18, 0x0000, 0x0, 1));
 
     if (!dinfo) {
         /*error_report("No flash image given with the 'pflash' parameter,"
-- 
2.38.1


