Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71DDC56924B
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jul 2022 20:59:48 +0200 (CEST)
Received: from localhost ([::1]:55566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9AFX-0007wK-IQ
	for lists+qemu-devel@lfdr.de; Wed, 06 Jul 2022 14:59:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1o99xZ-0005VR-5D
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 14:41:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26523)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1o99xR-0000sb-3h
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 14:41:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657132863;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mErUwknFduO65jJc0n1ezU/K63y3yE1x6XCKC1pU+Qk=;
 b=SPiKohMTUaZN4TXfx/m8Jly7OLkW0wbqcYtF0xecjOtFnpwwgvK9VstdjEP34tf+z72VQ3
 fokCeslDrKewNT9cXKQZdvgKUe2NKqWm5fFFZBdS7J9ETC+3hj6am5WmarjrocWOmAoj9t
 qE8Jj7+SfPELq5ziaEGe0WhgjwKLlU4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-492-U1B8RKULOCeUIc-_EtQBgg-1; Wed, 06 Jul 2022 14:41:00 -0400
X-MC-Unique: U1B8RKULOCeUIc-_EtQBgg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 76F63294EDEF;
 Wed,  6 Jul 2022 18:40:59 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.192.119])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E8C2F1415116;
 Wed,  6 Jul 2022 18:40:56 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: Liuxiangdong <liuxiangdong5@huawei.com>,
 Markus Armbruster <armbru@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Eric Blake <eblake@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Parav Pandit <parav@mellanox.com>,
 Cornelia Huck <cohuck@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Gautam Dawar <gdawar@xilinx.com>, Eli Cohen <eli@mellanox.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Cindy Lu <lulu@redhat.com>,
 Jason Wang <jasowang@redhat.com>
Subject: [RFC PATCH v9 16/23] vhost: Add svq avail_handler callback
Date: Wed,  6 Jul 2022 20:40:01 +0200
Message-Id: <20220706184008.1649478-17-eperezma@redhat.com>
In-Reply-To: <20220706184008.1649478-1-eperezma@redhat.com>
References: <20220706184008.1649478-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This allows external handlers to be aware of new buffers that the guest
places in the virtqueue.

When this callback is defined the ownership of guest's virtqueue element
is transferred to the callback. This means that if the user wants to
forward the descriptor it needs to manually inject it. The callback is
also free to process the command by itself and use the element with
svq_push.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 hw/virtio/vhost-shadow-virtqueue.h | 16 ++++++++++++++++
 hw/virtio/vhost-shadow-virtqueue.c |  8 +++++++-
 2 files changed, 23 insertions(+), 1 deletion(-)

diff --git a/hw/virtio/vhost-shadow-virtqueue.h b/hw/virtio/vhost-shadow-virtqueue.h
index 296fef6f21..4300cb66f8 100644
--- a/hw/virtio/vhost-shadow-virtqueue.h
+++ b/hw/virtio/vhost-shadow-virtqueue.h
@@ -27,12 +27,28 @@ typedef struct VhostShadowVirtqueue VhostShadowVirtqueue;
 typedef int (*ShadowVirtQueueStart)(VhostShadowVirtqueue *svq,
                                     void *opaque);
 
+/**
+ * Callback to handle an avail buffer.
+ *
+ * @svq:  Shadow virtqueue
+ * @elem:  Element placed in the queue by the guest
+ * @vq_callback_opaque:  Opaque
+ *
+ * Returns true if the vq is running as expected, false otherwise.
+ *
+ * Note that ownership of elem is transferred to the callback.
+ */
+typedef bool (*VirtQueueAvailCallback)(VhostShadowVirtqueue *svq,
+                                       VirtQueueElement *elem,
+                                       void *vq_callback_opaque);
+
 typedef void (*VirtQueueUsedCallback)(VhostShadowVirtqueue *svq,
                                       void *used_elem_opaque,
                                       uint32_t written);
 
 typedef struct VhostShadowVirtqueueOps {
     ShadowVirtQueueStart start;
+    VirtQueueAvailCallback avail_handler;
     VirtQueueUsedCallback used_handler;
 } VhostShadowVirtqueueOps;
 
diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shadow-virtqueue.c
index b92ca4a63f..dffea256f1 100644
--- a/hw/virtio/vhost-shadow-virtqueue.c
+++ b/hw/virtio/vhost-shadow-virtqueue.c
@@ -371,7 +371,13 @@ static void vhost_handle_guest_kick(VhostShadowVirtqueue *svq)
                 return;
             }
 
-            ok = vhost_svq_add_element(svq, g_steal_pointer(&elem));
+            if (svq->ops) {
+                ok = svq->ops->avail_handler(svq, g_steal_pointer(&elem),
+                                             svq->ops_opaque);
+            } else {
+                ok = vhost_svq_add_element(svq, g_steal_pointer(&elem));
+            }
+
             if (unlikely(!ok)) {
                 /* VQ is broken, just return and ignore any other kicks */
                 return;
-- 
2.31.1


