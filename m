Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9C6E602C21
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Oct 2022 14:51:37 +0200 (CEST)
Received: from localhost ([::1]:56002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okm4G-0006hn-LV
	for lists+qemu-devel@lfdr.de; Tue, 18 Oct 2022 08:51:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1oklid-0005KE-6t
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 08:29:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:30655)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1okliX-000181-A5
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 08:29:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666096142;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=J2cD92ikt8Cq53rD4A2px2ZZpourOkv6/yVuNUW38UA=;
 b=JPXSgv+oKa/3bgI0e10o+fV1Yhxtz/54MEUBKIhmJXds4viyiAv+7fD2Vh89E9+TwOuymk
 Y2Lf6peJ+19ILHnoULouvxdfcZjQ9IqtxY+UqJ77k7+1MuzwqaOAw6hyhjzeZKnrXYVcOf
 622vmG9vn2llB1IlkNJNmo4tSuR8Wk4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-627-LQIsakJTNJSmPgvs3UxmDg-1; Tue, 18 Oct 2022 08:29:01 -0400
X-MC-Unique: LQIsakJTNJSmPgvs3UxmDg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 14E10102F03A;
 Tue, 18 Oct 2022 12:29:01 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.39.193.146])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2F38340C2065;
 Tue, 18 Oct 2022 12:28:58 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, mst@redhat.com,
 peterx@redhat.com, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 eperezma@redhat.com, jasowang@redhat.com
Subject: [PATCH] vhost: Warn if DEVIOTLB_UNMAP is not supported and ats is set
Date: Tue, 18 Oct 2022 14:28:52 +0200
Message-Id: <20221018122852.1185395-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.256,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since b68ba1ca5767 ("memory: Add IOMMU_NOTIFIER_DEVIOTLB_UNMAP
IOMMUTLBNotificationType"), vhost attempts to register DEVIOTLB_UNMAP
notifier. This latter is supported by the intel-iommu which supports
device-iotlb if the corresponding option is set. Then 958ec334bca3
("vhost: Unbreak SMMU and virtio-iommu on dev-iotlb support") allowed
silent fallback to the legacy UNMAP notifier if the viommu does not
support device iotlb.

Initially vhost/viommu integration was introduced with intel iommu
assuming ats=on was set on virtio-pci device and device-iotlb was set
on the intel iommu. vhost acts as an ATS capable device since it
implements an IOTLB on kernel side. However translated transactions
that hit the device IOTLB do not transit through the vIOMMU. So this
requires a limited ATS support on viommu side.

However, in theory, if ats=on is set on a pci device, the
viommu should support ATS for that device to work.

But neither SMMUv3 nor virtio-iommu do support ATS and the integration
with vhost just relies on the fact those vIOMMU send UNMAP notifications
whenever the guest trigger them.

So the situation with respect to ats setting on virtio-pci side and
ats support on viommu side has become quite confusing, especially on
ARM. Is ats needed whereas vIOMMUs do not support device IOTLBs.

This patch makes sure we get a warning if ats is set on a device
protected by virtio-iommu or vsmmuv3, reminding that we don't have
full support of ATS on those vIOMMUs and ats setting on end-point
is not a requirement.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 include/hw/virtio/virtio-bus.h |  3 +++
 hw/virtio/vhost.c              | 21 ++++++++++++++++++++-
 hw/virtio/virtio-bus.c         | 14 ++++++++++++++
 hw/virtio/virtio-pci.c         | 11 +++++++++++
 4 files changed, 48 insertions(+), 1 deletion(-)

diff --git a/include/hw/virtio/virtio-bus.h b/include/hw/virtio/virtio-bus.h
index 7ab8c9dab0..df96cf5b4d 100644
--- a/include/hw/virtio/virtio-bus.h
+++ b/include/hw/virtio/virtio-bus.h
@@ -94,6 +94,7 @@ struct VirtioBusClass {
     bool has_variable_vring_alignment;
     AddressSpace *(*get_dma_as)(DeviceState *d);
     bool (*iommu_enabled)(DeviceState *d);
+    bool (*ats_enabled)(DeviceState *d);
 };
 
 struct VirtioBusState {
@@ -157,4 +158,6 @@ int virtio_bus_set_host_notifier(VirtioBusState *bus, int n, bool assign);
 void virtio_bus_cleanup_host_notifier(VirtioBusState *bus, int n);
 /* Whether the IOMMU is enabled for this device */
 bool virtio_bus_device_iommu_enabled(VirtIODevice *vdev);
+/* Whether ATS is enabled for this device */
+bool virtio_bus_device_ats_enabled(VirtIODevice *vdev);
 #endif /* VIRTIO_BUS_H */
diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
index 5185c15295..b5ad4262c1 100644
--- a/hw/virtio/vhost.c
+++ b/hw/virtio/vhost.c
@@ -324,6 +324,16 @@ static bool vhost_dev_has_iommu(struct vhost_dev *dev)
     }
 }
 
