Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2668A349E07
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Mar 2021 01:35:33 +0100 (CET)
Received: from localhost ([::1]:42030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPaRo-0000vF-77
	for lists+qemu-devel@lfdr.de; Thu, 25 Mar 2021 20:35:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lPaKw-0002ov-HN; Thu, 25 Mar 2021 20:28:26 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:35560)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lPaKq-0004JY-55; Thu, 25 Mar 2021 20:28:24 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 a132-20020a1c668a0000b029010f141fe7c2so4058973wmc.0; 
 Thu, 25 Mar 2021 17:28:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZjHOHQ6FW9OLxHcp9ojcwWz0Qq5Kwhc+7VGNOsAq47o=;
 b=aLBGIQyBNFRm+22cuNQuAwX4oIXI2Tfptl+DmTXOCqiT81LTlC8vCs5ZYzBSKqG7RI
 it57i0q/sCXWcAAP62Z2T/yrXCwRSimZ7BOTMVRdQSniflCGppEX0y9INwjMOybgqFS7
 hAWbv8vUSAXHQaCaaSx8Tecd5pxOf+nb/JZCfcquFk7jMzCrn5aU+AElkqsaWnLhHzQC
 WPn8e3vTICuj8MHt4Mya7h0tPxSLXZMR5/fO7APO8xCoR4DNSzGSPTEdMEaEnJ0hZuMz
 WrM6D9LUlXQx37gBZRMmrkF2T6F89nt30gbLEW7KlDtH0cMmDNR7zs+/QCR7Z+Z4DFAw
 kp/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=ZjHOHQ6FW9OLxHcp9ojcwWz0Qq5Kwhc+7VGNOsAq47o=;
 b=ktdN25eOHN/964sTPmjxNIRxycadNt2gBUKVnBkk6Ys5gr8YBvj/40Oj1Eh0d2QS15
 L5dww3+kO+UltRZOFiPFvBlL5EQXvy79tsthVtzoiYT1W7LdRNKFdSCIqb0//jyZyfdk
 qi69wdLu3rpFgKF1YJhalkA4KN1wx6wH8AmJNIISHk1NQPxx0lIlh2hl43B5ah+F1oeA
 Z6QM+LHJKFqbLiukLVk8le0v0lwxHEAifFnFj63rr5m3nNFyzHhmnxUNUCa4zdieE0j0
 dY2RYyA/VG/NqE3k7k7dIz6l9WOUdf+xj54FwPDXNBipEji1HPQXLwEWQdbjRO/1L5jc
 AoEQ==
X-Gm-Message-State: AOAM532yrskYEdPwrJDpq3vAw2hS8msy6nNvyK/NgTyTSk0jEhr1sbvU
 C5VN5KS2JwOPmgXAm7Z8Y5pKRJIgRnD/7A==
X-Google-Smtp-Source: ABdhPJwoV5Hp8hbWmfYVBJtivaREd9dCiXrpe8vp/XnkXZA96gDS0sB6VTjt24fdnH2m3y6MBTjWjg==
X-Received: by 2002:a7b:c047:: with SMTP id u7mr10379733wmc.98.1616718497222; 
 Thu, 25 Mar 2021 17:28:17 -0700 (PDT)
Received: from localhost.localdomain (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id f22sm8015889wmc.33.2021.03.25.17.28.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Mar 2021 17:28:16 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-6.1 09/10] hw/m68k/q800: Add MacIO container
Date: Fri, 26 Mar 2021 01:27:27 +0100
Message-Id: <20210326002728.1069834-10-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210326002728.1069834-1-f4bug@amsat.org>
References: <20210326002728.1069834-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x331.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Alistair Francis <alistair@alistair23.me>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Instead of having devices mapped onto some main memory range,
then having many aliases pointing to this memory range, add
a container, map the devices onto it, and map aliases of the
container onto the main memory.

We gain a better visibility of the devices on the mac-io bus.

