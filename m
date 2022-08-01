Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8336F586BDC
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Aug 2022 15:22:53 +0200 (CEST)
Received: from localhost ([::1]:54388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIVNk-0005Gq-HS
	for lists+qemu-devel@lfdr.de; Mon, 01 Aug 2022 09:22:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=LBbo=YF=kaod.org=clg@ozlabs.org>)
 id 1oIVCZ-0004F1-Ip; Mon, 01 Aug 2022 09:11:21 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:49499)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=LBbo=YF=kaod.org=clg@ozlabs.org>)
 id 1oIVCX-0007Gs-53; Mon, 01 Aug 2022 09:11:19 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4LxJR65F4Kz4xG8;
 Mon,  1 Aug 2022 23:11:14 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4LxJR40N5Bz4x1L;
 Mon,  1 Aug 2022 23:11:11 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org,
 BALATON Zoltan <balaton@eik.bme.hu>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH 05/19] ppc/ppc405: Start QOMification of the SoC
Date: Mon,  1 Aug 2022 15:10:25 +0200
Message-Id: <20220801131039.1693913-6-clg@kaod.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220801131039.1693913-1-clg@kaod.org>
References: <20220801131039.1693913-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=LBbo=YF=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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

This moves all the code previously done in the ppc405ep_init() routine
under ppc405_soc_realize().

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/ppc/ppc405.h        |  12 ++--
 hw/ppc/ppc405_boards.c |  12 ++--
 hw/ppc/ppc405_uc.c     | 151 ++++++++++++++++++++---------------------
 3 files changed, 84 insertions(+), 91 deletions(-)

diff --git a/hw/ppc/ppc405.h b/hw/ppc/ppc405.h
index c8cddb71733a..5e4e96d86ceb 100644
--- a/hw/ppc/ppc405.h
+++ b/hw/ppc/ppc405.h
@@ -74,9 +74,14 @@ struct Ppc405SoCState {
     MemoryRegion sram;
     MemoryRegion ram_memories[2];
     hwaddr ram_bases[2], ram_sizes[2];
+    bool do_dram_init;
 
     MemoryRegion *dram_mr;
     hwaddr ram_size;
+
+    uint32_t sysclk;
+    PowerPCCPU *cpu;
+    DeviceState *uic;
 };
 
 /* PowerPC 405 core */
@@ -85,11 +90,4 @@ ram_addr_t ppc405_set_bootinfo(CPUPPCState *env, ram_addr_t ram_size);
 void ppc4xx_plb_init(CPUPPCState *env);
 void ppc405_ebc_init(CPUPPCState *env);
 
-PowerPCCPU *ppc405ep_init(MemoryRegion *address_space_mem,
-                        MemoryRegion ram_memories[2],
-                        hwaddr ram_bases[2],
-                        hwaddr ram_sizes[2],
-                        uint32_t sysclk, DeviceState **uicdev,
-                        int do_init);
-
 #endif /* PPC405_H */
diff --git a/hw/ppc/ppc405_boards.c b/hw/ppc/ppc405_boards.c
index 96db52c5a309..363cb0770506 100644
--- a/hw/ppc/ppc405_boards.c
+++ b/hw/ppc/ppc405_boards.c
@@ -237,9 +237,7 @@ static void ppc405_init(MachineState *machine)
     Ppc405MachineState *ppc405 = PPC405_MACHINE(machine);
     MachineClass *mc = MACHINE_GET_CLASS(machine);
     const char *kernel_filename = machine->kernel_filename;
-    PowerPCCPU *cpu;
     MemoryRegion *sysmem = get_system_memory();
-    DeviceState *uicdev;
 
     if (machine->ram_size != mc->default_ram_size) {
         char *sz = size_to_str(mc->default_ram_size);
@@ -254,12 +252,12 @@ static void ppc405_init(MachineState *machine)
                              machine->ram_size, &error_fatal);
     object_property_set_link(OBJECT(&ppc405->soc), "dram",
                              OBJECT(machine->ram), &error_abort);