+static bool vhost_dev_ats_enabled(struct vhost_dev *dev)
+{
+    VirtIODevice *vdev = dev->vdev;
+
+    if (vdev && virtio_bus_device_ats_enabled(vdev)) {
+        return true;
+    }
+    return false;
+}
+
 static void *vhost_memory_map(struct vhost_dev *dev, hwaddr addr,
                               hwaddr *plen, bool is_write)
 {
@@ -737,6 +747,7 @@ static void vhost_iommu_region_add(MemoryListener *listener,
     Int128 end;
     int iommu_idx;
     IOMMUMemoryRegion *iommu_mr;
+    Error *err = NULL;
     int ret;
 
     if (!memory_region_is_iommu(section->mr)) {
@@ -760,8 +771,16 @@ static void vhost_iommu_region_add(MemoryListener *listener,
     iommu->iommu_offset = section->offset_within_address_space -
                           section->offset_within_region;
     iommu->hdev = dev;
-    ret = memory_region_register_iommu_notifier(section->mr, &iommu->n, NULL);
+    ret = memory_region_register_iommu_notifier(section->mr, &iommu->n, &err);
     if (ret) {
+        if (vhost_dev_ats_enabled(dev)) {
+            error_reportf_err(err,
+                              "vhost cannot register DEVIOTLB_UNMAP "
+                              "although ATS is enabled, "
+                              "fall back to legacy UNMAP notifier: ");
+        } else {
+            error_free(err);
+        }
         /*
          * Some vIOMMUs do not support dev-iotlb yet.  If so, try to use the
          * UNMAP legacy message
diff --git a/hw/virtio/virtio-bus.c b/hw/virtio/virtio-bus.c
index 896feb37a1..6276779b07 100644
--- a/hw/virtio/virtio-bus.c
+++ b/hw/virtio/virtio-bus.c
@@ -348,6 +348,20 @@ bool virtio_bus_device_iommu_enabled(VirtIODevice *vdev)
     return klass->iommu_enabled(qbus->parent);
 }
 
+bool virtio_bus_device_ats_enabled(VirtIODevice *vdev)
+{
+    DeviceState *qdev = DEVICE(vdev);
+    BusState *qbus = BUS(qdev_get_parent_bus(qdev));
+    VirtioBusState *bus = VIRTIO_BUS(qbus);
+    VirtioBusClass *klass = VIRTIO_BUS_GET_CLASS(bus);
+
+    if (!klass->ats_enabled) {
+        return false;
+    }
+
+    return klass->ats_enabled(qbus->parent);
+}
+
 static void virtio_bus_class_init(ObjectClass *klass, void *data)
 {
     BusClass *bus_class = BUS_CLASS(klass);
diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
index e7d80242b7..d33a47abbf 100644
--- a/hw/virtio/virtio-pci.c
+++ b/hw/virtio/virtio-pci.c
@@ -1141,6 +1141,16 @@ static bool virtio_pci_iommu_enabled(DeviceState *d)
     return true;
 }
 
+static bool virtio_pci_ats_enabled(DeviceState *d)
+{
+    VirtIOPCIProxy *proxy = VIRTIO_PCI(d);
+
+    if (proxy->flags & VIRTIO_PCI_FLAG_ATS) {
+        return true;
+    }
+    return false;
+}
+
 static bool virtio_pci_queue_enabled(DeviceState *d, int n)
 {
     VirtIOPCIProxy *proxy = VIRTIO_PCI(d);
@@ -2229,6 +2239,7 @@ static void virtio_pci_bus_class_init(ObjectClass *klass, void *data)
     k->ioeventfd_assign = virtio_pci_ioeventfd_assign;
     k->get_dma_as = virtio_pci_get_dma_as;
     k->iommu_enabled = virtio_pci_iommu_enabled;
+    k->ats_enabled = virtio_pci_ats_enabled;
     k->queue_enabled = virtio_pci_queue_enabled;
 }
 
-- 
2.35.3


