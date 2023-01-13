Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BAD4669A20
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 15:30:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGKnL-0001Yw-16; Fri, 13 Jan 2023 09:12:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pGKmn-00014P-CX
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 09:12:01 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pGKmi-0003jU-3R
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 09:12:01 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 m26-20020a05600c3b1a00b003d9811fcaafso17439409wms.5
 for <qemu-devel@nongnu.org>; Fri, 13 Jan 2023 06:11:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=rCt8gM/FZTQl9skse/4Zewww4A5PzU/1oOkoyZpsiGs=;
 b=dG47+urY37gTtaWGWAT3Trg2HAE/1c84/I1iKg0uUM4YtB4ksXfov/4b8vzMfr7IEg
 +4m1vzLH4VyiOIhu/GkvMTm8cBrjdeqrtL22LNVphIKgYwkIuYP7FlBt0Do5b5j+jLsV
 zLtExJWqR6qpb5xzpyjBvUMeoNBs5xkmJKewMOiqIjgqywM0LntSSa5PcfwUq0oeDkI3
 q/r7dSLrxYKLlzHX/zhvy1U5w/p5WLah7HB4ZCl7UhfNz+u8s38HSsiYSER9L6pUcxzC
 eo2JW/GhUWlZZjUeNQ1AibqlzrKXlFYntorh3wzo12oJ0Ox00kIIaEuZosGFxcWEEavN
 I7GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rCt8gM/FZTQl9skse/4Zewww4A5PzU/1oOkoyZpsiGs=;
 b=gv4WxamOvAG9MZ4NfRbbLaF/L2mfXA25TXmYkZCMydRD9pODLq6qBEBqrWXM49UlME
 rRUOE/ikklQ5bFX35gRCbOErCONgePKncS+ag15yaY2JghYUkaiv3wb390ryvn63IhiQ
 YO/opPZAyVu6pvg9oF2PDBpDEkLNoF9XSLIDYFQjAXR2rQ4KUDDFQgLmWRnfTxq7UtyG
 +b374tA76O9inqXv+hmhp7xH3alTD/i6x8Lma6NW2ndMFgEplJu1Zq7bSaQ0OI3O3odN
 JI/1iJUnL/1kF2iF1bmFjqyHbJwg/VEtjmTZG70qSFV5r3Qz/xUvAfaJm34n4iSwMHwS
 uQzA==
X-Gm-Message-State: AFqh2krerZj2GB3xxEYZs5e1JnINHOytvODezJXACiiCAwznTNrnhzYV
 rz0uZ0sW49HrB6PTNz+ZMhCVqP3ye7ac2dP9
X-Google-Smtp-Source: AMrXdXulu5DjVxsU4GECU9/BhraqTKGlWN3a0hUUFWR81rvzna+hJFAAjrSCCg/Pa1WLFX9FnM2+Zg==
X-Received: by 2002:a05:600c:42d5:b0:3d6:e790:c9a0 with SMTP id
 j21-20020a05600c42d500b003d6e790c9a0mr69157868wme.10.1673619105289; 
 Fri, 13 Jan 2023 06:11:45 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 n36-20020a05600c502400b003da0b75de94sm5334464wmr.8.2023.01.13.06.11.44
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Jan 2023 06:11:44 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 20/38] hw/arm/omap_sx1: Use the IEC binary prefix definitions
Date: Fri, 13 Jan 2023 14:11:08 +0000
Message-Id: <20230113141126.535646-21-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230113141126.535646-1-peter.maydell@linaro.org>
References: <20230113141126.535646-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x332.google.com
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

From: Philippe Mathieu-Daudé <philmd@linaro.org>

IEC binary prefixes ease code review: the unit is explicit.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20230109115316.2235-11-philmd@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/omap_sx1.c | 33 +++++++++++++++++----------------
 1 file changed, 17 insertions(+), 16 deletions(-)

diff --git a/hw/arm/omap_sx1.c b/hw/arm/omap_sx1.c
index 84b7059f7c7..d1b0ec3264e 100644
--- a/hw/arm/omap_sx1.c
+++ b/hw/arm/omap_sx1.c
@@ -26,6 +26,7 @@
  * with this program; if not, see <http://www.gnu.org/licenses/>.
  */
 #include "qemu/osdep.h"
+#include "qemu/units.h"
 #include "qapi/error.h"
 #include "ui/console.h"
 #include "hw/arm/omap.h"
@@ -86,15 +87,15 @@ static const MemoryRegionOps static_ops = {
     .endianness = DEVICE_NATIVE_ENDIAN,
 };
 
