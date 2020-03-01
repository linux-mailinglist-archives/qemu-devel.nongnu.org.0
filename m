Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD91217507C
	for <lists+qemu-devel@lfdr.de>; Sun,  1 Mar 2020 22:56:53 +0100 (CET)
Received: from localhost ([::1]:52238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j8WZw-0003P1-Vz
	for lists+qemu-devel@lfdr.de; Sun, 01 Mar 2020 16:56:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57751)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <nieklinnenbank@gmail.com>) id 1j8WU3-00017c-3p
 for qemu-devel@nongnu.org; Sun, 01 Mar 2020 16:50:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <nieklinnenbank@gmail.com>) id 1j8WU1-0006SA-Lq
 for qemu-devel@nongnu.org; Sun, 01 Mar 2020 16:50:47 -0500
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:45262)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <nieklinnenbank@gmail.com>)
 id 1j8WU1-0006QJ-F2; Sun, 01 Mar 2020 16:50:45 -0500
Received: by mail-wr1-x442.google.com with SMTP id v2so9996653wrp.12;
 Sun, 01 Mar 2020 13:50:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=2M2cBdnjCKHbTffAxygjNzzW3DY3E7nE5HBQsMj2p64=;
 b=Bv2SIBQwgrdym/6DigaM9aJOHKMlGctBoYR11Q4fnJOmuQT/Lv6PO/6VbcaqaqclEH
 QVUn4qblqMIM7xzaxU7414NFm9thn5ztgSAyhEf1hK60U5u9gjXhWKZqfJHvrQRbmd0t
 kFhA4BT8cbW9woijWk1i43W0wjnqyqxA1r6Tb7arPz1fioeUpv92yKCM+8QtwAys9ev7
 q8B94lowzmpAAMVrUij01h+o4qduv/AhYz8/hjnjV+ZkBGxuciJag1Wx8kw38VKbJ4NZ
 xn5lQXFf6u1R70ykbtOdCrYRIuxqD2g/anzCVTh9lcvJF2GIwwcZYzeefccVhzBKHnhE
 21/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=2M2cBdnjCKHbTffAxygjNzzW3DY3E7nE5HBQsMj2p64=;
 b=QlesGAiuQaxJtkNQ6EsrEhkVig+2b5ib1tkbLBL3ARDrBOT5liVURJEXewK9/ESA9d
 A/65lZ4WOT85rMYJr3ZTng0OCMpiYBMjRHJ7JF9uoAye7pR8Amp5awibsDWX0C2V/iEj
 tw69+AlUc1q0OwmxjPslxHe334MjRQfkjFUkZNm6vvGAnPJHidjPVaNKDjEtbpGhc1pp
 YChTkGZKz39mrtOyhUeG21DokFlIYeLp6RBFs6p5TTHampZHHfcChWqSNYHqWOvUSsRb
 vUSAmxDQPLE31N3PEYwLuVPt+5Lr8BRVpKdn/S4rjpmoYKyUE1bKpdPCV2rn+Ohj3xcy
 kqzA==
X-Gm-Message-State: APjAAAXtp6Bs2u9TThgHl/WCAlsayvtSBN4dyeRXN/xpujAR1iiWYj6P
 UkP4TTMCzPvIPtHoEwl9KJ7Bx7PU
X-Google-Smtp-Source: APXvYqz24XUKEOzjJSxaZTHUfu0JBVrNnW0N1UaxrYC2i5fYEeuH4V3F7bKj2Fm5D3vt7Z1pSMlRCA==
X-Received: by 2002:adf:fecf:: with SMTP id q15mr18795819wrs.360.1583099444190; 
 Sun, 01 Mar 2020 13:50:44 -0800 (PST)
Received: from pavilion.home ([2a02:a456:6be8:1:8edc:d4ff:fe8b:18b7])
 by smtp.gmail.com with ESMTPSA id e8sm25033124wrr.69.2020.03.01.13.50.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Mar 2020 13:50:43 -0800 (PST)
From: Niek Linnenbank <nieklinnenbank@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 10/18] hw/arm/allwinner-h3: add Boot ROM support
Date: Sun,  1 Mar 2020 22:50:21 +0100
Message-Id: <20200301215029.15196-11-nieklinnenbank@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200301215029.15196-1-nieklinnenbank@gmail.com>
References: <20200301215029.15196-1-nieklinnenbank@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::442
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
Cc: peter.maydell@linaro.org, alex.bennee@linaro.org, jasowang@redhat.com,
 b.galvani@gmail.com, Niek Linnenbank <nieklinnenbank@gmail.com>,
 qemu-arm@nongnu.org, imammedo@redhat.com, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

A real Allwinner H3 SoC contains a Boot ROM which is the
first code that runs right after the SoC is powered on.
The Boot ROM is responsible for loading user code (e.g. a bootloader)
from any of the supported external devices and writing the downloaded
code to internal SRAM. After loading the SoC begins executing the code
written to SRAM.

