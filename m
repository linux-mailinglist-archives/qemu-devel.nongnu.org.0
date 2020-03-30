Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A630F19736B
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Mar 2020 06:28:01 +0200 (CEST)
Received: from localhost ([::1]:44756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jIm1o-00084x-Oj
	for lists+qemu-devel@lfdr.de; Mon, 30 Mar 2020 00:28:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37827)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yi.l.liu@intel.com>) id 1jIltT-0000qq-9z
 for qemu-devel@nongnu.org; Mon, 30 Mar 2020 00:19:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <yi.l.liu@intel.com>) id 1jIltR-0007rl-Vj
 for qemu-devel@nongnu.org; Mon, 30 Mar 2020 00:19:23 -0400
Received: from mga07.intel.com ([134.134.136.100]:12573)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <yi.l.liu@intel.com>) id 1jIltR-0007o2-Ms
 for qemu-devel@nongnu.org; Mon, 30 Mar 2020 00:19:21 -0400
IronPort-SDR: 8/XBvJpv9bwcz+pHZSLdvTl42xLWtx8egm9XQ+k8yrGNcOt9f2RGbmYpUW+KwBG4gfw+hidW8+
 dcVM2EnRzeMQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Mar 2020 21:19:15 -0700
IronPort-SDR: qgNYyD69MoIiDphwOy365E8SrepQAAZKU4KDP1L17wz+CAzwFAlA8joiAPYPSP7bgSTbs7DeF3
 d6fgsDdPh2Bg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,322,1580803200"; d="scan'208";a="327632039"
Received: from jacob-builder.jf.intel.com ([10.7.199.155])
 by orsmga001.jf.intel.com with ESMTP; 29 Mar 2020 21:19:15 -0700
From: Liu Yi L <yi.l.liu@intel.com>
To: qemu-devel@nongnu.org,
	alex.williamson@redhat.com,
	peterx@redhat.com
Subject: [PATCH v2 10/22] vfio/pci: set host iommu context to vIOMMU
Date: Sun, 29 Mar 2020 21:24:49 -0700
Message-Id: <1585542301-84087-11-git-send-email-yi.l.liu@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1585542301-84087-1-git-send-email-yi.l.liu@intel.com>
References: <1585542301-84087-1-git-send-email-yi.l.liu@intel.com>
X-detected-operating-system: by eggs.gnu.org: FreeBSD 9.x [fuzzy]
X-Received-From: 134.134.136.100
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

For vfio-pci devices, it could use pci_device_set/unset_iommu() to
expose host iommu context to vIOMMU emulators. vIOMMU emulators
could make use the methods provided by host iommu context. e.g.
propagate requests to host iommu.

Cc: Kevin Tian <kevin.tian@intel.com>
Cc: Jacob Pan <jacob.jun.pan@linux.intel.com>
Cc: Peter Xu <peterx@redhat.com>
Cc: Eric Auger <eric.auger@redhat.com>
Cc: Yi Sun <yi.y.sun@linux.intel.com>
Cc: David Gibson <david@gibson.dropbear.id.au>
Cc: Alex Williamson <alex.williamson@redhat.com>
Signed-off-by: Liu Yi L <yi.l.liu@intel.com>
---
 hw/vfio/pci.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index 5e75a95..c140c88 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -2717,6 +2717,7 @@ static void vfio_realize(PCIDevice *pdev, Error **errp)
     VFIOPCIDevice *vdev = PCI_VFIO(pdev);
     VFIODevice *vbasedev_iter;
     VFIOGroup *group;
+    VFIOContainer *container;
     char *tmp, *subsys, group_path[PATH_MAX], *group_name;
     Error *err = NULL;
     ssize_t len;
@@ -3028,6 +3029,11 @@ static void vfio_realize(PCIDevice *pdev, Error **errp)
     vfio_register_req_notifier(vdev);
     vfio_setup_resetfn_quirk(vdev);
 
+    container = vdev->vbasedev.group->container;
+    if (container->iommu_ctx.initialized) {
+        pci_device_set_iommu_context(pdev, &container->iommu_ctx);
+    }
+
     return;
 
 out_deregister:
@@ -3072,9 +3078,16 @@ static void vfio_instance_finalize(Object *obj)
 static void vfio_exitfn(PCIDevice *pdev)
 {
     VFIOPCIDevice *vdev = PCI_VFIO(pdev);
+    VFIOContainer *container;
 
     vfio_unregister_req_notifier(vdev);
     vfio_unregister_err_notifier(vdev);
+
+    container = vdev->vbasedev.group->container;
+    if (container->iommu_ctx.initialized) {
+        pci_device_unset_iommu_context(pdev);
+    }
+
     pci_device_set_intx_routing_notifier(&vdev->pdev, NULL);
     if (vdev->irqchip_change_notifier.notify) {
         kvm_irqchip_remove_change_notifier(&vdev->irqchip_change_notifier);
-- 
2.7.4


