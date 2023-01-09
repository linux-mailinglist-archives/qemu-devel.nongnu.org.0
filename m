Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AE8F6625BF
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 13:41:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEqxp-00005R-F6; Mon, 09 Jan 2023 07:09:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEqxc-0008SN-JN
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 07:09:09 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEqxZ-0005vu-0r
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 07:09:03 -0500
Received: by mail-wr1-x42a.google.com with SMTP id m7so7918749wrn.10
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 04:09:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YmWTgYpjzFxLJgTFXyJSPWbDedSuFpqteXaP2VxVj1k=;
 b=OKqh6KgMT3hOK1Vs3PyaDnAbyJbSGSdXuKkXDrjMgSCC+8e2DvrNOSoXS4Cl6of0dE
 hqvrWoKwnu/P8TuewkssFPC2fhSvigw2SPwIHAeFlztvhq+z24hfTsAkR6lmSo4CAb38
 YgSTP9PSvY+1tiwI9+G1onAk1PZtjPZEex3+Nr0xzJ2xLSD00jFPizMYccrN3O8SnJ0O
 TA01YKpe+Svq0OaOXlNo+qE8uBav90RiWbIyOguBqvP5Q0Ipecske7lyStu25VVTIGUN
 3Xb35agv3p2UgYPw8TLO+9j+Zq76O4a7AnJTDnEeNZ3xM84G8GPdEFEmlr/ZVXLor6Z2
 ozqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YmWTgYpjzFxLJgTFXyJSPWbDedSuFpqteXaP2VxVj1k=;
 b=5bSMMB+0M6K0pHT5kD/TBVzAlmzYa4AJi0BRCtUSaVkuRSOemG5uPhVIKB6UJVOZ0c
 qTPZxE3LvDkZYQv7PaLnq44P9UcKO7oKlk6U45zpGJKxGzWvF4Jj6Jgvvn6CbOPomySK
 skBxYj89Td+sSsvvtANkdepq8g4waUpAtVl2du6ZQw9FXg7k6vv4Ojdum28Ha7ZOF61N
 +/XNVCGTuZu3Mrx8U7/XQLWXdUO6Qw0iU1AbVRT2/xe/azCpRfc+XfHEAKRTwXhONWHt
 xx83xYKXStkeR1r4sqqvaSlxUA0XAultbC1Ak2iW3YP01DgUv3QfaaOdS2dwFmO/vftx
 +TCw==
X-Gm-Message-State: AFqh2kqJXGWajKkdnEhb2gazm8xcTGWBLEOk6qAav/YGtNzQW1BOdx/2
 lI0E66hlV2jbqJzOl6Ro2tMtNHe2Pcdr5rtf
X-Google-Smtp-Source: AMrXdXsIzV7kWIepcWItji0/IVntvPgnaA+4CF8RBU0IjPWSwGVhiXg3eXsdpVrMz7w06gzSV31GTw==
X-Received: by 2002:a5d:4143:0:b0:290:3629:a824 with SMTP id
 c3-20020a5d4143000000b002903629a824mr25675342wrq.40.1673266139342; 
 Mon, 09 Jan 2023 04:08:59 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 q11-20020adf9dcb000000b00268aae5fb5bsm8533302wre.3.2023.01.09.04.08.58
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 09 Jan 2023 04:08:58 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Bin Meng <bmeng.cn@gmail.com>
Subject: [PATCH v2 05/21] hw/arm: Use generic DeviceState instead of
 PFlashCFI01
Date: Mon,  9 Jan 2023 13:08:17 +0100
Message-Id: <20230109120833.3330-6-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230109120833.3330-1-philmd@linaro.org>
References: <20230109120833.3330-1-philmd@linaro.org>
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

Nothing here requires access to PFlashCFI01 internal fields:
use the inherited generic DeviceState.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
---
 hw/arm/sbsa-ref.c     | 12 ++++++------
 hw/arm/vexpress.c     | 10 ++++------
 hw/arm/virt.c         | 10 +++++-----
 include/hw/arm/virt.h |  3 +--
 4 files changed, 16 insertions(+), 19 deletions(-)

diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
index 1d29e8ca7f..8e60e0e58d 100644
--- a/hw/arm/sbsa-ref.c
+++ b/hw/arm/sbsa-ref.c
@@ -91,7 +91,7 @@ struct SBSAMachineState {
     int fdt_size;
     int psci_conduit;
     DeviceState *gic;
-    PFlashCFI01 *flash[2];
+    DeviceState *flash[2];
 };
 
 #define TYPE_SBSA_MACHINE   MACHINE_TYPE_NAME("sbsa-ref")
@@ -264,7 +264,7 @@ static void create_fdt(SBSAMachineState *sms)
 
 #define SBSA_FLASH_SECTOR_SIZE (256 * KiB)
 
-static PFlashCFI01 *sbsa_flash_create1(SBSAMachineState *sms,
+static DeviceState *sbsa_flash_create1(SBSAMachineState *sms,
                                         const char *name,
                                         const char *alias_prop_name)
 {
@@ -286,7 +286,7 @@ static PFlashCFI01 *sbsa_flash_create1(SBSAMachineState *sms,
     object_property_add_child(OBJECT(sms), name, OBJECT(dev));
     object_property_add_alias(OBJECT(sms), alias_prop_name,
                               OBJECT(dev), "drive");
-    return PFLASH_CFI01(dev);
+    return dev;
 }
 
 static void sbsa_flash_create(SBSAMachineState *sms)
@@ -295,7 +295,7 @@ static void sbsa_flash_create(SBSAMachineState *sms)
     sms->flash[1] = sbsa_flash_create1(sms, "sbsa.flash1", "pflash1");
 }
 
-static void sbsa_flash_map1(PFlashCFI01 *flash,
+static void sbsa_flash_map1(DeviceState *flash,
                             hwaddr base, hwaddr size,
                             MemoryRegion *sysmem)
 {
@@ -340,13 +340,13 @@ static bool sbsa_firmware_init(SBSAMachineState *sms,
 
     /* Map legacy -drive if=pflash to machine properties */
     for (i = 0; i < ARRAY_SIZE(sms->flash); i++) {
-        pflash_cfi01_legacy_drive(DEVICE(sms->flash[i]),
+        pflash_cfi01_legacy_drive(sms->flash[i],
                                   drive_get(IF_PFLASH, 0, i));
     }
 
     sbsa_flash_map(sms, sysmem, secure_sysmem);
 
-    pflash_blk0 = pflash_cfi01_get_blk(DEVICE(sms->flash[0]));
+    pflash_blk0 = pflash_cfi01_get_blk(sms->flash[0]);
 
     bios_name = MACHINE(sms)->firmware;
     if (bios_name) {
diff --git a/hw/arm/vexpress.c b/hw/arm/vexpress.c
index 757236767b..a35472e7e2 100644
--- a/hw/arm/vexpress.c
+++ b/hw/arm/vexpress.c
@@ -508,7 +508,7 @@ static void vexpress_modify_dtb(const struct arm_boot_info *info, void *fdt)
 /* Open code a private version of pflash registration since we
  * need to set non-default device width for VExpress platform.
  */
-static PFlashCFI01 *ve_pflash_cfi01_register(hwaddr base, const char *name,
+static DeviceState *ve_pflash_cfi01_register(hwaddr base, const char *name,
                                              DriveInfo *di)
 {
     DeviceState *dev = qdev_new(TYPE_PFLASH_CFI01);
@@ -531,7 +531,7 @@ static PFlashCFI01 *ve_pflash_cfi01_register(hwaddr base, const char *name,
     sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
 
     sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, base);
-    return PFLASH_CFI01(dev);
+    return dev;
 }
 
 static void vexpress_common_init(MachineState *machine)
@@ -543,7 +543,6 @@ static void vexpress_common_init(MachineState *machine)
     qemu_irq pic[64];
     uint32_t sys_id;
     DriveInfo *dinfo;
-    PFlashCFI01 *pflash0;
     I2CBus *i2c;
     ram_addr_t vram_size, sram_size;
     MemoryRegion *sysmem = get_system_memory();
@@ -657,12 +656,11 @@ static void vexpress_common_init(MachineState *machine)
     sysbus_create_simple("pl111", map[VE_CLCD], pic[14]);
 
     dinfo = drive_get(IF_PFLASH, 0, 0);
-    pflash0 = ve_pflash_cfi01_register(map[VE_NORFLASH0], "vexpress.flash0",
-                                       dinfo);
+    dev = ve_pflash_cfi01_register(map[VE_NORFLASH0], "vexpress.flash0", dinfo);
 
     if (map[VE_NORFLASHALIAS] != -1) {
         /* Map flash 0 as an alias into low memory */
-        flash0mem = sysbus_mmio_get_region(SYS_BUS_DEVICE(pflash0), 0);
+        flash0mem = sysbus_mmio_get_region(SYS_BUS_DEVICE(dev), 0);
         memory_region_init_alias(flashalias, NULL, "vexpress.flashalias",
                                  flash0mem, 0, VEXPRESS_FLASH_SIZE);
         memory_region_add_subregion(sysmem, map[VE_NORFLASHALIAS], flashalias);
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 57726b0f52..e47070105d 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1105,7 +1105,7 @@ static void create_virtio_devices(const VirtMachineState *vms)
 
 #define VIRT_FLASH_SECTOR_SIZE (256 * KiB)
 
-static PFlashCFI01 *virt_flash_create1(VirtMachineState *vms,
+static DeviceState *virt_flash_create1(VirtMachineState *vms,
                                         const char *name,
                                         const char *alias_prop_name)
 {
@@ -1127,7 +1127,7 @@ static PFlashCFI01 *virt_flash_create1(VirtMachineState *vms,
     object_property_add_child(OBJECT(vms), name, OBJECT(dev));
     object_property_add_alias(OBJECT(vms), alias_prop_name,
                               OBJECT(dev), "drive");
-    return PFLASH_CFI01(dev);
+    return dev;
 }
 
 static void virt_flash_create(VirtMachineState *vms)
@@ -1136,7 +1136,7 @@ static void virt_flash_create(VirtMachineState *vms)
     vms->flash[1] = virt_flash_create1(vms, "virt.flash1", "pflash1");
 }
 
-static void virt_flash_map1(PFlashCFI01 *flash,
+static void virt_flash_map1(DeviceState *flash,
                             hwaddr base, hwaddr size,
                             MemoryRegion *sysmem)
 {
@@ -1227,13 +1227,13 @@ static bool virt_firmware_init(VirtMachineState *vms,
 
     /* Map legacy -drive if=pflash to machine properties */
     for (i = 0; i < ARRAY_SIZE(vms->flash); i++) {
-        pflash_cfi01_legacy_drive(DEVICE(vms->flash[i]),
+        pflash_cfi01_legacy_drive(vms->flash[i],
                                   drive_get(IF_PFLASH, 0, i));
     }
 
     virt_flash_map(vms, sysmem, secure_sysmem);
 
-    pflash_blk0 = pflash_cfi01_get_blk(DEVICE(vms->flash[0]));
+    pflash_blk0 = pflash_cfi01_get_blk(vms->flash[0]);
 
     bios_name = MACHINE(vms)->firmware;
     if (bios_name) {
diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index c7dd59d7f1..817b43b248 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -34,7 +34,6 @@
 #include "qemu/notify.h"
 #include "hw/boards.h"
 #include "hw/arm/boot.h"
-#include "hw/block/flash.h"
 #include "sysemu/kvm.h"
 #include "hw/intc/arm_gicv3_common.h"
 #include "qom/object.h"
@@ -142,7 +141,7 @@ struct VirtMachineState {
     Notifier machine_done;
     DeviceState *platform_bus_dev;
     FWCfgState *fw_cfg;
-    PFlashCFI01 *flash[2];
+    DeviceState *flash[2];
     bool secure;
     bool highmem;
     bool highmem_compact;
-- 
2.38.1


