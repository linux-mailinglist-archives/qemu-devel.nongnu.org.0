Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 549D3389411
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 18:48:02 +0200 (CEST)
Received: from localhost ([::1]:34926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljPMX-0003Zi-Ct
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 12:48:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1ljP69-0004ZC-S6
 for qemu-devel@nongnu.org; Wed, 19 May 2021 12:31:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58322)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1ljP67-0005fl-OK
 for qemu-devel@nongnu.org; Wed, 19 May 2021 12:31:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621441863;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=L2lLIl9UsgREXs2nPJJjVHAoVYw+HdUzi/kUksrz3ms=;
 b=SQB9dl1VT+jxN/gBdHd4xofx+1fC3gIkuwPAsXLOyTh/nQ3drE7EeU6VLDq6InqciPcK4T
 Z+GT38dygA2o2NYC34LkdBq4B1qpfecO6m5L7ObKBN0/x/yVZ1WqjWVytvGfAuF8Zc6dAb
 kongxf4k4QqtewzFy+5qnnGZ3rQwUT4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-447-l-anlM_ZMQKjN4oyPi9KlA-1; Wed, 19 May 2021 12:31:00 -0400
X-MC-Unique: l-anlM_ZMQKjN4oyPi9KlA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2EA80180FD69;
 Wed, 19 May 2021 16:30:59 +0000 (UTC)
Received: from eperezma.remote.csb (ovpn-113-65.ams2.redhat.com [10.36.113.65])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3DC5F5D6AC;
 Wed, 19 May 2021 16:30:56 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC v3 13/29] vhost: Add vhost_get_iova_range operation
Date: Wed, 19 May 2021 18:28:47 +0200
Message-Id: <20210519162903.1172366-14-eperezma@redhat.com>
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

For simplicity, If a device does not support this operation it means
that it can handle full (uint64_t)-1 iova address.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 include/hw/virtio/vhost-backend.h |  5 +++++
 hw/virtio/vhost-vdpa.c            | 18 ++++++++++++++++++
 hw/virtio/trace-events            |  1 +
 3 files changed, 24 insertions(+)

diff --git a/include/hw/virtio/vhost-backend.h b/include/hw/virtio/vhost-backend.h
index 94d3323905..bcb112c166 100644
--- a/include/hw/virtio/vhost-backend.h
+++ b/include/hw/virtio/vhost-backend.h
@@ -36,6 +36,7 @@ struct vhost_vring_addr;
 struct vhost_scsi_target;
 struct vhost_iotlb_msg;
 struct vhost_virtqueue;
+struct vhost_vdpa_iova_range;
 
 typedef int (*vhost_backend_init)(struct vhost_dev *dev, void *opaque);
 typedef int (*vhost_backend_cleanup)(struct vhost_dev *dev);
@@ -127,6 +128,9 @@ typedef bool (*vhost_force_iommu_op)(struct vhost_dev *dev);
 
 typedef int (*vhost_vring_pause_op)(struct vhost_dev *dev);
 
+typedef int (*vhost_get_iova_range)(struct vhost_dev *dev,
+                                    hwaddr *first, hwaddr *last);
+
 typedef struct VhostOps {
     VhostBackendType backend_type;
     vhost_backend_init vhost_backend_init;
@@ -173,6 +177,7 @@ typedef struct VhostOps {
     vhost_get_device_id_op vhost_get_device_id;
     vhost_vring_pause_op vhost_vring_pause;
     vhost_force_iommu_op vhost_force_iommu;
+    vhost_get_iova_range vhost_get_iova_range;
 } VhostOps;
 
 extern const VhostOps user_ops;
diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index 01d2101d09..74fe92935e 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -579,6 +579,23 @@ static bool  vhost_vdpa_force_iommu(struct vhost_dev *dev)
     return true;
 }
 
+static int vhost_vdpa_get_iova_range(struct vhost_dev *dev,
+                                     hwaddr *first, hwaddr *last)
+{
+    int ret;
+    struct vhost_vdpa_iova_range range;
+
+    ret = vhost_vdpa_call(dev, VHOST_VDPA_GET_IOVA_RANGE, &range);
+    if (ret != 0) {
+        return ret;
+    }
+
+    *first = range.first;
+    *last = range.last;
+    trace_vhost_vdpa_get_iova_range(dev, *first, *last);
+    return ret;
+}
+
 const VhostOps vdpa_ops = {
         .backend_type = VHOST_BACKEND_TYPE_VDPA,
         .vhost_backend_init = vhost_vdpa_init,
@@ -611,4 +628,5 @@ const VhostOps vdpa_ops = {
         .vhost_get_device_id = vhost_vdpa_get_device_id,
         .vhost_vq_get_addr = vhost_vdpa_vq_get_addr,
         .vhost_force_iommu = vhost_vdpa_force_iommu,
+        .vhost_get_iova_range = vhost_vdpa_get_iova_range,
 };
diff --git a/hw/virtio/trace-events b/hw/virtio/trace-events
index c62727f879..5debe3a681 100644
--- a/hw/virtio/trace-events
+++ b/hw/virtio/trace-events
@@ -52,6 +52,7 @@ vhost_vdpa_set_vring_call(void *dev, unsigned int index, int fd) "dev: %p index:
 vhost_vdpa_get_features(void *dev, uint64_t features) "dev: %p features: 0x%"PRIx64
 vhost_vdpa_set_owner(void *dev) "dev: %p"
 vhost_vdpa_vq_get_addr(void *dev, void *vq, uint64_t desc_user_addr, uint64_t avail_user_addr, uint64_t used_user_addr) "dev: %p vq: %p desc_user_addr: 0x%"PRIx64" avail_user_addr: 0x%"PRIx64" used_user_addr: 0x%"PRIx64
+vhost_vdpa_get_iova_range(void *dev, uint64_t first, uint64_t last) "dev: %p first: 0x%"PRIx64" last: 0x%"PRIx64
 
 # virtio.c
 virtqueue_alloc_element(void *elem, size_t sz, unsigned in_num, unsigned out_num) "elem %p size %zd in_num %u out_num %u"
-- 
2.27.0


