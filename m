Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE47E56B7EF
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jul 2022 13:03:48 +0200 (CEST)
Received: from localhost ([::1]:38846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9llz-0004xO-Pw
	for lists+qemu-devel@lfdr.de; Fri, 08 Jul 2022 07:03:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1o9lZa-0000Qn-G4
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 06:50:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:23543)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1o9lZY-0007v2-K7
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 06:50:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657277455;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Iu3bbjElwEBqiK+itsNC8G6qxF/EszQyEjqbnfIQUdE=;
 b=WPUwjqjZ2cKfi/s81SciFiRudy4T8N6p6pXDItIFSUe2LsIQxuhGvkUVK/VjHbzwHpq0EO
 FtlduT6+LIgvrBCeA+7vSmJe2CmObxCiqo95Z9b5JJn3Bt/C6u6Y5Q5AiMNl1GLmGCr9bc
 VlzLhIL91xONtoridjkNaa7VYMKW4vY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-179-mpYBCS0vP9-4OsLaM9p9DQ-1; Fri, 08 Jul 2022 06:50:52 -0400
X-MC-Unique: mpYBCS0vP9-4OsLaM9p9DQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 068473C0ED60;
 Fri,  8 Jul 2022 10:50:52 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.192.172])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 318761121314;
 Fri,  8 Jul 2022 10:50:49 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: Eric Blake <eblake@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Liuxiangdong <liuxiangdong5@huawei.com>, Cindy Lu <lulu@redhat.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Laurent Vivier <lvivier@redhat.com>, Gautam Dawar <gdawar@xilinx.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Jason Wang <jasowang@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Eli Cohen <eli@mellanox.com>,
 Parav Pandit <parav@mellanox.com>, Cornelia Huck <cohuck@redhat.com>
Subject: [PATCH 11/22] vhost: add vhost_svq_push_elem
Date: Fri,  8 Jul 2022 12:50:02 +0200
Message-Id: <20220708105013.1899854-12-eperezma@redhat.com>
In-Reply-To: <20220708105013.1899854-1-eperezma@redhat.com>
References: <20220708105013.1899854-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This function allows external SVQ users to return guest's available
buffers.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 hw/virtio/vhost-shadow-virtqueue.h |  2 ++
 hw/virtio/vhost-shadow-virtqueue.c | 16 ++++++++++++++++
 2 files changed, 18 insertions(+)

diff --git a/hw/virtio/vhost-shadow-virtqueue.h b/hw/virtio/vhost-shadow-virtqueue.h
index 3e1bea12ca..855fa82e3e 100644
--- a/hw/virtio/vhost-shadow-virtqueue.h
+++ b/hw/virtio/vhost-shadow-virtqueue.h
@@ -82,6 +82,8 @@ typedef struct VhostShadowVirtqueue {
 
 bool vhost_svq_valid_features(uint64_t features, Error **errp);
 
+void vhost_svq_push_elem(VhostShadowVirtqueue *svq,
+                         const VirtQueueElement *elem, uint32_t len);
 void vhost_svq_set_svq_kick_fd(VhostShadowVirtqueue *svq, int svq_kick_fd);
 void vhost_svq_set_svq_call_fd(VhostShadowVirtqueue *svq, int call_fd);
 void vhost_svq_get_vring_addr(const VhostShadowVirtqueue *svq,
diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shadow-virtqueue.c
index 01caa5887e..2b0a268655 100644
--- a/hw/virtio/vhost-shadow-virtqueue.c
+++ b/hw/virtio/vhost-shadow-virtqueue.c
@@ -439,6 +439,22 @@ static SVQElement vhost_svq_get_buf(VhostShadowVirtqueue *svq, uint32_t *len)
     return svq_elem;
 }
 
+/**
+ * Push an element to SVQ, returning it to the guest.
+ */
+void vhost_svq_push_elem(VhostShadowVirtqueue *svq,
+                         const VirtQueueElement *elem, uint32_t len)
+{
+    virtqueue_push(svq->vq, elem, len);
+    if (svq->next_guest_avail_elem) {
+        /*
+         * Avail ring was full when vhost_svq_flush was called, so it's a
+         * good moment to make more descriptors available if possible.
+         */
+        vhost_handle_guest_kick(svq);
+    }
+}
+
 static void vhost_svq_flush(VhostShadowVirtqueue *svq,
                             bool check_for_avail_queue)
 {
-- 
2.31.1