- before:

  (qemu) info mtree
  address-space: memory
    0000000000000000-ffffffffffffffff (prio 0, i/o): system
      0000000000000000-0000000007ffffff (prio 0, ram): m68k_mac.ram
      0000000040800000-00000000408fffff (prio 0, rom): m68k_mac.rom
      0000000050000000-0000000050003fff (prio 0, i/o): mac-via
        0000000050000000-0000000050001fff (prio 0, i/o): via1
        0000000050002000-0000000050003fff (prio 0, i/o): via2
      0000000050008000-0000000050008fff (prio 0, rom): dp8393x-prom
      000000005000a000-000000005000a0ff (prio 0, i/o): dp8393x-regs
      000000005000c020-000000005000c027 (prio 0, i/o): escc
      0000000050010000-00000000500100ff (prio 0, i/o): esp-regs
      0000000050010100-0000000050010103 (prio 0, i/o): esp-pdma
      000000005001e000-000000005001ffff (prio 0, i/o): swim
      0000000050040000-000000005007ffff (prio 0, i/o): alias mac_m68k.io[1] @system 0000000050000000-000000005003ffff
      0000000050080000-00000000500bffff (prio 0, i/o): alias mac_m68k.io[2] @system 0000000050000000-000000005003ffff
      00000000500c0000-00000000500fffff (prio 0, i/o): alias mac_m68k.io[3] @system 0000000050000000-000000005003ffff
      ...
      0000000053f40000-0000000053f7ffff (prio 0, i/o): alias mac_m68k.io[253] @system 0000000050000000-000000005003ffff
      0000000053f80000-0000000053fbffff (prio 0, i/o): alias mac_m68k.io[254] @system 0000000050000000-000000005003ffff
      0000000053fc0000-0000000053ffffff (prio 0, i/o): alias mac_m68k.io[255] @system 0000000050000000-000000005003ffff
      0000000060000000-00000000efffffff (prio 0, i/o): nubus-super-slots
      00000000f0000000-00000000feffffff (prio 0, i/o): nubus-slots
        00000000f9000000-00000000f9ffffff (prio 0, i/o): nubus-slot-9
          00000000f9001000-00000000f9400fff (prio 0, ram): macfb-vram
          00000000f9800000-00000000f9800fff (prio 0, i/o): macfb-ctrl
          00000000f9ffffe8-00000000f9ffffeb (prio 0, i/o): nubus-slot-9-rom
          00000000f9ffffec-00000000f9ffffff (prio 0, i/o): nubus-slot-9-format-block

- after:

  address-space: memory
      0000000000000000-0000000007ffffff (prio 0, ram): m68k_mac.ram
      0000000040800000-00000000408fffff (prio 0, rom): m68k_mac.rom
      0000000050000000-000000005003ffff (prio 0, i/o): alias mac_m68k.io[0] @mac-io 0000000000000000-000000000003ffff
      0000000050040000-000000005007ffff (prio 0, i/o): alias mac_m68k.io[1] @mac-io 0000000000000000-000000000003ffff
      0000000050080000-00000000500bffff (prio 0, i/o): alias mac_m68k.io[2] @mac-io 0000000000000000-000000000003ffff
      ...
      0000000053f40000-0000000053f7ffff (prio 0, i/o): alias mac_m68k.io[253] @mac-io 0000000000000000-000000000003ffff
      0000000053f80000-0000000053fbffff (prio 0, i/o): alias mac_m68k.io[254] @mac-io 0000000000000000-000000000003ffff
      0000000053fc0000-0000000053ffffff (prio 0, i/o): alias mac_m68k.io[255] @mac-io 0000000000000000-000000000003ffff
      0000000060000000-00000000efffffff (prio 0, i/o): nubus-super-slots
      00000000f0000000-00000000feffffff (prio 0, i/o): nubus-slots
        00000000f9000000-00000000f9ffffff (prio 0, i/o): nubus-slot-9
          00000000f9001000-00000000f9400fff (prio 0, ram): macfb-vram
          00000000f9800000-00000000f9800fff (prio 0, i/o): macfb-ctrl
          00000000f9ffffe8-00000000f9ffffeb (prio 0, i/o): nubus-slot-9-rom
          00000000f9ffffec-00000000f9ffffff (prio 0, i/o): nubus-slot-9-format-block

  memory-region: mac-io
    0000000000000000-000000000003ffff (prio 0, i/o): mac-io
      0000000000000000-0000000000003fff (prio 0, i/o): mac-via
        0000000000000000-0000000000001fff (prio 0, i/o): via1
        0000000000002000-0000000000003fff (prio 0, i/o): via2
      0000000000008000-0000000000008fff (prio 0, rom): dp8393x-prom
      000000000000a000-000000000000a0ff (prio 0, i/o): dp8393x-regs
      000000000000c020-000000000000c027 (prio 0, i/o): escc
      0000000000010000-00000000000100ff (prio 0, i/o): esp-regs
      0000000000010100-0000000000010103 (prio 0, i/o): esp-pdma
      000000000001e000-000000000001ffff (prio 0, i/o): swim

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/m68k/q800.c | 54 ++++++++++++++++++++++++++++++--------------------
 1 file changed, 33 insertions(+), 21 deletions(-)

