Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC1221B38D1
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Apr 2020 09:21:59 +0200 (CEST)
Received: from localhost ([::1]:45406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jR9hm-0000PE-Qk
	for lists+qemu-devel@lfdr.de; Wed, 22 Apr 2020 03:21:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39880)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <its@irrelevant.dk>) id 1jR9WH-0001T5-9K
 for qemu-devel@nongnu.org; Wed, 22 Apr 2020 03:10:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <its@irrelevant.dk>) id 1jR9WF-00081q-F0
 for qemu-devel@nongnu.org; Wed, 22 Apr 2020 03:10:05 -0400
Received: from charlie.dont.surf ([128.199.63.193]:60334)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1jR9WD-0007Hk-55; Wed, 22 Apr 2020 03:10:01 -0400
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by charlie.dont.surf (Postfix) with ESMTPSA id 67FE7BFD25;
 Wed, 22 Apr 2020 07:09:39 +0000 (UTC)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-block@nongnu.org
Subject: [PATCH v3 15/16] nvme: factor out cmb/pmr setup
Date: Wed, 22 Apr 2020 09:09:26 +0200
Message-Id: <20200422070927.373048-16-its@irrelevant.dk>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200422070927.373048-1-its@irrelevant.dk>
References: <20200422070927.373048-1-its@irrelevant.dk>
MIME-Version: 1.0
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
---
 hw/block/nvme.c | 146 ++++++++++++++++++++++++++----------------------
 1 file changed, 79 insertions(+), 67 deletions(-)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 5dddb97a7394..bc4f6b20045b 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -57,6 +57,7 @@
 
 #define NVME_REG_SIZE 0x1000
 #define NVME_DB_SIZE  4
+#define NVME_CMB_BIR 2
 
 #define NVME_GUEST_ERR(trace, fmt, ...) \
     do { \
@@ -1436,6 +1437,78 @@ static void nvme_init_namespace(NvmeCtrl *n, NvmeNamespace *ns, Error **errp)
     id_ns->nuse = id_ns->ncap;
 }
 
