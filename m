Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25378662534
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 13:15:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEqiz-000369-LT; Mon, 09 Jan 2023 06:53:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEqiw-00034R-Qz
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 06:53:54 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEqiv-0007tT-4J
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 06:53:54 -0500
Received: by mail-wr1-x42a.google.com with SMTP id d17so7892768wrs.2
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 03:53:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8ERSy5wcRjjSecTdAN061YLtBrODzsMdgJY9d4shct4=;
 b=kaLTikEkyQPY5JrXFdTQCtS28Mm2WEUsaiRImfff56vAh2qvCDYFB1i4Zwnc6p1ySh
 lzTMkeI76KM5Mv85kwwWRBOZsDrWQFHJK7lvb4IbdC09g2vBj9MU/rKv493xrAPOiHOc
 Qg7PtJb8622RbHoiQcT+Q6Mtd04WWOTXwmT+F3F69l1XRuhRCRknUcLZ5/Zp82eWcf3r
 13YfUY16jVnMGhktXoWH70VeEMcAGN8wU5SP0PvIMcvuCNAnTMLOZx0ViVJWsfrlv6l3
 kccj2FObqosnGEmUMfMc6jfC3DIwYP8YRolXEdzJibSlQGoeNVTrE7XiWBRSpAlr9GOz
 nIIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8ERSy5wcRjjSecTdAN061YLtBrODzsMdgJY9d4shct4=;
 b=sYyl3XW7dxi8n2UMYRcEmRDXN2OnIEvBfaemjnfyd4gpNcLayKT128dhJVUSudaK4M
 3VjQbHYNPAuGH2lvC3wixrVN6MSD87aujNi44lB+pPdHBHfimOCmPxjNkHPKxzgHyyg3
 56X//51abHDUS2P/XrILdSetGfNbBu5KRJNMFtys+S2iFTe7NEtTWtbeyI7IatUDZAx6
 ADwsss3zWo2Aq9gqPPR4fjaYznUQ53skGmJ08ibJ+R8bb/4WppNYDP9Yz4WRXIULYkyF
 +RmPl3+QJW6rLCCbRIfPPSy9+mv77ttaykRJeay6VF2OLYB196+oIz1t/vLXwR8W3g7P
 HB6g==
X-Gm-Message-State: AFqh2kpXdKiK5MRS7Q+07qZ8MHfSx5rWYvLHHnTlkt47YzZlQvS/bKts
 uoLNIS36LotA/cExKxCjB3Id0+UM9uBivFpJ
X-Google-Smtp-Source: AMrXdXu0jDsMsUYt3nuEPAneijVUksHCeFC58S42Pr9Gjx1X/+jxO+A6qg45llCFjxFj8iScmaV6TA==
X-Received: by 2002:a5d:5b17:0:b0:26f:42c9:a224 with SMTP id
 bx23-20020a5d5b17000000b0026f42c9a224mr44211101wrb.63.1673265232216; 
 Mon, 09 Jan 2023 03:53:52 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 i6-20020adfe486000000b002423dc3b1a9sm8251662wrm.52.2023.01.09.03.53.51
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 09 Jan 2023 03:53:51 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Jan Kiszka <jan.kiszka@web.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 07/13] hw/arm/mainstone: Use the IEC binary prefix definitions
Date: Mon,  9 Jan 2023 12:53:10 +0100
Message-Id: <20230109115316.2235-8-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230109115316.2235-1-philmd@linaro.org>
References: <20230109115316.2235-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42a.google.com
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

IEC binary prefixes ease code review: the unit is explicit.

Add the FLASH_SECTOR_SIZE definition.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/mainstone.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/hw/arm/mainstone.c b/hw/arm/mainstone.c
index f6293c6c13..eebaed6e3e 100644
--- a/hw/arm/mainstone.c
+++ b/hw/arm/mainstone.c
@@ -12,6 +12,7 @@
  * GNU GPL, version 2 or (at your option) any later version.
  */
 #include "qemu/osdep.h"
+#include "qemu/units.h"
 #include "qemu/error-report.h"
 #include "qapi/error.h"
 #include "hw/arm/pxa.h"
@@ -99,19 +100,20 @@ static const struct keymap map[0xE0] = {
 
 enum mainstone_model_e { mainstone };
 
-#define MAINSTONE_RAM	0x04000000
-#define MAINSTONE_ROM	0x00800000
-#define MAINSTONE_FLASH	0x02000000
+#define MAINSTONE_RAM_SIZE      (64 * MiB)
+#define MAINSTONE_ROM_SIZE      (8 * MiB)
+#define MAINSTONE_FLASH_SIZE    (32 * MiB)
 
 static struct arm_boot_info mainstone_binfo = {
     .loader_start = PXA2XX_SDRAM_BASE,
-    .ram_size = 0x04000000,
+    .ram_size = MAINSTONE_RAM_SIZE,
 };
 
+#define FLASH_SECTOR_SIZE   (256 * KiB)
+
 static void mainstone_common_init(MachineState *machine,
                                   enum mainstone_model_e model, int arm_id)
 {
-    uint32_t sector_len = 256 * 1024;
     hwaddr mainstone_flash_base[] = { MST_FLASH_0, MST_FLASH_1 };
     PXA2xxState *mpu;
     DeviceState *mst_irq;
@@ -121,7 +123,7 @@ static void mainstone_common_init(MachineState *machine,
 
     /* Setup CPU & memory */
     mpu = pxa270_init(mainstone_binfo.ram_size, machine->cpu_type);
-    memory_region_init_rom(rom, NULL, "mainstone.rom", MAINSTONE_ROM,
+    memory_region_init_rom(rom, NULL, "mainstone.rom", MAINSTONE_ROM_SIZE,
                            &error_fatal);
     memory_region_add_subregion(get_system_memory(), 0x00000000, rom);
 
@@ -130,9 +132,9 @@ static void mainstone_common_init(MachineState *machine,
         dinfo = drive_get(IF_PFLASH, 0, i);
         if (!pflash_cfi01_register(mainstone_flash_base[i],
                                    i ? "mainstone.flash1" : "mainstone.flash0",
-                                   MAINSTONE_FLASH,
+                                   MAINSTONE_FLASH_SIZE,
                                    dinfo ? blk_by_legacy_dinfo(dinfo) : NULL,
-                                   sector_len, 4, 0, 0, 0, 0, 0)) {
+                                   FLASH_SECTOR_SIZE, 4, 0, 0, 0, 0, 0)) {
             error_report("Error registering flash memory");
             exit(1);
         }
-- 
2.38.1


