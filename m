Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA7FB440271
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 20:48:03 +0200 (CEST)
Received: from localhost ([::1]:48692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgWv4-0007j5-Md
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 14:48:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1mgWlm-0003cG-9K
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 14:38:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54896)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1mgWlk-0000cm-MN
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 14:38:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635532704;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ECrl+MYM9kk55v993t9N84N4uC48KJLtXoj2UfvCB2w=;
 b=Ua0apm9ye430QsL0c3b3AQ5NSH/NuTHlGied0eIHk/LsnaG/C5qx5rOrA8mgJGmKMoim3d
 FiNUuURQgtP+KZtExnOHPku3XEl5Ty6P8dsCshgDE2IKofexBnBL4zgN6Wd9KncV5vgCLb
 DsosvlOtSPBmAf+VxWDyJPMJa6ffdKg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-596-fLvx3xHJMraQG43m6U6oBA-1; Fri, 29 Oct 2021 14:38:20 -0400
X-MC-Unique: fLvx3xHJMraQG43m6U6oBA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 90F6310A8E00;
 Fri, 29 Oct 2021 18:38:19 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.192.75])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 724255D6CF;
 Fri, 29 Oct 2021 18:37:56 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v5 11/26] vhost: Handle host notifiers in SVQ
Date: Fri, 29 Oct 2021 20:35:10 +0200
Message-Id: <20211029183525.1776416-12-eperezma@redhat.com>
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

If device supports host notifiers, this makes one jump less (kernel) to
deliver SVQ notifications to it.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 hw/virtio/vhost-shadow-virtqueue.h |  2 ++
 hw/virtio/vhost-shadow-virtqueue.c | 23 ++++++++++++++++++++++-
 2 files changed, 24 insertions(+), 1 deletion(-)

diff --git a/hw/virtio/vhost-shadow-virtqueue.h b/hw/virtio/vhost-shadow-virtqueue.h
index 30ab9643b9..eb0a54f954 100644
--- a/hw/virtio/vhost-shadow-virtqueue.h
+++ b/hw/virtio/vhost-shadow-virtqueue.h
@@ -18,6 +18,8 @@ typedef struct VhostShadowVirtqueue VhostShadowVirtqueue;
 void vhost_svq_set_svq_kick_fd(VhostShadowVirtqueue *svq, int svq_kick_fd);
 const EventNotifier *vhost_svq_get_dev_kick_notifier(
                                               const VhostShadowVirtqueue *svq);
+void vhost_svq_set_host_mr_notifier(VhostShadowVirtqueue *svq, void *addr);
+
 void vhost_svq_start(struct vhost_dev *dev, unsigned idx,
                      VhostShadowVirtqueue *svq, int svq_kick_fd);
 void vhost_svq_stop(struct vhost_dev *dev, unsigned idx,
diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shadow-virtqueue.c
index fda60d11db..e3dcc039b6 100644
--- a/hw/virtio/vhost-shadow-virtqueue.c
+++ b/hw/virtio/vhost-shadow-virtqueue.c
@@ -29,6 +29,12 @@ typedef struct VhostShadowVirtqueue {
      * So shadow virtqueue must not clean it, or we would lose VirtQueue one.
      */
     EventNotifier svq_kick;
+
+    /* Device's host notifier memory region. NULL means no region */
+    void *host_notifier_mr;
+
+    /* Virtio queue shadowing */
+    VirtQueue *vq;
 } VhostShadowVirtqueue;
 
 /**
@@ -50,7 +56,20 @@ static void vhost_handle_guest_kick(EventNotifier *n)
         return;
     }
 
-    event_notifier_set(&svq->hdev_kick);
+    if (svq->host_notifier_mr) {
+        uint16_t *mr = svq->host_notifier_mr;
+        *mr = virtio_get_queue_index(svq->vq);
+    } else {
+        event_notifier_set(&svq->hdev_kick);
+    }
+}
+
+/*
+ * Set the device's memory region notifier. addr = NULL clear it.
+ */
+void vhost_svq_set_host_mr_notifier(VhostShadowVirtqueue *svq, void *addr)
+{
+    svq->host_notifier_mr = addr;
 }
 
 /**
@@ -134,6 +153,7 @@ void vhost_svq_stop(struct vhost_dev *dev, unsigned idx,
  */
 VhostShadowVirtqueue *vhost_svq_new(struct vhost_dev *dev, int idx)
 {
+    int vq_idx = dev->vq_index + idx;
     g_autofree VhostShadowVirtqueue *svq = g_new0(VhostShadowVirtqueue, 1);
     int r;
 
@@ -151,6 +171,7 @@ VhostShadowVirtqueue *vhost_svq_new(struct vhost_dev *dev, int idx)
         goto err_init_hdev_call;
     }
 
+    svq->vq = virtio_get_queue(dev->vdev, vq_idx);
     return g_steal_pointer(&svq);
 
 err_init_hdev_call:
-- 
2.27.0


