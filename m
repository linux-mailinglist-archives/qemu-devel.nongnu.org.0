Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DC83662555
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 13:19:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEqyy-0000Nw-SA; Mon, 09 Jan 2023 07:10:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEqyR-0000KO-Ev
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 07:09:55 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEqyN-0006Gz-VT
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 07:09:54 -0500
Received: by mail-wm1-x32b.google.com with SMTP id g10so6105945wmo.1
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 04:09:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zWyHzmVIkAWuEo3FoJyuv2D5h+TutR6C3tqTyTBktJw=;
 b=SBHEmClsm6N22wz+tMB45rhYkukPCNb0kEGT+Plif+C8pFl9+8y4X0VIrWgAya09aC
 FTfPXVn6IA+1crtYnnt8hqNGpOMNkd2jM4dcmeJuC/kFxFSr1k2oz5NVldNgq3cHh3iT
 Vw2Qn5MQ6G/YmMhES4SOHkD6Z82/Vo5VdOx60tLvrBBM9oU5MByDgIHkGG3/BUUvOh08
 Z3NPfjvBMm4ATdX429fD/KrYgAz412amBlTzYnpbIr9msyfHPnB6VZWHH7j5VVkTPiMP
 XXjEqjn3a4nkH/0Ftr4SdKqETkqOrx/O06BxIKpJXu9il0LrmzQiOASbPP10KVCgqTPj
 70Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zWyHzmVIkAWuEo3FoJyuv2D5h+TutR6C3tqTyTBktJw=;
 b=3pS4gLFYZeskh33p+hFBUGIFzwVwOPHw/OxyiPevxC+68K4ljdw0/FMOrYebHBvwBy
 bxBzxWtqisyrM+bGJOEGph43egiqyVb/lKx6ybSDpdxoqRSsWroKetNw+tC5wvloQtnC
 cohyLNoojm1Cwnf599/6uHxh5Vz2ZZO3elUMJ6r8rbfY+dd+3AXSLyIatE4L3W5eF1W/
 RkRY29QHoAUIpzdiYK0FY6OEINWH9GdehiiDUYsMW/rLw6CPnTw7ztJRymaMVqCFY6sT
 4jMoswTVRxNWiH9KzxxapxKAydChu0eYt2c4TvrwwM8OWvjLSSv1zul4V8cxUE2GfEWP
 QAdA==
X-Gm-Message-State: AFqh2koQvwDkKMeyjFeQPNbgmjIZrB3HU7cvN308QOUIrbr6ZP/o+Uyn
 xONiL2wkEpgZI/1RSx2LMA6EcGAja3308gg7
X-Google-Smtp-Source: AMrXdXs01rvbesRuEAWceUZBfla0zGanbWTk25mkMuxN9f1jptPWvzDUjRQ2g+/5ngnmHDcKMVVHLw==
X-Received: by 2002:a05:600c:2252:b0:3d3:5d8b:7af with SMTP id
 a18-20020a05600c225200b003d35d8b07afmr49001072wmm.41.1673266190932; 
 Mon, 09 Jan 2023 04:09:50 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 he12-20020a05600c540c00b003d9ddc82450sm10934053wmb.45.2023.01.09.04.09.50
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 09 Jan 2023 04:09:50 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 16/21] hw/arm: Open-code pflash_cfi01_register()
Date: Mon,  9 Jan 2023 13:08:28 +0100
Message-Id: <20230109120833.3330-17-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230109120833.3330-1-philmd@linaro.org>
References: <20230109120833.3330-1-philmd@linaro.org>
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

pflash_cfi01_register() hides an implicit sysbus mapping of
MMIO region #0. This is not practical in a heterogeneous world
where multiple cores use different address spaces. In order to
remove pflash_cfi01_register() from the pflash API, open-code it
as a qdev creation call followed by an explicit sysbus mapping.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/collie.c      | 16 ++++++++++++----
 hw/arm/gumstix.c     | 32 ++++++++++++++++++++++++++------
 hw/arm/mainstone.c   | 19 ++++++++++++++-----
 hw/arm/omap_sx1.c    | 31 +++++++++++++++++++++++--------
 hw/arm/versatilepb.c | 18 +++++++++++++-----
 hw/arm/z2.c          | 17 ++++++++++++++---
 6 files changed, 102 insertions(+), 31 deletions(-)

