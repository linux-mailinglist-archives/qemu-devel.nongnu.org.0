Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6012B6728AF
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Jan 2023 20:48:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIEPU-0002ep-SP; Wed, 18 Jan 2023 14:47:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pIEPT-0002eG-3I
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 14:47:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pIEPR-0000ov-HY
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 14:47:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674071265;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=K6bqAuqOMKjHHYbIvIDoBonaoMQyPqF/T5JIdhlQRQ0=;
 b=KOOGp4SAiY2E9ClMpJ6wXzkVPcvhKQzWl82qmocacDaItODY7rHzbcmlmsEePCALShwidC
 mIvPnMfGlbiPds2Q3w9JKlNpqj6L3elzjDLmNuxAaiR9EpSyMTggEnpSSb2w1JBX9Qc7ow
 biAR0bA0IuQ4vdkoh6AY2Ubr9nbhDWs=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-240-lWTLAecRNOaYvz01pz48hQ-1; Wed, 18 Jan 2023 14:47:41 -0500
X-MC-Unique: lWTLAecRNOaYvz01pz48hQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 71F5F1C0513C;
 Wed, 18 Jan 2023 19:47:41 +0000 (UTC)
Received: from localhost (unknown [10.39.192.19])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EA33A40C6EC4;
 Wed, 18 Jan 2023 19:47:40 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: <qemu-devel@nongnu.org>
Cc: Kevin Wolf <kwolf@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org,
 Eric Blake <eblake@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Michal Privoznik <mprivozn@redhat.com>
Subject: [RFC 3/3] virtio-blk: add iothread-vq-mapping parameter
Date: Wed, 18 Jan 2023 14:47:32 -0500
Message-Id: <20230118194732.1258208-4-stefanha@redhat.com>
In-Reply-To: <20230118194732.1258208-1-stefanha@redhat.com>
References: <20230118194732.1258208-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Add the iothread-vq-mapping parameter to assign virtqueues to IOThreads.

Note that this commit simply adds the
VirtIOBlock->iothread_vq_mapping_list field but does not use it yet. The
block layer doesn't support multi-queue yet, so we cannot safely process
virtqueues from multiple IOThreads at this time.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 include/hw/virtio/virtio-blk.h |  2 +
 hw/block/virtio-blk.c          | 78 ++++++++++++++++++++++++++++++++++
 2 files changed, 80 insertions(+)

diff --git a/include/hw/virtio/virtio-blk.h b/include/hw/virtio/virtio-blk.h
index 7f589b4146..7324f4468f 100644
--- a/include/hw/virtio/virtio-blk.h
+++ b/include/hw/virtio/virtio-blk.h
@@ -21,6 +21,7 @@
 #include "sysemu/block-backend.h"
 #include "sysemu/block-ram-registrar.h"
 #include "qom/object.h"
+#include "qapi/qapi-types-virtio.h"
 
 #define TYPE_VIRTIO_BLK "virtio-blk-device"
 OBJECT_DECLARE_SIMPLE_TYPE(VirtIOBlock, VIRTIO_BLK)