+    object_property_set_bool(OBJECT(&ppc405->soc), "dram-init",
+                             !(kernel_filename == NULL), &error_abort);
+    object_property_set_uint(OBJECT(&ppc405->soc), "sys-clk", 33333333,
+                             &error_abort);
     qdev_realize(DEVICE(&ppc405->soc), NULL, &error_abort);
 
-    cpu = ppc405ep_init(sysmem, ppc405->soc.ram_memories, ppc405->soc.ram_bases,
-                        ppc405->soc.ram_sizes,
-                        33333333, &uicdev, kernel_filename == NULL ? 0 : 1);
-
     /* allocate and load BIOS */
     if (machine->firmware) {
         MemoryRegion *bios = g_new(MemoryRegion, 1);
@@ -315,7 +313,7 @@ static void ppc405_init(MachineState *machine)
 
     /* Load ELF kernel and rootfs.cpio */
     } else if (kernel_filename && !machine->firmware) {
-        boot_from_kernel(machine, cpu);
+        boot_from_kernel(machine, ppc405->soc.cpu);
     }
 }
 
diff --git a/hw/ppc/ppc405_uc.c b/hw/ppc/ppc405_uc.c
index 156e839b8283..59612504bf3f 100644
--- a/hw/ppc/ppc405_uc.c
+++ b/hw/ppc/ppc405_uc.c
@@ -1432,134 +1432,131 @@ static void ppc405ep_cpc_init (CPUPPCState *env, clk_setup_t clk_setup[8],
 #endif
 }
 
