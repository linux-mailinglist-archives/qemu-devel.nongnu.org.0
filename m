Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AD04489B8B
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 15:47:25 +0100 (CET)
Received: from localhost ([::1]:42366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6vxE-0002md-Ee
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 09:47:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n6vkR-0001w8-Ll; Mon, 10 Jan 2022 09:34:11 -0500
Received: from [2607:f8b0:4864:20::931] (port=39717
 helo=mail-ua1-x931.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n6vkQ-0007Pk-3g; Mon, 10 Jan 2022 09:34:11 -0500
Received: by mail-ua1-x931.google.com with SMTP id m15so9396882uap.6;
 Mon, 10 Jan 2022 06:34:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+8CXNDceoKrlarffzDH3tP+HhdA25UZN0ukZtLV4OLI=;
 b=baPm4lEKFQ0XBo3wp+LZ5gp9849TqGUnvmcDsdTktJKiUniWw92tICvfGlgpU4DyDm
 D6LIIWIdmyKcDxmLSAYWG1Z5tqrEy60+hjhqR6WksXlZjvFZGy8/GQ0XWmH0sOQxc0MB
 EfnbGgFL0mQcsaVnWf+F3qfNDRIc9PTDIMWXxCJa3AFSyLz7rjmY9q/KiKaYXHG4trwp
 A53p5tN1HJXYmLoFvzJPsgdCEJmRew765G9DBIDRSQN4rCHBeZK/3O0awj+Aa/39nzmO
 C/QD76sYDlNBKXFcrwjmryjbkL2s7ZPZ9BH/3UGRrsYysx5/L5Lqv/mTI1/Jg9XukPD8
 N7VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+8CXNDceoKrlarffzDH3tP+HhdA25UZN0ukZtLV4OLI=;
 b=2bzQVfPDzuRsxDzH0lCBRChwp0+rSEvUTMwpLNDo5OnvYMp3HEpXJLmg1PRlt8c1YB
 2QZ6p5894KC8DREm0YEfYFI0Vjam6Lwbl1gb2LgmQwjiJxEIKSEeWmu11SkU0ZMEsMm1
 dKlDudIlBqMie80P3Ej0opopEf6toPKo1IGZBJAwHXgng9+QNyedOAphFp91Hejmqg0Q
 qAm3rVyenDKvkJuouyUIrceM9x6ijrpIgeJHFXmFx98tOjvoXZQ00JaH+aNbiH2Q/WNo
 gjCMwV16SumpSGgfOIwEnB4TlDQc4QWLDMRRBWYUqQRcp1Yq0bjmmDflhe/SHONjs1hY
 Ur5A==
X-Gm-Message-State: AOAM533Bt9ehuFwAmR4DOHIWfIRKNaWMoKVKPmjuWXUYOtUNJIAaz7BX
 I9YpUkNFna4QkgVkV59bS12psWB1w1bhsBBw
X-Google-Smtp-Source: ABdhPJwigJAA6TP+MC7Dk7I6dW2dvAg9ICUWT1lNibqAEU2VOyrZq2WXvYCD6zI7k9eu8mXILX3FWQ==
X-Received: by 2002:a9f:3e01:: with SMTP id o1mr27232486uai.89.1641825248896; 
 Mon, 10 Jan 2022 06:34:08 -0800 (PST)
Received: from rekt.COMFAST ([152.249.109.193])
 by smtp.gmail.com with ESMTPSA id o11sm3709677vkf.41.2022.01.10.06.34.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jan 2022 06:34:08 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 07/10] ppc/pnv: move PHB4 related XSCOM init to
 phb4_realize()
Date: Mon, 10 Jan 2022 11:33:43 -0300
Message-Id: <20220110143346.455901-8-danielhb413@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220110143346.455901-1-danielhb413@gmail.com>
References: <20220110143346.455901-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::931
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::931;
 envelope-from=danielhb413@gmail.com; helo=mail-ua1-x931.google.com
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

Before enabling pnv-phb4 user creatable devices we need to handle PHB4
specific code in pnv_pec_stk_realize().

The 'stack->phb_regs_mr' PHB4 passthrough XSCOM initialization relies on
'stack->phb' being not NULL. Moving 'stack->phb_regs_mr' region_init()
and add_subregion() to phb4_realize() time is a natural thing to do and
it'll spare us from checking 'phb->stack != NULL' in stk_realize() when
user creatable pnv-phb4s are implemented.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/pci-host/pnv_phb4.c     | 27 +++++++++++++++++++++++++++
 hw/pci-host/pnv_phb4_pec.c | 10 ----------
 2 files changed, 27 insertions(+), 10 deletions(-)

diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
index 1a7395772f..152911a285 100644
--- a/hw/pci-host/pnv_phb4.c
+++ b/hw/pci-host/pnv_phb4.c
@@ -1194,6 +1194,31 @@ void pnv_phb4_set_stack_phb_props(PnvPhb4PecStack *stack,
                              &error_abort);
 }
 
