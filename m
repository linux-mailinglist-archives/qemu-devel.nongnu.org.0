Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E66C621E76
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Nov 2022 22:22:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osW0X-0004tr-Hp; Tue, 08 Nov 2022 16:19:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1osW0V-0004sE-AN
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 16:19:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1osW0T-0008IP-Ja
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 16:19:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667942381;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=k4eBnuVum9VAJvuQVEH9UVF7ojeV6W+qMtMhMKWIojY=;
 b=e0/POtNfMIyGmRa+oxuJ9EozVakoOUCJtBk3fLKySUzu5tKwUaPUpWcfp6tEYBG1lryAsP
 d6ofNukkPjVNU4P8pqK2yzvZAvI6nPxGd+M3UNGFreeB+DsxtsCpXUaYSYmsQNPWtH8m/z
 CZm8/WGtxSsu5RP2HFMC4Sddh0j5XZ4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-369-5K2JBReBOQe3V8Bd53EnIA-1; Tue, 08 Nov 2022 16:19:37 -0500
X-MC-Unique: 5K2JBReBOQe3V8Bd53EnIA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E6BCD3817969;
 Tue,  8 Nov 2022 21:19:35 +0000 (UTC)
Received: from localhost (unknown [10.39.192.85])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4B62B2024CC1;
 Tue,  8 Nov 2022 21:19:35 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-block@nongnu.org,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Fam Zheng <fam@euphon.net>,
 Stefan Hajnoczi <stefanha@redhat.com>
Subject: [PATCH 1/8] virtio_queue_aio_attach_host_notifier: remove AioContext
 lock
Date: Tue,  8 Nov 2022 16:19:23 -0500
Message-Id: <20221108211930.876142-2-stefanha@redhat.com>
In-Reply-To: <20221108211930.876142-1-stefanha@redhat.com>
References: <20221108211930.876142-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
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

From: Emanuele Giuseppe Esposito <eesposit@redhat.com>

virtio_queue_aio_attach_host_notifier() and
virtio_queue_aio_attach_host_notifier_nopoll() run always in the
main loop, so there is no need to protect them with AioContext
lock.

On the other side, virtio_queue_aio_detach_host_notifier() runs
in a bh in the iothread context, but it is always scheduled
(thus serialized) by the main loop. Therefore removing the
AioContext lock is safe.

In order to remove the AioContext lock it is necessary to switch
aio_wait_bh_oneshot() to AIO_WAIT_WHILE_UNLOCKED(). virtio-blk and
virtio-scsi are the only users of aio_wait_bh_oneshot() so it is
possible to make this change.

For now bdrv_set_aio_context() still needs the AioContext lock.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
Message-Id: <20220609143727.1151816-2-eesposit@redhat.com>
---
 include/block/aio-wait.h        |  4 ++--
 hw/block/dataplane/virtio-blk.c | 10 ++++++----
 hw/block/virtio-blk.c           |  2 ++
 hw/scsi/virtio-scsi-dataplane.c | 10 ++++------
 util/aio-wait.c                 |  2 +-
 5 files changed, 15 insertions(+), 13 deletions(-)

diff --git a/include/block/aio-wait.h b/include/block/aio-wait.h
index dd9a7f6461..fce6bfee3a 100644
--- a/include/block/aio-wait.h
+++ b/include/block/aio-wait.h
@@ -131,8 +131,8 @@ void aio_wait_kick(void);
  *
  * Run a BH in @ctx and wait for it to complete.
  *
- * Must be called from the main loop thread with @ctx acquired exactly once.
- * Note that main loop event processing may occur.
+ * Must be called from the main loop thread. @ctx must not be acquired by the
+ * caller. Note that main loop event processing may occur.
  */
 void aio_wait_bh_oneshot(AioContext *ctx, QEMUBHFunc *cb, void *opaque);
 
diff --git a/hw/block/dataplane/virtio-blk.c b/hw/block/dataplane/virtio-blk.c
index b28d81737e..975f5ca8c4 100644
--- a/hw/block/dataplane/virtio-blk.c
+++ b/hw/block/dataplane/virtio-blk.c
@@ -167,6 +167,8 @@ int virtio_blk_data_plane_start(VirtIODevice *vdev)
     Error *local_err = NULL;
     int r;
 
+    GLOBAL_STATE_CODE();
+
     if (vblk->dataplane_started || s->starting) {
         return 0;
     }
@@ -245,13 +247,11 @@ int virtio_blk_data_plane_start(VirtIODevice *vdev)
     }
 
     /* Get this show started by hooking up our callbacks */
-    aio_context_acquire(s->ctx);
     for (i = 0; i < nvqs; i++) {
         VirtQueue *vq = virtio_get_queue(s->vdev, i);
 
         virtio_queue_aio_attach_host_notifier(vq, s->ctx);
     }
