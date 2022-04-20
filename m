Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F7EF5092A0
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 00:25:03 +0200 (CEST)
Received: from localhost ([::1]:49238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhIkw-0001Ec-AC
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 18:25:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nhIcr-0007Cj-1Q; Wed, 20 Apr 2022 18:16:41 -0400
Received: from mail-oi1-x229.google.com ([2607:f8b0:4864:20::229]:43583)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nhIcp-00062k-60; Wed, 20 Apr 2022 18:16:40 -0400
Received: by mail-oi1-x229.google.com with SMTP id w127so3638915oig.10;
 Wed, 20 Apr 2022 15:16:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2fSi00uD/jPWqU9rXHdZjCkf9Sju6/AjEwzwDM+CwA8=;
 b=Ujev5rQn8IcWZ31sNuo5I/YO49u5OKMnWhInymuHA9TbNYQGpMwjhEiF2JR1YeL2CB
 Gi3y5nEQ4MRe+Dr51NDSRUKRP53m+NT8Mb+QJi6YEkqPNyg2IbXmJIfHgp+yYhP7QNLn
 /fjySkwYcUQir3ZCqJMlO/nwmugFAmB9wyaO934xkxevumtA+NiXpDqR6w3orpOOf+2M
 YjMRVCZoRuNCgeAPpys450Z5KIVGGp+90Qf//izdzdxIHiF2/MEwh9v0RpZ36v8FspFu
 EzmnoFB80Pqr5PCWZNvI5Vot4a++I8lc6pSWMcHRX6a31TtP6CaJpcAA9vbpvawCEJON
 +MqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2fSi00uD/jPWqU9rXHdZjCkf9Sju6/AjEwzwDM+CwA8=;
 b=MhkfLJfTEbd+CnOYzWCNo0xpwkJbIEgFd1KENlmWbdHF8D+633hK3EncX+sqaeHcGH
 fHo2MJYJCL3CQvDeIxRIfVq28UkjRN6LnrBIOh1gKofGos8SY4j3Nc/Tl6gFgAwvC5M7
 +JJKDDK0006WU2+Y5mDLiVAzQNHrkqsClwbmDhZWwuw6mCfuY9vk4xTP8UQ1TPx+wlJv
 +J3CZ39y3IxjeO12c9X4vIK3UMmF70NnONb82CkQ/5dHu8HdWYaWzzyb/dIk5x/BW87P
 0u52QO/m7z1a+ls+jli2IwrjrY1QY4l7y5PQHnxkaoTHGnZpMs145tYZn79UAlcgo/oR
 k5fA==
X-Gm-Message-State: AOAM53222+0iyoBsS7JQwXkBi3zjTMEulWZSxVVnwQeDbtfy+0pBhQj4
 9R6JwPiFu63+XVEksAOL6bRD6e3TCi8=
X-Google-Smtp-Source: ABdhPJy4WHx1BI7FYAjAvmTMqPvF0UTNye+BASOU5qxTYo6nFwjCudmtqEwfR7JF+KfH2KG7OuhutA==
X-Received: by 2002:a05:6808:2106:b0:323:abf:7e2f with SMTP id
 r6-20020a056808210600b003230abf7e2fmr136699oiw.252.1650492997657; 
 Wed, 20 Apr 2022 15:16:37 -0700 (PDT)
Received: from rekt.ibmuc.com ([2804:431:c7c7:486c:c4fd:c4aa:a799:60c2])
 by smtp.gmail.com with ESMTPSA id
 14-20020aca110e000000b00322847e6f53sm3876082oir.46.2022.04.20.15.16.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 15:16:31 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PULL 04/23] ppc/pnv: Remove PnvLpcController::psi link
Date: Wed, 20 Apr 2022 19:13:10 -0300
Message-Id: <20220420221329.169755-5-danielhb413@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220420221329.169755-1-danielhb413@gmail.com>
References: <20220420221329.169755-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::229;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x229.google.com
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
Cc: peter.maydell@linaro.org, richard.henderson@linaro.org,
 danielhb413@gmail.com, qemu-ppc@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Cédric Le Goater <clg@kaod.org>

