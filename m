Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1075E49D12A
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Jan 2022 18:53:55 +0100 (CET)
Received: from localhost ([::1]:37500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCmUU-0001M3-46
	for lists+qemu-devel@lfdr.de; Wed, 26 Jan 2022 12:53:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasz.maniak@linux.intel.com>)
 id 1nClti-00076L-7u; Wed, 26 Jan 2022 12:15:54 -0500
Received: from mga11.intel.com ([192.55.52.93]:54272)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasz.maniak@linux.intel.com>)
 id 1nCltg-00021Y-6n; Wed, 26 Jan 2022 12:15:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643217352; x=1674753352;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=39BBXcmXbEhsBGWygj9hRCyBdWmIAY/Giu4Fm1dOh3Q=;
 b=S3B39At63xmBPB65Nc+GlsQxeFjI8Cpur/Z9tsbJZo/eIJPSz4gQtLwk
 +doHR98PbG2gRpjkXhtKDSh2YDLyhaylZhMOCVpoAUAXc1QMKzxKfmddP
 zUh595Aoyl0n0s+kS+r89XF618lSeswZZ+YXGJG3Sc50MMpKCjuXp0PSk
 snqHSK33HM+mla0Cesq63lzDenffIuexkupqapLckO+5DtO41zsjVMKwb
 w4TgRB5hT63wotGO1PYQZX9Q78Ldtfv0pUwd8c/GVfareyuJ5qR6xQ5wJ
 0QBduLI8VYtt+6154XmGDhHcNmDFsjgg/rnaAQx1JaFz4KM7VR8uECqSQ Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10238"; a="244199466"
X-IronPort-AV: E=Sophos;i="5.88,318,1635231600"; d="scan'208";a="244199466"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2022 09:13:35 -0800
X-IronPort-AV: E=Sophos;i="5.88,318,1635231600"; d="scan'208";a="535254415"
Received: from lmaniak-dev.igk.intel.com ([10.55.249.72])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2022 09:13:33 -0800
From: Lukasz Maniak <lukasz.maniak@linux.intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 15/15] hw/nvme: Update the initalization place for the AER
 queue
Date: Wed, 26 Jan 2022 18:11:20 +0100
Message-Id: <20220126171120.2939152-16-lukasz.maniak@linux.intel.com>
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
index 624db2f9c6..b2228e960f 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -6029,8 +6029,6 @@ static int nvme_start_ctrl(NvmeCtrl *n)
 
     nvme_set_timestamp(n, 0ULL);
 
-    QTAILQ_INIT(&n->aer_queue);
-
     nvme_select_iocs(n);
 
     return 0;
@@ -7007,6 +7005,8 @@ static void nvme_init_ctrl(NvmeCtrl *n, PCIDevice *pci_dev)
         id->cmic |= NVME_CMIC_MULTI_CTRL;
     }
 
+    QTAILQ_INIT(&n->aer_queue);
+
     NVME_CAP_SET_MQES(cap, 0x7ff);
     NVME_CAP_SET_CQR(cap, 1);
     NVME_CAP_SET_TO(cap, 0xf);
-- 
2.25.1


