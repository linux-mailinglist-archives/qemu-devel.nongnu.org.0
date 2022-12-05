Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D4F6642E60
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Dec 2022 18:09:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2Eur-0000Vg-7s; Mon, 05 Dec 2022 12:06:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1p2Etw-0000VE-Nx
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 12:05:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1p2Etv-0002qn-7x
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 12:05:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670259906;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4kPovz/7WAZ3ZL6rq70rmWA7JywhPmZS0LtaB3TU55g=;
 b=IvPKTMHLwepAVh+jNY8U9YhhA6ZXJyMYpUwyvorFLCFUz3rvxUAYVz0xqYSiQDJIxvCuhn
 6e0cdEfzWKPqSQhfx0C5pFf+FTpj8zh+pWy0A0a76I94xiLkQc0Wy5Bk9U8JcJdZLR+GHY
 GvDcB0mXsV8knkf4V0T84zHp/E7MqrI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-519-jE-hW_RZNOmD9WvzUR02Cg-1; Mon, 05 Dec 2022 12:05:05 -0500
X-MC-Unique: jE-hW_RZNOmD9WvzUR02Cg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8C67F101AA45;
 Mon,  5 Dec 2022 17:05:04 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.194.167])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C81CCC15BA8;
 Mon,  5 Dec 2022 17:05:01 +0000 (UTC)
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
Subject: [RFC PATCH for 8.0 07/13] virtio: refactor qemu_put_virtqueue_element
Date: Mon,  5 Dec 2022 18:04:30 +0100
Message-Id: <20221205170436.2977336-8-eperezma@redhat.com>
In-Reply-To: <20221205170436.2977336-1-eperezma@redhat.com>
References: <20221205170436.2977336-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eperezma@redhat.com;
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

The core of the function is useful to transform from VirtQueueElement
to VirtQueueElementOld. Extract these from qemu_put_virtqueue_element,
and leave there the handling of QEMUFile.

No functional change intended.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 hw/virtio/virtio.c | 45 ++++++++++++++++++++++++++-------------------
 1 file changed, 26 insertions(+), 19 deletions(-)

diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index b0245ce4e8..bc3b474065 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -2360,36 +2360,43 @@ void *qemu_get_virtqueue_element(VirtIODevice *vdev, QEMUFile *f, size_t sz)
     return elem;
 }
 
-void qemu_put_virtqueue_element(VirtIODevice *vdev, QEMUFile *f,
-                                VirtQueueElement *elem)
+/* Convert VirtQueueElement to VirtQueueElementOld */
+static void qemu_put_virtqueue_element_old(const VirtQueueElement *elem,
+                                           VirtQueueElementOld *data)
 {
-    VirtQueueElementOld data;
-    int i;
+    memset(data, 0, sizeof(*data));
+    data->index = elem->index;
+    data->in_num = elem->in_num;
+    data->out_num = elem->out_num;
 
-    memset(&data, 0, sizeof(data));
-    data.index = elem->index;
-    data.in_num = elem->in_num;
-    data.out_num = elem->out_num;
-
-    for (i = 0; i < elem->in_num; i++) {
-        data.in_addr[i] = elem->in_addr[i];
+    for (int i = 0; i < elem->in_num; i++) {
+        data->in_addr[i] = elem->in_addr[i];
     }
 
-    for (i = 0; i < elem->out_num; i++) {
-        data.out_addr[i] = elem->out_addr[i];
+    for (int i = 0; i < elem->out_num; i++) {
+        data->out_addr[i] = elem->out_addr[i];
     }
 
-    for (i = 0; i < elem->in_num; i++) {
-        /* Base is overwritten by virtqueue_map when loading.  Do not
-         * save it, as it would leak the QEMU address space layout.  */
-        data.in_sg[i].iov_len = elem->in_sg[i].iov_len;
+    for (int i = 0; i < elem->in_num; i++) {
+        /*
+         * Base is overwritten by virtqueue_map when loading.  Do not
+         * save it, as it would leak the QEMU address space layout.
+         */
+        data->in_sg[i].iov_len = elem->in_sg[i].iov_len;
     }
 
-    for (i = 0; i < elem->out_num; i++) {
+    for (int i = 0; i < elem->out_num; i++) {
         /* Do not save iov_base as above.  */
-        data.out_sg[i].iov_len = elem->out_sg[i].iov_len;
+        data->out_sg[i].iov_len = elem->out_sg[i].iov_len;
     }
+}
+
+void qemu_put_virtqueue_element(VirtIODevice *vdev, QEMUFile *f,
+                                VirtQueueElement *elem)
+{
+    VirtQueueElementOld data;
 
+    qemu_put_virtqueue_element_old(elem, &data);
     if (virtio_host_has_feature(vdev, VIRTIO_F_RING_PACKED)) {
         qemu_put_be32s(f, &elem->ndescs);
     }
-- 
2.31.1


