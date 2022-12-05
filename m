Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ECC5642E4F
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Dec 2022 18:07:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2Ev8-0001EC-Gy; Mon, 05 Dec 2022 12:06:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1p2Eu7-0000WI-HC
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 12:05:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1p2Eu1-0002re-4j
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 12:05:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670259912;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rclFwMvR8Pi/gGmSSgN0poZY/0G9+ys0W3dxJlqlY9Y=;
 b=Q4JRh/Ylpkh7Q6dnQ/4ZOMBhrT23PqdDRTwxThSp4+42OzIR2+8WtjyM+fi7kdFupGa3GE
 KiOmiVagncBEuyQcGzOFXVfqAbWPISXv2/2qk4KejRdYs199QfqoiaQorHln5sCbFq068l
 YA8H6flkfjKImf5Ndj1f0M6wdS6syk8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-333-mosG0CbGOGuzNrj44amX1Q-1; Mon, 05 Dec 2022 12:05:08 -0500
X-MC-Unique: mosG0CbGOGuzNrj44amX1Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9C6E2185A794;
 Mon,  5 Dec 2022 17:05:07 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.194.167])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D7065C15BA8;
 Mon,  5 Dec 2022 17:05:04 +0000 (UTC)
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
Subject: [RFC PATCH for 8.0 08/13] virtio: expose VirtQueueElementOld
Date: Mon,  5 Dec 2022 18:04:31 +0100
Message-Id: <20221205170436.2977336-9-eperezma@redhat.com>
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

We will convert between VirtQueueElement and VirtQueueElementOld to
migrate the inflight descriptors, so we need virtio-net to see these.

This will not be exported in the final version, but working with
VirtQueueElementOld is way more easier than with VirtQueueElement and
VMState macros.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 include/hw/virtio/virtio.h | 31 +++++++++++++++++++++++++++++++
 hw/virtio/virtio.c         | 27 +++++----------------------
 2 files changed, 36 insertions(+), 22 deletions(-)

diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
index acfd4df125..b4c5163fb0 100644
--- a/include/hw/virtio/virtio.h
+++ b/include/hw/virtio/virtio.h
@@ -75,6 +75,37 @@ typedef struct VirtQueueElement
     struct iovec *out_sg;
 } VirtQueueElement;
 
+/*
+ * Reading and writing a structure directly to QEMUFile is *awful*, but
+ * it is what QEMU has always done by mistake.  We can change it sooner
+ * or later by bumping the version number of the affected vm states.
+ * In the meanwhile, since the in-memory layout of VirtQueueElement
+ * has changed, we need to marshal to and from the layout that was
+ * used before the change.
+ */
+typedef struct VirtQueueElementOld {
+    uint32_t index;
+    uint32_t out_num;
+    uint32_t in_num;
+    hwaddr in_addr[VIRTQUEUE_MAX_SIZE];
+    hwaddr out_addr[VIRTQUEUE_MAX_SIZE];
+    /* Unions help to serialize the descriptor using VMStateDescription */
+    union {
+        struct iovec in_sg[VIRTQUEUE_MAX_SIZE];
+        uint64_t in_sg_64[VIRTQUEUE_MAX_SIZE * 2];
+    };
+    union {
+        struct iovec out_sg[VIRTQUEUE_MAX_SIZE];
+        uint64_t out_sg_64[VIRTQUEUE_MAX_SIZE * 2];
+    };
+} VirtQueueElementOld;
+
+void *qemu_get_virtqueue_element_from_old(VirtIODevice *vdev,
+                                          const VirtQueueElementOld *data,
+                                          size_t sz);
+void qemu_put_virtqueue_element_old(const VirtQueueElement *elem,
+                                    VirtQueueElementOld *data);
+
 #define VIRTIO_QUEUE_MAX 1024
 
 #define VIRTIO_NO_VECTOR 0xffff
diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index bc3b474065..5ddc49610c 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -2280,27 +2280,10 @@ unsigned int virtqueue_drop_all(VirtQueue *vq)
     }
 }
 
-/* Reading and writing a structure directly to QEMUFile is *awful*, but
- * it is what QEMU has always done by mistake.  We can change it sooner
- * or later by bumping the version number of the affected vm states.
- * In the meanwhile, since the in-memory layout of VirtQueueElement
- * has changed, we need to marshal to and from the layout that was
- * used before the change.
- */
-typedef struct VirtQueueElementOld {
-    uint32_t index;
-    uint32_t out_num;
-    uint32_t in_num;
-    hwaddr in_addr[VIRTQUEUE_MAX_SIZE];
-    hwaddr out_addr[VIRTQUEUE_MAX_SIZE];
-    struct iovec in_sg[VIRTQUEUE_MAX_SIZE];
-    struct iovec out_sg[VIRTQUEUE_MAX_SIZE];
-} VirtQueueElementOld;
-
 /* Convert VirtQueueElementOld to VirtQueueElement */
-static void *qemu_get_virtqueue_element_from_old(VirtIODevice *vdev,
-                                               const VirtQueueElementOld *data,
-                                               size_t sz)
+void *qemu_get_virtqueue_element_from_old(VirtIODevice *vdev,
+                                          const VirtQueueElementOld *data,
+                                          size_t sz)
 {
     VirtQueueElement *elem = virtqueue_alloc_element(sz, data->out_num,
                                                      data->in_num);
@@ -2361,8 +2344,8 @@ void *qemu_get_virtqueue_element(VirtIODevice *vdev, QEMUFile *f, size_t sz)
 }
 
 /* Convert VirtQueueElement to VirtQueueElementOld */
-static void qemu_put_virtqueue_element_old(const VirtQueueElement *elem,
-                                           VirtQueueElementOld *data)
+void qemu_put_virtqueue_element_old(const VirtQueueElement *elem,
+                                    VirtQueueElementOld *data)
 {
     memset(data, 0, sizeof(*data));
     data->index = elem->index;
-- 
2.31.1


