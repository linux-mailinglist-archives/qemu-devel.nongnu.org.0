Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D47C2302E8
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jul 2020 08:29:51 +0200 (CEST)
Received: from localhost ([::1]:60738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k0J7W-0002o8-GT
	for lists+qemu-devel@lfdr.de; Tue, 28 Jul 2020 02:29:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yi.l.liu@intel.com>)
 id 1k0J5d-00014c-Pe
 for qemu-devel@nongnu.org; Tue, 28 Jul 2020 02:27:53 -0400
Received: from mga11.intel.com ([192.55.52.93]:41261)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yi.l.liu@intel.com>)
 id 1k0J5a-0002Af-AL
 for qemu-devel@nongnu.org; Tue, 28 Jul 2020 02:27:53 -0400
IronPort-SDR: R4secYdIA+zPphMT5e9hz12SwxH9f4ceHvYOyT5e63q33bZa6eqpC6sFZqrxqFFfNedi9MTImD
 KSS51c2dvFbA==
X-IronPort-AV: E=McAfee;i="6000,8403,9695"; a="149021033"
X-IronPort-AV: E=Sophos;i="5.75,405,1589266800"; d="scan'208";a="149021033"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2020 23:27:34 -0700
IronPort-SDR: YXhjxrSCVo9u7sjWjP4LuGP5Vt6V4Qmfc8W66g5jkYQs1RSlpnaIGjly2a56mMdUBiWVu6q1xV
 UrM+aT/4wXIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,405,1589266800"; d="scan'208";a="394232817"
Received: from jacob-builder.jf.intel.com ([10.7.199.155])
 by fmsmga001.fm.intel.com with ESMTP; 27 Jul 2020 23:27:33 -0700
From: Liu Yi L <yi.l.liu@intel.com>
To: qemu-devel@nongnu.org, alex.williamson@redhat.com, peterx@redhat.com,
 jasowang@redhat.com
Subject: [RFC v9 04/25] hw/pci: introduce pci_device_get_iommu_attr()
Date: Mon, 27 Jul 2020 23:33:57 -0700
Message-Id: <1595918058-33392-5-git-send-email-yi.l.liu@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1595918058-33392-1-git-send-email-yi.l.liu@intel.com>
References: <1595918058-33392-1-git-send-email-yi.l.liu@intel.com>
Received-SPF: pass client-ip=192.55.52.93; envelope-from=yi.l.liu@intel.com;
 helo=mga11.intel.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/28 02:27:41
X-ACL-Warn: Detected OS   = FreeBSD 9.x or newer [fuzzy]
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 hao.wu@intel.com, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch adds pci_device_get_iommu_attr() to get vIOMMU attributes.
e.g. if nesting IOMMU wanted.

Cc: Kevin Tian <kevin.tian@intel.com>
Cc: Jacob Pan <jacob.jun.pan@linux.intel.com>
Cc: Peter Xu <peterx@redhat.com>
Cc: Eric Auger <eric.auger@redhat.com>
Cc: Yi Sun <yi.y.sun@linux.intel.com>
Cc: David Gibson <david@gibson.dropbear.id.au>
Cc: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Liu Yi L <yi.l.liu@intel.com>
---
 hw/pci/pci.c         | 35 ++++++++++++++++++++++++++++++-----
 include/hw/pci/pci.h |  7 +++++++
 2 files changed, 37 insertions(+), 5 deletions(-)

diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index b2a2077..3c27805 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -2659,7 +2659,8 @@ static void pci_device_class_base_init(ObjectClass *klass, void *data)
     }
 }
 
-AddressSpace *pci_device_iommu_address_space(PCIDevice *dev)
+static void pci_device_get_iommu_bus_devfn(PCIDevice *dev,
+                              PCIBus **pbus, uint8_t *pdevfn)
 {
     PCIBus *bus = pci_get_bus(dev);
     PCIBus *iommu_bus = bus;
@@ -2710,14 +2711,38 @@ AddressSpace *pci_device_iommu_address_space(PCIDevice *dev)
 
         iommu_bus = parent_bus;
     }
-    if (iommu_bus && iommu_bus->iommu_ops &&
-                     iommu_bus->iommu_ops->get_address_space) {
-        return iommu_bus->iommu_ops->get_address_space(bus,
-                                 iommu_bus->iommu_opaque, devfn);
+    *pbus = iommu_bus;
+    *pdevfn = devfn;
+}
+
+AddressSpace *pci_device_iommu_address_space(PCIDevice *dev)
+{
+    PCIBus *bus;
+    uint8_t devfn;
+
+    pci_device_get_iommu_bus_devfn(dev, &bus, &devfn);
+    if (bus && bus->iommu_ops &&
+        bus->iommu_ops->get_address_space) {
+        return bus->iommu_ops->get_address_space(bus,
+                                bus->iommu_opaque, devfn);
     }
     return &address_space_memory;
 }
 
+int pci_device_get_iommu_attr(PCIDevice *dev, IOMMUAttr attr, void *data)
+{
+    PCIBus *bus;
+    uint8_t devfn;
+
+    pci_device_get_iommu_bus_devfn(dev, &bus, &devfn);
+    if (bus && bus->iommu_ops &&
+        bus->iommu_ops->get_iommu_attr) {
+        return bus->iommu_ops->get_iommu_attr(bus, bus->iommu_opaque,
+                                               devfn, attr, data);
+    }
+    return -ENOENT;
+}
+
 void pci_setup_iommu(PCIBus *bus, const PCIIOMMUOps *ops, void *opaque)
 {
     bus->iommu_ops = ops;
diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
index 18cfba5..822ada5 100644
--- a/include/hw/pci/pci.h
+++ b/include/hw/pci/pci.h
@@ -486,13 +486,20 @@ void pci_bus_get_w64_range(PCIBus *bus, Range *range);
 
 void pci_device_deassert_intx(PCIDevice *dev);
 
+typedef enum IOMMUAttr {
+    IOMMU_WANT_NESTING,
+} IOMMUAttr;
+
 typedef struct PCIIOMMUOps PCIIOMMUOps;
 struct PCIIOMMUOps {
     AddressSpace * (*get_address_space)(PCIBus *bus,
                                 void *opaque, int32_t devfn);
+    int (*get_iommu_attr)(PCIBus *bus, void *opaque, int32_t devfn,
+                           IOMMUAttr attr, void *data);
 };
 
 AddressSpace *pci_device_iommu_address_space(PCIDevice *dev);
+int pci_device_get_iommu_attr(PCIDevice *dev, IOMMUAttr attr, void *data);
 void pci_setup_iommu(PCIBus *bus, const PCIIOMMUOps *iommu_ops, void *opaque);
 
 static inline void
-- 
2.7.4


