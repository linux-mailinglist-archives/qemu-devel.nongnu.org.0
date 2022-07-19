Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28849579742
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jul 2022 12:04:44 +0200 (CEST)
Received: from localhost ([::1]:33456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDk5r-0002dM-9D
	for lists+qemu-devel@lfdr.de; Tue, 19 Jul 2022 06:04:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oDjyB-0007wT-RD
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 05:56:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57426)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oDjy9-00053a-5e
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 05:56:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658224604;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6L+zkqyrOy7sN7BmI3DCR8EYimimD4zP/iapI/JldHg=;
 b=Kr/ytjUKO/KZKJQakbzbvUXNDNV/v5iXivXPQVkFy/aw/BnIzRyToqueOZY8tXe5NBa8MG
 4nBwqFD6gtBXSt0g0gCxeZIHAyPv0vFLPsalX4oD76GSOqT+3CsqmPgaNidAiOP+fJiFUg
 zeg5UemunpdAvLUcqi4dncILGjcbFEs=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-640-Y1CFK4piM0qAp7ppZexSfA-1; Tue, 19 Jul 2022 05:56:38 -0400
X-MC-Unique: Y1CFK4piM0qAp7ppZexSfA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0A8943C11720;
 Tue, 19 Jul 2022 09:56:38 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.192.113])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 462CD18EA8;
 Tue, 19 Jul 2022 09:56:35 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: Stefan Hajnoczi <stefanha@redhat.com>, Gautam Dawar <gdawar@xilinx.com>,
 Liuxiangdong <liuxiangdong5@huawei.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Parav Pandit <parav@mellanox.com>, Eric Blake <eblake@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>, Eli Cohen <eli@mellanox.com>,
 Cindy Lu <lulu@redhat.com>, "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>
Subject: [PATCH v5 01/20] vhost: move descriptor translation to
 vhost_svq_vring_write_descs
Date: Tue, 19 Jul 2022 11:56:10 +0200
Message-Id: <20220719095629.3031338-2-eperezma@redhat.com>
In-Reply-To: <20220719095629.3031338-1-eperezma@redhat.com>
References: <20220719095629.3031338-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
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

It's done for both in and out descriptors so it's better placed here.

Acked-by: Jason Wang <jasowang@redhat.com>
Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 hw/virtio/vhost-shadow-virtqueue.c | 38 +++++++++++++++++++++---------
 1 file changed, 27 insertions(+), 11 deletions(-)

diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shadow-virtqueue.c
index 56c96ebd13..e2184a4481 100644
--- a/hw/virtio/vhost-shadow-virtqueue.c
+++ b/hw/virtio/vhost-shadow-virtqueue.c
@@ -122,17 +122,35 @@ static bool vhost_svq_translate_addr(const VhostShadowVirtqueue *svq,
     return true;
 }
 
-static void vhost_vring_write_descs(VhostShadowVirtqueue *svq, hwaddr *sg,
-                                    const struct iovec *iovec, size_t num,
-                                    bool more_descs, bool write)
+/**
+ * Write descriptors to SVQ vring
+ *
+ * @svq: The shadow virtqueue
+ * @sg: Cache for hwaddr
+ * @iovec: The iovec from the guest
+ * @num: iovec length
+ * @more_descs: True if more descriptors come in the chain
+ * @write: True if they are writeable descriptors
+ *
+ * Return true if success, false otherwise and print error.
+ */
+static bool vhost_svq_vring_write_descs(VhostShadowVirtqueue *svq, hwaddr *sg,
+                                        const struct iovec *iovec, size_t num,
+                                        bool more_descs, bool write)
 {
     uint16_t i = svq->free_head, last = svq->free_head;
     unsigned n;
     uint16_t flags = write ? cpu_to_le16(VRING_DESC_F_WRITE) : 0;
     vring_desc_t *descs = svq->vring.desc;
+    bool ok;
 
     if (num == 0) {
-        return;
+        return true;
+    }
+
+    ok = vhost_svq_translate_addr(svq, sg, iovec, num);
+    if (unlikely(!ok)) {
+        return false;
     }
 
     for (n = 0; n < num; n++) {
@@ -150,6 +168,7 @@ static void vhost_vring_write_descs(VhostShadowVirtqueue *svq, hwaddr *sg,
     }
 
     svq->free_head = le16_to_cpu(svq->desc_next[last]);
+    return true;
 }
 
 static bool vhost_svq_add_split(VhostShadowVirtqueue *svq,
@@ -169,21 +188,18 @@ static bool vhost_svq_add_split(VhostShadowVirtqueue *svq,
         return false;
     }
 
-    ok = vhost_svq_translate_addr(svq, sgs, elem->out_sg, elem->out_num);
+    ok = vhost_svq_vring_write_descs(svq, sgs, elem->out_sg, elem->out_num,
+                                     elem->in_num > 0, false);
     if (unlikely(!ok)) {
         return false;
     }
-    vhost_vring_write_descs(svq, sgs, elem->out_sg, elem->out_num,
-                            elem->in_num > 0, false);
-
 
-    ok = vhost_svq_translate_addr(svq, sgs, elem->in_sg, elem->in_num);
+    ok = vhost_svq_vring_write_descs(svq, sgs, elem->in_sg, elem->in_num, false,
+                                     true);
     if (unlikely(!ok)) {
         return false;
     }
 
-    vhost_vring_write_descs(svq, sgs, elem->in_sg, elem->in_num, false, true);
-
     /*
      * Put the entry in the available array (but don't update avail->idx until
      * they do sync).
-- 
2.31.1


