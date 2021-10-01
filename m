Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C0F241E84A
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Oct 2021 09:24:18 +0200 (CEST)
Received: from localhost ([::1]:49148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWCu1-000073-EB
	for lists+qemu-devel@lfdr.de; Fri, 01 Oct 2021 03:24:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1mWChH-0000N2-Fk
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 03:11:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45116)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1mWChF-00049a-8J
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 03:11:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633072264;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4FMWHKJqRbXnJMl22nuaafL4UiVJzbsZAYB/Jd90dFw=;
 b=BUkmQ9xeBlkfNKaPGPMgtqa46DCxI3ZxGluDUT2nci42PCUxvVvP7m/OH1V+IP78KpTgH+
 +uAY9vtkxtFUkl5VW3kCUjcrpveUeZYJU0X0ab6zDCJEsDhx9yatYcAhCG/UXGrRiDV0M8
 9qDHWra0um8AzhyDe/zWXSi72CQcasE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-504-VVFSyDVeNS2wi_5T09gClA-1; Fri, 01 Oct 2021 03:11:03 -0400
X-MC-Unique: VVFSyDVeNS2wi_5T09gClA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3872D10151E0;
 Fri,  1 Oct 2021 07:11:02 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.193.2])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 34B1053E08;
 Fri,  1 Oct 2021 07:10:53 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v4 11/20] vhost: Route host->guest notification through
 shadow virtqueue
Date: Fri,  1 Oct 2021 09:05:54 +0200
Message-Id: <20211001070603.307037-12-eperezma@redhat.com>
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

This will make qemu aware of the device used buffers, allowing it to
write the guest memory with its contents if needed.

Since the use of vhost_virtqueue_start can unmasks and discard call
events, vhost_virtqueue_start should be modified in one of these ways:
* Split in two: One of them uses all logic to start a queue with no
  side effects for the guest, and another one tha actually assumes that
  the guest has just started the device. Vdpa should use just the
  former.
* Actually store and check if the guest notifier is masked, and do it
  conditionally.
* Left as it is, and duplicate all the logic in vhost-vdpa.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 hw/virtio/vhost-shadow-virtqueue.c | 19 +++++++++++++++
 hw/virtio/vhost-vdpa.c             | 38 +++++++++++++++++++++++++++++-
 2 files changed, 56 insertions(+), 1 deletion(-)

diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shadow-virtqueue.c
index 21dc99ab5d..3fe129cf63 100644
--- a/hw/virtio/vhost-shadow-virtqueue.c
+++ b/hw/virtio/vhost-shadow-virtqueue.c
@@ -53,6 +53,22 @@ static void vhost_handle_guest_kick(EventNotifier *n)
     event_notifier_set(&svq->kick_notifier);
 }
 
+/* Forward vhost notifications */
+static void vhost_svq_handle_call_no_test(EventNotifier *n)
+{
+    VhostShadowVirtqueue *svq = container_of(n, VhostShadowVirtqueue,
+                                             call_notifier);
+
+    event_notifier_set(&svq->guest_call_notifier);
+}
+
+static void vhost_svq_handle_call(EventNotifier *n)
+{
+    if (likely(event_notifier_test_and_clear(n))) {
+        vhost_svq_handle_call_no_test(n);
+    }
+}
+
 /*
  * Obtain the SVQ call notifier, where vhost device notifies SVQ that there
  * exists pending used buffers.
@@ -180,6 +196,8 @@ VhostShadowVirtqueue *vhost_svq_new(struct vhost_dev *dev, int idx)
     }
 
     svq->vq = virtio_get_queue(dev->vdev, vq_idx);
+    event_notifier_set_handler(&svq->call_notifier,
+                               vhost_svq_handle_call);
     return g_steal_pointer(&svq);
 
 err_init_call_notifier:
@@ -195,6 +213,7 @@ err_init_kick_notifier:
 void vhost_svq_free(VhostShadowVirtqueue *vq)
 {
     event_notifier_cleanup(&vq->kick_notifier);
+    event_notifier_set_handler(&vq->call_notifier, NULL);
     event_notifier_cleanup(&vq->call_notifier);
     g_free(vq);
 }
diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index bc34de2439..6c5f4c98b8 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -712,13 +712,40 @@ static bool vhost_vdpa_svq_start_vq(struct vhost_dev *dev, unsigned idx)
 {
     struct vhost_vdpa *v = dev->opaque;
     VhostShadowVirtqueue *svq = g_ptr_array_index(v->shadow_vqs, idx);
-    return vhost_svq_start(dev, idx, svq);
+    EventNotifier *vhost_call_notifier = vhost_svq_get_svq_call_notifier(svq);
+    struct vhost_vring_file vhost_call_file = {
+        .index = idx + dev->vq_index,
+        .fd = event_notifier_get_fd(vhost_call_notifier),
+    };
+    int r;
+    bool b;
+
+    /* Set shadow vq -> guest notifier */
+    assert(v->call_fd[idx]);
+    vhost_svq_set_guest_call_notifier(svq, v->call_fd[idx]);
+
+    b = vhost_svq_start(dev, idx, svq);
+    if (unlikely(!b)) {
+        return false;
+    }
+
+    /* Set device -> SVQ notifier */
+    r = vhost_vdpa_set_vring_dev_call(dev, &vhost_call_file);
+    if (unlikely(r)) {
+        error_report("vhost_vdpa_set_vring_call for shadow vq failed");
+        return false;
+    }
+
+    /* Check for pending calls */
+    event_notifier_set(vhost_call_notifier);
+    return true;
 }
 
 static unsigned vhost_vdpa_enable_svq(struct vhost_vdpa *v, bool enable)
 {
     struct vhost_dev *hdev = v->dev;
     unsigned n;
+    int r;
 
     if (enable == v->shadow_vqs_enabled) {
         return hdev->nvqs;
@@ -752,9 +779,18 @@ static unsigned vhost_vdpa_enable_svq(struct vhost_vdpa *v, bool enable)
     if (!enable) {
         /* Disable all queues or clean up failed start */
         for (n = 0; n < v->shadow_vqs->len; ++n) {
+            struct vhost_vring_file file = {
+                .index = vhost_vdpa_get_vq_index(hdev, n),
+                .fd = v->call_fd[n],
+            };
+
+            r = vhost_vdpa_set_vring_call(hdev, &file);
+            assert(r == 0);
+
             unsigned vq_idx = vhost_vdpa_get_vq_index(hdev, n);
             VhostShadowVirtqueue *svq = g_ptr_array_index(v->shadow_vqs, n);
             vhost_svq_stop(hdev, n, svq);
+            /* TODO: This can unmask or override call fd! */
             vhost_virtqueue_start(hdev, hdev->vdev, &hdev->vqs[n], vq_idx);
         }
 
-- 
2.27.0


