Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9558548DE67
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jan 2022 20:53:56 +0100 (CET)
Received: from localhost ([::1]:38550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n86AV-00083T-MO
	for lists+qemu-devel@lfdr.de; Thu, 13 Jan 2022 14:53:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n85oK-0006mN-4f; Thu, 13 Jan 2022 14:31:00 -0500
Received: from [2607:f8b0:4864:20::233] (port=40680
 helo=mail-oi1-x233.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n85o8-0005Eg-Ay; Thu, 13 Jan 2022 14:30:59 -0500
Received: by mail-oi1-x233.google.com with SMTP id w188so9140059oib.7;
 Thu, 13 Jan 2022 11:30:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=G2Yc6bp1zk3Tf57VKVl3wkG+RiinZDqwQgDOGOupmTY=;
 b=GhJS+TzMcXTcwvKTGm5pNmNVxdnMnqNxzeRjuA7YJFppfzJ8vYLh/WKymRMLXhBr0h
 px6Kzgl6kgW+/4FAnJcmaAu6/2P9k88llJpmKgVZ1sxTtkC6grMSzXeUWa7m/ZOimmPy
 3Je/W5TzHvU+iuaCBDPS+gcEU+utlpL8FGcUrnE9agJCWE4Og+XAqANcgO3WHC/JVSTO
 BIIysgmyLp8jGo35oLOULX5eiaEm//9iIqAt0DhpNWVwUydEqwA6Zo50wmdU0DoSizaw
 UCu+tdGaSjRTlzF3dpRET8nPnuOsvS7q7JyEWxvWG0bAjaO6d/Z/4OlEZvo1MrRQaxFb
 Oc6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=G2Yc6bp1zk3Tf57VKVl3wkG+RiinZDqwQgDOGOupmTY=;
 b=AcW/GftObQMn1+StvZnhX8U1yxqWxAk6vzg512+AwM7jszZj2XlFZ0bkA1ncUrCAAo
 N2ACHnVl9U6FmpnACXEAxM/BPQyFb80VSXxl3xwkfImr7Dr/8kCKzvO5vyZUUsBkLQmS
 20h+28Hdy/Y1xuO6uPlNShyjVBskOz+HEmrVN1FZDHupXEFBJWeYZWQ+bMbjCxUQ7ag+
 8mMxin4b3536dnzU7I2eKKd5/P0+drEQq14lWkvOwNb/iSpnacfvqWDgOuwEPovjFQ51
 NumIt7XoIOd4PdyevArEAXw1Kjdhn2Ki/Jbd9Bdbi8DoLhzWGtjn0ZWk4/R/d5KNEo8J
 zwrw==
X-Gm-Message-State: AOAM530FeQC3OI63AVAKxRDzFwDGPqrBmYZjtsEmVm2bPUVz4VeF3gyN
 vVbOdI9XZjf72wgTZLQmFw5TMvecC0zIHuoQ
X-Google-Smtp-Source: ABdhPJzOQGTf0N7T4fq4O21yv0lnEMwkRg9QYKTtPZn2Y5WzqVJLUdEP5nB82JBjneDbJ4S5CqpXfg==
X-Received: by 2002:a05:6808:23c8:: with SMTP id
 bq8mr4438470oib.2.1642102225302; 
 Thu, 13 Jan 2022 11:30:25 -0800 (PST)
Received: from rekt.COMFAST ([152.249.109.193])
 by smtp.gmail.com with ESMTPSA id 90sm743409otn.59.2022.01.13.11.30.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Jan 2022 11:30:25 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 13/17] ppc/pnv: remove stack pointer from PnvPHB4
Date: Thu, 13 Jan 2022 16:29:48 -0300
Message-Id: <20220113192952.911188-14-danielhb413@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220113192952.911188-1-danielhb413@gmail.com>
References: <20220113192952.911188-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::233
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::233;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x233.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org,
 clg@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This pointer was being used for two reasons: pnv_phb4_update_regions()
was using it to access the PHB and phb4_realize() was using it as a way
to determine if the PHB was user created.

We can determine if the PHB is user created via phb->pec, introduced in
the previous patch, and pnv_phb4_update_regions() is no longer using
stack->phb.

Remove the pointer from the PnvPHB4 device.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/pci-host/pnv_phb4.c         | 17 +++++------------
 hw/pci-host/pnv_phb4_pec.c     |  2 --
 include/hw/pci-host/pnv_phb4.h |  2 --
 3 files changed, 5 insertions(+), 16 deletions(-)

diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
index c9117221b2..25b4248776 100644
--- a/hw/pci-host/pnv_phb4.c
+++ b/hw/pci-host/pnv_phb4.c
@@ -1549,9 +1549,10 @@ static void pnv_phb4_realize(DeviceState *dev, Error **errp)
     char name[32];
 
     /* User created PHB */
-    if (!phb->stack) {
+    if (!phb->pec) {
         PnvMachineState *pnv = PNV_MACHINE(qdev_get_machine());
         PnvChip *chip = pnv_get_chip(pnv, phb->chip_id);
+        PnvPhb4PecStack *stack;
         PnvPhb4PecClass *pecc;
         BusState *s;
 
@@ -1560,7 +1561,7 @@ static void pnv_phb4_realize(DeviceState *dev, Error **errp)
             return;
         }
 
-        phb->stack = pnv_phb4_get_stack(chip, phb, &local_err);
+        stack = pnv_phb4_get_stack(chip, phb, &local_err);
         if (local_err) {
             error_propagate(errp, local_err);
             return;
@@ -1570,19 +1571,13 @@ static void pnv_phb4_realize(DeviceState *dev, Error **errp)
          * All other phb properties but 'pec', 'version' and
          * 'phb-number' are already set.
          */
-        object_property_set_link(OBJECT(phb), "pec", OBJECT(phb->stack->pec),
+        object_property_set_link(OBJECT(phb), "pec", OBJECT(stack->pec),
                                  &error_abort);
         pecc = PNV_PHB4_PEC_GET_CLASS(phb->pec);
         object_property_set_int(OBJECT(phb), "version", pecc->version,
                                 &error_fatal);
         object_property_set_int(OBJECT(phb), "phb-number",
-                                phb->stack->stack_no, &error_abort);
-
-        /*
-         * Assign stack->phb since pnv_phb4_update_regions() uses it
-         * to access the phb.
-         */
-        phb->stack->phb = phb;
+                                stack->stack_no, &error_abort);
 
         /*
          * Reparent user created devices to the chip to build
@@ -1686,8 +1681,6 @@ static Property pnv_phb4_properties[] = {
         DEFINE_PROP_UINT32("index", PnvPHB4, phb_id, 0),
         DEFINE_PROP_UINT32("chip-id", PnvPHB4, chip_id, 0),
         DEFINE_PROP_UINT64("version", PnvPHB4, version, 0),
-        DEFINE_PROP_LINK("stack", PnvPHB4, stack, TYPE_PNV_PHB4_PEC_STACK,
-                         PnvPhb4PecStack *),
         DEFINE_PROP_LINK("pec", PnvPHB4, pec, TYPE_PNV_PHB4_PEC,
                          PnvPhb4PecState *),
         DEFINE_PROP_END_OF_LIST(),
diff --git a/hw/pci-host/pnv_phb4_pec.c b/hw/pci-host/pnv_phb4_pec.c
index 36cc4ffe7c..1de0eb9adc 100644
--- a/hw/pci-host/pnv_phb4_pec.c
+++ b/hw/pci-host/pnv_phb4_pec.c
@@ -295,8 +295,6 @@ static void pnv_pec_stk_default_phb_realize(PnvPhb4PecStack *stack,
                             &error_fatal);
     object_property_set_int(OBJECT(stack->phb), "version", pecc->version,
                             &error_fatal);
-    object_property_set_link(OBJECT(stack->phb), "stack", OBJECT(stack),
-                             &error_abort);
 
     if (!sysbus_realize(SYS_BUS_DEVICE(stack->phb), errp)) {
         return;
diff --git a/include/hw/pci-host/pnv_phb4.h b/include/hw/pci-host/pnv_phb4.h
index f66bc76b78..90eb4575f8 100644
--- a/include/hw/pci-host/pnv_phb4.h
+++ b/include/hw/pci-host/pnv_phb4.h
@@ -154,8 +154,6 @@ struct PnvPHB4 {
     XiveSource xsrc;
     qemu_irq *qirqs;
 
-    PnvPhb4PecStack *stack;
-
     QLIST_HEAD(, PnvPhb4DMASpace) dma_spaces;
 };
 
-- 
2.33.1


