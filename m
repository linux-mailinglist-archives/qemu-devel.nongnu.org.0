Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64235591B86
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Aug 2022 17:39:19 +0200 (CEST)
Received: from localhost ([::1]:36542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oMtEM-0006JP-Ek
	for lists+qemu-devel@lfdr.de; Sat, 13 Aug 2022 11:39:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oMt9q-00005h-3K; Sat, 13 Aug 2022 11:34:38 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:28282)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oMt9l-0006IN-3l; Sat, 13 Aug 2022 11:34:37 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 46E91748191;
 Sat, 13 Aug 2022 17:34:29 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 127CE748190; Sat, 13 Aug 2022 17:34:29 +0200 (CEST)
Message-Id: <155df7531214db48c3fd4da5dc866d842f332b7c.1660402839.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1660402839.git.balaton@eik.bme.hu>
References: <cover.1660402839.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH 02/22] ppc/ppc405: QOM'ify CPC
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org,
    qemu-ppc@nongnu.org
Cc: clg@kaod.org, Daniel Henrique Barboza <danielhb413@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 13 Aug 2022 17:34:29 +0200 (CEST)
X-Spam-Probability: 10%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

The CPC controller is currently modeled as a DCR device.

Now that all clock settings are handled at the CPC level, change the
SoC "sys-clk" property to be an alias on the same property in the CPC
model.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
---
 hw/ppc/ppc405.h    |  35 ++++++++++-
 hw/ppc/ppc405_uc.c | 141 ++++++++++++++++++++-------------------------
 2 files changed, 95 insertions(+), 81 deletions(-)

diff --git a/hw/ppc/ppc405.h b/hw/ppc/ppc405.h
index 8cc76cc8b3..2ba829988d 100644
--- a/hw/ppc/ppc405.h
+++ b/hw/ppc/ppc405.h
@@ -63,6 +63,39 @@ struct ppc4xx_bd_info_t {
     uint32_t bi_iic_fast[2];
 };
 
+#define TYPE_PPC405_CPC "ppc405-cpc"
+OBJECT_DECLARE_SIMPLE_TYPE(Ppc405CpcState, PPC405_CPC);
+
+enum {
+    PPC405EP_CPU_CLK   = 0,
+    PPC405EP_PLB_CLK   = 1,
+    PPC405EP_OPB_CLK   = 2,
+    PPC405EP_EBC_CLK   = 3,
+    PPC405EP_MAL_CLK   = 4,
+    PPC405EP_PCI_CLK   = 5,
+    PPC405EP_UART0_CLK = 6,
+    PPC405EP_UART1_CLK = 7,
+    PPC405EP_CLK_NB    = 8,
+};
+
+struct Ppc405CpcState {
+    Ppc4xxDcrDeviceState parent_obj;
+
+    uint32_t sysclk;
+    clk_setup_t clk_setup[PPC405EP_CLK_NB];
+    uint32_t boot;
+    uint32_t epctl;
+    uint32_t pllmr[2];
+    uint32_t ucr;
+    uint32_t srr;
+    uint32_t jtagid;
+    uint32_t pci;
+    /* Clock and power management */
+    uint32_t er;
+    uint32_t fr;
+    uint32_t sr;
+};
+
 #define TYPE_PPC405_SOC "ppc405-soc"
 OBJECT_DECLARE_SIMPLE_TYPE(Ppc405SoCState, PPC405_SOC);
 
@@ -78,9 +111,9 @@ struct Ppc405SoCState {
     MemoryRegion *dram_mr;
     hwaddr ram_size;
 
-    uint32_t sysclk;
     PowerPCCPU cpu;
     DeviceState *uic;
+    Ppc405CpcState cpc;
 };
 
 /* PowerPC 405 core */
diff --git a/hw/ppc/ppc405_uc.c b/hw/ppc/ppc405_uc.c
index 14a525b2eb..ec83c292a5 100644
--- a/hw/ppc/ppc405_uc.c
+++ b/hw/ppc/ppc405_uc.c
@@ -1178,36 +1178,7 @@ enum {
 #endif
 };
 
