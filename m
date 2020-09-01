Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3814C25854F
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Sep 2020 03:48:01 +0200 (CEST)
Received: from localhost ([::1]:52876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kCvOy-0007aK-9f
	for lists+qemu-devel@lfdr.de; Mon, 31 Aug 2020 21:48:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kCvI7-0004kL-Vb; Mon, 31 Aug 2020 21:40:56 -0400
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:33225)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kCvI5-0005bU-S6; Mon, 31 Aug 2020 21:40:55 -0400
Received: by mail-pf1-x444.google.com with SMTP id u20so1746237pfn.0;
 Mon, 31 Aug 2020 18:40:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=g53gh0EtRZfDlEpQMWpEw6Oy20o9ZbozllHOwNXew38=;
 b=iKNBG9DtSdYtJzjkHhlh+z3npe5nJ0d7tHR2AY+QaI5pkvjkOMLcc8lBlvxSZeUijw
 yUL9cLfL3DZV0kb3LL3KGxKrALfMp8sq22buHP6lv+bQ7p/zhKIgp+3YizYNNHazeJeo
 aJdzUyVPkvczi4pfYUhULOouzlYdrMLyBnQBRe7kVpRldrq54TRG+GJhiXrR4YcE6WrC
 tUr3EgbOuGACxakCZJ8mF1CanQ1k7+jLeW8UZ+3f9ubzyBJ9cRzqlzyKyXGwENWAK6j4
 t/nV3OJGm5HphKiDU9kRy24rsdwsKLm/8RoJeKwR9Tww4qy2cfz1+FKff2JrCrUGUfTX
 Lf3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=g53gh0EtRZfDlEpQMWpEw6Oy20o9ZbozllHOwNXew38=;
 b=Ow9kE5Sm0dqRksKhF4Y90uZf5b4awLVm53OEhVFOGrkMwrOMRE7UlMSXDL5qjxVJD5
 tg4FCOxK/bCceiC/eNdWnvSzTCkCeSkGPQqG7YIlFu/hop2WUM1XDRaGy1ZjpFhu5rnM
 W9D3U01h+0w/iV8rWrV3N1Z9I1YxzpdIP7hihwNU1cIvVhEYsWHKtPbLOkr/gTjJK4Gn
 i3GWcKtT/RbO4aWiCVYrobbMuRmhH41QekCPtFDjVu0R6MHU+y1qxSrrkCJDLFIlBDvu
 ukseledelroqmpjemNKpdooHTMOR0jpkrjD+rCm8jVd2oCVKw5l6+4CACdTI7jkNVjtu
 mKSw==
X-Gm-Message-State: AOAM531RNRi90iQVRnp2R/aiuqrhbptCSI9lElQad2O6VVdjZQbsOBh6
 UqsiFQF/5KZ//0GNHmcmniJcZ2VHTfQ=
X-Google-Smtp-Source: ABdhPJzQyZWaz+yozud+Uq+QanPt+QmJxwB1/j1sG30xNoAfWkbi6N11urWEdH05yIVQSgfLDdsrow==
X-Received: by 2002:a63:6503:: with SMTP id z3mr3554223pgb.421.1598924452215; 
 Mon, 31 Aug 2020 18:40:52 -0700 (PDT)
Received: from pek-vx-bsp2.wrs.com (unknown-146-144.windriver.com.
 [147.11.146.144])
 by smtp.gmail.com with ESMTPSA id l13sm8887520pgq.33.2020.08.31.18.40.49
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 31 Aug 2020 18:40:51 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <Alistair.Francis@wdc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Palmer Dabbelt <palmerdabbelt@google.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Subject: [PATCH v3 08/16] hw/riscv: microchip_pfsoc: Connect a Cadence SDHCI
 controller and an SD card
Date: Tue,  1 Sep 2020 09:39:03 +0800
Message-Id: <1598924352-89526-9-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1598924352-89526-1-git-send-email-bmeng.cn@gmail.com>
References: <1598924352-89526-1-git-send-email-bmeng.cn@gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::444;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pf1-x444.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bin.meng@windriver.com>

