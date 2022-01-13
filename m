Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3D8E48DE52
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jan 2022 20:46:25 +0100 (CET)
Received: from localhost ([::1]:51924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n863E-0006EM-OT
	for lists+qemu-devel@lfdr.de; Thu, 13 Jan 2022 14:46:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n85nZ-0006Qj-Ee; Thu, 13 Jan 2022 14:30:13 -0500
Received: from [2607:f8b0:4864:20::333] (port=46970
 helo=mail-ot1-x333.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n85nU-00057A-Si; Thu, 13 Jan 2022 14:30:10 -0500
Received: by mail-ot1-x333.google.com with SMTP id
 t4-20020a05683022e400b00591aaf48277so7452648otc.13; 
 Thu, 13 Jan 2022 11:30:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qlzqre5YnO1MD+zn72qC624iitqzx5olmZATphI6Tdo=;
 b=J7rMY2XjhLqGDuA94xC411lU6PkWUCdjRhbLTDI45kOmMIZBuHK/TqCOjWBwQ6q5Qi
 CR0Axk33U+kVmmsUFK2mlDOcLawmpotQXIVirlmm4IfSzDSgzD6FXQQwdxklpFwBAw9+
 t2+B6Hm/CIr+0S/EGnRyBK0/DtAVg76DbsIXwuWBSov2Amu7nbg/X5FWJvIGWWayQYux
 6JNDJVBx7s2zx3qFoiTciM+WGV8c/sQlYorOOJAI9qX1tKJsHazM3Sw7Gl7c2IITnvx2
 vSrAIR5/1XrtTznwIrFvCR1aNkHJAtSF16d1NZXz3riLj7AmlD3Mx2DH/mU4i3N8iRUr
 P9EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qlzqre5YnO1MD+zn72qC624iitqzx5olmZATphI6Tdo=;
 b=eAT03pTYEVHu23RhSQfSTyD1COmkTatLvmomr/qnqVXLAxGwD/gojE5jBxuonBw7JN
 jv+HG6ym8K223oGTf0FaRC9CK++OmFxtqQSZU+hZYuymieHYX3jBc2htrpxxK2Gg7itW
 WdGF+Qf2d8TS8uAr/WCOqPZZikfzyWLHiYQJAgpEVtAQBvI4wjV+T/aWJ3UspXgvBAZN
 dy8d5IKpmsewyRLcn2W7mwWRx8jlZQxgdGBU12GYV6TOs6+e9GzWd6IM+/a3ui/EzRFe
 e1oT7U3eJ9SpxCZiVpMEf7+I2zmeo/bOwJy7+18FleYG4Y28NlSGkj3Ksx/Tok6X/mN+
 4oDw==
X-Gm-Message-State: AOAM533YeYk0wW8w2qnPItbY1JA++Ikstq8S8K4UGtO+AD3IQi6MMrnJ
 m+6X78oEpulPaS94ac663W4PedVV7o7s7RqF
X-Google-Smtp-Source: ABdhPJz2qf3/vakyf5j1klsCbqe/vZkENdRwhNo2wvlwuLsrOjT6GiInUAAqJ8BqN13DOq28/CCqGw==
X-Received: by 2002:a9d:7f81:: with SMTP id t1mr4105268otp.89.1642102207265;
 Thu, 13 Jan 2022 11:30:07 -0800 (PST)
Received: from rekt.COMFAST ([152.249.109.193])
 by smtp.gmail.com with ESMTPSA id 90sm743409otn.59.2022.01.13.11.30.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Jan 2022 11:30:07 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 03/17] ppc/pnv: move phbbar to PnvPHB4
Date: Thu, 13 Jan 2022 16:29:38 -0300
Message-Id: <20220113192952.911188-4-danielhb413@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220113192952.911188-1-danielhb413@gmail.com>
References: <20220113192952.911188-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::333
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::333;
 envelope-from=danielhb413@gmail.com; helo=mail-ot1-x333.google.com
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

This MemoryRegion is simple enough to be moved in a single step.

A 'stack->phb' pointer had to be introduced in pnv_pec_stk_update_map()
because this function isn't ready to be fully converted to use a PnvPHB4
pointer instead. This will be dealt with in the following patches.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/pci-host/pnv_phb4.c         | 19 ++++++++++---------
 include/hw/pci-host/pnv_phb4.h |  4 +++-
 2 files changed, 13 insertions(+), 10 deletions(-)

diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
index fd9f6af4b3..00eaf91fca 100644
--- a/hw/pci-host/pnv_phb4.c
+++ b/hw/pci-host/pnv_phb4.c
@@ -874,15 +874,15 @@ static void pnv_phb4_update_regions(PnvPhb4PecStack *stack)
 
     /* Unmap first always */
     if (memory_region_is_mapped(&phb->mr_regs)) {
-        memory_region_del_subregion(&stack->phbbar, &phb->mr_regs);
+        memory_region_del_subregion(&phb->phbbar, &phb->mr_regs);
     }
     if (memory_region_is_mapped(&phb->xsrc.esb_mmio)) {
         memory_region_del_subregion(&stack->intbar, &phb->xsrc.esb_mmio);
     }
 
     /* Map registers if enabled */
-    if (memory_region_is_mapped(&stack->phbbar)) {
-        memory_region_add_subregion(&stack->phbbar, 0, &phb->mr_regs);
+    if (memory_region_is_mapped(&phb->phbbar)) {
+        memory_region_add_subregion(&phb->phbbar, 0, &phb->mr_regs);
     }
 
     /* Map ESB if enabled */
@@ -897,6 +897,7 @@ static void pnv_phb4_update_regions(PnvPhb4PecStack *stack)
 static void pnv_pec_stk_update_map(PnvPhb4PecStack *stack)
 {
     PnvPhb4PecState *pec = stack->pec;
+    PnvPHB4 *phb = stack->phb;
     MemoryRegion *sysmem = get_system_memory();
     uint64_t bar_en = stack->nest_regs[PEC_NEST_STK_BAR_EN];
     uint64_t bar, mask, size;
@@ -919,9 +920,9 @@ static void pnv_pec_stk_update_map(PnvPhb4PecStack *stack)
         !(bar_en & PEC_NEST_STK_BAR_EN_MMIO1)) {
         memory_region_del_subregion(sysmem, &stack->mmbar1);
     }
-    if (memory_region_is_mapped(&stack->phbbar) &&
+    if (memory_region_is_mapped(&phb->phbbar) &&
         !(bar_en & PEC_NEST_STK_BAR_EN_PHB)) {
-        memory_region_del_subregion(sysmem, &stack->phbbar);
+        memory_region_del_subregion(sysmem, &phb->phbbar);
     }
     if (memory_region_is_mapped(&stack->intbar) &&
         !(bar_en & PEC_NEST_STK_BAR_EN_INT)) {
@@ -956,14 +957,14 @@ static void pnv_pec_stk_update_map(PnvPhb4PecStack *stack)
         stack->mmio1_base = bar;
         stack->mmio1_size = size;
     }
-    if (!memory_region_is_mapped(&stack->phbbar) &&
+    if (!memory_region_is_mapped(&phb->phbbar) &&
         (bar_en & PEC_NEST_STK_BAR_EN_PHB)) {
         bar = stack->nest_regs[PEC_NEST_STK_PHB_REGS_BAR] >> 8;
         size = PNV_PHB4_NUM_REGS << 3;
-        snprintf(name, sizeof(name), "pec-%d.%d-stack-%d-phb",
+        snprintf(name, sizeof(name), "pec-%d.%d-phb-%d",
                  pec->chip_id, pec->index, stack->stack_no);
-        memory_region_init(&stack->phbbar, OBJECT(stack), name, size);
-        memory_region_add_subregion(sysmem, bar, &stack->phbbar);
+        memory_region_init(&phb->phbbar, OBJECT(phb), name, size);
+        memory_region_add_subregion(sysmem, bar, &phb->phbbar);
     }
     if (!memory_region_is_mapped(&stack->intbar) &&
         (bar_en & PEC_NEST_STK_BAR_EN_INT)) {
diff --git a/include/hw/pci-host/pnv_phb4.h b/include/hw/pci-host/pnv_phb4.h
index 4487c3a6e2..b11fa80e81 100644
--- a/include/hw/pci-host/pnv_phb4.h
+++ b/include/hw/pci-host/pnv_phb4.h
@@ -112,6 +112,9 @@ struct PnvPHB4 {
     uint64_t pci_regs[PHB4_PEC_PCI_STK_REGS_COUNT];
     MemoryRegion pci_regs_mr;
 
+    /* Memory windows from PowerBus to PHB */
+    MemoryRegion phbbar;
+
     /* On-chip IODA tables */
     uint64_t ioda_LIST[PNV_PHB4_MAX_LSIs];
     uint64_t ioda_MIST[PNV_PHB4_MAX_MIST];
@@ -166,7 +169,6 @@ struct PnvPhb4PecStack {
     /* Memory windows from PowerBus to PHB */
     MemoryRegion mmbar0;
     MemoryRegion mmbar1;
-    MemoryRegion phbbar;
     MemoryRegion intbar;
     uint64_t mmio0_base;
     uint64_t mmio0_size;
-- 
2.33.1


