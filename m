Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07A2B4ADB01
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 15:18:05 +0100 (CET)
Received: from localhost ([::1]:43042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHRJj-0000Pw-OM
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 09:18:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nHOqx-0000rQ-E7
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 06:40:11 -0500
Received: from [2a00:1450:4864:20::333] (port=37680
 helo=mail-wm1-x333.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nHOqt-00029A-9Q
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 06:40:11 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 l12-20020a7bc34c000000b003467c58cbdfso1120590wmj.2
 for <qemu-devel@nongnu.org>; Tue, 08 Feb 2022 03:40:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=ZXF8obUqyYR5kOFy49wzmo9l3CSXJa/zlm1Q7Oqye/E=;
 b=tdM6rMg/RZAZKhEH+hh4BMZQgn0dNdMidj6jwN3bb5ip0r3iZi4d9NCTAUSOBEKVI4
 sCfmTnZnRg1Q8j+FDN9b6oo/BWnbZegVTOv68Q0ulxBeGsC2BaTd7KaBIQhwRYaMtFzM
 jPy3H7h/+qZLsw4GZ38oALNusy8Fa+mmcF1mMcJNeymsj8CCFG37qzWYlIAzWa0b9gDI
 kA3QzPwJCRdXIci9sn6UZ5ENMYuQGfOcggya9ZlYdjVoyE5dL3UdGQG9xi5MDrJyF2or
 YCCgHOXWVayOeDfQnWEWGVJ2B0XGc876bU+JVHvlFXFC0XFEECgnoR1rruHKbO5EG5vT
 jdSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZXF8obUqyYR5kOFy49wzmo9l3CSXJa/zlm1Q7Oqye/E=;
 b=oWg6trlP54pnudo7rNskXcuMGGixV93Je+KH5X/9+VdXbpuVGlrms7bMZbnQ92oOOn
 lH/ZFX+zKgE3NsVe6STXXe3KqU3PERooghUziZAHfR+8potLMVMKP4EQQ0e8QqPMiFZI
 Uk2WAfRbmfrU4mRiuEKn96YtW7LiHgdk1WDploM3ohzRAfkkbm4C6E4LOjvgFkK5zwJG
 eKajzhNiUxboyuST0tYEjztTIO5SvEU5vcHBnfU5ZJZ+nSqNgc54pQ2gds+HlBIc1lOz
 G/IiIJePqRGy1q38jT94UmFfYB0ns2s11scn8ZWwwTyeX/9qK2GngZvGzzIgTH93bl14
 9vHg==
X-Gm-Message-State: AOAM531+UkerO4dsb9NGvfdnFM6BdX/kmmjJ3s1cRlxocAON0BproOIc
 SB35r7Taq8VvfZYw12KZ9X3ZduZPrqn7Sw==
X-Google-Smtp-Source: ABdhPJyezNSaNns2cJHCyqRwbA+iF2LHsL3PY+RvlGHt1VLvgEnGUXSywBcjLI8t16gJr1dpS/aBxw==
X-Received: by 2002:a05:600c:3b21:: with SMTP id
 m33mr763987wms.7.1644320403175; 
 Tue, 08 Feb 2022 03:40:03 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id r11sm4245199wrt.28.2022.02.08.03.40.02
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Feb 2022 03:40:02 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 20/39] hw/arm/boot: Drop nb_cpus field from arm_boot_info
Date: Tue,  8 Feb 2022 11:39:29 +0000
Message-Id: <20220208113948.3217356-21-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220208113948.3217356-1-peter.maydell@linaro.org>
References: <20220208113948.3217356-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::333
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

We use the arm_boot_info::nb_cpus field in only one place, and that
place can easily get the number of CPUs locally rather than relying
on the board code to have set the field correctly.  (At least one
board, xlnx-versal-virt, does not set the field despite having more
than one CPU.)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Niek Linnenbank <nieklinnenbank@gmail.com>
Tested-by: Cédric Le Goater <clg@kaod.org>
Tested-by: Niek Linnenbank <nieklinnenbank@gmail.com>
Message-id: 20220127154639.2090164-16-peter.maydell@linaro.org
---
 include/hw/arm/boot.h   | 1 -
 hw/arm/aspeed.c         | 1 -
 hw/arm/boot.c           | 7 +++----
 hw/arm/exynos4_boards.c | 1 -
 hw/arm/highbank.c       | 1 -
 hw/arm/imx25_pdk.c      | 3 +--
 hw/arm/kzm.c            | 1 -
 hw/arm/mcimx6ul-evk.c   | 1 -
 hw/arm/mcimx7d-sabre.c  | 1 -
 hw/arm/npcm7xx.c        | 3 ---
 hw/arm/orangepi.c       | 4 +---
 hw/arm/raspi.c          | 1 -
 hw/arm/realview.c       | 1 -
 hw/arm/sabrelite.c      | 1 -
 hw/arm/sbsa-ref.c       | 1 -
 hw/arm/vexpress.c       | 1 -
 hw/arm/virt.c           | 1 -
 hw/arm/xilinx_zynq.c    | 1 -
 18 files changed, 5 insertions(+), 26 deletions(-)

diff --git a/include/hw/arm/boot.h b/include/hw/arm/boot.h
index 0cfc1c95c4e..c7ebae156ec 100644
--- a/include/hw/arm/boot.h
+++ b/include/hw/arm/boot.h
@@ -56,7 +56,6 @@ struct arm_boot_info {
     hwaddr smp_loader_start;
     hwaddr smp_bootreg_addr;
     hwaddr gic_cpu_if_addr;
-    int nb_cpus;
     int board_id;
     /* ARM machines that support the ARM Security Extensions use this field to
      * control whether Linux is booted as secure(true) or non-secure(false).
diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index cf20ae0db5e..d911dc904fb 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -431,7 +431,6 @@ static void aspeed_machine_init(MachineState *machine)
 
     aspeed_board_binfo.ram_size = machine->ram_size;
     aspeed_board_binfo.loader_start = sc->memmap[ASPEED_DEV_SDRAM];
-    aspeed_board_binfo.nb_cpus = sc->num_cpus;
 
     if (amc->i2c_init) {
         amc->i2c_init(bmc);
diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index 184628ce564..b46f1fe889e 100644
--- a/hw/arm/boot.c
+++ b/hw/arm/boot.c
@@ -1030,9 +1030,6 @@ static void arm_setup_direct_kernel_boot(ARMCPU *cpu,
         elf_machine = EM_ARM;
     }
 
-    if (info->nb_cpus == 0)
-        info->nb_cpus = 1;
-
     /* Assume that raw images are linux kernels, and ELF images are not.  */
     kernel_size = arm_load_elf(info, &elf_entry, &image_low_addr,
                                &image_high_addr, elf_machine, as);
@@ -1291,6 +1288,7 @@ void arm_load_kernel(ARMCPU *cpu, MachineState *ms, struct arm_boot_info *info)
     AddressSpace *as = arm_boot_address_space(cpu, info);
     int boot_el;
     CPUARMState *env = &cpu->env;
+    int nb_cpus = 0;
 
     /*
      * CPU objects (unlike devices) are not automatically reset on system
@@ -1300,6 +1298,7 @@ void arm_load_kernel(ARMCPU *cpu, MachineState *ms, struct arm_boot_info *info)
      */
     for (cs = first_cpu; cs; cs = CPU_NEXT(cs)) {
         qemu_register_reset(do_cpu_reset, ARM_CPU(cs));
+        nb_cpus++;
     }
 
     /*
@@ -1376,7 +1375,7 @@ void arm_load_kernel(ARMCPU *cpu, MachineState *ms, struct arm_boot_info *info)
     }
 
     if (info->psci_conduit == QEMU_PSCI_CONDUIT_DISABLED &&
-        info->is_linux && info->nb_cpus > 1) {
+        info->is_linux && nb_cpus > 1) {
         /*
          * We're booting Linux but not using PSCI, so for SMP we need
          * to write a custom secondary CPU boot loader stub, and arrange
diff --git a/hw/arm/exynos4_boards.c b/hw/arm/exynos4_boards.c
index 35dd9875da1..ef5bcbc212c 100644
--- a/hw/arm/exynos4_boards.c
+++ b/hw/arm/exynos4_boards.c
@@ -67,7 +67,6 @@ static unsigned long exynos4_board_ram_size[EXYNOS4_NUM_OF_BOARDS] = {
 static struct arm_boot_info exynos4_board_binfo = {
     .loader_start     = EXYNOS4210_BASE_BOOT_ADDR,
     .smp_loader_start = EXYNOS4210_SMP_BOOT_ADDR,
-    .nb_cpus          = EXYNOS4210_NCPUS,
     .write_secondary_boot = exynos4210_write_secondary,
 };
 
diff --git a/hw/arm/highbank.c b/hw/arm/highbank.c
index da681b15708..f12aacea6b8 100644
--- a/hw/arm/highbank.c
+++ b/hw/arm/highbank.c
@@ -324,7 +324,6 @@ static void calxeda_init(MachineState *machine, enum cxmachines machine_id)
      * clear that the value is meaningless.
      */
     highbank_binfo.board_id = -1;
-    highbank_binfo.nb_cpus = smp_cpus;
     highbank_binfo.loader_start = 0;
     highbank_binfo.board_setup_addr = BOARD_SETUP_ADDR;
     highbank_binfo.psci_conduit = QEMU_PSCI_CONDUIT_SMC;
diff --git a/hw/arm/imx25_pdk.c b/hw/arm/imx25_pdk.c
index 6dff0001633..b4f7f4e8a7f 100644
--- a/hw/arm/imx25_pdk.c
+++ b/hw/arm/imx25_pdk.c
@@ -114,8 +114,7 @@ static void imx25_pdk_init(MachineState *machine)
 
     imx25_pdk_binfo.ram_size = machine->ram_size;
     imx25_pdk_binfo.loader_start = FSL_IMX25_SDRAM0_ADDR;
-    imx25_pdk_binfo.board_id = 1771,
-    imx25_pdk_binfo.nb_cpus = 1;
+    imx25_pdk_binfo.board_id = 1771;
 
     for (i = 0; i < FSL_IMX25_NUM_ESDHCS; i++) {
         BusState *bus;
diff --git a/hw/arm/kzm.c b/hw/arm/kzm.c
index 39559c44c29..b1b281c9acb 100644
--- a/hw/arm/kzm.c
+++ b/hw/arm/kzm.c
@@ -124,7 +124,6 @@ static void kzm_init(MachineState *machine)
     }
 
     kzm_binfo.ram_size = machine->ram_size;
-    kzm_binfo.nb_cpus = 1;
 
     if (!qtest_enabled()) {
         arm_load_kernel(&s->soc.cpu, machine, &kzm_binfo);
diff --git a/hw/arm/mcimx6ul-evk.c b/hw/arm/mcimx6ul-evk.c
index 8131518426a..d83c3c380e8 100644
--- a/hw/arm/mcimx6ul-evk.c
+++ b/hw/arm/mcimx6ul-evk.c
@@ -34,7 +34,6 @@ static void mcimx6ul_evk_init(MachineState *machine)
         .loader_start = FSL_IMX6UL_MMDC_ADDR,
         .board_id = -1,
         .ram_size = machine->ram_size,
-        .nb_cpus = machine->smp.cpus,
         .psci_conduit = QEMU_PSCI_CONDUIT_SMC,
     };
 
diff --git a/hw/arm/mcimx7d-sabre.c b/hw/arm/mcimx7d-sabre.c
index ba84fc21920..6182b15f190 100644
--- a/hw/arm/mcimx7d-sabre.c
+++ b/hw/arm/mcimx7d-sabre.c
@@ -36,7 +36,6 @@ static void mcimx7d_sabre_init(MachineState *machine)
         .loader_start = FSL_IMX7_MMDC_ADDR,
         .board_id = -1,
         .ram_size = machine->ram_size,
-        .nb_cpus = machine->smp.cpus,
         .psci_conduit = QEMU_PSCI_CONDUIT_SMC,
     };
 
diff --git a/hw/arm/npcm7xx.c b/hw/arm/npcm7xx.c
index 878c2208e07..d85cc027651 100644
--- a/hw/arm/npcm7xx.c
+++ b/hw/arm/npcm7xx.c
@@ -355,10 +355,7 @@ static struct arm_boot_info npcm7xx_binfo = {
 
 void npcm7xx_load_kernel(MachineState *machine, NPCM7xxState *soc)
 {
-    NPCM7xxClass *sc = NPCM7XX_GET_CLASS(soc);
-
     npcm7xx_binfo.ram_size = machine->ram_size;
-    npcm7xx_binfo.nb_cpus = sc->num_cpus;
 
     arm_load_kernel(&soc->cpu[0], machine, &npcm7xx_binfo);
 }
diff --git a/hw/arm/orangepi.c b/hw/arm/orangepi.c
index 68fe9182414..3ace4748704 100644
--- a/hw/arm/orangepi.c
+++ b/hw/arm/orangepi.c
@@ -25,9 +25,7 @@
 #include "hw/qdev-properties.h"
 #include "hw/arm/allwinner-h3.h"
 
-static struct arm_boot_info orangepi_binfo = {
-    .nb_cpus = AW_H3_NUM_CPUS,
-};
+static struct arm_boot_info orangepi_binfo;
 
 static void orangepi_init(MachineState *machine)
 {
diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c
index b4dd6c1e99a..92d068d1f9d 100644
--- a/hw/arm/raspi.c
+++ b/hw/arm/raspi.c
@@ -204,7 +204,6 @@ static void setup_boot(MachineState *machine, RaspiProcessorId processor_id,
 
     s->binfo.board_id = MACH_TYPE_BCM2708;
     s->binfo.ram_size = ram_size;
-    s->binfo.nb_cpus = machine->smp.cpus;
 
     if (processor_id <= PROCESSOR_ID_BCM2836) {
         /*
diff --git a/hw/arm/realview.c b/hw/arm/realview.c
index ddc70b54a56..7b424e94a5f 100644
--- a/hw/arm/realview.c
+++ b/hw/arm/realview.c
@@ -363,7 +363,6 @@ static void realview_init(MachineState *machine,
     memory_region_add_subregion(sysmem, SMP_BOOT_ADDR, ram_hack);
 
     realview_binfo.ram_size = ram_size;
-    realview_binfo.nb_cpus = smp_cpus;
     realview_binfo.board_id = realview_board_id[board_type];
     realview_binfo.loader_start = (board_type == BOARD_PB_A8 ? 0x70000000 : 0);
     arm_load_kernel(ARM_CPU(first_cpu), machine, &realview_binfo);
diff --git a/hw/arm/sabrelite.c b/hw/arm/sabrelite.c
index cce49aa25cf..41191245b81 100644
--- a/hw/arm/sabrelite.c
+++ b/hw/arm/sabrelite.c
@@ -93,7 +93,6 @@ static void sabrelite_init(MachineState *machine)
     }
 
     sabrelite_binfo.ram_size = machine->ram_size;
-    sabrelite_binfo.nb_cpus = machine->smp.cpus;
     sabrelite_binfo.secure_boot = true;
     sabrelite_binfo.write_secondary_boot = sabrelite_write_secondary;
     sabrelite_binfo.secondary_cpu_reset_hook = sabrelite_reset_secondary;
diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
index dd944553f78..23874019639 100644
--- a/hw/arm/sbsa-ref.c
+++ b/hw/arm/sbsa-ref.c
@@ -776,7 +776,6 @@ static void sbsa_ref_init(MachineState *machine)
     create_secure_ec(secure_sysmem);
 
     sms->bootinfo.ram_size = machine->ram_size;
-    sms->bootinfo.nb_cpus = smp_cpus;
     sms->bootinfo.board_id = -1;
     sms->bootinfo.loader_start = sbsa_ref_memmap[SBSA_MEM].base;
     sms->bootinfo.get_dtb = sbsa_ref_dtb;
diff --git a/hw/arm/vexpress.c b/hw/arm/vexpress.c
index 3e99b7918ab..e1d1983ae65 100644
--- a/hw/arm/vexpress.c
+++ b/hw/arm/vexpress.c
@@ -708,7 +708,6 @@ static void vexpress_common_init(MachineState *machine)
     }
 
     daughterboard->bootinfo.ram_size = machine->ram_size;
-    daughterboard->bootinfo.nb_cpus = machine->smp.cpus;
     daughterboard->bootinfo.board_id = VEXPRESS_BOARD_ID;
     daughterboard->bootinfo.loader_start = daughterboard->loader_start;
     daughterboard->bootinfo.smp_loader_start = map[VE_SRAM];
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 398145a7180..46bf7ceddf3 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2229,7 +2229,6 @@ static void machvirt_init(MachineState *machine)
     }
 
     vms->bootinfo.ram_size = machine->ram_size;
-    vms->bootinfo.nb_cpus = smp_cpus;
     vms->bootinfo.board_id = -1;
     vms->bootinfo.loader_start = vms->memmap[VIRT_MEM].base;
     vms->bootinfo.get_dtb = machvirt_dtb;
diff --git a/hw/arm/xilinx_zynq.c b/hw/arm/xilinx_zynq.c
index 50e7268396c..3190cc0b8db 100644
--- a/hw/arm/xilinx_zynq.c
+++ b/hw/arm/xilinx_zynq.c
@@ -343,7 +343,6 @@ static void zynq_init(MachineState *machine)
     sysbus_mmio_map(busdev, 0, 0xF8007000);
 
     zynq_binfo.ram_size = machine->ram_size;
-    zynq_binfo.nb_cpus = 1;
     zynq_binfo.board_id = 0xd32;
     zynq_binfo.loader_start = 0;
     zynq_binfo.board_setup_addr = BOARD_SETUP_ADDR;
-- 
2.25.1


