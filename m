Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14FFF49D0D9
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Jan 2022 18:34:33 +0100 (CET)
Received: from localhost ([::1]:53828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCmBj-0005yG-Nc
	for lists+qemu-devel@lfdr.de; Wed, 26 Jan 2022 12:34:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasz.maniak@linux.intel.com>)
 id 1nClse-0006RZ-OV; Wed, 26 Jan 2022 12:14:48 -0500
Received: from mga11.intel.com ([192.55.52.93]:54208)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasz.maniak@linux.intel.com>)
 id 1nClsc-0001fE-Ix; Wed, 26 Jan 2022 12:14:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643217286; x=1674753286;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=USJgHIy6fwEuBThQwP1pgLcL7CZQHmJywMLc6xGad0k=;
 b=FzgloAvESVkxLAb/2tN+Ee57PjwyYxAghDJlFHJGO2lbZ23vLxU59K2s
 vVBkmgAcdP2Bw+LhG2Cn3171/W32i4XxlfDhanam6s9A5CeRaR8IJyOCz
 QefqU+Uv4JAdoDZK1YCFwBAI3h1yBjedZo0zMnZVTKwNrx/qSNu3otLe0
 lwgpekeu91QdvYW0IguM6B34g8PYTIH0Jm4aIjGFfoG8lL9uEc3c0sN/A
 aWsFCjH/nBjrwV14H7rKoz2mTcSn3JtgftEdcSDclyXXCTW6s3MB0S+zN
 ohxCcxVzqGDXCCV82aJsV8zf/xME6/hgsL5KASl/ClSOwodQG6AdFAZoE Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10238"; a="244199234"
X-IronPort-AV: E=Sophos;i="5.88,318,1635231600"; d="scan'208";a="244199234"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2022 09:13:04 -0800
X-IronPort-AV: E=Sophos;i="5.88,318,1635231600"; d="scan'208";a="535254155"
Received: from lmaniak-dev.igk.intel.com ([10.55.249.72])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2022 09:13:02 -0800
From: Lukasz Maniak <lukasz.maniak@linux.intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 03/15] pcie: Add a helper to the SR/IOV API
Date: Wed, 26 Jan 2022 18:11:08 +0100
Message-Id: <20220126171120.2939152-4-lukasz.maniak@linux.intel.com>
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
Cc: qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?=C5=81ukasz=20Gieryk?= <lukasz.gieryk@linux.intel.com>,
 Lukasz Maniak <lukasz.maniak@linux.intel.com>, Keith Busch <kbusch@kernel.org>,
 Klaus Jensen <its@irrelevant.dk>, Knut Omang <knuto@ifi.uio.no>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Łukasz Gieryk <lukasz.gieryk@linux.intel.com>

Convenience function for retrieving the PCIDevice object of the N-th VF.

Signed-off-by: Łukasz Gieryk <lukasz.gieryk@linux.intel.com>
Reviewed-by: Knut Omang <knuto@ifi.uio.no>
---
 hw/pci/pcie_sriov.c         | 10 +++++++++-
 include/hw/pci/pcie_sriov.h |  6 ++++++
 2 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/hw/pci/pcie_sriov.c b/hw/pci/pcie_sriov.c
index 3f256d483f..87abad6ac8 100644
--- a/hw/pci/pcie_sriov.c
+++ b/hw/pci/pcie_sriov.c
@@ -287,8 +287,16 @@ uint16_t pcie_sriov_vf_number(PCIDevice *dev)
     return dev->exp.sriov_vf.vf_number;
 }
 
-
 PCIDevice *pcie_sriov_get_pf(PCIDevice *dev)
 {
     return dev->exp.sriov_vf.pf;
 }
+
+PCIDevice *pcie_sriov_get_vf_at_index(PCIDevice *dev, int n)
+{
+    assert(!pci_is_vf(dev));
+    if (n < dev->exp.sriov_pf.num_vfs) {
+        return dev->exp.sriov_pf.vf[n];
+    }
+    return NULL;
+}
diff --git a/include/hw/pci/pcie_sriov.h b/include/hw/pci/pcie_sriov.h
index 990cff0a1c..80f5c84e75 100644
--- a/include/hw/pci/pcie_sriov.h
+++ b/include/hw/pci/pcie_sriov.h
@@ -68,4 +68,10 @@ uint16_t pcie_sriov_vf_number(PCIDevice *dev);
  */
 PCIDevice *pcie_sriov_get_pf(PCIDevice *dev);
 
+/*
+ * Get the n-th VF of this physical function - only valid for PF.
+ * Returns NULL if index is invalid
+ */
+PCIDevice *pcie_sriov_get_vf_at_index(PCIDevice *dev, int n);
+
 #endif /* QEMU_PCIE_SRIOV_H */
-- 
2.25.1


