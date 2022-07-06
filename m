Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B2EB569327
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jul 2022 22:16:37 +0200 (CEST)
Received: from localhost ([::1]:44270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9BRs-0003ki-IP
	for lists+qemu-devel@lfdr.de; Wed, 06 Jul 2022 16:16:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o9BLS-0008VI-3q; Wed, 06 Jul 2022 16:09:58 -0400
Received: from mail-ua1-x932.google.com ([2607:f8b0:4864:20::932]:42738)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o9BLQ-0003FR-Ep; Wed, 06 Jul 2022 16:09:57 -0400
Received: by mail-ua1-x932.google.com with SMTP id l7so6256258ual.9;
 Wed, 06 Jul 2022 13:09:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jOxTsnY0YY2OdM8FI2fsVh9Yt0ZNzMmmYKlB1CTueiY=;
 b=Z7O8s9cnh0f6LRXfNXavRhJxNrycghZXsSXEj/49tqh33ehpc+F27yP31prfdPp2lC
 ihbvs8CZzRAxz0OSH+1Vyx5EhN/TanARgTyDeGinHkNguc3MUK1tPgqmzZKqrT+VDlGD
 0n1GWXhjFotIT67/6pKqhhk2fgZLLBeiy0KeQXx8qD0ul8Z7UPmgzhs85k2WIOrnowm1
 X0mb3Ctlc0LV0TsDrxkYwJkwogHXmbk6F3vdVvhAWY3rV4HePJ1mTQtDVYv1R2h6C0M8
 tYx6h567JH52ssKfOX6JDIHP2MQgK45OXcIsiqaXD4l4mgkONgp0bPtXFBu29/I62ZFH
 DQXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jOxTsnY0YY2OdM8FI2fsVh9Yt0ZNzMmmYKlB1CTueiY=;
 b=jhuWJU0ajLuso4ww0o/YxuZHfpwbAUSmwebY7wRed5vCbn43n6I1zHi1Z8IdX15bn5
 BCfRtvPH8Qs/61aLoDy844dzifd3iAy6bI55NoPh0oCQFcuqJv8SQL5HM5F/NBaAa0Km
 r22FqaeMcw2S5guTgleoKeKM/QfLIAjSVAH1VJybNpf+eUtuTBGIt6QG9e1HdUb46gkM
 6DF6dla1kgD6FEU7c3l40cSom3K2Opkh5h0cW2PITi1DmRqaTFrQCW42AUKGvSFM+fg3
 40+0/OZOBReJzxzvrPkt/GOMFdJ1dahDgkJUUbKI7S2Quc+ADuSXeB4+yPOmo5Cjc2kp
 Jm6A==
X-Gm-Message-State: AJIora+ZBCdO7wa/X5DXGLHk4MyJ04bW7kK32ej0azbZOqeb8p+urKt4
 USO9BqcVqE2cVxS1QtU7KoiC8piDJl8=
X-Google-Smtp-Source: AGRyM1vK9l67Yx9CTBdrUOHW9YgbH7wXlZpJm+W+X6brs/KGY2x/R5tBPUWsQOEAqA++qqQPtX3Hbg==
X-Received: by 2002:ab0:698c:0:b0:382:c84e:60fa with SMTP id
 t12-20020ab0698c000000b00382c84e60famr5721921uaq.99.1657138194997; 
 Wed, 06 Jul 2022 13:09:54 -0700 (PDT)
Received: from balboa.ibmuc.com (201-27-97-88.dsl.telesp.net.br.
 [201.27.97.88]) by smtp.gmail.com with ESMTPSA id
 r22-20020a056122015600b003744975035asm788662vko.19.2022.07.06.13.09.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Jul 2022 13:09:54 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org, Frederic Barrat <fbarrat@linux.ibm.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PULL 02/34] ppc/pnv: attach phb3/phb4 root ports in QOM tree
Date: Wed,  6 Jul 2022 17:09:14 -0300
Message-Id: <20220706200946.471114-3-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220706200946.471114-1-danielhb413@gmail.com>
References: <20220706200946.471114-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::932;
 envelope-from=danielhb413@gmail.com; helo=mail-ua1-x932.google.com
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
Message-Id: <20220621173436.165912-3-danielhb413@gmail.com>
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


