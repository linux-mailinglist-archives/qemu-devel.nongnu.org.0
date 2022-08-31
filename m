Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B57F5A871B
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Aug 2022 21:57:04 +0200 (CEST)
Received: from localhost ([::1]:33032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTTpf-0004VC-LF
	for lists+qemu-devel@lfdr.de; Wed, 31 Aug 2022 15:57:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oTSpR-0005Om-86; Wed, 31 Aug 2022 14:52:45 -0400
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329]:38624)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oTSpP-0008Ci-60; Wed, 31 Aug 2022 14:52:44 -0400
Received: by mail-ot1-x329.google.com with SMTP id
 m21-20020a9d6ad5000000b00638df677850so10880187otq.5; 
 Wed, 31 Aug 2022 11:52:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=cz0JKKaL1dCt49jK1VnK66Eqwn7B6P4v7MowjnHm5sc=;
 b=DkpMiGK+qmUhUQYhjhOWPlgmtvQ8u1HNIpiiOP/SCrAAqluIs0VzM8DOh9K/KuPnpj
 LMZqzXUaU/Jj0EMwymd6E2/ALUyXL5SjHAIP2Xt2IifTGgSqQMywFoArOlqSzhYOfl1g
 8fC71C09ma+Fpkb7f27rAMJrdrnUvR8D8tQoK57tCLCRe78MND6uDfOjvvSTkF+1QZ2P
 PMSDVFkT95GaP/73wLYsBOj3tmmO3kBLGjyMO9UpU9Q3SkqX9rLDSkQnHjcuChb1Veq3
 Oe4Wc6XeM1kH6M6h2ADyR8BEdpg1RhUoZGoRvNgSxDdaeLWQtqZBf1L/82q623RDEZPS
 Tbaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=cz0JKKaL1dCt49jK1VnK66Eqwn7B6P4v7MowjnHm5sc=;
 b=WaTEOsdVCPWN+NrxWLZ48WYAxvFsLdhrbrkh2W8umveK/gFz/WVcCwNkvaDOG393HV
 bju5/fibYpKnEGfOKlhqoFjFIUIcBUi2eRSHCQQSuuQkWJ/Qa+VZJmG7NxfEPuDzoaJu
 f3qtVuwZ8jA4yLLP70HCBRhd8E/tBqR0gMyEVTYCN9otrVo/ZwKC/KznP8MUtFRiLcou
 wC2/MmGix2684W1bdJMmnxyupdQeEZ+6k/2c/2Pk+1EGB84PvyyU8cNh/mIcFeUau80I
 IoeXfXtmDnNligK8J7xifdDNpADK+AttE3BimBXOVVKjnQ3iHM2+QxT1w+2PS4U19CMl
 m6EQ==
X-Gm-Message-State: ACgBeo2CDWhpv14H+sa/2bExelshTrRDDrpFb+ZxeSupYIWWUL9ep0lt
 EOsqKqfDG0f6J8uoMOGbqCshuZsVnj0=
X-Google-Smtp-Source: AA6agR5gJBCq/7b3LVW6qMiFRqVjqer8W9r8QtemW2UntM5z7+RZ7rd7bXZCmUV3FRHzb2tb+NdYuA==
X-Received: by 2002:a9d:62c3:0:b0:639:48a8:f007 with SMTP id
 z3-20020a9d62c3000000b0063948a8f007mr10119522otk.104.1661971961440; 
 Wed, 31 Aug 2022 11:52:41 -0700 (PDT)
Received: from balboa.COMFAST ([177.189.45.98])
 by smtp.gmail.com with ESMTPSA id
 p4-20020a9d4544000000b0061cbd18bd18sm9599927oti.45.2022.08.31.11.52.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Aug 2022 11:52:41 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PULL 42/60] ppc/ppc405: QOM'ify DMA
Date: Wed, 31 Aug 2022 15:50:16 -0300
Message-Id: <20220831185034.23240-43-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220831185034.23240-1-danielhb413@gmail.com>
References: <20220831185034.23240-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::329;
 envelope-from=danielhb413@gmail.com; helo=mail-ot1-x329.google.com
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

The DMA controller is currently modeled as a DCR device with a couple
of IRQs.

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
[balaton: ppc4xx_dcr_register changes]
Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Message-Id: <4738b3c7cf18c328f05aaaddc555a46219431335.1660746880.git.balaton@eik.bme.hu>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
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
index 3f4a5b36f5..3845c0fec1 100644
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
@@ -1402,6 +1376,8 @@ static void ppc405_soc_instance_init(Object *obj)
     object_initialize_child(obj, "ocm", &s->ocm, TYPE_PPC405_OCM);
 
     object_initialize_child(obj, "gpio", &s->gpio, TYPE_PPC405_GPIO);
+
+    object_initialize_child(obj, "dma", &s->dma, TYPE_PPC405_DMA);
 }
 
 static void ppc405_reset(void *opaque)
@@ -1412,7 +1388,7 @@ static void ppc405_reset(void *opaque)
 static void ppc405_soc_realize(DeviceState *dev, Error **errp)
 {
     Ppc405SoCState *s = PPC405_SOC(dev);
-    qemu_irq dma_irqs[4], mal_irqs[4];
+    qemu_irq mal_irqs[4];
     CPUPPCState *env;
     SysBusDevice *sbd;
     int i;
@@ -1471,11 +1447,13 @@ static void ppc405_soc_realize(DeviceState *dev, Error **errp)
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
@@ -1548,6 +1526,11 @@ static void ppc405_soc_class_init(ObjectClass *oc, void *data)
 
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
2.37.2


