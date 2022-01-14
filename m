Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EAB0648EFCD
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jan 2022 19:18:18 +0100 (CET)
Received: from localhost ([::1]:53448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8R9W-0002ts-2h
	for lists+qemu-devel@lfdr.de; Fri, 14 Jan 2022 13:18:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n8QzH-0005lH-12; Fri, 14 Jan 2022 13:07:43 -0500
Received: from [2607:f8b0:4864:20::32b] (port=36834
 helo=mail-ot1-x32b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n8Qz8-0000OK-9m; Fri, 14 Jan 2022 13:07:42 -0500
Received: by mail-ot1-x32b.google.com with SMTP id
 s21-20020a05683004d500b0058f585672efso10975173otd.3; 
 Fri, 14 Jan 2022 10:07:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SCTWNvfONvAG20pSuoDHmmCdiFQbwCr5TBcbCLkF+bg=;
 b=U21i/gmHvLmgON8X66XvQKMzWA/xbrv0yocWx5/5a5jl79IoD4JI86ushJYovlQNth
 jUcECvXEzDElYnbT438SkS7Zp6kIrCpm5Rw4uTTJN/b2easrdbv8zHmtxw9BNJkupk0Z
 dytkdpu3xMMe5YnSgIU8jbP7JyN5NePaK3F5fpcGQzhdFF3B8JRw0lG+zUQUufPDl7FO
 PUivldFNpHxCwH/CLOFTh6T/NmV4OQynPkcwUswsjd/SgmdaWoZix5/IgTTr4xNpb9Wt
 12GvktsKysXbStttzOJldX6xxviv9FhQepvyLPUMLACnvZIjfCJdjWhWBn77XVQpZqMi
 9T/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SCTWNvfONvAG20pSuoDHmmCdiFQbwCr5TBcbCLkF+bg=;
 b=y3jMk2l7wBzS8QG7sFl5qKjM2PePfJ27jJCCwSir7B3/7e/mloW17VTA9KuAhO/KSU
 GcsHoySzsyTXWPG0BMi9Q6orwIB67BhDF4zIB3+7hZACMsUgMI7zJArdWjhgHG/XbIT2
 Vt/w0IewScVEJcRzmvoLErCeLDSc6SpPElcj0CTilQud8hUe76MayrptTN0EV+Xf3srq
 E7ZpEaJk7ZStBYwcv3/wqo6KE9olcPVs2u4ATDi8BDqhJbGaIwVZ/xPHMR/gHyoGgcZX
 U0RURQLiCrvTR01R72dXYKr/ngfwaRSbitIJJEaEwcA47NYWf33SbD6Ctvl9i+m9yzkt
 CGmw==
X-Gm-Message-State: AOAM531LYpUV1CWOhQjxlyKd5roOzzEiHWMBa6tyMg4ZXGXL+hZ2tRec
 nBdZ+PXJczqqU8eqwOKQaOKKxJ/dRckB6RsK
X-Google-Smtp-Source: ABdhPJwhV6KqiHGZTbVzB2/VUhmt66PVJZZ8+dj277UlP3bEi3DSGO8SvJkEUHOycvUPpCdl7qXBWg==
X-Received: by 2002:a05:6830:22c8:: with SMTP id
 q8mr7643643otc.54.1642183652790; 
 Fri, 14 Jan 2022 10:07:32 -0800 (PST)
Received: from rekt.COMFAST ([152.249.109.193])
 by smtp.gmail.com with ESMTPSA id e17sm1353584otr.13.2022.01.14.10.07.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Jan 2022 10:07:32 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/8] ppc/pnv: reduce stack->stack_no usage
Date: Fri, 14 Jan 2022 15:07:13 -0300
Message-Id: <20220114180719.52117-3-danielhb413@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220114180719.52117-1-danielhb413@gmail.com>
References: <20220114180719.52117-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::32b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::32b;
 envelope-from=danielhb413@gmail.com; helo=mail-ot1-x32b.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.001,
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

'stack->stack_no' represents the order that a stack appears in its PEC.
Its primary use is in XSCOM address space calculation in
pnv_phb4_xscom_realize() when calculating the memory region offset.

This attribute is redundant with phb->phb_id, which is calculated via
pnv_phb4_pec_get_phb_id() using stack->stack_no information. It'll also
be awkward to assign it when dealing with PECs and PHBs only in a future
patch.

A new pnv_phb4_get_phb_stack_no() helper is introduced to eliminate most
of the stack->stack_no uses we have. The only use left after this patch
is during pnv_pec_stk_default_phb_realize() when calculating phb_id,
which will also handled in the next patches.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/pci-host/pnv_phb4.c | 46 +++++++++++++++++++++++++++++++-----------
 1 file changed, 34 insertions(+), 12 deletions(-)

diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
index 2658ef2d84..4933fe57fe 100644
--- a/hw/pci-host/pnv_phb4.c
+++ b/hw/pci-host/pnv_phb4.c
@@ -868,6 +868,28 @@ static uint64_t pnv_pec_stk_nest_xscom_read(void *opaque, hwaddr addr,
     return phb->nest_regs[reg];
 }
 
+/*
+ * Return the 'stack_no' of a PHB4. 'stack_no' is the order
+ * the PHB4 occupies in the PEC. This is the reverse of what
+ * pnv_phb4_pec_get_phb_id() does.
+ *
+ * E.g. a phb with phb_id = 4 and pec->index = 1 (PEC1) will
+ * be the second phb (stack_no = 1) of the PEC.
+ */
+static int pnv_phb4_get_phb_stack_no(PnvPHB4 *phb)
+{
+    PnvPhb4PecState *pec = phb->pec;
+    PnvPhb4PecClass *pecc = PNV_PHB4_PEC_GET_CLASS(pec);
+    int index = pec->index;
+    int stack_no = phb->phb_id;
+
+    while (index--) {
+        stack_no -= pecc->num_stacks[index];
+    }
+
+    return stack_no;
+}
+
 static void pnv_phb4_update_regions(PnvPHB4 *phb)
 {
     /* Unmap first always */
@@ -894,10 +916,10 @@ static void pnv_phb4_update_regions(PnvPHB4 *phb)
 
 static void pnv_pec_stk_update_map(PnvPHB4 *phb)
 {
-    PnvPhb4PecStack *stack = phb->stack;
     PnvPhb4PecState *pec = phb->pec;
     MemoryRegion *sysmem = get_system_memory();
     uint64_t bar_en = phb->nest_regs[PEC_NEST_STK_BAR_EN];
+    int stack_no = pnv_phb4_get_phb_stack_no(phb);
     uint64_t bar, mask, size;
     char name[64];
 
@@ -937,7 +959,7 @@ static void pnv_pec_stk_update_map(PnvPHB4 *phb)
         mask = phb->nest_regs[PEC_NEST_STK_MMIO_BAR0_MASK];
         size = ((~mask) >> 8) + 1;
         snprintf(name, sizeof(name), "pec-%d.%d-phb-%d-mmio0",
-                 pec->chip_id, pec->index, stack->stack_no);
+                 pec->chip_id, pec->index, stack_no);
         memory_region_init(&phb->mmbar0, OBJECT(phb), name, size);
         memory_region_add_subregion(sysmem, bar, &phb->mmbar0);
         phb->mmio0_base = bar;
@@ -949,7 +971,7 @@ static void pnv_pec_stk_update_map(PnvPHB4 *phb)
         mask = phb->nest_regs[PEC_NEST_STK_MMIO_BAR1_MASK];
         size = ((~mask) >> 8) + 1;
         snprintf(name, sizeof(name), "pec-%d.%d-phb-%d-mmio1",
-                 pec->chip_id, pec->index, stack->stack_no);
+                 pec->chip_id, pec->index, stack_no);
         memory_region_init(&phb->mmbar1, OBJECT(phb), name, size);
         memory_region_add_subregion(sysmem, bar, &phb->mmbar1);
         phb->mmio1_base = bar;
@@ -960,7 +982,7 @@ static void pnv_pec_stk_update_map(PnvPHB4 *phb)
         bar = phb->nest_regs[PEC_NEST_STK_PHB_REGS_BAR] >> 8;
         size = PNV_PHB4_NUM_REGS << 3;
         snprintf(name, sizeof(name), "pec-%d.%d-phb-%d",
-                 pec->chip_id, pec->index, stack->stack_no);
+                 pec->chip_id, pec->index, stack_no);
         memory_region_init(&phb->phbbar, OBJECT(phb), name, size);
         memory_region_add_subregion(sysmem, bar, &phb->phbbar);
     }
