Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8964669AE4
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 15:50:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGKnG-0001TY-Sv; Fri, 13 Jan 2023 09:12:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pGKmg-0000zy-PC
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 09:11:54 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pGKmR-0003eE-Ti
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 09:11:41 -0500
Received: by mail-wm1-x333.google.com with SMTP id m3so15371340wmq.0
 for <qemu-devel@nongnu.org>; Fri, 13 Jan 2023 06:11:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Px7luTWW+dLtq2BVhk30rePDxrVTBf/HIgoT3jUar+A=;
 b=uBi18eYxI6eAVlojMPqx2zuMPgd+Lj2S4pBEY/cT4EyYVLJX+jMPWbuNDQlCdCIvD1
 XbDjJzIXxSaE9O8xMTWrYlZ5RnTAAVq96nAFegj5FR0iX1McSKKENum7BBPCxD2FCIFL
 sBHI+rvTnhf3z/zbF0T8+GEz3Tg7phy2N52tO1ToOWGmslt1GujfwWglKwvHpOuQyz46
 V45uazmsEOsawXHrN0d+EIObYVERleEs9jGsgvFZY9k+SQ4siwX2lEyKkY3d0cSK6U2G
 kGw9q0yaaCUvenuTRtF4ifBp7gtQ5spqtEl2DaxwhKLYcCM9wXGG4hbb6x+CU5A5Pkk3
 Qp5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Px7luTWW+dLtq2BVhk30rePDxrVTBf/HIgoT3jUar+A=;
 b=04M2dkf4XYuTVlpHuDld396l1beh0AyrEixIps37BlX2n+Ldpu7SvHdR4SEeHQhnmy
 zU19wH/HsWlIGv0I756LSQAbVTr0vSP0V5cogTvwNeMnk/ffFjmQV0VbXF34BgZ/sKHG
 qr2ZVcR63nTo4wylAoA01B/920/mghVoz/rOp15vRZDkKZ4mUWzuyxtXAQZIylXmRyrR
 qloANvbvKf8lijTmjaAU0MkJi/qWiRCDz89WHuU6QlY75lxoXpeAeGwmyoDYGmc62cJV
 /cSb7FhD0zVPgM/spgnQU2HVQc4GaNmqt+xiLGOBxxD4cHgYJ5H/NzJpbYFMusfhC/qs
 PP7w==
X-Gm-Message-State: AFqh2kppovB1N9DU/tAdU8oLuPe91WRQceGpj52N7AFxNP61jM6LrGJA
 wdbViNgJSmUIHrJbPIhDQCgFtIPZl87lsi73
X-Google-Smtp-Source: AMrXdXvYWBy7OUXMTsznyn4WARfnOwQV8vLsuKOwxtlxsEUk0M51N4V/HetFBRj+7+zalsSZMOZeOw==
X-Received: by 2002:a05:600c:204c:b0:3d6:6a17:7015 with SMTP id
 p12-20020a05600c204c00b003d66a177015mr57262201wmg.15.1673619098686; 
 Fri, 13 Jan 2023 06:11:38 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 n36-20020a05600c502400b003da0b75de94sm5334464wmr.8.2023.01.13.06.11.37
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Jan 2023 06:11:38 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 12/38] hw/arm/pxa2xx: Simplify pxa270_init()
Date: Fri, 13 Jan 2023 14:11:00 +0000
Message-Id: <20230113141126.535646-13-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230113141126.535646-1-peter.maydell@linaro.org>
References: <20230113141126.535646-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x333.google.com
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

From: Philippe Mathieu-Daudé <philmd@linaro.org>

Since pxa270_init() must map the device in the system memory,
there is no point in passing get_system_memory() by argument.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20230109115316.2235-3-philmd@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/arm/pxa.h |  3 +--
 hw/arm/gumstix.c     |  3 +--
 hw/arm/mainstone.c   | 10 ++++------
 hw/arm/pxa2xx.c      |  4 ++--
 hw/arm/spitz.c       |  6 ++----
 hw/arm/z2.c          |  3 +--
 6 files changed, 11 insertions(+), 18 deletions(-)

