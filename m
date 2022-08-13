Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E910E591BD3
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Aug 2022 17:59:42 +0200 (CEST)
Received: from localhost ([::1]:55030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oMtY6-0005UD-1Q
	for lists+qemu-devel@lfdr.de; Sat, 13 Aug 2022 11:59:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oMt9w-0000St-Ap; Sat, 13 Aug 2022 11:34:44 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:28327)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oMt9t-0006KX-M8; Sat, 13 Aug 2022 11:34:44 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id D0ABB748191;
 Sat, 13 Aug 2022 17:34:38 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 835B274818E; Sat, 13 Aug 2022 17:34:38 +0200 (CEST)
Message-Id: <61905349d9e9c07f37373e3a4d77f47b607dab19.1660402839.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1660402839.git.balaton@eik.bme.hu>
References: <cover.1660402839.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH 11/22] ppc/ppc405: QOM'ify MAL
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org,
    qemu-ppc@nongnu.org
Cc: clg@kaod.org, Daniel Henrique Barboza <danielhb413@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 13 Aug 2022 17:34:38 +0200 (CEST)
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

The Memory Access Layer (MAL) controller is currently modeled as a DCR
device with 4 IRQs. Also drop the ppc4xx_mal_init() helper and adapt
the sam460ex machine.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
---
 hw/ppc/ppc405.h         |   1 +
 hw/ppc/ppc405_uc.c      |  17 +++--
 hw/ppc/ppc4xx_devs.c    | 145 ++++++++++++++++++++--------------------
 hw/ppc/sam460ex.c       |  12 ++--
 include/hw/ppc/ppc4xx.h |  28 +++++++-
 5 files changed, 117 insertions(+), 86 deletions(-)

diff --git a/hw/ppc/ppc405.h b/hw/ppc/ppc405.h
index cb34792daf..31c94e4742 100644
--- a/hw/ppc/ppc405.h
+++ b/hw/ppc/ppc405.h
@@ -244,6 +244,7 @@ struct Ppc405SoCState {
     Ppc405OpbaState opba;
     Ppc405PobState pob;
     Ppc405PlbState plb;
+    Ppc4xxMalState mal;
 };
 
 /* PowerPC 405 core */
diff --git a/hw/ppc/ppc405_uc.c b/hw/ppc/ppc405_uc.c
index 94ea6b5b70..922c23346f 100644
--- a/hw/ppc/ppc405_uc.c
+++ b/hw/ppc/ppc405_uc.c
@@ -1372,6 +1372,8 @@ static void ppc405_soc_instance_init(Object *obj)
     object_initialize_child(obj, "pob", &s->pob, TYPE_PPC405_POB);
 
     object_initialize_child(obj, "plb", &s->plb, TYPE_PPC405_PLB);
+
+    object_initialize_child(obj, "mal", &s->mal, TYPE_PPC4xx_MAL);
 }
 
 static void ppc405_reset(void *opaque)
@@ -1382,7 +1384,6 @@ static void ppc405_reset(void *opaque)
 static void ppc405_soc_realize(DeviceState *dev, Error **errp)
 {
     Ppc405SoCState *s = PPC405_SOC(dev);
-    qemu_irq mal_irqs[4];
     CPUPPCState *env;
     SysBusDevice *sbd;
     int i;
@@ -1500,11 +1501,15 @@ static void ppc405_soc_realize(DeviceState *dev, Error **errp)
     }
 
     /* MAL */
-    mal_irqs[0] = qdev_get_gpio_in(s->uic, 11);
-    mal_irqs[1] = qdev_get_gpio_in(s->uic, 12);
-    mal_irqs[2] = qdev_get_gpio_in(s->uic, 13);
-    mal_irqs[3] = qdev_get_gpio_in(s->uic, 14);
-    ppc4xx_mal_init(env, 4, 2, mal_irqs);
+    object_property_set_int(OBJECT(&s->mal), "txc-num", 4, &error_abort);
+    object_property_set_int(OBJECT(&s->mal), "rxc-num", 2, &error_abort);
+    if (!ppc4xx_dcr_realize(PPC4xx_DCR_DEVICE(&s->mal), &s->cpu, errp)) {
+        return;
+    }
+    sbd = SYS_BUS_DEVICE(&s->mal);
+    for (i = 0; i < ARRAY_SIZE(s->mal.irqs); i++) {
+        sysbus_connect_irq(sbd, i, qdev_get_gpio_in(s->uic, 11 + i));
+    }
 
     /* Ethernet */
     /* Uses UIC IRQs 9, 15, 17 */