diff --git a/hw/arm/collie.c b/hw/arm/collie.c
index 9edff59370..b0183f8ea2 100644
--- a/hw/arm/collie.c
+++ b/hw/arm/collie.c
@@ -11,11 +11,13 @@
 #include "qemu/osdep.h"
 #include "qemu/units.h"
 #include "qemu/cutils.h"
+#include "qapi/error.h"
 #include "hw/sysbus.h"
 #include "hw/boards.h"
 #include "strongarm.h"
 #include "hw/arm/boot.h"
 #include "hw/block/flash.h"
+#include "hw/qdev-properties.h"
 #include "exec/address-spaces.h"
 #include "cpu.h"
 #include "qom/object.h"
@@ -56,10 +58,16 @@ static void collie_init(MachineState *machine)
 
     for (unsigned i = 0; i < 2; i++) {
         DriveInfo *dinfo = drive_get(IF_PFLASH, 0, i);
-        pflash_cfi01_register(i ? SA_CS1 : SA_CS0,
-                              i ? "collie.fl2" : "collie.fl1", FLASH_SIZE,
-                              dinfo ? blk_by_legacy_dinfo(dinfo) : NULL,
-                              FLASH_SECTOR_SIZE, 4, 0x00, 0x00, 0x00, 0x00, 0);
+        DeviceState *dev = qdev_new(TYPE_PFLASH_CFI01);
+        qdev_prop_set_string(dev, "name", i ? "collie.fl2" : "collie.fl1");
+        qdev_prop_set_drive(dev, "drive",
+                            dinfo ? blk_by_legacy_dinfo(dinfo) : NULL);
+        qdev_prop_set_uint32(dev, "num-blocks", FLASH_SIZE / FLASH_SECTOR_SIZE);
+        qdev_prop_set_uint64(dev, "sector-length", FLASH_SECTOR_SIZE);
+        qdev_prop_set_uint8(dev, "width", 4);
+        qdev_prop_set_bit(dev, "big-endian", false);
+        sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
+        sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, i ? SA_CS1 : SA_CS0);
     }
 
     sysbus_create_simple("scoop", 0x40800000, NULL);
diff --git a/hw/arm/gumstix.c b/hw/arm/gumstix.c
index 2ca4140c9f..639317394d 100644
--- a/hw/arm/gumstix.c
+++ b/hw/arm/gumstix.c
@@ -37,10 +37,12 @@
 #include "qemu/osdep.h"
 #include "qemu/units.h"
 #include "qemu/error-report.h"
+#include "qapi/error.h"
 #include "hw/arm/pxa.h"
 #include "net/net.h"
 #include "hw/block/flash.h"
 #include "hw/net/smc91c111.h"
+#include "hw/sysbus.h"
 #include "hw/boards.h"
 #include "exec/address-spaces.h"
 #include "sysemu/qtest.h"
@@ -58,6 +60,7 @@ static void connex_init(MachineState *machine)
 {
     PXA2xxState *cpu;
     DriveInfo *dinfo;
+    DeviceState *dev;
 
     cpu = pxa255_init(CONNEX_RAM_SIZE);
 
@@ -69,9 +72,17 @@ static void connex_init(MachineState *machine)
     }
 
     /* Numonyx RC28F128J3F75 */
