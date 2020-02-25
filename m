Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A83516C136
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Feb 2020 13:47:35 +0100 (CET)
Received: from localhost ([::1]:54580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j6Zcc-0004U1-AD
	for lists+qemu-devel@lfdr.de; Tue, 25 Feb 2020 07:47:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52391)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <paolo.bonzini@gmail.com>) id 1j6Yzz-0003BG-NS
 for qemu-devel@nongnu.org; Tue, 25 Feb 2020 07:07:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <paolo.bonzini@gmail.com>) id 1j6Yzy-0003MU-C5
 for qemu-devel@nongnu.org; Tue, 25 Feb 2020 07:07:39 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:45763)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <paolo.bonzini@gmail.com>)
 id 1j6Yzy-0003M1-6B
 for qemu-devel@nongnu.org; Tue, 25 Feb 2020 07:07:38 -0500
Received: by mail-wr1-x431.google.com with SMTP id g3so14386357wrs.12
 for <qemu-devel@nongnu.org>; Tue, 25 Feb 2020 04:07:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hQKEDHZ7ybfue6PbnahmlzzYTgRr4IP7NeUXkWEOGMQ=;
 b=Kr21J/RTdCPlQL5paFIxj3wJx4OIx02kR06LVYZYUmz1Ln2GEmpqwWUtePMbfyMirI
 j2zakc946ISbbeJXqc3dVYIY9llXucc5SLJKa7rW2OQZKl8uBJ9ojLklfApBtbE5px4d
 +phZcLkBK/NV4hCqaQapy86VWUAL/Em1rjMjnOKxoUaHycSEtDXz4yBgQFw6FPclULTA
 jT2YA4aMHzFD1oivS2+kWzHuE4BeOO1ryNi2YDlD+bM9cCKi32Gi4l9MtGIpnMqzn0km
 tJJWCS2chlSZyBGxtvsSyZPmkQgy64/tOdY1dMkqItZogMbVRxIuR1tmKci3nJCTqSQd
 TI8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=hQKEDHZ7ybfue6PbnahmlzzYTgRr4IP7NeUXkWEOGMQ=;
 b=hQIfacHmzYBmcy+VTLGKkvJ0TA/g6rGn54nF0VWCYLCPc37xG+zSspaSvLqqZGBWhL
 05hc/vktjLMz1SfqF49CvsZHMg2ZtNqb8bhI8XPExw0aAtXZkGmENdGrQUBnIpGb384W
 HJWQKrpTu2xdcMOUJQVIRyHHF3T7SJp7x6oUnWW5+z+9ZUC9yVJyKs+A/A4FrdNyaiBU
 7yAfateGf/muD5wxdcVIfMz86smfpVDaB1wkyVmh6/2qqzRmBX5vyIGX26ELwknz6HAF
 B0GCprX5+Zu5vm9jXlIl5ebx3FrCGjANTgv6tNPsd73SueTN18mMjm1PpVFPUvHU4eqY
 agRA==
X-Gm-Message-State: APjAAAUhd/f/Daz+/Skc1FDFnJsXHcKdWx0vrd5L9IVTqmAsX3E9cWOg
 V8HGl2k9brirWNGtY0IYDKrREBpH
X-Google-Smtp-Source: APXvYqzrO4zbz4wIgy/XqxPtvHj6chd20YmsF2oaDQEjz3MMMhVU+BxppPTmubM9R83vsJT0Dm/FOQ==
X-Received: by 2002:adf:eb48:: with SMTP id u8mr71895435wrn.283.1582632456624; 
 Tue, 25 Feb 2020 04:07:36 -0800 (PST)
Received: from 640k.localdomain ([93.56.166.5])
 by smtp.gmail.com with ESMTPSA id h13sm22709423wrw.54.2020.02.25.04.07.35
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 25 Feb 2020 04:07:35 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 103/136] hw/arm: Use memory_region_init_rom() with read-only
 regions
Date: Tue, 25 Feb 2020 13:07:01 +0100
Message-Id: <1582632454-16491-1-git-send-email-pbonzini@redhat.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1582631466-13880-1-git-send-email-pbonzini@redhat.com>
References: <1582631466-13880-1-git-send-email-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::431
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

This commit was produced with the Coccinelle script
scripts/coccinelle/memory-region-housekeeping.cocci.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20200224205533.23798-6-philmd@redhat.com>
Supersedes: <20200221173049.18134-1-philmd@redhat.com>
---
 hw/arm/exynos4210.c | 3 +--
 hw/arm/mainstone.c  | 3 +--
 hw/arm/omap_sx1.c   | 6 ++----
 hw/arm/palm.c       | 3 +--
 hw/arm/spitz.c      | 3 +--
 hw/arm/stellaris.c  | 3 +--
 hw/arm/tosa.c       | 3 +--
 7 files changed, 8 insertions(+), 16 deletions(-)

diff --git a/hw/arm/exynos4210.c b/hw/arm/exynos4210.c
index 59a27bd..3af6502 100644
--- a/hw/arm/exynos4210.c
+++ b/hw/arm/exynos4210.c
@@ -311,9 +311,8 @@ static void exynos4210_realize(DeviceState *socdev, Error **errp)
                                 &s->chipid_mem);
 
     /* Internal ROM */
