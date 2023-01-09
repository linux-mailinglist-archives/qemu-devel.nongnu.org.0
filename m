Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FF1F6625AC
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 13:33:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEqy9-0000EZ-Fd; Mon, 09 Jan 2023 07:09:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEqy3-0000Da-2K
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 07:09:31 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEqy1-00064K-4o
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 07:09:30 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 ay12-20020a05600c1e0c00b003d9ea12bafcso3425462wmb.3
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 04:09:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6JVm2lTb7UkwzLxpZjEdvuXtpe4YgD9c58GS9MDcMYw=;
 b=zPEvnJz4fgEn6Rh42rnJtmC2mAB6mwl46P29XRL2dHM9o8WEwjkgHnVZH4rrxRH9cz
 c8Nsb2cSWFG1j8aCAVKd+j6IgGQASat5OY29rtcAr0t9U25qYE5V01KvCid+FlgC/ctD
 pIp1sF3BmdRupa58fC3dfAu+UtWvoe1EVkxxlMgmps8+mDrC7e9yLTssNMs86yDC5giy
 Qjj4M8AtyfN1bReD+CfG1D1ouN2WOnkKw+CxQAmbdq7xuOgjjU3AYCyNHFMPeHxoZKbP
 PhRmJnblFvvdxJdUHS76+WhaL/oWV0+R15U4UI5P6nJ8BnfHXoQ0vn/U3G5cleNnvfMh
 PgrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6JVm2lTb7UkwzLxpZjEdvuXtpe4YgD9c58GS9MDcMYw=;
 b=22ijddrG7+Sv0dqauSfTAkqiBr538H5I9GBJAEsTMUGS2P5B3usIvFpb2chXgbq0FR
 uMjsmbev1FNO0K1pRde6GDf6AzvO50BpOZYDHQKTP7m/1lQpAz9OqaE5G50/EjgSd/YC
 04oaOt/XcW1bri4kfSXNmGbw89WnkhBEDCbbtWkAQ8BoBOzvN/v1s6kG/tC0647RuabC
 911Tjh6zgcK23If9C20EfsaugjCnyGbKSWmFeqinFZ/JmJNPVxLs+PzsHXSkcdoc4bmV
 BEzAjkcrPsBn0T7QZ6AEVcilCP+/l5GmyZ3uYTwhuHWRqrhAGKaC2eLu86JvbUXsmuGU
 elzA==
X-Gm-Message-State: AFqh2kowPA0IQDn+x2ZMYhcjc3T0kYw7DpDvnADad1H0/DfaKKj3nNAw
 Jh3B2e8/ueh13Y09n16Y5ybO3GYM96ltFlhS
X-Google-Smtp-Source: AMrXdXuhuRIhPDYuBXceKb5a8N/y0kWZDmd0UUGaPpX3uWuoGS2eKFS08be78ZOIiPd8jPSqNJDg+g==
X-Received: by 2002:a05:600c:54c6:b0:3d3:4ead:bb07 with SMTP id
 iw6-20020a05600c54c600b003d34eadbb07mr45790869wmb.5.1673266167591; 
 Mon, 09 Jan 2023 04:09:27 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 i14-20020a05600c354e00b003d1d5a83b2esm17308377wmq.35.2023.01.09.04.09.26
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 09 Jan 2023 04:09:27 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 11/21] hw/arm/digic: Open-code pflash_cfi02_register()
Date: Mon,  9 Jan 2023 13:08:23 +0100
Message-Id: <20230109120833.3330-12-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230109120833.3330-1-philmd@linaro.org>
References: <20230109120833.3330-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

pflash_cfi02_register() hides an implicit sysbus mapping of
MMIO region #0. This is not practical in a heterogeneous world
where multiple cores use different address spaces. In order to
remove pflash_cfi02_register() from the pflash API, open-code it
as a qdev creation call followed by an explicit sysbus mapping.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/digic_boards.c | 26 ++++++++++++++++++++------
 1 file changed, 20 insertions(+), 6 deletions(-)

diff --git a/hw/arm/digic_boards.c b/hw/arm/digic_boards.c
index 4093af09cb..3700f05ecc 100644
--- a/hw/arm/digic_boards.c
+++ b/hw/arm/digic_boards.c
@@ -30,6 +30,7 @@
 #include "qemu/error-report.h"
 #include "hw/arm/digic.h"
 #include "hw/block/flash.h"
+#include "hw/qdev-properties.h"
 #include "hw/loader.h"
 #include "sysemu/qtest.h"
 #include "qemu/units.h"
@@ -115,13 +116,26 @@ static void digic4_add_k8p3215uqb_rom(DigicState *s, hwaddr addr,
 {
 #define FLASH_K8P3215UQB_SIZE (4 * 1024 * 1024)
 #define FLASH_K8P3215UQB_SECTOR_SIZE (64 * 1024)
+    DeviceState *dev;
 
-    pflash_cfi02_register(addr, "pflash", FLASH_K8P3215UQB_SIZE,
-                          NULL, FLASH_K8P3215UQB_SECTOR_SIZE,
-                          DIGIC4_ROM_MAX_SIZE / FLASH_K8P3215UQB_SIZE,
-                          4,
-                          0x00EC, 0x007E, 0x0003, 0x0001,
-                          0x0555, 0x2aa, 0);
+    dev = qdev_new(TYPE_PFLASH_CFI02);
+    qdev_prop_set_string(dev, "name", "pflash");
+    qdev_prop_set_drive(dev, "drive", NULL);
+    qdev_prop_set_uint32(dev, "num-blocks",
+                         FLASH_K8P3215UQB_SIZE / FLASH_K8P3215UQB_SECTOR_SIZE);
+    qdev_prop_set_uint32(dev, "sector-length", FLASH_K8P3215UQB_SECTOR_SIZE);
+    qdev_prop_set_uint8(dev, "device-width",
+                        DIGIC4_ROM_MAX_SIZE / FLASH_K8P3215UQB_SIZE);
+    qdev_prop_set_uint8(dev, "mappings", 4);
+    qdev_prop_set_uint8(dev, "big-endian", false);
+    qdev_prop_set_uint16(dev, "id0", 0x00ec);
+    qdev_prop_set_uint16(dev, "id1", 0x007e);
+    qdev_prop_set_uint16(dev, "id2", 0x0003);
+    qdev_prop_set_uint16(dev, "id3", 0x0001);
+    qdev_prop_set_uint16(dev, "unlock-addr0", 0x555);
+    qdev_prop_set_uint16(dev, "unlock-addr1", 0x2aa);
+    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
+    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, addr);
 
     digic_load_rom(s, addr, FLASH_K8P3215UQB_SIZE, filename);
 }
-- 
2.38.1


