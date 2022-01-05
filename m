Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CBED485AE7
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 22:43:30 +0100 (CET)
Received: from localhost ([::1]:40964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5E49-0000jY-Ck
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 16:43:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n5Dlr-0002lw-CW; Wed, 05 Jan 2022 16:24:36 -0500
Received: from [2607:f8b0:4864:20::929] (port=33620
 helo=mail-ua1-x929.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n5Dlk-0007wi-C4; Wed, 05 Jan 2022 16:24:34 -0500
Received: by mail-ua1-x929.google.com with SMTP id u6so948913uaq.0;
 Wed, 05 Jan 2022 13:24:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=c9B/5k+GlO03SuurIyo65tZHyGVJVMMEC2A/JY1LV/I=;
 b=CmONbOerjoJb/Zr0LP9yy/l1r/zuxeqekKU+jL1dEMyM7HH1cVk2/4LqA9JR6ENsQe
 689ozmqL+7MAWfXPihZ9xQHYgZlWzF8OcqmADzQFBWoRvVi/IEDFfOWiN1+sAORZDisB
 /vyDLUFg6uZJ/ORLKPfJACXMsy8kdQKWIPZhFN9xp4Alre8VtC+sNl05CtWwyhh8eEtE
 +43Aib8hzCWvafMKr/3NzUDav/QWaugvZhRHdK+s3hEncg5mmDxwnpGuUN1QmytV4WNP
 Ll5rj0SAhnOiWiETbmGQcSWEevhfgyEGe7RXUonwIdx7dcwggAQoP8TfMSUwKdJH0Zhn
 608A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=c9B/5k+GlO03SuurIyo65tZHyGVJVMMEC2A/JY1LV/I=;
 b=Bd2XCsVxVVGa4p6VjPQBBgliuIelWyNtbwVLpcNYvl0yNaYWYwx2MjuGP0Pc34NFzy
 o1GuMTkL3v/jhJSkJM00roQEBaHzK7b7OzFAenwbL9lqGAK3U3qJB0dh4IuoVJyoOkoc
 CJhJm8B9t2iFKrC0h+k3aQU6fSRPrVbaT9wTqW4LuMyE/rzjrhIrdcHj4ZSC2OC7WZNe
 2WKp6ugJuywB/TmgLtVLUn5PFToSHbL6+B4MWn0G8rly5iaqCD879Oqa/bOZQYIiiz7B
 9xIzpVtk0GFYvKjAkNepVxGBJUORUaivubbCqYJ1IRDTcLv/2pmf0qhPDe+gGvNWsclP
 2nEw==
X-Gm-Message-State: AOAM532T9d55cyDqEVaufZIzbD9Y8FbfdiTOea4yp48/PT2HFCXxAPLF
 AMhW5Z6TxMXXZidqv3ycPlZuM0jLVrw=
X-Google-Smtp-Source: ABdhPJyoyZzIBBomiURmeGPOeYI5McvmRTBwBPUfzCIhKyTl4uUQO4ZlqHyszesdK0KUxtcl/rfhMQ==
X-Received: by 2002:a05:6102:839:: with SMTP id
 k25mr17541401vsb.46.1641417866019; 
 Wed, 05 Jan 2022 13:24:26 -0800 (PST)
Received: from rekt.ibmuc.com ([2804:431:c7c7:f4d8:aa07:335f:99e0:a6e7])
 by smtp.gmail.com with ESMTPSA id m5sm65922vke.43.2022.01.05.13.24.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jan 2022 13:24:25 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 16/18] pnv_phb4.c: introduce pnv_pec_init_stack_xscom()
Date: Wed,  5 Jan 2022 18:23:36 -0300
Message-Id: <20220105212338.49899-17-danielhb413@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220105212338.49899-1-danielhb413@gmail.com>
References: <20220105212338.49899-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::929
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::929;
 envelope-from=danielhb413@gmail.com; helo=mail-ua1-x929.google.com
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
Cc: danielhb413@gmail.com, qemu-ppc@nongnu.org, clg@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The XSCOM address space of the stack must be populated after the
initialization of its associated PHB4 is completed. At this moment this
is always true because stk_realize() will always succeeds the realize of
stack->phb, but that will not be the case with user creatable pnv-phb4
devices.

Create a helper that can be used later on during pnv-phb4 realize() to
initialize the xscom address space of its stack.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/pci-host/pnv_phb4.c         | 26 ++++++++++++++++++++++++++
 hw/pci-host/pnv_phb4_pec.c     | 19 +------------------
 include/hw/pci-host/pnv_phb4.h |  1 +
 3 files changed, 28 insertions(+), 18 deletions(-)

diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
index 9e670e41d2..430a5c10f4 100644
--- a/hw/pci-host/pnv_phb4.c
+++ b/hw/pci-host/pnv_phb4.c
@@ -1158,6 +1158,32 @@ static AddressSpace *pnv_phb4_dma_iommu(PCIBus *bus, void *opaque, int devfn)
     return &ds->dma_as;
 }
 
