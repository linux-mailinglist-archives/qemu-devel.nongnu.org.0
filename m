Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90571161DD7
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Feb 2020 00:26:31 +0100 (CET)
Received: from localhost ([::1]:54374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j3pmY-00059y-IL
	for lists+qemu-devel@lfdr.de; Mon, 17 Feb 2020 18:26:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58796)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <nieklinnenbank@gmail.com>) id 1j3pki-0001d3-H1
 for qemu-devel@nongnu.org; Mon, 17 Feb 2020 18:24:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <nieklinnenbank@gmail.com>) id 1j3pkh-0006iG-3Q
 for qemu-devel@nongnu.org; Mon, 17 Feb 2020 18:24:36 -0500
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:39782)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <nieklinnenbank@gmail.com>)
 id 1j3pkg-0006hF-Tg; Mon, 17 Feb 2020 18:24:35 -0500
Received: by mail-wr1-x442.google.com with SMTP id y11so21700106wrt.6;
 Mon, 17 Feb 2020 15:24:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=UElMFsqrdt3KN3cYNw35xyRl1xIMwrIbp2KPqeCB5HA=;
 b=FIA08VNvV+T3T8NkTbvBTSGuNkXKkc9ezjuuYraNndyNmlpUETlADkA5fnuW+/p8Zx
 H8zxxYCmjDP/La/dJKe7J15HSaT8oae+wug/jgKQhCtoCEGhqYwL61PM/m0HIUt9e91T
 i/ToxAc7gB17h82x/shmwwPDcdcHBZqEC6qTBL8XbAI2sJLS7ni/BjQpL6eTGWk7ZWu2
 cfF4roa+zwdnsmzR4ePeWIqWjNRLyq98bnWbVjGzWdev7aXE0Zw5IsQ2sQth/qSBLzr7
 kCEEf4/xr/xF9Qn45wq1JRHrE8rBQGX6G4cmfZsWSlB2spre1xkvd3E2CkHd4eyjdQjb
 tOjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=UElMFsqrdt3KN3cYNw35xyRl1xIMwrIbp2KPqeCB5HA=;
 b=uGUS2+seJfG1S1xE/XpoxLFRjQnc1To3FNFsbR1kytCONA+edIKcczFhGXFcfo+t3Q
 qx/sKC3rA9bqH1Rira3mfibcAIW15VM/JARS4f2lyw3xBAkMLywKh+SGxJQPmK7nD7WH
 pWRw+Q7H+zpOybwvz8iKsZ5wFbhNdCaI+UfuSJQVm3aylVwBt3Acdzyssjq+yKNFdF0C
 KPucOat0FlYr1BZ9CxPiv7vTUjhplzWvc6s7CGhcebVKpYmDRDBAN13Xd0tUj+oBM8tj
 xOJZ9QaFIZ8/twoYFV9LlKNUM2YVbITTjN6TZATxy6GEmL0x4WXUqQW31xVeAXp5iY/W
 C+7g==
X-Gm-Message-State: APjAAAV1hqcqIvRtz0Vfl0afNUH1bv9eBVngWApuSYsT2GEj7WSAyJj/
 F0f4EXnhvVV/8pjTVnoLxKFl+pESYqo=
X-Google-Smtp-Source: APXvYqwn69p0GWvYaokuf4e5yxrjOmJLmzjHAaOtOMbPZyNp3UEvH4cQxKSiA77cASVlnFXoFO+ePA==
X-Received: by 2002:a5d:484f:: with SMTP id n15mr24411936wrs.365.1581981873708; 
 Mon, 17 Feb 2020 15:24:33 -0800 (PST)
Received: from pavilion.home ([2a02:a456:6be8:1:8edc:d4ff:fe8b:18b7])
 by smtp.gmail.com with ESMTPSA id w1sm3244831wro.72.2020.02.17.15.24.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Feb 2020 15:24:33 -0800 (PST)
From: Niek Linnenbank <nieklinnenbank@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 10/18] hw/arm/allwinner-h3: add Boot ROM support
Date: Tue, 18 Feb 2020 00:24:03 +0100
Message-Id: <20200217232411.30096-11-nieklinnenbank@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200217232411.30096-1-nieklinnenbank@gmail.com>
References: <20200217232411.30096-1-nieklinnenbank@gmail.com>
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
index 6bb49bf2a8..902fcfd11f 100644
--- a/hw/arm/orangepi.c
+++ b/hw/arm/orangepi.c
@@ -102,6 +102,11 @@ static void orangepi_init(MachineState *machine)
     memory_region_add_subregion(get_system_memory(), s->h3->memmap[AW_H3_SDRAM],
                                 &s->sdram);
 
+    /* Load target kernel or start using BootROM */
+    if (!machine->kernel_filename && blk_is_available(blk)) {
+        /* Use Boot ROM to copy data from SD card to SRAM */
+        allwinner_h3_bootrom_setup(s->h3, blk);
+    }
     orangepi_binfo.loader_start = s->h3->memmap[AW_H3_SDRAM];
     orangepi_binfo.ram_size = machine->ram_size;
     arm_load_kernel(ARM_CPU(first_cpu), machine, &orangepi_binfo);
-- 
2.17.1


