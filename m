Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E752958DB8C
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Aug 2022 18:03:56 +0200 (CEST)
Received: from localhost ([::1]:44454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLRhy-0000u1-Fn
	for lists+qemu-devel@lfdr.de; Tue, 09 Aug 2022 12:03:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=uImW=YN=kaod.org=clg@ozlabs.org>)
 id 1oLRKg-0004ax-BN; Tue, 09 Aug 2022 11:39:51 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:40683)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=uImW=YN=kaod.org=clg@ozlabs.org>)
 id 1oLRKd-0004Pz-AW; Tue, 09 Aug 2022 11:39:49 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4M2HLn55Jgz4xVF;
 Wed, 10 Aug 2022 01:39:45 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4M2HLl4rFDz4xTv;
 Wed, 10 Aug 2022 01:39:43 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org,
 BALATON Zoltan <balaton@eik.bme.hu>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH v4 13/24] ppc/ppc405: QOM'ify DMA
Date: Tue,  9 Aug 2022 17:38:53 +0200
Message-Id: <20220809153904.485018-14-clg@kaod.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220809153904.485018-1-clg@kaod.org>
References: <20220809153904.485018-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=uImW=YN=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
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

The DMA controller is currently modeled as a DCR device with a couple
of IRQs.

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/ppc/ppc405.h    |  19 ++++++
 hw/ppc/ppc405_uc.c | 142 ++++++++++++++++++++-------------------------
 2 files changed, 82 insertions(+), 79 deletions(-)

diff --git a/hw/ppc/ppc405.h b/hw/ppc/ppc405.h
index 21f6cb358501..c75e4c7cb50a 100644
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
index 1a2cbac2748b..fdf6dcd71e8d 100644
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
+    Ppc405DmaState *dma = PPC405_DMA(dev);
+    Ppc4xxDcrDeviceState *dcr = PPC4xx_DCR_DEVICE(dev);
+    int i;
+
+    for (i = 0; i < ARRAY_SIZE(dma->irqs); i++) {
+        sysbus_init_irq(SYS_BUS_DEVICE(dma), &dma->irqs[i]);
+    }
+
+    ppc4xx_dcr_register(dcr, DMA0_CR0, &dcr_read_dma, &dcr_write_dma);
+    ppc4xx_dcr_register(dcr, DMA0_CT0, &dcr_read_dma, &dcr_write_dma);
+    ppc4xx_dcr_register(dcr, DMA0_DA0, &dcr_read_dma, &dcr_write_dma);
+    ppc4xx_dcr_register(dcr, DMA0_SA0, &dcr_read_dma, &dcr_write_dma);
+    ppc4xx_dcr_register(dcr, DMA0_SG0, &dcr_read_dma, &dcr_write_dma);
+    ppc4xx_dcr_register(dcr, DMA0_CR1, &dcr_read_dma, &dcr_write_dma);
+    ppc4xx_dcr_register(dcr, DMA0_CT1, &dcr_read_dma, &dcr_write_dma);
+    ppc4xx_dcr_register(dcr, DMA0_DA1, &dcr_read_dma, &dcr_write_dma);
+    ppc4xx_dcr_register(dcr, DMA0_SA1, &dcr_read_dma, &dcr_write_dma);
+    ppc4xx_dcr_register(dcr, DMA0_SG1, &dcr_read_dma, &dcr_write_dma);
+    ppc4xx_dcr_register(dcr, DMA0_CR2, &dcr_read_dma, &dcr_write_dma);
+    ppc4xx_dcr_register(dcr, DMA0_CT2, &dcr_read_dma, &dcr_write_dma);
+    ppc4xx_dcr_register(dcr, DMA0_DA2, &dcr_read_dma, &dcr_write_dma);
+    ppc4xx_dcr_register(dcr, DMA0_SA2, &dcr_read_dma, &dcr_write_dma);
+    ppc4xx_dcr_register(dcr, DMA0_SG2, &dcr_read_dma, &dcr_write_dma);
+    ppc4xx_dcr_register(dcr, DMA0_CR3, &dcr_read_dma, &dcr_write_dma);
+    ppc4xx_dcr_register(dcr, DMA0_CT3, &dcr_read_dma, &dcr_write_dma);
+    ppc4xx_dcr_register(dcr, DMA0_DA3, &dcr_read_dma, &dcr_write_dma);
+    ppc4xx_dcr_register(dcr, DMA0_SA3, &dcr_read_dma, &dcr_write_dma);
+    ppc4xx_dcr_register(dcr, DMA0_SG3, &dcr_read_dma, &dcr_write_dma);
+    ppc4xx_dcr_register(dcr, DMA0_SR,  &dcr_read_dma, &dcr_write_dma);
+    ppc4xx_dcr_register(dcr, DMA0_SGC, &dcr_read_dma, &dcr_write_dma);
+    ppc4xx_dcr_register(dcr, DMA0_SLP, &dcr_read_dma, &dcr_write_dma);
+    ppc4xx_dcr_register(dcr, DMA0_POL, &dcr_read_dma, &dcr_write_dma);
+}
+
+static void ppc405_dma_class_init(ObjectClass *oc, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(oc);
+
+    dc->realize = ppc405_dma_realize;
+    /* Reason: only works as function of a ppc4xx SoC */
+    dc->user_creatable = false;
+    dc->reset = ppc405_dma_reset;
 }
 
 /*****************************************************************************/
@@ -1396,6 +1370,8 @@ static void ppc405_soc_instance_init(Object *obj)
     object_initialize_child(obj, "ocm", &s->ocm, TYPE_PPC405_OCM);
 
     object_initialize_child(obj, "gpio", &s->gpio, TYPE_PPC405_GPIO);
+
+    object_initialize_child(obj, "dma", &s->dma, TYPE_PPC405_DMA);
 }
 
 static void ppc405_reset(void *opaque)
@@ -1406,7 +1382,7 @@ static void ppc405_reset(void *opaque)
 static void ppc405_soc_realize(DeviceState *dev, Error **errp)
 {
     Ppc405SoCState *s = PPC405_SOC(dev);
-    qemu_irq dma_irqs[4], mal_irqs[4];
+    qemu_irq mal_irqs[4];
     CPUPPCState *env;
     int i;
 
@@ -1464,11 +1440,14 @@ static void ppc405_soc_realize(DeviceState *dev, Error **errp)
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
+
+    for (i = 0; i < ARRAY_SIZE(s->dma.irqs); i++) {
+        sysbus_connect_irq(SYS_BUS_DEVICE(&s->dma), i,
+                           qdev_get_gpio_in(s->uic, 5 + i));
+    }
 
     /* I2C controller */
     sysbus_create_simple(TYPE_PPC4xx_I2C, 0xef600500,
@@ -1541,6 +1520,11 @@ static void ppc405_soc_class_init(ObjectClass *oc, void *data)
 
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
2.37.1


