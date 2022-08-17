Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7BAF597342
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Aug 2022 17:47:26 +0200 (CEST)
Received: from localhost ([::1]:34110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOLGQ-0003QT-16
	for lists+qemu-devel@lfdr.de; Wed, 17 Aug 2022 11:47:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oOKfS-0006J7-Ng; Wed, 17 Aug 2022 11:09:14 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:43992)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oOKfQ-0003MG-AU; Wed, 17 Aug 2022 11:09:14 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id ADEDA747E0F;
 Wed, 17 Aug 2022 17:08:50 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 61CB574638A; Wed, 17 Aug 2022 17:08:50 +0200 (CEST)
Message-Id: <18eaa5869189d2c1d3751cc9ada54adfdeb64ce1.1660746880.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1660746880.git.balaton@eik.bme.hu>
References: <cover.1660746880.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH v2 31/31] ppc4xx_sdram: QOM'ify
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org,
    qemu-ppc@nongnu.org
Cc: clg@kaod.org, Daniel Henrique Barboza <danielhb413@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 17 Aug 2022 17:08:50 +0200 (CEST)
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

Change the ppc4xx_sdram model to a QOM class derived from the
PPC4xx-dcr-device and name it ppc4xx-sdram-ddr. This is mostly
modelling the DDR SDRAM controller found in the 440EP (used on the
bamboo board) but also backward compatible with the older DDR
controllers on some 405 SoCs so we also use it for those now. This
likely does not cause problems for guests we run as the new features
are just not accessed but to model 405 SoC accurately some features
may have to be disabled or the model split between 440 and older.

Newer SoCs (regardless of their PPC core, e.g. 405EX) may have an
updated DDR2 SDRAM controller implemented by the ppc440_sdram model
(only partially, enough for the 460EX on the sam460ex) that is not yet
QOM'ified in this patch. That is intended to become ppc4xx-sdram-ddr2
when QOM'ified later.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
---
 hw/ppc/ppc405.h         |  3 +-
 hw/ppc/ppc405_uc.c      | 22 +++++-----
 hw/ppc/ppc440_bamboo.c  | 10 +++--
 hw/ppc/ppc4xx_devs.c    | 89 +++++++++++++++++++++++------------------
 include/hw/ppc/ppc4xx.h | 24 +++++++++++
 5 files changed, 93 insertions(+), 55 deletions(-)

diff --git a/hw/ppc/ppc405.h b/hw/ppc/ppc405.h
index ad54dff542..9a4312691e 100644
--- a/hw/ppc/ppc405.h
+++ b/hw/ppc/ppc405.h
@@ -167,8 +167,6 @@ struct Ppc405SoCState {
     DeviceState parent_obj;
 
     /* Public */
-    MemoryRegion *dram_mr;
-
     PowerPCCPU cpu;
     PPCUIC uic;
     Ppc405CpcState cpc;
@@ -182,6 +180,7 @@ struct Ppc405SoCState {
     Ppc405PobState pob;
     Ppc4xxPlbState plb;
     Ppc4xxMalState mal;
+    Ppc4xxSdramDdrState sdram;
 };
 
 #endif /* PPC405_H */
diff --git a/hw/ppc/ppc405_uc.c b/hw/ppc/ppc405_uc.c
index 4049fb98dc..9c266a21ad 100644
--- a/hw/ppc/ppc405_uc.c
+++ b/hw/ppc/ppc405_uc.c
@@ -1013,6 +1013,9 @@ static void ppc405_soc_instance_init(Object *obj)
     object_initialize_child(obj, "plb", &s->plb, TYPE_PPC4xx_PLB);
 
     object_initialize_child(obj, "mal", &s->mal, TYPE_PPC4xx_MAL);
+
+    object_initialize_child(obj, "sdram", &s->sdram, TYPE_PPC4xx_SDRAM_DDR);
+    object_property_add_alias(obj, "dram", OBJECT(&s->sdram), "dram");
 }
 
 static void ppc405_reset(void *opaque)
@@ -1070,9 +1073,17 @@ static void ppc405_soc_realize(DeviceState *dev, Error **errp)
                        qdev_get_gpio_in(DEVICE(&s->cpu), PPC40x_INPUT_CINT));
 
     /* SDRAM controller */
