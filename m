Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F416148AF31
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 15:11:34 +0100 (CET)
Received: from localhost ([::1]:42276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7Hs5-0001DG-Pw
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 09:11:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n7GvS-0003nl-RN; Tue, 11 Jan 2022 08:11:03 -0500
Received: from [2607:f8b0:4864:20::92d] (port=44681
 helo=mail-ua1-x92d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n7GvH-0007Rd-IA; Tue, 11 Jan 2022 08:10:58 -0500
Received: by mail-ua1-x92d.google.com with SMTP id l15so18120913uai.11;
 Tue, 11 Jan 2022 05:10:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GE644NnPbZ5AAUavcaFOZCXuQEqZhv8V4PEbFward/U=;
 b=AoeGMxGKpmT1zxaArAvHUhD4qDU+qAbQ1K1xU0z6zpH24tdM+oCh8zZ0s6I1Bu2oeK
 OLuzucyFpfQR4sI6hkM/zupqK/LwUu0LAFI4SfePTU3rqinxMg/aUEqrRpaB9JffA+0L
 sEfq187OwPtXVw6jsTzqfw4KEY5+Isu8bQ/DEMYb6SgjbczYSdIlcZXugddm4D5N/nzJ
 joaesVLSd4CM9uc/usJAfyMgexBvY4/DD4eoiM+OrZMNnGlceDRmWaztgeKRiFfBSBNY
 BERa+OKYYFj1dRIDPr9zVHzAy9JbCdyi3zI49TQFSV60QPctwTTkjphyqiYUAaU4AQuc
 1qXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GE644NnPbZ5AAUavcaFOZCXuQEqZhv8V4PEbFward/U=;
 b=J4gJPQbdC6e4XY8Ilb0FbN116rg91LaqUvTYCIgdgv59VT0zvwvTE7TJH6dLG6mq67
 5iWTg+YjWvi3qBW1dFOkT/Kkv8h0WjajDmHRZQdO+4I1c4OkMxThuCpatURUjhgRrAFe
 Mpp07si1jSA3pyUlFl2KI7ROfupW0VA07bVyzFXMGficIHAewcEubGMOqpvsH1FX0iTM
 u8R6SR6ff5bvRpkbukDSS3fDjhEtNiz6QJ4UnMlrpMFn7Lo4xvVXt6ucfqGjXqEW/lMT
 ROD46pxfg+2a6HgAoRmv/XZptUKt5zi4NkZsceh/IiwGSGM9V3NRjyEoi+vSO8fPO/Fy
 rDCg==
X-Gm-Message-State: AOAM533PqEZxk+yI1RH4+ZkRR7VSgbhADeGOGj1k918F7nu6t4ohApIg
 cPPZbw/tNuWD/Oaro326In/VwT7BUOBf3oX4
X-Google-Smtp-Source: ABdhPJxBUmPaW890jbCmL6NKnL6iJ9QfuAFxe8Q9TnSrhkSyIf3+bInNA+9AV0ERbWgAglX+G4Yxrg==
X-Received: by 2002:a05:6102:304b:: with SMTP id
 w11mr1830706vsa.44.1641906644479; 
 Tue, 11 Jan 2022 05:10:44 -0800 (PST)
Received: from rekt.COMFAST ([152.249.109.193])
 by smtp.gmail.com with ESMTPSA id f1sm5386381uae.5.2022.01.11.05.10.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jan 2022 05:10:44 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 5/5] ppc/pnv: turn pnv_phb4_update_regions() into static
Date: Tue, 11 Jan 2022 10:10:27 -0300
Message-Id: <20220111131027.599784-6-danielhb413@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220111131027.599784-1-danielhb413@gmail.com>
References: <20220111131027.599784-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::92d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::92d;
 envelope-from=danielhb413@gmail.com; helo=mail-ua1-x92d.google.com
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

Its only callers are inside pnv_phb4.c.

Reviewed-by: Cédric Le Goater <clg@kaod.org>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/pci-host/pnv_phb4.c         | 52 +++++++++++++++++-----------------
 include/hw/pci-host/pnv_phb4.h |  1 -
 2 files changed, 26 insertions(+), 27 deletions(-)

diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
index ca2f4078e5..30e609d78e 100644
--- a/hw/pci-host/pnv_phb4.c
+++ b/hw/pci-host/pnv_phb4.c
@@ -868,6 +868,32 @@ static uint64_t pnv_pec_stk_nest_xscom_read(void *opaque, hwaddr addr,
     return stack->nest_regs[reg];
 }
 
+static void pnv_phb4_update_regions(PnvPhb4PecStack *stack)
+{
+    PnvPHB4 *phb = stack->phb;
+
+    /* Unmap first always */
+    if (memory_region_is_mapped(&phb->mr_regs)) {
+        memory_region_del_subregion(&stack->phbbar, &phb->mr_regs);
+    }
+    if (memory_region_is_mapped(&phb->xsrc.esb_mmio)) {
+        memory_region_del_subregion(&stack->intbar, &phb->xsrc.esb_mmio);
+    }
+
+    /* Map registers if enabled */
+    if (memory_region_is_mapped(&stack->phbbar)) {
+        memory_region_add_subregion(&stack->phbbar, 0, &phb->mr_regs);
+    }
+
+    /* Map ESB if enabled */
+    if (memory_region_is_mapped(&stack->intbar)) {
+        memory_region_add_subregion(&stack->intbar, 0, &phb->xsrc.esb_mmio);
+    }
+
+    /* Check/update m32 */
+    pnv_phb4_check_all_mbt(phb);
+}
+
 static void pnv_pec_stk_update_map(PnvPhb4PecStack *stack)
 {
     PnvPhb4PecState *pec = stack->pec;
@@ -1796,32 +1822,6 @@ static void pnv_phb4_register_types(void)
 
 type_init(pnv_phb4_register_types);
 
-void pnv_phb4_update_regions(PnvPhb4PecStack *stack)
-{
-    PnvPHB4 *phb = stack->phb;
-
-    /* Unmap first always */
-    if (memory_region_is_mapped(&phb->mr_regs)) {
-        memory_region_del_subregion(&stack->phbbar, &phb->mr_regs);
-    }
-    if (memory_region_is_mapped(&phb->xsrc.esb_mmio)) {
-        memory_region_del_subregion(&stack->intbar, &phb->xsrc.esb_mmio);
-    }
-
-    /* Map registers if enabled */
-    if (memory_region_is_mapped(&stack->phbbar)) {
-        memory_region_add_subregion(&stack->phbbar, 0, &phb->mr_regs);
-    }
-
-    /* Map ESB if enabled */
-    if (memory_region_is_mapped(&stack->intbar)) {
-        memory_region_add_subregion(&stack->intbar, 0, &phb->xsrc.esb_mmio);
-    }
-
-    /* Check/update m32 */
-    pnv_phb4_check_all_mbt(phb);
-}
-
 void pnv_phb4_pic_print_info(PnvPHB4 *phb, Monitor *mon)
 {
     uint32_t offset = phb->regs[PHB_INT_NOTIFY_INDEX >> 3];
diff --git a/include/hw/pci-host/pnv_phb4.h b/include/hw/pci-host/pnv_phb4.h
index 82f054cf21..4b7ce8a723 100644
--- a/include/hw/pci-host/pnv_phb4.h
+++ b/include/hw/pci-host/pnv_phb4.h
@@ -131,7 +131,6 @@ struct PnvPHB4 {
 };
 
 void pnv_phb4_pic_print_info(PnvPHB4 *phb, Monitor *mon);
-void pnv_phb4_update_regions(PnvPhb4PecStack *stack);
 int pnv_phb4_pec_get_phb_id(PnvPhb4PecState *pec, int stack_index);
 extern const MemoryRegionOps pnv_phb4_xscom_ops;
 
-- 
2.33.1


