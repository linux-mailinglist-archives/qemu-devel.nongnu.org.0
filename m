Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC1D458C6E6
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Aug 2022 12:49:19 +0200 (CEST)
Received: from localhost ([::1]:37916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oL0Jy-00039q-OH
	for lists+qemu-devel@lfdr.de; Mon, 08 Aug 2022 06:49:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=c6th=YM=kaod.org=clg@ozlabs.org>)
 id 1oKzzX-0005XG-0o; Mon, 08 Aug 2022 06:28:11 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:41521)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=c6th=YM=kaod.org=clg@ozlabs.org>)
 id 1oKzzU-0001T5-J9; Mon, 08 Aug 2022 06:28:10 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4M1XTf1X7Xz4xVD;
 Mon,  8 Aug 2022 20:28:06 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4M1XTc1Gt7z4xVB;
 Mon,  8 Aug 2022 20:28:03 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org,
 BALATON Zoltan <balaton@eik.bme.hu>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH v3 09/22] ppc/ppc405: QOM'ify CPC
Date: Mon,  8 Aug 2022 12:27:21 +0200
Message-Id: <20220808102734.133084-10-clg@kaod.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220808102734.133084-1-clg@kaod.org>
References: <20220808102734.133084-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=c6th=YM=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
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

The OCM controller is currently modeled as a DCR device.

Now that all clock settings are handled at the CPC level, change the
SoC "sys-clk" property to be an alias on the same property in the CPC
model.

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/ppc/ppc405.h    |  35 ++++++++++++-
 hw/ppc/ppc405_uc.c | 122 +++++++++++++++++++--------------------------
 2 files changed, 86 insertions(+), 71 deletions(-)

diff --git a/hw/ppc/ppc405.h b/hw/ppc/ppc405.h
index 8cc76cc8b3fe..2ba829988de2 100644
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
index fa3853df2233..e45535b8e52a 100644
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
+static void ppc405_cpc_reset(DeviceState *opaque)
 {
-    ppc405ep_cpc_t *cpc = opaque;
+    Ppc405CpcState *cpc = PPC405_CPC(opaque);
 
     cpc->boot = 0x00000010;     /* Boot from PCI - IIC EEPROM disabled */
     cpc->epctl = 0x00000000;
@@ -1391,45 +1360,56 @@ static void ppc405ep_cpc_reset (void *opaque)
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
+    CPUPPCState *env;
 
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
+    assert(dcr->cpu);
+
+    env = &dcr->cpu->env;
+
+    cpc->clk_setup[PPC405EP_CPU_CLK].cb =
+        ppc_40x_timers_init(env, cpc->sysclk, PPC_INTERRUPT_PIT);
+    cpc->clk_setup[PPC405EP_CPU_CLK].opaque = env;
+
+    ppc4xx_dcr_register(dcr, PPC405EP_CPC0_BOOT,
                      &dcr_read_epcpc, &dcr_write_epcpc);
-    ppc_dcr_register(env, PPC405EP_CPC0_UCR, cpc,
+    ppc4xx_dcr_register(dcr, PPC405EP_CPC0_EPCTL,
                      &dcr_read_epcpc, &dcr_write_epcpc);
-    ppc_dcr_register(env, PPC405EP_CPC0_SRR, cpc,
+    ppc4xx_dcr_register(dcr, PPC405EP_CPC0_PLLMR0,
                      &dcr_read_epcpc, &dcr_write_epcpc);
-    ppc_dcr_register(env, PPC405EP_CPC0_JTAGID, cpc,
+    ppc4xx_dcr_register(dcr, PPC405EP_CPC0_PLLMR1,
                      &dcr_read_epcpc, &dcr_write_epcpc);
-    ppc_dcr_register(env, PPC405EP_CPC0_PCI, cpc,
+    ppc4xx_dcr_register(dcr, PPC405EP_CPC0_UCR,
                      &dcr_read_epcpc, &dcr_write_epcpc);
-#if 0
-    ppc_dcr_register(env, PPC405EP_CPC0_ER, cpc,
+    ppc4xx_dcr_register(dcr, PPC405EP_CPC0_SRR,
                      &dcr_read_epcpc, &dcr_write_epcpc);
-    ppc_dcr_register(env, PPC405EP_CPC0_FR, cpc,
+    ppc4xx_dcr_register(dcr, PPC405EP_CPC0_JTAGID,
                      &dcr_read_epcpc, &dcr_write_epcpc);
-    ppc_dcr_register(env, PPC405EP_CPC0_SR, cpc,
+    ppc4xx_dcr_register(dcr, PPC405EP_CPC0_PCI,
                      &dcr_read_epcpc, &dcr_write_epcpc);
-#endif
+}
+
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
+    dc->user_creatable = false;
+    device_class_set_props(dc, ppc405_cpc_properties);
+    dc->reset = ppc405_cpc_reset;
 }
 
 static void ppc405_soc_instance_init(Object *obj)
@@ -1438,17 +1418,17 @@ static void ppc405_soc_instance_init(Object *obj)
 
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
 
-    memset(clk_setup, 0, sizeof(clk_setup));
-
     /* init CPUs */
     if (!qdev_realize(DEVICE(&s->cpu), NULL, errp)) {
         return;
@@ -1457,14 +1437,12 @@ static void ppc405_soc_realize(DeviceState *dev, Error **errp)
 
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
@@ -1556,7 +1534,6 @@ static void ppc405_soc_realize(DeviceState *dev, Error **errp)
 static Property ppc405_soc_properties[] = {
     DEFINE_PROP_LINK("dram", Ppc405SoCState, dram_mr, TYPE_MEMORY_REGION,
                      MemoryRegion *),
-    DEFINE_PROP_UINT32("sys-clk", Ppc405SoCState, sysclk, 0),
     DEFINE_PROP_BOOL("dram-init", Ppc405SoCState, do_dram_init, 0),
     DEFINE_PROP_UINT64("ram-size", Ppc405SoCState, ram_size, 0),
     DEFINE_PROP_END_OF_LIST(),
@@ -1573,6 +1550,11 @@ static void ppc405_soc_class_init(ObjectClass *oc, void *data)
 
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
2.37.1


