Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AAFC4EE020
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 20:06:57 +0200 (CEST)
Received: from localhost ([::1]:35980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZzCC-0006H1-2w
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 14:06:56 -0400
Received: from eggs.gnu.org ([209.51.188.92]:43814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nZz9m-0003Nt-Be
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 14:04:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59135)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nZz9k-0007Jn-92
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 14:04:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648749863;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1geVC60KOCBqYcV0yzBh5c9nGhEBBky47+bYEoJUFqQ=;
 b=gAyrzoXvVH7GWhpdKVdH8S1WtI2Y9UlSojtQPQ/3THmOYIzrUgNFtWuWrYNWkd07Rfc9B0
 1wQJfEak4ZWYdGNktmsN0J7QGd115XTuqCtj3KXAhT13lGXnecPKJZfVzTbDakSHgByImt
 tf9v8QqfMPNULupWS/o9vHk7zokI7eQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-468-Lu7TbR_3O7uawgSaYmvItA-1; Thu, 31 Mar 2022 14:04:18 -0400
X-MC-Unique: Lu7TbR_3O7uawgSaYmvItA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 597CE3C01C00;
 Thu, 31 Mar 2022 18:04:18 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.194.94])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1FAB840D0160;
 Thu, 31 Mar 2022 18:04:15 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v4 01/20] vhost: Fix bad return of descriptors
Date: Thu, 31 Mar 2022 20:03:51 +0200
Message-Id: <20220331180410.531837-2-eperezma@redhat.com>
In-Reply-To: <20220331180410.531837-1-eperezma@redhat.com>
References: <20220331180410.531837-1-eperezma@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Parav Pandit <parav@mellanox.com>,
 Cindy Lu <lulu@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Gautam Dawar <gdawar@xilinx.com>, Harpreet Singh Anand <hanand@xilinx.com>,
 Peter Xu <peterx@redhat.com>, Eli Cohen <eli@mellanox.com>,
 Liuxiangdong <liuxiangdong5@huawei.com>, Zhu Lingshan <lingshan.zhu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Only the first one of them were properly enqueued back.

Fixes: 100890f7ca ("vhost: Shadow virtqueue buffers forwarding")
Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 hw/virtio/vhost-shadow-virtqueue.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shadow-virtqueue.c
index b232803d1b..c17506df20 100644
--- a/hw/virtio/vhost-shadow-virtqueue.c
+++ b/hw/virtio/vhost-shadow-virtqueue.c
@@ -333,13 +333,25 @@ static void vhost_svq_disable_notification(VhostShadowVirtqueue *svq)
     svq->vring.avail->flags |= cpu_to_le16(VRING_AVAIL_F_NO_INTERRUPT);
 }
 
+static uint16_t vhost_svq_last_desc_of_chain(VhostShadowVirtqueue *svq,
+                                             uint16_t i)
+{
+    vring_desc_t *descs = svq->vring.desc;
+
+    while (le16_to_cpu(descs[i].flags) & VRING_DESC_F_NEXT) {
+        i = le16_to_cpu(descs[i].next);
+    }
+
+    return i;
+}
+
 static VirtQueueElement *vhost_svq_get_buf(VhostShadowVirtqueue *svq,
                                            uint32_t *len)
 {
     vring_desc_t *descs = svq->vring.desc;
     const vring_used_t *used = svq->vring.used;
     vring_used_elem_t used_elem;
-    uint16_t last_used;
+    uint16_t last_used, last_used_chain;
 
     if (!vhost_svq_more_used(svq)) {
         return NULL;
@@ -365,7 +377,8 @@ static VirtQueueElement *vhost_svq_get_buf(VhostShadowVirtqueue *svq,
         return NULL;
     }
 
-    descs[used_elem.id].next = svq->free_head;
+    last_used_chain = vhost_svq_last_desc_of_chain(svq, used_elem.id);
+    descs[last_used_chain].next = svq->free_head;
     svq->free_head = used_elem.id;
 
     *len = used_elem.len;
-- 
2.27.0


