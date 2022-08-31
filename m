Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06CD75A86AA
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Aug 2022 21:21:32 +0200 (CEST)
Received: from localhost ([::1]:47652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTTHH-0002xZ-6p
	for lists+qemu-devel@lfdr.de; Wed, 31 Aug 2022 15:21:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oTSp9-0004g5-PQ; Wed, 31 Aug 2022 14:52:27 -0400
Received: from mail-oa1-x34.google.com ([2001:4860:4864:20::34]:44696)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oTSp7-00084D-L1; Wed, 31 Aug 2022 14:52:27 -0400
Received: by mail-oa1-x34.google.com with SMTP id
 586e51a60fabf-11eab59db71so22385866fac.11; 
 Wed, 31 Aug 2022 11:52:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=oOqWrwQJeDIHWONQkhcsNu14As2N/v1Tb4B+oEYeSsk=;
 b=GK8L4eubV2m6AqKmrPxqy+75cU/CQETG04ufwlHQm5UJDxvTDB87cMuvypud7YEa2Y
 X4cv2PP5jbXGNA4CoeVa4/lbtf1D3BbZuElDie0/3aJdpHwxCVJTL0vD1PxhCxOLpo4F
 QwICaQf/PC+9n7Ry9HUd5RR+XbJWQxX25iirEbe9nnF1stH/eRW7lIP5mOahbsiqU+uF
 B3Dlgyp20D4NhOVvLc7g9BeA4aY5TM5ujIkojefbFNHP8XPcsayDayxWBsXkCfl0xCsj
 RbPyYdQTxHIqVA1oO1kk4FxSaToZJbv6s9JrFZPHUGkaimhk2yY9iL+Q1UoV/4Hd9pZn
 EW0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=oOqWrwQJeDIHWONQkhcsNu14As2N/v1Tb4B+oEYeSsk=;
 b=MQzai5TJrIjFt6QzkxFr8rlJXZzBRx5gdiAw+QIil/ZFkY28byvMVVAzXSV/XCO0z+
 Jn/cuy9/M+AfqtFEBJ+nayUGH6qmOe0BXVH9qEeI+t7JJ54AD6K/SscidLXxA03o8fOF
 eMrAjgOA0f6rjeSjxzWqNMyzer6WYs0DZA/rqOC+8bGSliCgrxIItWcGYA3r7/v950ur
 15DGIojvYmqqxUTTv1CmNjMmX5uraPxDskT/uFJS3FmicsfLec7mo6KfwEcPjp6fB0jj
 OUq1zlprTws0pMX7PbzbxG5HYkrMFipTNs1eeR9UtyRd0kdaIdZ/RMR50702fBzVVi2R
 NzJQ==
X-Gm-Message-State: ACgBeo3fnkGTXUOcDV7SmVgkD+rhfrAY609URspPx8wZ0zqz5XFv1O65
 knwbh1F/W9AA2MUYP8NDHKX3kNuCTPA=
X-Google-Smtp-Source: AA6agR7uKzlVxC+zfeKwMSqedhKBajQSU4+q76RfX+eCwp9Bv2ZksBmlYHJmR5azhRgqxe3j0FSBNQ==
X-Received: by 2002:a05:6808:130c:b0:345:6ae9:6c88 with SMTP id
 y12-20020a056808130c00b003456ae96c88mr1756002oiv.191.1661971942524; 
 Wed, 31 Aug 2022 11:52:22 -0700 (PDT)
Received: from balboa.COMFAST ([177.189.45.98])
 by smtp.gmail.com with ESMTPSA id
 p4-20020a9d4544000000b0061cbd18bd18sm9599927oti.45.2022.08.31.11.52.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Aug 2022 11:52:22 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PULL 35/60] ppc/ppc405: Start QOMification of the SoC
Date: Wed, 31 Aug 2022 15:50:09 -0300
Message-Id: <20220831185034.23240-36-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220831185034.23240-1-danielhb413@gmail.com>
References: <20220831185034.23240-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::34;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x34.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Cédric Le Goater <clg@kaod.org>