Microchip PolarFire SoC integrates one Cadence SDHCI controller.
On the Icicle Kit board, one eMMC chip and an external SD card
connect to this controller depending on different configuration.

As QEMU does not support eMMC yet, we just emulate the SD card
configuration. To test this, the Hart Software Services (HSS)
should choose the SD card configuration:

$ cp boards/icicle-kit-es/def_config.sdcard .config
$ make BOARD=icicle-kit-es

The SD card image can be built from the Yocto BSP at:
https://github.com/polarfire-soc/meta-polarfire-soc-yocto-bsp

Note the generated SD card image should be resized before use:
$ qemu-img resize /path/to/sdcard.img 4G

Launch QEMU with the following command:
$ qemu-system-riscv64 -nographic -M microchip-icicle-kit -sd sdcard.img

Signed-off-by: Bin Meng <bin.meng@windriver.com>

---

(no changes since v2)

Changes in v2:
- do not initialize TYPE_SYSBUS_SDHCI in the SoC instance_init(),
  instead move that to the cadence_sdhci model
- do not access generic-sdhci's state directly,
  instead move that to the cadence_sdhci model

 include/hw/riscv/microchip_pfsoc.h |  4 ++++
 hw/riscv/microchip_pfsoc.c         | 23 +++++++++++++++++++++++
 hw/riscv/Kconfig                   |  1 +
 3 files changed, 28 insertions(+)

diff --git a/include/hw/riscv/microchip_pfsoc.h b/include/hw/riscv/microchip_pfsoc.h
index a5efa1d..d810ee8 100644
--- a/include/hw/riscv/microchip_pfsoc.h
+++ b/include/hw/riscv/microchip_pfsoc.h
@@ -23,6 +23,7 @@
 #define HW_MICROCHIP_PFSOC_H
 
 #include "hw/char/mchp_pfsoc_mmuart.h"
+#include "hw/sd/cadence_sdhci.h"
 
 typedef struct MicrochipPFSoCState {
     /*< private >*/
@@ -39,6 +40,7 @@ typedef struct MicrochipPFSoCState {
     MchpPfSoCMMUartState *serial2;
     MchpPfSoCMMUartState *serial3;
     MchpPfSoCMMUartState *serial4;
+    CadenceSDHCIState sdhci;
 } MicrochipPFSoCState;
 
 #define TYPE_MICROCHIP_PFSOC    "microchip.pfsoc"
@@ -74,6 +76,7 @@ enum {
     MICROCHIP_PFSOC_MMUART0,
     MICROCHIP_PFSOC_SYSREG,
     MICROCHIP_PFSOC_MPUCFG,
+    MICROCHIP_PFSOC_EMMC_SD,
     MICROCHIP_PFSOC_MMUART1,
     MICROCHIP_PFSOC_MMUART2,
     MICROCHIP_PFSOC_MMUART3,
@@ -85,6 +88,7 @@ enum {
 };
 
 enum {
+    MICROCHIP_PFSOC_EMMC_SD_IRQ = 88,
     MICROCHIP_PFSOC_MMUART0_IRQ = 90,
     MICROCHIP_PFSOC_MMUART1_IRQ = 91,
     MICROCHIP_PFSOC_MMUART2_IRQ = 92,
diff --git a/hw/riscv/microchip_pfsoc.c b/hw/riscv/microchip_pfsoc.c
index cee959a..0b2e9ca 100644
--- a/hw/riscv/microchip_pfsoc.c
+++ b/hw/riscv/microchip_pfsoc.c
@@ -12,6 +12,7 @@
  * 1) PLIC (Platform Level Interrupt Controller)
  * 2) eNVM (Embedded Non-Volatile Memory)
  * 3) MMUARTs (Multi-Mode UART)
+ * 4) Cadence eMMC/SDHC controller and an SD card connected to it
  *
  * This board currently generates devicetree dynamically that indicates at least
  * two harts and up to five harts.
