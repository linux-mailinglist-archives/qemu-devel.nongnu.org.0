Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2C3D5092E3
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 00:34:56 +0200 (CEST)
Received: from localhost ([::1]:44814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhIuV-00017R-Pi
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 18:34:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nhIdc-0007zU-NA; Wed, 20 Apr 2022 18:17:28 -0400
Received: from mail-oo1-xc30.google.com ([2607:f8b0:4864:20::c30]:40591)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nhIda-00065W-W2; Wed, 20 Apr 2022 18:17:28 -0400
Received: by mail-oo1-xc30.google.com with SMTP id
 p128-20020a4a4886000000b003296205eb59so536234ooa.7; 
 Wed, 20 Apr 2022 15:17:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=r4tdQvhCVDptrhNmZEPQBqbd5ryY+mY31FjiXaoDJQg=;
 b=Ef7+W11VfLU3S5zHiahR5pk5TMpLi5ig4Q30mAA1HrbARxMCqKjNgksLPhd0BSiTeg
 RklVr2dg9eCpmiu1KlxfmGEKEv+hbevefozA6eiXOs16SBtbJYKLn1pOvvOy65JO09uh
 h+0lYyFCnS3ery62BsTM2l6VFBSW1rCBMEBx23gBOh2RkO8UhgiF/PyNcfA1CrcB3V2O
 CQA539oDS0sPfUO6OFORD1aHKHXXaplsHmVYr+11hCQMbi1TSCdHmud536PWubEjVDlK
 93wKkcrWrMq5OKQZDZk8xOXuJKhZWkqybiRof0L+Tho9ewOlRuSJIWdbDvAXP73hUPWK
 VK8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=r4tdQvhCVDptrhNmZEPQBqbd5ryY+mY31FjiXaoDJQg=;
 b=wbXlxfS29FGBYY1rGdmSuZ/9QVqKOvSfDTvKPMTVjX/3EYEKlSr41jggmyYXtSZNuq
 ywBdHNZxNEnbFuH4npUSF6ra0JKqd2OjNJSIlJzONowiDGBgs+21xW2VdGnG8pfiztv0
 BKMJrcvKJULiwG7YHEGD/CAwuxB1TxhPFnvEytYnI+m+Am4gbDITt0sZIK3Nb4ZE1nBy
 K8Tpb1pbg1WAezzKUHlhc6kN66ZZZLbHm7R+tE4vM+FbRQesO8ANpveJ11zKL9IkSR8M
 zqz6fIKrd3ONFOnhQg00rre3lBo+zBJgd2d8GC6EUkZt+8i2jv0bIeDymMOtMOLbiF4c
 XdnQ==
X-Gm-Message-State: AOAM533Orf3njnT03KvD4FyYXhCpLD5dgo0POOGh58SXmrAWuobzREWN
 V05kjnkOHREdRTCxWbyCdM88XoGPr2M=
X-Google-Smtp-Source: ABdhPJy4PcdNhEHTw3Dz7/XgA23OL4ZREomzEHn9ctCmDL/oJpqyPd5XprQuGHNZkeV55Vyw8a0oWg==
X-Received: by 2002:a4a:dcd7:0:b0:33a:4531:aa35 with SMTP id
 h23-20020a4adcd7000000b0033a4531aa35mr5472144oou.49.1650493045082; 
 Wed, 20 Apr 2022 15:17:25 -0700 (PDT)
Received: from rekt.ibmuc.com ([2804:431:c7c7:486c:c4fd:c4aa:a799:60c2])
 by smtp.gmail.com with ESMTPSA id
 14-20020aca110e000000b00322847e6f53sm3876082oir.46.2022.04.20.15.17.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 15:17:24 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PULL 06/23] ppc/pnv: Remove PnvPsiClas::irq_set
Date: Wed, 20 Apr 2022 19:13:12 -0300
Message-Id: <20220420221329.169755-7-danielhb413@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220420221329.169755-1-danielhb413@gmail.com>
References: <20220420221329.169755-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c30;
 envelope-from=danielhb413@gmail.com; helo=mail-oo1-xc30.google.com
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

All devices raising PSI interrupts are now converted to use GPIO lines
and the pnv_psi_irq_set() routines have become useless. Drop them.

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
Message-Id: <20220323072846.1780212-5-clg@kaod.org>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/pnv_psi.c         | 23 ++++++-----------------
 include/hw/ppc/pnv_psi.h |  4 ----
 2 files changed, 6 insertions(+), 21 deletions(-)

