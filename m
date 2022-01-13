Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 555AB48DE68
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jan 2022 20:55:53 +0100 (CET)
Received: from localhost ([::1]:41702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n86CO-0001ll-DA
	for lists+qemu-devel@lfdr.de; Thu, 13 Jan 2022 14:55:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n85oI-0006hL-Mv; Thu, 13 Jan 2022 14:30:59 -0500
Received: from [2607:f8b0:4864:20::330] (port=44920
 helo=mail-ot1-x330.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n85oE-0005En-5z; Thu, 13 Jan 2022 14:30:58 -0500
Received: by mail-ot1-x330.google.com with SMTP id
 w19-20020a056830061300b0058f1dd48932so7450952oti.11; 
 Thu, 13 Jan 2022 11:30:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dQ0kpsgAeyrfwxZqIIgfXhYnvLABmqsyJopafoJrCVQ=;
 b=bFRgHtdtL8b6RUfdpY/Oivj7Ipy2587Hw7tcOsV5LQajWHujZJV18dB8qETb9YR4BX
 /1GZsW6QOC+4JGuiB9cgpKegbDsBtNaKz5QCgQnYA9JAyfT6TIu/l+K0vce7UsL+8hzw
 PI6245nHYUHTXDDwTy7mChTA2rUdXL8l2Hf+wWDjit9V4i9syG3+wHihDM2Tm94J3Gnj
 d0B85W7u98GnMLSHeIB6bKQM9wqTc1oFuldvLuJ2L07IVjHivClZFf3a+nNOd3V/+t/x
 IT/33nBaPrlCyUa6c9SrUQ43jiH9L/y6unyX3/qfhUTlCZvCf4m9GrF5zm/p6QI9Tx1E
 l5Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dQ0kpsgAeyrfwxZqIIgfXhYnvLABmqsyJopafoJrCVQ=;
 b=xOwIAm7qTfLfBfLi1ziAB3wRRhHizOt8AWg/FKTMXTFVai1+5LoxOEwcH625VUpc+X
 OmJl9k/VOknebdmqQ+r8JjIJ81YYAP9WHF25DqpVWgKQh2+TLwm1Jr+Gyvj63gEj+N40
 XlQHJs+OQ8QLushPJkG9mePvQ8XjEoiLzp+zOhIsSutHr4MDakZpFjQsWU9YWbdx63Xp
 VFBVqlrlpkOclfdrgryuJLfdMKhyMZIyaduEvNjYMwuJOeIwzFwBi/sTAIIiPXSgpks4
 qPCzgJPtnD1aYhQ+yl857v7RiXlRCoBRNE56u1Ml87T5nznf6Dz5MazhDE4eqCGXiM1G
 4GMg==
X-Gm-Message-State: AOAM5318PLqo+q+CnH+y/sZnD10jJsXp6nx0aqease4l3iLJK7NQgwT1
 /ZCs7Fx41znJh5wQOao55D++r1YU2LucGHN5
X-Google-Smtp-Source: ABdhPJy6t1Bdh8ECydJZ9FYBkGqzq9hSggabqo56emMPdR0XSZwAMKz3Kl2cGo6ipO1vhnd2qxB7Zw==
X-Received: by 2002:a9d:ea6:: with SMTP id 35mr4184920otj.304.1642102227061;
 Thu, 13 Jan 2022 11:30:27 -0800 (PST)
Received: from rekt.COMFAST ([152.249.109.193])
 by smtp.gmail.com with ESMTPSA id 90sm743409otn.59.2022.01.13.11.30.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Jan 2022 11:30:26 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 14/17] ppc/pnv: move default_phb_realize() to pec_realize()
Date: Thu, 13 Jan 2022 16:29:49 -0300
Message-Id: <20220113192952.911188-15-danielhb413@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220113192952.911188-1-danielhb413@gmail.com>
References: <20220113192952.911188-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::330
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::330;
 envelope-from=danielhb413@gmail.com; helo=mail-ot1-x330.google.com
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

This is the last step before making the PEC device uses PHB4s directly.
Move the current pnv_pec_stk_default_phb_realize() call to
pec_realize(), renaming the function to pnv_pec_default_phb_realize(),
and set the PHB attributes using the PEC object directly.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/pci-host/pnv_phb4_pec.c | 67 ++++++++++++++++++++------------------
 1 file changed, 35 insertions(+), 32 deletions(-)

diff --git a/hw/pci-host/pnv_phb4_pec.c b/hw/pci-host/pnv_phb4_pec.c
index 1de0eb9adc..3339e0ea3d 100644
--- a/hw/pci-host/pnv_phb4_pec.c
+++ b/hw/pci-host/pnv_phb4_pec.c
@@ -112,6 +112,32 @@ static const MemoryRegionOps pnv_pec_pci_xscom_ops = {
     .endianness = DEVICE_BIG_ENDIAN,
 };
 
+static void pnv_pec_default_phb_realize(PnvPhb4PecStack *stack,
+                                        int phb_number,
+                                        Error **errp)
+{
+    PnvPhb4PecState *pec = stack->pec;
+    PnvPhb4PecClass *pecc = PNV_PHB4_PEC_GET_CLASS(pec);
+    int phb_id = pnv_phb4_pec_get_phb_id(pec, phb_number);
+
+    stack->phb = PNV_PHB4(qdev_new(TYPE_PNV_PHB4));
+
+    object_property_set_int(OBJECT(stack->phb), "phb-number", phb_number,
+                            &error_abort);
+    object_property_set_link(OBJECT(stack->phb), "pec", OBJECT(pec),
+                             &error_abort);
+    object_property_set_int(OBJECT(stack->phb), "chip-id", pec->chip_id,
+                            &error_fatal);
+    object_property_set_int(OBJECT(stack->phb), "index", phb_id,
+                            &error_fatal);
+    object_property_set_int(OBJECT(stack->phb), "version", pecc->version,
+                            &error_fatal);
+
+    if (!sysbus_realize(SYS_BUS_DEVICE(stack->phb), errp)) {
+        return;
+    }
+}
+
 static void pnv_pec_instance_init(Object *obj)
 {
     PnvPhb4PecState *pec = PNV_PHB4_PEC(obj);
@@ -144,6 +170,15 @@ static void pnv_pec_realize(DeviceState *dev, Error **errp)
 
         object_property_set_int(stk_obj, "stack-no", i, &error_abort);
         object_property_set_link(stk_obj, "pec", OBJECT(pec), &error_abort);
+
+        if (defaults_enabled()) {
+            pnv_pec_default_phb_realize(stack, i, errp);
+        }
+
+        /*
+         * qdev gets angry if we don't realize 'stack' here, even
+         * if stk_realize() is now empty.
+         */
         if (!qdev_realize(DEVICE(stk_obj), NULL, errp)) {
             return;
         }
@@ -276,40 +311,8 @@ static const TypeInfo pnv_pec_type_info = {
     }
 };
 
-static void pnv_pec_stk_default_phb_realize(PnvPhb4PecStack *stack,
-                                            Error **errp)
-{
-    PnvPhb4PecState *pec = stack->pec;
-    PnvPhb4PecClass *pecc = PNV_PHB4_PEC_GET_CLASS(pec);
-    int phb_id = pnv_phb4_pec_get_phb_id(pec, stack->stack_no);
-
-    stack->phb = PNV_PHB4(qdev_new(TYPE_PNV_PHB4));
-
-    object_property_set_int(OBJECT(stack->phb), "phb-number", stack->stack_no,
-                            &error_abort);
-    object_property_set_link(OBJECT(stack->phb), "pec", OBJECT(pec),
-                             &error_abort);
-    object_property_set_int(OBJECT(stack->phb), "chip-id", pec->chip_id,
-                            &error_fatal);
-    object_property_set_int(OBJECT(stack->phb), "index", phb_id,
-                            &error_fatal);
-    object_property_set_int(OBJECT(stack->phb), "version", pecc->version,
-                            &error_fatal);
-
-    if (!sysbus_realize(SYS_BUS_DEVICE(stack->phb), errp)) {
-        return;
-    }
-}
-
 static void pnv_pec_stk_realize(DeviceState *dev, Error **errp)
 {
-    PnvPhb4PecStack *stack = PNV_PHB4_PEC_STACK(dev);
-
-    if (!defaults_enabled()) {
-        return;
-    }
-
-    pnv_pec_stk_default_phb_realize(stack, errp);
 }
 
 static Property pnv_pec_stk_properties[] = {
-- 
2.33.1