+    /*
+     * We use the 440 DDR SDRAM controller which has more regs and features
+     * but it's compatible enough for now
+     */
+    object_property_set_int(OBJECT(&s->sdram), "nbanks", 2, &error_abort);
+    if (!ppc4xx_dcr_realize(PPC4xx_DCR_DEVICE(&s->sdram), &s->cpu, errp)) {
+        return;
+    }
     /* XXX 405EP has no ECC interrupt */
-    ppc4xx_sdram_init(env, qdev_get_gpio_in(DEVICE(&s->uic), 17), 1,
-                      s->dram_mr);
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s->sdram), 0,
+                       qdev_get_gpio_in(DEVICE(&s->uic), 17));
 
     /* External bus controller */
     if (!ppc4xx_dcr_realize(PPC4xx_DCR_DEVICE(&s->ebc), &s->cpu, errp)) {
@@ -1147,12 +1158,6 @@ static void ppc405_soc_realize(DeviceState *dev, Error **errp)
     /* Uses UIC IRQs 9, 15, 17 */
 }
 
-static Property ppc405_soc_properties[] = {
-    DEFINE_PROP_LINK("dram", Ppc405SoCState, dram_mr, TYPE_MEMORY_REGION,
-                     MemoryRegion *),
-    DEFINE_PROP_END_OF_LIST(),
-};
-
 static void ppc405_soc_class_init(ObjectClass *oc, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(oc);
@@ -1160,7 +1165,6 @@ static void ppc405_soc_class_init(ObjectClass *oc, void *data)
     dc->realize = ppc405_soc_realize;
     /* Reason: only works as part of a ppc405 board/machine */
     dc->user_creatable = false;
-    device_class_set_props(dc, ppc405_soc_properties);
 }
 
 static const TypeInfo ppc405_types[] = {
diff --git a/hw/ppc/ppc440_bamboo.c b/hw/ppc/ppc440_bamboo.c
index 9b456f1819..6052d3a2e0 100644
--- a/hw/ppc/ppc440_bamboo.c
+++ b/hw/ppc/ppc440_bamboo.c
@@ -48,8 +48,6 @@
 #define PPC440EP_PCI_IO         0xe8000000
 #define PPC440EP_PCI_IOLEN      0x00010000
 
-#define PPC440EP_SDRAM_NR_BANKS 4
-
 static hwaddr entry;
 
 static int bamboo_load_device_tree(hwaddr addr,
@@ -198,9 +196,13 @@ static void bamboo_init(MachineState *machine)
                        qdev_get_gpio_in(DEVICE(cpu), PPC40x_INPUT_CINT));
 
     /* SDRAM controller */
+    dev = qdev_new(TYPE_PPC4xx_SDRAM_DDR);
+    object_property_set_link(OBJECT(dev), "dram", OBJECT(machine->ram),
+                             &error_abort);
+    ppc4xx_dcr_realize(PPC4xx_DCR_DEVICE(dev), cpu, &error_fatal);
+    object_unref(OBJECT(dev));
     /* XXX 440EP's ECC interrupts are on UIC1, but we've only created UIC0. */
-    ppc4xx_sdram_init(env, qdev_get_gpio_in(uicdev, 14),
-                      PPC440EP_SDRAM_NR_BANKS, machine->ram);
+    sysbus_connect_irq(SYS_BUS_DEVICE(dev), 0, qdev_get_gpio_in(uicdev, 14));
     /* Enable SDRAM memory regions, this should be done by the firmware */
     if (ppc_dcr_write(env->dcr_env, SDRAM0_CFGADDR, 0x20) ||
         ppc_dcr_write(env->dcr_env, SDRAM0_CFGDATA, 0x80000000)) {
diff --git a/hw/ppc/ppc4xx_devs.c b/hw/ppc/ppc4xx_devs.c
index 764533f9f4..2c6ed105e1 100644
--- a/hw/ppc/ppc4xx_devs.c
+++ b/hw/ppc/ppc4xx_devs.c
@@ -42,24 +42,6 @@ static const ram_addr_t ppc4xx_sdram_bank_sizes[] = {
     256 * MiB, 128 * MiB, 64 * MiB, 32 * MiB, 16 * MiB, 8 * MiB, 4 * MiB, 0
 };
 
-typedef struct ppc4xx_sdram_t ppc4xx_sdram_t;
-struct ppc4xx_sdram_t {
-    uint32_t addr;
-    int nbanks; /* Banks to use from the 4, e.g. when board has less slots */
-    Ppc4xxSdramBank bank[4];
-    uint32_t besr0;
-    uint32_t besr1;
-    uint32_t bear;
-    uint32_t cfg;
-    uint32_t status;
-    uint32_t rtr;
-    uint32_t pmit;
-    uint32_t tr;
-    uint32_t ecccfg;
-    uint32_t eccesr;
-    qemu_irq irq;
-};
-
 /*
  * XXX: TOFIX: some patches have made this code become inconsistent:
  *      there are type inconsistencies, mixing hwaddr, target_ulong
@@ -123,7 +105,7 @@ static target_ulong sdram_size(uint32_t bcr)
     return size;
 }
 
-static void sdram_set_bcr(ppc4xx_sdram_t *sdram, int i,
+static void sdram_set_bcr(Ppc4xxSdramDdrState *sdram, int i,
                           uint32_t bcr, int enabled)
 {
     if (sdram->bank[i].bcr & 0x00000001) {
@@ -149,7 +131,7 @@ static void sdram_set_bcr(ppc4xx_sdram_t *sdram, int i,
     }
 }
 
-static void sdram_map_bcr(ppc4xx_sdram_t *sdram)
+static void sdram_map_bcr(Ppc4xxSdramDdrState *sdram)
 {
     int i;
 
@@ -163,7 +145,7 @@ static void sdram_map_bcr(ppc4xx_sdram_t *sdram)
     }
 }
 
-static void sdram_unmap_bcr(ppc4xx_sdram_t *sdram)
+static void sdram_unmap_bcr(Ppc4xxSdramDdrState *sdram)
 {
     int i;
 
@@ -177,10 +159,9 @@ static void sdram_unmap_bcr(ppc4xx_sdram_t *sdram)
 
 static uint32_t dcr_read_sdram(void *opaque, int dcrn)
 {
-    ppc4xx_sdram_t *sdram;
+    Ppc4xxSdramDdrState *sdram = opaque;
     uint32_t ret;
 
-    sdram = opaque;
     switch (dcrn) {
     case SDRAM0_CFGADDR:
         ret = sdram->addr;
@@ -245,9 +226,8 @@ static uint32_t dcr_read_sdram(void *opaque, int dcrn)
 
 static void dcr_write_sdram(void *opaque, int dcrn, uint32_t val)
 {
-    ppc4xx_sdram_t *sdram;
+    Ppc4xxSdramDdrState *sdram = opaque;
 
-    sdram = opaque;
     switch (dcrn) {
     case SDRAM0_CFGADDR:
         sdram->addr = val;
@@ -326,11 +306,10 @@ static void dcr_write_sdram(void *opaque, int dcrn, uint32_t val)
     }
 }
 
-static void sdram_reset(void *opaque)
+static void ppc4xx_sdram_ddr_reset(DeviceState *dev)
 {
-    ppc4xx_sdram_t *sdram;
+    Ppc4xxSdramDdrState *sdram = PPC4xx_SDRAM_DDR(dev);
 
-    sdram = opaque;
     sdram->addr = 0x00000000;
     sdram->bear = 0x00000000;
     sdram->besr0 = 0x00000000; /* No error */
@@ -346,21 +325,46 @@ static void sdram_reset(void *opaque)
     sdram->cfg = 0x00800000;
 }
 
-void ppc4xx_sdram_init(CPUPPCState *env, qemu_irq irq, int nbanks,
-                       MemoryRegion *ram)
+static void ppc4xx_sdram_ddr_realize(DeviceState *dev, Error **errp)
 {
-    ppc4xx_sdram_t *sdram;
+    Ppc4xxSdramDdrState *s = PPC4xx_SDRAM_DDR(dev);
+    Ppc4xxDcrDeviceState *dcr = PPC4xx_DCR_DEVICE(dev);
 
-    sdram = g_new0(ppc4xx_sdram_t, 1);
-    sdram->irq = irq;
-    sdram->nbanks = nbanks;
-    ppc4xx_sdram_banks(ram, sdram->nbanks, sdram->bank,
+    if (s->nbanks < 1 || s->nbanks > 4) {
+        error_setg(errp, "Invalid number of RAM banks");
+        return;
+    }
+    if (!s->dram_mr) {
+        error_setg(errp, "Missing dram memory region");
+        return;
+    }
+    ppc4xx_sdram_banks(s->dram_mr, s->nbanks, s->bank,
                        ppc4xx_sdram_bank_sizes);
-    qemu_register_reset(&sdram_reset, sdram);
-    ppc_dcr_register(env, SDRAM0_CFGADDR,
-                     sdram, &dcr_read_sdram, &dcr_write_sdram);
-    ppc_dcr_register(env, SDRAM0_CFGDATA,
-                     sdram, &dcr_read_sdram, &dcr_write_sdram);
+
+    sysbus_init_irq(SYS_BUS_DEVICE(dev), &s->irq);
+
+    ppc4xx_dcr_register(dcr, SDRAM0_CFGADDR,
+                        s, &dcr_read_sdram, &dcr_write_sdram);
+    ppc4xx_dcr_register(dcr, SDRAM0_CFGDATA,
+                        s, &dcr_read_sdram, &dcr_write_sdram);
+}
+
+static Property ppc4xx_sdram_ddr_props[] = {
+    DEFINE_PROP_LINK("dram", Ppc4xxSdramDdrState, dram_mr, TYPE_MEMORY_REGION,
+                     MemoryRegion *),
+    DEFINE_PROP_UINT32("nbanks", Ppc4xxSdramDdrState, nbanks, 4),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void ppc4xx_sdram_ddr_class_init(ObjectClass *oc, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(oc);
+
+    dc->realize = ppc4xx_sdram_ddr_realize;
+    dc->reset = ppc4xx_sdram_ddr_reset;
+    /* Reason: only works as function of a ppc4xx SoC */
+    dc->user_creatable = false;
+    device_class_set_props(dc, ppc4xx_sdram_ddr_props);
 }
 
 /*
@@ -950,6 +954,11 @@ static void ppc4xx_dcr_class_init(ObjectClass *oc, void *data)
 
 static const TypeInfo ppc4xx_types[] = {
     {
+        .name           = TYPE_PPC4xx_SDRAM_DDR,
+        .parent         = TYPE_PPC4xx_DCR_DEVICE,
+        .instance_size  = sizeof(Ppc4xxSdramDdrState),
+        .class_init     = ppc4xx_sdram_ddr_class_init,
+    }, {
         .name           = TYPE_PPC4xx_MAL,
         .parent         = TYPE_PPC4xx_DCR_DEVICE,
         .instance_size  = sizeof(Ppc4xxMalState),
diff --git a/include/hw/ppc/ppc4xx.h b/include/hw/ppc/ppc4xx.h
index 6007a8dd04..7b6df37289 100644
--- a/include/hw/ppc/ppc4xx.h
+++ b/include/hw/ppc/ppc4xx.h
@@ -118,4 +118,28 @@ struct Ppc4xxEbcState {
     uint32_t cfg;
 };
 
+/* SDRAM DDR controller */
+#define TYPE_PPC4xx_SDRAM_DDR "ppc4xx-sdram-ddr"
+OBJECT_DECLARE_SIMPLE_TYPE(Ppc4xxSdramDdrState, PPC4xx_SDRAM_DDR);
+struct Ppc4xxSdramDdrState {
+    Ppc4xxDcrDeviceState parent_obj;
+
+    MemoryRegion *dram_mr;
+    uint32_t nbanks; /* Banks to use from 4, e.g. when board has less slots */
+    Ppc4xxSdramBank bank[4];
+    qemu_irq irq;
+
+    uint32_t addr;
+    uint32_t besr0;
+    uint32_t besr1;
+    uint32_t bear;
+    uint32_t cfg;
+    uint32_t status;
+    uint32_t rtr;
+    uint32_t pmit;
+    uint32_t tr;
+    uint32_t ecccfg;
+    uint32_t eccesr;
+};
+
 #endif /* PPC4XX_H */
-- 
2.30.4


