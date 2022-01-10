Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72672489B80
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 15:44:24 +0100 (CET)
Received: from localhost ([::1]:33190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6vuJ-0004EO-Hg
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 09:44:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n6vkM-0001am-Ck; Mon, 10 Jan 2022 09:34:06 -0500
Received: from [2607:f8b0:4864:20::a30] (port=36521
 helo=mail-vk1-xa30.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n6vkG-0007Nm-PM; Mon, 10 Jan 2022 09:34:06 -0500
Received: by mail-vk1-xa30.google.com with SMTP id d189so8253323vkg.3;
 Mon, 10 Jan 2022 06:33:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tTxpIEYPPHkTd2JTInKB3hze/WEd4bmtdeHyka29NO4=;
 b=JvqOwfWWlz3BYGxMPsjXiHsnf69+BoF8RT3RdpBN+f/SAHhcnjbPl1fF3C4WvLtnai
 VRG609K+UE69DrEDbJR0SysFjbjGxLYzz02iYu7ESc4PCpL8lukFoswW8SiCcgPq42aB
 +f/kgUVqQWT4WIRR05okDUAxiLhOtz0oavWyi+HJe7drY6vqN5Q57IV/CMai90dopkaX
 EGC+B5NwCxN2sz2e6jXWUZqfh49Ge4hDK7w+G9Dlbz6psgnkJkBgxUqTZISlR2059HkJ
 OHz1GOsamWid/qRuDpj2d3Yynzje/DaD0wFzwJUwhZDUKTXZtIeEABI9ykmnrNVj1Gym
 coBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tTxpIEYPPHkTd2JTInKB3hze/WEd4bmtdeHyka29NO4=;
 b=b3exdS/1hnNByhfE9XNgqCYXvUDRsXha9bL9DCZm0oBMWtKkCs8/e+VYa+P1U+XxAt
 IrP/sUPDpAgfB2QV5jBgQ0/GB9Esh6qLO1badKRmU/MbcfMgCgQEKcVZZnQsksT6/wkT
 LL6OVniZV5vUiri4r9HsHSrte7UFgc+M5u4kGqf/YT0M0TTnFGBwjro+rSw8DdgXAG47
 H/5fLnHrKx96dHPOMr2n76exypXWQ1fXqpVEELaYlMU7MDNX0Ki0e1VNiVTVPMxwV6Zd
 zHWit2Jvdl36DBblRi9qy87Y9Rbuyc9QY+DZkX5nvyjQDfRGYoTxUqorQ1z9A+DwS460
 axtw==
X-Gm-Message-State: AOAM531Q/zm1r1y6OijUiaBylwak0AXC8GsViL56B1UPwBcH8ybDyV5X
 48uMKNH3vwZrozWCHAtg8Q60XRoOAr4Sy78B
X-Google-Smtp-Source: ABdhPJyLjlmnbTqQzKgaPwhUYrot/oSqsv2HXG1vXCfsINVhER+EKjARtpQc1iELcmcq/zUD5FxRIg==
X-Received: by 2002:a05:6122:889:: with SMTP id
 9mr27702652vkf.21.1641825239089; 
 Mon, 10 Jan 2022 06:33:59 -0800 (PST)
Received: from rekt.COMFAST ([152.249.109.193])
 by smtp.gmail.com with ESMTPSA id o11sm3709677vkf.41.2022.01.10.06.33.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jan 2022 06:33:58 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 02/10] pnv_phb4_pec.c: move pnv_pec_phb_offset() to
 pnv_phb4.c
Date: Mon, 10 Jan 2022 11:33:38 -0300
Message-Id: <20220110143346.455901-3-danielhb413@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220110143346.455901-1-danielhb413@gmail.com>
References: <20220110143346.455901-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::a30
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::a30;
 envelope-from=danielhb413@gmail.com; helo=mail-vk1-xa30.google.com
X-Spam_score_int: -9
X-Spam_score: -1.0
X-Spam_bar: -
X-Spam_report: (-1.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=no autolearn_force=no
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

The logic inside pnv_pec_phb_offset() will be useful in the next patch
to determine the stack that should contain a PHB4 device.

Move the function to pnv_phb4.c and make it public since there's no
pnv_phb4_pec.h header. While we're at it, add 'stack_index' as a
parameter and make the function return 'phb-id' directly. And rename it
to pnv_phb4_pec_get_phb_id() to be even clearer about the function
intent.

Reviewed-by: Cédric Le Goater <clg@kaod.org>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/pci-host/pnv_phb4.c         | 17 +++++++++++++++++
 hw/pci-host/pnv_phb4_pec.c     | 15 +--------------
 include/hw/pci-host/pnv_phb4.h |  2 ++
 3 files changed, 20 insertions(+), 14 deletions(-)

diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
index 4c045fd8cd..fb6c4f993a 100644
--- a/hw/pci-host/pnv_phb4.c
+++ b/hw/pci-host/pnv_phb4.c
@@ -1158,6 +1158,23 @@ static AddressSpace *pnv_phb4_dma_iommu(PCIBus *bus, void *opaque, int devfn)
     return &ds->dma_as;
 }
 
+/*
+ * Return the index/phb-id of a PHB4 that belongs to a
+ * pec->stacks[stack_index] stack.
+ */
+int pnv_phb4_pec_get_phb_id(PnvPhb4PecState *pec, int stack_index)
+{
+    PnvPhb4PecClass *pecc = PNV_PHB4_PEC_GET_CLASS(pec);
+    int index = pec->index;
+    int offset = 0;
+
+    while (index--) {
+        offset += pecc->num_stacks[index];
+    }
+
+    return offset + stack_index;
+}
+
 /*
  * Set the object properties of a phb in relation with its stack.
  *
diff --git a/hw/pci-host/pnv_phb4_pec.c b/hw/pci-host/pnv_phb4_pec.c
index 97b9d4cb0e..513a698e17 100644
--- a/hw/pci-host/pnv_phb4_pec.c
+++ b/hw/pci-host/pnv_phb4_pec.c
@@ -374,19 +374,6 @@ static void pnv_pec_instance_init(Object *obj)
     }
 }
 
-static int pnv_pec_phb_offset(PnvPhb4PecState *pec)
-{
-    PnvPhb4PecClass *pecc = PNV_PHB4_PEC_GET_CLASS(pec);
-    int index = pec->index;
-    int offset = 0;
-
-    while (index--) {
-        offset += pecc->num_stacks[index];
-    }
-
-    return offset;
-}
-
 static void pnv_pec_realize(DeviceState *dev, Error **errp)
 {
     PnvPhb4PecState *pec = PNV_PHB4_PEC(dev);
@@ -405,7 +392,7 @@ static void pnv_pec_realize(DeviceState *dev, Error **errp)
     for (i = 0; i < pec->num_stacks; i++) {
         PnvPhb4PecStack *stack = &pec->stacks[i];
         Object *stk_obj = OBJECT(stack);
-        int phb_id = pnv_pec_phb_offset(pec) + i;
+        int phb_id = pnv_phb4_pec_get_phb_id(pec, i);
 
         object_property_set_int(stk_obj, "stack-no", i, &error_abort);
         object_property_set_int(stk_obj, "phb-id", phb_id, &error_abort);
diff --git a/include/hw/pci-host/pnv_phb4.h b/include/hw/pci-host/pnv_phb4.h
index 7f5b9cc0ac..b2c4a6b263 100644
--- a/include/hw/pci-host/pnv_phb4.h
+++ b/include/hw/pci-host/pnv_phb4.h
@@ -15,6 +15,7 @@
 #include "hw/ppc/xive.h"
 #include "qom/object.h"
 
+typedef struct PnvPhb4PecState PnvPhb4PecState;
 typedef struct PnvPhb4PecStack PnvPhb4PecStack;
 typedef struct PnvPHB4 PnvPHB4;
 typedef struct PnvChip PnvChip;
@@ -132,6 +133,7 @@ struct PnvPHB4 {
 void pnv_phb4_pic_print_info(PnvPHB4 *phb, Monitor *mon);
 void pnv_phb4_update_regions(PnvPhb4PecStack *stack);
 void pnv_phb4_set_stack_phb_props(PnvPhb4PecStack *stack, PnvPHB4 *phb);
+int pnv_phb4_pec_get_phb_id(PnvPhb4PecState *pec, int stack_index);
 extern const MemoryRegionOps pnv_phb4_xscom_ops;
 
 /*
-- 
2.33.1


