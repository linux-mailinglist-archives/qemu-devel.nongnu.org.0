Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B82C649669A
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 21:49:42 +0100 (CET)
Received: from localhost ([::1]:54292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nB0qr-0000MB-J3
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 15:49:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nB0Zk-00064S-1Q
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 15:32:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21840)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nB0Zi-0003fG-16
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 15:31:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642797117;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4uUEthkLuffyBdIe45nACcX3HfetQ/LiHwxlBekizvI=;
 b=WY3Z51qsiRoobCOhlZdUu/5LpR1VaeeE8xqsA4M2XXFkujt5x16QvK5xfk95rm8b7PJ6Rt
 jnr0iBT8cB9J5dB1z1HTZQwvDhxneXnZQ8df+XwGUlwe14dOmsyKaTo9DfQS+R49ia85X2
 pVvHsKk0+mmmQBsmwoqZL3O7zdpW+Kc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-556-wQrbwDZDMhysgNMaWnkXvw-1; Fri, 21 Jan 2022 15:31:56 -0500
X-MC-Unique: wQrbwDZDMhysgNMaWnkXvw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CB80394EE0;
 Fri, 21 Jan 2022 20:31:54 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.193.239])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C046416A31;
 Fri, 21 Jan 2022 20:31:49 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 04/31] vdpa: Add vhost_svq_set_svq_kick_fd
Date: Fri, 21 Jan 2022 21:27:06 +0100
Message-Id: <20220121202733.404989-5-eperezma@redhat.com>
In-Reply-To: <20220121202733.404989-1-eperezma@redhat.com>
References: <20220121202733.404989-1-eperezma@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Parav Pandit <parav@mellanox.com>,
 Cindy Lu <lulu@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Gautam Dawar <gdawar@xilinx.com>,
 virtualization@lists.linux-foundation.org,
 Eduardo Habkost <ehabkost@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Peter Xu <peterx@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Eli Cohen <eli@mellanox.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>, Eric Blake <eblake@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This function allows the vhost-vdpa backend to override kick_fd.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 hw/virtio/vhost-shadow-virtqueue.h |  1 +
 hw/virtio/vhost-shadow-virtqueue.c | 45 ++++++++++++++++++++++++++++++
 2 files changed, 46 insertions(+)

diff --git a/hw/virtio/vhost-shadow-virtqueue.h b/hw/virtio/vhost-shadow-virtqueue.h
index 400effd9f2..a56ecfc09d 100644
--- a/hw/virtio/vhost-shadow-virtqueue.h
+++ b/hw/virtio/vhost-shadow-virtqueue.h
@@ -15,6 +15,7 @@
 
 typedef struct VhostShadowVirtqueue VhostShadowVirtqueue;
 
+void vhost_svq_set_svq_kick_fd(VhostShadowVirtqueue *svq, int svq_kick_fd);
 const EventNotifier *vhost_svq_get_dev_kick_notifier(
                                               const VhostShadowVirtqueue *svq);
 
diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shadow-virtqueue.c
index bd87110073..21534bc94d 100644
--- a/hw/virtio/vhost-shadow-virtqueue.c
+++ b/hw/virtio/vhost-shadow-virtqueue.c
@@ -11,6 +11,7 @@
 #include "hw/virtio/vhost-shadow-virtqueue.h"
 
 #include "qemu/error-report.h"
+#include "qemu/main-loop.h"
 
 /* Shadow virtqueue to relay notifications */
 typedef struct VhostShadowVirtqueue {
@@ -18,8 +19,20 @@ typedef struct VhostShadowVirtqueue {
     EventNotifier hdev_kick;
     /* Shadow call notifier, sent to vhost */
     EventNotifier hdev_call;
+
+    /*
+     * Borrowed virtqueue's guest to host notifier.
+     * To borrow it in this event notifier allows to register on the event
+     * loop and access the associated shadow virtqueue easily. If we use the
+     * VirtQueue, we don't have an easy way to retrieve it.
+     *
+     * So shadow virtqueue must not clean it, or we would lose VirtQueue one.
+     */
+    EventNotifier svq_kick;
 } VhostShadowVirtqueue;
 
+#define INVALID_SVQ_KICK_FD -1
+
 /**
  * The notifier that SVQ will use to notify the device.
  */
@@ -29,6 +42,35 @@ const EventNotifier *vhost_svq_get_dev_kick_notifier(
     return &svq->hdev_kick;
 }
 
+/**
+ * Set a new file descriptor for the guest to kick SVQ and notify for avail
+ *
+ * @svq          The svq
+ * @svq_kick_fd  The new svq kick fd
+ */
+void vhost_svq_set_svq_kick_fd(VhostShadowVirtqueue *svq, int svq_kick_fd)
+{
+    EventNotifier tmp;
+    bool check_old = INVALID_SVQ_KICK_FD !=
+                     event_notifier_get_fd(&svq->svq_kick);
+
+    if (check_old) {
+        event_notifier_set_handler(&svq->svq_kick, NULL);
+        event_notifier_init_fd(&tmp, event_notifier_get_fd(&svq->svq_kick));
+    }
+
+    /*
+     * event_notifier_set_handler already checks for guest's notifications if
+     * they arrive to the new file descriptor in the switch, so there is no
+     * need to explicitely check for them.
+     */
+    event_notifier_init_fd(&svq->svq_kick, svq_kick_fd);
+
+    if (!check_old || event_notifier_test_and_clear(&tmp)) {
+        event_notifier_set(&svq->hdev_kick);
+    }
+}
+
 /**
  * Creates vhost shadow virtqueue, and instruct vhost device to use the shadow
  * methods and file descriptors.
@@ -52,6 +94,9 @@ VhostShadowVirtqueue *vhost_svq_new(void)
         goto err_init_hdev_call;
     }
 
+    /* Placeholder descriptor, it should be deleted at set_kick_fd */
+    event_notifier_init_fd(&svq->svq_kick, INVALID_SVQ_KICK_FD);
+
     return g_steal_pointer(&svq);
 
 err_init_hdev_call:
-- 
2.27.0