-PowerPCCPU *ppc405ep_init(MemoryRegion *address_space_mem,
-                        MemoryRegion ram_memories[2],
-                        hwaddr ram_bases[2],
-                        hwaddr ram_sizes[2],
-                        uint32_t sysclk, DeviceState **uicdevp,
-                        int do_init)
+static void ppc405_soc_realize(DeviceState *dev, Error **errp)
 {
+    Ppc405SoCState *s = PPC405_SOC(dev);
     clk_setup_t clk_setup[PPC405EP_CLK_NB], tlb_clk_setup;
     qemu_irq dma_irqs[4], gpt_irqs[5], mal_irqs[4];
-    PowerPCCPU *cpu;
     CPUPPCState *env;
-    DeviceState *uicdev;
-    SysBusDevice *uicsbd;
+    Error *err = NULL;
+
+    /* XXX: fix this ? */
+    memory_region_init_alias(&s->ram_memories[0], OBJECT(s),
+                             "ef405ep.ram.alias", s->dram_mr, 0, s->ram_size);
+    s->ram_bases[0] = 0;
+    s->ram_sizes[0] = s->ram_size;
+    memory_region_init(&s->ram_memories[1], OBJECT(s), "ef405ep.ram1", 0);
+    s->ram_bases[1] = 0x00000000;
+    s->ram_sizes[1] = 0x00000000;
+
+    /* allocate SRAM */
+    memory_region_init_ram(&s->sram, OBJECT(s), "ef405ep.sram",
+                           PPC405EP_SRAM_SIZE, &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
+    memory_region_add_subregion(get_system_memory(), PPC405EP_SRAM_BASE,
+                                &s->sram);
 
     memset(clk_setup, 0, sizeof(clk_setup));
+
     /* init CPUs */
-    cpu = ppc4xx_init(POWERPC_CPU_TYPE_NAME("405ep"),
+    s->cpu = ppc4xx_init(POWERPC_CPU_TYPE_NAME("405ep"),
                       &clk_setup[PPC405EP_CPU_CLK],
-                      &tlb_clk_setup, sysclk);
-    env = &cpu->env;
+                      &tlb_clk_setup, s->sysclk);
+    env = &s->cpu->env;
     clk_setup[PPC405EP_CPU_CLK].cb = tlb_clk_setup.cb;
     clk_setup[PPC405EP_CPU_CLK].opaque = tlb_clk_setup.opaque;
-    /* Internal devices init */
-    /* Memory mapped devices registers */
+
+    /* CPU control */
+    ppc405ep_cpc_init(env, clk_setup, s->sysclk);
+
     /* PLB arbitrer */
     ppc4xx_plb_init(env);
+
     /* PLB to OPB bridge */
     ppc4xx_pob_init(env);
+
     /* OBP arbitrer */
     ppc4xx_opba_init(0xef600600);
+
     /* Universal interrupt controller */
-    uicdev = qdev_new(TYPE_PPC_UIC);
-    uicsbd = SYS_BUS_DEVICE(uicdev);
+    s->uic = qdev_new(TYPE_PPC_UIC);
 
-    object_property_set_link(OBJECT(uicdev), "cpu", OBJECT(cpu),
+    object_property_set_link(OBJECT(s->uic), "cpu", OBJECT(s->cpu),
                              &error_fatal);
-    sysbus_realize_and_unref(uicsbd, &error_fatal);
-
-    sysbus_connect_irq(uicsbd, PPCUIC_OUTPUT_INT,
-                       qdev_get_gpio_in(DEVICE(cpu), PPC40x_INPUT_INT));
-    sysbus_connect_irq(uicsbd, PPCUIC_OUTPUT_CINT,
-                       qdev_get_gpio_in(DEVICE(cpu), PPC40x_INPUT_CINT));
+    if (!sysbus_realize(SYS_BUS_DEVICE(s->uic), errp)) {
+        return;
+    }
 
-    *uicdevp = uicdev;
+    sysbus_connect_irq(SYS_BUS_DEVICE(s->uic), PPCUIC_OUTPUT_INT,
+                       qdev_get_gpio_in(DEVICE(s->cpu), PPC40x_INPUT_INT));
+    sysbus_connect_irq(SYS_BUS_DEVICE(s->uic), PPCUIC_OUTPUT_CINT,
+                       qdev_get_gpio_in(DEVICE(s->cpu), PPC40x_INPUT_CINT));
 
     /* SDRAM controller */
-        /* XXX 405EP has no ECC interrupt */
-    ppc4xx_sdram_init(env, qdev_get_gpio_in(uicdev, 17), 2, ram_memories,
-                      ram_bases, ram_sizes, do_init);
+    /* XXX 405EP has no ECC interrupt */
+    ppc4xx_sdram_init(env, qdev_get_gpio_in(s->uic, 17), 2, s->ram_memories,
+                      s->ram_bases, s->ram_sizes, s->do_dram_init);
+
     /* External bus controller */
     ppc405_ebc_init(env);
+
     /* DMA controller */
-    dma_irqs[0] = qdev_get_gpio_in(uicdev, 5);
-    dma_irqs[1] = qdev_get_gpio_in(uicdev, 6);
-    dma_irqs[2] = qdev_get_gpio_in(uicdev, 7);
-    dma_irqs[3] = qdev_get_gpio_in(uicdev, 8);
+    dma_irqs[0] = qdev_get_gpio_in(s->uic, 5);
+    dma_irqs[1] = qdev_get_gpio_in(s->uic, 6);
+    dma_irqs[2] = qdev_get_gpio_in(s->uic, 7);
+    dma_irqs[3] = qdev_get_gpio_in(s->uic, 8);
     ppc405_dma_init(env, dma_irqs);
-    /* IIC controller */
+
+    /* I2C controller */
     sysbus_create_simple(TYPE_PPC4xx_I2C, 0xef600500,
-                         qdev_get_gpio_in(uicdev, 2));
+                         qdev_get_gpio_in(s->uic, 2));
     /* GPIO */
     ppc405_gpio_init(0xef600700);
+
     /* Serial ports */
     if (serial_hd(0) != NULL) {
-        serial_mm_init(address_space_mem, 0xef600300, 0,
-                       qdev_get_gpio_in(uicdev, 0),
+        serial_mm_init(get_system_memory(), 0xef600300, 0,
+                       qdev_get_gpio_in(s->uic, 0),
                        PPC_SERIAL_MM_BAUDBASE, serial_hd(0),
                        DEVICE_BIG_ENDIAN);
     }
     if (serial_hd(1) != NULL) {
-        serial_mm_init(address_space_mem, 0xef600400, 0,
-                       qdev_get_gpio_in(uicdev, 1),
+        serial_mm_init(get_system_memory(), 0xef600400, 0,
+                       qdev_get_gpio_in(s->uic, 1),
                        PPC_SERIAL_MM_BAUDBASE, serial_hd(1),
                        DEVICE_BIG_ENDIAN);
     }
+
     /* OCM */
     ppc405_ocm_init(env);
+
     /* GPT */
-    gpt_irqs[0] = qdev_get_gpio_in(uicdev, 19);
-    gpt_irqs[1] = qdev_get_gpio_in(uicdev, 20);
-    gpt_irqs[2] = qdev_get_gpio_in(uicdev, 21);
-    gpt_irqs[3] = qdev_get_gpio_in(uicdev, 22);
-    gpt_irqs[4] = qdev_get_gpio_in(uicdev, 23);
+    gpt_irqs[0] = qdev_get_gpio_in(s->uic, 19);
+    gpt_irqs[1] = qdev_get_gpio_in(s->uic, 20);
+    gpt_irqs[2] = qdev_get_gpio_in(s->uic, 21);
+    gpt_irqs[3] = qdev_get_gpio_in(s->uic, 22);
+    gpt_irqs[4] = qdev_get_gpio_in(s->uic, 23);
     ppc4xx_gpt_init(0xef600000, gpt_irqs);
-    /* PCI */
-    /* Uses UIC IRQs 3, 16, 18 */
+
     /* MAL */
-    mal_irqs[0] = qdev_get_gpio_in(uicdev, 11);
-    mal_irqs[1] = qdev_get_gpio_in(uicdev, 12);
-    mal_irqs[2] = qdev_get_gpio_in(uicdev, 13);
-    mal_irqs[3] = qdev_get_gpio_in(uicdev, 14);
+    mal_irqs[0] = qdev_get_gpio_in(s->uic, 11);
+    mal_irqs[1] = qdev_get_gpio_in(s->uic, 12);
+    mal_irqs[2] = qdev_get_gpio_in(s->uic, 13);
+    mal_irqs[3] = qdev_get_gpio_in(s->uic, 14);
     ppc4xx_mal_init(env, 4, 2, mal_irqs);
+
     /* Ethernet */
     /* Uses UIC IRQs 9, 15, 17 */
-    /* CPU control */
-    ppc405ep_cpc_init(env, clk_setup, sysclk);
-
-    return cpu;
-}
-
-static void ppc405_soc_realize(DeviceState *dev, Error **errp)
-{
-    Ppc405SoCState *s = PPC405_SOC(dev);
-    Error *err = NULL;
-
-    /* XXX: fix this ? */
-    memory_region_init_alias(&s->ram_memories[0], OBJECT(s),
-                             "ef405ep.ram.alias", s->dram_mr, 0, s->ram_size);
-    s->ram_bases[0] = 0;
-    s->ram_sizes[0] = s->ram_size;
-    memory_region_init(&s->ram_memories[1], OBJECT(s), "ef405ep.ram1", 0);
-    s->ram_bases[1] = 0x00000000;
-    s->ram_sizes[1] = 0x00000000;
-
-    /* allocate SRAM */
-    memory_region_init_ram(&s->sram, OBJECT(s), "ef405ep.sram",
-                           PPC405EP_SRAM_SIZE,  &err);
-    if (err) {
-        error_propagate(errp, err);
-        return;
-    }
-    memory_region_add_subregion(get_system_memory(), PPC405EP_SRAM_BASE,
-                                &s->sram);
 }
 
 static Property ppc405_soc_properties[] = {
     DEFINE_PROP_LINK("dram", Ppc405SoCState, dram_mr, TYPE_MEMORY_REGION,
                      MemoryRegion *),
+    DEFINE_PROP_UINT32("sys-clk", Ppc405SoCState, sysclk, 0),
+    DEFINE_PROP_BOOL("dram-init", Ppc405SoCState, do_dram_init, 0),
     DEFINE_PROP_UINT64("ram-size", Ppc405SoCState, ram_size, 0),
     DEFINE_PROP_END_OF_LIST(),
 };
-- 
2.37.1