Create an anonymous output GPIO line to connect the LPC device with
the PSIHB device and raise the appropriate PSI IRQ line depending on
the processor model.

A temporary __pnv_psi_irq_set() routine is introduced to handle the
transition. It will be removed when all devices raising PSI interrupts
are converted to use GPIOs.

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
Message-Id: <20220323072846.1780212-3-clg@kaod.org>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/pnv.c             | 18 ++++++++++++------
 hw/ppc/pnv_lpc.c         | 19 ++++---------------
 hw/ppc/pnv_psi.c         | 10 ++++++++++
 include/hw/ppc/pnv_lpc.h |  8 ++------
 4 files changed, 28 insertions(+), 27 deletions(-)

diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
index c5e48992d9..3469432fbf 100644
--- a/hw/ppc/pnv.c
+++ b/hw/ppc/pnv.c
@@ -614,24 +614,36 @@ static void pnv_reset(MachineState *machine)
 static ISABus *pnv_chip_power8_isa_create(PnvChip *chip, Error **errp)
 {
     Pnv8Chip *chip8 = PNV8_CHIP(chip);
+    qemu_irq irq = qdev_get_gpio_in(DEVICE(&chip8->psi), PSIHB_IRQ_EXTERNAL);
+
+    qdev_connect_gpio_out(DEVICE(&chip8->lpc), 0, irq);
     return pnv_lpc_isa_create(&chip8->lpc, true, errp);
 }
 
 static ISABus *pnv_chip_power8nvl_isa_create(PnvChip *chip, Error **errp)
 {
     Pnv8Chip *chip8 = PNV8_CHIP(chip);
+    qemu_irq irq = qdev_get_gpio_in(DEVICE(&chip8->psi), PSIHB_IRQ_LPC_I2C);
+
+    qdev_connect_gpio_out(DEVICE(&chip8->lpc), 0, irq);
     return pnv_lpc_isa_create(&chip8->lpc, false, errp);
 }
 
 static ISABus *pnv_chip_power9_isa_create(PnvChip *chip, Error **errp)
 {
     Pnv9Chip *chip9 = PNV9_CHIP(chip);
+    qemu_irq irq = qdev_get_gpio_in(DEVICE(&chip9->psi), PSIHB9_IRQ_LPCHC);
+
+    qdev_connect_gpio_out(DEVICE(&chip9->lpc), 0, irq);
     return pnv_lpc_isa_create(&chip9->lpc, false, errp);
 }
 
 static ISABus *pnv_chip_power10_isa_create(PnvChip *chip, Error **errp)
 {
     Pnv10Chip *chip10 = PNV10_CHIP(chip);
+    qemu_irq irq = qdev_get_gpio_in(DEVICE(&chip10->psi), PSIHB9_IRQ_LPCHC);
+
+    qdev_connect_gpio_out(DEVICE(&chip10->lpc), 0, irq);
     return pnv_lpc_isa_create(&chip10->lpc, false, errp);
 }
 
@@ -1222,8 +1234,6 @@ static void pnv_chip_power8_realize(DeviceState *dev, Error **errp)
                             &PNV_PSI(psi8)->xscom_regs);
 
     /* Create LPC controller */
-    object_property_set_link(OBJECT(&chip8->lpc), "psi", OBJECT(&chip8->psi),
-                             &error_abort);
     qdev_realize(DEVICE(&chip8->lpc), NULL, &error_fatal);
     pnv_xscom_add_subregion(chip, PNV_XSCOM_LPC_BASE, &chip8->lpc.xscom_regs);
 
@@ -1507,8 +1517,6 @@ static void pnv_chip_power9_realize(DeviceState *dev, Error **errp)
                             &PNV_PSI(psi9)->xscom_regs);
 
     /* LPC */