+static void pnv_phb4_init_xscom_passthrough(PnvPHB4 *phb)
+{
+    PnvPhb4PecState *pec;
+    PnvPhb4PecClass *pecc;
+    uint32_t pec_pci_base;
+    char name[64];
+
+    assert(phb->stack);
+
+    pec = phb->stack->pec;
+    pecc = PNV_PHB4_PEC_GET_CLASS(pec);
+    pec_pci_base = pecc->xscom_pci_base(pec);
+
+    /* PHB pass-through */
+    snprintf(name, sizeof(name), "xscom-pec-%d.%d-pci-stack-%d-phb",
+             pec->chip_id, pec->index, phb->stack->stack_no);
+    pnv_xscom_region_init(&phb->stack->phb_regs_mr, OBJECT(phb),
+                          &pnv_phb4_xscom_ops, phb, name, 0x40);
+
+    pnv_xscom_add_subregion(pec->chip,
+                            pec_pci_base + PNV9_XSCOM_PEC_PCI_STK0 +
+                            0x40 * phb->stack->stack_no,
+                            &phb->stack->phb_regs_mr);
+}
+
 static void pnv_phb4_instance_init(Object *obj)
 {
     PnvPHB4 *phb = PNV_PHB4(obj);
@@ -1223,6 +1248,8 @@ static void pnv_phb4_realize(DeviceState *dev, Error **errp)
     memory_region_init_io(&phb->mr_regs, OBJECT(phb), &pnv_phb4_reg_ops, phb,
                           name, 0x2000);
 
+    pnv_phb4_init_xscom_passthrough(phb);
+
     /*
      * PHB4 doesn't support IO space. However, qemu gets very upset if
      * we don't have an IO region to anchor IO BARs onto so we just
diff --git a/hw/pci-host/pnv_phb4_pec.c b/hw/pci-host/pnv_phb4_pec.c
index 042dc0b775..5e02a51f04 100644
--- a/hw/pci-host/pnv_phb4_pec.c
+++ b/hw/pci-host/pnv_phb4_pec.c
@@ -571,12 +571,6 @@ static void pnv_pec_stk_realize(DeviceState *dev, Error **errp)
                           &pnv_pec_stk_pci_xscom_ops, stack, name,
                           PHB4_PEC_PCI_STK_REGS_COUNT);
 
-    /* PHB pass-through */
-    snprintf(name, sizeof(name), "xscom-pec-%d.%d-pci-stack-%d-phb",
-             pec->chip_id, pec->index, stack->stack_no);
-    pnv_xscom_region_init(&stack->phb_regs_mr, OBJECT(stack->phb),
-                          &pnv_phb4_xscom_ops, stack->phb, name, 0x40);
-
     if (stack->phb && !sysbus_realize(SYS_BUS_DEVICE(stack->phb), errp)) {
         return;
     }
@@ -591,10 +585,6 @@ static void pnv_pec_stk_realize(DeviceState *dev, Error **errp)
     pnv_xscom_add_subregion(chip,
                             pec_pci_base + 0x40 * (stack->stack_no + 1),
                             &stack->pci_regs_mr);
-    pnv_xscom_add_subregion(chip,
-                            pec_pci_base + PNV9_XSCOM_PEC_PCI_STK0 +
-                            0x40 * stack->stack_no,
-                            &stack->phb_regs_mr);
 }
 
 static Property pnv_pec_stk_properties[] = {
-- 
2.33.1