@@ -969,7 +991,7 @@ static void pnv_pec_stk_update_map(PnvPHB4 *phb)
         bar = phb->nest_regs[PEC_NEST_STK_INT_BAR] >> 8;
         size = PNV_PHB4_MAX_INTs << 16;
         snprintf(name, sizeof(name), "pec-%d.%d-phb-%d-int",
-                 phb->pec->chip_id, phb->pec->index, stack->stack_no);
+                 phb->pec->chip_id, phb->pec->index, stack_no);
         memory_region_init(&phb->intbar, OBJECT(phb), name, size);
         memory_region_add_subregion(sysmem, bar, &phb->intbar);
     }
@@ -1458,9 +1480,9 @@ static AddressSpace *pnv_phb4_dma_iommu(PCIBus *bus, void *opaque, int devfn)
 
 static void pnv_phb4_xscom_realize(PnvPHB4 *phb)
 {
-    PnvPhb4PecStack *stack = phb->stack;
     PnvPhb4PecState *pec = phb->pec;
     PnvPhb4PecClass *pecc = PNV_PHB4_PEC_GET_CLASS(pec);
+    int stack_no = pnv_phb4_get_phb_stack_no(phb);
     uint32_t pec_nest_base;
     uint32_t pec_pci_base;
     char name[64];
@@ -1469,20 +1491,20 @@ static void pnv_phb4_xscom_realize(PnvPHB4 *phb)
 
     /* Initialize the XSCOM regions for the stack registers */
     snprintf(name, sizeof(name), "xscom-pec-%d.%d-nest-phb-%d",
-             pec->chip_id, pec->index, stack->stack_no);
+             pec->chip_id, pec->index, stack_no);
     pnv_xscom_region_init(&phb->nest_regs_mr, OBJECT(phb),
                           &pnv_pec_stk_nest_xscom_ops, phb, name,
                           PHB4_PEC_NEST_STK_REGS_COUNT);
 
     snprintf(name, sizeof(name), "xscom-pec-%d.%d-pci-phb-%d",
-             pec->chip_id, pec->index, stack->stack_no);
+             pec->chip_id, pec->index, stack_no);
     pnv_xscom_region_init(&phb->pci_regs_mr, OBJECT(phb),
                           &pnv_pec_stk_pci_xscom_ops, phb, name,
                           PHB4_PEC_PCI_STK_REGS_COUNT);
 
     /* PHB pass-through */
     snprintf(name, sizeof(name), "xscom-pec-%d.%d-pci-phb-%d",
-             pec->chip_id, pec->index, stack->stack_no);
+             pec->chip_id, pec->index, stack_no);
     pnv_xscom_region_init(&phb->phb_regs_mr, OBJECT(phb),
                           &pnv_phb4_xscom_ops, phb, name, 0x40);
 
@@ -1491,14 +1513,14 @@ static void pnv_phb4_xscom_realize(PnvPHB4 *phb)
 
     /* Populate the XSCOM address space. */
     pnv_xscom_add_subregion(pec->chip,
-                            pec_nest_base + 0x40 * (stack->stack_no + 1),
+                            pec_nest_base + 0x40 * (stack_no + 1),
                             &phb->nest_regs_mr);
     pnv_xscom_add_subregion(pec->chip,
-                            pec_pci_base + 0x40 * (stack->stack_no + 1),
+                            pec_pci_base + 0x40 * (stack_no + 1),
                             &phb->pci_regs_mr);
     pnv_xscom_add_subregion(pec->chip,
                             pec_pci_base + PNV9_XSCOM_PEC_PCI_STK0 +
-                            0x40 * stack->stack_no,
+                            0x40 * stack_no,
                             &phb->phb_regs_mr);
 }
 
-- 
2.33.1


