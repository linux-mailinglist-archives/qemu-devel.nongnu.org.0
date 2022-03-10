Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BB404D3F4F
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 03:42:17 +0100 (CET)
Received: from localhost ([::1]:33066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nS8kq-0006Ds-Ni
	for lists+qemu-devel@lfdr.de; Wed, 09 Mar 2022 21:42:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nS8iH-0003Lo-2L
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 21:39:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:54880)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nS8iF-00040C-D3
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 21:39:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646879974;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RCcPsRxfjjC7T1Up2IvpwOT5W9V5fHjfpbs76wYRXT8=;
 b=eL5gThYQj07N88qhjn7BTNmcLGEZUDWVJA6MM0VUksvzrkAM413wvCjD2ccvjSpIwaCLCJ
 5KS12k8OGE2QnCSJfe2v8OGpW3evlNrIMo7w1UNS4HqVYRB/V/P61NlN5DrJW3Rgf/jglF
 kHNx/ETlg80Bl3cN2faDNN1c0lgNmDA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-211-Ivy1mS0QN8aHG4UEjj70Cw-1; Wed, 09 Mar 2022 21:39:31 -0500
X-MC-Unique: Ivy1mS0QN8aHG4UEjj70Cw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D7D11801AAD;
 Thu, 10 Mar 2022 02:39:30 +0000 (UTC)
Received: from localhost.localdomain (ovpn-13-194.pek2.redhat.com
 [10.72.13.194])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0E45E107867C;
 Thu, 10 Mar 2022 02:39:28 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Subject: [PULL V2 04/15] vhost: Add Shadow VirtQueue call forwarding
 capabilities
Date: Thu, 10 Mar 2022 10:38:56 +0800
Message-Id: <20220310023907.2443-5-jasowang@redhat.com>
In-Reply-To: <20220310023907.2443-1-jasowang@redhat.com>
References: <20220310023907.2443-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>,
 Jason Wang <jasowang@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Eugenio Pérez <eperezma@redhat.com>

This will make qemu aware of the device used buffers, allowing it to
write the guest memory with its contents if needed.

Acked-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 hw/virtio/vhost-shadow-virtqueue.c | 38 ++++++++++++++++++++++++++++++++++++++
 hw/virtio/vhost-shadow-virtqueue.h |  4 ++++
 hw/virtio/vhost-vdpa.c             | 31 +++++++++++++++++++++++++++++--
 3 files changed, 71 insertions(+), 2 deletions(-)

diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shadow-virtqueue.c
index c96dbdf..5c1e09b 100644
--- a/hw/virtio/vhost-shadow-virtqueue.c
+++ b/hw/virtio/vhost-shadow-virtqueue.c
@@ -28,6 +28,42 @@ static void vhost_handle_guest_kick(EventNotifier *n)
 }
 
 /**
+ * Forward vhost notifications
+ *
+ * @n: hdev call event notifier, the one that device set to notify svq.
+ */
+static void vhost_svq_handle_call(EventNotifier *n)
+{
+    VhostShadowVirtqueue *svq = container_of(n, VhostShadowVirtqueue,
+                                             hdev_call);
+    event_notifier_test_and_clear(n);
+    event_notifier_set(&svq->svq_call);
+}
+
+/**
+ * Set the call notifier for the SVQ to call the guest
+ *
+ * @svq: Shadow virtqueue
+ * @call_fd: call notifier
+ *
+ * Called on BQL context.
+ */
+void vhost_svq_set_svq_call_fd(VhostShadowVirtqueue *svq, int call_fd)
+{
+    if (call_fd == VHOST_FILE_UNBIND) {
+        /*
+         * Fail event_notifier_set if called handling device call.
+         *
+         * SVQ still needs device notifications, since it needs to keep
+         * forwarding used buffers even with the unbind.
+         */
+        memset(&svq->svq_call, 0, sizeof(svq->svq_call));
+    } else {
+        event_notifier_init_fd(&svq->svq_call, call_fd);
+    }
+}
+
+/**
  * Set a new file descriptor for the guest to kick the SVQ and notify for avail
  *
  * @svq: The svq
@@ -94,6 +130,7 @@ VhostShadowVirtqueue *vhost_svq_new(void)
     }
 
     event_notifier_init_fd(&svq->svq_kick, VHOST_FILE_UNBIND);
+    event_notifier_set_handler(&svq->hdev_call, vhost_svq_handle_call);
     return g_steal_pointer(&svq);
 
 err_init_hdev_call:
@@ -113,6 +150,7 @@ void vhost_svq_free(gpointer pvq)
     VhostShadowVirtqueue *vq = pvq;
     vhost_svq_stop(vq);
     event_notifier_cleanup(&vq->hdev_kick);
+    event_notifier_set_handler(&vq->hdev_call, NULL);
     event_notifier_cleanup(&vq->hdev_call);
     g_free(vq);
 }
diff --git a/hw/virtio/vhost-shadow-virtqueue.h b/hw/virtio/vhost-shadow-virtqueue.h
index 1cbc87d..cbc5213 100644
--- a/hw/virtio/vhost-shadow-virtqueue.h
+++ b/hw/virtio/vhost-shadow-virtqueue.h
@@ -28,9 +28,13 @@ typedef struct VhostShadowVirtqueue {
      * So shadow virtqueue must not clean it, or we would lose VirtQueue one.
      */
     EventNotifier svq_kick;
