Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EAB560E88B
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Oct 2022 21:08:37 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onldU-0008Pm-1S; Wed, 26 Oct 2022 15:00:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1onldR-0008GJ-7U
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 15:00:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1onldL-0007Js-QP
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 15:00:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666810811;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1eAq8WcQkaWtYSqcxfipXrovUirpLRAVGFOqjt2/yEM=;
 b=LH5qmnux654E31ZzsOKYNZvs6E87AB8g34Dokeo8N/rSno6yvOjeEagxuQZ0ig8wZJoLBS
 8drEp2abzAgoUK0PeA8BxCJfw6jPc5lOtxJynTLoXBzmkjh35tYz8q2RLHDJB1wfSZlM7s
 7tOTQbKE4lRbvfVeLIxpskZcMCLJD9Q=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-416-n7rygso7MbifpjtPWSTVbg-1; Wed, 26 Oct 2022 15:00:05 -0400
X-MC-Unique: n7rygso7MbifpjtPWSTVbg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 85B53185A7A8;
 Wed, 26 Oct 2022 19:00:03 +0000 (UTC)
Received: from localhost (unknown [10.39.192.42])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DA197C15BAB;
 Wed, 26 Oct 2022 19:00:02 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Wen Congyang <wencongyang2@huawei.com>, Thomas Huth <thuth@redhat.com>,
 integration@gluster.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Kevin Wolf <kwolf@redhat.com>, Eric Blake <eblake@redhat.com>,
 qemu-block@nongnu.org, Peter Xu <peterx@redhat.com>,
 "Richard W.M. Jones" <rjones@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, Yanan Wang <wangyanan55@huawei.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Markus Armbruster <armbru@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Fam Zheng <fam@euphon.net>, Xie Changlong <xiechanglong.d@gmail.com>,
 Jeff Cody <codyprime@gmail.com>, John Snow <jsnow@redhat.com>,
 "Denis V. Lunev" <den@openvz.org>, Stefano Garzarella <sgarzare@redhat.com>
Subject: [PULL 13/13] virtio-blk: use BDRV_REQ_REGISTERED_BUF optimization hint
Date: Wed, 26 Oct 2022 14:58:46 -0400
Message-Id: <20221026185846.120544-14-stefanha@redhat.com>
In-Reply-To: <20221026185846.120544-1-stefanha@redhat.com>
References: <20221026185846.120544-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Register guest RAM using BlockRAMRegistrar and set the
BDRV_REQ_REGISTERED_BUF flag so block drivers can optimize memory
accesses in I/O requests.

This is for vdpa-blk, vhost-user-blk, and other I/O interfaces that rely
on DMA mapping/unmapping.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
Message-id: 20221013185908.1297568-14-stefanha@redhat.com
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 include/hw/virtio/virtio-blk.h |  2 ++
 hw/block/virtio-blk.c          | 39 ++++++++++++++++++++++------------
 2 files changed, 27 insertions(+), 14 deletions(-)

diff --git a/include/hw/virtio/virtio-blk.h b/include/hw/virtio/virtio-blk.h
index d311c57cca..7f589b4146 100644
--- a/include/hw/virtio/virtio-blk.h
+++ b/include/hw/virtio/virtio-blk.h
@@ -19,6 +19,7 @@
 #include "hw/block/block.h"
 #include "sysemu/iothread.h"
 #include "sysemu/block-backend.h"
+#include "sysemu/block-ram-registrar.h"
 #include "qom/object.h"
 
 #define TYPE_VIRTIO_BLK "virtio-blk-device"
@@ -64,6 +65,7 @@ struct VirtIOBlock {
     struct VirtIOBlockDataPlane *dataplane;
     uint64_t host_features;
     size_t config_size;
+    BlockRAMRegistrar blk_ram_registrar;
 };
 
 typedef struct VirtIOBlockReq {
diff --git a/hw/block/virtio-blk.c b/hw/block/virtio-blk.c
index 8131ec2dbc..f717550fdc 100644
--- a/hw/block/virtio-blk.c
+++ b/hw/block/virtio-blk.c
@@ -21,6 +21,7 @@
 #include "hw/block/block.h"
 #include "hw/qdev-properties.h"
 #include "sysemu/blockdev.h"
+#include "sysemu/block-ram-registrar.h"
 #include "sysemu/sysemu.h"
 #include "sysemu/runstate.h"
 #include "hw/virtio/virtio-blk.h"
@@ -362,12 +363,14 @@ static void virtio_blk_handle_scsi(VirtIOBlockReq *req)
     }
 }
 
-static inline void submit_requests(BlockBackend *blk, MultiReqBuffer *mrb,
+static inline void submit_requests(VirtIOBlock *s, MultiReqBuffer *mrb,
                                    int start, int num_reqs, int niov)
 {
+    BlockBackend *blk = s->blk;
     QEMUIOVector *qiov = &mrb->reqs[start]->qiov;
     int64_t sector_num = mrb->reqs[start]->sector_num;
     bool is_write = mrb->is_write;
+    BdrvRequestFlags flags = 0;
 
     if (num_reqs > 1) {
         int i;
@@ -398,12 +401,18 @@ static inline void submit_requests(BlockBackend *blk, MultiReqBuffer *mrb,
                               num_reqs - 1);
     }
 
+    if (blk_ram_registrar_ok(&s->blk_ram_registrar)) {
+        flags |= BDRV_REQ_REGISTERED_BUF;
+    }
+
     if (is_write) {
-        blk_aio_pwritev(blk, sector_num << BDRV_SECTOR_BITS, qiov, 0,
-                        virtio_blk_rw_complete, mrb->reqs[start]);
+        blk_aio_pwritev(blk, sector_num << BDRV_SECTOR_BITS, qiov,
+                        flags, virtio_blk_rw_complete,
+                        mrb->reqs[start]);
     } else {
-        blk_aio_preadv(blk, sector_num << BDRV_SECTOR_BITS, qiov, 0,
-                       virtio_blk_rw_complete, mrb->reqs[start]);
+        blk_aio_preadv(blk, sector_num << BDRV_SECTOR_BITS, qiov,
+                       flags, virtio_blk_rw_complete,
+                       mrb->reqs[start]);
     }
 }
 
@@ -425,14 +434,14 @@ static int multireq_compare(const void *a, const void *b)
     }
 }
 
