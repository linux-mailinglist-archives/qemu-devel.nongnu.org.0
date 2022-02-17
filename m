Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63E824BA79A
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Feb 2022 18:58:47 +0100 (CET)
Received: from localhost ([::1]:43116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKl3G-0002rl-Eh
	for lists+qemu-devel@lfdr.de; Thu, 17 Feb 2022 12:58:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasz.maniak@linux.intel.com>)
 id 1nKksd-00037y-TA; Thu, 17 Feb 2022 12:47:47 -0500
Received: from mga12.intel.com ([192.55.52.136]:31708)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasz.maniak@linux.intel.com>)
 id 1nKksa-0007HN-Jg; Thu, 17 Feb 2022 12:47:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645120064; x=1676656064;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mjrh7oOkn53Z95tzcYJCjtWXuMp++IM/b7VLaKsht+4=;
 b=a2PKOtVQs4P7CpdEPvQLp9hg/qUva+HQoor0ruUqSCKo6iQKo1Z+6+CT
 BVRB0WytTt4L1N5kPv7hTjNkIeBakOy/iL2O8Md99LeP72siW+JloDEM8
 ESwU62UpZNGi6N4pcr+H5qc5KdFNRZqJcjZa6tnF0aye9tYrt3bs+npPF
 w8LUbLzKoUDeESdW+yY0fdCxPHOc2TGuV6CJ+MQ2f98q48cr+doGhL9wF
 FvlddegbuQMYwjKrhgx2SyLDvXe8ypkzM6jAtbMCOPK8FBPYFo2I22F4T
 OAxV/fweMHXGUh9zoI5Hm3hgWS7IAfIVk/7U+iV9QrZsFHZ59N05gvH2X g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10261"; a="230894101"
X-IronPort-AV: E=Sophos;i="5.88,376,1635231600"; d="scan'208";a="230894101"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2022 09:47:12 -0800
X-IronPort-AV: E=Sophos;i="5.88,376,1635231600"; d="scan'208";a="545746224"
Received: from lmaniak-dev.igk.intel.com ([10.55.249.72])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2022 09:47:10 -0800
From: Lukasz Maniak <lukasz.maniak@linux.intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 11/15] hw/nvme: Calculate BAR attributes in a function
Date: Thu, 17 Feb 2022 18:45:00 +0100
Message-Id: <20220217174504.1051716-12-lukasz.maniak@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220217174504.1051716-1-lukasz.maniak@linux.intel.com>
References: <20220217174504.1051716-1-lukasz.maniak@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=192.55.52.136;
 envelope-from=lukasz.maniak@linux.intel.com; helo=mga12.intel.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_NONE=0.001,
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
Cc: qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Lukasz Maniak <lukasz.maniak@linux.intel.com>, Keith Busch <kbusch@kernel.org>,
 =?UTF-8?q?=C5=81ukasz=20Gieryk?= <lukasz.gieryk@linux.intel.com>,
 Klaus Jensen <its@irrelevant.dk>
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
index 6abec8e4369..73707565345 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -6584,6 +6584,34 @@ static void nvme_init_pmr(NvmeCtrl *n, PCIDevice *pci_dev)
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
@@ -6623,7 +6651,7 @@ static int nvme_add_pm_capability(PCIDevice *pci_dev, uint8_t offset)
 static int nvme_init_pci(NvmeCtrl *n, PCIDevice *pci_dev, Error **errp)
 {
     uint8_t *pci_conf = pci_dev->config;
-    uint64_t bar_size, msix_table_size, msix_pba_size;
+    uint64_t bar_size;
     unsigned msix_table_offset, msix_pba_offset;
     int ret;
 
@@ -6649,19 +6677,8 @@ static int nvme_init_pci(NvmeCtrl *n, PCIDevice *pci_dev, Error **errp)
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