diff --git a/include/hw/arm/pxa.h b/include/hw/arm/pxa.h
index c26007e57f9..ba8f49e48ed 100644
--- a/include/hw/arm/pxa.h
+++ b/include/hw/arm/pxa.h
@@ -193,8 +193,7 @@ struct PXA2xxI2SState {
 
 # define PA_FMT			"0x%08lx"
 
-PXA2xxState *pxa270_init(MemoryRegion *address_space, unsigned int sdram_size,
-                         const char *revision);
+PXA2xxState *pxa270_init(unsigned int sdram_size, const char *revision);
 PXA2xxState *pxa255_init(unsigned int sdram_size);
 
 #endif /* PXA_H */
diff --git a/hw/arm/gumstix.c b/hw/arm/gumstix.c
index c167518a46e..ab9b0182f6f 100644
--- a/hw/arm/gumstix.c
+++ b/hw/arm/gumstix.c
@@ -80,12 +80,11 @@ static void verdex_init(MachineState *machine)
 {
     PXA2xxState *cpu;
     DriveInfo *dinfo;
-    MemoryRegion *address_space_mem = get_system_memory();
 
     uint32_t verdex_rom = 0x02000000;
     uint32_t verdex_ram = 0x10000000;
 
-    cpu = pxa270_init(address_space_mem, verdex_ram, machine->cpu_type);
+    cpu = pxa270_init(verdex_ram, machine->cpu_type);
 
     dinfo = drive_get(IF_PFLASH, 0, 0);
     if (!dinfo && !qtest_enabled()) {
diff --git a/hw/arm/mainstone.c b/hw/arm/mainstone.c
index 8454b654585..f6293c6c13a 100644
--- a/hw/arm/mainstone.c
+++ b/hw/arm/mainstone.c
@@ -108,8 +108,7 @@ static struct arm_boot_info mainstone_binfo = {
     .ram_size = 0x04000000,
 };
 
-static void mainstone_common_init(MemoryRegion *address_space_mem,
-                                  MachineState *machine,
+static void mainstone_common_init(MachineState *machine,
                                   enum mainstone_model_e model, int arm_id)
 {
     uint32_t sector_len = 256 * 1024;
@@ -121,11 +120,10 @@ static void mainstone_common_init(MemoryRegion *address_space_mem,
     MemoryRegion *rom = g_new(MemoryRegion, 1);
 
     /* Setup CPU & memory */
-    mpu = pxa270_init(address_space_mem, mainstone_binfo.ram_size,
-                      machine->cpu_type);
+    mpu = pxa270_init(mainstone_binfo.ram_size, machine->cpu_type);
     memory_region_init_rom(rom, NULL, "mainstone.rom", MAINSTONE_ROM,
                            &error_fatal);
-    memory_region_add_subregion(address_space_mem, 0, rom);
+    memory_region_add_subregion(get_system_memory(), 0x00000000, rom);
 
     /* There are two 32MiB flash devices on the board */
     for (i = 0; i < 2; i ++) {
@@ -165,7 +163,7 @@ static void mainstone_common_init(MemoryRegion *address_space_mem,
 
 static void mainstone_init(MachineState *machine)
 {
-    mainstone_common_init(get_system_memory(), machine, mainstone, 0x196);
+    mainstone_common_init(machine, mainstone, 0x196);
 }
 
 static void mainstone2_machine_init(MachineClass *mc)
diff --git a/hw/arm/pxa2xx.c b/hw/arm/pxa2xx.c
index 8b8845fc630..07d5dd8691f 100644
--- a/hw/arm/pxa2xx.c
+++ b/hw/arm/pxa2xx.c
@@ -2092,9 +2092,9 @@ static void pxa2xx_reset(void *opaque, int line, int level)
 }
 
 /* Initialise a PXA270 integrated chip (ARM based core).  */
-PXA2xxState *pxa270_init(MemoryRegion *address_space,
-                         unsigned int sdram_size, const char *cpu_type)
+PXA2xxState *pxa270_init(unsigned int sdram_size, const char *cpu_type)
 {
+    MemoryRegion *address_space = get_system_memory();
     PXA2xxState *s;
     int i;
     DriveInfo *dinfo;
diff --git a/hw/arm/spitz.c b/hw/arm/spitz.c
index 5aab0b85657..f732fe0acf9 100644
--- a/hw/arm/spitz.c
+++ b/hw/arm/spitz.c
@@ -986,18 +986,16 @@ static void spitz_common_init(MachineState *machine)
     SpitzMachineState *sms = SPITZ_MACHINE(machine);
     enum spitz_model_e model = smc->model;
     PXA2xxState *mpu;
-    MemoryRegion *address_space_mem = get_system_memory();
     MemoryRegion *rom = g_new(MemoryRegion, 1);
 
     /* Setup CPU & memory */
-    mpu = pxa270_init(address_space_mem, spitz_binfo.ram_size,
-                      machine->cpu_type);
+    mpu = pxa270_init(spitz_binfo.ram_size, machine->cpu_type);
     sms->mpu = mpu;
 
     sl_flash_register(mpu, (model == spitz) ? FLASH_128M : FLASH_1024M);
 
     memory_region_init_rom(rom, NULL, "spitz.rom", SPITZ_ROM, &error_fatal);
-    memory_region_add_subregion(address_space_mem, 0, rom);
+    memory_region_add_subregion(get_system_memory(), 0, rom);
 
     /* Setup peripherals */
     spitz_keyboard_register(mpu);
diff --git a/hw/arm/z2.c b/hw/arm/z2.c
index 9c1e876207b..8eb6f495bc9 100644
--- a/hw/arm/z2.c
+++ b/hw/arm/z2.c
@@ -299,7 +299,6 @@ static const TypeInfo aer915_info = {
 
 static void z2_init(MachineState *machine)
 {
-    MemoryRegion *address_space_mem = get_system_memory();
     uint32_t sector_len = 0x10000;
     PXA2xxState *mpu;
     DriveInfo *dinfo;
@@ -308,7 +307,7 @@ static void z2_init(MachineState *machine)
     DeviceState *wm;
 
     /* Setup CPU & memory */
-    mpu = pxa270_init(address_space_mem, z2_binfo.ram_size, machine->cpu_type);
+    mpu = pxa270_init(z2_binfo.ram_size, machine->cpu_type);
 
     dinfo = drive_get(IF_PFLASH, 0, 0);
     if (!pflash_cfi01_register(Z2_FLASH_BASE, "z2.flash0", Z2_FLASH_SIZE,
-- 
2.34.1


