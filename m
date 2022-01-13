Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC39648DE5A
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jan 2022 20:48:37 +0100 (CET)
Received: from localhost ([::1]:56362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n865M-0000x4-LU
	for lists+qemu-devel@lfdr.de; Thu, 13 Jan 2022 14:48:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n85o4-0006ZT-5k; Thu, 13 Jan 2022 14:30:47 -0500
Received: from [2607:f8b0:4864:20::22a] (port=40671
 helo=mail-oi1-x22a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n85nj-0005Br-7p; Thu, 13 Jan 2022 14:30:25 -0500
Received: by mail-oi1-x22a.google.com with SMTP id w188so9139838oib.7;
 Thu, 13 Jan 2022 11:30:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=C2JbgcmP2L5NAtCt7f42BcTucIS24KgCMecshqS/CU8=;
 b=ijb+t6/Obp5Qv/3RP41yNejMKEOAvXCvYXGGmrU8Ai/PhkTpeY7J4FmKI8nBd6lGy6
 P7yIkN8XZbTVz5hwQiUeFRtcVqHNgSr1c8wvLQbVLoYt8khg0Bec+mPxuCjqgPBF9dfn
 WZ/unn7hZ8iLeodIGk7HB3LSP2ZvCwqdCEYaza4w8VW9vFRb0V82Kf0ZmoYsiY0HDjvo
 wAjg3NikfIzy5/CTYHdZAdwtqMGozTVAMYpEAeWFDGNrzhDcaApKnkxxM/7AeKMrwMFh
 clojbTWtmRabwIx7OkU9pWSzbydGl7BhMUgzjRQiFc3RQ/ermsxlC5IpSRPOpmOqEPU/
 mdCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=C2JbgcmP2L5NAtCt7f42BcTucIS24KgCMecshqS/CU8=;
 b=EEYMbwwJmMkMxkFV8Yu4rVVoPZkeedYho7CjHpir/o52VrKgehsZR9RqDw/ijgvwoS
 +gRgZt+XSfcQVTqZB+GB7KCv4wA+PypFiRgxHC1Pea7MYIA4wxDcDHubffEgkaMCxqRJ
 NPx5bNM6GKdYzfuyGngtXUkeGXmMKYVHFjcxPe8wzjzTN3jlVjD4FGv0Prhyf19sCQly
 gon5p9cvOUSiqdAfsBiz0IBBm0/cbxEh4+8jUyHfvwpDB3HS4KKVFipmd2bpZOyMB4+j
 pSn+PgkZ6hMo6K6UXBvwBbxllKWSeK0uoYe8J2S2loB8MTAFWAEFrVoU/GOhYeoQcOBk
 QPaA==
X-Gm-Message-State: AOAM532ZDccm2f6+iqvPGSgjgVz4/2iTsj8XFXrNmiAOOhoUnOUKKc0G
 JO0uizskihJd5WUJg5/+CSaYE59YC5d3ZtP0
X-Google-Smtp-Source: ABdhPJwXiHQZsmoaP+xRLEx2iYvH/uZuxUbTpDvvG2mi9ZAfg9e++nc4tG68vwuLYujzJrGsoHstVg==
X-Received: by 2002:a05:6808:171c:: with SMTP id
 bc28mr10212906oib.102.1642102221762; 
 Thu, 13 Jan 2022 11:30:21 -0800 (PST)
Received: from rekt.COMFAST ([152.249.109.193])
 by smtp.gmail.com with ESMTPSA id 90sm743409otn.59.2022.01.13.11.30.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Jan 2022 11:30:21 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 11/17] ppc/pnv: introduce PnvPHB4 'phb_number' property
Date: Thu, 13 Jan 2022 16:29:46 -0300
Message-Id: <20220113192952.911188-12-danielhb413@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220113192952.911188-1-danielhb413@gmail.com>
References: <20220113192952.911188-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::22a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::22a;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x22a.google.com
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

One of the remaining dependencies we have on the PnvPhb4PecStack object
is the stack->stack_no property. This is set as the position the stack
occupies in the pec->stacks[] array.

We need a way to report this same value in the PnvPHB4. This patch
creates a new property called 'phb_number' to be used in existing code
in all instances stack->stack_no is currently being used.

The 'phb_number' name is an indication of our future intention to convert
the pec->stacks[] array into a pec->phbs[] array, when the PEC object will
deal directly with phb4 objects.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/pci-host/pnv_phb4.c         | 28 +++++++++++++++++-----------
 hw/pci-host/pnv_phb4_pec.c     |  2 ++
 include/hw/pci-host/pnv_phb4.h |  3 +++
 3 files changed, 22 insertions(+), 11 deletions(-)

diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
index b5045fca64..44f3087913 100644
--- a/hw/pci-host/pnv_phb4.c
+++ b/hw/pci-host/pnv_phb4.c
@@ -937,7 +937,7 @@ static void pnv_pec_stk_update_map(PnvPHB4 *phb)
         mask = phb->nest_regs[PEC_NEST_STK_MMIO_BAR0_MASK];
         size = ((~mask) >> 8) + 1;
         snprintf(name, sizeof(name), "pec-%d.%d-phb-%d-mmio0",
-                 pec->chip_id, pec->index, stack->stack_no);
+                 pec->chip_id, pec->index, phb->phb_number);
         memory_region_init(&phb->mmbar0, OBJECT(phb), name, size);
         memory_region_add_subregion(sysmem, bar, &phb->mmbar0);
         phb->mmio0_base = bar;