diff --git a/hw/m68k/q800.c b/hw/m68k/q800.c
index 4d2e866eec7..8f14e677077 100644
--- a/hw/m68k/q800.c
+++ b/hw/m68k/q800.c
@@ -61,14 +61,14 @@
 #define IO_SLICE              0x00040000
 #define IO_SIZE               0x04000000
 
-#define VIA_BASE              (IO_BASE + 0x00000)
-#define SONIC_PROM_BASE       (IO_BASE + 0x08000)
-#define SONIC_BASE            (IO_BASE + 0x0a000)
-#define SCC_BASE              (IO_BASE + 0x0c020)
-#define ESP_BASE              (IO_BASE + 0x10000)
-#define ESP_PDMA              (IO_BASE + 0x10100)
-#define ASC_BASE              (IO_BASE + 0x14000)
-#define SWIM_BASE             (IO_BASE + 0x1E000)
+#define VIA_OFFSET            (0x00000)
+#define SONIC_PROM_OFFSET     (0x08000)
+#define SONIC_IO_OFFSET       (0x0a000)
+#define SCC_OFFSET            (0x0c020)
+#define ESP_OFFSET            (0x10000)
+#define ESP_PDMA_OFFSET       (0x10100)
+#define ASC_OFFSET            (0x14000)
+#define SWIM_OFFSET           (0x1e000)
 
 #define NUBUS_SUPER_SLOT_BASE 0x60000000
 #define NUBUS_SLOT_BASE       0xf0000000
@@ -213,8 +213,9 @@ static void q800_init(MachineState *machine)
     ram_addr_t initrd_base;
     int32_t initrd_size;
     MemoryRegion *rom;
+    MemoryRegion *macio;
     MemoryRegion *io;
-    const int io_slice_nb = (IO_SIZE / IO_SLICE) - 1;
+    const int io_slice_nb = (IO_SIZE / IO_SLICE);
     int i;
     ram_addr_t ram_size = machine->ram_size;
     const char *kernel_filename = machine->kernel_filename;
@@ -249,18 +250,21 @@ static void q800_init(MachineState *machine)
     /* RAM */
     memory_region_add_subregion(get_system_memory(), 0, machine->ram);
 
+    /* MacIO bus */
+    macio = g_new(MemoryRegion, 1);
+    memory_region_init(macio, NULL, "mac-io", 256 * KiB); /* FIXME or 128K? */
+
     /*
      * Memory from IO_BASE to IO_BASE + IO_SLICE is repeated
      * from IO_BASE + IO_SLICE to IO_BASE + IO_SIZE
      */
     io = g_new(MemoryRegion, io_slice_nb);
     for (i = 0; i < io_slice_nb; i++) {
-        char *name = g_strdup_printf("mac_m68k.io[%d]", i + 1);
+        char *name = g_strdup_printf("mac_m68k.io[%d]", i);
 
-        memory_region_init_alias(&io[i], NULL, name, get_system_memory(),
-                                 IO_BASE, IO_SLICE);
+        memory_region_init_alias(&io[i], NULL, name, macio, 0, IO_SLICE);
         memory_region_add_subregion(get_system_memory(),
-                                    IO_BASE + (i + 1) * IO_SLICE, &io[i]);
+                                    IO_BASE + i * IO_SLICE, &io[i]);
         g_free(name);
     }
 