-enum {
-    PPC405EP_CPU_CLK   = 0,
-    PPC405EP_PLB_CLK   = 1,
-    PPC405EP_OPB_CLK   = 2,
-    PPC405EP_EBC_CLK   = 3,
-    PPC405EP_MAL_CLK   = 4,
-    PPC405EP_PCI_CLK   = 5,
-    PPC405EP_UART0_CLK = 6,
-    PPC405EP_UART1_CLK = 7,
-    PPC405EP_CLK_NB    = 8,
-};
-
-typedef struct ppc405ep_cpc_t ppc405ep_cpc_t;
-struct ppc405ep_cpc_t {
-    uint32_t sysclk;
-    clk_setup_t clk_setup[PPC405EP_CLK_NB];
-    uint32_t boot;
-    uint32_t epctl;
-    uint32_t pllmr[2];
-    uint32_t ucr;
-    uint32_t srr;
-    uint32_t jtagid;
-    uint32_t pci;
-    /* Clock and power management */
-    uint32_t er;
-    uint32_t fr;
-    uint32_t sr;
-};
-
-static void ppc405ep_compute_clocks (ppc405ep_cpc_t *cpc)
+static void ppc405ep_compute_clocks(Ppc405CpcState *cpc)
 {
     uint32_t CPU_clk, PLB_clk, OPB_clk, EBC_clk, MAL_clk, PCI_clk;
     uint32_t UART0_clk, UART1_clk;
@@ -1300,12 +1271,11 @@ static void ppc405ep_compute_clocks (ppc405ep_cpc_t *cpc)
     clk_setup(&cpc->clk_setup[PPC405EP_UART1_CLK], UART1_clk);
 }
 