@@ -37,6 +38,7 @@ struct VirtIOBlkConf
 {
     BlockConf conf;
     IOThread *iothread;
+    IOThreadVirtQueueMappingList *iothread_vq_mapping_list;
     char *serial;
     uint32_t request_merging;
     uint16_t num_queues;
diff --git a/hw/block/virtio-blk.c b/hw/block/virtio-blk.c
index f717550fdc..ed53dc3686 100644
--- a/hw/block/virtio-blk.c
+++ b/hw/block/virtio-blk.c
@@ -1098,6 +1098,68 @@ static int virtio_blk_load_device(VirtIODevice *vdev, QEMUFile *f,
     return 0;
 }
 
+static bool
+validate_iothread_vq_mapping_list(IOThreadVirtQueueMappingList *list,
+        uint16_t num_queues, Error **errp)
+{
+    g_autofree unsigned long *vqs = bitmap_new(num_queues);
+    g_autoptr(GHashTable) iothreads =
+        g_hash_table_new(g_str_hash, g_str_equal);
+
+    for (IOThreadVirtQueueMappingList *node = list; node; node = node->next) {
+        const char *name = node->value->iothread;
+        uint16List *vq;
+
+        if (!iothread_by_id(name)) {
+            error_setg(errp, "IOThread \"%s\" object does not exist", name);
+            return false;
+        }
+
+        if (!g_hash_table_add(iothreads, (gpointer)name)) {
+            error_setg(errp,
+                    "duplicate IOThread name \"%s\" in iothread-vq-mapping",
+                    name);
+            return false;
+        }
+
+        if (node != list) {
+            if (!!node->value->vqs != !!list->value->vqs) {
+                error_setg(errp, "either all items in iothread-vq-mapping "
+                                 "must have vqs or none of them must have it");
+                return false;
+            }
+        }
+
+        for (vq = node->value->vqs; vq; vq = vq->next) {
+            if (vq->value >= num_queues) {
+                error_setg(errp, "vq index %u for IOThread \"%s\" must be "
+                        "less than num_queues %u in iothread-vq-mapping",
+                        vq->value, name, num_queues);
+                return false;
+            }
+
+            if (test_and_set_bit(vq->value, vqs)) {
+                error_setg(errp, "cannot assign vq %u to IOThread \"%s\" "
+                        "because it is already assigned", vq->value, name);
+                return false;
+            }
+        }
+    }
+
+    if (list->value->vqs) {
+        for (uint16_t i = 0; i < num_queues; i++) {
+            if (!test_bit(i, vqs)) {
+                error_setg(errp,
+                        "missing vq %u IOThread assignment in iothread-vq-mapping",
+                        i);
+                return false;
+            }
+        }
+    }
+
+    return true;
+}
+
 static void virtio_resize_cb(void *opaque)
 {
     VirtIODevice *vdev = opaque;
@@ -1191,6 +1253,19 @@ static void virtio_blk_device_realize(DeviceState *dev, Error **errp)
         return;
     }
 
+    if (s->conf.iothread_vq_mapping_list) {
+        if (s->conf.iothread) {
+            error_setg(errp, "iothread and iothread-vq-mapping properties "
+                             "cannot be set at the same time");
+            return;
+        }
+
+        if (!validate_iothread_vq_mapping_list(s->conf.iothread_vq_mapping_list,
+                                               s->conf.num_queues, errp)) {
+            return;
+        }
+    }
+
     s->config_size = virtio_get_config_size(&virtio_blk_cfg_size_params,
                                             s->host_features);
     virtio_init(vdev, VIRTIO_ID_BLOCK, s->config_size);
@@ -1203,6 +1278,7 @@ static void virtio_blk_device_realize(DeviceState *dev, Error **errp)
         virtio_add_queue(vdev, conf->queue_size, virtio_blk_handle_output);
     }
     qemu_coroutine_inc_pool_size(conf->num_queues * conf->queue_size / 2);
+    /* TODO use iothread_vq_mapping_list */
     virtio_blk_data_plane_create(vdev, conf, &s->dataplane, &err);
     if (err != NULL) {
         error_propagate(errp, err);
@@ -1284,6 +1360,8 @@ static Property virtio_blk_properties[] = {
     DEFINE_PROP_BOOL("seg-max-adjust", VirtIOBlock, conf.seg_max_adjust, true),
     DEFINE_PROP_LINK("iothread", VirtIOBlock, conf.iothread, TYPE_IOTHREAD,
                      IOThread *),
+    DEFINE_PROP_IOTHREAD_VQ_MAPPING_LIST("iothread-vq-mapping", VirtIOBlock,
+                                         conf.iothread_vq_mapping_list),
     DEFINE_PROP_BIT64("discard", VirtIOBlock, host_features,
                       VIRTIO_BLK_F_DISCARD, true),
     DEFINE_PROP_BOOL("report-discard-granularity", VirtIOBlock,
-- 
2.39.0


