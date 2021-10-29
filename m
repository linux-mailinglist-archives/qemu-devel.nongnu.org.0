Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B724F4402DD
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 21:06:49 +0200 (CEST)
Received: from localhost ([::1]:34814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgXDE-0003AY-ID
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 15:06:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1mgWqD-0003Bn-Hy
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 14:43:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49561)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1mgWqB-0001yx-Hl
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 14:43:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635532978;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NZj9KElbujbo4le7lhfi0zaoetHlo5qDh/T488RMp3A=;
 b=aF0GaA6GTUSi/E7w/sOZmKT3FRC4UTu1s43cEejZReyR3xzubMcKw49I1oWCSvCOo3qZR5
 f5GGzxyzTN9RgF+WUzvMU+DP93pfORIX+rNHeBYlPniZXK0kEXDOnexPu+tqYZ5qZCvbxO
 43wclJhFoVpEcriR3sjiz1ydxeHp5ns=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-236-e1eOPHcxMvmaa6uF8uHZ0A-1; Fri, 29 Oct 2021 14:42:55 -0400
X-MC-Unique: e1eOPHcxMvmaa6uF8uHZ0A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 326553FA1;
 Fri, 29 Oct 2021 18:42:54 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.192.75])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7BB135D6CF;
 Fri, 29 Oct 2021 18:42:04 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v5 18/26] virtio: Add vhost_shadow_vq_get_vring_addr
Date: Fri, 29 Oct 2021 20:35:17 +0200
Message-Id: <20211029183525.1776416-19-eperezma@redhat.com>
In-Reply-To: <20211029183525.1776416-1-eperezma@redhat.com>
References: <20211029183525.1776416-1-eperezma@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Parav Pandit <parav@mellanox.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Peter Xu <peterx@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Eli Cohen <eli@mellanox.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Eric Blake <eblake@redhat.com>,
 virtualization@lists.linux-foundation.org,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It reports the shadow virtqueue address from qemu virtual address space.

Since this will be different from the guest's vaddr, but device can
access it, SVQ takes special care about its alignment & lack of garbage
data. It assumes that IOMMU will work in host_page_size ranges for
that.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 hw/virtio/vhost-shadow-virtqueue.h |  4 +++
 hw/virtio/vhost-shadow-virtqueue.c | 51 ++++++++++++++++++++++++++++++
 2 files changed, 55 insertions(+)

