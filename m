Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 796C45FFF3D
	for <lists+qemu-devel@lfdr.de>; Sun, 16 Oct 2022 14:42:57 +0200 (CEST)
Received: from localhost ([::1]:45900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ok2ym-0008Ut-GT
	for lists+qemu-devel@lfdr.de; Sun, 16 Oct 2022 08:42:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1ok2kt-0002VL-Ev; Sun, 16 Oct 2022 08:28:35 -0400
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:35808)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1ok2kr-0000Qr-DI; Sun, 16 Oct 2022 08:28:35 -0400
Received: by mail-ej1-x631.google.com with SMTP id k2so19445432ejr.2;
 Sun, 16 Oct 2022 05:28:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cSCL1Ge340MOLsJbNs8WRE5yUKjbTgFBMKoLfI3Ami8=;
 b=HWrzsp3wBj2P5rbLGfZPG68FUfQ9ptwqP+IBUJ2oK45cySWrbpAvgSFQ5/CbhtkELi
 j7ZSQK7wEQXx7C9vxSuEjizZnmgdMWHHBE/ylUSaDjQLM1qOGYxR0ScphcZVBs41CWme
 GcSydz0H41i8pPhVvvGIUcTtrwj3JMUKe1KU5iTAu0PiX3WASbbjo2VmNEDC5mAHKaIk
 pff6lQvMgbR05Xg4iP/LoGXLxNzj4DW0VHD+rMIWRyCtDeW53kNQaMOipiWdBfkirJy7
 ckHg6ZtI5HUuRGifD//PzArnydgTAi/tWySS4iCc3rNC4ZOfatIy1rDn+oGEJH9PFhLQ
 SrPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cSCL1Ge340MOLsJbNs8WRE5yUKjbTgFBMKoLfI3Ami8=;
 b=bXD1j+4fvfDMWY/IlgxU4FyQWizJ3qeJLA/xASi8Zgg+m9esDKDi9Nbk4XeCOH4IO3
 Wqr2ZnfdUw2ODeAYfZ/bw2zi/pqeB7RqvKWemXv2g0K8mBLncqPPqifUAhLOQ+3sgaCz
 pZLjLJ6ErCaTMemMkpwKCZEk18nXizFZFvj18eEx+P0twcceoTUmtvSzWIo32XHD+8l8
 M/tZJgA9CG9O7JSQhN2C05jXK3FWvpCZdsb+9SsN6IcTk7EzSx88dxF6GkhAzh4GYTra
 8tns7j5RHiIhaq7IVtp5YCp0z9UUexRCYg19mrudyIU1mO5Yq1CuN0D0veGucLQy4ffp
 IPWg==
X-Gm-Message-State: ACrzQf2Esv1JQxC/Zpy1cV/pLBIqD/RFJi/dd+csI1nCAY2B5NYtkYoU
 clFsUK1RhTWVD1RcVdcTKcY3Sper02U=
X-Google-Smtp-Source: AMsMyM5IIFgZwm1w47fOgZta48zk/hdEDx81b46lOGCR/ws39a2IF/6ddP9lPiTykx7HbQHQ2Fiweg==
X-Received: by 2002:a17:907:2672:b0:780:8bb5:25a3 with SMTP id
 ci18-20020a170907267200b007808bb525a3mr4968641ejc.281.1665923310314; 
 Sun, 16 Oct 2022 05:28:30 -0700 (PDT)
Received: from localhost.localdomain
 (dynamic-089-014-006-139.89.14.pool.telefonica.de. [89.14.6.139])
 by smtp.gmail.com with ESMTPSA id
 k17-20020aa7c391000000b00456cbd8c65bsm5504467edq.6.2022.10.16.05.28.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Oct 2022 05:28:30 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm@nongnu.org, Alistair Francis <alistair@alistair23.me>,
 Jan Kiszka <jan.kiszka@web.de>, Magnus Damm <magnus.damm@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Bin Meng <bin.meng@windriver.com>, Aurelien Jarno <aurelien@aurel32.net>,
 qemu-ppc@nongnu.org, BALATON Zoltan <balaton@eik.bme.hu>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Antony Pavlov <antonynpavlov@gmail.com>, Hanna Reitz <hreitz@redhat.com>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v3 4/9] hw/block/pflash_cfi02: Attach memory region in boards
Date: Sun, 16 Oct 2022 14:27:32 +0200
Message-Id: <20221016122737.93755-5-shentey@gmail.com>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20221016122737.93755-1-shentey@gmail.com>
References: <20221016122737.93755-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

pflash_cfi02_register() had a parameter which was only passed to
sysbus_mmio_map() but not used otherwise. Pulling out sysbus_mmio_map()
resolves that parameter and concentrates the memory region setup in
board code. Furthermore, it allows attaching cfi02 devices relative to
some parent bus rather than to the global "sysbus".

