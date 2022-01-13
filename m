Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 804CB48DE54
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jan 2022 20:46:58 +0100 (CET)
Received: from localhost ([::1]:53532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n863l-0007Ki-8X
	for lists+qemu-devel@lfdr.de; Thu, 13 Jan 2022 14:46:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n85o4-0006ZY-6t; Thu, 13 Jan 2022 14:30:46 -0500
Received: from [2607:f8b0:4864:20::22c] (port=46978
 helo=mail-oi1-x22c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n85nk-0005Dp-Sq; Thu, 13 Jan 2022 14:30:38 -0500
Received: by mail-oi1-x22c.google.com with SMTP id w188so9095018oiw.13;
 Thu, 13 Jan 2022 11:30:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JmxVYzwNeP9nzeen4Qy7w2ThRXOHen0mPdAA9ankFak=;
 b=Iw/0YXaCTuO2CNufa0lf1vN8sw+6t3dDC+dQ3qYiyDVFgh2lWn1vorx0m2vpzBNrik
 nuUE1oJjMkOZ8oDj4xmdL6gw04AObwvXjER25NaA97Rnl9eZlyC+z8mudx0PqiP/yqAV
 wjdOYd4n0GNHzuGTKRHRbWtwiLmZ/GFAcCHdsTwksyYJ5qW8BZvPtkh/HTucCpk3GkWs
 uyQoo6vOQWfo6jhi56ENoAoXts1Wrn7HbIn2DVJqPgQZAENySe1qEADExyKIN9Lvdv2P
 NQY8dDPkYzytZWagjASX57ex9gwJnd5tRTJ4OrvkbYmi0R5xjRWQDrgscdtyJv/kGyTL
 Lt8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JmxVYzwNeP9nzeen4Qy7w2ThRXOHen0mPdAA9ankFak=;
 b=CMKERHFmmSp3eIAC4edPb1BeP2DnPGi60N7oL429Mw5TEUF1ZK2XqZVkuOue0g7TR6
 0VxcNbFV+VXBkhQKsb/0SSVD+yHY+RZpSAhk+cAsCsgGu3hpM50o8zBKKm7mH0BHeXFp
 FmFOkGTKnKGzLKMWy8zCIWiwL+uWpRL3a/GxzxxQyoRAlKGTC5x2mqi70iXzgWUQnXp9
 DlHX7g+zT2+x3Zw1KbIAh4kuLpbQeqm3Txiif6U0w3w8uNy8vQs6KfeISPXLZZnaHfo5
 HZmszehtYA23w9ZTl+7tvajKYa5P6Ejdzg0D+4Hku7NSAtkneOVa8VS4Hf5vDuonnUZu
 Nvog==
X-Gm-Message-State: AOAM531pOsNbMzYQ8E5X8WfMotRu8C+nEkwHePzgRyt1oqzMc5+vlg9Y
 XZcx+Q848lVC9EOudeZgB2g7LOUuNDjqZMGn
X-Google-Smtp-Source: ABdhPJyt7cmTzjDf8/Mg3tJCKeU2ZTE901UA7S36PFbM3la9Bi+eSXQ10l6EVL7Hg7EGiQ2XKm/lQg==
X-Received: by 2002:a05:6808:ddd:: with SMTP id
 g29mr10045817oic.66.1642102223524; 
 Thu, 13 Jan 2022 11:30:23 -0800 (PST)
Received: from rekt.COMFAST ([152.249.109.193])
 by smtp.gmail.com with ESMTPSA id 90sm743409otn.59.2022.01.13.11.30.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Jan 2022 11:30:23 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 12/17] ppc/pnv: introduce PnvPHB4 'pec' property
Date: Thu, 13 Jan 2022 16:29:47 -0300
Message-Id: <20220113192952.911188-13-danielhb413@gmail.com>
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

This property will track the owner PEC of this PHB. For now it's
redundant since we can retrieve the PEC via phb->stack->pec but it
will not be redundant when we get rid of the stack device.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/pci-host/pnv_phb4.c         | 20 +++++++++++---------
 hw/pci-host/pnv_phb4_pec.c     |  2 ++
 include/hw/pci-host/pnv_phb4.h |  3 +++
 3 files changed, 16 insertions(+), 9 deletions(-)

diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
index 44f3087913..c9117221b2 100644
--- a/hw/pci-host/pnv_phb4.c
+++ b/hw/pci-host/pnv_phb4.c
@@ -894,8 +894,7 @@ static void pnv_phb4_update_regions(PnvPHB4 *phb)
 
 static void pnv_pec_stk_update_map(PnvPHB4 *phb)
 {
-    PnvPhb4PecStack *stack = phb->stack;
-    PnvPhb4PecState *pec = stack->pec;
+    PnvPhb4PecState *pec = phb->pec;
     MemoryRegion *sysmem = get_system_memory();
     uint64_t bar_en = phb->nest_regs[PEC_NEST_STK_BAR_EN];
     uint64_t bar, mask, size;
@@ -969,7 +968,7 @@ static void pnv_pec_stk_update_map(PnvPHB4 *phb)
         bar = phb->nest_regs[PEC_NEST_STK_INT_BAR] >> 8;
         size = PNV_PHB4_MAX_INTs << 16;
         snprintf(name, sizeof(name), "pec-%d.%d-phb-%d-int",
-                 stack->pec->chip_id, stack->pec->index, phb->phb_number);
+                 phb->pec->chip_id, phb->pec->index, phb->phb_number);
         memory_region_init(&phb->intbar, OBJECT(phb), name, size);
         memory_region_add_subregion(sysmem, bar, &phb->intbar);
     }