+
+    /* Guest's call notifier, where the SVQ calls guest. */
+    EventNotifier svq_call;
 } VhostShadowVirtqueue;
 
 void vhost_svq_set_svq_kick_fd(VhostShadowVirtqueue *svq, int svq_kick_fd);
+void vhost_svq_set_svq_call_fd(VhostShadowVirtqueue *svq, int call_fd);
 
 void vhost_svq_stop(VhostShadowVirtqueue *svq);
 
diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index 2148fd9..509def6 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -725,6 +725,13 @@ static int vhost_vdpa_set_vring_dev_kick(struct vhost_dev *dev,
     return vhost_vdpa_call(dev, VHOST_SET_VRING_KICK, file);
 }
 
+static int vhost_vdpa_set_vring_dev_call(struct vhost_dev *dev,
+                                         struct vhost_vring_file *file)
+{
+    trace_vhost_vdpa_set_vring_call(dev, file->index, file->fd);
+    return vhost_vdpa_call(dev, VHOST_SET_VRING_CALL, file);
+}
+
 /**
  * Set the shadow virtqueue descriptors to the device
  *
@@ -732,6 +739,9 @@ static int vhost_vdpa_set_vring_dev_kick(struct vhost_dev *dev,
  * @svq: The shadow virtqueue
  * @idx: The index of the virtqueue in the vhost device
  * @errp: Error
+ *
+ * Note that this function does not rewind kick file descriptor if cannot set
+ * call one.
  */
 static bool vhost_vdpa_svq_setup(struct vhost_dev *dev,
                                  VhostShadowVirtqueue *svq,
@@ -748,6 +758,14 @@ static bool vhost_vdpa_svq_setup(struct vhost_dev *dev,
     r = vhost_vdpa_set_vring_dev_kick(dev, &file);
     if (unlikely(r != 0)) {
         error_setg_errno(errp, -r, "Can't set device kick fd");
+        return false;
+    }
+
+    event_notifier = &svq->hdev_call;
+    file.fd = event_notifier_get_fd(event_notifier);
+    r = vhost_vdpa_set_vring_dev_call(dev, &file);
+    if (unlikely(r != 0)) {
+        error_setg_errno(errp, -r, "Can't set device call fd");
     }
 
     return r == 0;
@@ -873,8 +891,17 @@ static int vhost_vdpa_set_vring_kick(struct vhost_dev *dev,
 static int vhost_vdpa_set_vring_call(struct vhost_dev *dev,
                                        struct vhost_vring_file *file)
 {
-    trace_vhost_vdpa_set_vring_call(dev, file->index, file->fd);
-    return vhost_vdpa_call(dev, VHOST_SET_VRING_CALL, file);
+    struct vhost_vdpa *v = dev->opaque;
+
+    if (v->shadow_vqs_enabled) {
+        int vdpa_idx = file->index - dev->vq_index;
+        VhostShadowVirtqueue *svq = g_ptr_array_index(v->shadow_vqs, vdpa_idx);
+
+        vhost_svq_set_svq_call_fd(svq, file->fd);
+        return 0;
+    } else {
+        return vhost_vdpa_set_vring_dev_call(dev, file);
+    }
 }
 
 static int vhost_vdpa_get_features(struct vhost_dev *dev,
-- 
2.7.4