-    memory_region_init_ram(&s->irom_mem, NULL, "exynos4210.irom",
+    memory_region_init_rom(&s->irom_mem, NULL, "exynos4210.irom",
                            EXYNOS4210_IROM_SIZE, &error_fatal);
-    memory_region_set_readonly(&s->irom_mem, true);
     memory_region_add_subregion(system_mem, EXYNOS4210_IROM_BASE_ADDR,
                                 &s->irom_mem);
     /* mirror of iROM */
diff --git a/hw/arm/mainstone.c b/hw/arm/mainstone.c
index 6e64dfa..05a806b 100644
--- a/hw/arm/mainstone.c
+++ b/hw/arm/mainstone.c
@@ -125,9 +125,8 @@ static void mainstone_common_init(MemoryRegion *address_space_mem,
     /* Setup CPU & memory */
     mpu = pxa270_init(address_space_mem, mainstone_binfo.ram_size,
                       machine->cpu_type);
-    memory_region_init_ram(rom, NULL, "mainstone.rom", MAINSTONE_ROM,
+    memory_region_init_rom(rom, NULL, "mainstone.rom", MAINSTONE_ROM,
                            &error_fatal);
-    memory_region_set_readonly(rom, true);
     memory_region_add_subregion(address_space_mem, 0, rom);
 
 #ifdef TARGET_WORDS_BIGENDIAN
diff --git a/hw/arm/omap_sx1.c b/hw/arm/omap_sx1.c
index be24571..6c3fd1b 100644
--- a/hw/arm/omap_sx1.c
+++ b/hw/arm/omap_sx1.c
@@ -126,9 +126,8 @@ static void sx1_init(MachineState *machine, const int version)
     mpu = omap310_mpu_init(dram, machine->cpu_type);
 
     /* External Flash (EMIFS) */
-    memory_region_init_ram(flash, NULL, "omap_sx1.flash0-0", flash_size,
+    memory_region_init_rom(flash, NULL, "omap_sx1.flash0-0", flash_size,
                            &error_fatal);
-    memory_region_set_readonly(flash, true);
     memory_region_add_subregion(address_space, OMAP_CS0_BASE, flash);
 
     memory_region_init_io(&cs[0], NULL, &static_ops, &cs0val,
@@ -168,9 +167,8 @@ static void sx1_init(MachineState *machine, const int version)
     if ((version == 1) &&
             (dinfo = drive_get(IF_PFLASH, 0, fl_idx)) != NULL) {
         MemoryRegion *flash_1 = g_new(MemoryRegion, 1);
-        memory_region_init_ram(flash_1, NULL, "omap_sx1.flash1-0",
+        memory_region_init_rom(flash_1, NULL, "omap_sx1.flash1-0",
                                flash1_size, &error_fatal);
-        memory_region_set_readonly(flash_1, true);
         memory_region_add_subregion(address_space, OMAP_CS1_BASE, flash_1);
 
         memory_region_init_io(&cs[1], NULL, &static_ops, &cs1val,
diff --git a/hw/arm/palm.c b/hw/arm/palm.c
index 72eca8c..265d589 100644
--- a/hw/arm/palm.c
+++ b/hw/arm/palm.c
@@ -206,9 +206,8 @@ static void palmte_init(MachineState *machine)
     mpu = omap310_mpu_init(dram, machine->cpu_type);
 
     /* External Flash (EMIFS) */
-    memory_region_init_ram(flash, NULL, "palmte.flash", flash_size,
+    memory_region_init_rom(flash, NULL, "palmte.flash", flash_size,
                            &error_fatal);
-    memory_region_set_readonly(flash, true);
     memory_region_add_subregion(address_space_mem, OMAP_CS0_BASE, flash);
 
     memory_region_init_io(&cs[0], NULL, &static_ops, &cs0val, "palmte-cs0",
diff --git a/hw/arm/spitz.c b/hw/arm/spitz.c
index e001088..1d27399 100644
--- a/hw/arm/spitz.c
+++ b/hw/arm/spitz.c
@@ -924,8 +924,7 @@ static void spitz_common_init(MachineState *machine,
 
     sl_flash_register(mpu, (model == spitz) ? FLASH_128M : FLASH_1024M);
 
-    memory_region_init_ram(rom, NULL, "spitz.rom", SPITZ_ROM, &error_fatal);
-    memory_region_set_readonly(rom, true);
+    memory_region_init_rom(rom, NULL, "spitz.rom", SPITZ_ROM, &error_fatal);
     memory_region_add_subregion(address_space_mem, 0, rom);
 
     /* Setup peripherals */
diff --git a/hw/arm/stellaris.c b/hw/arm/stellaris.c
index 221a786..d136ba1 100644
--- a/hw/arm/stellaris.c
+++ b/hw/arm/stellaris.c
@@ -1300,9 +1300,8 @@ static void stellaris_init(MachineState *ms, stellaris_board_info *board)
     sram_size = ((board->dc0 >> 18) + 1) * 1024;
 
     /* Flash programming is done via the SCU, so pretend it is ROM.  */
-    memory_region_init_ram(flash, NULL, "stellaris.flash", flash_size,
+    memory_region_init_rom(flash, NULL, "stellaris.flash", flash_size,
                            &error_fatal);
-    memory_region_set_readonly(flash, true);
     memory_region_add_subregion(system_memory, 0, flash);
 
     memory_region_init_ram(sram, NULL, "stellaris.sram", sram_size,
diff --git a/hw/arm/tosa.c b/hw/arm/tosa.c
index 4d95a1f..5dee2d7 100644
--- a/hw/arm/tosa.c
+++ b/hw/arm/tosa.c
@@ -226,8 +226,7 @@ static void tosa_init(MachineState *machine)
 
     mpu = pxa255_init(address_space_mem, tosa_binfo.ram_size);
 
-    memory_region_init_ram(rom, NULL, "tosa.rom", TOSA_ROM, &error_fatal);
-    memory_region_set_readonly(rom, true);
+    memory_region_init_rom(rom, NULL, "tosa.rom", TOSA_ROM, &error_fatal);
     memory_region_add_subregion(address_space_mem, 0, rom);
 
     tmio = tc6393xb_init(address_space_mem, 0x10000000,
-- 
1.8.3.1



