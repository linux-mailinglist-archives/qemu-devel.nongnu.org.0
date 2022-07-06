Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C881569237
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jul 2022 20:54:45 +0200 (CEST)
Received: from localhost ([::1]:42492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9AAe-0006hW-KE
	for lists+qemu-devel@lfdr.de; Wed, 06 Jul 2022 14:54:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1o99xK-0005O8-Re
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 14:40:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:27591)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1o99xG-0000r4-1T
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 14:40:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657132850;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HqkLuM/R/jquEqE73ZqXF2MmKZ+yHkxnxkzlBIXU8m4=;
 b=jC15l/ruJZgcIt2ITVrAJhTKkMp2CSC0H8RjJB26rDRbu78bEm/Jj/VTqnKTmvlgTMIKB9
 K+ZZjIRoRfHX3lxmnkfEZ8sU8WZSlWhbRoOV513IOKfutsk3Q9HsDE9gTuc7g5MCqNlF/P
 otoCPfS9VWE98Aff3vcnABdgEEjqwqU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-421-H4kA-yW_M7q9BReYLqm87A-1; Wed, 06 Jul 2022 14:40:46 -0400
X-MC-Unique: H4kA-yW_M7q9BReYLqm87A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 72CFE18E5380;
 Wed,  6 Jul 2022 18:40:45 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.192.119])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E10081415116;
 Wed,  6 Jul 2022 18:40:42 +0000 (UTC)
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
Subject: [RFC PATCH v9 11/23] vhost: Move last chain id to SVQ element
Date: Wed,  6 Jul 2022 20:39:56 +0200
Message-Id: <20220706184008.1649478-12-eperezma@redhat.com>
In-Reply-To: <20220706184008.1649478-1-eperezma@redhat.com>
References: <20220706184008.1649478-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
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

We will allow SVQ user to store opaque data for each element, so its
easier if we store this kind of information just at avail.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 hw/virtio/vhost-shadow-virtqueue.h |  3 +++
 hw/virtio/vhost-shadow-virtqueue.c | 14 ++++++++------
 2 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/hw/virtio/vhost-shadow-virtqueue.h b/hw/virtio/vhost-shadow-virtqueue.h
index e434dc63b0..0e434e9fd0 100644
--- a/hw/virtio/vhost-shadow-virtqueue.h
+++ b/hw/virtio/vhost-shadow-virtqueue.h
@@ -17,6 +17,9 @@
 
 typedef struct SVQElement {
     VirtQueueElement *elem;
+
+    /* Last descriptor of the chain */
+    uint32_t last_chain_id;
 } SVQElement;
 
 typedef struct VhostShadowVirtqueue VhostShadowVirtqueue;
diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shadow-virtqueue.c
index cf1745fd4d..c5e49e51c5 100644
--- a/hw/virtio/vhost-shadow-virtqueue.c
+++ b/hw/virtio/vhost-shadow-virtqueue.c
@@ -239,7 +239,9 @@ static bool vhost_svq_add(VhostShadowVirtqueue *svq, const struct iovec *out_sg,
                           size_t out_num, const struct iovec *in_sg,
                           size_t in_num, VirtQueueElement *elem)
 {
+    SVQElement *svq_elem;
     unsigned qemu_head;
+    size_t n;
     bool ok = vhost_svq_add_split(svq, out_sg, out_num, in_sg, in_num,
                                   &qemu_head);
     if (unlikely(!ok)) {
@@ -247,7 +249,10 @@ static bool vhost_svq_add(VhostShadowVirtqueue *svq, const struct iovec *out_sg,
         return false;
     }
 
-    svq->ring_id_maps[qemu_head].elem = elem;
+    n = out_num + in_num;
+    svq_elem = &svq->ring_id_maps[qemu_head];
+    svq_elem->elem = elem;
+    svq_elem->last_chain_id = vhost_svq_last_desc_of_chain(svq, n, qemu_head);
     return true;
 }
 
@@ -400,7 +405,7 @@ static SVQElement vhost_svq_get_buf(VhostShadowVirtqueue *svq, uint32_t *len)
     const vring_used_t *used = svq->vring.used;
     vring_used_elem_t used_elem;
     SVQElement svq_elem = vhost_svq_empty_elem();
-    uint16_t last_used, last_used_chain, num;
+    uint16_t last_used;
 
     if (!vhost_svq_more_used(svq)) {
         return svq_elem;
@@ -428,11 +433,8 @@ static SVQElement vhost_svq_get_buf(VhostShadowVirtqueue *svq, uint32_t *len)
         return svq_elem;
     }
 
-    num = svq_elem.elem->in_num + svq_elem.elem->out_num;
-    last_used_chain = vhost_svq_last_desc_of_chain(svq, num, used_elem.id);
-    svq->desc_next[last_used_chain] = svq->free_head;
+    svq->desc_next[svq_elem.last_chain_id] = svq->free_head;
     svq->free_head = used_elem.id;
-
     *len = used_elem.len;
     return svq_elem;
 }
-- 
2.31.1


