Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D61A656925B
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jul 2022 21:07:53 +0200 (CEST)
Received: from localhost ([::1]:38464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9ANM-0007Kz-Ov
	for lists+qemu-devel@lfdr.de; Wed, 06 Jul 2022 15:07:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1o99xm-0005aF-7G
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 14:41:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20514)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1o99xU-0000sv-1N
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 14:41:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657132866;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ziR3ctgT/CCLnNAiqZTlkOadNXJL1NwUmNcP1OIzuHA=;
 b=MKvgtNipkECyKuihHgO6WqDEDmva3zXTsyO7Qft0r56RhdAyQXpmp1vO3LYzdf13R2YC8t
 2yAJvrkjmU6wEUsDhW1c1KFnbXuvoA4VxGJwF/1p+5ylxpMP+7dpY/w3I0f8pEWpoKB+uA
 UGTDzT75N/bvfqglSyl1gpCUXVfUnXQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-28-1C7HMeMgNWKz2SH2kUhu2A-1; Wed, 06 Jul 2022 14:41:02 -0400
X-MC-Unique: 1C7HMeMgNWKz2SH2kUhu2A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5DA591019C8B;
 Wed,  6 Jul 2022 18:41:02 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.192.119])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B95531415116;
 Wed,  6 Jul 2022 18:40:59 +0000 (UTC)
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
Subject: [RFC PATCH v9 17/23] vhost: add detach SVQ operation
Date: Wed,  6 Jul 2022 20:40:02 +0200
Message-Id: <20220706184008.1649478-18-eperezma@redhat.com>
In-Reply-To: <20220706184008.1649478-1-eperezma@redhat.com>
References: <20220706184008.1649478-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

To notify the caller it needs to discard the element.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 hw/virtio/vhost-shadow-virtqueue.h | 11 +++++++++++
 hw/virtio/vhost-shadow-virtqueue.c | 11 ++++++++++-
 2 files changed, 21 insertions(+), 1 deletion(-)

diff --git a/hw/virtio/vhost-shadow-virtqueue.h b/hw/virtio/vhost-shadow-virtqueue.h
index 4300cb66f8..583b6fda5d 100644
--- a/hw/virtio/vhost-shadow-virtqueue.h
+++ b/hw/virtio/vhost-shadow-virtqueue.h
@@ -46,10 +46,21 @@ typedef void (*VirtQueueUsedCallback)(VhostShadowVirtqueue *svq,
                                       void *used_elem_opaque,
                                       uint32_t written);
 
+/**
+ * Detach the element from the shadow virtqueue.  SVQ needs to free it and it
+ * cannot be pushed or discarded.
+ *
+ * @elem_opaque: The element opaque
+ *
+ * Return the guest element to detach and free if any.
+ */
+typedef VirtQueueElement *(*VirtQueueDetachCallback)(void *elem_opaque);
+
 typedef struct VhostShadowVirtqueueOps {
     ShadowVirtQueueStart start;
     VirtQueueAvailCallback avail_handler;
     VirtQueueUsedCallback used_handler;
+    VirtQueueDetachCallback detach_handler;
 } VhostShadowVirtqueueOps;
 
 /* Shadow virtqueue to relay notifications */
diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shadow-virtqueue.c
index dffea256f1..4f072f040b 100644
--- a/hw/virtio/vhost-shadow-virtqueue.c
+++ b/hw/virtio/vhost-shadow-virtqueue.c
@@ -746,7 +746,16 @@ void vhost_svq_stop(VhostShadowVirtqueue *svq)
 
     for (unsigned i = 0; i < svq->vring.num; ++i) {
         g_autofree VirtQueueElement *elem = NULL;
-        elem = g_steal_pointer(&svq->ring_id_maps[i].opaque);
+        void *opaque = g_steal_pointer(&svq->ring_id_maps[i].opaque);
+
+        if (!opaque) {
+            continue;
+        } else if (svq->ops) {
+            elem = svq->ops->detach_handler(opaque);
+        } else {
+            elem = opaque;
+        }
+
         if (elem) {
             virtqueue_detach_element(svq->vq, elem, 0);
         }
-- 
2.31.1