This commits adds emulation of the Boot ROM firmware setup functionality
by loading user code from SD card in the A1 SRAM. While the A1 SRAM is
64KiB, we limit the size to 32KiB because the real H3 Boot ROM also rejects
sizes larger than 32KiB. For reference, this behaviour is documented
by the Linux Sunxi project wiki at:

  https://linux-sunxi.org/BROM#U-Boot_SPL_limitations

Signed-off-by: Niek Linnenbank <nieklinnenbank@gmail.com>
---
 include/hw/arm/allwinner-h3.h | 21 +++++++++++++++++++++
 hw/arm/allwinner-h3.c         | 18 ++++++++++++++++++
 hw/arm/orangepi.c             |  5 +++++
 3 files changed, 44 insertions(+)

diff --git a/include/hw/arm/allwinner-h3.h b/include/hw/arm/allwinner-h3.h
index f9b9a02373..d338003724 100644
--- a/include/hw/arm/allwinner-h3.h
+++ b/include/hw/arm/allwinner-h3.h
@@ -46,6 +46,7 @@
 #include "hw/sd/allwinner-sdhost.h"
 #include "hw/net/allwinner-sun8i-emac.h"
 #include "target/arm/cpu.h"
+#include "sysemu/block-backend.h"
 
 /**
  * Allwinner H3 device list
@@ -129,4 +130,24 @@ typedef struct AwH3State {
     MemoryRegion sram_c;
 } AwH3State;
 
+/**
+ * Emulate Boot ROM firmware setup functionality.
+ *
+ * A real Allwinner H3 SoC contains a Boot ROM
+ * which is the first code that runs right after
+ * the SoC is powered on. The Boot ROM is responsible
+ * for loading user code (e.g. a bootloader) from any
+ * of the supported external devices and writing the
+ * downloaded code to internal SRAM. After loading the SoC
+ * begins executing the code written to SRAM.
+ *
+ * This function emulates the Boot ROM by copying 32 KiB
+ * of data from the given block device and writes it to
+ * the start of the first internal SRAM memory.
+ *
+ * @s: Allwinner H3 state object pointer
+ * @blk: Block backend device object pointer
+ */
+void allwinner_h3_bootrom_setup(AwH3State *s, BlockBackend *blk);
+
 #endif /* HW_ARM_ALLWINNER_H3_H */
diff --git a/hw/arm/allwinner-h3.c b/hw/arm/allwinner-h3.c
index d1245d2b01..56b5c563a8 100644
--- a/hw/arm/allwinner-h3.c
+++ b/hw/arm/allwinner-h3.c
@@ -29,6 +29,7 @@
 #include "hw/char/serial.h"
 #include "hw/misc/unimp.h"
 #include "hw/usb/hcd-ehci.h"
+#include "hw/loader.h"
 #include "sysemu/sysemu.h"
 #include "hw/arm/allwinner-h3.h"
 
@@ -170,6 +171,23 @@ enum {
     AW_H3_GIC_NUM_SPI       = 128
 };
 
+void allwinner_h3_bootrom_setup(AwH3State *s, BlockBackend *blk)
+{
+    const int64_t rom_size = 32 * KiB;
+    uint8_t *buffer = g_new0(uint8_t, rom_size);
+
+    if (blk_pread(blk, 8 * KiB, buffer, rom_size) < 0) {
+        error_setg(&error_fatal, "%s: failed to read BlockBackend data",
+                   __func__);
+        return;
+    }
+
+    rom_add_blob("allwinner-h3.bootrom", buffer, rom_size,
+                  rom_size, s->memmap[AW_H3_SRAM_A1],
+                  NULL, NULL, NULL, NULL, false);
+    g_free(buffer);
+}
+
 static void allwinner_h3_init(Object *obj)
 {
     AwH3State *s = AW_H3(obj);
diff --git a/hw/arm/orangepi.c b/hw/arm/orangepi.c
index d5cfc1f611..8a2b8919c9 100644
--- a/hw/arm/orangepi.c
+++ b/hw/arm/orangepi.c
@@ -95,6 +95,11 @@ static void orangepi_init(MachineState *machine)
     memory_region_add_subregion(get_system_memory(), h3->memmap[AW_H3_SDRAM],
                                 machine->ram);
 
+    /* Load target kernel or start using BootROM */
+    if (!machine->kernel_filename && blk_is_available(blk)) {
+        /* Use Boot ROM to copy data from SD card to SRAM */
+        allwinner_h3_bootrom_setup(h3, blk);
+    }
     orangepi_binfo.loader_start = h3->memmap[AW_H3_SDRAM];
     orangepi_binfo.ram_size = machine->ram_size;
     arm_load_kernel(ARM_CPU(first_cpu), machine, &orangepi_binfo);
-- 
2.17.1