@@ -982,7 +981,7 @@ static void pnv_pec_stk_nest_xscom_write(void *opaque, hwaddr addr,
                                          uint64_t val, unsigned size)
 {
     PnvPHB4 *phb = PNV_PHB4(opaque);
-    PnvPhb4PecState *pec = phb->stack->pec;
+    PnvPhb4PecState *pec = phb->pec;
     uint32_t reg = addr >> 3;
 
     switch (reg) {
@@ -1458,8 +1457,7 @@ static AddressSpace *pnv_phb4_dma_iommu(PCIBus *bus, void *opaque, int devfn)
 
 static void pnv_phb4_xscom_realize(PnvPHB4 *phb)
 {
-    PnvPhb4PecStack *stack = phb->stack;
-    PnvPhb4PecState *pec = stack->pec;
+    PnvPhb4PecState *pec = phb->pec;
     PnvPhb4PecClass *pecc = PNV_PHB4_PEC_GET_CLASS(pec);
     uint32_t pec_nest_base;
     uint32_t pec_pci_base;
@@ -1569,10 +1567,12 @@ static void pnv_phb4_realize(DeviceState *dev, Error **errp)
         }
 
         /*
-         * All other phb properties but 'version' and 'phb-number'
-         * are already set.
+         * All other phb properties but 'pec', 'version' and
+         * 'phb-number' are already set.
          */
-        pecc = PNV_PHB4_PEC_GET_CLASS(phb->stack->pec);
+        object_property_set_link(OBJECT(phb), "pec", OBJECT(phb->stack->pec),
+                                 &error_abort);
+        pecc = PNV_PHB4_PEC_GET_CLASS(phb->pec);
         object_property_set_int(OBJECT(phb), "version", pecc->version,
                                 &error_fatal);
         object_property_set_int(OBJECT(phb), "phb-number",
@@ -1688,6 +1688,8 @@ static Property pnv_phb4_properties[] = {
         DEFINE_PROP_UINT64("version", PnvPHB4, version, 0),
         DEFINE_PROP_LINK("stack", PnvPHB4, stack, TYPE_PNV_PHB4_PEC_STACK,
                          PnvPhb4PecStack *),
+        DEFINE_PROP_LINK("pec", PnvPHB4, pec, TYPE_PNV_PHB4_PEC,
+                         PnvPhb4PecState *),
         DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/hw/pci-host/pnv_phb4_pec.c b/hw/pci-host/pnv_phb4_pec.c
index 7c4b4023df..36cc4ffe7c 100644
--- a/hw/pci-host/pnv_phb4_pec.c
+++ b/hw/pci-host/pnv_phb4_pec.c
@@ -287,6 +287,8 @@ static void pnv_pec_stk_default_phb_realize(PnvPhb4PecStack *stack,
 
     object_property_set_int(OBJECT(stack->phb), "phb-number", stack->stack_no,
                             &error_abort);
+    object_property_set_link(OBJECT(stack->phb), "pec", OBJECT(pec),
+                             &error_abort);
     object_property_set_int(OBJECT(stack->phb), "chip-id", pec->chip_id,
                             &error_fatal);
     object_property_set_int(OBJECT(stack->phb), "index", phb_id,
diff --git a/include/hw/pci-host/pnv_phb4.h b/include/hw/pci-host/pnv_phb4.h
index fc7807be1c..f66bc76b78 100644
--- a/include/hw/pci-host/pnv_phb4.h
+++ b/include/hw/pci-host/pnv_phb4.h
@@ -87,6 +87,9 @@ struct PnvPHB4 {
     /* My own PHB number */
     uint32_t phb_number;
 
+    /* The owner PEC */
+    PnvPhb4PecState *pec;
+
     char bus_path[8];
 
     /* Main register images */
-- 
2.33.1


