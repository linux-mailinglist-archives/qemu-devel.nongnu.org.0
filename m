Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4956B485A99
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 22:28:57 +0100 (CET)
Received: from localhost ([::1]:60026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5Dq4-0008GL-Ce
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 16:28:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n5Dld-0002Px-3a; Wed, 05 Jan 2022 16:24:21 -0500
Received: from [2607:f8b0:4864:20::935] (port=45742
 helo=mail-ua1-x935.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n5Dla-0007uo-TB; Wed, 05 Jan 2022 16:24:20 -0500
Received: by mail-ua1-x935.google.com with SMTP id az37so782968uab.12;
 Wed, 05 Jan 2022 13:24:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mLVm68xgZW+kUY6ipBoQCfy/YJJ5JkKZRWlpPFNiUjE=;
 b=cawD0sHEGlmZI3bBOxeEct3xyTDzfct+Hg6KW4Fd0p7cBaasqIeeVMztYBqhZtu4Mg
 xTY5AtLnHvt7UqABzanSraMTsPh9fV6nO7CV1Rgb22iK7LWHtt/JBSRvURsXt0zyG5pS
 eW7rCG/2uXRuJmr6rQAnZHKKSvXA66T8i0zUGa4jaNQptL+ZNWZw+rdzexuZUjFe+o3V
 uhsYlLdwGUqRSbJUAqZ1GIOndKRgYcjbgKg7szY5qoVIYS2QX+JevLSb6cKL56MWX1QO
 eehZqRAZCi++qOANbuef49BYUJH88H4USQDsqo2hgACRWKWPB2bIy97p2e5ReKjXCAK9
 lDrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mLVm68xgZW+kUY6ipBoQCfy/YJJ5JkKZRWlpPFNiUjE=;
 b=GXIkWU1u1ZEKvMZIYt0DSe3zW68LQjfh1fOHLV0h/3LyK8BT8DD2FUXUyy35j5fdcS
 22cdnyodDwsCcBqYyQ7unA/3qkMkw3S2u7CxQzYh3kYDczjOYu/STtvxUYVMJ2LNscVr
 hAxXYX1MRCNhnjfwpzNyLHVByfi4UFgRKB3l4WbRL29M2qjMzDUbgrxC2tkOjilbbgZQ
 AjrHOXzW7rrG7lmpuK08yQQRuGOFnIfYfoU0dV2uoX8MUneRApmD6148tTxgo8RSt9BB
 +uHW5xlMUEKyoIKaVChApZtY5hrCi8HqXalqDKFEKLMm5vkM3UbOIKgoKNGk8HsLpA9E
 Rj5g==
X-Gm-Message-State: AOAM533Wy7RKbXh0J8DWEfRDhCYNOuYni/vNiwSLE2oDVg1lNGTQ1D6d
 z05UdhpOmL2OKU/lyQLlREPQX4VFcoE=
X-Google-Smtp-Source: ABdhPJzITYjbVtQkHn4o81KMy/4prVoOsAPKPkWIL/BdhTt29nt/HY+rlZjUXimdQosAZ7o1ZSAnnA==
X-Received: by 2002:ab0:700e:: with SMTP id k14mr15374116ual.105.1641417857603; 
 Wed, 05 Jan 2022 13:24:17 -0800 (PST)
Received: from rekt.ibmuc.com ([2804:431:c7c7:f4d8:aa07:335f:99e0:a6e7])
 by smtp.gmail.com with ESMTPSA id m5sm65922vke.43.2022.01.05.13.24.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jan 2022 13:24:17 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 12/18] pnv_phb4_pec.c: move pnv_pec_phb_offset() to
 pnv_phb4.c
Date: Wed,  5 Jan 2022 18:23:32 -0300
Message-Id: <20220105212338.49899-13-danielhb413@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220105212338.49899-1-danielhb413@gmail.com>
References: <20220105212338.49899-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::935
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::935;
 envelope-from=danielhb413@gmail.com; helo=mail-ua1-x935.google.com
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
Cc: danielhb413@gmail.com, qemu-ppc@nongnu.org, clg@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The logic inside pnv_pec_phb_offset() will be useful in the next patch
to determine the stack that should contain a PHB4 device.

Move the function to pnv_phb4.c and make it public since there's no
pnv_phb4_pec.h header. While we're at it, add 'stack_index' as a
parameter and make the function return 'phb-id' directly. And rename it
to pnv_phb4_pec_get_phb_id() to be even clearer about the function
intent.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/pci-host/pnv_phb4.c         | 17 +++++++++++++++++
 hw/pci-host/pnv_phb4_pec.c     | 15 +--------------
 include/hw/pci-host/pnv_phb4.h |  2 ++
 3 files changed, 20 insertions(+), 14 deletions(-)

diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
index 6c1a33bc66..4c785bbe4c 100644
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
index 057d4b07fb..e47d19dfff 100644
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
+        int phb_id =  pnv_phb4_pec_get_phb_id(pec, i);
 
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