+static void nvme_init_cmb(NvmeCtrl *n, PCIDevice *pci_dev)
+{
+    NVME_CMBLOC_SET_BIR(n->bar.cmbloc, NVME_CMB_BIR);
+    NVME_CMBLOC_SET_OFST(n->bar.cmbloc, 0);
+
+    NVME_CMBSZ_SET_SQS(n->bar.cmbsz, 1);
+    NVME_CMBSZ_SET_CQS(n->bar.cmbsz, 0);
+    NVME_CMBSZ_SET_LISTS(n->bar.cmbsz, 0);
+    NVME_CMBSZ_SET_RDS(n->bar.cmbsz, 1);
+    NVME_CMBSZ_SET_WDS(n->bar.cmbsz, 1);
+    NVME_CMBSZ_SET_SZU(n->bar.cmbsz, 2); /* MBs */
+    NVME_CMBSZ_SET_SZ(n->bar.cmbsz, n->params.cmb_size_mb);
+
+    n->cmbuf = g_malloc0(NVME_CMBSZ_GETSIZE(n->bar.cmbsz));
+    memory_region_init_io(&n->ctrl_mem, OBJECT(n), &nvme_cmb_ops, n,
+                          "nvme-cmb", NVME_CMBSZ_GETSIZE(n->bar.cmbsz));
+    pci_register_bar(pci_dev, NVME_CMBLOC_BIR(n->bar.cmbloc),
+                     PCI_BASE_ADDRESS_SPACE_MEMORY |
+                     PCI_BASE_ADDRESS_MEM_TYPE_64 |
+                     PCI_BASE_ADDRESS_MEM_PREFETCH, &n->ctrl_mem);
+}
+
+static void nvme_init_pmr(NvmeCtrl *n, PCIDevice *pci_dev)
+{
+
+    /* Controller Capabilities register */
+    NVME_CAP_SET_PMRS(n->bar.cap, 1);
+
+    /* PMR Capabities register */
+    n->bar.pmrcap = 0;
+    NVME_PMRCAP_SET_RDS(n->bar.pmrcap, 0);
+    NVME_PMRCAP_SET_WDS(n->bar.pmrcap, 0);
+    NVME_PMRCAP_SET_BIR(n->bar.pmrcap, 2);
+    NVME_PMRCAP_SET_PMRTU(n->bar.pmrcap, 0);
+    /* Turn on bit 1 support */
+    NVME_PMRCAP_SET_PMRWBM(n->bar.pmrcap, 0x02);
+    NVME_PMRCAP_SET_PMRTO(n->bar.pmrcap, 0);
+    NVME_PMRCAP_SET_CMSS(n->bar.pmrcap, 0);
+
+    /* PMR Control register */
+    n->bar.pmrctl = 0;
+    NVME_PMRCTL_SET_EN(n->bar.pmrctl, 0);
+
+    /* PMR Status register */
+    n->bar.pmrsts = 0;
+    NVME_PMRSTS_SET_ERR(n->bar.pmrsts, 0);
+    NVME_PMRSTS_SET_NRDY(n->bar.pmrsts, 0);
+    NVME_PMRSTS_SET_HSTS(n->bar.pmrsts, 0);
+    NVME_PMRSTS_SET_CBAI(n->bar.pmrsts, 0);
+
+    /* PMR Elasticity Buffer Size register */
+    n->bar.pmrebs = 0;
+    NVME_PMREBS_SET_PMRSZU(n->bar.pmrebs, 0);
+    NVME_PMREBS_SET_RBB(n->bar.pmrebs, 0);
+    NVME_PMREBS_SET_PMRWBZ(n->bar.pmrebs, 0);
+
+    /* PMR Sustained Write Throughput register */
+    n->bar.pmrswtp = 0;
+    NVME_PMRSWTP_SET_PMRSWTU(n->bar.pmrswtp, 0);
+    NVME_PMRSWTP_SET_PMRSWTV(n->bar.pmrswtp, 0);
+
+    /* PMR Memory Space Control register */
+    n->bar.pmrmsc = 0;
+    NVME_PMRMSC_SET_CMSE(n->bar.pmrmsc, 0);
+    NVME_PMRMSC_SET_CBA(n->bar.pmrmsc, 0);
+
+    pci_register_bar(pci_dev, NVME_PMRCAP_BIR(n->bar.pmrcap),
+                     PCI_BASE_ADDRESS_SPACE_MEMORY |
+                     PCI_BASE_ADDRESS_MEM_TYPE_64 |
+                     PCI_BASE_ADDRESS_MEM_PREFETCH, &n->pmrdev->mr);
+}
+
 static void nvme_init_pci(NvmeCtrl *n, PCIDevice *pci_dev)
 {
     uint8_t *pci_conf = pci_dev->config;
@@ -1450,6 +1523,12 @@ static void nvme_init_pci(NvmeCtrl *n, PCIDevice *pci_dev)
     pci_register_bar(pci_dev, 0, PCI_BASE_ADDRESS_SPACE_MEMORY |
                      PCI_BASE_ADDRESS_MEM_TYPE_64, &n->iomem);
     msix_init_exclusive_bar(pci_dev, n->params.max_ioqpairs + 1, 4, NULL);
+
+    if (n->params.cmb_size_mb) {
+        nvme_init_cmb(n, pci_dev);
+    } else if (n->pmrdev) {
+        nvme_init_pmr(n, pci_dev);
+    }
 }
 
 static void nvme_realize(PCIDevice *pci_dev, Error **errp)
@@ -1511,73 +1590,6 @@ static void nvme_realize(PCIDevice *pci_dev, Error **errp)
     n->bar.vs = 0x00010200;
     n->bar.intmc = n->bar.intms = 0;
 
