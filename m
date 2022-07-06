Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF196569250
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jul 2022 21:04:16 +0200 (CEST)
Received: from localhost ([::1]:60206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9AJr-0002oW-S5
	for lists+qemu-devel@lfdr.de; Wed, 06 Jul 2022 15:04:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1o99xl-0005b3-R8
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 14:41:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23295)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1o99xV-0000t7-Hk
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 14:41:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657132867;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BOWX5PpHO+1vMPlU7JIBQ/clbCyfjrR6m5We3NFT290=;
 b=d/bqMvcm9GP5EkxsEKHoXVrDzmzG99QXb5IhgleY5oihRUL9TmSWop8xv0BntHaYLLPgp2
 Xp4wCc+Sa1Ktq0S/rSi1EQZtrd+soi+7/fSp2lRrKCu9OooR/6i2pGI2EvFRYms9tPB/61
 r2lfkQDdYAFl1pFPWkgG/x17a7P/SL8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-656-mZZRp-KMP82IDnmZsvFH0w-1; Wed, 06 Jul 2022 14:40:57 -0400
X-MC-Unique: mZZRp-KMP82IDnmZsvFH0w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A6A6C811E81;
 Wed,  6 Jul 2022 18:40:56 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.192.119])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 24E511415116;
 Wed,  6 Jul 2022 18:40:54 +0000 (UTC)
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
Subject: [RFC PATCH v9 15/23] vhost: Add custom used buffer callback
Date: Wed,  6 Jul 2022 20:40:00 +0200
Message-Id: <20220706184008.1649478-16-eperezma@redhat.com>
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

The callback allows SVQ users to know the VirtQueue requests and
responses. QEMU can use this to synchronize virtio device model state,
allowing to migrate it with minimum changes to the migration code.

If callbacks are specified at svq creation, the buffers need to be
injected to the device using vhost_svq_inject. An opaque data must be
given with it, and its returned to the callback at used_handler call.

In the case of networking, this will be used to inspect control
virtqueue messages and to recover status injection at the first time.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 hw/virtio/vhost-shadow-virtqueue.h |  5 +++++
 hw/virtio/vhost-shadow-virtqueue.c | 16 +++++++++++-----
 2 files changed, 16 insertions(+), 5 deletions(-)

diff --git a/hw/virtio/vhost-shadow-virtqueue.h b/hw/virtio/vhost-shadow-virtqueue.h
index c8668fbdd6..296fef6f21 100644
--- a/hw/virtio/vhost-shadow-virtqueue.h
+++ b/hw/virtio/vhost-shadow-virtqueue.h
@@ -27,8 +27,13 @@ typedef struct VhostShadowVirtqueue VhostShadowVirtqueue;
 typedef int (*ShadowVirtQueueStart)(VhostShadowVirtqueue *svq,
                                     void *opaque);
 
+typedef void (*VirtQueueUsedCallback)(VhostShadowVirtqueue *svq,
+                                      void *used_elem_opaque,
+                                      uint32_t written);
+
 typedef struct VhostShadowVirtqueueOps {
     ShadowVirtQueueStart start;
+    VirtQueueUsedCallback used_handler;
 } VhostShadowVirtqueueOps;
 
 /* Shadow virtqueue to relay notifications */
diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shadow-virtqueue.c
index ed7f1d0bc9..b92ca4a63f 100644
--- a/hw/virtio/vhost-shadow-virtqueue.c
+++ b/hw/virtio/vhost-shadow-virtqueue.c
@@ -506,7 +506,6 @@ static size_t vhost_svq_flush(VhostShadowVirtqueue *svq,
         while (true) {
             uint32_t len;
             SVQElement svq_elem;
-            g_autofree VirtQueueElement *elem = NULL;
 
             if (unlikely(i >= svq->vring.num)) {
                 qemu_log_mask(LOG_GUEST_ERROR,
@@ -521,13 +520,20 @@ static size_t vhost_svq_flush(VhostShadowVirtqueue *svq,
                 break;
             }
 
-            elem = g_steal_pointer(&svq_elem.opaque);
-            virtqueue_fill(vq, elem, len, i++);
+            if (svq->ops) {
+                svq->ops->used_handler(svq, svq_elem.opaque, len);
+            } else {
+                g_autofree VirtQueueElement *elem = NULL;
+                elem = g_steal_pointer(&svq_elem.opaque);
+                virtqueue_fill(vq, elem, len, i++);
+            }
             ret++;
         }
 
-        virtqueue_flush(vq, i);
-        event_notifier_set(&svq->svq_call);
+        if (i > 0) {
+            virtqueue_flush(vq, i);
+            event_notifier_set(&svq->svq_call);
+        }
 
         if (check_for_avail_queue && svq->next_guest_avail_elem) {
             /*
-- 
2.31.1


