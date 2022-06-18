Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E068A55041F
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Jun 2022 13:05:40 +0200 (CEST)
Received: from localhost ([::1]:46526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o2WGp-0003Yb-P2
	for lists+qemu-devel@lfdr.de; Sat, 18 Jun 2022 07:05:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o2WDY-0007oM-Dv; Sat, 18 Jun 2022 07:02:16 -0400
Received: from mail-oa1-x29.google.com ([2001:4860:4864:20::29]:35573)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o2WDW-0005ea-NN; Sat, 18 Jun 2022 07:02:16 -0400
Received: by mail-oa1-x29.google.com with SMTP id
 586e51a60fabf-100eb6f7782so8454311fac.2; 
 Sat, 18 Jun 2022 04:02:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3kbu4UrA5HIu+Wok8xije/iW/kzvjSDna/SqQrFKhpE=;
 b=jPWlh1I1kAv/nLxLgfN8+yLv/hWpUrktFfqpWaYTiKRVqAkKwMmPvrUthOaDOV9/Hz
 LxRt44rkbb+gk6SnPNdcLbwkqBkCv7HV0RKXjEWIMyK4IUzHhSKSepxfpOeFLmiJT8Zp
 8o+jWZiopGfDN0+h4eAzh0jVlXXtHXlnsAbkq5KCNiANdDKIML35r1d555p7LAE0uFjM
 +NMWm5jm+jGleb5mrqzXtoVCFhsNo3rWBhVg/uywxJ1/0IqthiN7QFV4haXPFSSRnLc6
 CHbbfsLXwMlwTizYu3qV8f4siH5ZiSzkS5QgH93YOYZ9Fpi7N9BJgeZDbv0v8axvroaE
 H/Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3kbu4UrA5HIu+Wok8xije/iW/kzvjSDna/SqQrFKhpE=;
 b=G9zM7WDP2DSZb67sEZwPArDWXTAxdHPDDD+4+wat68wFMILKpvJRuCnQ53EqiwIJmu
 NHVqqyNs6UcwDY7yOgeou0RM9R9bDPdYrKKt5+VCtowi5l+EXf9pPignw4nNpp4Z0QzN
 j5snwopctKPiai4KH6BDFNxyrWxGg1AgyucjHKgkqx9QkWS6TxApVdOk4GkKrV9jBFPX
 pC8UrNWEtAz4qTOhSLZTSEe+OsIsFqA8PMWQgogbAywm0jpUu+ORy+hySOW75DFv74xB
 UkkIZwXIjv4Rk/6z9oqLF4yOHYSkWm6pye0+sFoz5qcbLGQqfuTdX0TAfHHK4GF/D5tG
 IKew==
X-Gm-Message-State: AJIora+RfoQ1AQEzwMOUI7xKJR32eNkCFS2S/7YEYkxnUHLxnTHLhgYX
 aWigqUn4q99x5ZxfFTyQx/dEXj/KIEY=
X-Google-Smtp-Source: AGRyM1sjKfUtzg26GsgapALbF4MrLCTO/uaOB0fD/N8VOOJfGbRmF2jLUPbhouZiZJPCeG3ybFHqBQ==
X-Received: by 2002:a05:6870:d349:b0:f5:e9ea:5200 with SMTP id
 h9-20020a056870d34900b000f5e9ea5200mr13978649oag.235.1655550133087; 
 Sat, 18 Jun 2022 04:02:13 -0700 (PDT)
Received: from balboa.ibmmodules.com ([2804:431:c7c6:ccc8:8e07:268b:a09:2834])
 by smtp.gmail.com with ESMTPSA id
 w16-20020a9d5a90000000b0060603221280sm4075456oth.80.2022.06.18.04.02.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Jun 2022 04:02:12 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org, fbarrat@linux.ibm.com,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH v2 2/9] ppc/pnv: attach phb3/phb4 root ports in QOM tree
Date: Sat, 18 Jun 2022 08:01:55 -0300
Message-Id: <20220618110202.87735-3-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220618110202.87735-1-danielhb413@gmail.com>
References: <20220618110202.87735-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::29;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x29.google.com
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

At this moment we leave the pnv-phb3(4)-root-port unattached in QOM:

  /unattached (container)
(...)
    /device[2] (pnv-phb3-root-port)
      /bus master container[0] (memory-region)
      /bus master[0] (memory-region)
      /pci_bridge_io[0] (memory-region)
      /pci_bridge_io[1] (memory-region)
      /pci_bridge_mem[0] (memory-region)
      /pci_bridge_pci[0] (memory-region)
      /pci_bridge_pref_mem[0] (memory-region)
      /pci_bridge_vga_io_hi[0] (memory-region)
      /pci_bridge_vga_io_lo[0] (memory-region)
      /pci_bridge_vga_mem[0] (memory-region)
      /pcie.0 (PCIE)

