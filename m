Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4324646AD2A
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Dec 2021 23:50:31 +0100 (CET)
Received: from localhost ([::1]:45836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muMoY-0008Mk-BP
	for lists+qemu-devel@lfdr.de; Mon, 06 Dec 2021 17:50:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1muMjt-0000ox-9P
 for qemu-devel@nongnu.org; Mon, 06 Dec 2021 17:45:41 -0500
Received: from [2a00:1450:4864:20::330] (port=53811
 helo=mail-wm1-x330.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1muMjr-00077m-9e
 for qemu-devel@nongnu.org; Mon, 06 Dec 2021 17:45:41 -0500
Received: by mail-wm1-x330.google.com with SMTP id y196so9307261wmc.3
 for <qemu-devel@nongnu.org>; Mon, 06 Dec 2021 14:45:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9qz4AKFNIN2qnCPkv3JO022Rqx3rJT8mFAHOQmP3u04=;
 b=p1cWL3hFehOQAYhaLPxIQCuBf4xjtGAdXzG/paPrM/1B0Pe5CJ5Rq8QXX22cr8UsKL
 9iFK0zi1ChhBYkg/Vh1/KUSqwkuCqbV6LNl5ukNVhVBjdFH17E4/ewmaYf/jecnsS/jx
 592pvv45RgqH0sn40KHKMo8usPSxgZz3+dUf4CTBm241VQgHJtEDEqSPR/cux4OzySp0
 Nj9MA54IIZh+Ncdar9H5IkRZ/iLhuxO1FB4LiAABAb9zaZ9w3A0Mbe/Y1b/zxgHJfkV0
 E+M8rgkFVYF8ICIu5Qkmmj/k7W9ISJmBHF5pMWWB2P8pGJLvXxNnLkt1h3AT4WSahJ+1
 hQkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=9qz4AKFNIN2qnCPkv3JO022Rqx3rJT8mFAHOQmP3u04=;
 b=64Aqj2Cnvsn5SsdpjAlJAi1eW1yR62B1ckiXAavW59WpgrQuLmCfmSdFHc974tjNhs
 3fPEKJP5RefHYz2b3yyPCY8s1ccVENUGvt/O9EAqqn8cBt896AJUULeevBLFoBgARlIu
 ioeFNkuSmx7M1xkVMztCVJSjs7SM3vFxlI71/KGHewHCmAW50uFL7x/7gms9AZk0DDyp
 7peY5oXxfJmttkz75gItbWICaXLDl+9tVsYa6J7R7jmMjGpQlSVs7CCDLrF/LM3LAukS
 yf8j6q8L2ShRIXIPVhzKv3O2c4ZXPhLFCkovRnMC7YeuGSshOcByHwV5jVTP8YgyIzWm
 1HEA==
X-Gm-Message-State: AOAM533zRjW4lgWUFJN4CevFZzwxivLvyjnQg9SjUud1fJ36gofFdjaT
 LmSX82nCRLVOPw1SL4FN/CumEo202us=
X-Google-Smtp-Source: ABdhPJzICQSez9xQRsgMHAk/pWa5/itEpY+i58gyQTYtp38aNxiMFhy9qRS/Ht4/buiPQI7m32JYXA==
X-Received: by 2002:a05:600c:1988:: with SMTP id
 t8mr1894767wmq.48.1638830737242; 
 Mon, 06 Dec 2021 14:45:37 -0800 (PST)
Received: from x1w.. (174.red-83-50-185.dynamicip.rima-tde.net.
 [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id h27sm701340wmc.43.2021.12.06.14.45.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Dec 2021 14:45:36 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/4] hw/display: Rename VGA_ISA_MM -> VGA_MMIO
Date: Mon,  6 Dec 2021 23:45:25 +0100
Message-Id: <20211206224528.563588-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211206224528.563588-1-f4bug@amsat.org>
References: <20211206224528.563588-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::330
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x330.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There is no ISA bus part in the MMIO VGA device, so rename:

 *  hw/display/vga-isa-mm.c -> hw/display/vga-mmio.c
 *  CONFIG_VGA_ISA_MM -> CONFIG_VGA_MMIO
 *  ISAVGAMMState -> VGAMmioState
 *  isa_vga_mm_init() -> vga_mmio_init()

Reviewed-by: BALATON Zoltan <balaton@eik.bme.hu>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 configs/devices/mips-softmmu/common.mak |  2 +-
 include/hw/display/vga.h                |  5 ++---
 hw/display/{vga-isa-mm.c => vga-mmio.c} | 19 +++++++++----------
 hw/mips/jazz.c                          |  2 +-
 hw/display/Kconfig                      |  2 +-
 hw/display/meson.build                  |  2 +-
 hw/mips/Kconfig                         |  2 +-
 7 files changed, 16 insertions(+), 18 deletions(-)
 rename hw/display/{vga-isa-mm.c => vga-mmio.c} (90%)

diff --git a/configs/devices/mips-softmmu/common.mak b/configs/devices/mips-softmmu/common.mak
index 752b62b1e63..d2202c839e0 100644
--- a/configs/devices/mips-softmmu/common.mak
+++ b/configs/devices/mips-softmmu/common.mak
@@ -7,7 +7,7 @@ CONFIG_ISA_BUS=y
 CONFIG_PCI=y
 CONFIG_PCI_DEVICES=y
 CONFIG_VGA_ISA=y
-CONFIG_VGA_ISA_MM=y
+CONFIG_VGA_MMIO=y
 CONFIG_VGA_CIRRUS=y
 CONFIG_VMWARE_VGA=y
 CONFIG_SERIAL=y
diff --git a/include/hw/display/vga.h b/include/hw/display/vga.h
index 5f7825e0e36..c16a5c26dae 100644
--- a/include/hw/display/vga.h
+++ b/include/hw/display/vga.h
@@ -24,8 +24,7 @@ enum vga_retrace_method {
 
 extern enum vga_retrace_method vga_retrace_method;
 
-int isa_vga_mm_init(hwaddr vram_base,
-                    hwaddr ctrl_base, int it_shift,
-                    MemoryRegion *address_space);
+int vga_mmio_init(hwaddr vram_base, hwaddr ctrl_base,
+                  int it_shift, MemoryRegion *address_space);
 
 #endif
diff --git a/hw/display/vga-isa-mm.c b/hw/display/vga-mmio.c
similarity index 90%
rename from hw/display/vga-isa-mm.c
rename to hw/display/vga-mmio.c
index 7321b7a06d5..4ffe3afe32d 100644
--- a/hw/display/vga-isa-mm.c
+++ b/hw/display/vga-mmio.c
@@ -1,5 +1,5 @@
 /*
- * QEMU ISA MM VGA Emulator.
+ * QEMU MMIO VGA Emulator.
  *
  * Copyright (c) 2003 Fabrice Bellard
  *
@@ -32,15 +32,15 @@
 
 #define VGA_RAM_SIZE (8 * MiB)
 
-typedef struct ISAVGAMMState {
+typedef struct VGAMmioState {
     VGACommonState vga;
     int it_shift;
-} ISAVGAMMState;
+} VGAMmioState;
 
 /* Memory mapped interface */
 static uint64_t vga_mm_read(void *opaque, hwaddr addr, unsigned size)
 {
-    ISAVGAMMState *s = opaque;
+    VGAMmioState *s = opaque;
 
     return vga_ioport_read(&s->vga, addr >> s->it_shift) &
         MAKE_64BIT_MASK(0, size * 8);
@@ -49,7 +49,7 @@ static uint64_t vga_mm_read(void *opaque, hwaddr addr, unsigned size)
 static void vga_mm_write(void *opaque, hwaddr addr, uint64_t value,
                          unsigned size)
 {
-    ISAVGAMMState *s = opaque;
+    VGAMmioState *s = opaque;
 
     vga_ioport_write(&s->vga, addr >> s->it_shift,
                      value & MAKE_64BIT_MASK(0, size * 8));
@@ -65,7 +65,7 @@ static const MemoryRegionOps vga_mm_ctrl_ops = {
     .endianness = DEVICE_NATIVE_ENDIAN,
 };
 
-static void vga_mm_init(ISAVGAMMState *s, hwaddr vram_base,
+static void vga_mm_init(VGAMmioState *s, hwaddr vram_base,
                         hwaddr ctrl_base, int it_shift,
                         MemoryRegion *address_space)
 {
@@ -91,11 +91,10 @@ static void vga_mm_init(ISAVGAMMState *s, hwaddr vram_base,
     memory_region_set_coalescing(vga_io_memory);
 }
 
-int isa_vga_mm_init(hwaddr vram_base,
-                    hwaddr ctrl_base, int it_shift,
-                    MemoryRegion *address_space)
+int vga_mmio_init(hwaddr vram_base, hwaddr ctrl_base,
+                  int it_shift, MemoryRegion *address_space)
 {
-    ISAVGAMMState *s;
+    VGAMmioState *s;
 
     s = g_malloc0(sizeof(*s));
 
diff --git a/hw/mips/jazz.c b/hw/mips/jazz.c
index f5a26e174d5..8f345afd137 100644
--- a/hw/mips/jazz.c
+++ b/hw/mips/jazz.c
@@ -274,7 +274,7 @@ static void mips_jazz_init(MachineState *machine,
         }
         break;
     case JAZZ_PICA61:
-        isa_vga_mm_init(0x40000000, 0x60000000, 0, get_system_memory());
+        vga_mmio_init(0x40000000, 0x60000000, 0, get_system_memory());
         break;
     default:
         break;
diff --git a/hw/display/Kconfig b/hw/display/Kconfig
index a2306b67d87..a1b159becd7 100644
--- a/hw/display/Kconfig
+++ b/hw/display/Kconfig
@@ -49,7 +49,7 @@ config VGA_ISA
     depends on ISA_BUS
     select VGA
 
-config VGA_ISA_MM
+config VGA_MMIO
     bool
     select VGA
 
diff --git a/hw/display/meson.build b/hw/display/meson.build
index 861c43ff984..adc53dd8b6c 100644
--- a/hw/display/meson.build
+++ b/hw/display/meson.build
@@ -18,7 +18,7 @@
 
 softmmu_ss.add(when: 'CONFIG_VGA_PCI', if_true: files('vga-pci.c'))
 softmmu_ss.add(when: 'CONFIG_VGA_ISA', if_true: files('vga-isa.c'))
-softmmu_ss.add(when: 'CONFIG_VGA_ISA_MM', if_true: files('vga-isa-mm.c'))
+softmmu_ss.add(when: 'CONFIG_VGA_MMIO', if_true: files('vga-mmio.c'))
 softmmu_ss.add(when: 'CONFIG_VMWARE_VGA', if_true: files('vmware_vga.c'))
 softmmu_ss.add(when: 'CONFIG_BOCHS_DISPLAY', if_true: files('bochs-display.c'))
 
diff --git a/hw/mips/Kconfig b/hw/mips/Kconfig
index b4c5549ce84..725525358d9 100644
--- a/hw/mips/Kconfig
+++ b/hw/mips/Kconfig
@@ -16,7 +16,7 @@ config JAZZ
     select I8254
     select I8257
     select PCSPK
-    select VGA_ISA_MM
+    select VGA_MMIO
     select G364FB
     select DP8393X
     select ESP
-- 
2.33.1


