Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF9C34DE1CD
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Mar 2022 20:32:18 +0100 (CET)
Received: from localhost ([::1]:41478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nVIKe-0007x9-Ls
	for lists+qemu-devel@lfdr.de; Fri, 18 Mar 2022 15:32:16 -0400
Received: from eggs.gnu.org ([209.51.188.92]:43708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasz.maniak@linux.intel.com>)
 id 1nVI9e-0006Pn-Ay; Fri, 18 Mar 2022 15:20:54 -0400
Received: from mga17.intel.com ([192.55.52.151]:1694)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasz.maniak@linux.intel.com>)
 id 1nVI9c-0002He-EK; Fri, 18 Mar 2022 15:20:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647631252; x=1679167252;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UW+PyXgUIoTf1qfjizJOKmue6njqjznCMgitPdiD4DM=;
 b=Ua+MQ299KnS4IwPC1TJoj+g45+6gDaQO77kciy+kpO/qhKR7PTgj6AtN
 l178RbSSt4vk964ed4ikBZtOC8elrTF5GrCVilutrWRYco1qRElqbJnu8
 0c2/xQ28x5x5vA5DgIXrEbR1xFD6roOCDaz1dcYS97Sc1SSUPrj7x580+
 j3ABJuflpggl5kfGfUCHP9Lm9iB74cLpRao/mPb9ujAfRn06AmWduiRpW
 h0ZxHr/wrV0N+3BX8TXkJ7FReDNmDS9cx1aC5EyuYQ+muzP1FyR6goJIm
 hs0JUDMcoL2piCrPJi1OxnOgGoeJHGekF5FbmThjWvL+85aKi/KkwCsBv w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10290"; a="237816948"
X-IronPort-AV: E=Sophos;i="5.90,192,1643702400"; d="scan'208";a="237816948"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2022 12:20:47 -0700
X-IronPort-AV: E=Sophos;i="5.90,192,1643702400"; d="scan'208";a="541994318"
Received: from lmaniak-dev.elements.local ([10.55.249.72])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2022 12:20:43 -0700
From: Lukasz Maniak <lukasz.maniak@linux.intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 07/12] hw/nvme: Calculate BAR attributes in a function
Date: Fri, 18 Mar 2022 20:18:14 +0100
Message-Id: <20220318191819.1711831-8-lukasz.maniak@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220318191819.1711831-1-lukasz.maniak@linux.intel.com>
References: <20220318191819.1711831-1-lukasz.maniak@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=192.55.52.151;
 envelope-from=lukasz.maniak@linux.intel.com; helo=mga17.intel.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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
Cc: fam@euphon.net, kwolf@redhat.com, lukasz.maniak@linux.intel.com,
 stefanha@redhat.com, qemu-block@nongnu.org, mst@redhat.com,
 k.jensen@samsung.com, armbru@redhat.com, f4bug@amsat.org, kbusch@kernel.org,
 its@irrelevant.dk, hreitz@redhat.com, xypron.glpk@gmx.de,
 lukasz.gieryk@linux.intel.com, ani@anisinha.ca, imammedo@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Łukasz Gieryk <lukasz.gieryk@linux.intel.com>

An NVMe device with SR-IOV capability calculates the BAR size
differently for PF and VF, so it makes sense to extract the common code
to a separate function.

Signed-off-by: Łukasz Gieryk <lukasz.gieryk@linux.intel.com>
Reviewed-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/nvme/ctrl.c | 45 +++++++++++++++++++++++++++++++--------------
 1 file changed, 31 insertions(+), 14 deletions(-)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index f34d73a00c8..f0554a07c40 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -6728,6 +6728,34 @@ static void nvme_init_pmr(NvmeCtrl *n, PCIDevice *pci_dev)
     memory_region_set_enabled(&n->pmr.dev->mr, false);
 }
 
+static uint64_t nvme_bar_size(unsigned total_queues, unsigned total_irqs,
+                              unsigned *msix_table_offset,
+                              unsigned *msix_pba_offset)
+{
+    uint64_t bar_size, msix_table_size, msix_pba_size;
+
+    bar_size = sizeof(NvmeBar) + 2 * total_queues * NVME_DB_SIZE;
+    bar_size = QEMU_ALIGN_UP(bar_size, 4 * KiB);
+
+    if (msix_table_offset) {
+        *msix_table_offset = bar_size;
+    }
+
+    msix_table_size = PCI_MSIX_ENTRY_SIZE * total_irqs;
+    bar_size += msix_table_size;
+    bar_size = QEMU_ALIGN_UP(bar_size, 4 * KiB);
+
+    if (msix_pba_offset) {
+        *msix_pba_offset = bar_size;
+    }
+
+    msix_pba_size = QEMU_ALIGN_UP(total_irqs, 64) / 8;
+    bar_size += msix_pba_size;
+
+    bar_size = pow2ceil(bar_size);
+    return bar_size;
+}
+
 static void nvme_init_sriov(NvmeCtrl *n, PCIDevice *pci_dev, uint16_t offset,
                             uint64_t bar_size)
 {
@@ -6767,7 +6795,7 @@ static int nvme_add_pm_capability(PCIDevice *pci_dev, uint8_t offset)
 static int nvme_init_pci(NvmeCtrl *n, PCIDevice *pci_dev, Error **errp)
 {
     uint8_t *pci_conf = pci_dev->config;
-    uint64_t bar_size, msix_table_size, msix_pba_size;
+    uint64_t bar_size;
     unsigned msix_table_offset, msix_pba_offset;
     int ret;
 
@@ -6793,19 +6821,8 @@ static int nvme_init_pci(NvmeCtrl *n, PCIDevice *pci_dev, Error **errp)
     }
 
     /* add one to max_ioqpairs to account for the admin queue pair */
-    bar_size = sizeof(NvmeBar) +
-               2 * (n->params.max_ioqpairs + 1) * NVME_DB_SIZE;
-    bar_size = QEMU_ALIGN_UP(bar_size, 4 * KiB);
-    msix_table_offset = bar_size;
-    msix_table_size = PCI_MSIX_ENTRY_SIZE * n->params.msix_qsize;
-
-    bar_size += msix_table_size;
-    bar_size = QEMU_ALIGN_UP(bar_size, 4 * KiB);
-    msix_pba_offset = bar_size;
-    msix_pba_size = QEMU_ALIGN_UP(n->params.msix_qsize, 64) / 8;
-
-    bar_size += msix_pba_size;
-    bar_size = pow2ceil(bar_size);
+    bar_size = nvme_bar_size(n->params.max_ioqpairs + 1, n->params.msix_qsize,
+                             &msix_table_offset, &msix_pba_offset);
 
     memory_region_init(&n->bar0, OBJECT(n), "nvme-bar0", bar_size);
     memory_region_init_io(&n->iomem, OBJECT(n), &nvme_mmio_ops, n, "nvme",
-- 
2.25.1


