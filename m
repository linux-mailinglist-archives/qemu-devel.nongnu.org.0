Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F2A356B7D9
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jul 2022 12:58:40 +0200 (CEST)
Received: from localhost ([::1]:54944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9lh1-0004Jn-7o
	for lists+qemu-devel@lfdr.de; Fri, 08 Jul 2022 06:58:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1o9lZQ-0000En-Mx
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 06:50:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42595)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1o9lZP-0007ri-37
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 06:50:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657277446;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KV1+WJSFsLBhLs8UrqwU9UBXFmJpGazq71dWPlO8nsw=;
 b=KwaijFkGoiaQ9E/KYLFVJ+dxqibkFDSX3DLcRXKrwmXVNsa5CnFat87U9Icr9x1VcdXwHn
 3zp8B2puYBIy+g//tVC0W/ttj87JRcR8FkF1eRPWxVEF73to5Gzp4tHG1fKt3qGWGMd7OB
 dTIc/8IH7vNeQoOlVpgl9PptkCz7r9U=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-423-1xoBeLLpNGueh7hyvNJ86A-1; Fri, 08 Jul 2022 06:50:43 -0400
X-MC-Unique: 1xoBeLLpNGueh7hyvNJ86A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CB9F41C05EBD;
 Fri,  8 Jul 2022 10:50:42 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.192.172])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 100841121314;
 Fri,  8 Jul 2022 10:50:39 +0000 (UTC)
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
Subject: [PATCH 08/22] vhost: Move last chain id to SVQ element
Date: Fri,  8 Jul 2022 12:49:59 +0200
Message-Id: <20220708105013.1899854-9-eperezma@redhat.com>
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

We will allow SVQ user to store opaque data for each element, so its
easier if we store this kind of information just at avail.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 hw/virtio/vhost-shadow-virtqueue.h |  3 +++
 hw/virtio/vhost-shadow-virtqueue.c | 14 ++++++++------
 2 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/hw/virtio/vhost-shadow-virtqueue.h b/hw/virtio/vhost-shadow-virtqueue.h
index 0b34f48037..5646d875cb 100644
--- a/hw/virtio/vhost-shadow-virtqueue.h
+++ b/hw/virtio/vhost-shadow-virtqueue.h
@@ -17,6 +17,9 @@
 
 typedef struct SVQElement {
     VirtQueueElement *elem;
+
+    /* Last descriptor of the chain */
+    uint32_t last_chain_id;
 } SVQElement;
 
 /* Shadow virtqueue to relay notifications */
diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shadow-virtqueue.c
index d50e1383f5..635b6b359f 100644
--- a/hw/virtio/vhost-shadow-virtqueue.c
+++ b/hw/virtio/vhost-shadow-virtqueue.c
@@ -238,7 +238,9 @@ static bool vhost_svq_add(VhostShadowVirtqueue *svq, const struct iovec *out_sg,
                           size_t out_num, const struct iovec *in_sg,
                           size_t in_num, VirtQueueElement *elem)
 {
+    SVQElement *svq_elem;
     unsigned qemu_head;
+    size_t n;
     bool ok = vhost_svq_add_split(svq, out_sg, out_num, in_sg, in_num,
                                   &qemu_head);
     if (unlikely(!ok)) {
@@ -246,7 +248,10 @@ static bool vhost_svq_add(VhostShadowVirtqueue *svq, const struct iovec *out_sg,
         return false;
     }
 
-    svq->ring_id_maps[qemu_head].elem = elem;
+    n = out_num + in_num;
+    svq_elem = &svq->ring_id_maps[qemu_head];
+    svq_elem->elem = elem;
+    svq_elem->last_chain_id = vhost_svq_last_desc_of_chain(svq, n, qemu_head);
     return true;
 }
 
@@ -399,7 +404,7 @@ static SVQElement vhost_svq_get_buf(VhostShadowVirtqueue *svq, uint32_t *len)
     const vring_used_t *used = svq->vring.used;
     vring_used_elem_t used_elem;
     SVQElement svq_elem = vhost_svq_empty_elem();
-    uint16_t last_used, last_used_chain, num;
+    uint16_t last_used;
 
     if (!vhost_svq_more_used(svq)) {
         return svq_elem;
@@ -427,11 +432,8 @@ static SVQElement vhost_svq_get_buf(VhostShadowVirtqueue *svq, uint32_t *len)
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


