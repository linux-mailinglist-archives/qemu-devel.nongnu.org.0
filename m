Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F1BD49D111
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Jan 2022 18:43:29 +0100 (CET)
Received: from localhost ([::1]:44594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCmKO-0002Zs-Nt
	for lists+qemu-devel@lfdr.de; Wed, 26 Jan 2022 12:43:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasz.maniak@linux.intel.com>)
 id 1nCltd-00071c-1W; Wed, 26 Jan 2022 12:15:51 -0500
Received: from mga11.intel.com ([192.55.52.93]:54264)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasz.maniak@linux.intel.com>)
 id 1nClta-00021M-Kl; Wed, 26 Jan 2022 12:15:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643217346; x=1674753346;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lHlmUgwDkpRSfdB6iGSqnB6WVl1S3RyydGLqmVuC5yM=;
 b=VXLn3jo6xwTQ6D4woyTzFqaf8bKUD8qcowMOIGce8iuJA8EBJbKtmemc
 ox+KnVbBhsGieKKMeh9mUZCAIWJV0JLYo1ga9fxWvYx0usHZwVIiilAnH
 39Lr/ZA7YmVvbPOY+29ZqUeD/+5lsCb3rl3lRNVk9tlzv+qRQ8cRHG65I
 iNPcD1w1Ml1gnI+NPUSyYTlI+iGWC0aMR1AJ3MiGdssTjRWu4N9bFiZW2
 2RDDYmEMSzJis8N2qfTz1cwLoYBFIa7sPn25yZSBsp5RlrO8gfRNCFPhK
 68/vClJKJduj7htEbX4x24TPsyeRCV7aVwSRkjqqtJVDa+s3G4qZYp/ab w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10238"; a="244199404"
X-IronPort-AV: E=Sophos;i="5.88,318,1635231600"; d="scan'208";a="244199404"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2022 09:13:24 -0800
X-IronPort-AV: E=Sophos;i="5.88,318,1635231600"; d="scan'208";a="535254287"
Received: from lmaniak-dev.igk.intel.com ([10.55.249.72])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2022 09:13:22 -0800
From: Lukasz Maniak <lukasz.maniak@linux.intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 11/15] hw/nvme: Calculate BAR attributes in a function
Date: Wed, 26 Jan 2022 18:11:16 +0100
Message-Id: <20220126171120.2939152-12-lukasz.maniak@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220126171120.2939152-1-lukasz.maniak@linux.intel.com>
References: <20220126171120.2939152-1-lukasz.maniak@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=192.55.52.93;
 envelope-from=lukasz.maniak@linux.intel.com; helo=mga11.intel.com
X-Spam_score_int: -71
X-Spam_score: -7.2
X-Spam_bar: -------
X-Spam_report: (-7.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.155,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
index 40eb6bd1a8..e101cb7d7c 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -6431,6 +6431,34 @@ static void nvme_init_pmr(NvmeCtrl *n, PCIDevice *pci_dev)
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
@@ -6470,7 +6498,7 @@ static int nvme_add_pm_capability(PCIDevice *pci_dev, uint8_t offset)
 static int nvme_init_pci(NvmeCtrl *n, PCIDevice *pci_dev, Error **errp)
 {
     uint8_t *pci_conf = pci_dev->config;
-    uint64_t bar_size, msix_table_size, msix_pba_size;
+    uint64_t bar_size;
     unsigned msix_table_offset, msix_pba_offset;
     int ret;
 
@@ -6496,19 +6524,8 @@ static int nvme_init_pci(NvmeCtrl *n, PCIDevice *pci_dev, Error **errp)
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


