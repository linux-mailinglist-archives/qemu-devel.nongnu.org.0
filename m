Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF2275972D3
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Aug 2022 17:22:57 +0200 (CEST)
Received: from localhost ([::1]:37822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOKsj-0004EX-1J
	for lists+qemu-devel@lfdr.de; Wed, 17 Aug 2022 11:22:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oOKem-0004fA-6l; Wed, 17 Aug 2022 11:08:32 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:43874)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oOKeg-0002rP-Tp; Wed, 17 Aug 2022 11:08:28 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 61F94747DFD;
 Wed, 17 Aug 2022 17:08:25 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 351DF747DFA; Wed, 17 Aug 2022 17:08:25 +0200 (CEST)
Message-Id: <51a0769ab605c5158f4f2f1c896725d5fe7a073b.1660746880.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1660746880.git.balaton@eik.bme.hu>
References: <cover.1660746880.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH v2 07/31] ppc/ppc405: QOM'ify EBC
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org,
    qemu-ppc@nongnu.org
Cc: clg@kaod.org, Daniel Henrique Barboza <danielhb413@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 17 Aug 2022 17:08:25 +0200 (CEST)
X-Spam-Probability: 10%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

EBC is currently modeled as a DCR device. Also drop the ppc405_ebc_init()
helper and adapt the sam460ex machine.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
[balaton: ppc4xx_dcr_register changes]
Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
---
 hw/ppc/ppc405.h    | 17 ++++++++++++-
 hw/ppc/ppc405_uc.c | 62 ++++++++++++++++++++++++----------------------
 hw/ppc/sam460ex.c  |  4 ++-
 3 files changed, 51 insertions(+), 32 deletions(-)

diff --git a/hw/ppc/ppc405.h b/hw/ppc/ppc405.h
index c75e4c7cb5..82bf8dae93 100644
--- a/hw/ppc/ppc405.h
+++ b/hw/ppc/ppc405.h
@@ -63,6 +63,21 @@ struct ppc4xx_bd_info_t {
     uint32_t bi_iic_fast[2];
 };
 
+/* Peripheral controller */
+#define TYPE_PPC405_EBC "ppc405-ebc"
+OBJECT_DECLARE_SIMPLE_TYPE(Ppc405EbcState, PPC405_EBC);
+struct Ppc405EbcState {
+    Ppc4xxDcrDeviceState parent_obj;
+
+    uint32_t addr;
+    uint32_t bcr[8];
+    uint32_t bap[8];
+    uint32_t bear;
+    uint32_t besr0;
+    uint32_t besr1;
+    uint32_t cfg;
+};
+
 /* DMA controller */
 #define TYPE_PPC405_DMA "ppc405-dma"
 OBJECT_DECLARE_SIMPLE_TYPE(Ppc405DmaState, PPC405_DMA);
@@ -192,12 +207,12 @@ struct Ppc405SoCState {
     Ppc405OcmState ocm;
     Ppc405GpioState gpio;
     Ppc405DmaState dma;
+    Ppc405EbcState ebc;
 };
 
 /* PowerPC 405 core */
 ram_addr_t ppc405_set_bootinfo(CPUPPCState *env, ram_addr_t ram_size);
 
 void ppc4xx_plb_init(CPUPPCState *env);
-void ppc405_ebc_init(CPUPPCState *env);
 
 #endif /* PPC405_H */
diff --git a/hw/ppc/ppc405_uc.c b/hw/ppc/ppc405_uc.c
index 40af07e321..f259de07e2 100644
--- a/hw/ppc/ppc405_uc.c
+++ b/hw/ppc/ppc405_uc.c
@@ -393,28 +393,16 @@ static void ppc4xx_opba_init(hwaddr base)
 
 /*****************************************************************************/
 /* Peripheral controller */
-typedef struct ppc4xx_ebc_t ppc4xx_ebc_t;
-struct ppc4xx_ebc_t {
-    uint32_t addr;
-    uint32_t bcr[8];
-    uint32_t bap[8];
-    uint32_t bear;
-    uint32_t besr0;
-    uint32_t besr1;
-    uint32_t cfg;
-};
-
 enum {
     EBC0_CFGADDR = 0x012,
     EBC0_CFGDATA = 0x013,
 };
 