This moves all the code previously done in the ppc405ep_init() routine
under ppc405_soc_realize(). We can also adjust the number of banks now
that we have control on ppc4xx_sdram_init().

Signed-off-by: Cédric Le Goater <clg@kaod.org>
Reviewed-by: BALATON Zoltan <balaton@eik.bme.hu>
Message-Id: <20220809153904.485018-7-clg@kaod.org>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/ppc405.h        |  12 ++--
 hw/ppc/ppc405_boards.c |  12 ++--
 hw/ppc/ppc405_uc.c     | 124 ++++++++++++++++++++---------------------
 3 files changed, 71 insertions(+), 77 deletions(-)

diff --git a/hw/ppc/ppc405.h b/hw/ppc/ppc405.h
index 66dc21cdfe..dc862bc861 100644
--- a/hw/ppc/ppc405.h
+++ b/hw/ppc/ppc405.h
@@ -73,9 +73,14 @@ struct Ppc405SoCState {
     /* Public */
     MemoryRegion ram_banks[2];
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
@@ -84,11 +89,4 @@ ram_addr_t ppc405_set_bootinfo(CPUPPCState *env, ram_addr_t ram_size);
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
index f029d6f415..b93e85b5d9 100644
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
+                             kernel_filename != NULL, &error_abort);
+    object_property_set_uint(OBJECT(&ppc405->soc), "sys-clk", 33333333,
+                             &error_abort);
     qdev_realize(DEVICE(&ppc405->soc), NULL, &error_fatal);
 
-    cpu = ppc405ep_init(sysmem, ppc405->soc.ram_banks, ppc405->soc.ram_bases,
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
index adadb3a0ae..c05ab60436 100644
--- a/hw/ppc/ppc405_uc.c
+++ b/hw/ppc/ppc405_uc.c
@@ -1432,121 +1432,118 @@ static void ppc405ep_cpc_init (CPUPPCState *env, clk_setup_t clk_setup[8],
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
         /* XXX 405EP has no ECC interrupt */
-    ppc4xx_sdram_init(env, qdev_get_gpio_in(uicdev, 17), 2, ram_memories,
-                      ram_bases, ram_sizes, do_init);
+    s->ram_bases[0] = 0;
+    s->ram_sizes[0] = s->ram_size;
+    memory_region_init_alias(&s->ram_banks[0], OBJECT(s),
+                             "ppc405.sdram0", s->dram_mr,
+                             s->ram_bases[0], s->ram_sizes[0]);
+
+    ppc4xx_sdram_init(env, qdev_get_gpio_in(s->uic, 17), 1,
+                      s->ram_banks, s->ram_bases, s->ram_sizes,
+                      s->do_dram_init);
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
-
-    /* Initialize only one bank */
-    s->ram_bases[0] = 0;
-    s->ram_sizes[0] = s->ram_size;
-    memory_region_init_alias(&s->ram_banks[0], OBJECT(s),
-                             "ppc405.sdram0", s->dram_mr,
-                             s->ram_bases[0], s->ram_sizes[0]);
 }
 
 static Property ppc405_soc_properties[] = {
     DEFINE_PROP_LINK("dram", Ppc405SoCState, dram_mr, TYPE_MEMORY_REGION,
                      MemoryRegion *),
+    DEFINE_PROP_UINT32("sys-clk", Ppc405SoCState, sysclk, 0),
+    DEFINE_PROP_BOOL("dram-init", Ppc405SoCState, do_dram_init, 0),
     DEFINE_PROP_UINT64("ram-size", Ppc405SoCState, ram_size, 0),
     DEFINE_PROP_END_OF_LIST(),
 };
@@ -1556,6 +1553,7 @@ static void ppc405_soc_class_init(ObjectClass *oc, void *data)
     DeviceClass *dc = DEVICE_CLASS(oc);
 
     dc->realize = ppc405_soc_realize;
+    /* Reason: only works as part of a ppc405 board/machine */
     dc->user_creatable = false;
     device_class_set_props(dc, ppc405_soc_properties);
 }
-- 
2.37.2


