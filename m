Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A69F049D11C
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Jan 2022 18:47:41 +0100 (CET)
Received: from localhost ([::1]:53260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCmOS-0000kB-GS
	for lists+qemu-devel@lfdr.de; Wed, 26 Jan 2022 12:47:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasz.maniak@linux.intel.com>)
 id 1nCltd-00071g-23; Wed, 26 Jan 2022 12:15:51 -0500
Received: from mga11.intel.com ([192.55.52.93]:54256)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasz.maniak@linux.intel.com>)
 id 1nClta-00020Y-Il; Wed, 26 Jan 2022 12:15:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643217346; x=1674753346;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HEtJg0gXvJoG6EbYzT0Tyn45SuW9LhPOEFbNcZkNE90=;
 b=jgftC4eDwni5xCatoevLl8B3NZkM0Gq/XYDcraVzo0g/KNQhqekRjN5b
 6TgfuUMbDqZdVnaUpydk7INXRl8U5aLUbQ6GObGpBypl95tEvw7Jr5RAQ
 TAoSYuZ5SyN6CKuG/AtGIL+5DHINpD2Nj+vW83IoUSQZHjcPUTF2h8KcI
 m4OBOWD5UOEgGFMgErwwrBrbCswb3MRgnJkOuJ3GICECt+43yHBrrGL7h
 OAHJFJVF6QvK9o1l5C+TnPIcxLAPQG1zWTNAjITG7r8f/OA5uWMm/br6C
 BypvDYqW7iAkXQOcsXVVoTHfsc92iJgFuse0ae0cY0fPYpAMqxUORYwib Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10238"; a="244199387"
X-IronPort-AV: E=Sophos;i="5.88,318,1635231600"; d="scan'208";a="244199387"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2022 09:13:22 -0800
X-IronPort-AV: E=Sophos;i="5.88,318,1635231600"; d="scan'208";a="535254278"
Received: from lmaniak-dev.igk.intel.com ([10.55.249.72])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2022 09:13:20 -0800
From: Lukasz Maniak <lukasz.maniak@linux.intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 10/15] hw/nvme: Remove reg_size variable and update BAR0
 size calculation
Date: Wed, 26 Jan 2022 18:11:15 +0100
Message-Id: <20220126171120.2939152-11-lukasz.maniak@linux.intel.com>
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
index 426507ca8a..40eb6bd1a8 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -6372,9 +6372,6 @@ static void nvme_init_state(NvmeCtrl *n)
     n->conf_ioqpairs = n->params.max_ioqpairs;
     n->conf_msix_qsize = n->params.msix_qsize;
 
-    /* add one to max_ioqpairs to account for the admin queue pair */
-    n->reg_size = pow2ceil(sizeof(NvmeBar) +
-                           2 * (n->params.max_ioqpairs + 1) * NVME_DB_SIZE);
     n->sq = g_new0(NvmeSQueue *, n->params.max_ioqpairs + 1);
     n->cq = g_new0(NvmeCQueue *, n->params.max_ioqpairs + 1);
     n->temperature = NVME_TEMPERATURE;
@@ -6498,7 +6495,10 @@ static int nvme_init_pci(NvmeCtrl *n, PCIDevice *pci_dev, Error **errp)
         pcie_ari_init(pci_dev, 0x100, 1);
     }
 
-    bar_size = QEMU_ALIGN_UP(n->reg_size, 4 * KiB);
+    /* add one to max_ioqpairs to account for the admin queue pair */
+    bar_size = sizeof(NvmeBar) +
+               2 * (n->params.max_ioqpairs + 1) * NVME_DB_SIZE;
+    bar_size = QEMU_ALIGN_UP(bar_size, 4 * KiB);
     msix_table_offset = bar_size;
     msix_table_size = PCI_MSIX_ENTRY_SIZE * n->params.msix_qsize;
 
@@ -6512,7 +6512,7 @@ static int nvme_init_pci(NvmeCtrl *n, PCIDevice *pci_dev, Error **errp)
 
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