diff --git a/hw/ppc/pnv_psi.c b/hw/ppc/pnv_psi.c
index 8b6298d4bd..950ecca405 100644
--- a/hw/ppc/pnv_psi.c
+++ b/hw/ppc/pnv_psi.c
@@ -211,19 +211,9 @@ static const uint64_t stat_bits[PSI_NUM_INTERRUPTS] = {
     [PSIHB_IRQ_EXTERNAL]  = PSIHB_IRQ_STAT_EXT,
 };
 
-void pnv_psi_irq_set(PnvPsi *psi, int irq, bool state)
-{
-    PNV_PSI_GET_CLASS(psi)->irq_set(psi, irq, state);
-}
-
-static void __pnv_psi_irq_set(void *opaque, int irq, int state)
-{
-    PnvPsi *psi = (PnvPsi *) opaque;
-    PNV_PSI_GET_CLASS(psi)->irq_set(psi, irq, state);
-}
-
-static void pnv_psi_power8_irq_set(PnvPsi *psi, int irq, bool state)
+static void pnv_psi_power8_set_irq(void *opaque, int irq, int state)
 {
+    PnvPsi *psi = opaque;
     uint32_t xivr_reg;
     uint32_t stat_reg;
     uint32_t src;
@@ -518,7 +508,7 @@ static void pnv_psi_power8_realize(DeviceState *dev, Error **errp)
         ics_set_irq_type(ics, i, true);
     }
 
-    qdev_init_gpio_in(dev, __pnv_psi_irq_set, ics->nr_irqs);
+    qdev_init_gpio_in(dev, pnv_psi_power8_set_irq, ics->nr_irqs);
 
     psi->qirqs = qemu_allocate_irqs(ics_set_irq, ics, ics->nr_irqs);
 
@@ -581,7 +571,6 @@ static void pnv_psi_power8_class_init(ObjectClass *klass, void *data)
     ppc->xscom_pcba = PNV_XSCOM_PSIHB_BASE;
     ppc->xscom_size = PNV_XSCOM_PSIHB_SIZE;
     ppc->bar_mask   = PSIHB_BAR_MASK;
-    ppc->irq_set    = pnv_psi_power8_irq_set;
     ppc->compat     = compat;
     ppc->compat_size = sizeof(compat);
 }
@@ -819,8 +808,9 @@ static const MemoryRegionOps pnv_psi_p9_xscom_ops = {
     }
 };
 
-static void pnv_psi_power9_irq_set(PnvPsi *psi, int irq, bool state)
+static void pnv_psi_power9_set_irq(void *opaque, int irq, int state)
 {
+    PnvPsi *psi = opaque;
     uint64_t irq_method = psi->regs[PSIHB_REG(PSIHB9_INTERRUPT_CONTROL)];
 
     if (irq > PSIHB9_NUM_IRQS) {
@@ -881,7 +871,7 @@ static void pnv_psi_power9_realize(DeviceState *dev, Error **errp)
 
     psi->qirqs = qemu_allocate_irqs(xive_source_set_irq, xsrc, xsrc->nr_irqs);
 
-    qdev_init_gpio_in(dev, __pnv_psi_irq_set, xsrc->nr_irqs);
+    qdev_init_gpio_in(dev, pnv_psi_power9_set_irq, xsrc->nr_irqs);
 
     /* XSCOM region for PSI registers */
     pnv_xscom_region_init(&psi->xscom_regs, OBJECT(dev), &pnv_psi_p9_xscom_ops,
@@ -908,7 +898,6 @@ static void pnv_psi_power9_class_init(ObjectClass *klass, void *data)
     ppc->xscom_pcba = PNV9_XSCOM_PSIHB_BASE;
     ppc->xscom_size = PNV9_XSCOM_PSIHB_SIZE;
     ppc->bar_mask   = PSIHB9_BAR_MASK;
-    ppc->irq_set    = pnv_psi_power9_irq_set;
     ppc->compat     = compat;
     ppc->compat_size = sizeof(compat);
 
diff --git a/include/hw/ppc/pnv_psi.h b/include/hw/ppc/pnv_psi.h
index 6d9f8ce7c0..8253469b8f 100644
--- a/include/hw/ppc/pnv_psi.h
+++ b/include/hw/ppc/pnv_psi.h
@@ -79,8 +79,6 @@ struct PnvPsiClass {
     uint64_t bar_mask;
     const char *compat;
     int compat_size;
-
-    void (*irq_set)(PnvPsi *psi, int, bool state);
 };
 
 /* The PSI and FSP interrupts are muxed on the same IRQ number */
@@ -95,8 +93,6 @@ typedef enum PnvPsiIrq {
 
 #define PSI_NUM_INTERRUPTS 6
 
-void pnv_psi_irq_set(PnvPsi *psi, int irq, bool state);
-
 /* P9 PSI Interrupts */
 #define PSIHB9_IRQ_PSI          0
 #define PSIHB9_IRQ_OCC          1
-- 
2.35.1


