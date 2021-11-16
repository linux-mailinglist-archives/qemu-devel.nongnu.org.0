Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CEA8A4536FE
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Nov 2021 17:10:45 +0100 (CET)
Received: from localhost ([::1]:55348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mn12i-0003x1-VU
	for lists+qemu-devel@lfdr.de; Tue, 16 Nov 2021 11:10:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasz.gieryk@linux.intel.com>)
 id 1mn0lv-000646-M3; Tue, 16 Nov 2021 10:53:24 -0500
Received: from mga04.intel.com ([192.55.52.120]:64383)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasz.gieryk@linux.intel.com>)
 id 1mn0lg-0007ek-3r; Tue, 16 Nov 2021 10:53:23 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10169"; a="232438846"
X-IronPort-AV: E=Sophos;i="5.87,239,1631602800"; d="scan'208";a="232438846"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2021 07:53:01 -0800
X-IronPort-AV: E=Sophos;i="5.87,239,1631602800"; d="scan'208";a="454494354"
Received: from lgieryk-lnx.igk.intel.com ([172.22.230.153])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2021 07:53:00 -0800
From: =?UTF-8?q?=C5=81ukasz=20Gieryk?= <lukasz.gieryk@linux.intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 03/15] pcie: Add helpers to the SR/IOV API
Date: Tue, 16 Nov 2021 16:34:34 +0100
Message-Id: <20211116153446.317143-4-lukasz.gieryk@linux.intel.com>
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
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
 Lukasz Maniak <lukasz.maniak@linux.intel.com>, Knut Omang <knuto@ifi.uio.no>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Two convenience functions for retrieving:
 - the total number of VFs,
 - the PCIDevice object of the N-th VF.

Signed-off-by: Łukasz Gieryk <lukasz.gieryk@linux.intel.com>
Reviewed-by: Knut Omang <knuto@ifi.uio.no>
---
 hw/pci/pcie_sriov.c         | 14 ++++++++++++++
 include/hw/pci/pcie_sriov.h |  8 ++++++++
 2 files changed, 22 insertions(+)

diff --git a/hw/pci/pcie_sriov.c b/hw/pci/pcie_sriov.c
index 501a1ff433..3515cb603d 100644
--- a/hw/pci/pcie_sriov.c
+++ b/hw/pci/pcie_sriov.c
@@ -280,8 +280,22 @@ uint16_t pcie_sriov_vf_number(PCIDevice *dev)
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
index 0974f00054..33ed6d0686 100644
--- a/include/hw/pci/pcie_sriov.h
+++ b/include/hw/pci/pcie_sriov.h
@@ -59,9 +59,17 @@ void pcie_sriov_pf_disable_vfs(PCIDevice *dev);
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