-    object_property_set_link(OBJECT(&chip9->lpc), "psi", OBJECT(&chip9->psi),
-                             &error_abort);
     if (!qdev_realize(DEVICE(&chip9->lpc), NULL, errp)) {
         return;
     }
@@ -1712,8 +1720,6 @@ static void pnv_chip_power10_realize(DeviceState *dev, Error **errp)
                             &PNV_PSI(&chip10->psi)->xscom_regs);
 
     /* LPC */
-    object_property_set_link(OBJECT(&chip10->lpc), "psi",
-                             OBJECT(&chip10->psi), &error_abort);
     if (!qdev_realize(DEVICE(&chip10->lpc), NULL, errp)) {
         return;
     }
diff --git a/hw/ppc/pnv_lpc.c b/hw/ppc/pnv_lpc.c
index bcbca3db97..ee890e7ab4 100644
--- a/hw/ppc/pnv_lpc.c
+++ b/hw/ppc/pnv_lpc.c
@@ -422,7 +422,6 @@ static const MemoryRegionOps pnv_lpc_mmio_ops = {
 static void pnv_lpc_eval_irqs(PnvLpcController *lpc)
 {
     bool lpc_to_opb_irq = false;
-    PnvLpcClass *plc = PNV_LPC_GET_CLASS(lpc);
 
     /* Update LPC controller to OPB line */
     if (lpc->lpc_hc_irqser_ctrl & LPC_HC_IRQSER_EN) {
@@ -445,7 +444,7 @@ static void pnv_lpc_eval_irqs(PnvLpcController *lpc)
     lpc->opb_irq_stat |= lpc->opb_irq_input & lpc->opb_irq_mask;
 
     /* Reflect the interrupt */
-    pnv_psi_irq_set(lpc->psi, plc->psi_irq, lpc->opb_irq_stat != 0);
+    qemu_set_irq(lpc->psi_irq, lpc->opb_irq_stat != 0);
 }
 
 static uint64_t lpc_hc_read(void *opaque, hwaddr addr, unsigned size)
@@ -637,8 +636,6 @@ static void pnv_lpc_power8_class_init(ObjectClass *klass, void *data)
 
     xdc->dt_xscom = pnv_lpc_dt_xscom;
 
-    plc->psi_irq = PSIHB_IRQ_LPC_I2C;
-
     device_class_set_parent_realize(dc, pnv_lpc_power8_realize,
                                     &plc->parent_realize);
 }
@@ -677,8 +674,6 @@ static void pnv_lpc_power9_class_init(ObjectClass *klass, void *data)
 
     dc->desc = "PowerNV LPC Controller POWER9";
 
-    plc->psi_irq = PSIHB9_IRQ_LPCHC;
-
     device_class_set_parent_realize(dc, pnv_lpc_power9_realize,
                                     &plc->parent_realize);
 }
@@ -706,8 +701,6 @@ static void pnv_lpc_realize(DeviceState *dev, Error **errp)
 {
     PnvLpcController *lpc = PNV_LPC(dev);
 
-    assert(lpc->psi);
-
     /* Reg inits */
     lpc->lpc_hc_fw_rd_acc_size = LPC_HC_FW_RD_4B;
 
@@ -746,12 +739,9 @@ static void pnv_lpc_realize(DeviceState *dev, Error **errp)
                           "lpc-hc", LPC_HC_REGS_OPB_SIZE);
     memory_region_add_subregion(&lpc->opb_mr, LPC_HC_REGS_OPB_ADDR,
                                 &lpc->lpc_hc_regs);
-}
 
-static Property pnv_lpc_properties[] = {
-    DEFINE_PROP_LINK("psi", PnvLpcController, psi, TYPE_PNV_PSI, PnvPsi *),
-    DEFINE_PROP_END_OF_LIST(),
-};
+    qdev_init_gpio_out(DEVICE(dev), &lpc->psi_irq, 1);
+}
 
 static void pnv_lpc_class_init(ObjectClass *klass, void *data)
 {
@@ -759,7 +749,6 @@ static void pnv_lpc_class_init(ObjectClass *klass, void *data)
 
     dc->realize = pnv_lpc_realize;
     dc->desc = "PowerNV LPC Controller";
-    device_class_set_props(dc, pnv_lpc_properties);
     dc->user_creatable = false;
 }
 
