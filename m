Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6266E5538FF
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jun 2022 19:37:26 +0200 (CEST)
Received: from localhost ([::1]:39386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3hob-0006Zz-D0
	for lists+qemu-devel@lfdr.de; Tue, 21 Jun 2022 13:37:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o3hm7-0002x7-Aa; Tue, 21 Jun 2022 13:34:51 -0400
Received: from mail-oa1-x35.google.com ([2001:4860:4864:20::35]:45700)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o3hm5-0002LG-H3; Tue, 21 Jun 2022 13:34:51 -0400
Received: by mail-oa1-x35.google.com with SMTP id
 586e51a60fabf-1048b8a38bbso2557173fac.12; 
 Tue, 21 Jun 2022 10:34:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3kbu4UrA5HIu+Wok8xije/iW/kzvjSDna/SqQrFKhpE=;
 b=MM1Bl0baytqCPVsfUt4AVFGbn4xbt3L+dQwFj98PmvFCcTV1/44wIcOCAnHCj5jBS9
 fDwbSZL/jFtH4T8l/zU7wMnsB2viRfJVQqOqgEydmD56tGOdUeJaPlD0JdC3ggWhd8sY
 E8YcaAY2OXIaalGNOsPhJYhZfPDyDRdVEZtXwyqccTkhSzt8jezSFjJ8HmySdMBc/HW+
 t7/ITpDo8B6DOsQ0JAtfT7UYwOTO5rAHj6n3uH57huZCkDE46GYG6ckRwMb4k1rlq9cd
 UHV8a55i4DRyyHHW/GD8RrBb7H/BpuCNTgq2vkZ4nt+4ZDZlGCOizmq/7L0vwLIIgWU+
 8JrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3kbu4UrA5HIu+Wok8xije/iW/kzvjSDna/SqQrFKhpE=;
 b=Rv/XVqSTEQj+8sZCKJSPTVgDUqyoqpVQpq+FnF1w3b+oisgQ5bvpbdfwqry2qXxxOs
 LkX1eVvwfV8Z4gJ/2kD7F9eZX3m0UK3ZDA7IHjDuSR7lBJnm41crNbagsuoZjq69ZsY9
 88U35BK/SCpxWDLw9W2fL4YSMJV7cUKGcxXEEOwCRuPGiFIoE2YTDxcn9ZaiJ3DSokb2
 8Yc/doMfHD7ohx7WeyV8Qbej4Z3hqzcqhizO8wsAb9KHxx5X6J2bZnahn7pWI8+2cs1e
 lAE0cVjOc2aO7Co6v4FjcuCeVRNOk8vMR7uKKkl/TJjcbBhGTjsWauGVSIMXb+p1WNHP
 8FhA==
X-Gm-Message-State: AJIora/2jqOQq02JZFJj9pGAuLZuciY63u+6CqHsX0C+2sDOCxCRAQpI
 IgJBCRZ+7eJE3v9DajihzEYwE6lELhfAgg==
X-Google-Smtp-Source: AGRyM1u+I/0iQN1v2Aqw0JNPr6xSEkZ6Bg/BsQj+bZ87hP2flBOrLSLPGsEt/SEdWHiGyroni0Ma6Q==
X-Received: by 2002:a05:6870:14cf:b0:101:ca19:8328 with SMTP id
 l15-20020a05687014cf00b00101ca198328mr9367643oab.60.1655832885682; 
 Tue, 21 Jun 2022 10:34:45 -0700 (PDT)
Received: from balboa.ibmuc.com ([187.34.29.129])
 by smtp.gmail.com with ESMTPSA id
 z22-20020a056870385600b0010200e2828fsm2886556oal.30.2022.06.21.10.34.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jun 2022 10:34:45 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org, fbarrat@linux.ibm.com,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH v3 2/8] ppc/pnv: attach phb3/phb4 root ports in QOM tree
Date: Tue, 21 Jun 2022 14:34:30 -0300
Message-Id: <20220621173436.165912-3-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220621173436.165912-1-danielhb413@gmail.com>
References: <20220621173436.165912-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::35;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x35.google.com
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


