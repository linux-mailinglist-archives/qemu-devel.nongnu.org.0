Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4666D308EE5
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 22:02:58 +0100 (CET)
Received: from localhost ([::1]:46612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5auv-0005KX-BC
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 16:02:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1l5anl-0007KO-Rt
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 15:55:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20002)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1l5ani-0002rJ-O3
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 15:55:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611953729;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nWKp68k969gGamZ/PvVgse5se5gbwruEO4TlMnH0TDE=;
 b=h1blpuMTXGlRFNLkgn/yCHOinsUm9LeM4BhXXhb5i9UERIZny7cqb7P40Osv6uu80mkGSo
 BdXoi07wJQ9WzM8dLuBSpBpnR++7ykEcr3HNF7Pn7XGLGe4PeGI/M2+/Q+i8s05dcfBeEH
 eL/zuFc1O5snz1w38dZt0UQZSi8Zb/Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-421-2OdFKLUaOp-e8IZlx4vaWg-1; Fri, 29 Jan 2021 15:55:28 -0500
X-MC-Unique: 2OdFKLUaOp-e8IZlx4vaWg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B8FEB8144E1;
 Fri, 29 Jan 2021 20:55:26 +0000 (UTC)
Received: from eperezma.remote.csb (ovpn-113-115.ams2.redhat.com
 [10.36.113.115])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C34E419C66;
 Fri, 29 Jan 2021 20:55:17 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC 10/10] vhost: Route host->guest notification through shadow
 virtqueue
Date: Fri, 29 Jan 2021 21:54:15 +0100
Message-Id: <20210129205415.876290-11-eperezma@redhat.com>
In-Reply-To: <20210129205415.876290-1-eperezma@redhat.com>
References: <20210129205415.876290-1-eperezma@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.249,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 Stefano Garzarella <sgarzare@redhat.com>, Michael Lilja <ml@napatech.com>,
 Jim Harford <jim.harford@broadcom.com>, Rob Miller <rob.miller@broadcom.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 hw/virtio/vhost-shadow-virtqueue.h |  2 ++
 hw/virtio/vhost-shadow-virtqueue.c | 55 ++++++++++++++++++++++++++++++
 hw/virtio/vhost.c                  |  5 ++-
 3 files changed, 61 insertions(+), 1 deletion(-)

diff --git a/hw/virtio/vhost-shadow-virtqueue.h b/hw/virtio/vhost-shadow-virtqueue.h
index 466f8ae595..99a4e011fd 100644
--- a/hw/virtio/vhost-shadow-virtqueue.h
+++ b/hw/virtio/vhost-shadow-virtqueue.h
@@ -17,6 +17,8 @@
 
 typedef struct VhostShadowVirtqueue VhostShadowVirtqueue;
 
+EventNotifier *vhost_shadow_vq_get_call_notifier(VhostShadowVirtqueue *vq);
+
 bool vhost_shadow_vq_start_rcu(struct vhost_dev *dev,
                                VhostShadowVirtqueue *svq);
 void vhost_shadow_vq_stop_rcu(struct vhost_dev *dev,
diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shadow-virtqueue.c
index 908c36c66d..e2e0bfe325 100644
--- a/hw/virtio/vhost-shadow-virtqueue.c
+++ b/hw/virtio/vhost-shadow-virtqueue.c
@@ -53,6 +53,34 @@ static void handle_shadow_vq(VirtIODevice *vdev, VirtQueue *vq)
     vhost_shadow_vring_kick(svq);
 }
 
