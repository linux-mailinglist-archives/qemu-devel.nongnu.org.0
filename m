Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFB1C389408
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 18:43:51 +0200 (CEST)
Received: from localhost ([::1]:55076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljPIU-0006Mk-G5
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 12:43:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1ljP6h-0005vw-20
 for qemu-devel@nongnu.org; Wed, 19 May 2021 12:31:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42824)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1ljP6e-0005vj-TV
 for qemu-devel@nongnu.org; Wed, 19 May 2021 12:31:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621441896;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=V9LrI5P9tyxXNbE1l58yZAifcj59RDu8GvtjXC0K7Og=;
 b=LcAqFqh2X7II5mS0+IPAK4TKFiTeAhxo7lCajMKLXbhmgYoE7gCR5w1fjAL1iM4knhxnVb
 Nq+sJ4bWG7efgL858jw3RkzgD9r89+yiG18w+pk7sRtsUxVzpnmh5rOE2EenFQ3aWBRi4/
 HVbCUAN5Lg5y07vaKlVW1oyPQo/opWc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-273-83H4Bj-EPdO9aS9zczD4mQ-1; Wed, 19 May 2021 12:31:33 -0400
X-MC-Unique: 83H4Bj-EPdO9aS9zczD4mQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9F607C73A4;
 Wed, 19 May 2021 16:31:31 +0000 (UTC)
Received: from eperezma.remote.csb (ovpn-113-65.ams2.redhat.com [10.36.113.65])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A24495D6AC;
 Wed, 19 May 2021 16:31:28 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC v3 18/29] vhost: Use vhost_enable_custom_iommu to unmap
 everything if available
Date: Wed, 19 May 2021 18:28:52 +0200
Message-Id: <20210519162903.1172366-19-eperezma@redhat.com>
In-Reply-To: <20210519162903.1172366-1-eperezma@redhat.com>
References: <20210519162903.1172366-1-eperezma@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
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
Cc: Parav Pandit <parav@mellanox.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 virtualization@lists.linux-foundation.org,
 Harpreet Singh Anand <hanand@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Eli Cohen <eli@mellanox.com>,
 Michael Lilja <ml@napatech.com>, Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This call is the right way to unmap every IOTLB in devices with non
standard IOMMU (vdpa devices), since regular one would require an IOTLB
message they don't support.

Another possible solution would be to implement
.vhost_send_device_iotlb_msg vhost operation in vhost-vdpa, but it
could conflict with expected backend iommu operations.

Currently, this method does not work for vp_vdpa. For some reason, intel
IOMMU is not able to map anything when vdpa has unmapped everything.
However that is on kernel side, this commit code should be as intended
in the final version.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 hw/virtio/vhost.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
index 5b5001a08a..c8fa9df9b3 100644
--- a/hw/virtio/vhost.c
+++ b/hw/virtio/vhost.c
@@ -1241,7 +1241,12 @@ static int vhost_sw_live_migration_stop(struct vhost_dev *dev)
 
     r = dev->vhost_ops->vhost_vring_pause(dev);
     assert(r == 0);
-    if (vhost_backend_invalidate_device_iotlb(dev, 0, -1ULL)) {
+    if (dev->vhost_ops->vhost_enable_custom_iommu) {
+        r = dev->vhost_ops->vhost_enable_custom_iommu(dev, false);
+    } else {
+        r = vhost_backend_invalidate_device_iotlb(dev, 0, -1ULL);
+    }
+    if (r) {
         error_report("Fail to invalidate device iotlb");
     }
 
@@ -1343,7 +1348,12 @@ static int vhost_sw_live_migration_start(struct vhost_dev *dev)
 
     r = dev->vhost_ops->vhost_vring_pause(dev);
     assert(r == 0);
-    if (vhost_backend_invalidate_device_iotlb(dev, 0, -1ULL)) {
+    if (dev->vhost_ops->vhost_enable_custom_iommu) {
+        r = dev->vhost_ops->vhost_enable_custom_iommu(dev, false);
+    } else {
+        r = vhost_backend_invalidate_device_iotlb(dev, 0, -1ULL);
+    }
+    if (r) {
         error_report("Fail to invalidate device iotlb");
     }
 
@@ -2100,8 +2110,6 @@ void qmp_x_vhost_enable_shadow_vq(const char *name, bool enable, Error **errp)
             err_cause = "Cannot pause device";
         } else if (hdev->vhost_ops->vhost_get_iova_range) {
             err_cause = "Device may not support all iova range";
-        } else if (hdev->vhost_ops->vhost_enable_custom_iommu) {
-            err_cause = "Device does not use regular IOMMU";
         } else if (!virtio_vdev_has_feature(hdev->vdev, VIRTIO_F_VERSION_1)) {
             err_cause = "Legacy VirtIO device";
         }
-- 
2.27.0


