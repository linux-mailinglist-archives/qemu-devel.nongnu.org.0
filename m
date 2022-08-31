Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9C025A8684
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Aug 2022 21:13:39 +0200 (CEST)
Received: from localhost ([::1]:41458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTT9e-0007pX-GE
	for lists+qemu-devel@lfdr.de; Wed, 31 Aug 2022 15:13:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oTSnt-00024X-53; Wed, 31 Aug 2022 14:51:09 -0400
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c]:38617)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oTSnq-0007zm-Bc; Wed, 31 Aug 2022 14:51:08 -0400
Received: by mail-ot1-x32c.google.com with SMTP id
 m21-20020a9d6ad5000000b00638df677850so10877147otq.5; 
 Wed, 31 Aug 2022 11:51:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=/N+BWY8Skhcx+k/LacHI6yeg2qY5tnuLB8PKd655Elw=;
 b=mBUDkDCnCrL2/FiC6nqFHijmIlcvZsLDqWhlIaOIe1Y0AUC1DWuZTc3JsI1LClRrfT
 sSd2OL9cwmo3pFuyW9L9aVHQo4y522UyHIvOb+sq8S43SETjtlL/zQDqSc2qk+O0oaon
 0v356ZOJidg311sRTA4TFkoedYZx9Z87FnyVo1Tt9q3J7+mvCaJctm0IU8mPcWtUqCqG
 S9nui2XxIV1BbrT/16j2PLjbq91N7qzN7mDqMfiZFErgtO5W+ym+tnKEDdRTN/73eD6p
 Cnk9+D4UAh+dVGT6er5VSMmkXPxy0cIDMLSS3tXoLQe/5Zk3MzWImsnOzeIIn6c57Ppo
 9Dew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=/N+BWY8Skhcx+k/LacHI6yeg2qY5tnuLB8PKd655Elw=;
 b=TGiIhVfucvzgRiubWvyD7w/EbKb5BIfep02YKir0smNV+ztSfC9/u6UQlEBvin2ZYl
 xo02d9u25DppP7S9IFLylTzFbjkCcI9rbGVtO4Lgq6Y205rAE5U7GNII9opew5QpAZUf
 LMoWWB0AsA8JV9XQ5l/pGLqFF4k+kd+nXl/N1jT1H9UykiflXrj6MtqPgm5pqRbPpAtb
 QYMFXSNn8eh/xvnzYHcyiyqOPUezyByb8uj0YC1RTqUzW1YmJBXFaEsFQQcAaNEFL45Q
 H7quYjdx9D3cS9vLPTeg5tENUxTe2Xvpn5bUQlShku5u6JKAxWvSTdv4ipzX2RMGy1ct
 Fh8w==
X-Gm-Message-State: ACgBeo027VtkudIpQfcIklmGQhOeJzx+PDfhMzeDCKhg4Sdnqqon9r0P
 yaiPjvIJPw2u5zBI4g8zMBz3selyXNE=
X-Google-Smtp-Source: AA6agR7wlWW1/o4O7SpXnVGaqprWcDmH777FETZRMTc/k5kLbkhkFdyUrbLQija5ZEDbHMnoJuUfpA==
X-Received: by 2002:a05:6830:3696:b0:61c:af74:13d7 with SMTP id
 bk22-20020a056830369600b0061caf7413d7mr10965860otb.28.1661971864180; 
 Wed, 31 Aug 2022 11:51:04 -0700 (PDT)
Received: from balboa.COMFAST ([177.189.45.98])
 by smtp.gmail.com with ESMTPSA id
 p4-20020a9d4544000000b0061cbd18bd18sm9599927oti.45.2022.08.31.11.51.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Aug 2022 11:51:03 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org, Frederic Barrat <fbarrat@linux.ibm.com>
Subject: [PULL 06/60] ppc/pnv: add PHB3 bus init helper
Date: Wed, 31 Aug 2022 15:49:40 -0300
Message-Id: <20220831185034.23240-7-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220831185034.23240-1-danielhb413@gmail.com>
References: <20220831185034.23240-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32c;
 envelope-from=danielhb413@gmail.com; helo=mail-ot1-x32c.google.com
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
Reviewed-by: Frederic Barrat <fbarrat@linux.ibm.com>
Message-Id: <20220624084921.399219-2-danielhb413@gmail.com>
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
2.37.2


