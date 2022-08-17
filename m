Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E9AB5972D2
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Aug 2022 17:22:39 +0200 (CEST)
Received: from localhost ([::1]:58544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOKsQ-0003Nc-F6
	for lists+qemu-devel@lfdr.de; Wed, 17 Aug 2022 11:22:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oOKem-0004fC-71; Wed, 17 Aug 2022 11:08:32 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:43868)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oOKeg-0002rE-Lj; Wed, 17 Aug 2022 11:08:30 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 62A75747871;
 Wed, 17 Aug 2022 17:08:24 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 2B6A374763C; Wed, 17 Aug 2022 17:08:24 +0200 (CEST)
Message-Id: <4738b3c7cf18c328f05aaaddc555a46219431335.1660746880.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1660746880.git.balaton@eik.bme.hu>
References: <cover.1660746880.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH v2 06/31] ppc/ppc405: QOM'ify DMA
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
Date: Wed, 17 Aug 2022 17:08:24 +0200 (CEST)
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

The DMA controller is currently modeled as a DCR device with a couple
of IRQs.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
[balaton: ppc4xx_dcr_register changes]
Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
---
 hw/ppc/ppc405.h    |  19 ++++++
 hw/ppc/ppc405_uc.c | 141 ++++++++++++++++++++-------------------------
 2 files changed, 81 insertions(+), 79 deletions(-)

diff --git a/hw/ppc/ppc405.h b/hw/ppc/ppc405.h
index 21f6cb3585..c75e4c7cb5 100644
--- a/hw/ppc/ppc405.h
+++ b/hw/ppc/ppc405.h
@@ -63,6 +63,24 @@ struct ppc4xx_bd_info_t {
     uint32_t bi_iic_fast[2];
 };
 
+/* DMA controller */
+#define TYPE_PPC405_DMA "ppc405-dma"
+OBJECT_DECLARE_SIMPLE_TYPE(Ppc405DmaState, PPC405_DMA);
+struct Ppc405DmaState {
+    Ppc4xxDcrDeviceState parent_obj;
+
+    qemu_irq irqs[4];
+    uint32_t cr[4];
+    uint32_t ct[4];
+    uint32_t da[4];
+    uint32_t sa[4];
+    uint32_t sg[4];
+    uint32_t sr;
+    uint32_t sgc;
+    uint32_t slp;
+    uint32_t pol;
+};
+
 /* GPIO */
 #define TYPE_PPC405_GPIO "ppc405-gpio"
 OBJECT_DECLARE_SIMPLE_TYPE(Ppc405GpioState, PPC405_GPIO);
@@ -173,6 +191,7 @@ struct Ppc405SoCState {
     Ppc405GptState gpt;
     Ppc405OcmState ocm;
     Ppc405GpioState gpio;
+    Ppc405DmaState dma;
 };
 
 /* PowerPC 405 core */
diff --git a/hw/ppc/ppc405_uc.c b/hw/ppc/ppc405_uc.c
index 7ed3cf7149..40af07e321 100644
--- a/hw/ppc/ppc405_uc.c
+++ b/hw/ppc/ppc405_uc.c
@@ -613,35 +613,20 @@ enum {
     DMA0_POL = 0x126,
 };
 
-typedef struct ppc405_dma_t ppc405_dma_t;
-struct ppc405_dma_t {
-    qemu_irq irqs[4];
-    uint32_t cr[4];
-    uint32_t ct[4];
-    uint32_t da[4];
-    uint32_t sa[4];
-    uint32_t sg[4];
-    uint32_t sr;
-    uint32_t sgc;
-    uint32_t slp;
-    uint32_t pol;
-};
-
-static uint32_t dcr_read_dma (void *opaque, int dcrn)
+static uint32_t dcr_read_dma(void *opaque, int dcrn)
 {
     return 0;
 }
 
-static void dcr_write_dma (void *opaque, int dcrn, uint32_t val)
+static void dcr_write_dma(void *opaque, int dcrn, uint32_t val)
 {
 }
 
