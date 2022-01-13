Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 718F648DE30
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jan 2022 20:41:57 +0100 (CET)
Received: from localhost ([::1]:44980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n85yu-0001VY-Hm
	for lists+qemu-devel@lfdr.de; Thu, 13 Jan 2022 14:41:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n85nh-0006Y0-O5; Thu, 13 Jan 2022 14:30:26 -0500
Received: from [2607:f8b0:4864:20::233] (port=33489
 helo=mail-oi1-x233.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n85nf-00059U-F9; Thu, 13 Jan 2022 14:30:21 -0500
Received: by mail-oi1-x233.google.com with SMTP id x193so9213001oix.0;
 Thu, 13 Jan 2022 11:30:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TABzkpPfD6wgjRoo2MZq+OeqUkvC/rhX1uRTp4QU0hI=;
 b=C/eXfGxiqh3kF/exv78rjEAZfUAXgum4aSU7vk8aA4+XjhaNGdiWyHNw67Lm7fftip
 MIW7lLPMoKvMR3UAX+QSYtp7ZBcLHMdA12H5BAerpD3JpJhRIfiQa/cFwuy8LT5j63kc
 PbxVVN2+/W3s+Z9KmsFr3wGI7+wGXeIko31Uy6rbR8x8LDm8e5FR6fZZSYhm2mquIhj3
 V0uN15l6syzapgWFFOzkW1cepIr1AECOTtoaYxNG+w7BLNsdb9I8G9Wri+dy86aGmjmx
 4+YGQj2pR5ZSKwf6YHz14rpmRHzUKCOfCLsYAuT2IAniniA1j9M5QnhuXblra2PDUZRg
 Eaiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TABzkpPfD6wgjRoo2MZq+OeqUkvC/rhX1uRTp4QU0hI=;
 b=2Kgc3lulPQB8iXt4ybT8ToagLS6Qlwi26vvibOoOo0sX/+lIAizAUv3PePViFIZdw6
 74pkTLDZ1TTJJd9Mowp4su4VsK/kBRSOWzoX47yia4RELS3WjOdwYGcS6afwsksIpgnM
 dyjkqZfw8AzrGAim1J8jUPDe/95KZmLx7Aw6RyeIZI3CsHWL6XKDcbaYILLD1n+8Z8Je
 nyYNUyiJlRS7Xmb+Ma+EbD5FBBeccXpaVMfloSSfJ41JK65A4mTGD2J5cr8S0kifcw7L
 ymYuWiDWeF8wfQ4GRuhcky9+E7Ul1R3bthal6fpV09aT0z3XQr7SDJgbYyeS09Y01E7I
 y1EQ==
X-Gm-Message-State: AOAM533lU+/vzF0jnCd9pe1ICGmK6FK8WS86Swdv9UklX1bfK9qeK0su
 GdKg7zDOGYnK5MuDQmsW/s1PeOkl0Rv97E5N
X-Google-Smtp-Source: ABdhPJwCp49GrCDy1ZfKpaJrg0D6pr5RZNiMy39QE7QcOQ/OjDXx4TnrfiTFRa0d/U+BJprP5s3C2w==
X-Received: by 2002:a05:6808:228e:: with SMTP id
 bo14mr2454348oib.125.1642102218139; 
 Thu, 13 Jan 2022 11:30:18 -0800 (PST)
Received: from rekt.COMFAST ([152.249.109.193])
 by smtp.gmail.com with ESMTPSA id 90sm743409otn.59.2022.01.13.11.30.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Jan 2022 11:30:17 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 09/17] ppc/pnv: move nest_regs_mr to PnvPHB4
Date: Thu, 13 Jan 2022 16:29:44 -0300
Message-Id: <20220113192952.911188-10-danielhb413@gmail.com>
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

We're now able to cleanly move nest_regs_mr to the PnvPHB4 device.

One thing of notice here is the need to use a phb->stack->pec pointer
because pnv_pec_stk_nest_xscom_write requires a PEC object. Another
thing that can be noticed in the use of 'stack->stack_no' that still
remains throughout the XSCOM code.

After moving all MemoryRegions to the PnvPHB4 object, this illustrates
what is the remaining role of the stack: provide a PEC pointer and the
'stack_no' information. If we can provide these in the PnvPHB4 object
instead (spoiler: we can, and we will), the PnvPhb4PecStack device will
be deprecated and can be removed.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/pci-host/pnv_phb4.c         | 16 +++++++---------
 include/hw/pci-host/pnv_phb4.h |  3 +--
 2 files changed, 8 insertions(+), 11 deletions(-)

diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
index 0f4464ec67..37bab10fcb 100644
--- a/hw/pci-host/pnv_phb4.c
+++ b/hw/pci-host/pnv_phb4.c
@@ -861,8 +861,7 @@ const MemoryRegionOps pnv_phb4_xscom_ops = {
 static uint64_t pnv_pec_stk_nest_xscom_read(void *opaque, hwaddr addr,
                                             unsigned size)
 {
-    PnvPhb4PecStack *stack = PNV_PHB4_PEC_STACK(opaque);
-    PnvPHB4 *phb = stack->phb;
+    PnvPHB4 *phb = PNV_PHB4(opaque);
     uint32_t reg = addr >> 3;
 
     /* TODO: add list of allowed registers and error out if not */
@@ -982,9 +981,8 @@ static void pnv_pec_stk_update_map(PnvPHB4 *phb)
 static void pnv_pec_stk_nest_xscom_write(void *opaque, hwaddr addr,
                                          uint64_t val, unsigned size)
 {
-    PnvPhb4PecStack *stack = PNV_PHB4_PEC_STACK(opaque);
-    PnvPHB4 *phb = stack->phb;
-    PnvPhb4PecState *pec = stack->pec;
+    PnvPHB4 *phb = PNV_PHB4(opaque);
+    PnvPhb4PecState *pec = phb->stack->pec;
     uint32_t reg = addr >> 3;
 
     switch (reg) {
@@ -1470,10 +1468,10 @@ static void pnv_phb4_xscom_realize(PnvPHB4 *phb)
     assert(pec);
 
     /* Initialize the XSCOM regions for the stack registers */
-    snprintf(name, sizeof(name), "xscom-pec-%d.%d-nest-stack-%d",
+    snprintf(name, sizeof(name), "xscom-pec-%d.%d-nest-phb-%d",
              pec->chip_id, pec->index, stack->stack_no);
-    pnv_xscom_region_init(&stack->nest_regs_mr, OBJECT(stack),
-                          &pnv_pec_stk_nest_xscom_ops, stack, name,
+    pnv_xscom_region_init(&phb->nest_regs_mr, OBJECT(phb),
+                          &pnv_pec_stk_nest_xscom_ops, phb, name,
                           PHB4_PEC_NEST_STK_REGS_COUNT);
 
     snprintf(name, sizeof(name), "xscom-pec-%d.%d-pci-phb-%d",
@@ -1494,7 +1492,7 @@ static void pnv_phb4_xscom_realize(PnvPHB4 *phb)
     /* Populate the XSCOM address space. */
     pnv_xscom_add_subregion(pec->chip,
                             pec_nest_base + 0x40 * (stack->stack_no + 1),
-                            &stack->nest_regs_mr);
+                            &phb->nest_regs_mr);
     pnv_xscom_add_subregion(pec->chip,
                             pec_pci_base + 0x40 * (stack->stack_no + 1),
                             &phb->pci_regs_mr);
diff --git a/include/hw/pci-host/pnv_phb4.h b/include/hw/pci-host/pnv_phb4.h
index a7e08772c1..1d53dda0ed 100644
--- a/include/hw/pci-host/pnv_phb4.h
+++ b/include/hw/pci-host/pnv_phb4.h
@@ -115,6 +115,7 @@ struct PnvPHB4 {
     /* Nest registers */
 #define PHB4_PEC_NEST_STK_REGS_COUNT  0x17
     uint64_t nest_regs[PHB4_PEC_NEST_STK_REGS_COUNT];
+    MemoryRegion nest_regs_mr;
 
     /* Memory windows from PowerBus to PHB */
     MemoryRegion phbbar;
@@ -169,8 +170,6 @@ struct PnvPhb4PecStack {
     /* My own stack number */
     uint32_t stack_no;
 
-    MemoryRegion nest_regs_mr;
-
     /* PHB pass-through XSCOM */
     MemoryRegion phb_regs_mr;
 
-- 
2.33.1