@@ -949,7 +949,7 @@ static void pnv_pec_stk_update_map(PnvPHB4 *phb)
         mask = phb->nest_regs[PEC_NEST_STK_MMIO_BAR1_MASK];
         size = ((~mask) >> 8) + 1;
         snprintf(name, sizeof(name), "pec-%d.%d-phb-%d-mmio1",
-                 pec->chip_id, pec->index, stack->stack_no);
+                 pec->chip_id, pec->index, phb->phb_number);
         memory_region_init(&phb->mmbar1, OBJECT(phb), name, size);
         memory_region_add_subregion(sysmem, bar, &phb->mmbar1);
         phb->mmio1_base = bar;
@@ -960,7 +960,7 @@ static void pnv_pec_stk_update_map(PnvPHB4 *phb)
         bar = phb->nest_regs[PEC_NEST_STK_PHB_REGS_BAR] >> 8;
         size = PNV_PHB4_NUM_REGS << 3;
         snprintf(name, sizeof(name), "pec-%d.%d-phb-%d",
-                 pec->chip_id, pec->index, stack->stack_no);
+                 pec->chip_id, pec->index, phb->phb_number);
         memory_region_init(&phb->phbbar, OBJECT(phb), name, size);
         memory_region_add_subregion(sysmem, bar, &phb->phbbar);
     }
@@ -969,7 +969,7 @@ static void pnv_pec_stk_update_map(PnvPHB4 *phb)
         bar = phb->nest_regs[PEC_NEST_STK_INT_BAR] >> 8;
         size = PNV_PHB4_MAX_INTs << 16;
         snprintf(name, sizeof(name), "pec-%d.%d-phb-%d-int",
-                 stack->pec->chip_id, stack->pec->index, stack->stack_no);
+                 stack->pec->chip_id, stack->pec->index, phb->phb_number);
         memory_region_init(&phb->intbar, OBJECT(phb), name, size);
         memory_region_add_subregion(sysmem, bar, &phb->intbar);
     }
@@ -1469,20 +1469,20 @@ static void pnv_phb4_xscom_realize(PnvPHB4 *phb)
 
     /* Initialize the XSCOM regions for the stack registers */
     snprintf(name, sizeof(name), "xscom-pec-%d.%d-nest-phb-%d",
-             pec->chip_id, pec->index, stack->stack_no);
+             pec->chip_id, pec->index, phb->phb_number);
     pnv_xscom_region_init(&phb->nest_regs_mr, OBJECT(phb),
                           &pnv_pec_stk_nest_xscom_ops, phb, name,
                           PHB4_PEC_NEST_STK_REGS_COUNT);
 
     snprintf(name, sizeof(name), "xscom-pec-%d.%d-pci-phb-%d",
-             pec->chip_id, pec->index, stack->stack_no);
+             pec->chip_id, pec->index, phb->phb_number);
     pnv_xscom_region_init(&phb->pci_regs_mr, OBJECT(phb),
                           &pnv_pec_stk_pci_xscom_ops, phb, name,
                           PHB4_PEC_PCI_STK_REGS_COUNT);
 
     /* PHB pass-through */
     snprintf(name, sizeof(name), "xscom-pec-%d.%d-pci-phb-%d",
-             pec->chip_id, pec->index, stack->stack_no);
+             pec->chip_id, pec->index, phb->phb_number);
     pnv_xscom_region_init(&phb->phb_regs_mr, OBJECT(phb),
                           &pnv_phb4_xscom_ops, phb, name, 0x40);
 
