Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B04C04536B0
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Nov 2021 17:03:31 +0100 (CET)
Received: from localhost ([::1]:35356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mn0vi-0007Hw-Qx
	for lists+qemu-devel@lfdr.de; Tue, 16 Nov 2021 11:03:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasz.gieryk@linux.intel.com>)
 id 1mn0mN-0006sp-M6; Tue, 16 Nov 2021 10:53:51 -0500
Received: from mga04.intel.com ([192.55.52.120]:64391)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasz.gieryk@linux.intel.com>)
 id 1mn0mL-0007fn-PX; Tue, 16 Nov 2021 10:53:51 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10169"; a="232438929"
X-IronPort-AV: E=Sophos;i="5.87,239,1631602800"; d="scan'208";a="232438929"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2021 07:53:29 -0800
X-IronPort-AV: E=Sophos;i="5.87,239,1631602800"; d="scan'208";a="454494497"
Received: from lgieryk-lnx.igk.intel.com ([172.22.230.153])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2021 07:53:27 -0800
From: =?UTF-8?q?=C5=81ukasz=20Gieryk?= <lukasz.gieryk@linux.intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 15/15] hw/nvme: Update the initalization place for the AER
 queue
Date: Tue, 16 Nov 2021 16:34:46 +0100
Message-Id: <20211116153446.317143-16-lukasz.gieryk@linux.intel.com>
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

This patch updates the initialization place for the AER queue, so it’s
initialized once, at controller initialization, and not every time
controller is enabled.

While the original version works for a non-SR-IOV device, as it’s hard
to interact with the controller if it’s not enabled, the multiple
reinitialization is not necessarily correct.

With the SR/IOV feature enabled a segfault can happen: a VF can have its
controller disabled, while a namespace can still be attached to the
controller through the parent PF. An event generated in such case ends
up on an uninitialized queue.

While it’s an interesting question whether a VF should support AER in
the first place, I don’t think it must be answered today.

Signed-off-by: Łukasz Gieryk <lukasz.gieryk@linux.intel.com>
---
 hw/nvme/ctrl.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index 9d0432a2e5..7d41318961 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -5980,8 +5980,6 @@ static int nvme_start_ctrl(NvmeCtrl *n)
 
     nvme_set_timestamp(n, 0ULL);
 
-    QTAILQ_INIT(&n->aer_queue);
-
     nvme_select_iocs(n);
 
     return 0;
@@ -6960,6 +6958,8 @@ static void nvme_init_ctrl(NvmeCtrl *n, PCIDevice *pci_dev)
         id->cmic |= NVME_CMIC_MULTI_CTRL;
     }
 
+    QTAILQ_INIT(&n->aer_queue);
+
     NVME_CAP_SET_MQES(cap, 0x7ff);
     NVME_CAP_SET_CQR(cap, 1);
     NVME_CAP_SET_TO(cap, 0xf);
-- 
2.25.1


