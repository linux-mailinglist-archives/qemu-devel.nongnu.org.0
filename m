Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1D8647C1BC
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Dec 2021 15:42:48 +0100 (CET)
Received: from localhost ([::1]:49554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzgLn-0008KD-RY
	for lists+qemu-devel@lfdr.de; Tue, 21 Dec 2021 09:42:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasz.maniak@linux.intel.com>)
 id 1mzgEa-0001ZL-KX; Tue, 21 Dec 2021 09:35:20 -0500
Received: from mga07.intel.com ([134.134.136.100]:43286)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasz.maniak@linux.intel.com>)
 id 1mzgEY-0002Wp-Sg; Tue, 21 Dec 2021 09:35:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1640097318; x=1671633318;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2MR6/w/fGtNYYKHxqwttAooKoYZin+dxDn8jPPdN8Sw=;
 b=japgEYy/IKx4uwuL/PqTm4HwXrgtR3+xuFx89RzfImOuv0kITAimN9L5
 Vprs3p1tSJE/2Zv14J+CSbum+xlyocH0tk5Y73aaJIc1CiXIwiRFCOdXu
 nIUCKjErtlzj5rzM1DDXVsKmF4zhPXmFq9uKfbTooxv39IKDaZRE7gopD
 eIKo6+yUvLYbZo1irKN7n5S5+Qii7WhQxqJq7Kh/GBjO+bfd72hc3ja6X
 ZhpMiSxBAKE5rH5woAS13q4qZZt0gwvD9GJjbSWsp3Uk3uzJDlcMSX6Dl
 gPLgKriCadZ38R7+nyDbf/0LLvGsRFHRDBj4O6uat1wu6cwo0gyUAOldw Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10204"; a="303773007"
X-IronPort-AV: E=Sophos;i="5.88,223,1635231600"; d="scan'208";a="303773007"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2021 06:35:16 -0800
X-IronPort-AV: E=Sophos;i="5.88,223,1635231600"; d="scan'208";a="484429384"
Received: from lmaniak-dev.igk.intel.com ([10.55.249.72])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2021 06:35:14 -0800
From: Lukasz Maniak <lukasz.maniak@linux.intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 11/15] hw/nvme: Calculate BAR attributes in a function
Date: Tue, 21 Dec 2021 15:32:42 +0100
Message-Id: <20211221143246.2052050-12-lukasz.maniak@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211221143246.2052050-1-lukasz.maniak@linux.intel.com>
References: <20211221143246.2052050-1-lukasz.maniak@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=134.134.136.100;
 envelope-from=lukasz.maniak@linux.intel.com; helo=mga07.intel.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.203,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Klaus Jensen <its@irrelevant.dk>, Keith Busch <kbusch@kernel.org>,
 Lukasz Maniak <lukasz.maniak@linux.intel.com>, qemu-block@nongnu.org,
 =?UTF-8?q?=C5=81ukasz=20Gieryk?= <lukasz.gieryk@linux.intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Łukasz Gieryk <lukasz.gieryk@linux.intel.com>

An NVMe device with SR-IOV capability calculates the BAR size
differently for PF and VF, so it makes sense to extract the common code
to a separate function.

Signed-off-by: Łukasz Gieryk <lukasz.gieryk@linux.intel.com>
---
 hw/nvme/ctrl.c | 45 +++++++++++++++++++++++++++++++--------------
 1 file changed, 31 insertions(+), 14 deletions(-)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index a4b11b201a..a26abaea36 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -6429,6 +6429,34 @@ static void nvme_init_pmr(NvmeCtrl *n, PCIDevice *pci_dev)
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
@@ -6468,7 +6496,7 @@ static int nvme_add_pm_capability(PCIDevice *pci_dev, uint8_t offset)
 static int nvme_init_pci(NvmeCtrl *n, PCIDevice *pci_dev, Error **errp)
 {
     uint8_t *pci_conf = pci_dev->config;
-    uint64_t bar_size, msix_table_size, msix_pba_size;
+    uint64_t bar_size;
     unsigned msix_table_offset, msix_pba_offset;
     int ret;
 
@@ -6494,19 +6522,8 @@ static int nvme_init_pci(NvmeCtrl *n, PCIDevice *pci_dev, Error **errp)
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


