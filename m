Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1BFC480CDD
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Dec 2021 20:52:27 +0100 (CET)
Received: from localhost ([::1]:56822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n2IWJ-0003O0-0h
	for lists+qemu-devel@lfdr.de; Tue, 28 Dec 2021 14:52:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n2IJ1-0003p8-D6; Tue, 28 Dec 2021 14:38:44 -0500
Received: from [2607:f8b0:4864:20::730] (port=39563
 helo=mail-qk1-x730.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n2IIy-00045t-FX; Tue, 28 Dec 2021 14:38:41 -0500
Received: by mail-qk1-x730.google.com with SMTP id 69so18038975qkd.6;
 Tue, 28 Dec 2021 11:38:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lDufAFtHrqzL2AMvGvzbxBe50CphAPMCKn/qo2ry2KU=;
 b=fiPiIpH8ij/lpuJOj72AOa3BFFfnQZkpfAOq9Cq+1NLp6GYXrq4xMXJSKt7iiDUO0o
 YS851xHBNyDkNRGOvKuS513qfZ1yYHlroUgEDeLYeWwVHPsZ6iDeuw8wRs0EXOQmZnJX
 xh1HtR9sWQMlGD8DWTZchf62tw+09kPhdDReW3TU/b/3cxYaVdavf/BC4QOFijOgqjcB
 Lfubv8JRTP90YKItesO6KNwq2TK3MMC+ahrubF6oFCVmgsaPwkkUdhuwpljVTEEFj5VE
 y90Ch8Z2UJzXMRHdYKUNXrR+5SsOlx53YveuENuGNE+Z3v1dkqkIZm+k1enP4dSprXwU
 JCsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lDufAFtHrqzL2AMvGvzbxBe50CphAPMCKn/qo2ry2KU=;
 b=pk0xEwrmPUunJn+8e9UefvxfSQ6Qc7C5FGvL4njuaZRtvQ7pmrE2wPsuTxOgP/nnpq
 2bTI+yn2t4XHI7pIuw3BMI4ayq6zQOKzXzuN9zvOsp5ZsbzJEFQZieWk6JPVlsAQSVhH
 XJrRh8kjnAMthscHHHiGTQ5WfpukhWca2Ah/IkwWo/lwkkx5ZKsy6aBpXXlspXkg0cUw
 BmXeh83B6GbDEV01Y2kavmVvili4Isg9WQTmQ9UPnv4p2+CgSI9Zgbl8rb/qYKVbRT04
 v+cnXDRkgMPZ6QDhf6l4bzDItsv74wSAJKPOdPj9K6sw2jMof78d5bgiEl0xYg59yDrD
 9pmw==
X-Gm-Message-State: AOAM532X+jPnoHvDUAFSoxYOpKzwW4savdHmWQSj4lEFF6wxmW21kPK7
 OIu+FVlv5264shQoB91S2c0czBKCJVk=
X-Google-Smtp-Source: ABdhPJw4WT4nN1LUfNiNgndYby9T0oQj4KblUp3Bv2Uh7F66r6HotYPqdAQwJCcKdxp0xDA4mrOWAA==
X-Received: by 2002:a05:620a:284d:: with SMTP id
 h13mr16312825qkp.612.1640720316397; 
 Tue, 28 Dec 2021 11:38:36 -0800 (PST)
Received: from rekt.ibmuc.com ([2804:431:c7c6:7ce4:b718:2cc0:32df:97ee])
 by smtp.gmail.com with ESMTPSA id r20sm16924059qkp.21.2021.12.28.11.38.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Dec 2021 11:38:36 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 10/17] pnv_phb4.c: introduce pnv_pec_init_stack_xscom()
Date: Tue, 28 Dec 2021 16:37:59 -0300
Message-Id: <20211228193806.1198496-11-danielhb413@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211228193806.1198496-1-danielhb413@gmail.com>
References: <20211228193806.1198496-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::730
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::730;
 envelope-from=danielhb413@gmail.com; helo=mail-qk1-x730.google.com
X-Spam_score_int: 8
X-Spam_score: 0.8
X-Spam_bar: /
X-Spam_report: (0.8 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

The XSCOM address space of the stack must be populated after the
initialization of its associated PHB4 is completed. At this moment this
is always true because stk_realize() will always succeeds the realize of
stack->phb, but that will not be the case with user creatable pnv-phb4
devices.

Create a helper that can be used later on during pnv-phb4 realize() to
initialize the xscom address space of its stack.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/pci-host/pnv_phb4.c         | 26 ++++++++++++++++++++++++++
 hw/pci-host/pnv_phb4_pec.c     | 19 +------------------
 include/hw/pci-host/pnv_phb4.h |  1 +
 3 files changed, 28 insertions(+), 18 deletions(-)

diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
index 36c56007ba..31284e0460 100644
--- a/hw/pci-host/pnv_phb4.c
+++ b/hw/pci-host/pnv_phb4.c
@@ -1164,6 +1164,32 @@ static AddressSpace *pnv_phb4_dma_iommu(PCIBus *bus, void *opaque, int devfn)
     return &ds->dma_as;
 }
 
+/*
+ * Init the xscom address space of the stack. This must be
+ * called after the associated stack->phb is defined.
+ */
+void pnv_pec_init_stack_xscom(PnvPhb4PecStack *stack)
+{
+    PnvPhb4PecState *pec = stack->pec;
+    PnvPhb4PecClass *pecc = PNV_PHB4_PEC_GET_CLASS(pec);
+    PnvChip *chip = pec->chip;
+    uint32_t pec_nest_base = pecc->xscom_nest_base(pec);
+    uint32_t pec_pci_base = pecc->xscom_pci_base(pec);
+
+
+    /* Populate the XSCOM address space. */
+    pnv_xscom_add_subregion(chip,
+                            pec_nest_base + 0x40 * (stack->stack_no + 1),
+                            &stack->nest_regs_mr);
+    pnv_xscom_add_subregion(chip,
+                            pec_pci_base + 0x40 * (stack->stack_no + 1),
+                            &stack->pci_regs_mr);
+    pnv_xscom_add_subregion(chip,
+                            pec_pci_base + PNV9_XSCOM_PEC_PCI_STK0 +
+                            0x40 * stack->stack_no,
+                            &stack->phb_regs_mr);
+}
+
 /*
  * Return the index/phb-id of a PHB4 that belongs to a
  * pec->stacks[stack_index] stack.
diff --git a/hw/pci-host/pnv_phb4_pec.c b/hw/pci-host/pnv_phb4_pec.c
index bc2f8bb8b1..4f6db26633 100644
--- a/hw/pci-host/pnv_phb4_pec.c
+++ b/hw/pci-host/pnv_phb4_pec.c
@@ -560,10 +560,6 @@ static void pnv_pec_stk_realize(DeviceState *dev, Error **errp)
 {
     PnvPhb4PecStack *stack = PNV_PHB4_PEC_STACK(dev);
     PnvPhb4PecState *pec = stack->pec;
-    PnvPhb4PecClass *pecc = PNV_PHB4_PEC_GET_CLASS(pec);
-    PnvChip *chip = pec->chip;
-    uint32_t pec_nest_base;
-    uint32_t pec_pci_base;
     char name[64];
 
     assert(pec);
@@ -587,20 +583,7 @@ static void pnv_pec_stk_realize(DeviceState *dev, Error **errp)
         return;
     }
 
-    pec_nest_base = pecc->xscom_nest_base(pec);
-    pec_pci_base = pecc->xscom_pci_base(pec);
-
-    /* Populate the XSCOM address space. */
-    pnv_xscom_add_subregion(chip,
-                            pec_nest_base + 0x40 * (stack->stack_no + 1),
-                            &stack->nest_regs_mr);
-    pnv_xscom_add_subregion(chip,
-                            pec_pci_base + 0x40 * (stack->stack_no + 1),
-                            &stack->pci_regs_mr);
-    pnv_xscom_add_subregion(chip,
-                            pec_pci_base + PNV9_XSCOM_PEC_PCI_STK0 +
-                            0x40 * stack->stack_no,
-                            &stack->phb_regs_mr);
+    pnv_pec_init_stack_xscom(stack);
 }
 
 static Property pnv_pec_stk_properties[] = {
diff --git a/include/hw/pci-host/pnv_phb4.h b/include/hw/pci-host/pnv_phb4.h
index 0fa88ca3fa..0f6c81c9cb 100644
--- a/include/hw/pci-host/pnv_phb4.h
+++ b/include/hw/pci-host/pnv_phb4.h
@@ -134,6 +134,7 @@ struct PnvPHB4 {
 
 void pnv_phb4_pic_print_info(PnvPHB4 *phb, Monitor *mon);
 void pnv_phb4_update_regions(PnvPhb4PecStack *stack);
+void pnv_pec_init_stack_xscom(PnvPhb4PecStack *stack);
 void pnv_phb4_set_stack_phb_props(PnvPhb4PecStack *stack, PnvPHB4 *phb);
 int pnv_pec_get_phb_id(PnvPhb4PecState *pec, int stack_index);
 extern const MemoryRegionOps pnv_phb4_xscom_ops;
-- 
2.33.1


