Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A49341E834
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Oct 2021 09:18:23 +0200 (CEST)
Received: from localhost ([::1]:33068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWCoI-0005bc-EH
	for lists+qemu-devel@lfdr.de; Fri, 01 Oct 2021 03:18:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1mWChQ-0000Q5-Iy
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 03:11:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21952)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1mWChO-0004Jy-Uy
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 03:11:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633072274;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=okT+K7yCEHpbCZs4NzHTB6jwBt2kx5s0YjoEQl1sNhM=;
 b=d415CMCYrGABIV6ZQsdFSTK+KrNKleSkRnTaP7hyXV/KtxlK5om1D48zEvihpPJTDX7LC1
 HxFubX29kvboFo5e3qJQYdnQn1IDxwiT3PpK+tUxtHooPl0mjmuh56ZSBcQdooq6vJlTkd
 lVevqbc1oQRXPGFYOvirg9Arhi77DYI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-510-AeJtO8dSNXKVmdHZOODiEw-1; Fri, 01 Oct 2021 03:11:13 -0400
X-MC-Unique: AeJtO8dSNXKVmdHZOODiEw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D5AC7824FA6;
 Fri,  1 Oct 2021 07:11:11 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.193.2])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8F2D319811;
 Fri,  1 Oct 2021 07:11:02 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v4 12/20] virtio: Add vhost_shadow_vq_get_vring_addr
Date: Fri,  1 Oct 2021 09:05:55 +0200
Message-Id: <20211001070603.307037-13-eperezma@redhat.com>
In-Reply-To: <20211001070603.307037-1-eperezma@redhat.com>
References: <20211001070603.307037-1-eperezma@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
Cc: Parav Pandit <parav@mellanox.com>, Juan Quintela <quintela@redhat.com>,
 Jason Wang <jasowang@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 virtualization@lists.linux-foundation.org,
 Harpreet Singh Anand <hanand@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Eli Cohen <eli@mellanox.com>,
 Eric Blake <eblake@redhat.com>, Michael Lilja <ml@napatech.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It reports the shadow virtqueue address from qemu virtual address space

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 hw/virtio/vhost-shadow-virtqueue.h |  4 +++
 hw/virtio/vhost-shadow-virtqueue.c | 50 ++++++++++++++++++++++++++++++
 2 files changed, 54 insertions(+)

diff --git a/hw/virtio/vhost-shadow-virtqueue.h b/hw/virtio/vhost-shadow-virtqueue.h
index 237cfceb9c..2df3d117f5 100644
--- a/hw/virtio/vhost-shadow-virtqueue.h
+++ b/hw/virtio/vhost-shadow-virtqueue.h
@@ -16,6 +16,10 @@ typedef struct VhostShadowVirtqueue VhostShadowVirtqueue;
 
 EventNotifier *vhost_svq_get_svq_call_notifier(VhostShadowVirtqueue *svq);
 void vhost_svq_set_guest_call_notifier(VhostShadowVirtqueue *svq, int call_fd);
+void vhost_svq_get_vring_addr(const VhostShadowVirtqueue *svq,
+                              struct vhost_vring_addr *addr);
+size_t vhost_svq_driver_area_size(const VhostShadowVirtqueue *svq);
+size_t vhost_svq_device_area_size(const VhostShadowVirtqueue *svq);
 
 bool vhost_svq_start(struct vhost_dev *dev, unsigned idx,
                      VhostShadowVirtqueue *svq);
diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shadow-virtqueue.c
index 3fe129cf63..5c1899f6af 100644
--- a/hw/virtio/vhost-shadow-virtqueue.c
+++ b/hw/virtio/vhost-shadow-virtqueue.c
@@ -18,6 +18,9 @@
 
 /* Shadow virtqueue to relay notifications */
 typedef struct VhostShadowVirtqueue {
+    /* Shadow vring */
+    struct vring vring;
+
     /* Shadow kick notifier, sent to vhost */
     EventNotifier kick_notifier;
     /* Shadow call notifier, sent to vhost */
@@ -38,6 +41,9 @@ typedef struct VhostShadowVirtqueue {
 
     /* Virtio queue shadowing */
     VirtQueue *vq;
+
+    /* Virtio device */
+    VirtIODevice *vdev;
 } VhostShadowVirtqueue;
 
 /* Forward guest notifications */
@@ -93,6 +99,35 @@ void vhost_svq_set_guest_call_notifier(VhostShadowVirtqueue *svq, int call_fd)
     event_notifier_init_fd(&svq->guest_call_notifier, call_fd);
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
 /*
  * Restore the vhost guest to host notifier, i.e., disables svq effect.
  */
@@ -178,6 +213,10 @@ void vhost_svq_stop(struct vhost_dev *dev, unsigned idx,
 VhostShadowVirtqueue *vhost_svq_new(struct vhost_dev *dev, int idx)
 {
     int vq_idx = dev->vq_index + idx;
+    unsigned num = virtio_queue_get_num(dev->vdev, vq_idx);
+    size_t desc_size = virtio_queue_get_desc_size(dev->vdev, vq_idx);
+    size_t driver_size;
+    size_t device_size;
     g_autofree VhostShadowVirtqueue *svq = g_new0(VhostShadowVirtqueue, 1);
     int r;
 
@@ -196,6 +235,15 @@ VhostShadowVirtqueue *vhost_svq_new(struct vhost_dev *dev, int idx)
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
     event_notifier_set_handler(&svq->call_notifier,
                                vhost_svq_handle_call);
     return g_steal_pointer(&svq);
@@ -215,5 +263,7 @@ void vhost_svq_free(VhostShadowVirtqueue *vq)
     event_notifier_cleanup(&vq->kick_notifier);
     event_notifier_set_handler(&vq->call_notifier, NULL);
     event_notifier_cleanup(&vq->call_notifier);
+    qemu_vfree(vq->vring.desc);
+    qemu_vfree(vq->vring.used);
     g_free(vq);
 }
-- 
2.27.0


