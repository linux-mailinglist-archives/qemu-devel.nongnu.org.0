Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EF2848DE27
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jan 2022 20:37:10 +0100 (CET)
Received: from localhost ([::1]:36258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n85uH-0003G4-Cj
	for lists+qemu-devel@lfdr.de; Thu, 13 Jan 2022 14:37:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n85nf-0006XZ-GT; Thu, 13 Jan 2022 14:30:21 -0500
Received: from [2607:f8b0:4864:20::235] (port=39644
 helo=mail-oi1-x235.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n85nc-000588-0u; Thu, 13 Jan 2022 14:30:18 -0500
Received: by mail-oi1-x235.google.com with SMTP id e81so9130654oia.6;
 Thu, 13 Jan 2022 11:30:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OHbRK5dFQ3R9Yy3NyPjc4KFqFIMXx6dWxwCQLbYEPLc=;
 b=jz3X9IubgQf6Ook5QxDGOACRg3rwrRpEyafEwlTV12/CFDfu5fQOCKUOSFW13jQjO7
 SWV8e93/uAREsalrGK1pxWAVNkIXNUQihmwuYChTZ5fhUnYyYUWW4KA4u780pnYFYRmM
 NBfVcPXApZqe+jTGkXO8vFjtCMyb4oE3kr52eb9n9rLVOAxUfymNRSv9lcbaYCZezWo5
 UVW13/hwZ/X5xqwOy5w0KNmvo9K+GGl9qWJXgCjlGhyBhdDERdaAbt1AO44CH9eQHgry
 knekpF/Ev7Yw6gJm0nAEGKo0Wa85St+1+heZegWPXVBpXkiJg2+J0MivKWUucZko8445
 QvHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OHbRK5dFQ3R9Yy3NyPjc4KFqFIMXx6dWxwCQLbYEPLc=;
 b=ZIeas7m4FNTqVq9hCE+DaqTq20OvvugwHKvf6Xuicil4u09VNyZ+DhmebxjUXA0wmZ
 IEzTCiTQuypYZSAuCRATL6/qfEb9FGEUTMjkZLKFPG6Q1UZTZd/gPZUDOoV+mOXOoWjp
 odogelPoqKJtMGvaMw9/ZE2Hj942HqXZpAjwIb0KW764OyKi335CBxmO9xJJbEZ7ynvb
 xVpzehKoSsoYm9ZSkJdhTe1Y0zbzpLEO0BCRDz6CMmK554bzC5IWTHxns4hGx3Olas1a
 2DIR7V0SIpiohUNC0sDjqfB5vYXvm19Kmmvl7xNdui5pLVSCjtJBsImUEDpbJ4mib96A
 l8aQ==
X-Gm-Message-State: AOAM532bQ7MpOgd9wrwsDGr78NLM07rb7nkZ+LZzu/hxz9rGhsm8SI6V
 pg+hUihwMiZZ3aawaw8GjiX1DxFaaEXmurw1
X-Google-Smtp-Source: ABdhPJx9Rc4XoPNuORn2n74IcwqNlQhjrmGhHGI2Luw7KPY8xkZ8+eq5FQu7mM3JCSUg+Xh1ITw8wA==
X-Received: by 2002:a54:4f81:: with SMTP id g1mr9731905oiy.172.1642102214638; 
 Thu, 13 Jan 2022 11:30:14 -0800 (PST)
Received: from rekt.COMFAST ([152.249.109.193])
 by smtp.gmail.com with ESMTPSA id 90sm743409otn.59.2022.01.13.11.30.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Jan 2022 11:30:14 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 07/17] ppc/pnv: move nest_regs[] to PnvPHB4
Date: Thu, 13 Jan 2022 16:29:42 -0300
Message-Id: <20220113192952.911188-8-danielhb413@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220113192952.911188-1-danielhb413@gmail.com>
References: <20220113192952.911188-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::235
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::235;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x235.google.com
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

stack->nest_regs[] is used in several XSCOM functions and it's one of
the main culprits of having to deal with stack->phb pointers around the
code.

Sure, we're having to add 2 extra stack->phb pointers to ease
nest_regs[] migration to PnvPHB4. They'll be dealt with shortly.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/pci-host/pnv_phb4.c         | 52 ++++++++++++++++++----------------
 include/hw/pci-host/pnv_phb4.h |  7 +++--
 2 files changed, 31 insertions(+), 28 deletions(-)

diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
index dc4db091e4..916a7a3cf0 100644
--- a/hw/pci-host/pnv_phb4.c
+++ b/hw/pci-host/pnv_phb4.c
@@ -862,10 +862,11 @@ static uint64_t pnv_pec_stk_nest_xscom_read(void *opaque, hwaddr addr,
                                             unsigned size)
 {
     PnvPhb4PecStack *stack = PNV_PHB4_PEC_STACK(opaque);
+    PnvPHB4 *phb = stack->phb;
     uint32_t reg = addr >> 3;
 
     /* TODO: add list of allowed registers and error out if not */
-    return stack->nest_regs[reg];
+    return phb->nest_regs[reg];
 }
 
 static void pnv_phb4_update_regions(PnvPHB4 *phb)
@@ -897,7 +898,7 @@ static void pnv_pec_stk_update_map(PnvPhb4PecStack *stack)
     PnvPhb4PecState *pec = stack->pec;
     PnvPHB4 *phb = stack->phb;
     MemoryRegion *sysmem = get_system_memory();
-    uint64_t bar_en = stack->nest_regs[PEC_NEST_STK_BAR_EN];
+    uint64_t bar_en = phb->nest_regs[PEC_NEST_STK_BAR_EN];
     uint64_t bar, mask, size;
     char name[64];
 
@@ -933,8 +934,8 @@ static void pnv_pec_stk_update_map(PnvPhb4PecStack *stack)
     /* Handle maps */
     if (!memory_region_is_mapped(&phb->mmbar0) &&
         (bar_en & PEC_NEST_STK_BAR_EN_MMIO0)) {
-        bar = stack->nest_regs[PEC_NEST_STK_MMIO_BAR0] >> 8;
-        mask = stack->nest_regs[PEC_NEST_STK_MMIO_BAR0_MASK];
+        bar = phb->nest_regs[PEC_NEST_STK_MMIO_BAR0] >> 8;
+        mask = phb->nest_regs[PEC_NEST_STK_MMIO_BAR0_MASK];
         size = ((~mask) >> 8) + 1;
         snprintf(name, sizeof(name), "pec-%d.%d-phb-%d-mmio0",
                  pec->chip_id, pec->index, stack->stack_no);
@@ -945,8 +946,8 @@ static void pnv_pec_stk_update_map(PnvPhb4PecStack *stack)
     }
     if (!memory_region_is_mapped(&phb->mmbar1) &&
         (bar_en & PEC_NEST_STK_BAR_EN_MMIO1)) {
-        bar = stack->nest_regs[PEC_NEST_STK_MMIO_BAR1] >> 8;
-        mask = stack->nest_regs[PEC_NEST_STK_MMIO_BAR1_MASK];
+        bar = phb->nest_regs[PEC_NEST_STK_MMIO_BAR1] >> 8;
+        mask = phb->nest_regs[PEC_NEST_STK_MMIO_BAR1_MASK];
         size = ((~mask) >> 8) + 1;
         snprintf(name, sizeof(name), "pec-%d.%d-phb-%d-mmio1",
                  pec->chip_id, pec->index, stack->stack_no);
@@ -957,7 +958,7 @@ static void pnv_pec_stk_update_map(PnvPhb4PecStack *stack)
     }
     if (!memory_region_is_mapped(&phb->phbbar) &&
         (bar_en & PEC_NEST_STK_BAR_EN_PHB)) {
-        bar = stack->nest_regs[PEC_NEST_STK_PHB_REGS_BAR] >> 8;
+        bar = phb->nest_regs[PEC_NEST_STK_PHB_REGS_BAR] >> 8;
         size = PNV_PHB4_NUM_REGS << 3;
         snprintf(name, sizeof(name), "pec-%d.%d-phb-%d",
                  pec->chip_id, pec->index, stack->stack_no);
@@ -966,7 +967,7 @@ static void pnv_pec_stk_update_map(PnvPhb4PecStack *stack)
     }
     if (!memory_region_is_mapped(&phb->intbar) &&
         (bar_en & PEC_NEST_STK_BAR_EN_INT)) {
-        bar = stack->nest_regs[PEC_NEST_STK_INT_BAR] >> 8;
+        bar = phb->nest_regs[PEC_NEST_STK_INT_BAR] >> 8;
         size = PNV_PHB4_MAX_INTs << 16;
         snprintf(name, sizeof(name), "pec-%d.%d-phb-%d-int",
                  stack->pec->chip_id, stack->pec->index, stack->stack_no);
@@ -982,34 +983,35 @@ static void pnv_pec_stk_nest_xscom_write(void *opaque, hwaddr addr,
                                          uint64_t val, unsigned size)
 {
     PnvPhb4PecStack *stack = PNV_PHB4_PEC_STACK(opaque);
+    PnvPHB4 *phb = stack->phb;
     PnvPhb4PecState *pec = stack->pec;
     uint32_t reg = addr >> 3;
 
     switch (reg) {
     case PEC_NEST_STK_PCI_NEST_FIR:
-        stack->nest_regs[PEC_NEST_STK_PCI_NEST_FIR] = val;
+        phb->nest_regs[PEC_NEST_STK_PCI_NEST_FIR] = val;
         break;
     case PEC_NEST_STK_PCI_NEST_FIR_CLR:
-        stack->nest_regs[PEC_NEST_STK_PCI_NEST_FIR] &= val;
+        phb->nest_regs[PEC_NEST_STK_PCI_NEST_FIR] &= val;
         break;
     case PEC_NEST_STK_PCI_NEST_FIR_SET:
-        stack->nest_regs[PEC_NEST_STK_PCI_NEST_FIR] |= val;
+        phb->nest_regs[PEC_NEST_STK_PCI_NEST_FIR] |= val;
         break;
     case PEC_NEST_STK_PCI_NEST_FIR_MSK:
-        stack->nest_regs[PEC_NEST_STK_PCI_NEST_FIR_MSK] = val;
+        phb->nest_regs[PEC_NEST_STK_PCI_NEST_FIR_MSK] = val;
         break;
     case PEC_NEST_STK_PCI_NEST_FIR_MSKC:
-        stack->nest_regs[PEC_NEST_STK_PCI_NEST_FIR_MSK] &= val;
+        phb->nest_regs[PEC_NEST_STK_PCI_NEST_FIR_MSK] &= val;
         break;
     case PEC_NEST_STK_PCI_NEST_FIR_MSKS:
-        stack->nest_regs[PEC_NEST_STK_PCI_NEST_FIR_MSK] |= val;
+        phb->nest_regs[PEC_NEST_STK_PCI_NEST_FIR_MSK] |= val;
         break;
     case PEC_NEST_STK_PCI_NEST_FIR_ACT0:
     case PEC_NEST_STK_PCI_NEST_FIR_ACT1:
-        stack->nest_regs[reg] = val;
+        phb->nest_regs[reg] = val;
         break;
     case PEC_NEST_STK_PCI_NEST_FIR_WOF:
-        stack->nest_regs[reg] = 0;
+        phb->nest_regs[reg] = 0;
         break;
     case PEC_NEST_STK_ERR_REPORT_0:
     case PEC_NEST_STK_ERR_REPORT_1:
@@ -1017,39 +1019,39 @@ static void pnv_pec_stk_nest_xscom_write(void *opaque, hwaddr addr,
         /* Flag error ? */
         break;
     case PEC_NEST_STK_PBCQ_MODE:
-        stack->nest_regs[reg] = val & 0xff00000000000000ull;
+        phb->nest_regs[reg] = val & 0xff00000000000000ull;
         break;
     case PEC_NEST_STK_MMIO_BAR0:
     case PEC_NEST_STK_MMIO_BAR0_MASK:
     case PEC_NEST_STK_MMIO_BAR1:
     case PEC_NEST_STK_MMIO_BAR1_MASK:
-        if (stack->nest_regs[PEC_NEST_STK_BAR_EN] &
+        if (phb->nest_regs[PEC_NEST_STK_BAR_EN] &
             (PEC_NEST_STK_BAR_EN_MMIO0 |
              PEC_NEST_STK_BAR_EN_MMIO1)) {
             phb_pec_error(pec, "Changing enabled BAR unsupported\n");
         }
-        stack->nest_regs[reg] = val & 0xffffffffff000000ull;
+        phb->nest_regs[reg] = val & 0xffffffffff000000ull;
         break;
     case PEC_NEST_STK_PHB_REGS_BAR:
-        if (stack->nest_regs[PEC_NEST_STK_BAR_EN] & PEC_NEST_STK_BAR_EN_PHB) {
+        if (phb->nest_regs[PEC_NEST_STK_BAR_EN] & PEC_NEST_STK_BAR_EN_PHB) {
             phb_pec_error(pec, "Changing enabled BAR unsupported\n");
         }
-        stack->nest_regs[reg] = val & 0xffffffffffc00000ull;
+        phb->nest_regs[reg] = val & 0xffffffffffc00000ull;
         break;
     case PEC_NEST_STK_INT_BAR:
-        if (stack->nest_regs[PEC_NEST_STK_BAR_EN] & PEC_NEST_STK_BAR_EN_INT) {
+        if (phb->nest_regs[PEC_NEST_STK_BAR_EN] & PEC_NEST_STK_BAR_EN_INT) {
             phb_pec_error(pec, "Changing enabled BAR unsupported\n");
         }
-        stack->nest_regs[reg] = val & 0xfffffff000000000ull;
+        phb->nest_regs[reg] = val & 0xfffffff000000000ull;
         break;
     case PEC_NEST_STK_BAR_EN:
-        stack->nest_regs[reg] = val & 0xf000000000000000ull;
+        phb->nest_regs[reg] = val & 0xf000000000000000ull;
         pnv_pec_stk_update_map(stack);
         break;
     case PEC_NEST_STK_DATA_FRZ_TYPE:
     case PEC_NEST_STK_PBCQ_TUN_BAR:
         /* Not used for now */
-        stack->nest_regs[reg] = val;
+        phb->nest_regs[reg] = val;
         break;
     default:
         qemu_log_mask(LOG_UNIMP, "phb4_pec: nest_xscom_write 0x%"HWADDR_PRIx
diff --git a/include/hw/pci-host/pnv_phb4.h b/include/hw/pci-host/pnv_phb4.h
index 4a8f510f6d..a7e08772c1 100644
--- a/include/hw/pci-host/pnv_phb4.h
+++ b/include/hw/pci-host/pnv_phb4.h
@@ -112,6 +112,10 @@ struct PnvPHB4 {
     uint64_t pci_regs[PHB4_PEC_PCI_STK_REGS_COUNT];
     MemoryRegion pci_regs_mr;
 
+    /* Nest registers */
+#define PHB4_PEC_NEST_STK_REGS_COUNT  0x17
+    uint64_t nest_regs[PHB4_PEC_NEST_STK_REGS_COUNT];
+
     /* Memory windows from PowerBus to PHB */
     MemoryRegion phbbar;
     MemoryRegion intbar;
@@ -165,9 +169,6 @@ struct PnvPhb4PecStack {
     /* My own stack number */
     uint32_t stack_no;
 
-    /* Nest registers */
-#define PHB4_PEC_NEST_STK_REGS_COUNT  0x17
-    uint64_t nest_regs[PHB4_PEC_NEST_STK_REGS_COUNT];
     MemoryRegion nest_regs_mr;
 
     /* PHB pass-through XSCOM */
-- 
2.33.1


