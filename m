Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84AEB6624C1
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 12:55:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEqib-0002pB-Is; Mon, 09 Jan 2023 06:53:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEqiZ-0002od-9x
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 06:53:31 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEqiX-00081k-EU
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 06:53:31 -0500
Received: by mail-wm1-x32a.google.com with SMTP id m3so6086048wmq.0
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 03:53:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=f5egngPnKd3eXowoe9rSvuOk/WYn87jONK9fpMWE9oo=;
 b=nq0LEoq9wNXmRpFMh9EiF5b22JVd2yATmMcp9kR7Tv24lPBvOe3UT+LOJ4QWALohbi
 y3H7PM64pnp6BLlCkauBQL5o1DPnfsZNK2EAOl7FPMBNGKqwJ5jeWQ1qHq7D6cVsjm6d
 SMVzSltoxU2KxC6m959HITQoIKXhzrNJIA+EKu3T3TVLyO0ex7+mpHswTVSGPyApPExk
 4hHji9kPKlFMOB12nYj3oDTFIZqHCZtkiC2aDBGQR0/ihJDLjELMiFhGKNeehsEcmqfk
 4RjX0z96Hg0QXP+H3jHguNfJo76O0a3o+UuvxvpE+zxZlNGzor7qmQz/RTfgDPBG08LZ
 BUiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=f5egngPnKd3eXowoe9rSvuOk/WYn87jONK9fpMWE9oo=;
 b=NGQI6oYlVYCmZ72MrBu7gW0sMTP1yiwMnBA7xwRM+fyj7f0xt14Fjae7YazB0U6LMQ
 RmM+tliMYaMNgl6jNWj7M6flswH83pIkSpPMr90TgatkCuoxqn1+pUQ0pZrqX9gID6T1
 07s0Ui1xqRd+7JgpS5+1wuB+f6GNosdLbx57P85sgSRL1Bq8ZEXbCxb9iUjOPzigi0YP
 u+NGSTBCrrkRgnmAYvyo27EP0oY6eNi+EJpO8gFhZmioBopujBbDulVQcg07/sBszCyI
 OmN6Et3kSZsySkOw5UU0Jo37DxzEviOcegQxikRawfvxpU6OhWvEBnRdXbDwkPtYlAwg
 q0yQ==
X-Gm-Message-State: AFqh2kpGLukgrV1fTa1anGoaRJePNhhmmeU+SzbGEoDWvV2KqK594ukP
 TGiOQwZ+6YeUlGOIi6LBEbvhg76+mMV5joKj
X-Google-Smtp-Source: AMrXdXvK2gh1EpgI/tvEnS3PZe14SA66JxTOOtePl0Gbfbpr/ctjCJTPbDAHt29TZ2B7gefSydhP6Q==
X-Received: by 2002:a05:600c:4690:b0:3d9:f42c:56c5 with SMTP id
 p16-20020a05600c469000b003d9f42c56c5mr1086470wmo.4.1673265207803; 
 Mon, 09 Jan 2023 03:53:27 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 l3-20020a05600c4f0300b003a6125562e1sm11840678wmq.46.2023.01.09.03.53.26
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 09 Jan 2023 03:53:27 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Jan Kiszka <jan.kiszka@web.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 02/13] hw/arm/pxa2xx: Simplify pxa270_init()
Date: Mon,  9 Jan 2023 12:53:05 +0100
Message-Id: <20230109115316.2235-3-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230109115316.2235-1-philmd@linaro.org>
References: <20230109115316.2235-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Since pxa270_init() must map the device in the system memory,
there is no point in passing get_system_memory() by argument.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/gumstix.c     |  3 +--
 hw/arm/mainstone.c   | 10 ++++------
 hw/arm/pxa2xx.c      |  4 ++--
 hw/arm/spitz.c       |  6 ++----
 hw/arm/z2.c          |  3 +--
 include/hw/arm/pxa.h |  3 +--
 6 files changed, 11 insertions(+), 18 deletions(-)

diff --git a/hw/arm/gumstix.c b/hw/arm/gumstix.c
index c167518a46..ab9b0182f6 100644
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
index 8454b65458..f6293c6c13 100644
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
index 8b8845fc63..07d5dd8691 100644
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
index 5aab0b8565..f732fe0acf 100644
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
index 9c1e876207..8eb6f495bc 100644
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
diff --git a/include/hw/arm/pxa.h b/include/hw/arm/pxa.h
index c26007e57f..ba8f49e48e 100644
--- a/include/hw/arm/pxa.h
+++ b/include/hw/arm/pxa.h
@@ -193,8 +193,7 @@ struct PXA2xxI2SState {
 
 # define PA_FMT			"0x%08lx"
 
-PXA2xxState *pxa270_init(MemoryRegion *address_space, unsigned int sdram_size,
-                         const char *revision);
+PXA2xxState *pxa270_init(unsigned int sdram_size, const char *revision);
 PXA2xxState *pxa255_init(unsigned int sdram_size);
 
 #endif /* PXA_H */
-- 
2.38.1


