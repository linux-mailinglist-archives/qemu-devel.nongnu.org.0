Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDB9F642E67
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Dec 2022 18:11:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2Eus-000111-LG; Mon, 05 Dec 2022 12:06:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1p2EuI-0000fY-0z
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 12:05:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1p2Eu8-0002s4-Q8
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 12:05:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670259918;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VCRp2XXSW3VVFVdJ/+N00VV0aDnfLIiZQIhbteXdvY4=;
 b=T9XQDtJjG1pLGkf0B5Y2bLUqr+oVjsHB6yJBw+hZXKSZqmbGFF/797oOV7lvwOR4KkLrTd
 hUrHKpR7FXZDBMJNZeO7M/qQ4Q8qk4arAGNJEVHDReRHb2BY9jMR+vGjc85Fr73OcDazye
 Uc6wYU8RxIz0oFj3q1Zt3wRfDQxbyMs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-541-VK-D7F7TN8ad9Z93IzL6Lw-1; Mon, 05 Dec 2022 12:05:15 -0500
X-MC-Unique: VK-D7F7TN8ad9Z93IzL6Lw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8255985A588;
 Mon,  5 Dec 2022 17:05:14 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.194.167])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F2039C15BA8;
 Mon,  5 Dec 2022 17:05:10 +0000 (UTC)
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
Subject: [RFC PATCH for 8.0 10/13] virtio-net: Migrate vhost inflight
 descriptors
Date: Mon,  5 Dec 2022 18:04:33 +0100
Message-Id: <20221205170436.2977336-11-eperezma@redhat.com>
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

There is currently no data to be migrated, since nothing populates or
read the fields on virtio-net.

The migration of in-flight descriptors is modelled after the migration
of requests in virtio-blk. With some differences:
* virtio-blk migrates queue number on each request. Here we only add a
  vq if it has descriptors to migrate, and then we make all descriptors
  in an array.
* Use of QTAILQ since it works similar to signal the end of the inflight
  descriptors: 1 for more data, 0 if end. But do it for each vq instead
  of for each descriptor.
* Usage of VMState macros.

The fields of descriptors would be way more complicated if we use the
VirtQueueElements directly, since there would be a few levels of
indirections. Using VirtQueueElementOld for the moment, and migrate to
VirtQueueElement for the final patch.

TODO: Proper migration versioning
TODO: Do not embed vhost-vdpa structs
TODO: Migrate the VirtQueueElement, not VirtQueueElementOld.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 include/hw/virtio/virtio-net.h |   2 +
 include/migration/vmstate.h    |  11 +++
 hw/net/virtio-net.c            | 129 +++++++++++++++++++++++++++++++++
 3 files changed, 142 insertions(+)

diff --git a/include/hw/virtio/virtio-net.h b/include/hw/virtio/virtio-net.h
index ef234ffe7e..ae7c017ef0 100644
--- a/include/hw/virtio/virtio-net.h
+++ b/include/hw/virtio/virtio-net.h
@@ -151,9 +151,11 @@ typedef struct VirtIONetQueue {
     QEMUTimer *tx_timer;
     QEMUBH *tx_bh;
     uint32_t tx_waiting;
+    uint32_t tx_inflight_num, rx_inflight_num;
     struct {
         VirtQueueElement *elem;
     } async_tx;
+    VirtQueueElement **tx_inflight, **rx_inflight;
     struct VirtIONet *n;
 } VirtIONetQueue;
 
diff --git a/include/migration/vmstate.h b/include/migration/vmstate.h
index 9726d2d09e..9e0dfef9ee 100644
--- a/include/migration/vmstate.h
+++ b/include/migration/vmstate.h
@@ -626,6 +626,17 @@ extern const VMStateInfo vmstate_info_qlist;
     .offset     = vmstate_offset_varray(_state, _field, _type),      \
 }
 
+#define VMSTATE_STRUCT_VARRAY_ALLOC_UINT16(_field, _state, _field_num,        \
+                                           _version, _vmsd, _type) {          \
+    .name       = (stringify(_field)),                                        \
+    .version_id = (_version),                                                 \
+    .vmsd       = &(_vmsd),                                                   \
+    .num_offset = vmstate_offset_value(_state, _field_num, uint16_t),         \
+    .size       = sizeof(_type),                                              \
+    .flags      = VMS_STRUCT | VMS_VARRAY_UINT16 | VMS_ALLOC | VMS_POINTER,   \
+    .offset     = vmstate_offset_pointer(_state, _field, _type),              \
+}
+
 #define VMSTATE_STRUCT_VARRAY_ALLOC(_field, _state, _field_num, _version, _vmsd, _type) {\
     .name       = (stringify(_field)),                               \
     .version_id = (_version),                                        \
diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index aba12759d5..ffd7bf1fc7 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -3077,6 +3077,13 @@ static bool mac_table_doesnt_fit(void *opaque, int version_id)
     return !mac_table_fits(opaque, version_id);
 }
 
+typedef struct VirtIONetInflightQueue {
+    uint16_t idx;
+    uint16_t num;
+    QTAILQ_ENTRY(VirtIONetInflightQueue) entry;
+    VirtQueueElementOld *elems;
+} VirtIONetInflightQueue;
+
 /* This temporary type is shared by all the WITH_TMP methods
  * although only some fields are used by each.
  */