diff --git a/hw/ppc/ppc4xx_devs.c b/hw/ppc/ppc4xx_devs.c
index f4d7ae9567..7d40c1b68a 100644
--- a/hw/ppc/ppc4xx_devs.c
+++ b/hw/ppc/ppc4xx_devs.c
@@ -459,32 +459,10 @@ enum {
     MAL0_RCBS1    = 0x1E1,
 };
 
-typedef struct ppc4xx_mal_t ppc4xx_mal_t;
-struct ppc4xx_mal_t {
-    qemu_irq irqs[4];
-    uint32_t cfg;
-    uint32_t esr;
-    uint32_t ier;
-    uint32_t txcasr;
-    uint32_t txcarr;
-    uint32_t txeobisr;
-    uint32_t txdeir;
-    uint32_t rxcasr;
-    uint32_t rxcarr;
-    uint32_t rxeobisr;
-    uint32_t rxdeir;
-    uint32_t *txctpr;
-    uint32_t *rxctpr;
-    uint32_t *rcbs;
-    uint8_t  txcnum;
-    uint8_t  rxcnum;
-};
-
-static void ppc4xx_mal_reset(void *opaque)
+static void ppc4xx_mal_reset(DeviceState *dev)
 {
-    ppc4xx_mal_t *mal;
+    Ppc4xxMalState *mal = PPC4xx_MAL(dev);
 
-    mal = opaque;
     mal->cfg = 0x0007C000;
     mal->esr = 0x00000000;
     mal->ier = 0x00000000;
@@ -498,10 +476,9 @@ static void ppc4xx_mal_reset(void *opaque)
 
 static uint32_t dcr_read_mal(void *opaque, int dcrn)
 {
-    ppc4xx_mal_t *mal;
+    Ppc4xxMalState *mal = opaque;
     uint32_t ret;
 
-    mal = opaque;
     switch (dcrn) {
     case MAL0_CFG:
         ret = mal->cfg;
@@ -555,13 +532,12 @@ static uint32_t dcr_read_mal(void *opaque, int dcrn)
 
 static void dcr_write_mal(void *opaque, int dcrn, uint32_t val)
 {
-    ppc4xx_mal_t *mal;
+    Ppc4xxMalState *mal = opaque;
 
-    mal = opaque;
     switch (dcrn) {
     case MAL0_CFG:
         if (val & 0x80000000) {
-            ppc4xx_mal_reset(mal);
+            ppc4xx_mal_reset(DEVICE(mal));
         }
         mal->cfg = val & 0x00FFC087;
         break;
@@ -612,59 +588,76 @@ static void dcr_write_mal(void *opaque, int dcrn, uint32_t val)
     }
 }
 
-void ppc4xx_mal_init(CPUPPCState *env, uint8_t txcnum, uint8_t rxcnum,
-                     qemu_irq irqs[4])
+static void ppc4xx_mal_realize(DeviceState *dev, Error **errp)
 {
-    ppc4xx_mal_t *mal;
+    Ppc4xxMalState *mal = PPC4xx_MAL(dev);
+    Ppc4xxDcrDeviceState *dcr = PPC4xx_DCR_DEVICE(dev);
     int i;
 
-    assert(txcnum <= 32 && rxcnum <= 32);
-    mal = g_malloc0(sizeof(*mal));
-    mal->txcnum = txcnum;
-    mal->rxcnum = rxcnum;
-    mal->txctpr = g_new0(uint32_t, txcnum);
-    mal->rxctpr = g_new0(uint32_t, rxcnum);
-    mal->rcbs = g_new0(uint32_t, rxcnum);
-    for (i = 0; i < 4; i++) {
-        mal->irqs[i] = irqs[i];
+    if (mal->txcnum > 32 || mal->rxcnum > 32) {
+        error_setg(errp, "invalid TXC/RXC number");
+        return;
+    }
+
+    mal->txctpr = g_new0(uint32_t, mal->txcnum);
+    mal->rxctpr = g_new0(uint32_t, mal->rxcnum);
+    mal->rcbs = g_new0(uint32_t, mal->rxcnum);
+
+    for (i = 0; i < ARRAY_SIZE(mal->irqs); i++) {
+        sysbus_init_irq(SYS_BUS_DEVICE(dev), &mal->irqs[i]);
     }
-    qemu_register_reset(&ppc4xx_mal_reset, mal);
-    ppc_dcr_register(env, MAL0_CFG,
-                     mal, &dcr_read_mal, &dcr_write_mal);
-    ppc_dcr_register(env, MAL0_ESR,
-                     mal, &dcr_read_mal, &dcr_write_mal);
-    ppc_dcr_register(env, MAL0_IER,
-                     mal, &dcr_read_mal, &dcr_write_mal);
-    ppc_dcr_register(env, MAL0_TXCASR,
-                     mal, &dcr_read_mal, &dcr_write_mal);
-    ppc_dcr_register(env, MAL0_TXCARR,
-                     mal, &dcr_read_mal, &dcr_write_mal);
-    ppc_dcr_register(env, MAL0_TXEOBISR,
-                     mal, &dcr_read_mal, &dcr_write_mal);
-    ppc_dcr_register(env, MAL0_TXDEIR,
-                     mal, &dcr_read_mal, &dcr_write_mal);
-    ppc_dcr_register(env, MAL0_RXCASR,
-                     mal, &dcr_read_mal, &dcr_write_mal);
-    ppc_dcr_register(env, MAL0_RXCARR,
-                     mal, &dcr_read_mal, &dcr_write_mal);
-    ppc_dcr_register(env, MAL0_RXEOBISR,
-                     mal, &dcr_read_mal, &dcr_write_mal);
-    ppc_dcr_register(env, MAL0_RXDEIR,
-                     mal, &dcr_read_mal, &dcr_write_mal);
-    for (i = 0; i < txcnum; i++) {
-        ppc_dcr_register(env, MAL0_TXCTP0R + i,
-                         mal, &dcr_read_mal, &dcr_write_mal);
+
+    ppc4xx_dcr_register(dcr, MAL0_CFG, mal, &dcr_read_mal, &dcr_write_mal);
+    ppc4xx_dcr_register(dcr, MAL0_ESR, mal, &dcr_read_mal, &dcr_write_mal);
+    ppc4xx_dcr_register(dcr, MAL0_IER, mal, &dcr_read_mal, &dcr_write_mal);
+    ppc4xx_dcr_register(dcr, MAL0_TXCASR, mal, &dcr_read_mal, &dcr_write_mal);
+    ppc4xx_dcr_register(dcr, MAL0_TXCARR, mal, &dcr_read_mal, &dcr_write_mal);
+    ppc4xx_dcr_register(dcr, MAL0_TXEOBISR, mal, &dcr_read_mal, &dcr_write_mal);
+    ppc4xx_dcr_register(dcr, MAL0_TXDEIR, mal, &dcr_read_mal, &dcr_write_mal);
+    ppc4xx_dcr_register(dcr, MAL0_RXCASR, mal, &dcr_read_mal, &dcr_write_mal);
+    ppc4xx_dcr_register(dcr, MAL0_RXCARR, mal, &dcr_read_mal, &dcr_write_mal);
+    ppc4xx_dcr_register(dcr, MAL0_RXEOBISR, mal, &dcr_read_mal, &dcr_write_mal);
+    ppc4xx_dcr_register(dcr, MAL0_RXDEIR, mal, &dcr_read_mal, &dcr_write_mal);
+    for (i = 0; i < mal->txcnum; i++) {
+        ppc4xx_dcr_register(dcr, MAL0_TXCTP0R + i,
+                            mal, &dcr_read_mal, &dcr_write_mal);
     }
-    for (i = 0; i < rxcnum; i++) {
-        ppc_dcr_register(env, MAL0_RXCTP0R + i,
-                         mal, &dcr_read_mal, &dcr_write_mal);
+    for (i = 0; i < mal->rxcnum; i++) {
+        ppc4xx_dcr_register(dcr, MAL0_RXCTP0R + i,
+                            mal, &dcr_read_mal, &dcr_write_mal);
     }
-    for (i = 0; i < rxcnum; i++) {
-        ppc_dcr_register(env, MAL0_RCBS0 + i,
-                         mal, &dcr_read_mal, &dcr_write_mal);
+    for (i = 0; i < mal->rxcnum; i++) {
+        ppc4xx_dcr_register(dcr, MAL0_RCBS0 + i,
+                            mal, &dcr_read_mal, &dcr_write_mal);
     }
 }
 
+static void ppc4xx_mal_finalize(Object *obj)
+{
+    Ppc4xxMalState *mal = PPC4xx_MAL(obj);
+
+    g_free(mal->rcbs);
+    g_free(mal->rxctpr);
+    g_free(mal->txctpr);
+}
+
+static Property ppc4xx_mal_properties[] = {
+    DEFINE_PROP_UINT8("txc-num", Ppc4xxMalState, txcnum, 0),
+    DEFINE_PROP_UINT8("rxc-num", Ppc4xxMalState, rxcnum, 0),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void ppc4xx_mal_class_init(ObjectClass *oc, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(oc);
+
+    dc->realize = ppc4xx_mal_realize;
+    dc->reset = ppc4xx_mal_reset;
+    /* Reason: only works as function of a ppc4xx SoC */
+    dc->user_creatable = false;
+    device_class_set_props(dc, ppc4xx_mal_properties);
+}
+
 /* PPC4xx_DCR_DEVICE */
 
 void ppc4xx_dcr_register(Ppc4xxDcrDeviceState *dev, int dcrn, void *opaque,
@@ -696,6 +689,12 @@ static void ppc4xx_dcr_class_init(ObjectClass *oc, void *data)
 
 static const TypeInfo ppc4xx_types[] = {
     {
+        .name           = TYPE_PPC4xx_MAL,
+        .parent         = TYPE_PPC4xx_DCR_DEVICE,
+        .instance_size  = sizeof(Ppc4xxMalState),
+        .instance_finalize = ppc4xx_mal_finalize,
+        .class_init     = ppc4xx_mal_class_init,
+    }, {
         .name           = TYPE_PPC4xx_DCR_DEVICE,
         .parent         = TYPE_SYS_BUS_DEVICE,
         .instance_size  = sizeof(Ppc4xxDcrDeviceState),
diff --git a/hw/ppc/sam460ex.c b/hw/ppc/sam460ex.c
index 31139c1554..c16303462d 100644
--- a/hw/ppc/sam460ex.c
+++ b/hw/ppc/sam460ex.c
@@ -280,7 +280,6 @@ static void sam460ex_init(MachineState *machine)
     hwaddr ram_sizes[SDRAM_NR_BANKS] = {0};
     MemoryRegion *l2cache_ram = g_new(MemoryRegion, 1);
     DeviceState *uic[4];
-    qemu_irq mal_irqs[4];
     int i;
     PCIBus *pci_bus;
     PowerPCCPU *cpu;
@@ -387,10 +386,15 @@ static void sam460ex_init(MachineState *machine)
     ppc4xx_sdr_init(env);
 
     /* MAL */
-    for (i = 0; i < ARRAY_SIZE(mal_irqs); i++) {
-        mal_irqs[i] = qdev_get_gpio_in(uic[2], 3 + i);
+    dev = qdev_new(TYPE_PPC4xx_MAL);
+    qdev_prop_set_uint32(dev, "txc-num", 4);
+    qdev_prop_set_uint32(dev, "rxc-num", 16);
+    ppc4xx_dcr_realize(PPC4xx_DCR_DEVICE(dev), cpu, &error_fatal);
+    object_unref(OBJECT(dev));
+    sbdev = SYS_BUS_DEVICE(dev);
+    for (i = 0; i < ARRAY_SIZE(PPC4xx_MAL(dev)->irqs); i++) {
+        sysbus_connect_irq(sbdev, i, qdev_get_gpio_in(uic[2], 3 + i));
     }
-    ppc4xx_mal_init(env, 4, 16, mal_irqs);
 
     /* DMA */
     ppc4xx_dma_init(env, 0x200);
diff --git a/include/hw/ppc/ppc4xx.h b/include/hw/ppc/ppc4xx.h
index a537a5567b..f40bd49bc7 100644
--- a/include/hw/ppc/ppc4xx.h
+++ b/include/hw/ppc/ppc4xx.h
@@ -40,9 +40,6 @@ void ppc4xx_sdram_init (CPUPPCState *env, qemu_irq irq, int nbanks,
                         hwaddr *ram_sizes,
                         int do_init);
 
-void ppc4xx_mal_init(CPUPPCState *env, uint8_t txcnum, uint8_t rxcnum,
-                     qemu_irq irqs[4]);
-
 #define TYPE_PPC4xx_PCI_HOST_BRIDGE "ppc4xx-pcihost"
 
 /*
@@ -61,4 +58,29 @@ void ppc4xx_dcr_register(Ppc4xxDcrDeviceState *dev, int dcrn, void *opaque,
 bool ppc4xx_dcr_realize(Ppc4xxDcrDeviceState *dev, PowerPCCPU *cpu,
                         Error **errp);
 
+/* Memory Access Layer (MAL) */
+#define TYPE_PPC4xx_MAL "ppc4xx-mal"
+OBJECT_DECLARE_SIMPLE_TYPE(Ppc4xxMalState, PPC4xx_MAL);
+struct Ppc4xxMalState {
+    Ppc4xxDcrDeviceState parent_obj;
+
+    qemu_irq irqs[4];
+    uint32_t cfg;
+    uint32_t esr;
+    uint32_t ier;
+    uint32_t txcasr;
+    uint32_t txcarr;
+    uint32_t txeobisr;
+    uint32_t txdeir;
+    uint32_t rxcasr;
+    uint32_t rxcarr;
+    uint32_t rxeobisr;
+    uint32_t rxdeir;
+    uint32_t *txctpr;
+    uint32_t *rxctpr;
+    uint32_t *rcbs;
+    uint8_t  txcnum;
+    uint8_t  rxcnum;
+};
+
 #endif /* PPC4XX_H */
-- 
2.30.4


