Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1E784402C0
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 21:02:46 +0200 (CEST)
Received: from localhost ([::1]:53950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgX9J-0005WA-Mv
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 15:02:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1mgWpP-000110-IS
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 14:42:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59773)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1mgWpN-0001uS-Ij
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 14:42:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635532929;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jZHcr8bvny1z9QTEIgdeBhLuNOwXsIMjvMT3Kd1nK80=;
 b=H0nFp/p2D5/rZImRijsEKJG7x5xQC/a+fn0FPlUeOULLffx8oQuQAu/IIV/A3nmOg7j+UG
 VVvBoyCBhpwnZ2sVB2IY8IIwBx+Ef4117hyyuBFVzTXeWrYkXtfsJdwsWhjVyGePvfspdL
 Wc/O/ss+8O14/en8BgmgXHmR18HVToQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-307-FZJx_v9_NSygdBvz3R_k-w-1; Fri, 29 Oct 2021 14:42:05 -0400
X-MC-Unique: FZJx_v9_NSygdBvz3R_k-w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 222F61006AAC;
 Fri, 29 Oct 2021 18:42:04 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.192.75])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 104195D6CF;
 Fri, 29 Oct 2021 18:41:59 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v5 17/26] vhost: Route host->guest notification through
 shadow virtqueue
Date: Fri, 29 Oct 2021 20:35:16 +0200
Message-Id: <20211029183525.1776416-18-eperezma@redhat.com>
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

This will make qemu aware of the device used buffers, allowing it to
write the guest memory with its contents if needed.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 hw/virtio/vhost-shadow-virtqueue.c | 15 +++++++++++++++
 hw/virtio/vhost-vdpa.c             | 13 +++++++++++++
 2 files changed, 28 insertions(+)

diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shadow-virtqueue.c
index 6535eefccd..77916d2fed 100644
--- a/hw/virtio/vhost-shadow-virtqueue.c
+++ b/hw/virtio/vhost-shadow-virtqueue.c
@@ -75,6 +75,19 @@ void vhost_svq_set_host_mr_notifier(VhostShadowVirtqueue *svq, void *addr)
     svq->host_notifier_mr = addr;
 }
 
+/* Forward vhost notifications */
+static void vhost_svq_handle_call(EventNotifier *n)
+{
+    VhostShadowVirtqueue *svq = container_of(n, VhostShadowVirtqueue,
+                                             hdev_call);
+
+    if (unlikely(!event_notifier_test_and_clear(n))) {
+        return;
+    }
+
+    event_notifier_set(&svq->svq_call);
+}
+
 /*
  * Obtain the SVQ call notifier, where vhost device notifies SVQ that there
  * exists pending used buffers.
@@ -200,6 +213,7 @@ VhostShadowVirtqueue *vhost_svq_new(struct vhost_dev *dev, int idx)
     }
 
     svq->vq = virtio_get_queue(dev->vdev, vq_idx);
+    event_notifier_set_handler(&svq->hdev_call, vhost_svq_handle_call);
     return g_steal_pointer(&svq);
 
 err_init_hdev_call:
@@ -215,6 +229,7 @@ err_init_hdev_kick:
 void vhost_svq_free(VhostShadowVirtqueue *vq)
 {
     event_notifier_cleanup(&vq->hdev_kick);
+    event_notifier_set_handler(&vq->hdev_call, NULL);
     event_notifier_cleanup(&vq->hdev_call);
     g_free(vq);
 }
diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index 89d77f3452..c2580693b3 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -840,10 +840,14 @@ static bool vhost_vdpa_svq_start_vq(struct vhost_dev *dev, unsigned idx,
     struct vhost_vring_file vhost_kick_file = {
         .index = vq_index,
     };
+    struct vhost_vring_file vhost_call_file = {
+        .index = idx + dev->vq_index,
+    };
     int r;
 
     if (svq_mode) {
         const EventNotifier *vhost_kick = vhost_svq_get_dev_kick_notifier(svq);
+        const EventNotifier *vhost_call = vhost_svq_get_svq_call_notifier(svq);
 
         if (n->addr) {
             r = virtio_queue_set_host_notifier_mr(dev->vdev, idx, &n->mr,
@@ -856,9 +860,12 @@ static bool vhost_vdpa_svq_start_vq(struct vhost_dev *dev, unsigned idx,
             assert(r == 0);
             vhost_svq_set_host_mr_notifier(svq, n->addr);
         }
+
+        vhost_svq_set_guest_call_notifier(svq, v->call_fd[idx]);
         vhost_svq_start(dev, idx, svq, v->kick_fd[idx]);
 
         vhost_kick_file.fd = event_notifier_get_fd(vhost_kick);
+        vhost_call_file.fd = event_notifier_get_fd(vhost_call);
     } else {
         vhost_svq_stop(dev, idx, svq);
 
@@ -872,6 +879,7 @@ static bool vhost_vdpa_svq_start_vq(struct vhost_dev *dev, unsigned idx,
             assert(r == 0);
         }
         vhost_kick_file.fd = v->kick_fd[idx];
+        vhost_call_file.fd = v->call_fd[idx];
     }
 
     r = vhost_vdpa_set_vring_dev_kick(dev, &vhost_kick_file);
@@ -879,6 +887,11 @@ static bool vhost_vdpa_svq_start_vq(struct vhost_dev *dev, unsigned idx,
         error_setg_errno(errp, -r, "vhost_vdpa_set_vring_kick failed");
         return false;
     }
+    r = vhost_vdpa_set_vring_dev_call(dev, &vhost_call_file);
+    if (unlikely(r)) {
+        error_setg_errno(errp, -r, "vhost_vdpa_set_vring_call failed");
+        return false;
+    }
 
     return true;
 }
-- 
2.27.0


