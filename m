Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF42553990B
	for <lists+qemu-devel@lfdr.de>; Tue, 31 May 2022 23:52:19 +0200 (CEST)
Received: from localhost ([::1]:58000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nw9mj-00036K-VT
	for lists+qemu-devel@lfdr.de; Tue, 31 May 2022 17:52:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nw9k0-0008VV-AM; Tue, 31 May 2022 17:49:28 -0400
Received: from mail-oi1-x232.google.com ([2607:f8b0:4864:20::232]:45589)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nw9jy-0003Js-KB; Tue, 31 May 2022 17:49:28 -0400
Received: by mail-oi1-x232.google.com with SMTP id k11so150992oia.12;
 Tue, 31 May 2022 14:49:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0/L9WFXn7zvJ57pkEmeiDRRKtBCf20gcRPM1iaAqvMg=;
 b=o3H+U+uFE9dW+rZxMmvGrV58G7kkSise0/L+AZryPhYa98G75wNSugJ5sQ2jw+E1gM
 OwK3F4g98jXtALwWRw+o129e1F1zLny9falFcdxw/6AT7RJHPJAphfxykMG6vNYvsCPj
 pTW2X6ggQon4S6XAUM7Y1WR2DPC147UoDyi5lvkKAZ8gXt+z4ALDCwfr13joMDiSSesO
 sFSoaHnl+XdZZtEu6+Iu3KIb2CPMbnIsD1+HFXaAuBMrc+m3djOfHL68SAYmMhAN20Tq
 aWlAATyp1KT25VvylT3O/kqWO9yfjNoylhiNUZsGOgbe4WTc/linlO/sncb4pHq1VmKu
 Z9zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0/L9WFXn7zvJ57pkEmeiDRRKtBCf20gcRPM1iaAqvMg=;
 b=rg9OTMdsFr5Fn0pASjkMTb77gD1M9Sez6mzPPVkoINBFWIoxGND2zagFEvRWkr3jyC
 a5qyPy3pcMaL6cUnWBZ7c7eOToeKyY+wF63FRi+I3o3zzbb0rXuX1aaeXhg6kTxB2wmj
 vjlbZJHh6jKw4vYmJCoaQ4EzU6qxCSmnVVaB/9mEu8ex8rP+5Q4b2Vqfw9jsYZWeuhJ7
 qo46ETy9n/Sj+qsrYvIY4KlIqTK/qFX7SoXEWEo8qG0CgsnDkL/Mu4EVaI2fX/1VUvKB
 L0DNZWIBGeLv3hVdnbH7AkO+HFznJMuHfTFi1BK03E6rFqEVec79gIe8FIPNFThOjtVS
 gxzw==
X-Gm-Message-State: AOAM5309zsW0jP00nbZGd3XGPAOov/PjQl+mNKiCY+RuMwBpRyll5EGd
 LOye+uqZWFQdUrF1+upnw9Q6Tnt+yTcoPQ==
X-Google-Smtp-Source: ABdhPJwiSdxqY8Ta95ZpXXQB5tcmWQPkl6/hRsNVI84JMIFPPMJ6F0QA7k8TKn7q+V5EI0/xrCE4XA==
X-Received: by 2002:a05:6808:1a22:b0:32b:60c2:e2bd with SMTP id
 bk34-20020a0568081a2200b0032b60c2e2bdmr13225406oib.189.1654033765148; 
 Tue, 31 May 2022 14:49:25 -0700 (PDT)
Received: from balboa.COMFAST ([152.250.93.219])
 by smtp.gmail.com with ESMTPSA id
 pd19-20020a0568701f1300b000f333ac991fsm3476988oab.27.2022.05.31.14.49.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 May 2022 14:49:24 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, david@gibson.dropbear.id.au, clg@kaod.org,
 mark.cave-ayland@ilande.co.uk, fbarrat@linux.ibm.com,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH v2 01/16] ppc/pnv: add PHB3 bus init helper
Date: Tue, 31 May 2022 18:49:02 -0300
Message-Id: <20220531214917.31668-2-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220531214917.31668-1-danielhb413@gmail.com>
References: <20220531214917.31668-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::232;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x232.google.com
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
 hw/pci-host/pnv_phb3.c         | 40 +++++++++++++++++++---------------
 include/hw/pci-host/pnv_phb3.h |  1 +
 2 files changed, 24 insertions(+), 17 deletions(-)

diff --git a/hw/pci-host/pnv_phb3.c b/hw/pci-host/pnv_phb3.c
index 3f03467dde..60584e2aae 100644
--- a/hw/pci-host/pnv_phb3.c
+++ b/hw/pci-host/pnv_phb3.c
@@ -986,10 +986,31 @@ static void pnv_phb3_instance_init(Object *obj)
 
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
-    PCIHostState *pci = PCI_HOST_BRIDGE(dev);
     PnvMachineState *pnv = PNV_MACHINE(qdev_get_machine());
     int i;
 
@@ -1035,22 +1056,7 @@ static void pnv_phb3_realize(DeviceState *dev, Error **errp)
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
 
     pnv_phb_attach_root_port(PCI_HOST_BRIDGE(phb), TYPE_PNV_PHB3_ROOT_PORT);
 }
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