-static void ppc405_dma_reset (void *opaque)
+static void ppc405_dma_reset(DeviceState *dev)
 {
-    ppc405_dma_t *dma;
+    Ppc405DmaState *dma = PPC405_DMA(dev);
     int i;
 
-    dma = opaque;
     for (i = 0; i < 4; i++) {
         dma->cr[i] = 0x00000000;
         dma->ct[i] = 0x00000000;
@@ -655,61 +640,50 @@ static void ppc405_dma_reset (void *opaque)
     dma->pol = 0x00000000;
 }
 
-static void ppc405_dma_init(CPUPPCState *env, qemu_irq irqs[4])
+static void ppc405_dma_realize(DeviceState *dev, Error **errp)
+{
+    Ppc405DmaState *dma = PPC405_DMA(dev);
+    Ppc4xxDcrDeviceState *dcr = PPC4xx_DCR_DEVICE(dev);
+    int i;
+
+    for (i = 0; i < ARRAY_SIZE(dma->irqs); i++) {
+        sysbus_init_irq(SYS_BUS_DEVICE(dma), &dma->irqs[i]);
+    }
+
+    ppc4xx_dcr_register(dcr, DMA0_CR0, dma, &dcr_read_dma, &dcr_write_dma);
+    ppc4xx_dcr_register(dcr, DMA0_CT0, dma, &dcr_read_dma, &dcr_write_dma);
+    ppc4xx_dcr_register(dcr, DMA0_DA0, dma, &dcr_read_dma, &dcr_write_dma);
+    ppc4xx_dcr_register(dcr, DMA0_SA0, dma, &dcr_read_dma, &dcr_write_dma);
+    ppc4xx_dcr_register(dcr, DMA0_SG0, dma, &dcr_read_dma, &dcr_write_dma);
+    ppc4xx_dcr_register(dcr, DMA0_CR1, dma, &dcr_read_dma, &dcr_write_dma);
+    ppc4xx_dcr_register(dcr, DMA0_CT1, dma, &dcr_read_dma, &dcr_write_dma);
+    ppc4xx_dcr_register(dcr, DMA0_DA1, dma, &dcr_read_dma, &dcr_write_dma);
+    ppc4xx_dcr_register(dcr, DMA0_SA1, dma, &dcr_read_dma, &dcr_write_dma);
+    ppc4xx_dcr_register(dcr, DMA0_SG1, dma, &dcr_read_dma, &dcr_write_dma);
+    ppc4xx_dcr_register(dcr, DMA0_CR2, dma, &dcr_read_dma, &dcr_write_dma);
+    ppc4xx_dcr_register(dcr, DMA0_CT2, dma, &dcr_read_dma, &dcr_write_dma);
+    ppc4xx_dcr_register(dcr, DMA0_DA2, dma, &dcr_read_dma, &dcr_write_dma);
+    ppc4xx_dcr_register(dcr, DMA0_SA2, dma, &dcr_read_dma, &dcr_write_dma);
+    ppc4xx_dcr_register(dcr, DMA0_SG2, dma, &dcr_read_dma, &dcr_write_dma);
+    ppc4xx_dcr_register(dcr, DMA0_CR3, dma, &dcr_read_dma, &dcr_write_dma);
+    ppc4xx_dcr_register(dcr, DMA0_CT3, dma, &dcr_read_dma, &dcr_write_dma);
+    ppc4xx_dcr_register(dcr, DMA0_DA3, dma, &dcr_read_dma, &dcr_write_dma);
+    ppc4xx_dcr_register(dcr, DMA0_SA3, dma, &dcr_read_dma, &dcr_write_dma);
+    ppc4xx_dcr_register(dcr, DMA0_SG3, dma, &dcr_read_dma, &dcr_write_dma);
+    ppc4xx_dcr_register(dcr, DMA0_SR,  dma, &dcr_read_dma, &dcr_write_dma);
+    ppc4xx_dcr_register(dcr, DMA0_SGC, dma, &dcr_read_dma, &dcr_write_dma);
+    ppc4xx_dcr_register(dcr, DMA0_SLP, dma, &dcr_read_dma, &dcr_write_dma);
+    ppc4xx_dcr_register(dcr, DMA0_POL, dma, &dcr_read_dma, &dcr_write_dma);
+}
+
+static void ppc405_dma_class_init(ObjectClass *oc, void *data)
 {
-    ppc405_dma_t *dma;
-
-    dma = g_new0(ppc405_dma_t, 1);
-    memcpy(dma->irqs, irqs, 4 * sizeof(qemu_irq));
-    qemu_register_reset(&ppc405_dma_reset, dma);
-    ppc_dcr_register(env, DMA0_CR0,
-                     dma, &dcr_read_dma, &dcr_write_dma);
-    ppc_dcr_register(env, DMA0_CT0,
-                     dma, &dcr_read_dma, &dcr_write_dma);
-    ppc_dcr_register(env, DMA0_DA0,
-                     dma, &dcr_read_dma, &dcr_write_dma);
-    ppc_dcr_register(env, DMA0_SA0,
-                     dma, &dcr_read_dma, &dcr_write_dma);
-    ppc_dcr_register(env, DMA0_SG0,
-                     dma, &dcr_read_dma, &dcr_write_dma);
-    ppc_dcr_register(env, DMA0_CR1,
-                     dma, &dcr_read_dma, &dcr_write_dma);
-    ppc_dcr_register(env, DMA0_CT1,
-                     dma, &dcr_read_dma, &dcr_write_dma);
-    ppc_dcr_register(env, DMA0_DA1,
-                     dma, &dcr_read_dma, &dcr_write_dma);
-    ppc_dcr_register(env, DMA0_SA1,
-                     dma, &dcr_read_dma, &dcr_write_dma);
-    ppc_dcr_register(env, DMA0_SG1,
-                     dma, &dcr_read_dma, &dcr_write_dma);
-    ppc_dcr_register(env, DMA0_CR2,
-                     dma, &dcr_read_dma, &dcr_write_dma);
-    ppc_dcr_register(env, DMA0_CT2,
-                     dma, &dcr_read_dma, &dcr_write_dma);
-    ppc_dcr_register(env, DMA0_DA2,
-                     dma, &dcr_read_dma, &dcr_write_dma);
-    ppc_dcr_register(env, DMA0_SA2,
-                     dma, &dcr_read_dma, &dcr_write_dma);
-    ppc_dcr_register(env, DMA0_SG2,
-                     dma, &dcr_read_dma, &dcr_write_dma);
-    ppc_dcr_register(env, DMA0_CR3,
-                     dma, &dcr_read_dma, &dcr_write_dma);
-    ppc_dcr_register(env, DMA0_CT3,
-                     dma, &dcr_read_dma, &dcr_write_dma);
-    ppc_dcr_register(env, DMA0_DA3,
-                     dma, &dcr_read_dma, &dcr_write_dma);
-    ppc_dcr_register(env, DMA0_SA3,
-                     dma, &dcr_read_dma, &dcr_write_dma);
-    ppc_dcr_register(env, DMA0_SG3,
-                     dma, &dcr_read_dma, &dcr_write_dma);
-    ppc_dcr_register(env, DMA0_SR,
-                     dma, &dcr_read_dma, &dcr_write_dma);
-    ppc_dcr_register(env, DMA0_SGC,
-                     dma, &dcr_read_dma, &dcr_write_dma);
-    ppc_dcr_register(env, DMA0_SLP,
-                     dma, &dcr_read_dma, &dcr_write_dma);
-    ppc_dcr_register(env, DMA0_POL,
-                     dma, &dcr_read_dma, &dcr_write_dma);
+    DeviceClass *dc = DEVICE_CLASS(oc);
+
+    dc->realize = ppc405_dma_realize;
+    dc->reset = ppc405_dma_reset;
+    /* Reason: only works as function of a ppc4xx SoC */
+    dc->user_creatable = false;
 }
 
 /*****************************************************************************/
@@ -1399,6 +1373,8 @@ static void ppc405_soc_instance_init(Object *obj)
     object_initialize_child(obj, "ocm", &s->ocm, TYPE_PPC405_OCM);
 
     object_initialize_child(obj, "gpio", &s->gpio, TYPE_PPC405_GPIO);
+
+    object_initialize_child(obj, "dma", &s->dma, TYPE_PPC405_DMA);
 }
 
 static void ppc405_reset(void *opaque)
