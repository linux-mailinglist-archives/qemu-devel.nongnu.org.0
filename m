Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 706113DFA17
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Aug 2021 05:49:33 +0200 (CEST)
Received: from localhost ([::1]:54968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mB7uO-0000M6-Fo
	for lists+qemu-devel@lfdr.de; Tue, 03 Aug 2021 23:49:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mB7tJ-0006lr-U6
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 23:48:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57822)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mB7tI-0000N9-Dt
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 23:48:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628048903;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0ptP2saJcjmNSscLJyKkxAtiVNxPPWQgEJ848xCAK5I=;
 b=PI6uxL4ON4ba99ULNue7IH+maM0FybrPIq7yifdU1Crv6lNkDEfVFr8iuTEu80LUDngc98
 tXHWZs94O+h/g4fBfNqYTArbeZRxsuopOp3IXumlguQ+PCvr6+/QB3UO5D6TPtTYmcBpej
 bMJ+aOBMhnkt56/t0ue1gL4rTLu7wS0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-204-O_KCfFESP8-eyzzcGBo9mg-1; Tue, 03 Aug 2021 23:48:22 -0400
X-MC-Unique: O_KCfFESP8-eyzzcGBo9mg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3D47F824F8D;
 Wed,  4 Aug 2021 03:48:21 +0000 (UTC)
Received: from localhost.localdomain (ovpn-12-234.pek2.redhat.com
 [10.72.12.234])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CDB4D781E8;
 Wed,  4 Aug 2021 03:48:17 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/3] virtio-bus: introduce iommu_enabled()
Date: Wed,  4 Aug 2021 11:48:01 +0800
Message-Id: <20210804034803.1644-2-jasowang@redhat.com>
In-Reply-To: <20210804034803.1644-1-jasowang@redhat.com>
References: <20210804034803.1644-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: mst@redhat.com, Jason Wang <jasowang@redhat.com>, Wei.Huang2@amd.com,
 dgilbert@redhat.com, peterx@redhat.com, Sriyash.Caculo@amd.com,
 pbonzini@redhat.com, chao.gao@intel.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch introduce a new method for the virtio-bus for the transport
to report whether or not the IOMMU is enabled for the device.

Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 hw/virtio/virtio-bus.c         | 14 ++++++++++++++
 include/hw/virtio/virtio-bus.h |  4 +++-
 2 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/hw/virtio/virtio-bus.c b/hw/virtio/virtio-bus.c
index 859978d248..d23db98c56 100644
--- a/hw/virtio/virtio-bus.c
+++ b/hw/virtio/virtio-bus.c
@@ -325,6 +325,20 @@ static char *virtio_bus_get_fw_dev_path(DeviceState *dev)
     return NULL;
 }
 
+bool virtio_bus_device_iommu_enabled(VirtIODevice *vdev)
+{
+    DeviceState *qdev = DEVICE(vdev);
+    BusState *qbus = BUS(qdev_get_parent_bus(qdev));
+    VirtioBusState *bus = VIRTIO_BUS(qbus);
+    VirtioBusClass *klass = VIRTIO_BUS_GET_CLASS(bus);
+
+    if (!klass->iommu_enabled) {
+        return false;
+    }
+
+    return klass->iommu_enabled(qbus->parent);
+}
+
 static void virtio_bus_class_init(ObjectClass *klass, void *data)
 {
     BusClass *bus_class = BUS_CLASS(klass);
diff --git a/include/hw/virtio/virtio-bus.h b/include/hw/virtio/virtio-bus.h
index ef8abe49c5..7ab8c9dab0 100644
--- a/include/hw/virtio/virtio-bus.h
+++ b/include/hw/virtio/virtio-bus.h
@@ -93,6 +93,7 @@ struct VirtioBusClass {
      */
     bool has_variable_vring_alignment;
     AddressSpace *(*get_dma_as)(DeviceState *d);
+    bool (*iommu_enabled)(DeviceState *d);
 };
 
 struct VirtioBusState {
@@ -154,5 +155,6 @@ void virtio_bus_release_ioeventfd(VirtioBusState *bus);
 int virtio_bus_set_host_notifier(VirtioBusState *bus, int n, bool assign);
 /* Tell the bus that the ioeventfd handler is no longer required. */
 void virtio_bus_cleanup_host_notifier(VirtioBusState *bus, int n);
-
+/* Whether the IOMMU is enabled for this device */
+bool virtio_bus_device_iommu_enabled(VirtIODevice *vdev);
 #endif /* VIRTIO_BUS_H */
-- 
2.25.1


