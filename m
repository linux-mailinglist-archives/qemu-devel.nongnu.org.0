Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7180586BDD
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Aug 2022 15:23:05 +0200 (CEST)
Received: from localhost ([::1]:54910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIVNw-0005bz-QT
	for lists+qemu-devel@lfdr.de; Mon, 01 Aug 2022 09:23:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=LBbo=YF=kaod.org=clg@ozlabs.org>)
 id 1oIVCg-0004JW-7U; Mon, 01 Aug 2022 09:11:27 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:37769)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=LBbo=YF=kaod.org=clg@ozlabs.org>)
 id 1oIVCd-0007Ix-Kp; Mon, 01 Aug 2022 09:11:25 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4LxJRF2208z4xGD;
 Mon,  1 Aug 2022 23:11:21 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4LxJRB4J6Cz4x1L;
 Mon,  1 Aug 2022 23:11:18 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org,
 BALATON Zoltan <balaton@eik.bme.hu>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH 07/19] ppc/ppc405: QOM'ify CPC
Date: Mon,  1 Aug 2022 15:10:27 +0200
Message-Id: <20220801131039.1693913-8-clg@kaod.org>
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

Since all clock settings are now handled at the CPC level, this changes
the SoC "sys-clk" property to be an alias on the same property in the
CPC model.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/ppc/ppc405.h    |  39 +++++++++++++++-
 hw/ppc/ppc405_uc.c | 109 +++++++++++++++++++--------------------------
 2 files changed, 85 insertions(+), 63 deletions(-)

diff --git a/hw/ppc/ppc405.h b/hw/ppc/ppc405.h
index 4e99ab48be36..d51fb5094e95 100644
--- a/hw/ppc/ppc405.h
+++ b/hw/ppc/ppc405.h
@@ -63,6 +63,43 @@ struct ppc4xx_bd_info_t {
     uint32_t bi_iic_fast[2];
 };
 
+typedef struct Ppc405SoCState Ppc405SoCState;
+
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
+    DeviceState parent_obj;
+
+    PowerPCCPU *cpu;
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
 
@@ -79,9 +116,9 @@ struct Ppc405SoCState {
     MemoryRegion *dram_mr;
     hwaddr ram_size;
 
-    uint32_t sysclk;
     PowerPCCPU cpu;
     DeviceState *uic;
+    Ppc405CpcState cpc;
 };
 
 /* PowerPC 405 core */