-#define sdram_size	0x02000000
-#define sector_size	(128 * 1024)
-#define flash0_size	(16 * 1024 * 1024)
-#define flash1_size	( 8 * 1024 * 1024)
-#define flash2_size	(32 * 1024 * 1024)
+#define SDRAM_SIZE      (32 * MiB)
+#define SECTOR_SIZE     (128 * KiB)
+#define FLASH0_SIZE     (16 * MiB)
+#define FLASH1_SIZE     (8 * MiB)
+#define FLASH2_SIZE     (32 * MiB)
 
 static struct arm_boot_info sx1_binfo = {
     .loader_start = OMAP_EMIFF_BASE,
-    .ram_size = sdram_size,
+    .ram_size = SDRAM_SIZE,
     .board_id = 0x265,
 };
 
@@ -111,7 +112,7 @@ static void sx1_init(MachineState *machine, const int version)
     static uint32_t cs3val = 0x00001139;
     DriveInfo *dinfo;
     int fl_idx;
-    uint32_t flash_size = flash0_size;
+    uint32_t flash_size = FLASH0_SIZE;
 
     if (machine->ram_size != mc->default_ram_size) {
         char *sz = size_to_str(mc->default_ram_size);
@@ -121,7 +122,7 @@ static void sx1_init(MachineState *machine, const int version)
     }
 
     if (version == 2) {
-        flash_size = flash2_size;
+        flash_size = FLASH2_SIZE;
     }
 
     memory_region_add_subregion(address_space, OMAP_EMIFF_BASE, machine->ram);
@@ -154,7 +155,7 @@ static void sx1_init(MachineState *machine, const int version)
         if (!pflash_cfi01_register(OMAP_CS0_BASE,
                                    "omap_sx1.flash0-1", flash_size,
                                    blk_by_legacy_dinfo(dinfo),
-                                   sector_size, 4, 0, 0, 0, 0, 0)) {
+                                   SECTOR_SIZE, 4, 0, 0, 0, 0, 0)) {
             fprintf(stderr, "qemu: Error registering flash memory %d.\n",
                            fl_idx);
         }
@@ -165,18 +166,18 @@ static void sx1_init(MachineState *machine, const int version)
             (dinfo = drive_get(IF_PFLASH, 0, fl_idx)) != NULL) {
         MemoryRegion *flash_1 = g_new(MemoryRegion, 1);
         memory_region_init_rom(flash_1, NULL, "omap_sx1.flash1-0",
-                               flash1_size, &error_fatal);
+                               FLASH1_SIZE, &error_fatal);
         memory_region_add_subregion(address_space, OMAP_CS1_BASE, flash_1);
 
         memory_region_init_io(&cs[1], NULL, &static_ops, &cs1val,
-                              "sx1.cs1", OMAP_CS1_SIZE - flash1_size);
+                              "sx1.cs1", OMAP_CS1_SIZE - FLASH1_SIZE);
         memory_region_add_subregion(address_space,
-                                OMAP_CS1_BASE + flash1_size, &cs[1]);
+                                OMAP_CS1_BASE + FLASH1_SIZE, &cs[1]);
 
         if (!pflash_cfi01_register(OMAP_CS1_BASE,
-                                   "omap_sx1.flash1-1", flash1_size,
+                                   "omap_sx1.flash1-1", FLASH1_SIZE,
                                    blk_by_legacy_dinfo(dinfo),
-                                   sector_size, 4, 0, 0, 0, 0, 0)) {
+                                   SECTOR_SIZE, 4, 0, 0, 0, 0, 0)) {
             fprintf(stderr, "qemu: Error registering flash memory %d.\n",
                            fl_idx);
         }
@@ -218,7 +219,7 @@ static void sx1_machine_v2_class_init(ObjectClass *oc, void *data)
     mc->init = sx1_init_v2;
     mc->ignore_memory_transaction_failures = true;
     mc->default_cpu_type = ARM_CPU_TYPE_NAME("ti925t");
-    mc->default_ram_size = sdram_size;
+    mc->default_ram_size = SDRAM_SIZE;
     mc->default_ram_id = "omap1.dram";
 }
 
@@ -236,7 +237,7 @@ static void sx1_machine_v1_class_init(ObjectClass *oc, void *data)
     mc->init = sx1_init_v1;
     mc->ignore_memory_transaction_failures = true;
     mc->default_cpu_type = ARM_CPU_TYPE_NAME("ti925t");
-    mc->default_ram_size = sdram_size;
+    mc->default_ram_size = SDRAM_SIZE;
     mc->default_ram_id = "omap1.dram";
 }
 
-- 
2.34.1


