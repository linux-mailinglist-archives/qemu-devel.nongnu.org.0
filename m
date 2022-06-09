Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 433F1545104
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 17:38:45 +0200 (CEST)
Received: from localhost ([::1]:52322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzKF9-0004NN-Af
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 11:38:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nzJI3-0002LP-Gv
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 10:37:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:43477)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nzJI0-00070x-KG
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 10:37:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654785455;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5R4KK89bhYD2TzySriwyzMitKq+bU/ZztTQGOb+LAso=;
 b=eyq2hSby1CP9hy4nPVVE6F2N2ICm6ynxdIFtqqUoqbN2pYsAFlDX01IqkF8tqPwN+0gTQR
 ny1WudfBc/uQo5RjlTCYh879YStmPxoyz+LFeN/RSZS+7jjAnV0iHmAfa3zie2c+VWWYKm
 Q34yA5W1Zc47ynl4ecUkgu4c7fjGWlI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-219-3NgvlHHnMFCjytaFLAd_-A-1; Thu, 09 Jun 2022 10:37:32 -0400
X-MC-Unique: 3NgvlHHnMFCjytaFLAd_-A-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7AF9E294EDDE;
 Thu,  9 Jun 2022 14:37:32 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3BD07492C3B;
 Thu,  9 Jun 2022 14:37:32 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Fam Zheng <fam@euphon.net>, qemu-devel@nongnu.org,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: [PATCH 1/8] virtio_queue_aio_attach_host_notifier: remove AioContext
 lock
Date: Thu,  9 Jun 2022 10:37:20 -0400
Message-Id: <20220609143727.1151816-2-eesposit@redhat.com>
In-Reply-To: <20220609143727.1151816-1-eesposit@redhat.com>
References: <20220609143727.1151816-1-eesposit@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

virtio_queue_aio_attach_host_notifier() and
virtio_queue_aio_attach_host_notifier_nopoll() run always in the
main loop, so there is no need to protect them with AioContext
lock.

On the other side, virtio_queue_aio_detach_host_notifier() runs
in a bh in the iothread context, but it is always scheduled
(thus serialized) by the main loop. Therefore removing the
AioContext lock is safe, but unfortunately we can't do it
right now since bdrv_set_aio_context() and
aio_wait_bh_oneshot() still need to have it.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 hw/block/dataplane/virtio-blk.c | 14 ++++++++++++--
 hw/block/virtio-blk.c           |  2 ++
 hw/scsi/virtio-scsi-dataplane.c | 12 ++++++++++--
 3 files changed, 24 insertions(+), 4 deletions(-)

diff --git a/hw/block/dataplane/virtio-blk.c b/hw/block/dataplane/virtio-blk.c
index 49276e46f2..f9224f23d2 100644
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
@@ -243,13 +245,11 @@ int virtio_blk_data_plane_start(VirtIODevice *vdev)
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
@@ -304,6 +304,8 @@ void virtio_blk_data_plane_stop(VirtIODevice *vdev)
     unsigned i;
     unsigned nvqs = s->conf->num_queues;
 
+    GLOBAL_STATE_CODE();
+
     if (!vblk->dataplane_started || s->stopping) {
         return;
     }
@@ -318,6 +320,14 @@ void virtio_blk_data_plane_stop(VirtIODevice *vdev)
     trace_virtio_blk_data_plane_stop(s);
 
     aio_context_acquire(s->ctx);
+    /*
+     * TODO: virtio_blk_data_plane_stop_bh() does not need the AioContext lock,
+     * because even though virtio_queue_aio_detach_host_notifier() runs in
+     * Iothread context, such calls are serialized by the BQL held (this
+     * function runs in the main loop).
+     * On the other side, virtio_queue_aio_attach_host_notifier* always runs
+     * in the main loop, therefore it doesn't need the AioContext lock.
+     */
     aio_wait_bh_oneshot(s->ctx, virtio_blk_data_plane_stop_bh, s);
 
     /* Drain and try to switch bs back to the QEMU main loop. If other users
diff --git a/hw/block/virtio-blk.c b/hw/block/virtio-blk.c
index e9ba752f6b..8d0590cc76 100644
--- a/hw/block/virtio-blk.c
+++ b/hw/block/virtio-blk.c
@@ -121,6 +121,8 @@ static void virtio_blk_rw_complete(void *opaque, int ret)
     VirtIOBlock *s = next->dev;
     VirtIODevice *vdev = VIRTIO_DEVICE(s);
 
+    IO_CODE();
+
     aio_context_acquire(blk_get_aio_context(s->conf.conf.blk));
     while (next) {
         VirtIOBlockReq *req = next;
diff --git a/hw/scsi/virtio-scsi-dataplane.c b/hw/scsi/virtio-scsi-dataplane.c
index 8bb6e6acfc..7080e9caa9 100644
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
@@ -136,7 +138,6 @@ int virtio_scsi_dataplane_start(VirtIODevice *vdev)
 
     memory_region_transaction_commit();
 
-    aio_context_acquire(s->ctx);
     virtio_queue_aio_attach_host_notifier(vs->ctrl_vq, s->ctx);
     virtio_queue_aio_attach_host_notifier_no_poll(vs->event_vq, s->ctx);
 
@@ -146,7 +147,6 @@ int virtio_scsi_dataplane_start(VirtIODevice *vdev)
 
     s->dataplane_starting = false;
     s->dataplane_started = true;
-    aio_context_release(s->ctx);
     return 0;
 
 fail_host_notifiers:
@@ -193,6 +193,14 @@ void virtio_scsi_dataplane_stop(VirtIODevice *vdev)
     s->dataplane_stopping = true;
 
     aio_context_acquire(s->ctx);
+    /*
+     * TODO: virtio_scsi_dataplane_stop_bh() does not need the AioContext lock,
+     * because even though virtio_queue_aio_detach_host_notifier() runs in
+     * Iothread context, such calls are serialized by the BQL held (this
+     * function runs in the main loop).
+     * On the other side, virtio_queue_aio_attach_host_notifier* always runs
+     * in the main loop, therefore it doesn't need the AioContext lock.
+     */
     aio_wait_bh_oneshot(s->ctx, virtio_scsi_dataplane_stop_bh, s);
     aio_context_release(s->ctx);
 
-- 
2.31.1