diff --git a/hw/ppc/ppc405_uc.c b/hw/ppc/ppc405_uc.c
index b84749b36114..20a3e5543423 100644
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
@@ -1302,10 +1273,9 @@ static void ppc405ep_compute_clocks (ppc405ep_cpc_t *cpc)
 
 static uint32_t dcr_read_epcpc (void *opaque, int dcrn)
 {
-    ppc405ep_cpc_t *cpc;
+    Ppc405CpcState *cpc = PPC405_CPC(opaque);
     uint32_t ret;
 
-    cpc = opaque;
     switch (dcrn) {
     case PPC405EP_CPC0_BOOT:
         ret = cpc->boot;
@@ -1342,9 +1312,8 @@ static uint32_t dcr_read_epcpc (void *opaque, int dcrn)
 
 static void dcr_write_epcpc (void *opaque, int dcrn, uint32_t val)
 {
-    ppc405ep_cpc_t *cpc;
+    Ppc405CpcState *cpc = PPC405_CPC(opaque);
 
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
@@ -1391,21 +1360,24 @@ static void ppc405ep_cpc_reset (void *opaque)
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
+    CPUPPCState *env;
+
+    assert(cpc->cpu);
+
+    env = &cpc->cpu->env;
+
+    cpc->clk_setup[PPC405EP_CPU_CLK].cb =
+        ppc_40x_timers_init(env, cpc->sysclk, PPC_INTERRUPT_PIT);
+    cpc->clk_setup[PPC405EP_CPU_CLK].opaque = env;
 
-    cpc = g_new0(ppc405ep_cpc_t, 1);
-    memcpy(cpc->clk_setup, clk_setup,
-           PPC405EP_CLK_NB * sizeof(clk_setup_t));
-    cpc->jtagid = 0x20267049;
-    cpc->sysclk = sysclk;
-    qemu_register_reset(&ppc405ep_cpc_reset, cpc);
     ppc_dcr_register(env, PPC405EP_CPC0_BOOT, cpc,
                      &dcr_read_epcpc, &dcr_write_epcpc);
     ppc_dcr_register(env, PPC405EP_CPC0_EPCTL, cpc,
@@ -1422,14 +1394,23 @@ static void ppc405ep_cpc_init (CPUPPCState *env, clk_setup_t clk_setup[8],
                      &dcr_read_epcpc, &dcr_write_epcpc);
     ppc_dcr_register(env, PPC405EP_CPC0_PCI, cpc,
                      &dcr_read_epcpc, &dcr_write_epcpc);
-#if 0
-    ppc_dcr_register(env, PPC405EP_CPC0_ER, cpc,
-                     &dcr_read_epcpc, &dcr_write_epcpc);
-    ppc_dcr_register(env, PPC405EP_CPC0_FR, cpc,
-                     &dcr_read_epcpc, &dcr_write_epcpc);
-    ppc_dcr_register(env, PPC405EP_CPC0_SR, cpc,
-                     &dcr_read_epcpc, &dcr_write_epcpc);
-#endif
+}
+
+static Property ppc405_cpc_properties[] = {
+    DEFINE_PROP_LINK("cpu", Ppc405CpcState, cpu, TYPE_POWERPC_CPU,
+                     PowerPCCPU *),
+    DEFINE_PROP_UINT32("sys-clk", Ppc405CpcState, sysclk, 0),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void ppc405_cpc_class_init(ObjectClass *oc, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(oc);
+
+    dc->realize = ppc405_cpc_realize;
+    dc->user_creatable = false;
+    dc->reset = ppc405_cpc_reset;
+    device_class_set_props(dc, ppc405_cpc_properties);
 }
 
 static void ppc405_soc_instance_init(Object *obj)
@@ -1438,12 +1419,14 @@ static void ppc405_soc_instance_init(Object *obj)
 
     object_initialize_child(obj, "cpu", &s->cpu,
                             POWERPC_CPU_TYPE_NAME("405ep"));
+
+    object_initialize_child(obj, "cpc", &s->cpc, TYPE_PPC405_CPC);
+    object_property_add_alias(obj, "sys-clk", OBJECT(&s->cpc), "sys-clk");
 }
 
 static void ppc405_soc_realize(DeviceState *dev, Error **errp)
 {
     Ppc405SoCState *s = PPC405_SOC(dev);
-    clk_setup_t clk_setup[PPC405EP_CLK_NB];
     qemu_irq dma_irqs[4], gpt_irqs[5], mal_irqs[4];
     CPUPPCState *env;
     Error *err = NULL;
@@ -1467,8 +1450,6 @@ static void ppc405_soc_realize(DeviceState *dev, Error **errp)
     memory_region_add_subregion(get_system_memory(), PPC405EP_SRAM_BASE,
                                 &s->sram);
 
-    memset(clk_setup, 0, sizeof(clk_setup));
-
     /* init CPUs */
     if (!qdev_realize(DEVICE(&s->cpu), NULL, errp)) {
         return;
@@ -1476,14 +1457,14 @@ static void ppc405_soc_realize(DeviceState *dev, Error **errp)
 
     env = &s->cpu.env;
 
-    clk_setup[PPC405EP_CPU_CLK].cb =
-        ppc_40x_timers_init(env, s->sysclk, PPC_INTERRUPT_PIT);
-    clk_setup[PPC405EP_CPU_CLK].opaque = env;
-
     ppc_dcr_init(env, NULL, NULL);
 
     /* CPU control */
-    ppc405ep_cpc_init(env, clk_setup, s->sysclk);
+    object_property_set_link(OBJECT(&s->cpc), "cpu", OBJECT(&s->cpu),
+                             &error_abort);
+      if (!qdev_realize(DEVICE(&s->cpc), NULL, errp)) {
+        return;
+    }
 
     /* PLB arbitrer */
     ppc4xx_plb_init(env);
@@ -1568,7 +1549,6 @@ static void ppc405_soc_realize(DeviceState *dev, Error **errp)
 static Property ppc405_soc_properties[] = {
     DEFINE_PROP_LINK("dram", Ppc405SoCState, dram_mr, TYPE_MEMORY_REGION,
                      MemoryRegion *),
-    DEFINE_PROP_UINT32("sys-clk", Ppc405SoCState, sysclk, 0),
     DEFINE_PROP_BOOL("dram-init", Ppc405SoCState, do_dram_init, 0),
     DEFINE_PROP_UINT64("ram-size", Ppc405SoCState, ram_size, 0),
     DEFINE_PROP_END_OF_LIST(),
@@ -1585,6 +1565,11 @@ static void ppc405_soc_class_init(ObjectClass *oc, void *data)
 
 static const TypeInfo ppc405_types[] = {
     {
+        .name           = TYPE_PPC405_CPC,
+        .parent         = TYPE_DEVICE,
+        .instance_size  = sizeof(Ppc405CpcState),
+        .class_init     = ppc405_cpc_class_init,
+    }, {
         .name           = TYPE_PPC405_SOC,
         .parent         = TYPE_DEVICE,
         .instance_size  = sizeof(Ppc405SoCState),
-- 
2.37.1