+/*
+ * Init the xscom address space of the stack. This must be
+ * called after the associated stack->phb is defined.
+ */
+void pnv_pec_init_stack_xscom(PnvPhb4PecStack *stack)
+{
+    PnvPhb4PecState *pec = stack->pec;
+    PnvPhb4PecClass *pecc = PNV_PHB4_PEC_GET_CLASS(pec);
+    PnvChip *chip = pec->chip;
+    uint32_t pec_nest_base = pecc->xscom_nest_base(pec);
+    uint32_t pec_pci_base = pecc->xscom_pci_base(pec);
+
+
+    /* Populate the XSCOM address space. */
+    pnv_xscom_add_subregion(chip,
+                            pec_nest_base + 0x40 * (stack->stack_no + 1),
+                            &stack->nest_regs_mr);
+    pnv_xscom_add_subregion(chip,
+                            pec_pci_base + 0x40 * (stack->stack_no + 1),
+                            &stack->pci_regs_mr);
+    pnv_xscom_add_subregion(chip,
+                            pec_pci_base + PNV9_XSCOM_PEC_PCI_STK0 +
+                            0x40 * stack->stack_no,
+                            &stack->phb_regs_mr);
+}
+
 /*
  * Return the index/phb-id of a PHB4 that belongs to a
  * pec->stacks[stack_index] stack.
diff --git a/hw/pci-host/pnv_phb4_pec.c b/hw/pci-host/pnv_phb4_pec.c
index 638691783b..41c79d24c4 100644
--- a/hw/pci-host/pnv_phb4_pec.c
+++ b/hw/pci-host/pnv_phb4_pec.c
@@ -556,10 +556,6 @@ static void pnv_pec_stk_realize(DeviceState *dev, Error **errp)
 {
     PnvPhb4PecStack *stack = PNV_PHB4_PEC_STACK(dev);
     PnvPhb4PecState *pec = stack->pec;
-    PnvPhb4PecClass *pecc = PNV_PHB4_PEC_GET_CLASS(pec);
-    PnvChip *chip = pec->chip;
-    uint32_t pec_nest_base;
-    uint32_t pec_pci_base;
     char name[64];
 
     assert(pec);
@@ -583,20 +579,7 @@ static void pnv_pec_stk_realize(DeviceState *dev, Error **errp)
         return;
     }
 
-    pec_nest_base = pecc->xscom_nest_base(pec);
-    pec_pci_base = pecc->xscom_pci_base(pec);
-
-    /* Populate the XSCOM address space. */
-    pnv_xscom_add_subregion(chip,
-                            pec_nest_base + 0x40 * (stack->stack_no + 1),
-                            &stack->nest_regs_mr);
-    pnv_xscom_add_subregion(chip,
-                            pec_pci_base + 0x40 * (stack->stack_no + 1),
-                            &stack->pci_regs_mr);
-    pnv_xscom_add_subregion(chip,
-                            pec_pci_base + PNV9_XSCOM_PEC_PCI_STK0 +
-                            0x40 * stack->stack_no,
-                            &stack->phb_regs_mr);
+    pnv_pec_init_stack_xscom(stack);
 }
 
 static Property pnv_pec_stk_properties[] = {
diff --git a/include/hw/pci-host/pnv_phb4.h b/include/hw/pci-host/pnv_phb4.h
index 2fb5e119c4..610580a88f 100644
--- a/include/hw/pci-host/pnv_phb4.h
+++ b/include/hw/pci-host/pnv_phb4.h
@@ -132,6 +132,7 @@ struct PnvPHB4 {
 
 void pnv_phb4_pic_print_info(PnvPHB4 *phb, Monitor *mon);
 void pnv_phb4_update_regions(PnvPhb4PecStack *stack);
+void pnv_pec_init_stack_xscom(PnvPhb4PecStack *stack);
 void pnv_phb4_set_stack_phb_props(PnvPhb4PecStack *stack, PnvPHB4 *phb);
 int pnv_phb4_pec_get_phb_id(PnvPhb4PecState *pec, int stack_index);
 extern const MemoryRegionOps pnv_phb4_xscom_ops;
-- 
2.33.1


