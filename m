Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A22855962A
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 11:12:59 +0200 (CEST)
Received: from localhost ([::1]:33396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4fN4-0004dU-4G
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 05:12:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o4f0O-00026Y-VF; Fri, 24 Jun 2022 04:49:33 -0400
Received: from mail-oa1-x2a.google.com ([2001:4860:4864:20::2a]:38446)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o4f0N-0000Ai-E1; Fri, 24 Jun 2022 04:49:32 -0400
Received: by mail-oa1-x2a.google.com with SMTP id
 586e51a60fabf-101b4f9e825so2908725fac.5; 
 Fri, 24 Jun 2022 01:49:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aC68kBv6cLt+2XK5FGFmF45+slNmjpXcC3uzLg0IdBk=;
 b=FN2W/T2bnlAqvvNcIB3UFPipXpbJ1TaTPiL+BK2xkPsJGx2JsfyMIkAdO0j4s1EWYV
 BhXxldKux7fK98ktdIvAaRhmsq8Y0iA9AMVmWbk+Dwq7bV8tw6npXQh40t7WXPeKD2sT
 eOEOZz2EXhpdAh7g3r2Q1H0VNLfYKM71SLH+GxboB547g6L5grAHUinO2Ovl0xOOfGhV
 xBuE1Q+QNjZDhwbJ9rQW1unQIaVsuU4NxxvM47C9NpUoiKVPMyUnh9IL/CtgRfxEO27a
 9gn0V05sZ9cNBfVLf9h5qnvdfYyEW9zdQNLGvJZCn0qta2cHXoWkTS6Il53WK3Wf5Bgi
 O81Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aC68kBv6cLt+2XK5FGFmF45+slNmjpXcC3uzLg0IdBk=;
 b=zRtiRS6pI6IQienCdXJq5i0oOEiSYWpnYOGAvWmdWUdS14iP6iQ5+QKDKO2HBe8e60
 67LD/zba5Wn1dOVWktN7CQ5KzU6riwS3aVegdS4JNIH8vqTwNeTG7RrQaFlfj9flMrqs
 VBlqFVLD8D70J7Ezirl4m5evnlC18GL3zD0VJ9jisQmFKiKvnoIEWiQo6Tc7agXj08mq
 7763rMKCrpxiKZSP7zSzdKW0e6tQ8UItFczP8dox9otKSnctOvYK1bpzyOWHVVI/YjBb
 kizMvM99U5PbqksNRH+bYynQJ6ZzNBXiYTNSYyGCiWlHurgdLkaBGpl8bx2mqgaEEkg4
 r3cQ==
X-Gm-Message-State: AJIora8RcFiStdEHW65WJUrIRCQ0mzFWYk7fkWN3hKlHIEbhp1QzQloK
 aw/AJsCcQGvhVLEBR/KjVlDVcyoyLYU=
X-Google-Smtp-Source: AGRyM1uqOJAftLSgSi5UC7sxp9joLBDpwpR6HpFfkobfUZZlt8F/GnC6dChdJbr17NZfBO9TtGkL5g==
X-Received: by 2002:a05:6870:c8a9:b0:f2:87f0:670b with SMTP id
 er41-20020a056870c8a900b000f287f0670bmr1347810oab.143.1656060569186; 
 Fri, 24 Jun 2022 01:49:29 -0700 (PDT)
Received: from balboa.ibmmodules.com ([191.193.1.105])
 by smtp.gmail.com with ESMTPSA id
 u8-20020a056830230800b0061698ef90e5sm1192768ote.31.2022.06.24.01.49.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jun 2022 01:49:28 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org, fbarrat@linux.ibm.com,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH v3 01/12] ppc/pnv: add PHB3 bus init helper
Date: Fri, 24 Jun 2022 05:49:10 -0300
Message-Id: <20220624084921.399219-2-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220624084921.399219-1-danielhb413@gmail.com>
References: <20220624084921.399219-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2a;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x2a.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The PnvPHB3 bus init consists of initializing the pci_io and pci_mmio
regions, registering it via pci_register_root_bus() and then setup the
iommu.