-    aio_context_release(s->ctx);
     return 0;
 
   fail_aio_context:
@@ -301,6 +301,8 @@ void virtio_blk_data_plane_stop(VirtIODevice *vdev)
     unsigned i;
     unsigned nvqs = s->conf->num_queues;
 
+    GLOBAL_STATE_CODE();
+
     if (!vblk->dataplane_started || s->stopping) {
         return;
     }
@@ -314,9 +316,10 @@ void virtio_blk_data_plane_stop(VirtIODevice *vdev)
     s->stopping = true;
     trace_virtio_blk_data_plane_stop(s);
 
-    aio_context_acquire(s->ctx);
     aio_wait_bh_oneshot(s->ctx, virtio_blk_data_plane_stop_bh, s);
 
+    aio_context_acquire(s->ctx);
+
     /* Wait for virtio_blk_dma_restart_bh() and in flight I/O to complete */
     blk_drain(s->conf->conf.blk);
 
@@ -325,7 +328,6 @@ void virtio_blk_data_plane_stop(VirtIODevice *vdev)
      * BlockBackend in the iothread, that's ok
      */
     blk_set_aio_context(s->conf->conf.blk, qemu_get_aio_context(), NULL);
-
     aio_context_release(s->ctx);
 
     /*
diff --git a/hw/block/virtio-blk.c b/hw/block/virtio-blk.c
index 1762517878..cdc6fd5979 100644
--- a/hw/block/virtio-blk.c
+++ b/hw/block/virtio-blk.c
@@ -100,6 +100,8 @@ static void virtio_blk_rw_complete(void *opaque, int ret)
     VirtIOBlock *s = next->dev;
     VirtIODevice *vdev = VIRTIO_DEVICE(s);
 
+    IO_CODE();
+
     aio_context_acquire(blk_get_aio_context(s->conf.conf.blk));
     while (next) {
         VirtIOBlockReq *req = next;
diff --git a/hw/scsi/virtio-scsi-dataplane.c b/hw/scsi/virtio-scsi-dataplane.c
index 20bb91766e..f6f55d4511 100644
--- a/hw/scsi/virtio-scsi-dataplane.c
+++ b/hw/scsi/virtio-scsi-dataplane.c
@@ -91,6 +91,8 @@ int virtio_scsi_dataplane_start(VirtIODevice *vdev)
     VirtIOSCSICommon *vs = VIRTIO_SCSI_COMMON(vdev);
     VirtIOSCSI *s = VIRTIO_SCSI(vdev);
 
+    GLOBAL_STATE_CODE();
+
     if (s->dataplane_started ||
         s->dataplane_starting ||
         s->dataplane_fenced) {
@@ -138,20 +140,18 @@ int virtio_scsi_dataplane_start(VirtIODevice *vdev)
 
     /*
      * These fields are visible to the IOThread so we rely on implicit barriers
-     * in aio_context_acquire() on the write side and aio_notify_accept() on
-     * the read side.
+     * in virtio_queue_aio_attach_host_notifier() on the write side and
+     * aio_notify_accept() on the read side.
      */
     s->dataplane_starting = false;
     s->dataplane_started = true;
 
-    aio_context_acquire(s->ctx);
     virtio_queue_aio_attach_host_notifier(vs->ctrl_vq, s->ctx);
     virtio_queue_aio_attach_host_notifier_no_poll(vs->event_vq, s->ctx);
 
     for (i = 0; i < vs->conf.num_queues; i++) {
         virtio_queue_aio_attach_host_notifier(vs->cmd_vqs[i], s->ctx);
     }
-    aio_context_release(s->ctx);
     return 0;
 
 fail_host_notifiers:
@@ -197,9 +197,7 @@ void virtio_scsi_dataplane_stop(VirtIODevice *vdev)
     }
     s->dataplane_stopping = true;
 
-    aio_context_acquire(s->ctx);
     aio_wait_bh_oneshot(s->ctx, virtio_scsi_dataplane_stop_bh, s);
-    aio_context_release(s->ctx);
 
     blk_drain_all(); /* ensure there are no in-flight requests */
 
diff --git a/util/aio-wait.c b/util/aio-wait.c
index 98c5accd29..80f26ee520 100644
--- a/util/aio-wait.c
+++ b/util/aio-wait.c
@@ -82,5 +82,5 @@ void aio_wait_bh_oneshot(AioContext *ctx, QEMUBHFunc *cb, void *opaque)
     assert(qemu_get_current_aio_context() == qemu_get_aio_context());
 
     aio_bh_schedule_oneshot(ctx, aio_wait_bh, &data);
-    AIO_WAIT_WHILE(ctx, !data.done);
+    AIO_WAIT_WHILE_UNLOCKED(ctx, !data.done);
 }
-- 
2.38.1


