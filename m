Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AB764536B8
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Nov 2021 17:04:16 +0100 (CET)
Received: from localhost ([::1]:38356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mn0wR-0000tP-Ds
	for lists+qemu-devel@lfdr.de; Tue, 16 Nov 2021 11:04:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasz.gieryk@linux.intel.com>)
 id 1mn0mM-0006mq-5N; Tue, 16 Nov 2021 10:53:50 -0500
Received: from mga04.intel.com ([192.55.52.120]:64395)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasz.gieryk@linux.intel.com>)
 id 1mn0mH-0007fw-Ry; Tue, 16 Nov 2021 10:53:49 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10169"; a="232438921"
X-IronPort-AV: E=Sophos;i="5.87,239,1631602800"; d="scan'208";a="232438921"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2021 07:53:27 -0800
X-IronPort-AV: E=Sophos;i="5.87,239,1631602800"; d="scan'208";a="454494492"
Received: from lgieryk-lnx.igk.intel.com ([172.22.230.153])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2021 07:53:26 -0800
From: =?UTF-8?q?=C5=81ukasz=20Gieryk?= <lukasz.gieryk@linux.intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 14/15] docs: Add documentation for SR-IOV and
 Virtualization Enhancements
Date: Tue, 16 Nov 2021 16:34:45 +0100
Message-Id: <20211116153446.317143-15-lukasz.gieryk@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211116153446.317143-1-lukasz.gieryk@linux.intel.com>
References: <20211116153446.317143-1-lukasz.gieryk@linux.intel.com>
MIME-Version: 1.0
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
Cc: =?UTF-8?q?=C5=81ukasz=20Gieryk?= <lukasz.gieryk@linux.intel.com>,
 Lukasz Maniak <lukasz.maniak@linux.intel.com>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Lukasz Maniak <lukasz.maniak@linux.intel.com>

Signed-off-by: Lukasz Maniak <lukasz.maniak@linux.intel.com>
---
 docs/system/devices/nvme.rst | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/docs/system/devices/nvme.rst b/docs/system/devices/nvme.rst
index bff72d1c24..29fe2565b5 100644
--- a/docs/system/devices/nvme.rst
+++ b/docs/system/devices/nvme.rst
@@ -235,3 +235,38 @@ The virtual namespace device supports DIF- and DIX-based protection information
   to ``1`` to transfer protection information as the first eight bytes of
   metadata. Otherwise, the protection information is transferred as the last
   eight bytes.
+
+Virtualization Enhancements and SR-IOV
+--------------------------------------
+
+The ``nvme`` device supports Single Root I/O Virtualization and Sharing
+along with Virtualization Enhancements. The controller has to be linked to
+an NVM Subsystem device (``nvme-subsys``) for use with SR-IOV.
+
+A number of parameters are present:
+
+``sriov_max_vfs`` (default: ``0``)
+  Indicates the maximum number of PCIe virtual functions supported
+  by the controller. Specifying a non-zero value enables reporting of both
+  SR-IOV and ARI (Alternative Routing-ID Interpretation) capabilities
+  by the NVMe device. Virtual function controllers will not report SR-IOV.
+
+``sriov_vq_flexible``
+  Indicates the total number of flexible queue resources assignable to all
+  the secondary controllers. Implicitly sets the number of PF-private
+  resources to (max_ioqpairs - sriov_vq_flexible).
+
+``sriov_vi_flexible``
+  Indicates the total number of flexible interrupt resources assignable to
+  all the secondary controllers. Implicitly sets the number of PF-private
+  resources to (msix_qsize - sriov_vi_flexible).
+
+``sriov_max_vi_per_vf``
+  Indicates the maximum number of virtual interrupt resources assignable
+  to a secondary controller. The default 0 resolves to the number of private
+  interrupt resources configured for PF.
+
+``sriov_max_vq_per_vf``
+  Indicates the maximum number of virtual queue resources assignable to
+  a secondary controller. The default 0 resolves to the number of private
+  queue resources configured for PF.
-- 
2.25.1