@@ -75,6 +76,7 @@ static const struct MemmapEntry {
     [MICROCHIP_PFSOC_MMUART0] =         { 0x20000000,     0x1000 },
     [MICROCHIP_PFSOC_SYSREG] =          { 0x20002000,     0x2000 },
     [MICROCHIP_PFSOC_MPUCFG] =          { 0x20005000,     0x1000 },
+    [MICROCHIP_PFSOC_EMMC_SD] =         { 0x20008000,     0x1000 },
     [MICROCHIP_PFSOC_MMUART1] =         { 0x20100000,     0x1000 },
     [MICROCHIP_PFSOC_MMUART2] =         { 0x20102000,     0x1000 },
     [MICROCHIP_PFSOC_MMUART3] =         { 0x20104000,     0x1000 },
@@ -111,6 +113,9 @@ static void microchip_pfsoc_soc_instance_init(Object *obj)
     qdev_prop_set_string(DEVICE(&s->u_cpus), "cpu-type",
                          TYPE_RISCV_CPU_SIFIVE_U54);
     qdev_prop_set_uint64(DEVICE(&s->u_cpus), "resetvec", RESET_VECTOR);
+
+    object_initialize_child(obj, "sd-controller", &s->sdhci,
+                            TYPE_CADENCE_SDHCI);
 }
 
 static void microchip_pfsoc_soc_realize(DeviceState *dev, Error **errp)
@@ -223,6 +228,13 @@ static void microchip_pfsoc_soc_realize(DeviceState *dev, Error **errp)
         memmap[MICROCHIP_PFSOC_MPUCFG].base,
         memmap[MICROCHIP_PFSOC_MPUCFG].size);
 
+    /* SDHCI */
+    sysbus_realize(SYS_BUS_DEVICE(&s->sdhci), errp);
+    sysbus_mmio_map(SYS_BUS_DEVICE(&s->sdhci), 0,
+                    memmap[MICROCHIP_PFSOC_EMMC_SD].base);
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s->sdhci), 0,
+        qdev_get_gpio_in(DEVICE(s->plic), MICROCHIP_PFSOC_EMMC_SD_IRQ));
+
     /* MMUARTs */
     s->serial0 = mchp_pfsoc_mmuart_create(system_memory,
         memmap[MICROCHIP_PFSOC_MMUART0].base,
@@ -290,6 +302,7 @@ static void microchip_icicle_kit_machine_init(MachineState *machine)
     MicrochipIcicleKitState *s = MICROCHIP_ICICLE_KIT_MACHINE(machine);
     MemoryRegion *system_memory = get_system_memory();
     MemoryRegion *main_mem = g_new(MemoryRegion, 1);
+    DriveInfo *dinfo = drive_get_next(IF_SD);
 
     /* Sanity check on RAM size */
     if (machine->ram_size < mc->default_ram_size) {
@@ -312,6 +325,16 @@ static void microchip_icicle_kit_machine_init(MachineState *machine)
 
     /* Load the firmware */
     riscv_find_and_load_firmware(machine, BIOS_FILENAME, RESET_VECTOR, NULL);
+
+    /* Attach an SD card */
+    if (dinfo) {
+        CadenceSDHCIState *sdhci = &(s->soc.sdhci);
+        DeviceState *card = qdev_new(TYPE_SD_CARD);
+
+        qdev_prop_set_drive_err(card, "drive", blk_by_legacy_dinfo(dinfo),
+                                &error_fatal);
+        qdev_realize_and_unref(card, sdhci->bus, &error_fatal);
+    }
 }
 
 static void microchip_icicle_kit_machine_class_init(ObjectClass *oc, void *data)
diff --git a/hw/riscv/Kconfig b/hw/riscv/Kconfig
index ceb7c16..7412db9 100644
--- a/hw/riscv/Kconfig
+++ b/hw/riscv/Kconfig
@@ -55,3 +55,4 @@ config MICROCHIP_PFSOC
     select SIFIVE
     select UNIMP
     select MCHP_PFSOC_MMUART
+    select CADENCE_SDHCI
-- 
2.7.4