-    if (n->params.cmb_size_mb) {
-
-        NVME_CMBLOC_SET_BIR(n->bar.cmbloc, 2);
-        NVME_CMBLOC_SET_OFST(n->bar.cmbloc, 0);
-
-        NVME_CMBSZ_SET_SQS(n->bar.cmbsz, 1);
-        NVME_CMBSZ_SET_CQS(n->bar.cmbsz, 0);
-        NVME_CMBSZ_SET_LISTS(n->bar.cmbsz, 0);
-        NVME_CMBSZ_SET_RDS(n->bar.cmbsz, 1);
-        NVME_CMBSZ_SET_WDS(n->bar.cmbsz, 1);
-        NVME_CMBSZ_SET_SZU(n->bar.cmbsz, 2); /* MBs */
-        NVME_CMBSZ_SET_SZ(n->bar.cmbsz, n->params.cmb_size_mb);
-
-        n->cmbuf = g_malloc0(NVME_CMBSZ_GETSIZE(n->bar.cmbsz));
-        memory_region_init_io(&n->ctrl_mem, OBJECT(n), &nvme_cmb_ops, n,
-                              "nvme-cmb", NVME_CMBSZ_GETSIZE(n->bar.cmbsz));
-        pci_register_bar(pci_dev, NVME_CMBLOC_BIR(n->bar.cmbloc),
-            PCI_BASE_ADDRESS_SPACE_MEMORY | PCI_BASE_ADDRESS_MEM_TYPE_64 |
-            PCI_BASE_ADDRESS_MEM_PREFETCH, &n->ctrl_mem);
-
-    } else if (n->pmrdev) {
-        /* Controller Capabilities register */
-        NVME_CAP_SET_PMRS(n->bar.cap, 1);
-
-        /* PMR Capabities register */
-        n->bar.pmrcap = 0;
-        NVME_PMRCAP_SET_RDS(n->bar.pmrcap, 0);
-        NVME_PMRCAP_SET_WDS(n->bar.pmrcap, 0);
-        NVME_PMRCAP_SET_BIR(n->bar.pmrcap, 2);
-        NVME_PMRCAP_SET_PMRTU(n->bar.pmrcap, 0);
-        /* Turn on bit 1 support */
-        NVME_PMRCAP_SET_PMRWBM(n->bar.pmrcap, 0x02);
-        NVME_PMRCAP_SET_PMRTO(n->bar.pmrcap, 0);
-        NVME_PMRCAP_SET_CMSS(n->bar.pmrcap, 0);
-
-        /* PMR Control register */
-        n->bar.pmrctl = 0;
-        NVME_PMRCTL_SET_EN(n->bar.pmrctl, 0);
-
-        /* PMR Status register */
-        n->bar.pmrsts = 0;
-        NVME_PMRSTS_SET_ERR(n->bar.pmrsts, 0);
-        NVME_PMRSTS_SET_NRDY(n->bar.pmrsts, 0);
-        NVME_PMRSTS_SET_HSTS(n->bar.pmrsts, 0);
-        NVME_PMRSTS_SET_CBAI(n->bar.pmrsts, 0);
-
-        /* PMR Elasticity Buffer Size register */
-        n->bar.pmrebs = 0;
-        NVME_PMREBS_SET_PMRSZU(n->bar.pmrebs, 0);
-        NVME_PMREBS_SET_RBB(n->bar.pmrebs, 0);
-        NVME_PMREBS_SET_PMRWBZ(n->bar.pmrebs, 0);
-
-        /* PMR Sustained Write Throughput register */
-        n->bar.pmrswtp = 0;
-        NVME_PMRSWTP_SET_PMRSWTU(n->bar.pmrswtp, 0);
-        NVME_PMRSWTP_SET_PMRSWTV(n->bar.pmrswtp, 0);
-
-        /* PMR Memory Space Control register */
-        n->bar.pmrmsc = 0;
-        NVME_PMRMSC_SET_CMSE(n->bar.pmrmsc, 0);
-        NVME_PMRMSC_SET_CBA(n->bar.pmrmsc, 0);
-
-        pci_register_bar(pci_dev, NVME_PMRCAP_BIR(n->bar.pmrcap),
-            PCI_BASE_ADDRESS_SPACE_MEMORY | PCI_BASE_ADDRESS_MEM_TYPE_64 |
-            PCI_BASE_ADDRESS_MEM_PREFETCH, &n->pmrdev->mr);
-    }
-
     for (i = 0; i < n->num_namespaces; i++) {
         nvme_init_namespace(n, &n->namespaces[i], &local_err);
         if (local_err) {
-- 
2.26.2


