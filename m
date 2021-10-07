Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 278C542596F
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 19:27:35 +0200 (CEST)
Received: from localhost ([::1]:40670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYXB8-0002jm-4w
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 13:27:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasz.maniak@linux.intel.com>)
 id 1mYWQb-0001rJ-AJ; Thu, 07 Oct 2021 12:39:29 -0400
Received: from mga04.intel.com ([192.55.52.120]:55434)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasz.maniak@linux.intel.com>)
 id 1mYWQZ-0008BP-G7; Thu, 07 Oct 2021 12:39:29 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10130"; a="225073121"
X-IronPort-AV: E=Sophos;i="5.85,355,1624345200"; d="scan'208";a="225073121"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2021 09:26:15 -0700
X-IronPort-AV: E=Sophos;i="5.85,355,1624345200"; d="scan'208";a="624325955"
Received: from lmaniak-dev.igk.intel.com ([10.55.248.48])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2021 09:26:13 -0700
From: Lukasz Maniak <lukasz.maniak@linux.intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 13/15] pcie: Add helpers to the SR/IOV API
Date: Thu,  7 Oct 2021 18:24:04 +0200
Message-Id: <20211007162406.1920374-14-lukasz.maniak@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211007162406.1920374-1-lukasz.maniak@linux.intel.com>
References: <20211007162406.1920374-1-lukasz.maniak@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=192.55.52.120;
 envelope-from=lukasz.maniak@linux.intel.com; helo=mga04.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 07 Oct 2021 13:12:41 -0400
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
Cc: =?UTF-8?q?=C5=81ukasz=20Gieryk?= <lukasz.gieryk@linux.intel.com>,
 Lukasz Maniak <lukasz.maniak@linux.intel.com>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Łukasz Gieryk <lukasz.gieryk@linux.intel.com>

Two convenience functions for retrieving:
 - the total number of VFs,
 - the PCIDevice object of the N-th VF.

Signed-off-by: Łukasz Gieryk <lukasz.gieryk@linux.intel.com>
---
 hw/pci/pcie_sriov.c         | 14 ++++++++++++++
 include/hw/pci/pcie_sriov.h |  8 ++++++++
 2 files changed, 22 insertions(+)

diff --git a/hw/pci/pcie_sriov.c b/hw/pci/pcie_sriov.c
index cac2aee061..5a8e92d5ab 100644
--- a/hw/pci/pcie_sriov.c
+++ b/hw/pci/pcie_sriov.c
@@ -292,8 +292,22 @@ uint16_t pcie_sriov_vf_number(PCIDevice *dev)
     return dev->exp.sriov_vf.vf_number;
 }
 
+uint16_t pcie_sriov_vf_number_total(PCIDevice *dev)
+{
+    assert(!pci_is_vf(dev));
+    return dev->exp.sriov_pf.num_vfs;
+}
 
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
index 9ab48b79c0..d1f39b7223 100644
--- a/include/hw/pci/pcie_sriov.h
+++ b/include/hw/pci/pcie_sriov.h
@@ -65,9 +65,17 @@ void pcie_sriov_pf_disable_vfs(PCIDevice *dev);
 /* Get logical VF number of a VF - only valid for VFs */
 uint16_t pcie_sriov_vf_number(PCIDevice *dev);
 
+/* Get the total number of VFs - only valid for PF */
+uint16_t pcie_sriov_vf_number_total(PCIDevice *dev);
+
 /* Get the physical function that owns this VF.
  * Returns NULL if dev is not a virtual function
  */
 PCIDevice *pcie_sriov_get_pf(PCIDevice *dev);
 
+/* Get the n-th VF of this physical function - only valid for PF.
+ * Returns NULL if index is invalid
+ */
+PCIDevice *pcie_sriov_get_vf_at_index(PCIDevice *dev, int n);
+
 #endif /* QEMU_PCIE_SRIOV_H */
-- 
2.25.1


