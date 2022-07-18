Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77141577FBD
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 12:33:57 +0200 (CEST)
Received: from localhost ([::1]:57624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDO4a-0005nq-Lj
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 06:33:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oDO0u-0000Be-85
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 06:30:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45287)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oDO0r-0001Az-Ji
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 06:30:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658140204;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6L+zkqyrOy7sN7BmI3DCR8EYimimD4zP/iapI/JldHg=;
 b=QEtJ8TA/n4XzHZ55rSJ4ZUz8LnpJUZonk5mfiGquXOPAnOJjNBc7qmfgELciawUN2V7cfj
 ofhMo2a6ygFul/5L1wTqk02zPRxL+W38l3BPhxEh3rRMxrY516Nb+7Bw3DKsx8xAIizV7P
 DxFNC0/lat5PpYkWv5MirZ2jM2GcHHA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-6-wqhSAfslMDmZzcIjBFFCBg-1; Mon, 18 Jul 2022 06:30:00 -0400
X-MC-Unique: wqhSAfslMDmZzcIjBFFCBg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1157885A584;
 Mon, 18 Jul 2022 10:30:00 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.192.86])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 04BF92166B26;
 Mon, 18 Jul 2022 10:29:56 +0000 (UTC)
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
Subject: [PATCH v4 01/19] vhost: move descriptor translation to
 vhost_svq_vring_write_descs
Date: Mon, 18 Jul 2022 12:29:31 +0200
Message-Id: <20220718102949.2868267-2-eperezma@redhat.com>
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