@@ -278,7 +282,8 @@ static void q800_init(MachineState *machine)
     }
     sysbus = SYS_BUS_DEVICE(via_dev);
     sysbus_realize_and_unref(sysbus, &error_fatal);
-    sysbus_mmio_map(sysbus, 0, VIA_BASE);
+    memory_region_add_subregion(macio, VIA_OFFSET,
+                                sysbus_mmio_get_region(sysbus, 0));
     qdev_connect_gpio_out_named(DEVICE(sysbus), "irq", 0,
                                 qdev_get_gpio_in(glue, 0));
     qdev_connect_gpio_out_named(DEVICE(sysbus), "irq", 1,
@@ -321,9 +326,11 @@ static void q800_init(MachineState *machine)
                              OBJECT(get_system_memory()), &error_abort);
     sysbus = SYS_BUS_DEVICE(dev);
     sysbus_realize_and_unref(sysbus, &error_fatal);
-    sysbus_mmio_map(sysbus, 0, SONIC_BASE);
-    sysbus_mmio_map(sysbus, 1, SONIC_PROM_BASE);
     sysbus_connect_irq(sysbus, 0, qdev_get_gpio_in(glue, 2));
+    memory_region_add_subregion(macio, SONIC_IO_OFFSET,
+                                sysbus_mmio_get_region(sysbus, 0));
+    memory_region_add_subregion(macio, SONIC_PROM_OFFSET,
+                                sysbus_mmio_get_region(sysbus, 1));
 
     /* SCC */
 
@@ -346,7 +353,8 @@ static void q800_init(MachineState *machine)
     sysbus_connect_irq(sysbus, 0, qdev_get_gpio_in(escc_orgate, 0));
     sysbus_connect_irq(sysbus, 1, qdev_get_gpio_in(escc_orgate, 1));
     qdev_connect_gpio_out(DEVICE(escc_orgate), 0, qdev_get_gpio_in(glue, 3));
-    sysbus_mmio_map(sysbus, 0, SCC_BASE);
+    memory_region_add_subregion(macio, SCC_OFFSET,
+                                sysbus_mmio_get_region(sysbus, 0));
 
     /* SCSI */
 
@@ -367,8 +375,10 @@ static void q800_init(MachineState *machine)
     sysbus_connect_irq(sysbus, 1,
                        qdev_get_gpio_in_named(via_dev, "via2-irq",
                                               VIA2_IRQ_SCSI_DATA_BIT));
-    sysbus_mmio_map(sysbus, 0, ESP_BASE);
-    sysbus_mmio_map(sysbus, 1, ESP_PDMA);
+    memory_region_add_subregion(macio, ESP_OFFSET,
+                                sysbus_mmio_get_region(sysbus, 0));
+    memory_region_add_subregion(macio, ESP_PDMA_OFFSET,
+                                sysbus_mmio_get_region(sysbus, 1));
 
     scsi_bus_legacy_handle_cmdline(&esp->bus);
 
@@ -376,7 +386,8 @@ static void q800_init(MachineState *machine)
 
     dev = qdev_new(TYPE_SWIM);
     sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
-    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, SWIM_BASE);
+    memory_region_add_subregion(macio, SWIM_OFFSET,
+                                sysbus_mmio_get_region(SYS_BUS_DEVICE(dev), 0));
 
     /* NuBus */
 
@@ -423,7 +434,8 @@ static void q800_init(MachineState *machine)
                   (graphic_height << 16) | graphic_width);
         BOOTINFO1(cs->as, parameters_base, BI_MAC_VROW,
                   (graphic_width * graphic_depth + 7) / 8);
-        BOOTINFO1(cs->as, parameters_base, BI_MAC_SCCBASE, SCC_BASE);
+        BOOTINFO1(cs->as, parameters_base, BI_MAC_SCCBASE,
+                  IO_BASE + SCC_OFFSET);
 
         rom = g_malloc(sizeof(*rom));
         memory_region_init_ram_ptr(rom, NULL, "m68k_fake_mac.rom",
-- 
2.26.2


