Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB7201B38CD
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Apr 2020 09:21:29 +0200 (CEST)
Received: from localhost ([::1]:45402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jR9hJ-0008Ii-0b
	for lists+qemu-devel@lfdr.de; Wed, 22 Apr 2020 03:21:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39950)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <its@irrelevant.dk>) id 1jR9WN-0001Wd-WD
 for qemu-devel@nongnu.org; Wed, 22 Apr 2020 03:10:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <its@irrelevant.dk>) id 1jR9WE-0007zs-FL
 for qemu-devel@nongnu.org; Wed, 22 Apr 2020 03:10:11 -0400
Received: from charlie.dont.surf ([128.199.63.193]:60314)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1jR9WC-0007HL-AF; Wed, 22 Apr 2020 03:10:00 -0400
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by charlie.dont.surf (Postfix) with ESMTPSA id 9CA83BFB37;
 Wed, 22 Apr 2020 07:09:38 +0000 (UTC)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-block@nongnu.org
Subject: [PATCH v3 13/16] nvme: factor out namespace setup
Date: Wed, 22 Apr 2020 09:09:24 +0200
Message-Id: <20200422070927.373048-14-its@irrelevant.dk>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200422070927.373048-1-its@irrelevant.dk>
References: <20200422070927.373048-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=128.199.63.193; envelope-from=its@irrelevant.dk;
 helo=charlie.dont.surf
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/22 02:19:11
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Received-From: 128.199.63.193
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>, Beata Michalska <beata.michalska@linaro.org>,
 Klaus Jensen <k.jensen@samsung.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Klaus Jensen <its@irrelevant.dk>,
 Keith Busch <kbusch@kernel.org>, Javier Gonzalez <javier.gonz@samsung.com>,
 Maxim Levitsky <mlevitsk@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Maxim Levitsky  <mlevitsk@redhat.com>
Reviewed-by: Keith Busch <kbusch@kernel.org>
---
 hw/block/nvme.c | 46 ++++++++++++++++++++++++++--------------------
 1 file changed, 26 insertions(+), 20 deletions(-)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index e3a08c6fb0d1..77aaad5633f5 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -1415,6 +1415,27 @@ static void nvme_init_blk(NvmeCtrl *n, Error **errp)
                                   false, errp);
 }
 
+static void nvme_init_namespace(NvmeCtrl *n, NvmeNamespace *ns, Error **errp)
+{
+    int64_t bs_size;
+    NvmeIdNs *id_ns = &ns->id_ns;
+
+    bs_size = blk_getlength(n->conf.blk);
+    if (bs_size < 0) {
+        error_setg_errno(errp, -bs_size, "could not get backing file size");
+        return;
+    }
+
+    n->ns_size = bs_size;
+
+    id_ns->lbaf[0].ds = BDRV_SECTOR_BITS;
+    id_ns->nsze = cpu_to_le64(nvme_ns_nlbas(n, ns));
+
+    /* no thin provisioning */
+    id_ns->ncap = id_ns->nsze;
+    id_ns->nuse = id_ns->ncap;
+}
+
 static void nvme_realize(PCIDevice *pci_dev, Error **errp)
 {
     NvmeCtrl *n = NVME(pci_dev);
@@ -1422,7 +1443,6 @@ static void nvme_realize(PCIDevice *pci_dev, Error **errp)
     Error *local_err = NULL;
 
     int i;
-    int64_t bs_size;
     uint8_t *pci_conf;
 
     nvme_check_constraints(n, &local_err);
@@ -1433,12 +1453,6 @@ static void nvme_realize(PCIDevice *pci_dev, Error **errp)
 
     nvme_init_state(n);
 
-    bs_size = blk_getlength(n->conf.blk);
-    if (bs_size < 0) {
-        error_setg(errp, "could not get backing file size");
-        return;
-    }
-
     nvme_init_blk(n, &local_err);
     if (local_err) {
         error_propagate(errp, local_err);
@@ -1451,8 +1465,6 @@ static void nvme_realize(PCIDevice *pci_dev, Error **errp)
     pci_config_set_class(pci_dev->config, PCI_CLASS_STORAGE_EXPRESS);
     pcie_endpoint_cap_init(pci_dev, 0x80);
 
-    n->ns_size = bs_size / (uint64_t)n->num_namespaces;
-
     memory_region_init_io(&n->iomem, OBJECT(n), &nvme_mmio_ops, n,
                           "nvme", n->reg_size);
     pci_register_bar(pci_dev, 0,
@@ -1561,17 +1573,11 @@ static void nvme_realize(PCIDevice *pci_dev, Error **errp)
     }
 
     for (i = 0; i < n->num_namespaces; i++) {
-        NvmeNamespace *ns = &n->namespaces[i];
-        NvmeIdNs *id_ns = &ns->id_ns;
-        id_ns->nsfeat = 0;
-        id_ns->nlbaf = 0;
-        id_ns->flbas = 0;
-        id_ns->mc = 0;
-        id_ns->dpc = 0;
-        id_ns->dps = 0;
-        id_ns->lbaf[0].ds = BDRV_SECTOR_BITS;
-        id_ns->ncap  = id_ns->nuse = id_ns->nsze =
-            cpu_to_le64(nvme_ns_nlbas(n, ns));
+        nvme_init_namespace(n, &n->namespaces[i], &local_err);
+        if (local_err) {
+            error_propagate(errp, local_err);
+            return;
+        }
     }
 }
 
-- 
2.26.2