-    pflash_cfi01_register(0x00000000, "connext.rom", CONNEX_FLASH_SIZE,
-                          dinfo ? blk_by_legacy_dinfo(dinfo) : NULL,
-                          FLASH_SECTOR_SIZE, 2, 0, 0, 0, 0, 0);
+    dev = qdev_new(TYPE_PFLASH_CFI01);
+    qdev_prop_set_string(dev, "name", "connext.rom");
+    qdev_prop_set_drive(dev, "drive",
+                        dinfo ? blk_by_legacy_dinfo(dinfo) : NULL);
+    qdev_prop_set_uint32(dev, "num-blocks",
+                         CONNEX_FLASH_SIZE / FLASH_SECTOR_SIZE);
+    qdev_prop_set_uint64(dev, "sector-length", FLASH_SECTOR_SIZE);
+    qdev_prop_set_uint8(dev, "width", 2);
+    qdev_prop_set_bit(dev, "big-endian", false);
+    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
+    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, 0x00000000);
 
     /* Interrupt line of NIC is connected to GPIO line 36 */
     smc91c111_init(&nd_table[0], 0x04000300,
@@ -82,6 +93,7 @@ static void verdex_init(MachineState *machine)
 {
     PXA2xxState *cpu;
     DriveInfo *dinfo;
+    DeviceState *dev;
 
     cpu = pxa270_init(VERDEX_RAM_SIZE, machine->cpu_type);
 
@@ -93,9 +105,17 @@ static void verdex_init(MachineState *machine)
     }
 
     /* Micron RC28F256P30TFA */
-    pflash_cfi01_register(0x00000000, "verdex.rom", VERDEX_FLASH_SIZE,
-                          dinfo ? blk_by_legacy_dinfo(dinfo) : NULL,
-                          FLASH_SECTOR_SIZE, 2, 0, 0, 0, 0, 0);
+    dev = qdev_new(TYPE_PFLASH_CFI01);
+    qdev_prop_set_string(dev, "name", "verdex.rom");
+    qdev_prop_set_drive(dev, "drive",
+                        dinfo ? blk_by_legacy_dinfo(dinfo) : NULL);
+    qdev_prop_set_uint32(dev, "num-blocks",
+                         VERDEX_FLASH_SIZE / FLASH_SECTOR_SIZE);
+    qdev_prop_set_uint64(dev, "sector-length", FLASH_SECTOR_SIZE);
+    qdev_prop_set_uint8(dev, "width", 2);
+    qdev_prop_set_bit(dev, "big-endian", false);
+    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
+    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, 0x00000000);
 
     /* Interrupt line of NIC is connected to GPIO line 99 */
     smc91c111_init(&nd_table[0], 0x04000300,
diff --git a/hw/arm/mainstone.c b/hw/arm/mainstone.c
index 68329c4617..b07193a375 100644
--- a/hw/arm/mainstone.c
+++ b/hw/arm/mainstone.c
@@ -129,12 +129,21 @@ static void mainstone_common_init(MachineState *machine,
 
     /* There are two 32MiB flash devices on the board */
     for (i = 0; i < 2; i ++) {
+        DeviceState *dev;
+
         dinfo = drive_get(IF_PFLASH, 0, i);
-        pflash_cfi01_register(mainstone_flash_base[i],
-                              i ? "mainstone.flash1" : "mainstone.flash0",
-                              MAINSTONE_FLASH_SIZE,
-                              dinfo ? blk_by_legacy_dinfo(dinfo) : NULL,
-                              FLASH_SECTOR_SIZE, 4, 0, 0, 0, 0, 0);
+        dev = qdev_new(TYPE_PFLASH_CFI01);
+        qdev_prop_set_string(dev, "name",
+                             i ? "mainstone.flash1" : "mainstone.flash0");
+        qdev_prop_set_drive(dev, "drive",
+                            dinfo ? blk_by_legacy_dinfo(dinfo) : NULL);
+        qdev_prop_set_uint32(dev, "num-blocks",
+                             MAINSTONE_FLASH_SIZE / FLASH_SECTOR_SIZE);
+        qdev_prop_set_uint64(dev, "sector-length", FLASH_SECTOR_SIZE);
+        qdev_prop_set_uint8(dev, "width", 4);
+        qdev_prop_set_bit(dev, "big-endian", false);
+        sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
+        sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, mainstone_flash_base[i]);
     }
 
     mst_irq = sysbus_create_simple("mainstone-fpga", MST_FPGA_PHYS,
diff --git a/hw/arm/omap_sx1.c b/hw/arm/omap_sx1.c
index 1d156bc344..7925ddd67e 100644
--- a/hw/arm/omap_sx1.c
+++ b/hw/arm/omap_sx1.c
@@ -31,8 +31,10 @@
 #include "ui/console.h"
 #include "hw/arm/omap.h"
 #include "hw/boards.h"
+#include "hw/sysbus.h"
 #include "hw/arm/boot.h"
 #include "hw/block/flash.h"
+#include "hw/qdev-properties.h"
 #include "sysemu/qtest.h"
 #include "exec/address-spaces.h"
 #include "cpu.h"
@@ -110,6 +112,7 @@ static void sx1_init(MachineState *machine, const int version)
     static uint32_t cs1val = 0x00215070;
     static uint32_t cs2val = 0x00001139;
     static uint32_t cs3val = 0x00001139;
+    DeviceState *dev;
     DriveInfo *dinfo;
     int fl_idx;
     uint32_t flash_size = FLASH0_SIZE;
@@ -152,10 +155,16 @@ static void sx1_init(MachineState *machine, const int version)
 
     fl_idx = 0;
     if ((dinfo = drive_get(IF_PFLASH, 0, fl_idx)) != NULL) {
-        pflash_cfi01_register(OMAP_CS0_BASE,
-                              "omap_sx1.flash0-1", flash_size,
-                              blk_by_legacy_dinfo(dinfo),
-                              SECTOR_SIZE, 4, 0, 0, 0, 0, 0);
+        dev = qdev_new(TYPE_PFLASH_CFI01);
+        qdev_prop_set_string(dev, "name", "omap_sx1.flash0-1");
+        qdev_prop_set_drive(dev, "drive",
+                            dinfo ? blk_by_legacy_dinfo(dinfo) : NULL);
+        qdev_prop_set_uint32(dev, "num-blocks", flash_size / SECTOR_SIZE);
+        qdev_prop_set_uint64(dev, "sector-length", SECTOR_SIZE);
+        qdev_prop_set_uint8(dev, "width", 4);
+        qdev_prop_set_bit(dev, "big-endian", false);
+        sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
+        sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, OMAP_CS0_BASE);
         fl_idx++;
     }
 
@@ -171,10 +180,16 @@ static void sx1_init(MachineState *machine, const int version)
         memory_region_add_subregion(address_space,
                                 OMAP_CS1_BASE + FLASH1_SIZE, &cs[1]);
 
-        pflash_cfi01_register(OMAP_CS1_BASE,
-                              "omap_sx1.flash1-1", FLASH1_SIZE,
-                              blk_by_legacy_dinfo(dinfo),
-                              SECTOR_SIZE, 4, 0, 0, 0, 0, 0);
+        dev = qdev_new(TYPE_PFLASH_CFI01);
+        qdev_prop_set_string(dev, "name", "omap_sx1.flash1-1");
+        qdev_prop_set_drive(dev, "drive",
+                            dinfo ? blk_by_legacy_dinfo(dinfo) : NULL);
+        qdev_prop_set_uint32(dev, "num-blocks", FLASH1_SIZE / SECTOR_SIZE);
+        qdev_prop_set_uint64(dev, "sector-length", SECTOR_SIZE);
+        qdev_prop_set_uint8(dev, "width", 4);
+        qdev_prop_set_bit(dev, "big-endian", false);
+        sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
+        sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, OMAP_CS1_BASE);
         fl_idx++;
     } else {
         memory_region_init_io(&cs[1], NULL, &static_ops, &cs1val,
diff --git a/hw/arm/versatilepb.c b/hw/arm/versatilepb.c
index 43172d72ea..e5da688fe4 100644
--- a/hw/arm/versatilepb.c
+++ b/hw/arm/versatilepb.c
@@ -385,11 +385,19 @@ static void versatile_init(MachineState *machine, int board_id)
     /* 0x34000000 NOR Flash */
 
     dinfo = drive_get(IF_PFLASH, 0, 0);
-    pflash_cfi01_register(VERSATILE_FLASH_ADDR, "versatile.flash",
-                          VERSATILE_FLASH_SIZE,
-                          dinfo ? blk_by_legacy_dinfo(dinfo) : NULL,
-                          VERSATILE_FLASH_SECT_SIZE,
-                          4, 0x0089, 0x0018, 0x0000, 0x0, 0);
+    dev = qdev_new(TYPE_PFLASH_CFI01);
+    qdev_prop_set_string(dev, "name", "versatile.flash");
+    qdev_prop_set_drive(dev, "drive",
+                        dinfo ? blk_by_legacy_dinfo(dinfo) : NULL);
+    qdev_prop_set_uint32(dev, "num-blocks",
+                         VERSATILE_FLASH_SIZE / VERSATILE_FLASH_SECT_SIZE);
+    qdev_prop_set_uint64(dev, "sector-length", VERSATILE_FLASH_SECT_SIZE);
+    qdev_prop_set_uint8(dev, "width", 4);
+    qdev_prop_set_bit(dev, "big-endian", false);
+    qdev_prop_set_uint16(dev, "id0", 0x0089);
+    qdev_prop_set_uint16(dev, "id1", 0x0018);
+    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
+    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, VERSATILE_FLASH_ADDR);
 
     versatile_binfo.ram_size = machine->ram_size;
     versatile_binfo.board_id = board_id;
diff --git a/hw/arm/z2.c b/hw/arm/z2.c
index dc25304290..867aef7d87 100644
--- a/hw/arm/z2.c
+++ b/hw/arm/z2.c
@@ -13,14 +13,17 @@
 
 #include "qemu/osdep.h"
 #include "qemu/units.h"
+#include "qapi/error.h"
 #include "hw/arm/pxa.h"
 #include "hw/arm/boot.h"
 #include "hw/i2c/i2c.h"
 #include "hw/irq.h"
 #include "hw/ssi/ssi.h"
 #include "migration/vmstate.h"
+#include "hw/sysbus.h"
 #include "hw/boards.h"
 #include "hw/block/flash.h"
+#include "hw/qdev-properties.h"
 #include "ui/console.h"
 #include "hw/audio/wm8750.h"
 #include "audio/audio.h"
@@ -307,14 +310,22 @@ static void z2_init(MachineState *machine)
     void *z2_lcd;
     I2CBus *bus;
     DeviceState *wm;
+    DeviceState *dev;
 
     /* Setup CPU & memory */
     mpu = pxa270_init(z2_binfo.ram_size, machine->cpu_type);
 
     dinfo = drive_get(IF_PFLASH, 0, 0);
-    pflash_cfi01_register(Z2_FLASH_BASE, "z2.flash0", Z2_FLASH_SIZE,
-                          dinfo ? blk_by_legacy_dinfo(dinfo) : NULL,
-                          FLASH_SECTOR_SIZE, 4, 0, 0, 0, 0, 0);
+    dev = qdev_new(TYPE_PFLASH_CFI01);
+    qdev_prop_set_string(dev, "name", "z2.flash0");
+    qdev_prop_set_drive(dev, "drive",
+                        dinfo ? blk_by_legacy_dinfo(dinfo) : NULL);
+    qdev_prop_set_uint32(dev, "num-blocks", Z2_FLASH_SIZE / FLASH_SECTOR_SIZE);
+    qdev_prop_set_uint64(dev, "sector-length", FLASH_SECTOR_SIZE);
+    qdev_prop_set_uint8(dev, "width", 4);
+    qdev_prop_set_bit(dev, "big-endian", false);
+    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
+    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, Z2_FLASH_BASE);
 
     /* setup keypad */
     pxa27x_register_keypad(mpu->kp, map, 0x100);
-- 
2.38.1


