Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA7D3203F19
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Jun 2020 20:25:21 +0200 (CEST)
Received: from localhost ([::1]:49422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jnR8D-0005m9-0i
	for lists+qemu-devel@lfdr.de; Mon, 22 Jun 2020 14:25:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrzej.jakowski@linux.intel.com>)
 id 1jnR6v-0004q6-Lz; Mon, 22 Jun 2020 14:24:01 -0400
Received: from mga09.intel.com ([134.134.136.24]:56187)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrzej.jakowski@linux.intel.com>)
 id 1jnR6t-0006d8-Nc; Mon, 22 Jun 2020 14:24:01 -0400
IronPort-SDR: j5wwedQAkBjSVYh3/hpM+VlOSMMszvGGTmbWxt0wbimYxYOwX8cGmz5JSv1WDf7cWC5gRdRiqb
 7t6lT7uinIVg==
X-IronPort-AV: E=McAfee;i="6000,8403,9660"; a="145349239"
X-IronPort-AV: E=Sophos;i="5.75,268,1589266800"; d="scan'208";a="145349239"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2020 11:23:55 -0700
IronPort-SDR: ECkXINR4FdqSCUcI62Lo+vlnpMlvjM+hEjjMvQVeh7jO7E8gg0gkQvfqXAAQFRxvMEyI+zDSnD
 QNRThmpSvdEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,268,1589266800"; d="scan'208";a="300930923"
Received: from unknown (HELO localhost.ch.intel.com) ([10.2.61.79])
 by fmsmga004.fm.intel.com with ESMTP; 22 Jun 2020 11:23:54 -0700
From: Andrzej Jakowski <andrzej.jakowski@linux.intel.com>
To: kbusch@kernel.org,
	kwolf@redhat.com,
	mreitz@redhat.com
Subject: [PATCH v3 1/2] nvme: indicate CMB support through controller
 capabilities register
Date: Mon, 22 Jun 2020 11:25:10 -0700
Message-Id: <20200622182511.17252-2-andrzej.jakowski@linux.intel.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200622182511.17252-1-andrzej.jakowski@linux.intel.com>
References: <20200622182511.17252-1-andrzej.jakowski@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=134.134.136.24;
 envelope-from=andrzej.jakowski@linux.intel.com; helo=mga09.intel.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/22 14:23:54
X-ACL-Warn: Detected OS   = FreeBSD 9.x or newer [fuzzy]
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
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
Cc: Klaus Jensen <k.jensen@samsung.com>,
 Andrzej Jakowski <andrzej.jakowski@linux.intel.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch sets CMBS bit in controller capabilities register when user
configures NVMe driver with CMB support, so capabilites are correctly
reported to guest OS.

Signed-off-by: Andrzej Jakowski <andrzej.jakowski@linux.intel.com>
Reviewed-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/block/nvme.c      | 2 +-
 include/block/nvme.h | 6 +++++-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 1aee042d4c..9f11f3e9da 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -1582,6 +1582,7 @@ static void nvme_init_ctrl(NvmeCtrl *n, PCIDevice *pci_dev)
     NVME_CAP_SET_TO(n->bar.cap, 0xf);
     NVME_CAP_SET_CSS(n->bar.cap, 1);
     NVME_CAP_SET_MPSMAX(n->bar.cap, 4);
+    NVME_CAP_SET_CMBS(n->bar.cap, n->params.cmb_size_mb ? 1 : 0);
 
     n->bar.vs = 0x00010200;
     n->bar.intmc = n->bar.intms = 0;
@@ -1591,7 +1592,6 @@ static void nvme_realize(PCIDevice *pci_dev, Error **errp)
 {
     NvmeCtrl *n = NVME(pci_dev);
     Error *local_err = NULL;
-
     int i;
 
     nvme_check_constraints(n, &local_err);
diff --git a/include/block/nvme.h b/include/block/nvme.h
index 1720ee1d51..14cf398dfa 100644
--- a/include/block/nvme.h
+++ b/include/block/nvme.h
@@ -35,6 +35,7 @@ enum NvmeCapShift {
     CAP_MPSMIN_SHIFT   = 48,
     CAP_MPSMAX_SHIFT   = 52,
     CAP_PMR_SHIFT      = 56,
+    CAP_CMB_SHIFT      = 57,
 };
 
 enum NvmeCapMask {
@@ -48,6 +49,7 @@ enum NvmeCapMask {
     CAP_MPSMIN_MASK    = 0xf,
     CAP_MPSMAX_MASK    = 0xf,
     CAP_PMR_MASK       = 0x1,
+    CAP_CMB_MASK       = 0x1,
 };
 
 #define NVME_CAP_MQES(cap)  (((cap) >> CAP_MQES_SHIFT)   & CAP_MQES_MASK)
@@ -78,8 +80,10 @@ enum NvmeCapMask {
                                                            << CAP_MPSMIN_SHIFT)
 #define NVME_CAP_SET_MPSMAX(cap, val) (cap |= (uint64_t)(val & CAP_MPSMAX_MASK)\
                                                             << CAP_MPSMAX_SHIFT)
-#define NVME_CAP_SET_PMRS(cap, val) (cap |= (uint64_t)(val & CAP_PMR_MASK)\
+#define NVME_CAP_SET_PMRS(cap, val)   (cap |= (uint64_t)(val & CAP_PMR_MASK)   \
                                                             << CAP_PMR_SHIFT)
+#define NVME_CAP_SET_CMBS(cap, val)   (cap |= (uint64_t)(val & CAP_CMB_MASK)   \
+                                                           << CAP_CMB_SHIFT)
 
 enum NvmeCcShift {
     CC_EN_SHIFT     = 0,
-- 
2.21.1


