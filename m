Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FD11577FF2
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 12:41:43 +0200 (CEST)
Received: from localhost ([::1]:52520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDOC6-0005Zk-2Z
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 06:41:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oDO1Z-0000Xv-3O
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 06:30:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28004)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oDO1V-0001WN-JF
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 06:30:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658140245;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dCFxbNxGvYH2p92JwjKOfvniNPsvU8wwPLaGpYNSXls=;
 b=Ga2MABg0of2POMKuGt1WhBKVK/0W9eiYhQFQOzno6wywvK4zt7LQtR0bzseA2afPWSOLy2
 5tcbKMAwh05mKAxbhOceg6DoGJkrD+ybOfRmmnvb1gN1nNQws51R+hg+hClhSW/fRe5j3o
 03HfQYVtIKrnVxAyIcK8ZB1HkDN/qwc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-556-zH2NgtbDMZ6w3Mh2o4Xtug-1; Mon, 18 Jul 2022 06:30:40 -0400
X-MC-Unique: zH2NgtbDMZ6w3Mh2o4Xtug-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9FA5428084E3;
 Mon, 18 Jul 2022 10:30:39 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.192.86])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DB6972166B26;
 Mon, 18 Jul 2022 10:30:35 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: Cindy Lu <lulu@redhat.com>, Gautam Dawar <gdawar@xilinx.com>,
 Cornelia Huck <cohuck@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Liuxiangdong <liuxiangdong5@huawei.com>, Jason Wang <jasowang@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Eli Cohen <eli@mellanox.com>,
 Harpreet Singh Anand <hanand@xilinx.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Parav Pandit <parav@mellanox.com>
Subject: [PATCH v4 10/19] vhost: add vhost_svq_push_elem
Date: Mon, 18 Jul 2022 12:29:40 +0200
Message-Id: <20220718102949.2868267-11-eperezma@redhat.com>
In-Reply-To: <20220718102949.2868267-1-eperezma@redhat.com>
References: <20220718102949.2868267-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
 hw/virtio/vhost-shadow-virtqueue.h |  3 +++
 hw/virtio/vhost-shadow-virtqueue.c | 16 ++++++++++++++++
 2 files changed, 19 insertions(+)

diff --git a/hw/virtio/vhost-shadow-virtqueue.h b/hw/virtio/vhost-shadow-virtqueue.h
index 5c7e7cbab6..d9fc1f1799 100644
--- a/hw/virtio/vhost-shadow-virtqueue.h
+++ b/hw/virtio/vhost-shadow-virtqueue.h
@@ -84,6 +84,9 @@ typedef struct VhostShadowVirtqueue {
 
 bool vhost_svq_valid_features(uint64_t features, Error **errp);
 
+void vhost_svq_push_elem(VhostShadowVirtqueue *svq,
+                         const VirtQueueElement *elem, uint32_t len);
+
 void vhost_svq_set_svq_kick_fd(VhostShadowVirtqueue *svq, int svq_kick_fd);
 void vhost_svq_set_svq_call_fd(VhostShadowVirtqueue *svq, int call_fd);
 void vhost_svq_get_vring_addr(const VhostShadowVirtqueue *svq,
diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shadow-virtqueue.c
index ae5bd6efa8..b377e125e7 100644
--- a/hw/virtio/vhost-shadow-virtqueue.c
+++ b/hw/virtio/vhost-shadow-virtqueue.c
@@ -427,6 +427,22 @@ static VirtQueueElement *vhost_svq_get_buf(VhostShadowVirtqueue *svq,
     return g_steal_pointer(&svq->desc_state[used_elem.id].elem);
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


