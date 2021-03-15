Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9589E33C735
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 20:57:40 +0100 (CET)
Received: from localhost ([::1]:43252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLtLP-0006np-JC
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 15:57:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1lLtDh-0005Y9-KO
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 15:49:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:22204)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1lLtDf-00047L-TQ
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 15:49:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615837779;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=W7AqImQzQRN4d8y77E4TYLPjjtOJrVKWXw8C5p9lYeM=;
 b=XsOVZ05snOkeWWtUiF+IdP+9AXYdEQafvolcxSf6EJrc8G0C4O1kjiop/YC/xYZNCz5Ks5
 WxrerYdkEvpARLDFl24JdCDyNgoYiAHsokL8DcU+94lwpf+5NzriV2zJLNR6JME3MTfViT
 QPzAb53f+s9JynlWSCCULru0CCnBBTM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-312-D5KcFQtVPx6RnFXFAluDDw-1; Mon, 15 Mar 2021 15:49:37 -0400
X-MC-Unique: D5KcFQtVPx6RnFXFAluDDw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E5B50801597;
 Mon, 15 Mar 2021 19:49:35 +0000 (UTC)
Received: from eperezma.remote.csb (ovpn-112-173.ams2.redhat.com
 [10.36.112.173])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 947895F9B8;
 Mon, 15 Mar 2021 19:49:32 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC v2 08/13] virtio: Add vhost_shadow_vq_get_vring_addr
Date: Mon, 15 Mar 2021 20:48:37 +0100
Message-Id: <20210315194842.277740-9-eperezma@redhat.com>
In-Reply-To: <20210315194842.277740-1-eperezma@redhat.com>
References: <20210315194842.277740-1-eperezma@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
 Guru Prasad <guru.prasad@broadcom.com>, Jason Wang <jasowang@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 virtualization@lists.linux-foundation.org,
 Harpreet Singh Anand <hanand@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Eli Cohen <eli@mellanox.com>, Stefano Garzarella <sgarzare@redhat.com>,
 Michael Lilja <ml@napatech.com>, Jim Harford <jim.harford@broadcom.com>,
 Rob Miller <rob.miller@broadcom.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It reports the shadow virtqueue address from qemu virtual address space

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 hw/virtio/vhost-shadow-virtqueue.h |  2 ++
 hw/virtio/vhost-shadow-virtqueue.c | 24 +++++++++++++++++++++++-
 2 files changed, 25 insertions(+), 1 deletion(-)

diff --git a/hw/virtio/vhost-shadow-virtqueue.h b/hw/virtio/vhost-shadow-virtqueue.h
index 2ca4b92b12..d82c35bccf 100644
--- a/hw/virtio/vhost-shadow-virtqueue.h
+++ b/hw/virtio/vhost-shadow-virtqueue.h
@@ -19,6 +19,8 @@ typedef struct VhostShadowVirtqueue VhostShadowVirtqueue;
 
 void vhost_shadow_vq_mask(VhostShadowVirtqueue *svq, EventNotifier *masked);
 void vhost_shadow_vq_unmask(VhostShadowVirtqueue *svq);
+void vhost_shadow_vq_get_vring_addr(const VhostShadowVirtqueue *svq,
+                                    struct vhost_vring_addr *addr);
 
 bool vhost_shadow_vq_start(struct vhost_dev *dev,
                            unsigned idx,
diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shadow-virtqueue.c
index b6bab438d6..1460d1d5d1 100644
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
@@ -51,6 +54,9 @@ typedef struct VhostShadowVirtqueue {
 
     /* Virtio device */
     VirtIODevice *vdev;
+
+    /* Descriptors copied from guest */
+    vring_desc_t descs[];
 } VhostShadowVirtqueue;
 
 /* Forward guest notifications */
@@ -132,6 +138,19 @@ void vhost_shadow_vq_unmask(VhostShadowVirtqueue *svq)
     qemu_event_wait(&svq->masked_notifier.is_free);
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
 /*
  * Restore the vhost guest to host notifier, i.e., disables svq effect.
  */
@@ -262,7 +281,9 @@ void vhost_shadow_vq_stop(struct vhost_dev *dev,
 VhostShadowVirtqueue *vhost_shadow_vq_new(struct vhost_dev *dev, int idx)
 {
     int vq_idx = dev->vq_index + idx;
-    g_autofree VhostShadowVirtqueue *svq = g_new0(VhostShadowVirtqueue, 1);
+    unsigned num = virtio_queue_get_num(dev->vdev, vq_idx);
+    size_t ring_size = vring_size(num, VRING_DESC_ALIGN_SIZE);
+    g_autofree VhostShadowVirtqueue *svq = g_malloc0(sizeof(*svq) + ring_size);
     int r;
 
     r = event_notifier_init(&svq->kick_notifier, 0);
@@ -279,6 +300,7 @@ VhostShadowVirtqueue *vhost_shadow_vq_new(struct vhost_dev *dev, int idx)
         goto err_init_call_notifier;
     }
 
+    vring_init(&svq->vring, num, svq->descs, VRING_DESC_ALIGN_SIZE);
     svq->vq = virtio_get_queue(dev->vdev, vq_idx);
     svq->vdev = dev->vdev;
     event_notifier_set_handler(&svq->call_notifier,
-- 
2.27.0