While at it, replace sysbus_mmio_map() with non-sysbus equivalents.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/arm/digic_boards.c    | 16 ++++++++++------
 hw/arm/musicpal.c        | 15 +++++++++------
 hw/arm/xilinx_zynq.c     | 12 +++++++-----
 hw/block/pflash_cfi02.c  |  9 ++++++---
 hw/sh4/r2d.c             | 11 +++++++----
 include/hw/block/flash.h |  4 ++--
 6 files changed, 41 insertions(+), 26 deletions(-)

diff --git a/hw/arm/digic_boards.c b/hw/arm/digic_boards.c
index 4093af09cb..d3c5426cf9 100644
--- a/hw/arm/digic_boards.c
+++ b/hw/arm/digic_boards.c
@@ -116,12 +116,16 @@ static void digic4_add_k8p3215uqb_rom(DigicState *s, hwaddr addr,
 #define FLASH_K8P3215UQB_SIZE (4 * 1024 * 1024)
 #define FLASH_K8P3215UQB_SECTOR_SIZE (64 * 1024)
 
-    pflash_cfi02_register(addr, "pflash", FLASH_K8P3215UQB_SIZE,
-                          NULL, FLASH_K8P3215UQB_SECTOR_SIZE,
-                          DIGIC4_ROM_MAX_SIZE / FLASH_K8P3215UQB_SIZE,
-                          4,
-                          0x00EC, 0x007E, 0x0003, 0x0001,
-                          0x0555, 0x2aa, 0);
+    PFlashCFI02 *pfl;
+
+    pfl = pflash_cfi02_register("pflash", FLASH_K8P3215UQB_SIZE,
+                                NULL, FLASH_K8P3215UQB_SECTOR_SIZE,
+                                DIGIC4_ROM_MAX_SIZE / FLASH_K8P3215UQB_SIZE,
+                                4,
+                                0x00EC, 0x007E, 0x0003, 0x0001,
+                                0x0555, 0x2aa, 0);
+    memory_region_add_subregion(get_system_memory(), addr,
+                                pflash_cfi02_get_memory(pfl));
 
     digic_load_rom(s, addr, FLASH_K8P3215UQB_SIZE, filename);
 }
diff --git a/hw/arm/musicpal.c b/hw/arm/musicpal.c
index b65c020115..efad741f6d 100644
--- a/hw/arm/musicpal.c
+++ b/hw/arm/musicpal.c
@@ -1261,6 +1261,7 @@ static void musicpal_init(MachineState *machine)
     /* Register flash */
     dinfo = drive_get(IF_PFLASH, 0, 0);
     if (dinfo) {
+        PFlashCFI02 *pfl;
         BlockBackend *blk = blk_by_legacy_dinfo(dinfo);
 
         flash_size = blk_getlength(blk);
@@ -1275,12 +1276,14 @@ static void musicpal_init(MachineState *machine)
          * 0xFF800000 (if there is 8 MB flash). So remap flash access if the
          * image is smaller than 32 MB.
          */
-        pflash_cfi02_register(0x100000000ULL - MP_FLASH_SIZE_MAX,
-                              "musicpal.flash", flash_size,
-                              blk, 0x10000,
-                              MP_FLASH_SIZE_MAX / flash_size,
-                              2, 0x00BF, 0x236D, 0x0000, 0x0000,
-                              0x5555, 0x2AAA, 0);
+        pfl = pflash_cfi02_register("musicpal.flash", flash_size,
+                                    blk, 0x10000,
+                                    MP_FLASH_SIZE_MAX / flash_size,
+                                    2, 0x00BF, 0x236D, 0x0000, 0x0000,
+                                    0x5555, 0x2AAA, 0);
+        memory_region_add_subregion(address_space_mem,
+                                    0x100000000ULL - MP_FLASH_SIZE_MAX,
+                                    pflash_cfi02_get_memory(pfl));
     }
     sysbus_create_simple(TYPE_MV88W8618_FLASHCFG, MP_FLASHCFG_BASE, NULL);
 
diff --git a/hw/arm/xilinx_zynq.c b/hw/arm/xilinx_zynq.c
index 3190cc0b8d..a2abb1cf31 100644
--- a/hw/arm/xilinx_zynq.c
+++ b/hw/arm/xilinx_zynq.c
@@ -182,6 +182,7 @@ static void zynq_init(MachineState *machine)
     MemoryRegion *ocm_ram = g_new(MemoryRegion, 1);
     DeviceState *dev, *slcr;
     SysBusDevice *busdev;
+    PFlashCFI02 *pfl;
     qemu_irq pic[64];
     int n;
 
@@ -218,11 +219,12 @@ static void zynq_init(MachineState *machine)
     DriveInfo *dinfo = drive_get(IF_PFLASH, 0, 0);
 
     /* AMD */