-static void virtio_blk_submit_multireq(BlockBackend *blk, MultiReqBuffer *mrb)
+static void virtio_blk_submit_multireq(VirtIOBlock *s, MultiReqBuffer *mrb)
 {
     int i = 0, start = 0, num_reqs = 0, niov = 0, nb_sectors = 0;
     uint32_t max_transfer;
     int64_t sector_num = 0;
 
     if (mrb->num_reqs == 1) {
-        submit_requests(blk, mrb, 0, 1, -1);
+        submit_requests(s, mrb, 0, 1, -1);
         mrb->num_reqs = 0;
         return;
     }
@@ -452,11 +461,11 @@ static void virtio_blk_submit_multireq(BlockBackend *blk, MultiReqBuffer *mrb)
              * 3. merge would exceed maximum transfer length of backend device
              */
             if (sector_num + nb_sectors != req->sector_num ||
-                niov > blk_get_max_iov(blk) - req->qiov.niov ||
+                niov > blk_get_max_iov(s->blk) - req->qiov.niov ||
                 req->qiov.size > max_transfer ||
                 nb_sectors > (max_transfer -
                               req->qiov.size) / BDRV_SECTOR_SIZE) {
-                submit_requests(blk, mrb, start, num_reqs, niov);
+                submit_requests(s, mrb, start, num_reqs, niov);
                 num_reqs = 0;
             }
         }
@@ -472,7 +481,7 @@ static void virtio_blk_submit_multireq(BlockBackend *blk, MultiReqBuffer *mrb)
         num_reqs++;
     }
 
-    submit_requests(blk, mrb, start, num_reqs, niov);
+    submit_requests(s, mrb, start, num_reqs, niov);
     mrb->num_reqs = 0;
 }
 
@@ -487,7 +496,7 @@ static void virtio_blk_handle_flush(VirtIOBlockReq *req, MultiReqBuffer *mrb)
      * Make sure all outstanding writes are posted to the backing device.
      */
     if (mrb->is_write && mrb->num_reqs > 0) {
-        virtio_blk_submit_multireq(s->blk, mrb);
+        virtio_blk_submit_multireq(s, mrb);
     }
     blk_aio_flush(s->blk, virtio_blk_flush_complete, req);
 }
@@ -667,7 +676,7 @@ static int virtio_blk_handle_request(VirtIOBlockReq *req, MultiReqBuffer *mrb)
         if (mrb->num_reqs > 0 && (mrb->num_reqs == VIRTIO_BLK_MAX_MERGE_REQS ||
                                   is_write != mrb->is_write ||
                                   !s->conf.request_merging)) {
-            virtio_blk_submit_multireq(s->blk, mrb);
+            virtio_blk_submit_multireq(s, mrb);
         }
 
         assert(mrb->num_reqs < VIRTIO_BLK_MAX_MERGE_REQS);
@@ -774,7 +783,7 @@ void virtio_blk_handle_vq(VirtIOBlock *s, VirtQueue *vq)
     } while (!virtio_queue_empty(vq));
 
     if (mrb.num_reqs) {
-        virtio_blk_submit_multireq(s->blk, &mrb);
+        virtio_blk_submit_multireq(s, &mrb);
     }
 
     blk_io_unplug(s->blk);
@@ -823,7 +832,7 @@ void virtio_blk_process_queued_requests(VirtIOBlock *s, bool is_bh)
     }
 
     if (mrb.num_reqs) {
-        virtio_blk_submit_multireq(s->blk, &mrb);
+        virtio_blk_submit_multireq(s, &mrb);
     }
     if (is_bh) {
         blk_dec_in_flight(s->conf.conf.blk);
@@ -1205,6 +1214,7 @@ static void virtio_blk_device_realize(DeviceState *dev, Error **errp)
     }
 
     s->change = qemu_add_vm_change_state_handler(virtio_blk_dma_restart_cb, s);
+    blk_ram_registrar_init(&s->blk_ram_registrar, s->blk);
     blk_set_dev_ops(s->blk, &virtio_block_ops, s);
 
     blk_iostatus_enable(s->blk);
@@ -1230,6 +1240,7 @@ static void virtio_blk_device_unrealize(DeviceState *dev)
         virtio_del_queue(vdev, i);
     }
     qemu_coroutine_dec_pool_size(conf->num_queues * conf->queue_size / 2);
+    blk_ram_registrar_destroy(&s->blk_ram_registrar);
     qemu_del_vm_change_state_handler(s->change);
     blockdev_mark_auto_del(s->blk);
     virtio_cleanup(vdev);
-- 
2.37.3


