Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E83751FFB6
	for <lists+qemu-devel@lfdr.de>; Mon,  9 May 2022 16:34:58 +0200 (CEST)
Received: from localhost ([::1]:45624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1no4TR-0003Bw-6N
	for lists+qemu-devel@lfdr.de; Mon, 09 May 2022 10:34:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasz.maniak@linux.intel.com>)
 id 1no4E2-00020w-TZ; Mon, 09 May 2022 10:19:02 -0400
Received: from mga05.intel.com ([192.55.52.43]:24288)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasz.maniak@linux.intel.com>)
 id 1no4E1-0001AQ-4F; Mon, 09 May 2022 10:19:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652105941; x=1683641941;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DKmc6oHVK3NuZ+zXFAtKW5DjHA67+ELc73SRywXs/OI=;
 b=gZ6avGFByMrdJChpZ07YB3tbxT35mMN9ckCFQdeSqiorb/tzH7Obwppv
 ZceQcf0oNEDYvbmIX0ZT0lfX0l/OIIo2GErBPRTOUKFFlI+QK2jaN3GEg
 +/PNcpluzgN9CWqMJAsC7zEDoHB2iIdyz0NbJ1kaQq3OSoPiWByo11iZN
 lvjT1WLU54JKARBa0s1wPj7fC0jG215kNM87kZ2kONsVjGZL9tp2rhyWg
 W7OwrjOY6lbP7g7QpnQJXbXVZnR/InZOfVZVp7PmJEBzqllB15IHJNhfo
 g4+ByTNSlfOhw5Zddrt1frw+K67YGdvLLVM4pTrzKlYjGJh/jQFrQQiep Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10342"; a="355490846"
X-IronPort-AV: E=Sophos;i="5.91,211,1647327600"; d="scan'208";a="355490846"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2022 07:19:00 -0700
X-IronPort-AV: E=Sophos;i="5.91,211,1647327600"; d="scan'208";a="622987309"
Received: from lmaniak-dev.elements.local ([10.55.249.72])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2022 07:18:56 -0700
From: Lukasz Maniak <lukasz.maniak@linux.intel.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, ani@anisinha.ca, armbru@redhat.com, f4bug@amsat.org,
 fam@euphon.net, hreitz@redhat.com, imammedo@redhat.com, its@irrelevant.dk,
 kbusch@kernel.org, k.jensen@samsung.com, kwolf@redhat.com,
 lukasz.gieryk@linux.intel.com, lukasz.maniak@linux.intel.com,
 marcel.apfelbaum@gmail.com, mst@redhat.com, stefanha@redhat.com,
 xypron.glpk@gmx.de
Subject: [PATCH v8 06/12] hw/nvme: Remove reg_size variable and update BAR0
 size calculation
Date: Mon,  9 May 2022 16:16:14 +0200
Message-Id: <20220509141620.3868733-7-lukasz.maniak@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220509141620.3868733-1-lukasz.maniak@linux.intel.com>
References: <20220509141620.3868733-1-lukasz.maniak@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=192.55.52.43;
 envelope-from=lukasz.maniak@linux.intel.com; helo=mga05.intel.com
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
Reviewed-by: Klaus Jensen <k.jensen@samsung.com>
Acked-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/nvme/ctrl.c | 10 +++++-----
 hw/nvme/nvme.h |  1 -
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index 12372038075..f34d73a00c8 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -6669,9 +6669,6 @@ static void nvme_init_state(NvmeCtrl *n)
     n->conf_ioqpairs = n->params.max_ioqpairs;
     n->conf_msix_qsize = n->params.msix_qsize;
 
-    /* add one to max_ioqpairs to account for the admin queue pair */
-    n->reg_size = pow2ceil(sizeof(NvmeBar) +
-                           2 * (n->params.max_ioqpairs + 1) * NVME_DB_SIZE);
     n->sq = g_new0(NvmeSQueue *, n->params.max_ioqpairs + 1);
     n->cq = g_new0(NvmeCQueue *, n->params.max_ioqpairs + 1);
     n->temperature = NVME_TEMPERATURE;
@@ -6795,7 +6792,10 @@ static int nvme_init_pci(NvmeCtrl *n, PCIDevice *pci_dev, Error **errp)
         pcie_ari_init(pci_dev, 0x100, 1);
     }
 
-    bar_size = QEMU_ALIGN_UP(n->reg_size, 4 * KiB);
+    /* add one to max_ioqpairs to account for the admin queue pair */
+    bar_size = sizeof(NvmeBar) +
+               2 * (n->params.max_ioqpairs + 1) * NVME_DB_SIZE;
+    bar_size = QEMU_ALIGN_UP(bar_size, 4 * KiB);
     msix_table_offset = bar_size;
     msix_table_size = PCI_MSIX_ENTRY_SIZE * n->params.msix_qsize;
 
@@ -6809,7 +6809,7 @@ static int nvme_init_pci(NvmeCtrl *n, PCIDevice *pci_dev, Error **errp)
 
     memory_region_init(&n->bar0, OBJECT(n), "nvme-bar0", bar_size);
     memory_region_init_io(&n->iomem, OBJECT(n), &nvme_mmio_ops, n, "nvme",
-                          n->reg_size);
+                          msix_table_offset);
     memory_region_add_subregion(&n->bar0, 0, &n->iomem);
 
     if (pci_is_vf(pci_dev)) {
diff --git a/hw/nvme/nvme.h b/hw/nvme/nvme.h
index 5bd6ac698bc..adde718105b 100644
--- a/hw/nvme/nvme.h
+++ b/hw/nvme/nvme.h
@@ -428,7 +428,6 @@ typedef struct NvmeCtrl {
     uint16_t    max_prp_ents;
     uint16_t    cqe_size;
     uint16_t    sqe_size;
-    uint32_t    reg_size;
     uint32_t    max_q_ents;
     uint8_t     outstanding_aers;
     uint32_t    irq_status;
-- 
2.25.1


