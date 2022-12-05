Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EEC63642E56
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Dec 2022 18:07:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2Etn-0000TM-4b; Mon, 05 Dec 2022 12:04:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1p2Etj-0000SD-7M
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 12:04:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1p2Eth-0002eb-Qw
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 12:04:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670259893;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=COOJJLORpxTJlPJ0nnDaaaQkM6ejKdslCpuafsEQe1c=;
 b=U5l5Mys+re7ryKBUjsyisblM/H3XGIO6acCU5IBNNClkCW7hCqZt1I2eWGawhuWsCNa5+I
 PkZ9Z6zQJ1xMZsMMISHqbk/EFmFFz1HN4rkrgtnW2B8QdZ9WarhdP+eFfKUwLtiTC9vhOe
 U82mCoYd08irXsQc1dG+ZjNOYo3JQ8Y=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-646-976d8h7KNfWMkqYttIvSVw-1; Mon, 05 Dec 2022 12:04:46 -0500
X-MC-Unique: 976d8h7KNfWMkqYttIvSVw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 476538828C4;
 Mon,  5 Dec 2022 17:04:46 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.194.167])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 856B1C2C7D9;
 Mon,  5 Dec 2022 17:04:43 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: Liuxiangdong <liuxiangdong5@huawei.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Gautam Dawar <gdawar@xilinx.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>, Cindy Lu <lulu@redhat.com>,
 Si-Wei Liu <si-wei.liu@oracle.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Eli Cohen <eli@mellanox.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Parav Pandit <parav@mellanox.com>
Subject: [RFC PATCH for 8.0 01/13] vhost: add available descriptor list in SVQ
Date: Mon,  5 Dec 2022 18:04:24 +0100
Message-Id: <20221205170436.2977336-2-eperezma@redhat.com>
In-Reply-To: <20221205170436.2977336-1-eperezma@redhat.com>
References: <20221205170436.2977336-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This helps to track the inflight buffers, make easier to transverse all
of them, and return them in order.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 hw/virtio/vhost-shadow-virtqueue.h | 6 ++++++
 hw/virtio/vhost-shadow-virtqueue.c | 5 +++++
 2 files changed, 11 insertions(+)

diff --git a/hw/virtio/vhost-shadow-virtqueue.h b/hw/virtio/vhost-shadow-virtqueue.h
index d04c34a589..a01a7d4a18 100644
--- a/hw/virtio/vhost-shadow-virtqueue.h
+++ b/hw/virtio/vhost-shadow-virtqueue.h
@@ -23,6 +23,9 @@ typedef struct SVQDescState {
      * guest's
      */
     unsigned int ndescs;
+
+    /* List to save or free inflight descriptors */
+    QTAILQ_ENTRY(SVQDescState) entry;
 } SVQDescState;
 
 typedef struct VhostShadowVirtqueue VhostShadowVirtqueue;
@@ -81,6 +84,9 @@ typedef struct VhostShadowVirtqueue {
     /* SVQ vring descriptors state */
     SVQDescState *desc_state;
 
+    /* Linked list to follow avail descriptors */
+    QTAILQ_HEAD(, SVQDescState) desc_state_avail;
+
     /* Next VirtQueue element that guest made available */
     VirtQueueElement *next_guest_avail_elem;
 
diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shadow-virtqueue.c
index 5bd14cad96..0da72cb0ec 100644
--- a/hw/virtio/vhost-shadow-virtqueue.c
+++ b/hw/virtio/vhost-shadow-virtqueue.c
@@ -265,6 +265,8 @@ int vhost_svq_add(VhostShadowVirtqueue *svq, const struct iovec *out_sg,
 
     svq->desc_state[qemu_head].elem = elem;
     svq->desc_state[qemu_head].ndescs = ndescs;
+    QTAILQ_INSERT_TAIL(&svq->desc_state_avail, &svq->desc_state[qemu_head],
+                       entry);
     vhost_svq_kick(svq);
     return 0;
 }
@@ -451,6 +453,8 @@ static VirtQueueElement *vhost_svq_get_buf(VhostShadowVirtqueue *svq,
     svq->free_head = used_elem.id;
 
     *len = used_elem.len;
+    QTAILQ_REMOVE(&svq->desc_state_avail, &svq->desc_state[used_elem.id],
+                  entry);
     return g_steal_pointer(&svq->desc_state[used_elem.id].elem);
 }
 
@@ -665,6 +669,7 @@ void vhost_svq_start(VhostShadowVirtqueue *svq, VirtIODevice *vdev,
     svq->vring.used = qemu_memalign(qemu_real_host_page_size(), device_size);
     memset(svq->vring.used, 0, device_size);
     svq->desc_state = g_new0(SVQDescState, svq->vring.num);
+    QTAILQ_INIT(&svq->desc_state_avail);
     svq->desc_next = g_new0(uint16_t, svq->vring.num);
     for (unsigned i = 0; i < svq->vring.num - 1; i++) {
         svq->desc_next[i] = cpu_to_le16(i + 1);
-- 
2.31.1