@@ -803,7 +792,7 @@ static void pnv_lpc_isa_irq_handler_cpld(void *opaque, int n, int level)
     }
 
     if (pnv->cpld_irqstate != old_state) {
-        pnv_psi_irq_set(lpc->psi, PSIHB_IRQ_EXTERNAL, pnv->cpld_irqstate != 0);
+        qemu_set_irq(lpc->psi_irq, pnv->cpld_irqstate != 0);
     }
 }
 
diff --git a/hw/ppc/pnv_psi.c b/hw/ppc/pnv_psi.c
index c588a506c7..8b6298d4bd 100644
--- a/hw/ppc/pnv_psi.c
+++ b/hw/ppc/pnv_psi.c
@@ -216,6 +216,12 @@ void pnv_psi_irq_set(PnvPsi *psi, int irq, bool state)
     PNV_PSI_GET_CLASS(psi)->irq_set(psi, irq, state);
 }
 
+static void __pnv_psi_irq_set(void *opaque, int irq, int state)
+{
+    PnvPsi *psi = (PnvPsi *) opaque;
+    PNV_PSI_GET_CLASS(psi)->irq_set(psi, irq, state);
+}
+
 static void pnv_psi_power8_irq_set(PnvPsi *psi, int irq, bool state)
 {
     uint32_t xivr_reg;
@@ -512,6 +518,8 @@ static void pnv_psi_power8_realize(DeviceState *dev, Error **errp)
         ics_set_irq_type(ics, i, true);
     }
 
+    qdev_init_gpio_in(dev, __pnv_psi_irq_set, ics->nr_irqs);
+
     psi->qirqs = qemu_allocate_irqs(ics_set_irq, ics, ics->nr_irqs);
 
     /* XSCOM region for PSI registers */
@@ -873,6 +881,8 @@ static void pnv_psi_power9_realize(DeviceState *dev, Error **errp)
 
     psi->qirqs = qemu_allocate_irqs(xive_source_set_irq, xsrc, xsrc->nr_irqs);
 
+    qdev_init_gpio_in(dev, __pnv_psi_irq_set, xsrc->nr_irqs);
+
     /* XSCOM region for PSI registers */
     pnv_xscom_region_init(&psi->xscom_regs, OBJECT(dev), &pnv_psi_p9_xscom_ops,
                 psi, "xscom-psi", PNV9_XSCOM_PSIHB_SIZE);
diff --git a/include/hw/ppc/pnv_lpc.h b/include/hw/ppc/pnv_lpc.h
index e893e763dd..8a8d1a3d42 100644
--- a/include/hw/ppc/pnv_lpc.h
+++ b/include/hw/ppc/pnv_lpc.h
@@ -1,7 +1,7 @@
 /*
  * QEMU PowerPC PowerNV LPC controller
  *
- * Copyright (c) 2016, IBM Corporation.
+ * Copyright (c) 2016-2022, IBM Corporation.
  *
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
@@ -20,7 +20,6 @@
 #ifndef PPC_PNV_LPC_H
 #define PPC_PNV_LPC_H
 
-#include "hw/ppc/pnv_psi.h"
 #include "qom/object.h"
 
 #define TYPE_PNV_LPC "pnv-lpc"
@@ -84,15 +83,12 @@ struct PnvLpcController {
     MemoryRegion xscom_regs;
 
     /* PSI to generate interrupts */
-    PnvPsi *psi;
+    qemu_irq psi_irq;
 };
 
-
 struct PnvLpcClass {
     DeviceClass parent_class;
 
-    int psi_irq;
-
     DeviceRealize parent_realize;
 };
 
-- 
2.35.1


