Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C156C662575
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 13:24:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEqjD-0003Cg-73; Mon, 09 Jan 2023 06:54:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEqjB-0003CH-Kq
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 06:54:09 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEqj9-00089s-Sb
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 06:54:09 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 j16-20020a05600c1c1000b003d9ef8c274bso2113200wms.0
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 03:54:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LVNFvExNkEf16xN6scmGKliquT0uXwHyZsjZ5nnvuPM=;
 b=Sxp/Wg/0RMnlrTjkIbq3Ax1cZ0nwKHugsjmteYO0+L7sAJJF5NjXUTKVwwyGAY6Aul
 VytvzhgnSojuOCWtGgk3AQzWaQgnjpTf5erRSEKztda8vhjNfI6twICPKaMzzsKESs7z
 MzZpcdDwawoFXImfSAI7s4cw2FaFf/+Ul60su6Pxuf2t/OVIYDLxPEnfqzqVKq5bb5tN
 h95fNb16cxlXR1Q/p10yASbAx25R3fmv/cPa1pw3oLdxGKeBsy8h8dPyEr1v/5jMUEVn
 r4g74tFVWizSc6Ej/YAc8CY7+Y/JTXyjq8zVJ4KXwMBNNdFqTvgpWzwfKruPTEjJAfm+
 d7zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LVNFvExNkEf16xN6scmGKliquT0uXwHyZsjZ5nnvuPM=;
 b=P6A8JvKnxwSz7WNj+xOt/zOq+bAbHUkq8gKDJBfvlg2fId+Tco62FH1Xi31+wkiynz
 wgBhttcpA64Ytg24LOUILhL4WYcmTxmaHInZX5BWXll1n+cZRbttA3f+6yWkFzJeymas
 +gym+UfX0WG75+Ie8OPthQ/eWiHrBtNvGA9v9ZmhK2G4rA/MOlkikf57OEbIqNNyiVdk
 RhQwEbx4lmJmeb+FiOxn1o7zzWC9y0WMPxoCEpPyUS58EjNKF8bZAqF6Jr6jYALu29Mi
 jXESdOXBeg16/5J/8rR7UQi7tbkJXTSM5Tb7bsnF2OqrIpxe5nBX1j7bQJtDiA9gVZ2j
 d3nw==
X-Gm-Message-State: AFqh2ko8gXEiW+r5y+SI76D86HD1MvxgZ6lSj19FEIMKR2Wu9Db+xgzi
 1PD903uP9CIlsuY/u4QJXq4yQ1U3GKM1HErB
X-Google-Smtp-Source: AMrXdXtNOfpQmcF6d8mKogguAzRMtwK7tl06bBa0X17a98VK4wqTJEFxJcHdT4qo8o2Dl8wFdXbCzQ==
X-Received: by 2002:a05:600c:3509:b0:3c6:e60f:3f6f with SMTP id
 h9-20020a05600c350900b003c6e60f3f6fmr45448282wmq.38.1673265246364; 
 Mon, 09 Jan 2023 03:54:06 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 j30-20020a05600c1c1e00b003d9f14e9085sm2706376wms.17.2023.01.09.03.54.05
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 09 Jan 2023 03:54:05 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Jan Kiszka <jan.kiszka@web.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 10/13] hw/arm/omap_sx1: Use the IEC binary prefix definitions
Date: Mon,  9 Jan 2023 12:53:13 +0100
Message-Id: <20230109115316.2235-11-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230109115316.2235-1-philmd@linaro.org>
References: <20230109115316.2235-1-philmd@linaro.org>
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

IEC binary prefixes ease code review: the unit is explicit.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/omap_sx1.c | 33 +++++++++++++++++----------------
 1 file changed, 17 insertions(+), 16 deletions(-)

diff --git a/hw/arm/omap_sx1.c b/hw/arm/omap_sx1.c
index 84b7059f7c..d1b0ec3264 100644
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
2.38.1


