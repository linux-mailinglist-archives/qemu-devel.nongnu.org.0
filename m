Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 890D419B5D3
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Apr 2020 20:42:36 +0200 (CEST)
Received: from localhost ([::1]:35890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jJiJv-000075-BF
	for lists+qemu-devel@lfdr.de; Wed, 01 Apr 2020 14:42:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55277)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <andrzej.jakowski@linux.intel.com>)
 id 1jJiJ9-000857-Du
 for qemu-devel@nongnu.org; Wed, 01 Apr 2020 14:41:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <andrzej.jakowski@linux.intel.com>)
 id 1jJiJ8-0004Be-BA
 for qemu-devel@nongnu.org; Wed, 01 Apr 2020 14:41:47 -0400
Received: from mga06.intel.com ([134.134.136.31]:41020)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <andrzej.jakowski@linux.intel.com>)
 id 1jJiJ8-00045a-3z; Wed, 01 Apr 2020 14:41:46 -0400
IronPort-SDR: Xh/Sb8/XtERS8ugcg7UdlqOgESQK1c1OszWK+lQoS1ahTjzKIdf1JR4whFzZierzjTVeiv/fb9
 mGfKO4klSU3Q==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2020 11:41:37 -0700
IronPort-SDR: xvyFNyhD1Xz8ISKGBcbGPD9bNwDL4zCSEzadfFRYgvgmHWgPiuQXRsXBJRAM+k+0++bKLXmtO9
 GMwtDab5xTKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,332,1580803200"; d="scan'208";a="359943800"
Received: from unknown (HELO localhost.ch.intel.com) ([10.2.28.117])
 by fmsmga001.fm.intel.com with ESMTP; 01 Apr 2020 11:41:36 -0700
From: Andrzej Jakowski <andrzej.jakowski@linux.intel.com>
To: kbusch@kernel.org,
	kwolf@redhat.com,
	mreitz@redhat.com
Subject: [PATCH v1] nvme: indicate CMB support through controller capabilities
 register
Date: Wed,  1 Apr 2020 11:42:19 -0700
Message-Id: <20200401184219.14911-1-andrzej.jakowski@linux.intel.com>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: FreeBSD 9.x [fuzzy]
X-Received-From: 134.134.136.31
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
Cc: Andrzej Jakowski <andrzej.jakowski@linux.intel.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch sets CMBS bit in controller capabilities register when user
configures NVMe driver with CMB support, so capabilites are correctly reported
to guest OS.

Signed-off-by: Andrzej Jakowski <andrzej.jakowski@linux.intel.com>
---
 hw/block/nvme.c      | 2 ++
 include/block/nvme.h | 4 ++++
 2 files changed, 6 insertions(+)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index d28335cbf3..986803398f 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -1393,6 +1393,8 @@ static void nvme_realize(PCIDevice *pci_dev, Error **errp)
     n->bar.intmc = n->bar.intms = 0;
 
     if (n->cmb_size_mb) {
+        /* Contoller capabilities */
+        NVME_CAP_SET_CMBS(n->bar.cap, 1);
 
         NVME_CMBLOC_SET_BIR(n->bar.cmbloc, 2);
         NVME_CMBLOC_SET_OFST(n->bar.cmbloc, 0);
diff --git a/include/block/nvme.h b/include/block/nvme.h
index 8fb941c653..561891b140 100644
--- a/include/block/nvme.h
+++ b/include/block/nvme.h
@@ -27,6 +27,7 @@ enum NvmeCapShift {
     CAP_CSS_SHIFT      = 37,
     CAP_MPSMIN_SHIFT   = 48,
     CAP_MPSMAX_SHIFT   = 52,
+    CAP_CMB_SHIFT      = 57,
 };
 
 enum NvmeCapMask {
@@ -39,6 +40,7 @@ enum NvmeCapMask {
     CAP_CSS_MASK       = 0xff,
     CAP_MPSMIN_MASK    = 0xf,
     CAP_MPSMAX_MASK    = 0xf,
+    CAP_CMB_MASK       = 0x1,
 };
 
 #define NVME_CAP_MQES(cap)  (((cap) >> CAP_MQES_SHIFT)   & CAP_MQES_MASK)
@@ -69,6 +71,8 @@ enum NvmeCapMask {
                                                            << CAP_MPSMIN_SHIFT)
 #define NVME_CAP_SET_MPSMAX(cap, val) (cap |= (uint64_t)(val & CAP_MPSMAX_MASK)\
                                                             << CAP_MPSMAX_SHIFT)
+#define NVME_CAP_SET_CMBS(cap, val) (cap |= (uint64_t)(val & CAP_CMB_MASK)\
+                                                            << CAP_CMB_SHIFT)
 
 enum NvmeCcShift {
     CC_EN_SHIFT     = 0,
-- 
2.21.1


