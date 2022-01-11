Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D091F48A4BA
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 02:08:54 +0100 (CET)
Received: from localhost ([::1]:58490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n75ef-0003Sq-No
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 20:08:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n75Se-00082Q-Rj; Mon, 10 Jan 2022 19:56:29 -0500
Received: from [2607:f8b0:4864:20::92c] (port=44998
 helo=mail-ua1-x92c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n75SV-0003rI-5Q; Mon, 10 Jan 2022 19:56:20 -0500
Received: by mail-ua1-x92c.google.com with SMTP id l15so15439290uai.11;
 Mon, 10 Jan 2022 16:56:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gYpTgRUvQF7XHsoxoqS4DKRtqMINWUYN9b44P6UP990=;
 b=C4jZt7rJetGTDZVSnVGHs2bAYOE5gyEDacNn/XMhCzgUahn74fo7fgPU7/lZaSJwrX
 ZQA4pxizu0gXBpTf/xo6q7XxJbGTzlDcPYCh+U1LIWKaqWbKPE7T3sYoA+Ud/MBzURv9
 gtTG5YFyRnCMGf/wPE5PnTuk6cG3IzrrhAAdVtyODn2GtA16TVYlahppCvnR0zgRYz3t
 22zcPT5gkTH6sWUTEackvxJ88kve6uhr49t/qvBj6EwejFf3P9xsTRNo01TuG2bvo2Zu
 /RnybyRCKma3u/2XXVJzIA4ZfJmlvbGLyaYWExi7mylCcG8PWDN9sN4sm67H/UvZPm9o
 KttQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gYpTgRUvQF7XHsoxoqS4DKRtqMINWUYN9b44P6UP990=;
 b=Y2uobKRyIcAbwVRGJIKciUyCsTbTD1g1dRyomB9jj3XUyOn1xJAoeAfEzXRnW+d5pa
 Vfgey+XeYiPuTqfmySft/P21nHn1X1pzrUfj6Z4VlNeibAQ4tPfKqvAN5CwXPO/OqXkP
 jS93x6Lf/zOhQwTG8bZ4kd34OMMPfRD8wGGDuE72fCb/x5x/WQOSYdVC1zKcm4SYo7c5
 wo6AfWSaQbsbGM7MEtb/YdaXQkBG50J9mRi9Ts1WLL8DM1UpOiqFUkzQvP4uq7I7fJjr
 DueJXJKHY0yRCFru0rO0zL1vW8CMfdzrKTvlQZUP642xaxxkB9Ib39Ejk4nxH+th54Pb
 2HcQ==
X-Gm-Message-State: AOAM531EEhX9jNhkBHi3xXDcAmC7+nUR3g4qafRFh2U5G2Onrks55QyC
 dbK69BzgRu75D0OYLg2Pd1Hx6VmJ/f8M2j+7
X-Google-Smtp-Source: ABdhPJxoylBS6J3pOAb39K5c0mfBtF1atx52Xc0rwhknVQ7KVGJmyDjpJV/LK+B6OQrEI90uumunSQ==
X-Received: by 2002:a05:6102:6cd:: with SMTP id
 m13mr1121221vsg.75.1641862577864; 
 Mon, 10 Jan 2022 16:56:17 -0800 (PST)
Received: from rekt.COMFAST ([152.249.109.193])
 by smtp.gmail.com with ESMTPSA id x190sm4645562vkf.56.2022.01.10.16.56.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jan 2022 16:56:17 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 5/5] ppc/pnv: turn pnv_phb4_update_regions() into static
Date: Mon, 10 Jan 2022 21:55:58 -0300
Message-Id: <20220111005558.549685-6-danielhb413@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220111005558.549685-1-danielhb413@gmail.com>
References: <20220111005558.549685-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::92c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::92c;
 envelope-from=danielhb413@gmail.com; helo=mail-ua1-x92c.google.com
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

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/pci-host/pnv_phb4.c         | 52 +++++++++++++++++-----------------
 include/hw/pci-host/pnv_phb4.h |  1 -
 2 files changed, 26 insertions(+), 27 deletions(-)

diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
index 10f8d6a919..34c43bd0f5 100644
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
@@ -1797,32 +1823,6 @@ static void pnv_phb4_register_types(void)
 
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


