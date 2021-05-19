Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A4163893EC
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 18:38:11 +0200 (CEST)
Received: from localhost ([::1]:45004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljPD0-0007uB-DW
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 12:38:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1ljP5q-0003tC-0p
 for qemu-devel@nongnu.org; Wed, 19 May 2021 12:30:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47210)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1ljP5l-0005YI-AQ
 for qemu-devel@nongnu.org; Wed, 19 May 2021 12:30:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621441840;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6apyqZZ19wN+l2UaInpfg/+01UilPFGVwxMDnB8RP54=;
 b=aFTdLtLOXpZlXJbZ/6nfmzcrqA24r1IwSpFtWTLU4Q6EjbuODpp6JhW/Zqfjwg/ut92NU6
 wwqiro8vFfUIMWP6ILBU3eesodZ4LcmnudQSASoFWAbDDQYfTSIFRPWxAKRciv4tOuka66
 MvkAc8HpULM3eehecvhOPojk9YHv9aI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-263-QrbVj6CoO8uKxg8WchdkPw-1; Wed, 19 May 2021 12:30:37 -0400
X-MC-Unique: QrbVj6CoO8uKxg8WchdkPw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 92257801107;
 Wed, 19 May 2021 16:30:35 +0000 (UTC)
Received: from eperezma.remote.csb (ovpn-113-65.ams2.redhat.com [10.36.113.65])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DE8555D6AC;
 Wed, 19 May 2021 16:30:30 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC v3 10/29] virtio: Add vhost_shadow_vq_get_vring_addr
Date: Wed, 19 May 2021 18:28:44 +0200
Message-Id: <20210519162903.1172366-11-eperezma@redhat.com>
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

It reports the shadow virtqueue address from qemu virtual address space

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 hw/virtio/vhost-shadow-virtqueue.h |  4 +++
 hw/virtio/vhost-shadow-virtqueue.c | 46 ++++++++++++++++++++++++++++++
 2 files changed, 50 insertions(+)

diff --git a/hw/virtio/vhost-shadow-virtqueue.h b/hw/virtio/vhost-shadow-virtqueue.h
index 2ca4b92b12..725091bc97 100644
--- a/hw/virtio/vhost-shadow-virtqueue.h
+++ b/hw/virtio/vhost-shadow-virtqueue.h
@@ -19,6 +19,10 @@ typedef struct VhostShadowVirtqueue VhostShadowVirtqueue;
 
 void vhost_shadow_vq_mask(VhostShadowVirtqueue *svq, EventNotifier *masked);
 void vhost_shadow_vq_unmask(VhostShadowVirtqueue *svq);
+void vhost_shadow_vq_get_vring_addr(const VhostShadowVirtqueue *svq,
+                                    struct vhost_vring_addr *addr);
+size_t vhost_shadow_vq_driver_area_size(const VhostShadowVirtqueue *svq);
+size_t vhost_shadow_vq_device_area_size(const VhostShadowVirtqueue *svq);
 
 bool vhost_shadow_vq_start(struct vhost_dev *dev,
                            unsigned idx,
diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shadow-virtqueue.c
index c22acb4605..ff50f12410 100644
--- a/hw/virtio/vhost-shadow-virtqueue.c
+++ b/hw/virtio/vhost-shadow-virtqueue.c
@@ -17,6 +17,9 @@
 
 /* Shadow virtqueue to relay notifications */
 typedef struct VhostShadowVirtqueue {
+    /* Shadow vring */
+    struct vring vring;
+
     /* Shadow kick notifier, sent to vhost */
     EventNotifier kick_notifier;
     /* Shadow call notifier, sent to vhost */
@@ -114,6 +117,35 @@ void vhost_shadow_vq_unmask(VhostShadowVirtqueue *svq)
     svq->masked_notifier.n = NULL;
 }
 
+/*
+ * Get the shadow vq vring address.
+ * @svq Shadow virtqueue
+ * @addr Destination to store address
+ */
+void vhost_shadow_vq_get_vring_addr(const VhostShadowVirtqueue *svq,
+                                    struct vhost_vring_addr *addr)
+{
+    addr->desc_user_addr = (uint64_t)svq->vring.desc;
+    addr->avail_user_addr = (uint64_t)svq->vring.avail;
+    addr->used_user_addr = (uint64_t)svq->vring.used;
+}
+
+size_t vhost_shadow_vq_driver_area_size(const VhostShadowVirtqueue *svq)
+{
+    uint16_t vq_idx = virtio_get_queue_index(svq->vq);
+    size_t desc_size = virtio_queue_get_desc_size(svq->vdev, vq_idx);
+    size_t avail_size = virtio_queue_get_avail_size(svq->vdev, vq_idx);
+
+    return ROUND_UP(desc_size + avail_size, qemu_real_host_page_size);
+}
+
+size_t vhost_shadow_vq_device_area_size(const VhostShadowVirtqueue *svq)
+{
+    uint16_t vq_idx = virtio_get_queue_index(svq->vq);
+    size_t used_size = virtio_queue_get_used_size(svq->vdev, vq_idx);
+    return ROUND_UP(used_size, qemu_real_host_page_size);
+}
+
 /*
  * Restore the vhost guest to host notifier, i.e., disables svq effect.
  */
@@ -232,6 +264,10 @@ void vhost_shadow_vq_stop(struct vhost_dev *dev,
 VhostShadowVirtqueue *vhost_shadow_vq_new(struct vhost_dev *dev, int idx)
 {
     int vq_idx = dev->vq_index + idx;
+    unsigned num = virtio_queue_get_num(dev->vdev, vq_idx);
+    size_t desc_size = virtio_queue_get_desc_size(dev->vdev, vq_idx);
+    size_t driver_size;
+    size_t device_size;
     g_autofree VhostShadowVirtqueue *svq = g_new0(VhostShadowVirtqueue, 1);
     int r;
 
@@ -251,6 +287,14 @@ VhostShadowVirtqueue *vhost_shadow_vq_new(struct vhost_dev *dev, int idx)
 
     svq->vq = virtio_get_queue(dev->vdev, vq_idx);
     svq->vdev = dev->vdev;
+    driver_size = vhost_shadow_vq_driver_area_size(svq);
+    device_size = vhost_shadow_vq_device_area_size(svq);
+    svq->vring.num = num;
+    svq->vring.desc = qemu_memalign(qemu_real_host_page_size, driver_size);
+    svq->vring.avail = (void *)((char *)svq->vring.desc + desc_size);
+    memset(svq->vring.desc, 0, driver_size);
+    svq->vring.used = qemu_memalign(qemu_real_host_page_size, device_size);
+    memset(svq->vring.used, 0, device_size);
     event_notifier_set_handler(&svq->call_notifier,
                                vhost_shadow_vq_handle_call);
     return g_steal_pointer(&svq);
@@ -270,5 +314,7 @@ void vhost_shadow_vq_free(VhostShadowVirtqueue *vq)
     event_notifier_cleanup(&vq->kick_notifier);
     event_notifier_set_handler(&vq->call_notifier, NULL);
     event_notifier_cleanup(&vq->call_notifier);
+    qemu_vfree(vq->vring.desc);
+    qemu_vfree(vq->vring.used);
     g_free(vq);
 }
-- 
2.27.0


