Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90C8C4536F2
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Nov 2021 17:09:06 +0100 (CET)
Received: from localhost ([::1]:51078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mn117-00016N-NO
	for lists+qemu-devel@lfdr.de; Tue, 16 Nov 2021 11:09:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasz.gieryk@linux.intel.com>)
 id 1mn0lt-00062F-Fb; Tue, 16 Nov 2021 10:53:22 -0500
Received: from mga04.intel.com ([192.55.52.120]:64391)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasz.gieryk@linux.intel.com>)
 id 1mn0lr-0007fn-Fa; Tue, 16 Nov 2021 10:53:21 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10169"; a="232438899"
X-IronPort-AV: E=Sophos;i="5.87,239,1631602800"; d="scan'208";a="232438899"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2021 07:53:18 -0800
X-IronPort-AV: E=Sophos;i="5.87,239,1631602800"; d="scan'208";a="454494471"
Received: from lgieryk-lnx.igk.intel.com ([172.22.230.153])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2021 07:53:16 -0800
From: =?UTF-8?q?=C5=81ukasz=20Gieryk?= <lukasz.gieryk@linux.intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 10/15] hw/nvme: Remove reg_size variable and update BAR0
 size calculation
Date: Tue, 16 Nov 2021 16:34:41 +0100
Message-Id: <20211116153446.317143-11-lukasz.gieryk@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211116153446.317143-1-lukasz.gieryk@linux.intel.com>
References: <20211116153446.317143-1-lukasz.gieryk@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=192.55.52.120;
 envelope-from=lukasz.gieryk@linux.intel.com; helo=mga04.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
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
Cc: Keith Busch <kbusch@kernel.org>,
 =?UTF-8?q?=C5=81ukasz=20Gieryk?= <lukasz.gieryk@linux.intel.com>,
 Klaus Jensen <its@irrelevant.dk>,
 Lukasz Maniak <lukasz.maniak@linux.intel.com>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The n->reg_size parameter unnecessarily splits the BAR0 size calculation
in two phases; removed to simplify the code.

With all the calculations done in one place, it seems the pow2ceil,
applied originally to reg_size, is unnecessary. The rounding should
happen as the last step, when BAR size includes Nvme registers, queue
registers, and MSIX-related space.

Finally, the size of the mmio memory region is extended to cover the 1st
4KiB padding (see the map below). Access to this range is handled as
interaction with a non-existing queue and generates an error trace, so
actually nothing changes, while the reg_size variable is no longer needed.

    --------------------
    |      BAR0        |
    --------------------
    [Nvme Registers    ]
    [Queues            ]
    [power-of-2 padding] - removed in this patch
    [4KiB padding (1)  ]
    [MSIX TABLE        ]
    [4KiB padding (2)  ]
    [MSIX PBA          ]
    [power-of-2 padding]

Signed-off-by: Łukasz Gieryk <lukasz.gieryk@linux.intel.com>
---
 hw/nvme/ctrl.c | 10 +++++-----
 hw/nvme/nvme.h |  1 -
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index d502917d98..2f3b6b5a82 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -6351,9 +6351,6 @@ static void nvme_init_state(NvmeCtrl *n)
     n->conf_ioqpairs = n->params.max_ioqpairs;
     n->conf_msix_qsize = n->params.msix_qsize;
 
-    /* add one to max_ioqpairs to account for the admin queue pair */
-    n->reg_size = pow2ceil(sizeof(NvmeBar) +
-                           2 * (n->params.max_ioqpairs + 1) * NVME_DB_SIZE);
     n->sq = g_new0(NvmeSQueue *, n->params.max_ioqpairs + 1);
     n->cq = g_new0(NvmeCQueue *, n->params.max_ioqpairs + 1);
     n->temperature = NVME_TEMPERATURE;
@@ -6476,7 +6473,10 @@ static int nvme_init_pci(NvmeCtrl *n, PCIDevice *pci_dev, Error **errp)
         pcie_ari_init(pci_dev, 0x100, 1);
     }
 
-    bar_size = QEMU_ALIGN_UP(n->reg_size, 4 * KiB);
+    /* add one to max_ioqpairs to account for the admin queue pair */
+    bar_size = sizeof(NvmeBar) +
+               2 * (n->params.max_ioqpairs + 1) * NVME_DB_SIZE;
+    bar_size = QEMU_ALIGN_UP(bar_size, 4 * KiB);
     msix_table_offset = bar_size;
     msix_table_size = PCI_MSIX_ENTRY_SIZE * n->params.msix_qsize;
 
@@ -6490,7 +6490,7 @@ static int nvme_init_pci(NvmeCtrl *n, PCIDevice *pci_dev, Error **errp)
 
     memory_region_init(&n->bar0, OBJECT(n), "nvme-bar0", bar_size);
     memory_region_init_io(&n->iomem, OBJECT(n), &nvme_mmio_ops, n, "nvme",
-                          n->reg_size);
+                          msix_table_offset);
     memory_region_add_subregion(&n->bar0, 0, &n->iomem);
 
     if (pci_is_vf(pci_dev)) {
diff --git a/hw/nvme/nvme.h b/hw/nvme/nvme.h
index 927890b490..1401ac3904 100644
--- a/hw/nvme/nvme.h
+++ b/hw/nvme/nvme.h
@@ -414,7 +414,6 @@ typedef struct NvmeCtrl {
     uint16_t    max_prp_ents;
     uint16_t    cqe_size;
     uint16_t    sqe_size;
-    uint32_t    reg_size;
     uint32_t    max_q_ents;
     uint8_t     outstanding_aers;
     uint32_t    irq_status;
-- 
2.25.1


