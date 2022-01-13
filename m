Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B13A648DE39
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jan 2022 20:43:50 +0100 (CET)
Received: from localhost ([::1]:49432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n860j-0004Zj-KQ
	for lists+qemu-devel@lfdr.de; Thu, 13 Jan 2022 14:43:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n85nd-0006VJ-01; Thu, 13 Jan 2022 14:30:17 -0500
Received: from [2607:f8b0:4864:20::331] (port=33468
 helo=mail-ot1-x331.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n85na-00057r-VT; Thu, 13 Jan 2022 14:30:16 -0500
Received: by mail-ot1-x331.google.com with SMTP id
 35-20020a9d08a6000000b00579cd5e605eso7542887otf.0; 
 Thu, 13 Jan 2022 11:30:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/BtYWFvmad4GLEqJvo7bvpC6LUkT5vGSdsv4AVZVYnc=;
 b=dt+mKHmoHszsf6pNK2+nEVMS0csV23L+kTFoY63kbNavfKId5dYuv9lQVMLoRSMuu8
 clF3lrMgqW3xVr+olOThV9xrpHspB4O9u/CMeAfsvk7/KtnJaf+HKdY1004dD1TVl70J
 D4Kz05LL4jjAl4DTuDN00Wzu2m5zoQlY7KPhXcm5W6nC8WFhECKKDbIRtG9vE0QKYxuM
 nwtAJAUKYxYANS8hjgPe2Nx6JQZhv7mkEGzOkNwZobY8YiM03oDPamcAWhRM36EvQHHf
 /WbhGnzG63795tLAQl+fnldvhwHfW/qUUHX9J8FEzSNtI8xVDLK6vjQfEg4+2S1d0uS6
 U31A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/BtYWFvmad4GLEqJvo7bvpC6LUkT5vGSdsv4AVZVYnc=;
 b=tVJ/A3r5DoFBklQOC6mYRNzRQao+vWA4exLDVM5rKFzWv3EzAEN4tIlDmKZxxDx1iK
 EmVcWFTabywSGlqLtWYx45RrB9fl9PR/GvE4A4WW+RyM5S8N/WZnoEwxJ9nWD9WKHuSZ
 UMoHyBPbaTJ7ezO7S6zB5ScrO/yJOP7YXiDbbIHzJS/2jFMINeal+9wm6CFYXa6MVLDw
 Yiwz99ckd8xksFDQDZAj2PxKk1fWFYU0LG+j+/7/azHBALs9yOgZvXdhXaEWbhOcx2DE
 vBSG+QbY5d4WDdO7w5Nx2YGyfz0s+bU7vE3s39fY6PcxoJNOCQwqxER1Zu+W6jHEEZ3z
 ATWQ==
X-Gm-Message-State: AOAM530Q2C99x5eLeHBhHKsmPWk4RwNwOTM774LdzbA7itr5TJf9MIkK
 uYckag+TOVvkYAKLkAMlC9/zOrn5d7qQ1WIw
X-Google-Smtp-Source: ABdhPJxsl+PNnB7XinPDXxCXxA2aeVgbD0x3xMqKu13Jc4cq4GFk9cUh4y2WQx+sBHa6/MQjRthKFA==
X-Received: by 2002:a9d:6452:: with SMTP id m18mr4170203otl.99.1642102212863; 
 Thu, 13 Jan 2022 11:30:12 -0800 (PST)
Received: from rekt.COMFAST ([152.249.109.193])
 by smtp.gmail.com with ESMTPSA id 90sm743409otn.59.2022.01.13.11.30.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Jan 2022 11:30:12 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 06/17] ppc/pnv: move mmbar0/mmbar1 and friends to PnvPHB4
Date: Thu, 13 Jan 2022 16:29:41 -0300
Message-Id: <20220113192952.911188-7-danielhb413@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220113192952.911188-1-danielhb413@gmail.com>
References: <20220113192952.911188-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::331
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::331;
 envelope-from=danielhb413@gmail.com; helo=mail-ot1-x331.google.com
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

These 2 MemoryRegions, together with mmio(0|1)_base and mmio(0|1)_size
variables, are used together in the same functions. We're better of
moving them all in a single step.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/pci-host/pnv_phb4.c         | 52 +++++++++++++++++-----------------
 include/hw/pci-host/pnv_phb4.h | 14 ++++-----
 2 files changed, 32 insertions(+), 34 deletions(-)

diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
index 034721f159..dc4db091e4 100644
--- a/hw/pci-host/pnv_phb4.c
+++ b/hw/pci-host/pnv_phb4.c
@@ -228,16 +228,16 @@ static void pnv_phb4_check_mbt(PnvPHB4 *phb, uint32_t index)
     /* TODO: Figure out how to implemet/decode AOMASK */
 
     /* Check if it matches an enabled MMIO region in the PEC stack */
-    if (memory_region_is_mapped(&phb->stack->mmbar0) &&
-        base >= phb->stack->mmio0_base &&
-        (base + size) <= (phb->stack->mmio0_base + phb->stack->mmio0_size)) {
-        parent = &phb->stack->mmbar0;
-        base -= phb->stack->mmio0_base;
-    } else if (memory_region_is_mapped(&phb->stack->mmbar1) &&
-        base >= phb->stack->mmio1_base &&
-        (base + size) <= (phb->stack->mmio1_base + phb->stack->mmio1_size)) {
-        parent = &phb->stack->mmbar1;
-        base -= phb->stack->mmio1_base;
+    if (memory_region_is_mapped(&phb->mmbar0) &&
+        base >= phb->mmio0_base &&
+        (base + size) <= (phb->mmio0_base + phb->mmio0_size)) {
+        parent = &phb->mmbar0;
+        base -= phb->mmio0_base;
+    } else if (memory_region_is_mapped(&phb->mmbar1) &&
+        base >= phb->mmio1_base &&
+        (base + size) <= (phb->mmio1_base + phb->mmio1_size)) {
+        parent = &phb->mmbar1;
+        base -= phb->mmio1_base;
     } else {
         phb_error(phb, "PHB MBAR %d out of parent bounds", index);
         return;
@@ -910,13 +910,13 @@ static void pnv_pec_stk_update_map(PnvPhb4PecStack *stack)
      */
 
     /* Handle unmaps */
-    if (memory_region_is_mapped(&stack->mmbar0) &&
+    if (memory_region_is_mapped(&phb->mmbar0) &&
         !(bar_en & PEC_NEST_STK_BAR_EN_MMIO0)) {
-        memory_region_del_subregion(sysmem, &stack->mmbar0);
+        memory_region_del_subregion(sysmem, &phb->mmbar0);
     }
-    if (memory_region_is_mapped(&stack->mmbar1) &&
+    if (memory_region_is_mapped(&phb->mmbar1) &&
         !(bar_en & PEC_NEST_STK_BAR_EN_MMIO1)) {
-        memory_region_del_subregion(sysmem, &stack->mmbar1);
+        memory_region_del_subregion(sysmem, &phb->mmbar1);
     }
     if (memory_region_is_mapped(&phb->phbbar) &&
         !(bar_en & PEC_NEST_STK_BAR_EN_PHB)) {
@@ -931,29 +931,29 @@ static void pnv_pec_stk_update_map(PnvPhb4PecStack *stack)
     pnv_phb4_update_regions(phb);
 
     /* Handle maps */
-    if (!memory_region_is_mapped(&stack->mmbar0) &&
+    if (!memory_region_is_mapped(&phb->mmbar0) &&
         (bar_en & PEC_NEST_STK_BAR_EN_MMIO0)) {
         bar = stack->nest_regs[PEC_NEST_STK_MMIO_BAR0] >> 8;
         mask = stack->nest_regs[PEC_NEST_STK_MMIO_BAR0_MASK];
         size = ((~mask) >> 8) + 1;
-        snprintf(name, sizeof(name), "pec-%d.%d-stack-%d-mmio0",
+        snprintf(name, sizeof(name), "pec-%d.%d-phb-%d-mmio0",
                  pec->chip_id, pec->index, stack->stack_no);
-        memory_region_init(&stack->mmbar0, OBJECT(stack), name, size);
-        memory_region_add_subregion(sysmem, bar, &stack->mmbar0);
-        stack->mmio0_base = bar;
-        stack->mmio0_size = size;
+        memory_region_init(&phb->mmbar0, OBJECT(phb), name, size);
+        memory_region_add_subregion(sysmem, bar, &phb->mmbar0);
+        phb->mmio0_base = bar;
+        phb->mmio0_size = size;
     }
-    if (!memory_region_is_mapped(&stack->mmbar1) &&
+    if (!memory_region_is_mapped(&phb->mmbar1) &&
         (bar_en & PEC_NEST_STK_BAR_EN_MMIO1)) {
         bar = stack->nest_regs[PEC_NEST_STK_MMIO_BAR1] >> 8;
         mask = stack->nest_regs[PEC_NEST_STK_MMIO_BAR1_MASK];
         size = ((~mask) >> 8) + 1;
-        snprintf(name, sizeof(name), "pec-%d.%d-stack-%d-mmio1",
+        snprintf(name, sizeof(name), "pec-%d.%d-phb-%d-mmio1",
                  pec->chip_id, pec->index, stack->stack_no);
-        memory_region_init(&stack->mmbar1, OBJECT(stack), name, size);
-        memory_region_add_subregion(sysmem, bar, &stack->mmbar1);
-        stack->mmio1_base = bar;
-        stack->mmio1_size = size;
+        memory_region_init(&phb->mmbar1, OBJECT(phb), name, size);
+        memory_region_add_subregion(sysmem, bar, &phb->mmbar1);
+        phb->mmio1_base = bar;
+        phb->mmio1_size = size;
     }
     if (!memory_region_is_mapped(&phb->phbbar) &&
         (bar_en & PEC_NEST_STK_BAR_EN_PHB)) {
diff --git a/include/hw/pci-host/pnv_phb4.h b/include/hw/pci-host/pnv_phb4.h
index cf5dd4009c..4a8f510f6d 100644
--- a/include/hw/pci-host/pnv_phb4.h
+++ b/include/hw/pci-host/pnv_phb4.h
@@ -115,6 +115,12 @@ struct PnvPHB4 {
     /* Memory windows from PowerBus to PHB */
     MemoryRegion phbbar;
     MemoryRegion intbar;
+    MemoryRegion mmbar0;
+    MemoryRegion mmbar1;
+    uint64_t mmio0_base;
+    uint64_t mmio0_size;
+    uint64_t mmio1_base;
+    uint64_t mmio1_size;
 
     /* On-chip IODA tables */
     uint64_t ioda_LIST[PNV_PHB4_MAX_LSIs];
@@ -167,14 +173,6 @@ struct PnvPhb4PecStack {
     /* PHB pass-through XSCOM */
     MemoryRegion phb_regs_mr;
 
-    /* Memory windows from PowerBus to PHB */
-    MemoryRegion mmbar0;
-    MemoryRegion mmbar1;
-    uint64_t mmio0_base;
-    uint64_t mmio0_size;
-    uint64_t mmio1_base;
-    uint64_t mmio1_size;
-
     /* The owner PEC */
     PnvPhb4PecState *pec;
 
-- 
2.33.1


