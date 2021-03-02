Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C00C329F85
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 13:53:43 +0100 (CET)
Received: from localhost ([::1]:43796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lH4Wz-0006K1-U3
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 07:53:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yi.l.liu@intel.com>)
 id 1lH4K1-0007Zk-7C
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 07:40:17 -0500
Received: from mga04.intel.com ([192.55.52.120]:29715)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yi.l.liu@intel.com>)
 id 1lH4Jy-0002id-T0
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 07:40:16 -0500
IronPort-SDR: v64n1hbLKbdNVhtYZ3iJUfCS7+/pd9POdxplayKGIgEBH3zEyY7rCHhtp3MtEs4ItRqNvGSJPz
 V1p0H4x+ukPg==
X-IronPort-AV: E=McAfee;i="6000,8403,9910"; a="184363339"
X-IronPort-AV: E=Sophos;i="5.81,216,1610438400"; d="scan'208";a="184363339"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2021 04:40:13 -0800
IronPort-SDR: sjNnsxyGkIrkvlER1z4ffCndPPpwtAtDUKWDoWIJq7tsocpPc2jLG3lPqLPlRbaYvjSOiBR9V0
 nB8wbAnslHAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,216,1610438400"; d="scan'208";a="427472861"
Received: from yiliu-dev.bj.intel.com (HELO dual-ub.bj.intel.com)
 ([10.238.156.135])
 by fmsmga004.fm.intel.com with ESMTP; 02 Mar 2021 04:40:09 -0800
From: Liu Yi L <yi.l.liu@intel.com>
To: qemu-devel@nongnu.org, alex.williamson@redhat.com, peterx@redhat.com,
 jasowang@redhat.com
Subject: [RFC v11 10/25] hw/pci: introduce pci_device_set/unset_iommu_context()
Date: Wed,  3 Mar 2021 04:38:12 +0800
Message-Id: <20210302203827.437645-11-yi.l.liu@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210302203827.437645-1-yi.l.liu@intel.com>
References: <20210302203827.437645-1-yi.l.liu@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.120; envelope-from=yi.l.liu@intel.com;
 helo=mga04.intel.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DATE_IN_FUTURE_06_12=1.947,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: jean-philippe@linaro.org, kevin.tian@intel.com, yi.l.liu@intel.com,
 Yi Sun <yi.y.sun@linux.intel.com>, kvm@vger.kernel.org, mst@redhat.com,
 jun.j.tian@intel.com, eric.auger@redhat.com, yi.y.sun@intel.com,
 Jacob Pan <jacob.jun.pan@linux.intel.com>, pbonzini@redhat.com,
 Lingshan.Zhu@intel.com, hao.wu@intel.com, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For nesting IOMMU translation capable platforms, vIOMMUs running on
such system could be implemented upon physical IOMMU nested paging
(VFIO case). vIOMMU advertises such implementation by "want_nested"
attribute to PCIe devices (e.g. VFIO PCI). Once "want_nested" is
satisfied, device (VFIO case) should set HostIOMMUContext to vIOMMU,
thus vIOMMU could manage stage-1 translation. DMAs out from such
devices would be protected through the stage-1 page tables owned by
guest together with stage-2 page tables owned by host.

This patch adds pci_device_set/unset_iommu_context() to set/unset
HostIOMMUContext for a given PCIe device (VFIO case). Caller of set
should fail if set operation failed.

Cc: Kevin Tian <kevin.tian@intel.com>
Cc: Jacob Pan <jacob.jun.pan@linux.intel.com>
Cc: Peter Xu <peterx@redhat.com>
Cc: Eric Auger <eric.auger@redhat.com>
Cc: Yi Sun <yi.y.sun@linux.intel.com>
Cc: David Gibson <david@gibson.dropbear.id.au>
Cc: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Peter Xu <peterx@redhat.com>
Signed-off-by: Liu Yi L <yi.l.liu@intel.com>
---
rfcv5 (v2) -> rfcv6:
*) pci_device_set_iommu_context() returns 0 if callback is not implemented.
---
 hw/pci/pci.c         | 28 ++++++++++++++++++++++++++++
 include/hw/pci/pci.h | 10 ++++++++++
 2 files changed, 38 insertions(+)

diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index 19365e2799..a2c270a5d6 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -2749,6 +2749,34 @@ int pci_device_get_iommu_attr(PCIDevice *dev, IOMMUAttr attr, void *data)
     return -ENOENT;
 }
 
+int pci_device_set_iommu_context(PCIDevice *dev,
+                                 HostIOMMUContext *iommu_ctx)
+{
+    PCIBus *bus;
+    uint8_t devfn;
+
+    pci_device_get_iommu_bus_devfn(dev, &bus, &devfn);
+    if (bus && bus->iommu_ops &&
+        bus->iommu_ops->set_iommu_context) {
+        return bus->iommu_ops->set_iommu_context(bus,
+                              bus->iommu_opaque, devfn, iommu_ctx);
+    }
+    return 0;
+}
+
+void pci_device_unset_iommu_context(PCIDevice *dev)
+{
+    PCIBus *bus;
+    uint8_t devfn;
+
+    pci_device_get_iommu_bus_devfn(dev, &bus, &devfn);
+    if (bus && bus->iommu_ops &&
+        bus->iommu_ops->unset_iommu_context) {
+        bus->iommu_ops->unset_iommu_context(bus,
+                                 bus->iommu_opaque, devfn);
+    }
+}
+
 void pci_setup_iommu(PCIBus *bus, const PCIIOMMUOps *ops, void *opaque)
 {
     bus->iommu_ops = ops;
diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
index b99e05c81e..1eeb177f4f 100644
--- a/include/hw/pci/pci.h
+++ b/include/hw/pci/pci.h
@@ -10,6 +10,8 @@
 #include "hw/pci/pcie.h"
 #include "qom/object.h"
 
+#include "hw/iommu/host_iommu_context.h"
+
 extern bool pci_available;
 
 /* PCI bus */
@@ -495,10 +497,18 @@ struct PCIIOMMUOps {
                                 void *opaque, int32_t devfn);
     int (*get_iommu_attr)(PCIBus *bus, void *opaque, int32_t devfn,
                            IOMMUAttr attr, void *data);
+    int (*set_iommu_context)(PCIBus *bus, void *opaque,
+                             int32_t devfn,
+                             HostIOMMUContext *iommu_ctx);
+    void (*unset_iommu_context)(PCIBus *bus, void *opaque,
+                                int32_t devfn);
 };
 
 AddressSpace *pci_device_iommu_address_space(PCIDevice *dev);
 int pci_device_get_iommu_attr(PCIDevice *dev, IOMMUAttr attr, void *data);
+int pci_device_set_iommu_context(PCIDevice *dev,
+                                 HostIOMMUContext *iommu_ctx);
+void pci_device_unset_iommu_context(PCIDevice *dev);
 void pci_setup_iommu(PCIBus *bus, const PCIIOMMUOps *iommu_ops, void *opaque);
 
 static inline void
-- 
2.25.1


