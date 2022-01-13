Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A66248DE2C
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jan 2022 20:40:01 +0100 (CET)
Received: from localhost ([::1]:43128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n85x2-0000Es-3j
	for lists+qemu-devel@lfdr.de; Thu, 13 Jan 2022 14:40:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n85nZ-0006QW-Dq; Thu, 13 Jan 2022 14:30:13 -0500
Received: from [2607:f8b0:4864:20::22c] (port=43902
 helo=mail-oi1-x22c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n85nT-00056X-2N; Thu, 13 Jan 2022 14:30:09 -0500
Received: by mail-oi1-x22c.google.com with SMTP id s22so9120798oie.10;
 Thu, 13 Jan 2022 11:30:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=X6adjTzCeL/KTbF2SV7d/FZdaLhzdscVTQyETcayL7Y=;
 b=d5EQgErs90eG3lwKV4y462pDElpFHIMzXc9pUfZww0YJS1lxTJPsOjzdp08bqEyXPv
 Rz5vSo1YRBYQT3pQAM6CWSjTk9a1Nvv8X8ZRB1b38XWfEFTlUGWyzR2qk/vF0dOURQX7
 DCqLnyFWETkO7cUCrQY60/Jm6EgGfHhPLp1QF922ZDaEi7CmVDTTJED0E+zsPSyfmt5W
 4OU/UwBvrzvNjXl15bmXeH9SeXX0rnrNg5cWh51F62fuizZF7zuAjcsm8cCTwlB3V22q
 paAYSkVjN9RajUEItuZOfSmqJAXf89xTN7VcYMgRnEqE+EGuv/4DiiFbFqEyZv0w9gmw
 T4QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=X6adjTzCeL/KTbF2SV7d/FZdaLhzdscVTQyETcayL7Y=;
 b=oKv7Ffi7F0uXayHNb93kmjKgI30HnDloOMoljYaqm4HvMr03Hnsak8Frfd04YwJjvZ
 69mpHXihb1hZwEFJFCMYE58OtR8P8RFJVYhyWVZnf0H1X2H9qfM0FyVDYKRCgzfcDuyi
 86Yyz3RnMT3juxEAv0qZFU9Nk1ZhSTvUbveSqYJOIvB8U/1bMn3BUni5wTzTrUoU7BVu
 yDF2HkGeFY9iMYab50Ma7uwoKwwOt2NERHBHx2Cp2bvD4DrCWHUTIxv0f5c7EwZRLI1C
 CJYtyIx/iiAaR+F2dYzAAZHnMtdoAB5kA/MPFhOTticaSvpNgVSbee7njd060G2QskyJ
 Xh+g==
X-Gm-Message-State: AOAM5311Rr9aVcax+ZWQDixtTSUKv7G8eoAu8IuPu9Tu1RcuRsef4VCx
 uWtsbf/54HfURLRbtJ9W2ClAjhRCUz/V/Eq2
X-Google-Smtp-Source: ABdhPJyInMm4yL4CQ0mc8vwldAwvUITEOkMSi5tyTmpXlK7dRe9y8VTquGyP7z6PVzuZ1htnElsloQ==
X-Received: by 2002:aca:90a:: with SMTP id 10mr4476557oij.151.1642102205473;
 Thu, 13 Jan 2022 11:30:05 -0800 (PST)
Received: from rekt.COMFAST ([152.249.109.193])
 by smtp.gmail.com with ESMTPSA id 90sm743409otn.59.2022.01.13.11.30.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Jan 2022 11:30:05 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 02/17] ppc/pnv: move PCI registers to PnvPHB4
Date: Thu, 13 Jan 2022 16:29:37 -0300
Message-Id: <20220113192952.911188-3-danielhb413@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220113192952.911188-1-danielhb413@gmail.com>
References: <20220113192952.911188-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::22c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::22c;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x22c.google.com
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

Previous patch changed pnv_pec_stk_pci_xscom_read() and
pnv_pec_stk_pci_xscom_write() to use a PnvPHB4 opaque, making it easier
to move both pci_regs[] and the pci_regs_mr MemoryRegion to the PnvHB4
object.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/pci-host/pnv_phb4.c         | 30 +++++++++++++++---------------
 include/hw/pci-host/pnv_phb4.h | 10 +++++-----
 2 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
index e010572376..fd9f6af4b3 100644
--- a/hw/pci-host/pnv_phb4.c
+++ b/hw/pci-host/pnv_phb4.c
@@ -1071,54 +1071,54 @@ static const MemoryRegionOps pnv_pec_stk_nest_xscom_ops = {
 static uint64_t pnv_pec_stk_pci_xscom_read(void *opaque, hwaddr addr,
                                            unsigned size)
 {
-    PnvPhb4PecStack *stack = PNV_PHB4(opaque)->stack;
+    PnvPHB4 *phb = PNV_PHB4(opaque);
     uint32_t reg = addr >> 3;
 
     /* TODO: add list of allowed registers and error out if not */
-    return stack->pci_regs[reg];
+    return phb->pci_regs[reg];
 }
 
 static void pnv_pec_stk_pci_xscom_write(void *opaque, hwaddr addr,
                                         uint64_t val, unsigned size)
 {
-    PnvPhb4PecStack *stack = PNV_PHB4(opaque)->stack;
+    PnvPHB4 *phb = PNV_PHB4(opaque);
     uint32_t reg = addr >> 3;
 
     switch (reg) {
     case PEC_PCI_STK_PCI_FIR:
-        stack->pci_regs[reg] = val;
+        phb->pci_regs[reg] = val;
         break;
     case PEC_PCI_STK_PCI_FIR_CLR:
-        stack->pci_regs[PEC_PCI_STK_PCI_FIR] &= val;
+        phb->pci_regs[PEC_PCI_STK_PCI_FIR] &= val;
         break;
     case PEC_PCI_STK_PCI_FIR_SET:
-        stack->pci_regs[PEC_PCI_STK_PCI_FIR] |= val;
+        phb->pci_regs[PEC_PCI_STK_PCI_FIR] |= val;
         break;
     case PEC_PCI_STK_PCI_FIR_MSK:
-        stack->pci_regs[reg] = val;
+        phb->pci_regs[reg] = val;
         break;
     case PEC_PCI_STK_PCI_FIR_MSKC:
-        stack->pci_regs[PEC_PCI_STK_PCI_FIR_MSK] &= val;
+        phb->pci_regs[PEC_PCI_STK_PCI_FIR_MSK] &= val;
         break;
     case PEC_PCI_STK_PCI_FIR_MSKS:
-        stack->pci_regs[PEC_PCI_STK_PCI_FIR_MSK] |= val;
+        phb->pci_regs[PEC_PCI_STK_PCI_FIR_MSK] |= val;
         break;
     case PEC_PCI_STK_PCI_FIR_ACT0:
     case PEC_PCI_STK_PCI_FIR_ACT1:
-        stack->pci_regs[reg] = val;
+        phb->pci_regs[reg] = val;
         break;
     case PEC_PCI_STK_PCI_FIR_WOF:
-        stack->pci_regs[reg] = 0;
+        phb->pci_regs[reg] = 0;
         break;
     case PEC_PCI_STK_ETU_RESET:
-        stack->pci_regs[reg] = val & 0x8000000000000000ull;
+        phb->pci_regs[reg] = val & 0x8000000000000000ull;
         /* TODO: Implement reset */
         break;
     case PEC_PCI_STK_PBAIB_ERR_REPORT:
         break;
     case PEC_PCI_STK_PBAIB_TX_CMD_CRED:
     case PEC_PCI_STK_PBAIB_TX_DAT_CRED:
-        stack->pci_regs[reg] = val;
+        phb->pci_regs[reg] = val;
         break;
     default:
         qemu_log_mask(LOG_UNIMP, "phb4_pec_stk: pci_xscom_write 0x%"HWADDR_PRIx
@@ -1477,7 +1477,7 @@ static void pnv_phb4_xscom_realize(PnvPHB4 *phb)
 
     snprintf(name, sizeof(name), "xscom-pec-%d.%d-pci-phb-%d",
              pec->chip_id, pec->index, stack->stack_no);
-    pnv_xscom_region_init(&stack->pci_regs_mr, OBJECT(phb),
+    pnv_xscom_region_init(&phb->pci_regs_mr, OBJECT(phb),
                           &pnv_pec_stk_pci_xscom_ops, phb, name,
                           PHB4_PEC_PCI_STK_REGS_COUNT);
 
@@ -1496,7 +1496,7 @@ static void pnv_phb4_xscom_realize(PnvPHB4 *phb)
                             &stack->nest_regs_mr);
     pnv_xscom_add_subregion(pec->chip,
                             pec_pci_base + 0x40 * (stack->stack_no + 1),
-                            &stack->pci_regs_mr);
+                            &phb->pci_regs_mr);
     pnv_xscom_add_subregion(pec->chip,
                             pec_pci_base + PNV9_XSCOM_PEC_PCI_STK0 +
                             0x40 * stack->stack_no,
diff --git a/include/hw/pci-host/pnv_phb4.h b/include/hw/pci-host/pnv_phb4.h
index 4b7ce8a723..4487c3a6e2 100644
--- a/include/hw/pci-host/pnv_phb4.h
+++ b/include/hw/pci-host/pnv_phb4.h
@@ -107,6 +107,11 @@ struct PnvPHB4 {
     MemoryRegion pci_mmio;
     MemoryRegion pci_io;
 
+    /* PCI registers (excluding pass-through) */
+#define PHB4_PEC_PCI_STK_REGS_COUNT  0xf
+    uint64_t pci_regs[PHB4_PEC_PCI_STK_REGS_COUNT];
+    MemoryRegion pci_regs_mr;
+
     /* On-chip IODA tables */
     uint64_t ioda_LIST[PNV_PHB4_MAX_LSIs];
     uint64_t ioda_MIST[PNV_PHB4_MAX_MIST];
@@ -155,11 +160,6 @@ struct PnvPhb4PecStack {
     uint64_t nest_regs[PHB4_PEC_NEST_STK_REGS_COUNT];
     MemoryRegion nest_regs_mr;
 
-    /* PCI registers (excluding pass-through) */
-#define PHB4_PEC_PCI_STK_REGS_COUNT  0xf
-    uint64_t pci_regs[PHB4_PEC_PCI_STK_REGS_COUNT];
-    MemoryRegion pci_regs_mr;
-
     /* PHB pass-through XSCOM */
     MemoryRegion phb_regs_mr;
 
-- 
2.33.1