@@ -3086,6 +3093,7 @@ struct VirtIONetMigTmp {
     uint16_t        curr_queue_pairs_1;
     uint8_t         has_ufo;
     uint32_t        has_vnet_hdr;
+    QTAILQ_HEAD(, VirtIONetInflightQueue) queues_inflight;
 };
 
 /* The 2nd and subsequent tx_waiting flags are loaded later than
@@ -3231,6 +3239,124 @@ static const VMStateDescription vmstate_virtio_net_rss = {
     },
 };
 
+static const VMStateDescription vmstate_virtio_net_inflight_queue = {
+    .name      = "virtio-net-device/inflight/queue",
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT16(idx, VirtIONetInflightQueue),
+        VMSTATE_UINT16(num, VirtIONetInflightQueue),
+
+        VMSTATE_STRUCT_VARRAY_ALLOC_UINT16(elems, VirtIONetInflightQueue, num,
+                                           0, vmstate_virtqueue_element_old,
+                                           VirtQueueElementOld),
+        VMSTATE_END_OF_LIST()
+    },
+};
+
+static int virtio_net_inflight_init(void *opaque)
+{
+    struct VirtIONetMigTmp *tmp = opaque;
+
+    QTAILQ_INIT(&tmp->queues_inflight);
+    return 0;
+}
+
+static int virtio_net_inflight_pre_save(void *opaque)
+{
+    struct VirtIONetMigTmp *tmp = opaque;
+    VirtIONet *net = tmp->parent;
+    uint16_t curr_queue_pairs = net->multiqueue ? net->curr_queue_pairs : 1;
+    VirtIONetInflightQueue *qi = g_new0(VirtIONetInflightQueue,
+                                        curr_queue_pairs * 2);
+
+    virtio_net_inflight_init(opaque);
+    for (uint16_t i = 0; i < curr_queue_pairs * 2; ++i) {
+        VirtIONetQueue *q = &net->vqs[vq2q(i)];
+        size_t n = i % 2 ? q->tx_inflight_num : q->rx_inflight_num;
+        VirtQueueElement **inflight = i % 2 ? q->tx_inflight : q->rx_inflight;
+
+        if (n == 0) {
+            continue;
+        }
+
+        qi[i].idx = i;
+        qi[i].num = n;
+        qi[i].elems = g_new0(VirtQueueElementOld, n);
+        for (uint16_t j = 0; j < n; ++j) {
+            qemu_put_virtqueue_element_old(inflight[j], &qi[i].elems[j]);
+        }
+        QTAILQ_INSERT_TAIL(&tmp->queues_inflight, &qi[i], entry);
+    }
+
+    return 0;
+}
+
+static int virtio_net_inflight_post_save(void *opaque)
+{
+    struct VirtIONetMigTmp *tmp = opaque;
+    VirtIONetInflightQueue *qi;
+
+    while ((qi = QTAILQ_FIRST(&tmp->queues_inflight))) {
+        QTAILQ_REMOVE(&tmp->queues_inflight, qi, entry);
+        g_free(qi->elems);
+        g_free(qi);
+    }
+
+    return 0;
+}
+
+static int virtio_net_inflight_post_load(void *opaque, int version_id)
+{
+    struct VirtIONetMigTmp *tmp = opaque;
+    VirtIONet *net = tmp->parent;
+    uint16_t curr_queue_pairs = net->multiqueue ? net->curr_queue_pairs : 1;
+    VirtIONetInflightQueue *qi;
+
+    while ((qi = QTAILQ_FIRST(&tmp->queues_inflight))) {
+        VirtIONetQueue *q = &net->vqs[vq2q(qi->idx)];
+        uint32_t *n = qi->idx % 2 ? &q->tx_inflight_num : &q->rx_inflight_num;
+        VirtQueueElement ***inflight = qi->idx % 2 ?
+                                       &q->tx_inflight : &q->rx_inflight;
+        if (unlikely(qi->num == 0)) {
+            /* TODO: error message */
+            return -1;
+        }
+
+        if (unlikely(qi->idx > curr_queue_pairs * 2)) {
+            /* TODO: error message */
+            return -1;
+        }
+
+        *n = qi->num;
+        *inflight = g_new(VirtQueueElement *, *n);
+        for (uint16_t j = 0; j < *n; ++j) {
+            (*inflight)[j] = qemu_get_virtqueue_element_from_old(
+                &net->parent_obj, &qi->elems[j],
+                sizeof(VirtQueueElement));
+        }
+
+        QTAILQ_REMOVE(&tmp->queues_inflight, qi, entry);
+        g_free(qi->elems);
+        g_free(qi);
+    }
+
+    return 0;
+}
+
+/* TODO: Allocate a temporal per queue / queue element, not all of them! */
+static const VMStateDescription vmstate_virtio_net_inflight = {
+    .name      = "virtio-net-device/inflight",
+    .pre_save = virtio_net_inflight_pre_save,
+    .post_save = virtio_net_inflight_post_save,
+    .pre_load = virtio_net_inflight_init,
+    .post_load = virtio_net_inflight_post_load,
+    .fields = (VMStateField[]) {
+        VMSTATE_QTAILQ_V(queues_inflight, struct VirtIONetMigTmp, 0,
+                         vmstate_virtio_net_inflight_queue,
+                         VirtIONetInflightQueue, entry),
+        VMSTATE_END_OF_LIST()
+    },
+};
+
 static const VMStateDescription vmstate_virtio_net_device = {
     .name = "virtio-net-device",
     .version_id = VIRTIO_NET_VM_VERSION,
@@ -3279,6 +3405,9 @@ static const VMStateDescription vmstate_virtio_net_device = {
                          vmstate_virtio_net_tx_waiting),
         VMSTATE_UINT64_TEST(curr_guest_offloads, VirtIONet,
                             has_ctrl_guest_offloads),
+        /* TODO: Move to subsection */
+        VMSTATE_WITH_TMP(VirtIONet, struct VirtIONetMigTmp,
+                         vmstate_virtio_net_inflight),
         VMSTATE_END_OF_LIST()
    },
     .subsections = (const VMStateDescription * []) {
-- 
2.31.1


