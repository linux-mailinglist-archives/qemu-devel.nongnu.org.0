Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D7CB61076
	for <lists+qemu-devel@lfdr.de>; Sat,  6 Jul 2019 13:26:12 +0200 (CEST)
Received: from localhost ([::1]:58786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hjipX-0008Qa-Ft
	for lists+qemu-devel@lfdr.de; Sat, 06 Jul 2019 07:26:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52410)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <yi.l.liu@intel.com>) id 1hjiin-00033E-AC
 for qemu-devel@nongnu.org; Sat, 06 Jul 2019 07:19:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <yi.l.liu@intel.com>) id 1hjiim-0005vM-6i
 for qemu-devel@nongnu.org; Sat, 06 Jul 2019 07:19:13 -0400
Received: from mga14.intel.com ([192.55.52.115]:2961)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <yi.l.liu@intel.com>) id 1hjiil-0005e0-NA
 for qemu-devel@nongnu.org; Sat, 06 Jul 2019 07:19:12 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 06 Jul 2019 04:19:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,458,1557212400"; d="scan'208";a="363355006"
Received: from yiliu-dev.bj.intel.com ([10.238.156.139])
 by fmsmga005.fm.intel.com with ESMTP; 06 Jul 2019 04:19:08 -0700
From: Liu Yi L <yi.l.liu@intel.com>
To: qemu-devel@nongnu.org, mst@redhat.com, pbonzini@redhat.com,
 alex.williamson@redhat.com, peterx@redhat.com
Date: Fri,  5 Jul 2019 19:01:40 +0800
Message-Id: <1562324511-2910-8-git-send-email-yi.l.liu@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1562324511-2910-1-git-send-email-yi.l.liu@intel.com>
References: <1562324511-2910-1-git-send-email-yi.l.liu@intel.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 192.55.52.115
Subject: [Qemu-devel] [RFC v1 07/18] hw/pci: add
 pci_device_bind/unbind_gpasid
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
Cc: tianyu.lan@intel.com, kevin.tian@intel.com, yi.l.liu@intel.com,
 Yi Sun <yi.y.sun@linux.intel.com>, kvm@vger.kernel.org, jun.j.tian@intel.com,
 eric.auger@redhat.com, yi.y.sun@intel.com,
 Jacob Pan <jacob.jun.pan@linux.intel.com>, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch adds two callbacks pci_device_bind/unbind_gpasid() to
PCIPASIDOps. These two callbacks are used to propagate guest pasid
bind/unbind to host. The implementations of the callbacks would be
device passthru modules like vfio.

Cc: Kevin Tian <kevin.tian@intel.com>
Cc: Jacob Pan <jacob.jun.pan@linux.intel.com>
Cc: Peter Xu <peterx@redhat.com>
Cc: Eric Auger <eric.auger@redhat.com>
Cc: Yi Sun <yi.y.sun@linux.intel.com>
Cc: David Gibson <david@gibson.dropbear.id.au>
Signed-off-by: Liu Yi L <yi.l.liu@intel.com>
---
 hw/pci/pci.c         | 30 ++++++++++++++++++++++++++++++
 include/hw/pci/pci.h |  9 +++++++++
 2 files changed, 39 insertions(+)

diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index 710f9e9..2229229 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -2676,6 +2676,36 @@ int pci_device_request_pasid_free(PCIBus *bus, int32_t devfn,
     return -1;
 }
 
+void pci_device_bind_gpasid(PCIBus *bus, int32_t devfn,
+                                struct gpasid_bind_data *g_bind_data)
+{
+    PCIDevice *dev;
+
+    if (!bus) {
+        return;
+    }
+
+    dev = bus->devices[devfn];
+    if (dev && dev->pasid_ops) {
+        dev->pasid_ops->bind_gpasid(bus, devfn, g_bind_data);
+    }
+}
+
+void pci_device_unbind_gpasid(PCIBus *bus, int32_t devfn,
+                                struct gpasid_bind_data *g_bind_data)
+{
+    PCIDevice *dev;
+
+    if (!bus) {
+        return;
+    }
+
+    dev = bus->devices[devfn];
+    if (dev && dev->pasid_ops) {
+        dev->pasid_ops->unbind_gpasid(bus, devfn, g_bind_data);
+    }
+}
+
 static void pci_dev_get_w64(PCIBus *b, PCIDevice *dev, void *opaque)
 {
     Range *range = opaque;
diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
index 16e5b8e..8d849e6 100644
--- a/include/hw/pci/pci.h
+++ b/include/hw/pci/pci.h
@@ -9,6 +9,7 @@
 #include "hw/isa/isa.h"
 
 #include "hw/pci/pcie.h"
+#include <linux/iommu.h>
 
 extern bool pci_available;
 
@@ -267,6 +268,10 @@ struct PCIPASIDOps {
     int (*alloc_pasid)(PCIBus *bus, int32_t devfn,
                          uint32_t min_pasid, uint32_t max_pasid);
     int (*free_pasid)(PCIBus *bus, int32_t devfn, uint32_t pasid);
+    void (*bind_gpasid)(PCIBus *bus, int32_t devfn,
+                            struct gpasid_bind_data *g_bind_data);
+    void (*unbind_gpasid)(PCIBus *bus, int32_t devfn,
+                            struct gpasid_bind_data *g_bind_data);
 };
 
 struct PCIDevice {
@@ -497,6 +502,10 @@ bool pci_device_is_ops_set(PCIBus *bus, int32_t devfn);
 int pci_device_request_pasid_alloc(PCIBus *bus, int32_t devfn,
                                    uint32_t min_pasid, uint32_t max_pasid);
 int pci_device_request_pasid_free(PCIBus *bus, int32_t devfn, uint32_t pasid);
+void pci_device_bind_gpasid(PCIBus *bus, int32_t devfn,
+                            struct gpasid_bind_data *g_bind_data);
+void pci_device_unbind_gpasid(PCIBus *bus, int32_t devfn,
+                            struct gpasid_bind_data *g_bind_data);
 
 static inline void
 pci_set_byte(uint8_t *config, uint8_t val)
-- 
2.7.4