-    pflash_cfi02_register(0xe2000000, "zynq.pflash", FLASH_SIZE,
-                          dinfo ? blk_by_legacy_dinfo(dinfo) : NULL,
-                          FLASH_SECTOR_SIZE, 1,
-                          1, 0x0066, 0x0022, 0x0000, 0x0000, 0x0555, 0x2aa,
-                          0);
+    pfl = pflash_cfi02_register("zynq.pflash", FLASH_SIZE,
+                                dinfo ? blk_by_legacy_dinfo(dinfo) : NULL,
+                                FLASH_SECTOR_SIZE, 1, 1, 0x0066, 0x0022, 0x0000,
+                                0x0000, 0x0555, 0x2aa, 0);
+    memory_region_add_subregion(address_space_mem, 0xe2000000,
+                                pflash_cfi02_get_memory(pfl));
 
     /* Create the main clock source, and feed slcr with it */
     zynq_machine->ps_clk = CLOCK(object_new(TYPE_CLOCK));
diff --git a/hw/block/pflash_cfi02.c b/hw/block/pflash_cfi02.c
index ff2fe154c1..60039e0d52 100644
--- a/hw/block/pflash_cfi02.c
+++ b/hw/block/pflash_cfi02.c
@@ -999,8 +999,7 @@ static void pflash_cfi02_register_types(void)
 
 type_init(pflash_cfi02_register_types)
 
-PFlashCFI02 *pflash_cfi02_register(hwaddr base,
-                                   const char *name,
+PFlashCFI02 *pflash_cfi02_register(const char *name,
                                    hwaddr size,
                                    BlockBackend *blk,
                                    uint32_t sector_len,
@@ -1031,6 +1030,10 @@ PFlashCFI02 *pflash_cfi02_register(hwaddr base,
     qdev_prop_set_string(dev, "name", name);
     sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
 
-    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, base);
     return PFLASH_CFI02(dev);
 }
+
+MemoryRegion *pflash_cfi02_get_memory(PFlashCFI02 *fl)
+{
+    return sysbus_mmio_get_region(SYS_BUS_DEVICE(fl), 0);
+}
diff --git a/hw/sh4/r2d.c b/hw/sh4/r2d.c
index 39fc4f19d9..0af8f0e137 100644
--- a/hw/sh4/r2d.c
+++ b/hw/sh4/r2d.c
@@ -239,6 +239,7 @@ static void r2d_init(MachineState *machine)
     MemoryRegion *sdram = g_new(MemoryRegion, 1);
     qemu_irq *irq;
     DriveInfo *dinfo;
+    PFlashCFI02 *pfl;
     int i;
     DeviceState *dev;
     SysBusDevice *busdev;
@@ -302,10 +303,12 @@ static void r2d_init(MachineState *machine)
      * addressable in words of 16bit.
      */
     dinfo = drive_get(IF_PFLASH, 0, 0);
-    pflash_cfi02_register(0x0, "r2d.flash", FLASH_SIZE,
-                          dinfo ? blk_by_legacy_dinfo(dinfo) : NULL,
-                          64 * KiB, 1, 2, 0x0001, 0x227e, 0x2220, 0x2200,
-                          0x555, 0x2aa, 0);
+    pfl = pflash_cfi02_register("r2d.flash", FLASH_SIZE,
+                                dinfo ? blk_by_legacy_dinfo(dinfo) : NULL,
+                                64 * KiB, 1, 2, 0x0001, 0x227e, 0x2220, 0x2200,
+                                0x555, 0x2aa, 0);
+    memory_region_add_subregion(get_system_memory(), 0x0,
+                                pflash_cfi02_get_memory(pfl));
 
     /* NIC: rtl8139 on-board, and 2 slots. */
     for (i = 0; i < nb_nics; i++)
diff --git a/include/hw/block/flash.h b/include/hw/block/flash.h
index 5f9ba18de1..52d6bcd56a 100644
--- a/include/hw/block/flash.h
+++ b/include/hw/block/flash.h
@@ -30,8 +30,7 @@ void pflash_cfi01_legacy_drive(PFlashCFI01 *dev, DriveInfo *dinfo);
 OBJECT_DECLARE_SIMPLE_TYPE(PFlashCFI02, PFLASH_CFI02)
 
 
-PFlashCFI02 *pflash_cfi02_register(hwaddr base,
-                                   const char *name,
+PFlashCFI02 *pflash_cfi02_register(const char *name,
                                    hwaddr size,
                                    BlockBackend *blk,
                                    uint32_t sector_len,
@@ -42,6 +41,7 @@ PFlashCFI02 *pflash_cfi02_register(hwaddr base,
                                    uint16_t unlock_addr0,
                                    uint16_t unlock_addr1,
                                    int be);
+MemoryRegion *pflash_cfi02_get_memory(PFlashCFI02 *fl);
 
 /* nand.c */
 DeviceState *nand_init(BlockBackend *blk, int manf_id, int chip_id);
-- 
2.38.0