@@ -1409,7 +1385,7 @@ static void ppc405_reset(void *opaque)
 static void ppc405_soc_realize(DeviceState *dev, Error **errp)
 {
     Ppc405SoCState *s = PPC405_SOC(dev);
-    qemu_irq dma_irqs[4], mal_irqs[4];
+    qemu_irq mal_irqs[4];
     CPUPPCState *env;
     SysBusDevice *sbd;
     int i;
@@ -1468,11 +1444,13 @@ static void ppc405_soc_realize(DeviceState *dev, Error **errp)
     ppc405_ebc_init(env);
 
     /* DMA controller */
-    dma_irqs[0] = qdev_get_gpio_in(s->uic, 5);
-    dma_irqs[1] = qdev_get_gpio_in(s->uic, 6);
-    dma_irqs[2] = qdev_get_gpio_in(s->uic, 7);
-    dma_irqs[3] = qdev_get_gpio_in(s->uic, 8);
-    ppc405_dma_init(env, dma_irqs);
+    if (!ppc4xx_dcr_realize(PPC4xx_DCR_DEVICE(&s->dma), &s->cpu, errp)) {
+        return;
+    }
+    sbd = SYS_BUS_DEVICE(&s->dma);
+    for (i = 0; i < ARRAY_SIZE(s->dma.irqs); i++) {
+        sysbus_connect_irq(sbd, i, qdev_get_gpio_in(s->uic, 5 + i));
+    }
 
     /* I2C controller */
     sysbus_create_simple(TYPE_PPC4xx_I2C, 0xef600500,
@@ -1545,6 +1523,11 @@ static void ppc405_soc_class_init(ObjectClass *oc, void *data)
 
 static const TypeInfo ppc405_types[] = {
     {
+        .name           = TYPE_PPC405_DMA,
+        .parent         = TYPE_PPC4xx_DCR_DEVICE,
+        .instance_size  = sizeof(Ppc405DmaState),
+        .class_init     = ppc405_dma_class_init,
+    }, {
         .name           = TYPE_PPC405_GPIO,
         .parent         = TYPE_SYS_BUS_DEVICE,
         .instance_size  = sizeof(Ppc405GpioState),
-- 
2.30.4


