Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3053A642E50
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Dec 2022 18:07:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2EvC-0001IM-Nr; Mon, 05 Dec 2022 12:06:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1p2EuF-0000XC-4O
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 12:05:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1p2Eu4-0002rp-ER
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 12:05:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670259914;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=w4JLQyJZReme83CRbMiFLssDIL5udQrhvg/dKOKdado=;
 b=WYQn83DfFmGT+XRtcuYq3pOu2KTLowT4/MbZoIoARxrs3V82NvGmNfTHkx82JNtSl79s/A
 ORHUEo9wKc1yD+p8T6RgsOFl+CCCgf66y7q7Amn6h7BstZnaw65td496JqaRPffswypzxt
 bRu2keEAKh8UrA4T2/wlXJzUdE75qvY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-292-LnN0iGOYOT-D26yHUFonsg-1; Mon, 05 Dec 2022 12:05:11 -0500
X-MC-Unique: LnN0iGOYOT-D26yHUFonsg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A964B894E80;
 Mon,  5 Dec 2022 17:05:10 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.194.167])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E4126C15BA8;
 Mon,  5 Dec 2022 17:05:07 +0000 (UTC)
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
Subject: [RFC PATCH for 8.0 09/13] virtio: add vmstate_virtqueue_element_old
Date: Mon,  5 Dec 2022 18:04:32 +0100
Message-Id: <20221205170436.2977336-10-eperezma@redhat.com>
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

VMStateDescription of an inflight descriptor represented in
VirtQueueElementOld.

TODO: Convert to VirtQueueElement.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 include/hw/virtio/virtio.h  |  1 +
 include/migration/vmstate.h | 11 +++++++++++
 hw/virtio/virtio.c          | 32 ++++++++++++++++++++++++++++++++
 3 files changed, 44 insertions(+)

diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
index b4c5163fb0..f3485e5748 100644
--- a/include/hw/virtio/virtio.h
+++ b/include/hw/virtio/virtio.h
@@ -105,6 +105,7 @@ void *qemu_get_virtqueue_element_from_old(VirtIODevice *vdev,
                                           size_t sz);
 void qemu_put_virtqueue_element_old(const VirtQueueElement *elem,
                                     VirtQueueElementOld *data);
+extern const VMStateDescription vmstate_virtqueue_element_old;
 
 #define VIRTIO_QUEUE_MAX 1024
 
diff --git a/include/migration/vmstate.h b/include/migration/vmstate.h
index ad24aa1934..9726d2d09e 100644
--- a/include/migration/vmstate.h
+++ b/include/migration/vmstate.h
@@ -448,6 +448,17 @@ extern const VMStateInfo vmstate_info_qlist;
     .offset     = vmstate_offset_varray(_state, _field, _type),      \
 }
 
+#define VMSTATE_VARRAY_UINT32_UNSAFE(_field, _state, _field_num, _version, \
+                                     _info, _type) {\
+    .name       = (stringify(_field)),                               \
+    .version_id = (_version),                                        \
+    .num_offset = vmstate_offset_value(_state, _field_num, uint32_t),\
+    .info       = &(_info),                                          \
+    .size       = sizeof(_type),                                     \
+    .flags      = VMS_VARRAY_UINT32,                                 \
+    .offset     = vmstate_offset_varray(_state, _field, _type),      \
+}
+
 #define VMSTATE_VSTRUCT_TEST(_field, _state, _test, _version, _vmsd, _type, _struct_version) { \
     .name         = (stringify(_field)),                             \
     .version_id   = (_version),                                      \
diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index 5ddc49610c..7936fcfec2 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -3165,6 +3165,38 @@ static bool virtio_disabled_needed(void *opaque)
     return vdev->disabled;
 }
 
+const VMStateDescription vmstate_virtqueue_element_old = {
+    .name = "virtqueue_element",
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT32(index, VirtQueueElementOld),
+        VMSTATE_UINT32(in_num, VirtQueueElementOld),
+        VMSTATE_UINT32(out_num, VirtQueueElementOld),
+        /*
+         * TODO: Needed for packed
+         * VMSTATE_UINT16(ndescs, VirtQueueElement),
+         */
+
+        VMSTATE_VALIDATE("fit", vq_element_in_range),
+        VMSTATE_VARRAY_UINT32_UNSAFE(in_addr, VirtQueueElementOld, in_num, 0,
+                                     vmstate_info_uint64, hwaddr),
+        VMSTATE_VARRAY_UINT32_UNSAFE(out_addr, VirtQueueElementOld, out_num, 0,
+                                     vmstate_info_uint64, hwaddr),
+
+        /*
+         * Assume iovec[n] == uint64_t[n*2]
+         * TODO: Probably need to send each field individually because of
+         * endianess.
+         */
+        VMSTATE_VARRAY_MULTIPLY(in_sg_64, VirtQueueElementOld, in_num,
+                                sizeof(struct iovec) / sizeof(uint64_t),
+                                vmstate_info_uint64, uint64_t),
+        VMSTATE_VARRAY_MULTIPLY(out_sg_64, VirtQueueElementOld, out_num,
+                                sizeof(struct iovec) / sizeof(uint64_t),
+                                vmstate_info_uint64, uint64_t),
+        VMSTATE_END_OF_LIST()
+    },
+};
+
 static const VMStateDescription vmstate_virtqueue = {
     .name = "virtqueue_state",
     .version_id = 1,
-- 
2.31.1