diff --git a/hw/virtio/vhost-shadow-virtqueue.h b/hw/virtio/vhost-shadow-virtqueue.h
index 607ec6e5eb..ed647d9648 100644
--- a/hw/virtio/vhost-shadow-virtqueue.h
+++ b/hw/virtio/vhost-shadow-virtqueue.h
@@ -22,6 +22,10 @@ const EventNotifier *vhost_svq_get_dev_kick_notifier(
 const EventNotifier *vhost_svq_get_svq_call_notifier(
                                               const VhostShadowVirtqueue *svq);
 void vhost_svq_set_host_mr_notifier(VhostShadowVirtqueue *svq, void *addr);
+void vhost_svq_get_vring_addr(const VhostShadowVirtqueue *svq,
+                              struct vhost_vring_addr *addr);
+size_t vhost_svq_driver_area_size(const VhostShadowVirtqueue *svq);
+size_t vhost_svq_device_area_size(const VhostShadowVirtqueue *svq);
 
 void vhost_svq_start(struct vhost_dev *dev, unsigned idx,
                      VhostShadowVirtqueue *svq, int svq_kick_fd);
diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shadow-virtqueue.c
index 77916d2fed..4a37ed62a8 100644
--- a/hw/virtio/vhost-shadow-virtqueue.c
+++ b/hw/virtio/vhost-shadow-virtqueue.c
@@ -9,12 +9,16 @@
 
 #include "qemu/osdep.h"
 #include "hw/virtio/vhost-shadow-virtqueue.h"
+#include "standard-headers/linux/vhost_types.h"
 
 #include "qemu/error-report.h"
 #include "qemu/main-loop.h"
 
 /* Shadow virtqueue to relay notifications */
 typedef struct VhostShadowVirtqueue {
+    /* Shadow vring */
+    struct vring vring;
+
     /* Shadow kick notifier, sent to vhost */
     EventNotifier hdev_kick;
     /* Shadow call notifier, sent to vhost */
@@ -38,6 +42,9 @@ typedef struct VhostShadowVirtqueue {
 
     /* Virtio queue shadowing */
     VirtQueue *vq;
+
+    /* Virtio device */
+    VirtIODevice *vdev;
 } VhostShadowVirtqueue;
 
 /**
@@ -113,6 +120,35 @@ void vhost_svq_set_guest_call_notifier(VhostShadowVirtqueue *svq, int call_fd)
     event_notifier_init_fd(&svq->svq_call, call_fd);
 }
 
+/*
+ * Get the shadow vq vring address.
+ * @svq Shadow virtqueue
+ * @addr Destination to store address
+ */
+void vhost_svq_get_vring_addr(const VhostShadowVirtqueue *svq,
+                              struct vhost_vring_addr *addr)
+{
+    addr->desc_user_addr = (uint64_t)svq->vring.desc;
+    addr->avail_user_addr = (uint64_t)svq->vring.avail;
+    addr->used_user_addr = (uint64_t)svq->vring.used;
+}
+
+size_t vhost_svq_driver_area_size(const VhostShadowVirtqueue *svq)
+{
+    uint16_t vq_idx = virtio_get_queue_index(svq->vq);
+    size_t desc_size = virtio_queue_get_desc_size(svq->vdev, vq_idx);
+    size_t avail_size = virtio_queue_get_avail_size(svq->vdev, vq_idx);
+
+    return ROUND_UP(desc_size + avail_size, qemu_real_host_page_size);
+}
+
+size_t vhost_svq_device_area_size(const VhostShadowVirtqueue *svq)
+{
+    uint16_t vq_idx = virtio_get_queue_index(svq->vq);
+    size_t used_size = virtio_queue_get_used_size(svq->vdev, vq_idx);
+    return ROUND_UP(used_size, qemu_real_host_page_size);
+}
+
 /**
  * Convenience function to set guest to SVQ kick fd
  *
@@ -195,6 +231,10 @@ void vhost_svq_stop(struct vhost_dev *dev, unsigned idx,
 VhostShadowVirtqueue *vhost_svq_new(struct vhost_dev *dev, int idx)
 {
     int vq_idx = dev->vq_index + idx;
+    unsigned num = virtio_queue_get_num(dev->vdev, vq_idx);
+    size_t desc_size = virtio_queue_get_desc_size(dev->vdev, vq_idx);
+    size_t driver_size;
+    size_t device_size;
     g_autofree VhostShadowVirtqueue *svq = g_new0(VhostShadowVirtqueue, 1);
     int r;
 
@@ -213,6 +253,15 @@ VhostShadowVirtqueue *vhost_svq_new(struct vhost_dev *dev, int idx)
     }
 
     svq->vq = virtio_get_queue(dev->vdev, vq_idx);
+    svq->vdev = dev->vdev;
+    driver_size = vhost_svq_driver_area_size(svq);
+    device_size = vhost_svq_device_area_size(svq);
+    svq->vring.num = num;
+    svq->vring.desc = qemu_memalign(qemu_real_host_page_size, driver_size);
+    svq->vring.avail = (void *)((char *)svq->vring.desc + desc_size);
+    memset(svq->vring.desc, 0, driver_size);
+    svq->vring.used = qemu_memalign(qemu_real_host_page_size, device_size);
+    memset(svq->vring.used, 0, device_size);
     event_notifier_set_handler(&svq->hdev_call, vhost_svq_handle_call);
     return g_steal_pointer(&svq);
 
@@ -231,5 +280,7 @@ void vhost_svq_free(VhostShadowVirtqueue *vq)
     event_notifier_cleanup(&vq->hdev_kick);
     event_notifier_set_handler(&vq->hdev_call, NULL);
     event_notifier_cleanup(&vq->hdev_call);
+    qemu_vfree(vq->vring.desc);
+    qemu_vfree(vq->vring.used);
     g_free(vq);
 }
-- 
2.27.0


