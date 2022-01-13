Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AAE8348DE26
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jan 2022 20:36:41 +0100 (CET)
Received: from localhost ([::1]:34322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n85to-0001kq-EX
	for lists+qemu-devel@lfdr.de; Thu, 13 Jan 2022 14:36:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n85nT-0006L9-4t; Thu, 13 Jan 2022 14:30:07 -0500
Received: from [2607:f8b0:4864:20::32e] (port=46965
 helo=mail-ot1-x32e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n85nR-00056B-J3; Thu, 13 Jan 2022 14:30:06 -0500
Received: by mail-ot1-x32e.google.com with SMTP id
 t4-20020a05683022e400b00591aaf48277so7452430otc.13; 
 Thu, 13 Jan 2022 11:30:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=l9m0Tb8L2HEBgik8BroPRFgLlm9sHPZ7TL3ru+7brHI=;
 b=d7t8UNXGqNKvbRV7lFi6rN5E5Uzcd0Gh3JLSGLqJetn7UF3+iTTt29hZQKafUamcpg
 2UFfw2e6CQTl/9kxRCjK7EdCaNN/WBNfYC4HU2YkMAZJ+KT7t2nc+gSy7jkPamxFB9ZW
 mrOtnD/Sbo4kqV0MihCmw/iuwYkWNQmer42vYcs+bBfAHKdZ6FBWFXPZfdMWs3jjLTZv
 oYdN0dLOm/8QTLZcXcX8tVT0pPwHLgp3+oEdU8j43k8nAcBHHxN1UoSBB2/ZC903g0of
 wj8fwI5eRXBFbEHNEzjJ90k5RAGdZZbYVwcM6byQBWUVC2Q2Tamgpin92OA9q9tVWCuv
 SfqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=l9m0Tb8L2HEBgik8BroPRFgLlm9sHPZ7TL3ru+7brHI=;
 b=BC8DecnWbMNCpx2+32uQHltWK9fzRe43NXk2UjtRte2feSiHWEnqLH6qcdssVEnkyL
 RauqdeHrghJDywT8siw+jpr3CgjHKpSU3kzq+8uuk4Ybj5Uo9Bz1N5umjLuprQ8RkINJ
 WOlN9iL97rfvtej7hGkg/PKN5IWTbx4Rr9piGK1kE9gSPj0F48/fS1ic0KFICa1beRIA
 SXb4JesWH5uFCQfc56W84pc7Ga9IgK/NgzNkiT0LshBlcdia9M0B30xLlAB4amCT3UYi
 EhJ+7g0K28Amcgs9IvlfZ9BFfC8aCs45RcPbH6gzIRtEawoxABsTRnpcBVG89WYx4UWh
 sbug==
X-Gm-Message-State: AOAM532LJiKZsneRhNdf+VHuDV92GFflQsJll4HBNus1IK5quZ6V3W0D
 dqpOSwwTMdkXhRwCdcK3ImxIdj6/n8QnhpB3
X-Google-Smtp-Source: ABdhPJwoEBUgiWehGmRR4cR4Pgy3rA31B3jszdBTuOwZjfIKAxu/HwfG4lph8b2i382jCrY7yAO4/w==
X-Received: by 2002:a05:6830:451:: with SMTP id
 d17mr4140530otc.175.1642102203701; 
 Thu, 13 Jan 2022 11:30:03 -0800 (PST)
Received: from rekt.COMFAST ([152.249.109.193])
 by smtp.gmail.com with ESMTPSA id 90sm743409otn.59.2022.01.13.11.30.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Jan 2022 11:30:03 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 01/17] ppc/pnv: use PHB4 obj in pnv_pec_stk_pci_xscom_ops
Date: Thu, 13 Jan 2022 16:29:36 -0300
Message-Id: <20220113192952.911188-2-danielhb413@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220113192952.911188-1-danielhb413@gmail.com>
References: <20220113192952.911188-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::32e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::32e;
 envelope-from=danielhb413@gmail.com; helo=mail-ot1-x32e.google.com
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

The current relationship between PnvPhb4PecStack and PnvPHB4 objects is
overly complex. Recent work done in pnv_phb4.c and pnv_phb4_pec.c shows
that the stack obj role in the overall design is more of a placeholder for
its 'phb' object, having no atributes that stand on its own. This became
clearer after pnv-phb4 user creatable devices were implemented.

What remains now are a lot of stack->phb and phb->stack pointers
throughout .read and .write callbacks of MemoryRegionOps that are being
initialized in phb4_realize() time. stk_realize() is a no-op if the
machine is being run with -nodefaults.

The first step of trying to decouple the stack and phb relationship is
to move the MemoryRegionOps that belongs to PnvPhb4PecStack to PhbPHB4.
Unfortunately this can't be done  without some preliminary steps to
change the usage of 'stack' and replace it with 'phb' in these
read/write callbacks.

This patch starts this process by using a PnvPHB4 opaque in
pnv_pec_stk_pci_xscom_ops instead of PnvPhb4PecStack.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/pci-host/pnv_phb4.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
index a7b638831e..e010572376 100644
--- a/hw/pci-host/pnv_phb4.c
+++ b/hw/pci-host/pnv_phb4.c
@@ -1071,7 +1071,7 @@ static const MemoryRegionOps pnv_pec_stk_nest_xscom_ops = {
 static uint64_t pnv_pec_stk_pci_xscom_read(void *opaque, hwaddr addr,
                                            unsigned size)
 {
-    PnvPhb4PecStack *stack = PNV_PHB4_PEC_STACK(opaque);
+    PnvPhb4PecStack *stack = PNV_PHB4(opaque)->stack;
     uint32_t reg = addr >> 3;
 
     /* TODO: add list of allowed registers and error out if not */
@@ -1081,7 +1081,7 @@ static uint64_t pnv_pec_stk_pci_xscom_read(void *opaque, hwaddr addr,
 static void pnv_pec_stk_pci_xscom_write(void *opaque, hwaddr addr,
                                         uint64_t val, unsigned size)
 {
-    PnvPhb4PecStack *stack = PNV_PHB4_PEC_STACK(opaque);
+    PnvPhb4PecStack *stack = PNV_PHB4(opaque)->stack;
     uint32_t reg = addr >> 3;
 
     switch (reg) {
@@ -1475,10 +1475,10 @@ static void pnv_phb4_xscom_realize(PnvPHB4 *phb)
                           &pnv_pec_stk_nest_xscom_ops, stack, name,
                           PHB4_PEC_NEST_STK_REGS_COUNT);
 
-    snprintf(name, sizeof(name), "xscom-pec-%d.%d-pci-stack-%d",
+    snprintf(name, sizeof(name), "xscom-pec-%d.%d-pci-phb-%d",
              pec->chip_id, pec->index, stack->stack_no);
-    pnv_xscom_region_init(&stack->pci_regs_mr, OBJECT(stack),
-                          &pnv_pec_stk_pci_xscom_ops, stack, name,
+    pnv_xscom_region_init(&stack->pci_regs_mr, OBJECT(phb),
+                          &pnv_pec_stk_pci_xscom_ops, phb, name,
                           PHB4_PEC_PCI_STK_REGS_COUNT);
 
     /* PHB pass-through */
-- 
2.33.1


