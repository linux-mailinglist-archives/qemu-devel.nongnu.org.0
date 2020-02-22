Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A0DE168D75
	for <lists+qemu-devel@lfdr.de>; Sat, 22 Feb 2020 09:06:03 +0100 (CET)
Received: from localhost ([::1]:39928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j5PnW-0007MM-8q
	for lists+qemu-devel@lfdr.de; Sat, 22 Feb 2020 03:06:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57457)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yi.l.liu@intel.com>) id 1j5Pjk-0002BC-HO
 for qemu-devel@nongnu.org; Sat, 22 Feb 2020 03:02:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <yi.l.liu@intel.com>) id 1j5Pji-00081e-Re
 for qemu-devel@nongnu.org; Sat, 22 Feb 2020 03:02:08 -0500
Received: from mga12.intel.com ([192.55.52.136]:36223)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <yi.l.liu@intel.com>) id 1j5Pji-0007tv-Hy
 for qemu-devel@nongnu.org; Sat, 22 Feb 2020 03:02:06 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Feb 2020 00:01:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,471,1574150400"; d="scan'208";a="240547665"
Received: from jacob-builder.jf.intel.com ([10.7.199.155])
 by orsmga006.jf.intel.com with ESMTP; 22 Feb 2020 00:01:56 -0800
From: Liu Yi L <yi.l.liu@intel.com>
To: qemu-devel@nongnu.org,
	alex.williamson@redhat.com,
	peterx@redhat.com
Subject: [RFC v3.1 05/22] hw/pci: add pci_device_setup_iommu
Date: Sat, 22 Feb 2020 00:07:06 -0800
Message-Id: <1582358843-51931-6-git-send-email-yi.l.liu@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1582358843-51931-1-git-send-email-yi.l.liu@intel.com>
References: <1582358843-51931-1-git-send-email-yi.l.liu@intel.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 192.55.52.136
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
Cc: kevin.tian@intel.com, yi.l.liu@intel.com, Yi Sun <yi.y.sun@linux.intel.com>,
 kvm@vger.kernel.org, mst@redhat.com, jun.j.tian@intel.com,
 eric.auger@redhat.com, yi.y.sun@intel.com,
 Jacob Pan <jacob.jun.pan@linux.intel.com>, pbonzini@redhat.com,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

HostIOMMUContext was introduced to provide an explicit way for vIOMMU
emulators call into pass-through components (e.g. VFIO). vIOMMU needs
to get the HostIOMMUContext before using it. This patch adds a new
callback in PCIDevice, which would be set by pass-through components,
and be used by vIOMMU emulators to get HostIOMMUContext.

Cc: Kevin Tian <kevin.tian@intel.com>
Cc: Jacob Pan <jacob.jun.pan@linux.intel.com>
Cc: Peter Xu <peterx@redhat.com>
Cc: Eric Auger <eric.auger@redhat.com>
Cc: Yi Sun <yi.y.sun@linux.intel.com>
Cc: David Gibson <david@gibson.dropbear.id.au>
Cc: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Liu, Yi L <yi.l.liu@intel.com>
---
 hw/pci/pci.c         | 10 ++++++++++
 include/hw/pci/pci.h |  6 ++++++
 2 files changed, 16 insertions(+)

diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index e1ed667..3166cc3 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -2695,6 +2695,16 @@ void pci_setup_iommu(PCIBus *bus, PCIIOMMUFunc fn, void *opaque)
     bus->iommu_opaque = opaque;
 }
 
+void pci_device_setup_iommu(PCIDevice *dev, PCIHostIOMMUFunc fn)
+{
+    dev->host_iommu_fn = fn;
+}
+
+void pci_device_unset_iommu(PCIDevice *dev)
+{
+    dev->host_iommu_fn = NULL;
+}
+
 static void pci_dev_get_w64(PCIBus *b, PCIDevice *dev, void *opaque)
 {
     Range *range = opaque;
diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
index 2acd832..e44eefb 100644
--- a/include/hw/pci/pci.h
+++ b/include/hw/pci/pci.h
@@ -8,6 +8,7 @@
 #include "hw/isa/isa.h"
 
 #include "hw/pci/pcie.h"
+#include "hw/iommu/host_iommu_context.h"
 
 extern bool pci_available;
 
@@ -248,6 +249,7 @@ typedef void (*MSIVectorReleaseNotifier)(PCIDevice *dev, unsigned int vector);
 typedef void (*MSIVectorPollNotifier)(PCIDevice *dev,
                                       unsigned int vector_start,
                                       unsigned int vector_end);
+typedef HostIOMMUContext *(*PCIHostIOMMUFunc)(PCIDevice *);
 
 enum PCIReqIDType {
     PCI_REQ_ID_INVALID = 0,
@@ -356,6 +358,8 @@ struct PCIDevice {
 
     /* ID of standby device in net_failover pair */
     char *failover_pair_id;
+    /* Callback to get host iommu context */
+    PCIHostIOMMUFunc host_iommu_fn;
 };
 
 void pci_register_bar(PCIDevice *pci_dev, int region_num,
@@ -488,6 +492,8 @@ typedef AddressSpace *(*PCIIOMMUFunc)(PCIBus *, void *, int);
 
 AddressSpace *pci_device_iommu_address_space(PCIDevice *dev);
 void pci_setup_iommu(PCIBus *bus, PCIIOMMUFunc fn, void *opaque);
+void pci_device_setup_iommu(PCIDevice *dev, PCIHostIOMMUFunc fn);
+void pci_device_unset_iommu(PCIDevice *dev);
 
 static inline void
 pci_set_byte(uint8_t *config, uint8_t val)
-- 
2.7.4


