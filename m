Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26552349DDA
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Mar 2021 01:31:31 +0100 (CET)
Received: from localhost ([::1]:59130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPaNu-0004SV-7f
	for lists+qemu-devel@lfdr.de; Thu, 25 Mar 2021 20:31:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lPaKR-0002RW-Fs; Thu, 25 Mar 2021 20:27:55 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:44587)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lPaKP-000452-87; Thu, 25 Mar 2021 20:27:54 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 j4-20020a05600c4104b029010c62bc1e20so2112478wmi.3; 
 Thu, 25 Mar 2021 17:27:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IYakNFxQV1ex75l66dPkqyEqS369liYXkwtkj/H9Uas=;
 b=KPgrCjl7IEfoYlrAJFCDMudAfThi+8A7nYifuZpdkqHNNj2tu1GBZmdoCJK30+iz26
 TatGmkhGh6fSBj5zwzxTTyolSrNFlCbQ96wcMdfeUMtkMsTenHnwj3oy+h00COc2gF5V
 pGejtLKe4WsO4r6LyNfE12k3Mo2uDfsf1hp2AQbjvwCaI5+mRgZHjdqJNLULqzDCc2zf
 DJYFn1Yirj9flWyfBZXdNqAK9uxsTOOomjsfWbgBNZ82KJIf4ctMY4tL1l7tInTb6sLA
 AyeCPrEVk3+ijjvP378521okK5qsgls19edZgOtTODDF6cdFMcgHYhlf6YceabPA/ETD
 nkjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=IYakNFxQV1ex75l66dPkqyEqS369liYXkwtkj/H9Uas=;
 b=k5W2mvyS51GD6dhNoimEszopWHobWnB8efwxqo7LgQtNkNRbvz5+cro7H9RjfXuskI
 JuajobnD2EsmBXm2zg8BkLLosBJvBSV/TUQQkDh62xA6uHTPDaPkhlbmAnEst2Eakubn
 7fHYQOUt2d0K7/gT0kMCtbCu/RNPsrCWC0PTciduxCF5Q5nxPabfJCzBLGHt6BYywqVm
 roXg2M1pthnE4dbskRRIKYB2LpyJ1nIoq/+rdElFwaVbV1vHbxR7gdKDzleaC60WUXKt
 lKtVLokANo2C3XYMnFyPM5semYYCwXM36JsDAQLxAkM3GoWR9yVM6hxg/4WB+PLyXOfT
 STcg==
X-Gm-Message-State: AOAM531sgHL44vA95u/hmaOYBqwk0sBIHUZnPNnyHDraLQjwfQMCWTQh
 i83oyqZChXFwk3h82M7V2hprQlALRIKnvA==
X-Google-Smtp-Source: ABdhPJxe/rYYqQpo4DJebS5dMcnZn6DD4xd4y8iiQPhT0TcaIdyPxFYKOKupjgPTUjqg3bP3SutnPQ==
X-Received: by 2002:a05:600c:210a:: with SMTP id
 u10mr10497666wml.147.1616718466644; 
 Thu, 25 Mar 2021 17:27:46 -0700 (PDT)
Received: from localhost.localdomain (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id r11sm9513265wrm.26.2021.03.25.17.27.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Mar 2021 17:27:46 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH-for-6.1 03/10] hw/arm/musicpal: Map flash using
 memory_region_add_subregion_aliased()
Date: Fri, 26 Mar 2021 01:27:21 +0100
Message-Id: <20210326002728.1069834-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210326002728.1069834-1-f4bug@amsat.org>
References: <20210326002728.1069834-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Jan Kiszka <jan.kiszka@web.de>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Alistair Francis <alistair@alistair23.me>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Instead of using a device specific feature for mapping the
flash memory multiple times over a wider region, use the
generic memory_region_add_subregion_aliased() helper.

There is no change in the memory layout.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/musicpal.c | 11 +++++++----
 hw/arm/Kconfig    |  1 +
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/hw/arm/musicpal.c b/hw/arm/musicpal.c
index 8b58b66f263..7d1f2f3fb3f 100644
--- a/hw/arm/musicpal.c
+++ b/hw/arm/musicpal.c
@@ -30,6 +30,7 @@
 #include "hw/irq.h"
 #include "hw/or-irq.h"
 #include "hw/audio/wm8750.h"
+#include "hw/misc/aliased_region.h"
 #include "sysemu/block-backend.h"
 #include "sysemu/runstate.h"
 #include "sysemu/dma.h"
@@ -1656,7 +1657,7 @@ static void musicpal_init(MachineState *machine)
         qdev_prop_set_uint32(dev, "num-blocks", flash_size / sector_size);
         qdev_prop_set_uint32(dev, "sector-length", sector_size);
         qdev_prop_set_uint8(dev, "width", 2); /* 16-bit */
-        qdev_prop_set_uint8(dev, "mappings", MP_FLASH_SIZE_MAX / flash_size);
+        qdev_prop_set_uint8(dev, "mappings", 0);
         qdev_prop_set_uint8(dev, "big-endian", 0);
         qdev_prop_set_uint16(dev, "id0", 0x00bf);
         qdev_prop_set_uint16(dev, "id1", 0x236d);
@@ -1667,14 +1668,16 @@ static void musicpal_init(MachineState *machine)
         qdev_prop_set_string(dev, "name", "musicpal.flash");
         sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
 
-        sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0,
-                        0x100000000ULL - MP_FLASH_SIZE_MAX);
-
         /*
          * The original U-Boot accesses the flash at 0xFE000000 instead of
          * 0xFF800000 (if there is 8 MB flash). So remap flash access if the
          * image is smaller than 32 MB.
          */
+        memory_region_add_subregion_aliased(get_system_memory(),
+                                0x100000000ULL - MP_FLASH_SIZE_MAX,
+                                MP_FLASH_SIZE_MAX,
+                                sysbus_mmio_get_region(SYS_BUS_DEVICE(dev), 0),
+                                flash_size);
     }
     sysbus_create_simple(TYPE_MV88W8618_FLASHCFG, MP_FLASHCFG_BASE, NULL);
 
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 8c37cf00da7..aa8553b3cd3 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -101,6 +101,7 @@ config MUSICPAL
     select MARVELL_88W8618
     select PTIMER
     select PFLASH_CFI02
+    select ALIASED_REGION
     select SERIAL
     select WM8750
 
-- 
2.26.2