@@ -1491,14 +1491,14 @@ static void pnv_phb4_xscom_realize(PnvPHB4 *phb)
 
     /* Populate the XSCOM address space. */
     pnv_xscom_add_subregion(pec->chip,
-                            pec_nest_base + 0x40 * (stack->stack_no + 1),
+                            pec_nest_base + 0x40 * (phb->phb_number + 1),
                             &phb->nest_regs_mr);
     pnv_xscom_add_subregion(pec->chip,
-                            pec_pci_base + 0x40 * (stack->stack_no + 1),
+                            pec_pci_base + 0x40 * (phb->phb_number + 1),
                             &phb->pci_regs_mr);
     pnv_xscom_add_subregion(pec->chip,
                             pec_pci_base + PNV9_XSCOM_PEC_PCI_STK0 +
-                            0x40 * stack->stack_no,
+                            0x40 * phb->phb_number,
                             &phb->phb_regs_mr);
 }
 
@@ -1568,10 +1568,15 @@ static void pnv_phb4_realize(DeviceState *dev, Error **errp)
             return;
         }
 
-        /* All other phb properties but 'version' are already set */
+        /*
+         * All other phb properties but 'version' and 'phb-number'
+         * are already set.
+         */
         pecc = PNV_PHB4_PEC_GET_CLASS(phb->stack->pec);
         object_property_set_int(OBJECT(phb), "version", pecc->version,
                                 &error_fatal);
+        object_property_set_int(OBJECT(phb), "phb-number",
+                                phb->stack->stack_no, &error_abort);
 
         /*
          * Assign stack->phb since pnv_phb4_update_regions() uses it
@@ -1677,6 +1682,7 @@ static void pnv_phb4_xive_notify(XiveNotifier *xf, uint32_t srcno)
 }
 
 static Property pnv_phb4_properties[] = {
+        DEFINE_PROP_UINT32("phb-number", PnvPHB4, phb_number, 0),
         DEFINE_PROP_UINT32("index", PnvPHB4, phb_id, 0),
         DEFINE_PROP_UINT32("chip-id", PnvPHB4, chip_id, 0),
         DEFINE_PROP_UINT64("version", PnvPHB4, version, 0),
diff --git a/hw/pci-host/pnv_phb4_pec.c b/hw/pci-host/pnv_phb4_pec.c
index 7fe7f1f007..7c4b4023df 100644
--- a/hw/pci-host/pnv_phb4_pec.c
+++ b/hw/pci-host/pnv_phb4_pec.c
@@ -285,6 +285,8 @@ static void pnv_pec_stk_default_phb_realize(PnvPhb4PecStack *stack,
 
     stack->phb = PNV_PHB4(qdev_new(TYPE_PNV_PHB4));
 
+    object_property_set_int(OBJECT(stack->phb), "phb-number", stack->stack_no,
+                            &error_abort);
     object_property_set_int(OBJECT(stack->phb), "chip-id", pec->chip_id,
                             &error_fatal);
     object_property_set_int(OBJECT(stack->phb), "index", phb_id,
diff --git a/include/hw/pci-host/pnv_phb4.h b/include/hw/pci-host/pnv_phb4.h
index 6968efaba8..fc7807be1c 100644
--- a/include/hw/pci-host/pnv_phb4.h
+++ b/include/hw/pci-host/pnv_phb4.h
@@ -84,6 +84,9 @@ struct PnvPHB4 {
 
     uint64_t version;
 
+    /* My own PHB number */
+    uint32_t phb_number;
+
     char bus_path[8];
 
     /* Main register images */
-- 
2.33.1


