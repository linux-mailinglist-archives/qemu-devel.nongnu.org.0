Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9C80575305
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jul 2022 18:43:25 +0200 (CEST)
Received: from localhost ([::1]:57246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oC1vx-0000o7-2u
	for lists+qemu-devel@lfdr.de; Thu, 14 Jul 2022 12:43:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oC1lN-0007eU-Mp
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 12:32:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:29763)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oC1lM-0003MJ-23
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 12:32:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657816347;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=73J69Cux+akPnYx7ikpoE0drb0oq16Z9xxlaorXLPYA=;
 b=Xg+q2ZVXNgiElfnbptCNfy0aq1SdEKYZ1e6e20WuQqw1ihuFFO2OZsvcQA3KMXliUmcXW0
 rpPeuTxJYP8hepbtIsJYiMvTQU3+Y4HHGQOEAFNPiz/uSmUsGSq+7ZUIsYcXMVs2Xbmu6o
 qZndVUKHePp+FgwbAvZDt9QmWDc2Wc0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-61-AVzuLWBcPvevXUyjOhiI8g-1; Thu, 14 Jul 2022 12:32:24 -0400
X-MC-Unique: AVzuLWBcPvevXUyjOhiI8g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CCF21185A7B2;
 Thu, 14 Jul 2022 16:32:23 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.192.102])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0451C1121314;
 Thu, 14 Jul 2022 16:32:20 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: Gautam Dawar <gdawar@xilinx.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Eric Blake <eblake@redhat.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Parav Pandit <parav@mellanox.com>, Laurent Vivier <lvivier@redhat.com>,
 Liuxiangdong <liuxiangdong5@huawei.com>, Eli Cohen <eli@mellanox.com>,
 Cindy Lu <lulu@redhat.com>, Harpreet Singh Anand <hanand@xilinx.com>,
 Jason Wang <jasowang@redhat.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>
Subject: [PATCH v2 09/19] vhost: Track number of descs in SVQElement
Date: Thu, 14 Jul 2022 18:31:40 +0200
Message-Id: <20220714163150.2536327-10-eperezma@redhat.com>
In-Reply-To: <20220714163150.2536327-1-eperezma@redhat.com>
References: <20220714163150.2536327-1-eperezma@redhat.com>
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

Since CVQ will be able to modify elements, the number of descriptors in
the guest may not match with the number of descriptors exposed. Track
separately.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 hw/virtio/vhost-shadow-virtqueue.h |  6 ++++++
 hw/virtio/vhost-shadow-virtqueue.c | 10 +++++-----
 2 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/hw/virtio/vhost-shadow-virtqueue.h b/hw/virtio/vhost-shadow-virtqueue.h
index f35d4b8f90..143c86a568 100644
--- a/hw/virtio/vhost-shadow-virtqueue.h
+++ b/hw/virtio/vhost-shadow-virtqueue.h
@@ -17,6 +17,12 @@
 
 typedef struct SVQElement {
     VirtQueueElement elem;
+
+    /*
+     * Number of descriptors exposed to the device. May or may not match
+     * guest's
+     */
+    unsigned int ndescs;
 } SVQElement;
 
 /* Shadow virtqueue to relay notifications */
diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shadow-virtqueue.c
index 442ca3cbd3..3b112c4ec8 100644
--- a/hw/virtio/vhost-shadow-virtqueue.c
+++ b/hw/virtio/vhost-shadow-virtqueue.c
@@ -243,10 +243,10 @@ static int vhost_svq_add(VhostShadowVirtqueue *svq, const struct iovec *out_sg,
                           size_t in_num, SVQElement *svq_elem)
 {
     unsigned qemu_head;
-    unsigned ndescs = in_num + out_num;
+    svq_elem->ndescs = in_num + out_num;
     bool ok;
 
-    if (unlikely(ndescs > vhost_svq_available_slots(svq))) {
+    if (unlikely(svq_elem->ndescs > vhost_svq_available_slots(svq))) {
         return -ENOSPC;
     }
 
@@ -393,7 +393,7 @@ static SVQElement *vhost_svq_get_buf(VhostShadowVirtqueue *svq,
     SVQElement *elem;
     const vring_used_t *used = svq->vring.used;
     vring_used_elem_t used_elem;
-    uint16_t last_used, last_used_chain, num;
+    uint16_t last_used, last_used_chain;
 
     if (!vhost_svq_more_used(svq)) {
         return NULL;
@@ -420,8 +420,8 @@ static SVQElement *vhost_svq_get_buf(VhostShadowVirtqueue *svq,
     }
 
     elem = svq->ring_id_maps[used_elem.id];
-    num = elem->elem.in_num + elem->elem.out_num;
-    last_used_chain = vhost_svq_last_desc_of_chain(svq, num, used_elem.id);
+    last_used_chain = vhost_svq_last_desc_of_chain(svq, elem->ndescs,
+                                                   used_elem.id);
     svq->desc_next[last_used_chain] = svq->free_head;
     svq->free_head = used_elem.id;
 
-- 
2.31.1