Let's make changes in pnv_phb_attach_root_port() to attach the created
root ports to its corresponding PHB.

This is the result afterwards:

    /pnv-phb3[0] (pnv-phb3)
      /lsi (ics)
      /msi (phb3-msi)
      /msi32[0] (memory-region)
      /msi64[0] (memory-region)
      /pbcq (pnv-pbcq)
    (...)
      /phb3_iommu[0] (pnv-phb3-iommu-memory-region)
      /pnv-phb3-root.0 (pnv-phb3-root)
        /pnv-phb3-root-port[0] (pnv-phb3-root-port)
          /bus master container[0] (memory-region)
          /bus master[0] (memory-region)
          /pci_bridge_io[0] (memory-region)
          /pci_bridge_io[1] (memory-region)
          /pci_bridge_mem[0] (memory-region)
          /pci_bridge_pci[0] (memory-region)
          /pci_bridge_pref_mem[0] (memory-region)
          /pci_bridge_vga_io_hi[0] (memory-region)
          /pci_bridge_vga_io_lo[0] (memory-region)
          /pci_bridge_vga_mem[0] (memory-region)
          /pcie.0 (PCIE)

Reviewed-by: Frederic Barrat <fbarrat@linux.ibm.com>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/pci-host/pnv_phb3.c | 2 +-
 hw/pci-host/pnv_phb4.c | 2 +-
 hw/ppc/pnv.c           | 7 ++++++-
 include/hw/ppc/pnv.h   | 2 +-
 4 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/hw/pci-host/pnv_phb3.c b/hw/pci-host/pnv_phb3.c
index 26ac9b7123..4ba660f8b9 100644
--- a/hw/pci-host/pnv_phb3.c
+++ b/hw/pci-host/pnv_phb3.c
@@ -1052,7 +1052,7 @@ static void pnv_phb3_realize(DeviceState *dev, Error **errp)
 
     pci_setup_iommu(pci->bus, pnv_phb3_dma_iommu, phb);
 
-    pnv_phb_attach_root_port(PCI_HOST_BRIDGE(phb), TYPE_PNV_PHB3_ROOT_PORT);
+    pnv_phb_attach_root_port(pci, TYPE_PNV_PHB3_ROOT_PORT, phb->phb_id);
 }
 
 void pnv_phb3_update_regions(PnvPHB3 *phb)
diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
index 23ad8de7ee..ffd9d8a947 100644
--- a/hw/pci-host/pnv_phb4.c
+++ b/hw/pci-host/pnv_phb4.c
@@ -1585,7 +1585,7 @@ static void pnv_phb4_realize(DeviceState *dev, Error **errp)
     pci->bus->flags |= PCI_BUS_EXTENDED_CONFIG_SPACE;
 
     /* Add a single Root port if running with defaults */
-    pnv_phb_attach_root_port(pci, pecc->rp_model);
+    pnv_phb_attach_root_port(pci, pecc->rp_model, phb->phb_id);
 
     /* Setup XIVE Source */
     if (phb->big_phb) {
diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
index 7c08a78d6c..40e0cbd84d 100644
--- a/hw/ppc/pnv.c
+++ b/hw/ppc/pnv.c
@@ -1190,9 +1190,14 @@ static void pnv_chip_icp_realize(Pnv8Chip *chip8, Error **errp)
 }
 
 /* Attach a root port device */
-void pnv_phb_attach_root_port(PCIHostState *pci, const char *name)
+void pnv_phb_attach_root_port(PCIHostState *pci, const char *name, int index)
 {
     PCIDevice *root = pci_new(PCI_DEVFN(0, 0), name);
+    g_autofree char *default_id = g_strdup_printf("%s[%d]", name, index);
+    const char *dev_id = DEVICE(root)->id;
+
+    object_property_add_child(OBJECT(pci->bus), dev_id ? dev_id : default_id,
+                              OBJECT(root));
 
     pci_realize_and_unref(root, pci->bus, &error_fatal);
 }
diff --git a/include/hw/ppc/pnv.h b/include/hw/ppc/pnv.h
index 86cb7d7f97..033890a23f 100644
--- a/include/hw/ppc/pnv.h
+++ b/include/hw/ppc/pnv.h
@@ -189,7 +189,7 @@ DECLARE_INSTANCE_CHECKER(PnvChip, PNV_CHIP_POWER10,
                          TYPE_PNV_CHIP_POWER10)
 
 PowerPCCPU *pnv_chip_find_cpu(PnvChip *chip, uint32_t pir);
-void pnv_phb_attach_root_port(PCIHostState *pci, const char *name);
+void pnv_phb_attach_root_port(PCIHostState *pci, const char *name, int index);
 
 #define TYPE_PNV_MACHINE       MACHINE_TYPE_NAME("powernv")
 typedef struct PnvMachineClass PnvMachineClass;
-- 
2.36.1