-static uint32_t dcr_read_epcpc (void *opaque, int dcrn)
+static uint32_t dcr_read_epcpc(void *opaque, int dcrn)
 {
-    ppc405ep_cpc_t *cpc;
+    Ppc405CpcState *cpc = opaque;
     uint32_t ret;
 
-    cpc = opaque;
     switch (dcrn) {
     case PPC405EP_CPC0_BOOT:
         ret = cpc->boot;
@@ -1340,11 +1310,10 @@ static uint32_t dcr_read_epcpc (void *opaque, int dcrn)
     return ret;
 }
 
-static void dcr_write_epcpc (void *opaque, int dcrn, uint32_t val)
+static void dcr_write_epcpc(void *opaque, int dcrn, uint32_t val)
 {
-    ppc405ep_cpc_t *cpc;
+    Ppc405CpcState *cpc = opaque;
 
-    cpc = opaque;
     switch (dcrn) {
     case PPC405EP_CPC0_BOOT:
         /* Read-only register */
@@ -1377,9 +1346,9 @@ static void dcr_write_epcpc (void *opaque, int dcrn, uint32_t val)
     }
 }
 
-static void ppc405ep_cpc_reset (void *opaque)
+static void ppc405_cpc_reset(DeviceState *dev)
 {
-    ppc405ep_cpc_t *cpc = opaque;
+    Ppc405CpcState *cpc = PPC405_CPC(dev);
 
     cpc->boot = 0x00000010;     /* Boot from PCI - IIC EEPROM disabled */
     cpc->epctl = 0x00000000;
@@ -1391,53 +1360,66 @@ static void ppc405ep_cpc_reset (void *opaque)
     cpc->er = 0x00000000;
     cpc->fr = 0x00000000;
     cpc->sr = 0x00000000;
+    cpc->jtagid = 0x20267049;
     ppc405ep_compute_clocks(cpc);
 }
 
 /* XXX: sysclk should be between 25 and 100 MHz */
-static void ppc405ep_cpc_init (CPUPPCState *env, clk_setup_t clk_setup[8],
-                               uint32_t sysclk)
+static void ppc405_cpc_realize(DeviceState *dev, Error **errp)
 {
-    ppc405ep_cpc_t *cpc;
+    Ppc405CpcState *cpc = PPC405_CPC(dev);
+    Ppc4xxDcrDeviceState *dcr = PPC4xx_DCR_DEVICE(dev);
+
+    assert(dcr->cpu);
+    cpc->clk_setup[PPC405EP_CPU_CLK].cb =
+        ppc_40x_timers_init(&dcr->cpu->env, cpc->sysclk, PPC_INTERRUPT_PIT);
+    cpc->clk_setup[PPC405EP_CPU_CLK].opaque = &dcr->cpu->env;
+
+    ppc4xx_dcr_register(dcr, PPC405EP_CPC0_BOOT, cpc,
+                        &dcr_read_epcpc, &dcr_write_epcpc);
+    ppc4xx_dcr_register(dcr, PPC405EP_CPC0_EPCTL, cpc,
+                        &dcr_read_epcpc, &dcr_write_epcpc);
+    ppc4xx_dcr_register(dcr, PPC405EP_CPC0_PLLMR0, cpc,
+                        &dcr_read_epcpc, &dcr_write_epcpc);
+    ppc4xx_dcr_register(dcr, PPC405EP_CPC0_PLLMR1, cpc,
+                        &dcr_read_epcpc, &dcr_write_epcpc);
+    ppc4xx_dcr_register(dcr, PPC405EP_CPC0_UCR, cpc,
+                        &dcr_read_epcpc, &dcr_write_epcpc);
+    ppc4xx_dcr_register(dcr, PPC405EP_CPC0_SRR, cpc,
+                        &dcr_read_epcpc, &dcr_write_epcpc);
+    ppc4xx_dcr_register(dcr, PPC405EP_CPC0_JTAGID, cpc,
+                        &dcr_read_epcpc, &dcr_write_epcpc);
+    ppc4xx_dcr_register(dcr, PPC405EP_CPC0_PCI, cpc,
+                        &dcr_read_epcpc, &dcr_write_epcpc);
+}
 
-    cpc = g_new0(ppc405ep_cpc_t, 1);
-    memcpy(cpc->clk_setup, clk_setup,
-           PPC405EP_CLK_NB * sizeof(clk_setup_t));
-    cpc->jtagid = 0x20267049;
-    cpc->sysclk = sysclk;
-    qemu_register_reset(&ppc405ep_cpc_reset, cpc);
-    ppc_dcr_register(env, PPC405EP_CPC0_BOOT, cpc,
-                     &dcr_read_epcpc, &dcr_write_epcpc);
-    ppc_dcr_register(env, PPC405EP_CPC0_EPCTL, cpc,
-                     &dcr_read_epcpc, &dcr_write_epcpc);
-    ppc_dcr_register(env, PPC405EP_CPC0_PLLMR0, cpc,
-                     &dcr_read_epcpc, &dcr_write_epcpc);
-    ppc_dcr_register(env, PPC405EP_CPC0_PLLMR1, cpc,
-                     &dcr_read_epcpc, &dcr_write_epcpc);
-    ppc_dcr_register(env, PPC405EP_CPC0_UCR, cpc,
-                     &dcr_read_epcpc, &dcr_write_epcpc);
-    ppc_dcr_register(env, PPC405EP_CPC0_SRR, cpc,
-                     &dcr_read_epcpc, &dcr_write_epcpc);
-    ppc_dcr_register(env, PPC405EP_CPC0_JTAGID, cpc,
-                     &dcr_read_epcpc, &dcr_write_epcpc);
-    ppc_dcr_register(env, PPC405EP_CPC0_PCI, cpc,
-                     &dcr_read_epcpc, &dcr_write_epcpc);
-#if 0
-    ppc_dcr_register(env, PPC405EP_CPC0_ER, cpc,
-                     &dcr_read_epcpc, &dcr_write_epcpc);
-    ppc_dcr_register(env, PPC405EP_CPC0_FR, cpc,
-                     &dcr_read_epcpc, &dcr_write_epcpc);
-    ppc_dcr_register(env, PPC405EP_CPC0_SR, cpc,
-                     &dcr_read_epcpc, &dcr_write_epcpc);
-#endif
+static Property ppc405_cpc_properties[] = {
+    DEFINE_PROP_UINT32("sys-clk", Ppc405CpcState, sysclk, 0),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void ppc405_cpc_class_init(ObjectClass *oc, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(oc);
+
+    dc->realize = ppc405_cpc_realize;
+    dc->reset = ppc405_cpc_reset;
+    /* Reason: only works as function of a ppc4xx SoC */
+    dc->user_creatable = false;
+    device_class_set_props(dc, ppc405_cpc_properties);
 }
 
+/* PPC405_SOC */
+
 static void ppc405_soc_instance_init(Object *obj)
 {
     Ppc405SoCState *s = PPC405_SOC(obj);
 
     object_initialize_child(obj, "cpu", &s->cpu,
                             POWERPC_CPU_TYPE_NAME("405ep"));
+
+    object_initialize_child(obj, "cpc", &s->cpc, TYPE_PPC405_CPC);
+    object_property_add_alias(obj, "sys-clk", OBJECT(&s->cpc), "sys-clk");
 }
 
 static void ppc405_reset(void *opaque)
@@ -1448,12 +1430,9 @@ static void ppc405_reset(void *opaque)
 static void ppc405_soc_realize(DeviceState *dev, Error **errp)
 {
     Ppc405SoCState *s = PPC405_SOC(dev);
-    clk_setup_t clk_setup[PPC405EP_CLK_NB];
     qemu_irq dma_irqs[4], gpt_irqs[5], mal_irqs[4];
     CPUPPCState *env;
 
-    memset(clk_setup, 0, sizeof(clk_setup));
-
     /* init CPUs */
     if (!qdev_realize(DEVICE(&s->cpu), NULL, errp)) {
         return;
@@ -1462,14 +1441,12 @@ static void ppc405_soc_realize(DeviceState *dev, Error **errp)
 
     env = &s->cpu.env;
 
-    clk_setup[PPC405EP_CPU_CLK].cb =
-        ppc_40x_timers_init(env, s->sysclk, PPC_INTERRUPT_PIT);
-    clk_setup[PPC405EP_CPU_CLK].opaque = env;
-
     ppc_dcr_init(env, NULL, NULL);
 
     /* CPU control */
-    ppc405ep_cpc_init(env, clk_setup, s->sysclk);
+    if (!ppc4xx_dcr_realize(PPC4xx_DCR_DEVICE(&s->cpc), &s->cpu, errp)) {
+        return;
+    }
 
     /* PLB arbitrer */
     ppc4xx_plb_init(env);
@@ -1561,7 +1538,6 @@ static void ppc405_soc_realize(DeviceState *dev, Error **errp)
 static Property ppc405_soc_properties[] = {
     DEFINE_PROP_LINK("dram", Ppc405SoCState, dram_mr, TYPE_MEMORY_REGION,
                      MemoryRegion *),
-    DEFINE_PROP_UINT32("sys-clk", Ppc405SoCState, sysclk, 0),
     DEFINE_PROP_BOOL("dram-init", Ppc405SoCState, do_dram_init, 0),
     DEFINE_PROP_UINT64("ram-size", Ppc405SoCState, ram_size, 0),
     DEFINE_PROP_END_OF_LIST(),
@@ -1579,6 +1555,11 @@ static void ppc405_soc_class_init(ObjectClass *oc, void *data)
 
 static const TypeInfo ppc405_types[] = {
     {
+        .name           = TYPE_PPC405_CPC,
+        .parent         = TYPE_PPC4xx_DCR_DEVICE,
+        .instance_size  = sizeof(Ppc405CpcState),
+        .class_init     = ppc405_cpc_class_init,
+    }, {
         .name           = TYPE_PPC405_SOC,
         .parent         = TYPE_DEVICE,
         .instance_size  = sizeof(Ppc405SoCState),
-- 
2.30.4