-static uint32_t dcr_read_ebc (void *opaque, int dcrn)
+static uint32_t dcr_read_ebc(void *opaque, int dcrn)
 {
-    ppc4xx_ebc_t *ebc;
+    Ppc405EbcState *ebc = opaque;
     uint32_t ret;
 
-    ebc = opaque;
     switch (dcrn) {
     case EBC0_CFGADDR:
         ret = ebc->addr;
@@ -494,11 +482,10 @@ static uint32_t dcr_read_ebc (void *opaque, int dcrn)
     return ret;
 }
 
-static void dcr_write_ebc (void *opaque, int dcrn, uint32_t val)
+static void dcr_write_ebc(void *opaque, int dcrn, uint32_t val)
 {
-    ppc4xx_ebc_t *ebc;
+    Ppc405EbcState *ebc = opaque;
 
-    ebc = opaque;
     switch (dcrn) {
     case EBC0_CFGADDR:
         ebc->addr = val;
@@ -554,12 +541,11 @@ static void dcr_write_ebc (void *opaque, int dcrn, uint32_t val)
     }
 }
 
-static void ebc_reset (void *opaque)
+static void ppc405_ebc_reset(DeviceState *dev)
 {
-    ppc4xx_ebc_t *ebc;
+    Ppc405EbcState *ebc = PPC405_EBC(dev);
     int i;
 
-    ebc = opaque;
     ebc->addr = 0x00000000;
     ebc->bap[0] = 0x7F8FFE80;
     ebc->bcr[0] = 0xFFE28000;
@@ -572,16 +558,23 @@ static void ebc_reset (void *opaque)
     ebc->cfg = 0x80400000;
 }
 
-void ppc405_ebc_init(CPUPPCState *env)
+static void ppc405_ebc_realize(DeviceState *dev, Error **errp)
 {
-    ppc4xx_ebc_t *ebc;
-
-    ebc = g_new0(ppc4xx_ebc_t, 1);
-    qemu_register_reset(&ebc_reset, ebc);
-    ppc_dcr_register(env, EBC0_CFGADDR,
-                     ebc, &dcr_read_ebc, &dcr_write_ebc);
-    ppc_dcr_register(env, EBC0_CFGDATA,
-                     ebc, &dcr_read_ebc, &dcr_write_ebc);
+    Ppc405EbcState *ebc = PPC405_EBC(dev);
+    Ppc4xxDcrDeviceState *dcr = PPC4xx_DCR_DEVICE(dev);
+
+    ppc4xx_dcr_register(dcr, EBC0_CFGADDR, ebc, &dcr_read_ebc, &dcr_write_ebc);
+    ppc4xx_dcr_register(dcr, EBC0_CFGDATA, ebc, &dcr_read_ebc, &dcr_write_ebc);
+}
+
+static void ppc405_ebc_class_init(ObjectClass *oc, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(oc);
+
+    dc->realize = ppc405_ebc_realize;
+    dc->reset = ppc405_ebc_reset;
+    /* Reason: only works as function of a ppc4xx SoC */
+    dc->user_creatable = false;
 }
 
 /*****************************************************************************/
@@ -1375,6 +1368,8 @@ static void ppc405_soc_instance_init(Object *obj)
     object_initialize_child(obj, "gpio", &s->gpio, TYPE_PPC405_GPIO);
 
     object_initialize_child(obj, "dma", &s->dma, TYPE_PPC405_DMA);
+
+    object_initialize_child(obj, "ebc", &s->ebc, TYPE_PPC405_EBC);
 }
 
 static void ppc405_reset(void *opaque)
@@ -1441,7 +1436,9 @@ static void ppc405_soc_realize(DeviceState *dev, Error **errp)
                       s->do_dram_init);
 
     /* External bus controller */
-    ppc405_ebc_init(env);
+    if (!ppc4xx_dcr_realize(PPC4xx_DCR_DEVICE(&s->ebc), &s->cpu, errp)) {
+        return;
+    }
 
     /* DMA controller */
     if (!ppc4xx_dcr_realize(PPC4xx_DCR_DEVICE(&s->dma), &s->cpu, errp)) {
@@ -1523,6 +1520,11 @@ static void ppc405_soc_class_init(ObjectClass *oc, void *data)
 
 static const TypeInfo ppc405_types[] = {
     {
+        .name           = TYPE_PPC405_EBC,
+        .parent         = TYPE_PPC4xx_DCR_DEVICE,
+        .instance_size  = sizeof(Ppc405EbcState),
+        .class_init     = ppc405_ebc_class_init,
+    }, {
         .name           = TYPE_PPC405_DMA,
         .parent         = TYPE_PPC4xx_DCR_DEVICE,
         .instance_size  = sizeof(Ppc405DmaState),
diff --git a/hw/ppc/sam460ex.c b/hw/ppc/sam460ex.c
index 0357ee077f..320c61a7f3 100644
--- a/hw/ppc/sam460ex.c
+++ b/hw/ppc/sam460ex.c
@@ -371,7 +371,9 @@ static void sam460ex_init(MachineState *machine)
                                qdev_get_gpio_in(uic[0], 3));
 
     /* External bus controller */
-    ppc405_ebc_init(env);
+    dev = qdev_new(TYPE_PPC405_EBC);
+    ppc4xx_dcr_realize(PPC4xx_DCR_DEVICE(dev), cpu, &error_fatal);
+    object_unref(OBJECT(dev));
 
     /* CPR */
     ppc4xx_cpr_init(env);
-- 
2.30.4