+static void vhost_handle_call(EventNotifier *n)
+{
+    VhostShadowVirtqueue *svq = container_of(n, VhostShadowVirtqueue,
+                                             call_notifier);
+
+    if (event_notifier_test_and_clear(n)) {
+        unsigned idx = virtio_queue_get_idx(svq->vdev, svq->vq);
+
+        /*
+         * Since QEMU has not add any descriptors, virtqueue code thinks its
+         * not needed to signal used. QEMU shadow virtqueue will take
+         * descriptor forwarding soon, so just invalidate used cache for now.
+         */
+        virtio_queue_invalidate_signalled_used(svq->vdev, idx);
+        virtio_notify_irqfd(svq->vdev, svq->vq);
+    }
+}
+
+/*
+ * Get the vhost call notifier of the shadow vq
+ * @vq Shadow virtqueue
+ */
+EventNotifier *vhost_shadow_vq_get_call_notifier(VhostShadowVirtqueue *vq)
+{
+    return &vq->call_notifier;
+}
+
+
 /*
  * Start shadow virtqueue operation.
  * @dev vhost device
@@ -70,6 +98,10 @@ bool vhost_shadow_vq_start_rcu(struct vhost_dev *dev,
         .index = idx,
         .fd = event_notifier_get_fd(&svq->kick_notifier),
     };
+    struct vhost_vring_file call_file = {
+        .index = idx,
+        .fd = event_notifier_get_fd(&svq->call_notifier),
+    };
     int r;
     bool ok;
 
@@ -88,6 +120,12 @@ bool vhost_shadow_vq_start_rcu(struct vhost_dev *dev,
         goto err_set_vring_kick;
     }
 
+    r = dev->vhost_ops->vhost_set_vring_call(dev, &call_file);
+    if (r != 0) {
+        error_report("Couldn't set call fd: %s", strerror(errno));
+        goto err_set_vring_call;
+    }
+
     event_notifier_set_handler(vq_host_notifier,
                                virtio_queue_host_notifier_read);
     virtio_queue_set_host_notifier_enabled(svq->vq, false);
@@ -95,6 +133,11 @@ bool vhost_shadow_vq_start_rcu(struct vhost_dev *dev,
 
     return true;
 
+err_set_vring_call:
+    kick_file.fd = event_notifier_get_fd(vq_host_notifier);
+    r = dev->vhost_ops->vhost_set_vring_kick(dev, &kick_file);
+    assert(r == 0);
+
 err_set_vring_kick:
     k->set_vq_handler(dev->vdev, idx, NULL);
 
@@ -129,6 +172,17 @@ void vhost_shadow_vq_stop_rcu(struct vhost_dev *dev,
     event_notifier_set_handler(vq_host_notifier, NULL);
     virtio_queue_set_host_notifier_enabled(svq->vq, true);
     k->set_vq_handler(svq->vdev, idx, NULL);
+
+    if (!dev->vqs[idx].notifier_is_masked) {
+        EventNotifier *e = vhost_shadow_vq_get_call_notifier(svq);
+
+        /* Restore vhost call */
+        vhost_virtqueue_mask(dev, svq->vdev, idx, false);
+        if (event_notifier_test_and_clear(e)) {
+            virtio_queue_invalidate_signalled_used(svq->vdev, idx);
+            virtio_notify_irqfd(svq->vdev, svq->vq);
+        }
+    }
 }
 
 /*
@@ -159,6 +213,7 @@ VhostShadowVirtqueue *vhost_shadow_vq_new(struct vhost_dev *dev, int idx)
         goto err_init_call_notifier;
     }
 
+    event_notifier_set_handler(&svq->call_notifier, vhost_handle_call);
     return g_steal_pointer(&svq);
 
 err_init_call_notifier:
diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
index bde688f278..5ad0990509 100644
--- a/hw/virtio/vhost.c
+++ b/hw/virtio/vhost.c
@@ -984,7 +984,6 @@ static int vhost_sw_live_migration_start(struct vhost_dev *dev)
             int stop_idx = idx;
             bool ok = vhost_shadow_vq_start_rcu(dev,
                                                 dev->shadow_vqs[idx]);
-
             if (!ok) {
                 while (--stop_idx >= 0) {
                     vhost_shadow_vq_stop_rcu(dev, dev->shadow_vqs[stop_idx]);
@@ -1610,6 +1609,10 @@ void vhost_virtqueue_mask(struct vhost_dev *hdev, VirtIODevice *vdev, int n,
     if (mask) {
         assert(vdev->use_guest_notifier_mask);
         file.fd = event_notifier_get_fd(&hdev->vqs[index].masked_notifier);
+    } else if (hdev->sw_lm_enabled) {
+        VhostShadowVirtqueue *svq = hdev->shadow_vqs[n];
+        EventNotifier *e = vhost_shadow_vq_get_call_notifier(svq);
+        file.fd = event_notifier_get_fd(e);
     } else {
         file.fd = event_notifier_get_fd(virtio_queue_get_guest_notifier(vvq));
     }
-- 
2.27.0