We'll want to init the bus from outside pnv_phb3.c when the bus is
removed from the PnvPHB3 device and put into a new parent PnvPHB device.
The new pnv_phb3_bus_init() helper will be used by the parent to init
the bus when using the PHB3 backend.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/pci-host/pnv_phb3.c         | 39 ++++++++++++++++++++--------------
 include/hw/pci-host/pnv_phb3.h |  1 +
 2 files changed, 24 insertions(+), 16 deletions(-)

diff --git a/hw/pci-host/pnv_phb3.c b/hw/pci-host/pnv_phb3.c
index d58d3c1701..058cbab555 100644
--- a/hw/pci-host/pnv_phb3.c
+++ b/hw/pci-host/pnv_phb3.c
@@ -986,6 +986,28 @@ static void pnv_phb3_instance_init(Object *obj)
 
 }
 
+void pnv_phb3_bus_init(DeviceState *dev, PnvPHB3 *phb)
+{
+    PCIHostState *pci = PCI_HOST_BRIDGE(dev);
+
+    /*
+     * PHB3 doesn't support IO space. However, qemu gets very upset if
+     * we don't have an IO region to anchor IO BARs onto so we just
+     * initialize one which we never hook up to anything
+     */
+    memory_region_init(&phb->pci_io, OBJECT(phb), "pci-io", 0x10000);
+    memory_region_init(&phb->pci_mmio, OBJECT(phb), "pci-mmio",
+                       PCI_MMIO_TOTAL_SIZE);
+
+    pci->bus = pci_register_root_bus(dev,
+                                     dev->id ? dev->id : NULL,
+                                     pnv_phb3_set_irq, pnv_phb3_map_irq, phb,
+                                     &phb->pci_mmio, &phb->pci_io,
+                                     0, 4, TYPE_PNV_PHB3_ROOT_BUS);
+
+    pci_setup_iommu(pci->bus, pnv_phb3_dma_iommu, phb);
+}
+
 static void pnv_phb3_realize(DeviceState *dev, Error **errp)
 {
     PnvPHB3 *phb = PNV_PHB3(dev);
@@ -1035,22 +1057,7 @@ static void pnv_phb3_realize(DeviceState *dev, Error **errp)
     memory_region_init_io(&phb->mr_regs, OBJECT(phb), &pnv_phb3_reg_ops, phb,
                           "phb3-regs", 0x1000);
 
-    /*
-     * PHB3 doesn't support IO space. However, qemu gets very upset if
-     * we don't have an IO region to anchor IO BARs onto so we just
-     * initialize one which we never hook up to anything
-     */
-    memory_region_init(&phb->pci_io, OBJECT(phb), "pci-io", 0x10000);
-    memory_region_init(&phb->pci_mmio, OBJECT(phb), "pci-mmio",
-                       PCI_MMIO_TOTAL_SIZE);
-
-    pci->bus = pci_register_root_bus(dev,
-                                     dev->id ? dev->id : NULL,
-                                     pnv_phb3_set_irq, pnv_phb3_map_irq, phb,
-                                     &phb->pci_mmio, &phb->pci_io,
-                                     0, 4, TYPE_PNV_PHB3_ROOT_BUS);
-
-    pci_setup_iommu(pci->bus, pnv_phb3_dma_iommu, phb);
+    pnv_phb3_bus_init(dev, phb);
 
     pnv_phb_attach_root_port(pci, TYPE_PNV_PHB3_ROOT_PORT,
                              phb->phb_id, phb->chip_id);
diff --git a/include/hw/pci-host/pnv_phb3.h b/include/hw/pci-host/pnv_phb3.h
index af6ec83cf6..1375f18fc1 100644
--- a/include/hw/pci-host/pnv_phb3.h
+++ b/include/hw/pci-host/pnv_phb3.h
@@ -164,5 +164,6 @@ uint64_t pnv_phb3_reg_read(void *opaque, hwaddr off, unsigned size);
 void pnv_phb3_reg_write(void *opaque, hwaddr off, uint64_t val, unsigned size);
 void pnv_phb3_update_regions(PnvPHB3 *phb);
 void pnv_phb3_remap_irqs(PnvPHB3 *phb);
+void pnv_phb3_bus_init(DeviceState *dev, PnvPHB3 *phb);
 
 #endif /* PCI_HOST_PNV_PHB3_H */
-- 
2.36.1


