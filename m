Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44B80315300
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 16:44:15 +0100 (CET)
Received: from localhost ([::1]:57506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9VBW-0007tA-Ad
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 10:44:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1l9V6P-0003q1-PB
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 10:38:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:35720)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1l9V6I-0008Ly-Os
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 10:38:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612885129;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uc4yMvSfmeIlRy1RwpEigPw1wLUvMBLfOUref+cp2/E=;
 b=SHs1JKP2ua+9DQ4Dxh2DtsTZgHWO2cGjy+m7dlBLYVg1VNOoRtDHVU4fk/lji6iUPr/h5v
 jjuudIxAuOYTtHYS/z/DBzPGFftYqmYug/wv/AHvWkpNTocRNzPK6gsw4F3gHJGoTYCgR0
 8f//uXRX7QQhO2VPTcOgHXdezf53mtw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-424-i2zUqz0OP66zkES_JqAQ0g-1; Tue, 09 Feb 2021 10:38:47 -0500
X-MC-Unique: i2zUqz0OP66zkES_JqAQ0g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 51BA280402C;
 Tue,  9 Feb 2021 15:38:46 +0000 (UTC)
Received: from eperezma.remote.csb (ovpn-113-210.ams2.redhat.com
 [10.36.113.210])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4628660861;
 Tue,  9 Feb 2021 15:38:40 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC v2 7/7] vhost: Route host->guest notification through shadow
 virtqueue
Date: Tue,  9 Feb 2021 16:37:57 +0100
Message-Id: <20210209153757.1653598-8-eperezma@redhat.com>
In-Reply-To: <20210209153757.1653598-1-eperezma@redhat.com>
References: <20210209153757.1653598-1-eperezma@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.57,
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
 Rob Miller <rob.miller@broadcom.com>, Michael Lilja <ml@napatech.com>,
 Jim Harford <jim.harford@broadcom.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 hw/virtio/vhost-shadow-virtqueue.h |  2 ++
 hw/virtio/vhost-shadow-virtqueue.c | 49 ++++++++++++++++++++++++++++++
 hw/virtio/vhost.c                  |  5 ++-
 3 files changed, 55 insertions(+), 1 deletion(-)

diff --git a/hw/virtio/vhost-shadow-virtqueue.h b/hw/virtio/vhost-shadow-virtqueue.h
index c45035c4b7..210133434c 100644
--- a/hw/virtio/vhost-shadow-virtqueue.h
+++ b/hw/virtio/vhost-shadow-virtqueue.h
@@ -17,6 +17,8 @@
 
 typedef struct VhostShadowVirtqueue VhostShadowVirtqueue;
 
+EventNotifier *vhost_shadow_vq_get_call_notifier(VhostShadowVirtqueue *vq);
+
 bool vhost_shadow_vq_start_rcu(struct vhost_dev *dev,
                                unsigned idx,
                                VhostShadowVirtqueue *svq);
diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shadow-virtqueue.c
index 01f282d434..61d98ae652 100644
--- a/hw/virtio/vhost-shadow-virtqueue.c
+++ b/hw/virtio/vhost-shadow-virtqueue.c
@@ -24,6 +24,8 @@ typedef struct VhostShadowVirtqueue {
 
     /* Borrowed virtqueue's guest to host notifier. */
     EventNotifier host_notifier;
+    /* Host to guest notifier */
+    EventNotifier *guest_notifier;
 
     /* Virtio queue shadowing */
     VirtQueue *vq;
@@ -40,6 +42,26 @@ static void vhost_handle_guest_kick(EventNotifier *n)
     }
 }
 
+/* Forward vhost notifications */
+static void vhost_handle_call(EventNotifier *n)
+{
+    VhostShadowVirtqueue *svq = container_of(n, VhostShadowVirtqueue,
+                                             call_notifier);
+
+    if (event_notifier_test_and_clear(n)) {
+        event_notifier_set(svq->guest_notifier);
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
 /*
  * Start shadow virtqueue operation.
  * @dev vhost device
@@ -57,6 +79,10 @@ bool vhost_shadow_vq_start_rcu(struct vhost_dev *dev,
         .index = idx,
         .fd = event_notifier_get_fd(&svq->kick_notifier),
     };
+    struct vhost_vring_file call_file = {
+        .index = idx,
+        .fd = event_notifier_get_fd(&svq->call_notifier),
+    };
     int r;
 
     /* Check that notifications are still going directly to vhost dev */
@@ -66,6 +92,7 @@ bool vhost_shadow_vq_start_rcu(struct vhost_dev *dev,
                            event_notifier_get_fd(vq_host_notifier));
     event_notifier_set_handler(&svq->host_notifier, vhost_handle_guest_kick);
 
+    svq->guest_notifier = virtio_queue_get_guest_notifier(svq->vq);
     r = dev->vhost_ops->vhost_set_vring_kick(dev, &kick_file);
     if (unlikely(r != 0)) {
         error_report("Couldn't set kick fd: %s", strerror(errno));
@@ -75,8 +102,19 @@ bool vhost_shadow_vq_start_rcu(struct vhost_dev *dev,
     /* Check for pending notifications from the guest */
     vhost_handle_guest_kick(&svq->host_notifier);
 
+    r = dev->vhost_ops->vhost_set_vring_call(dev, &call_file);
+    if (r != 0) {
+        error_report("Couldn't set call fd: %s", strerror(errno));
+        goto err_set_vring_call;
+    }
+
     return true;
 
+err_set_vring_call:
+    kick_file.fd = event_notifier_get_fd(vq_host_notifier);
+    r = dev->vhost_ops->vhost_set_vring_kick(dev, &kick_file);
+    assert(r == 0);
+
 err_set_vring_kick:
     event_notifier_set_handler(&svq->host_notifier, NULL);
 
@@ -108,6 +146,16 @@ void vhost_shadow_vq_stop_rcu(struct vhost_dev *dev,
     assert(r == 0);
 
     event_notifier_set_handler(&svq->host_notifier, NULL);
+
+    if (!dev->vqs[idx].notifier_is_masked) {
+        EventNotifier *e = vhost_shadow_vq_get_call_notifier(svq);
+
+        /* Restore vhost call */
+        vhost_virtqueue_mask(dev, dev->vdev, dev->vq_index + idx, false);
+
+        /* Check for pending calls */
+        vhost_handle_call(e);
+    }
 }
 
 /*
@@ -136,6 +184,7 @@ VhostShadowVirtqueue *vhost_shadow_vq_new(struct vhost_dev *dev, int idx)
         goto err_init_call_notifier;
     }
 
+    event_notifier_set_handler(&svq->call_notifier, vhost_handle_call);
     return g_steal_pointer(&svq);
 
 err_init_call_notifier:
diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
index 9d4728e545..0dc95679e9 100644
--- a/hw/virtio/vhost.c
+++ b/hw/virtio/vhost.c
@@ -975,7 +975,6 @@ static int vhost_sw_live_migration_start(struct vhost_dev *dev)
         for (idx = 0; idx < dev->nvqs; ++idx) {
             bool ok = vhost_shadow_vq_start_rcu(dev, idx,
                                                 dev->shadow_vqs[idx]);
-
             if (!ok) {
                 int stop_idx = idx;
 
@@ -1608,6 +1607,10 @@ void vhost_virtqueue_mask(struct vhost_dev *hdev, VirtIODevice *vdev, int n,
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


