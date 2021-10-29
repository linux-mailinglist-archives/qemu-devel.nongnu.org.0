Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB0184402A2
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 20:57:33 +0200 (CEST)
Received: from localhost ([::1]:40338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgX4G-0004jF-4q
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 14:57:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1mgWlP-0002nA-S0
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 14:38:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21052)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1mgWlN-0000aZ-KF
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 14:38:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635532680;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WIcyrCQVvwgl5MGeMEzzqUJtsw1kh5CpL74HSDWWkSc=;
 b=M6X0iLsksAc9V/lF+yqrQUBXBry1SP5mGb9fJ4LziwOgOwE5Jqo/Yy80P6/3qCip/eX3Hg
 epDnNrmVXLT9b0iWPdgP05kuwsG3ggD9jflfm82wlV76sD0er7Ao85N2vql2SINhuSu9Mj
 wXhrB5AqOo9uw7N2kTFbAwTv7kjgXfo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-559-6zXcfm6BMay2s2pYq09pow-1; Fri, 29 Oct 2021 14:37:57 -0400
X-MC-Unique: 6zXcfm6BMay2s2pYq09pow-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 18E29802B61;
 Fri, 29 Oct 2021 18:37:56 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.192.75])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 850356F920;
 Fri, 29 Oct 2021 18:37:48 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v5 10/26] vhost: Add Shadow VirtQueue kick forwarding
 capabilities
Date: Fri, 29 Oct 2021 20:35:09 +0200
Message-Id: <20211029183525.1776416-11-eperezma@redhat.com>
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
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eperezma@redhat.com;
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

At this mode no buffer forwarding will be performed in SVQ mode: Qemu
will just forward the guest's kicks to the device.

Also, host notifiers must be disabled at SVQ start, and they will not
start if SVQ has been enabled when device is stopped. This will be
addressed in next patches.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 hw/virtio/vhost-shadow-virtqueue.h |  4 ++
 hw/virtio/vhost-shadow-virtqueue.c | 77 +++++++++++++++++++++++++++---
 2 files changed, 74 insertions(+), 7 deletions(-)

diff --git a/hw/virtio/vhost-shadow-virtqueue.h b/hw/virtio/vhost-shadow-virtqueue.h
index a19eede089..30ab9643b9 100644
--- a/hw/virtio/vhost-shadow-virtqueue.h
+++ b/hw/virtio/vhost-shadow-virtqueue.h
@@ -18,6 +18,10 @@ typedef struct VhostShadowVirtqueue VhostShadowVirtqueue;
 void vhost_svq_set_svq_kick_fd(VhostShadowVirtqueue *svq, int svq_kick_fd);
 const EventNotifier *vhost_svq_get_dev_kick_notifier(
                                               const VhostShadowVirtqueue *svq);
+void vhost_svq_start(struct vhost_dev *dev, unsigned idx,
+                     VhostShadowVirtqueue *svq, int svq_kick_fd);
+void vhost_svq_stop(struct vhost_dev *dev, unsigned idx,
+                    VhostShadowVirtqueue *svq);
 
 VhostShadowVirtqueue *vhost_svq_new(struct vhost_dev *dev, int idx);
 
diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shadow-virtqueue.c
index 513d7f2782..fda60d11db 100644
--- a/hw/virtio/vhost-shadow-virtqueue.c
+++ b/hw/virtio/vhost-shadow-virtqueue.c
@@ -40,18 +40,36 @@ const EventNotifier *vhost_svq_get_dev_kick_notifier(
     return &svq->hdev_kick;
 }
 
+/* Forward guest notifications */
+static void vhost_handle_guest_kick(EventNotifier *n)
+{
+    VhostShadowVirtqueue *svq = container_of(n, VhostShadowVirtqueue,
+                                             svq_kick);
+
+    if (unlikely(!event_notifier_test_and_clear(n))) {
+        return;
+    }
+
+    event_notifier_set(&svq->hdev_kick);
+}
+
 /**
- * Set a new file descriptor for the guest to kick SVQ and notify for avail
+ * Convenience function to set guest to SVQ kick fd
  *
- * @svq          The svq
- * @svq_kick_fd  The new svq kick fd
+ * @svq         The shadow VirtQueue
+ * @svq_kick_fd The guest to SVQ kick fd
+ * @check_old   Check old file descriptor for pending notifications
  */
-void vhost_svq_set_svq_kick_fd(VhostShadowVirtqueue *svq, int svq_kick_fd)
+static void vhost_svq_set_svq_kick_fd_internal(VhostShadowVirtqueue *svq,
+                                               int svq_kick_fd,
+                                               bool check_old)
 {
     EventNotifier tmp;
 
-    event_notifier_set_handler(&svq->svq_kick, NULL);
-    event_notifier_init_fd(&tmp, event_notifier_get_fd(&svq->svq_kick));
+    if (check_old) {
+        event_notifier_set_handler(&svq->svq_kick, NULL);
+        event_notifier_init_fd(&tmp, event_notifier_get_fd(&svq->svq_kick));
+    }
 
     /*
      * event_notifier_set_handler already checks for guest's notifications if
@@ -59,12 +77,57 @@ void vhost_svq_set_svq_kick_fd(VhostShadowVirtqueue *svq, int svq_kick_fd)
      * need to explicitely check for them.
      */
     event_notifier_init_fd(&svq->svq_kick, svq_kick_fd);
+    event_notifier_set_handler(&svq->svq_kick, vhost_handle_guest_kick);
 
-    if (event_notifier_test_and_clear(&tmp)) {
+    /*
+     * !check_old means that we are starting SVQ, taking the descriptor from
+     * vhost-vdpa device. This means that we can't trust old file descriptor
+     * pending notifications, since they could have been swallowed by kernel
+     * vhost or paused device. So let it enabled, and qemu event loop will call
+     * us to handle guest avail ring when SVQ is ready.
+     */
+    if (!check_old || event_notifier_test_and_clear(&tmp)) {
         event_notifier_set(&svq->hdev_kick);
     }
 }
 
+/**
+ * Set a new file descriptor for the guest to kick SVQ and notify for avail
+ *
+ * @svq          The svq
+ * @svq_kick_fd  The svq kick fd
+ *
+ * Note that SVQ will never close the old file descriptor.
+ */
+void vhost_svq_set_svq_kick_fd(VhostShadowVirtqueue *svq, int svq_kick_fd)
+{
+    vhost_svq_set_svq_kick_fd_internal(svq, svq_kick_fd, true);
+}
+
+/*
+ * Start shadow virtqueue operation.
+ * @dev vhost device
+ * @hidx vhost virtqueue index
+ * @svq Shadow Virtqueue
+ */
+void vhost_svq_start(struct vhost_dev *dev, unsigned idx,
+                     VhostShadowVirtqueue *svq, int svq_kick_fd)
+{
+    vhost_svq_set_svq_kick_fd_internal(svq, svq_kick_fd, false);
+}
+
+/*
+ * Stop shadow virtqueue operation.
+ * @dev vhost device
+ * @idx vhost queue index
+ * @svq Shadow Virtqueue
+ */
+void vhost_svq_stop(struct vhost_dev *dev, unsigned idx,
+                    VhostShadowVirtqueue *svq)
+{
+    event_notifier_set_handler(&svq->svq_kick, NULL);
+}
+
 /*
  * Creates vhost shadow virtqueue, and instruct vhost device to use the shadow
  * methods and file descriptors.
-- 
2.27.0


