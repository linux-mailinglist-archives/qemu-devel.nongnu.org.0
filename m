Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D804F46BCBD
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Dec 2021 14:38:18 +0100 (CET)
Received: from localhost ([::1]:36004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muafh-0006Tz-W5
	for lists+qemu-devel@lfdr.de; Tue, 07 Dec 2021 08:38:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1muaU1-0002ju-Mx
 for qemu-devel@nongnu.org; Tue, 07 Dec 2021 08:26:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36139)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1muaTy-0006WU-8p
 for qemu-devel@nongnu.org; Tue, 07 Dec 2021 08:26:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638883562;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TIu7p2ZIHoo/ecmt2czm8usZL13K7mxILSf2DegWIyw=;
 b=LYXT0smbu21fZ2h+dHY49HGwTnzRO7jIWV3LkHZxg1KrKqWH9ju71fOAv6Lza43Po4nznY
 mksgNeoNlotSAQw2dZS0ZJ6z+1LiYr/37witxjnxr00057F7Z1sbCTgWu8H4PiQzVbDUhF
 hTNEbkYVk8kPtp837Vw1grXd5/bkvZU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-324-onmQLRMcNkWA3brENvW3Tg-1; Tue, 07 Dec 2021 08:25:59 -0500
X-MC-Unique: onmQLRMcNkWA3brENvW3Tg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 90DC2760C0;
 Tue,  7 Dec 2021 13:25:57 +0000 (UTC)
Received: from localhost (unknown [10.39.194.90])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 289EC5DF4F;
 Tue,  7 Dec 2021 13:25:57 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 6/6] virtio: unify dataplane and non-dataplane
 ->handle_output()
Date: Tue,  7 Dec 2021 13:23:36 +0000
Message-Id: <20211207132336.36627-7-stefanha@redhat.com>
In-Reply-To: <20211207132336.36627-1-stefanha@redhat.com>
References: <20211207132336.36627-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.619,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Stefan Hajnoczi <stefanha@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>, Paul Durrant <paul@xen.org>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Peter Lieven <pl@kamp.de>,
 Stefan Weil <sw@weilnetz.de>, Julia Suvorova <jusual@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>,
 Aarushi Mehta <mehta.aaru20@gmail.com>, Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 "Richard W.M. Jones" <rjones@redhat.com>, Coiby Xu <Coiby.Xu@gmail.com>,
 Hanna Reitz <hreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Now that virtio-blk and virtio-scsi are ready, get rid of
the handle_aio_output() callback. It's no longer needed.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 include/hw/virtio/virtio.h      |  4 +--
 hw/block/dataplane/virtio-blk.c | 16 ++--------
 hw/scsi/virtio-scsi-dataplane.c | 54 ++++-----------------------------
 hw/virtio/virtio.c              | 32 +++++++++----------
 4 files changed, 26 insertions(+), 80 deletions(-)

diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
index b90095628f..f095637058 100644
--- a/include/hw/virtio/virtio.h
+++ b/include/hw/virtio/virtio.h
@@ -316,8 +316,8 @@ bool virtio_device_ioeventfd_enabled(VirtIODevice *vdev);
 EventNotifier *virtio_queue_get_host_notifier(VirtQueue *vq);
 void virtio_queue_set_host_notifier_enabled(VirtQueue *vq, bool enabled);
 void virtio_queue_host_notifier_read(EventNotifier *n);
-void virtio_queue_aio_set_host_notifier_handler(VirtQueue *vq, AioContext *ctx,
-        VirtIOHandleOutput handle_output);
+void virtio_queue_aio_attach_host_notifier(VirtQueue *vq, AioContext *ctx);
+void virtio_queue_aio_detach_host_notifier(VirtQueue *vq, AioContext *ctx);
 VirtQueue *virtio_vector_first_queue(VirtIODevice *vdev, uint16_t vector);
 VirtQueue *virtio_vector_next_queue(VirtQueue *vq);
 
diff --git a/hw/block/dataplane/virtio-blk.c b/hw/block/dataplane/virtio-blk.c
index a2fa407b98..49276e46f2 100644
--- a/hw/block/dataplane/virtio-blk.c
+++ b/hw/block/dataplane/virtio-blk.c
@@ -154,17 +154,6 @@ void virtio_blk_data_plane_destroy(VirtIOBlockDataPlane *s)
     g_free(s);
 }
 
-static void virtio_blk_data_plane_handle_output(VirtIODevice *vdev,
-                                                VirtQueue *vq)
-{
-    VirtIOBlock *s = (VirtIOBlock *)vdev;
-
-    assert(s->dataplane);
-    assert(s->dataplane_started);
-
-    virtio_blk_handle_vq(s, vq);
-}
-
 /* Context: QEMU global mutex held */
 int virtio_blk_data_plane_start(VirtIODevice *vdev)
 {
@@ -258,8 +247,7 @@ int virtio_blk_data_plane_start(VirtIODevice *vdev)
     for (i = 0; i < nvqs; i++) {
         VirtQueue *vq = virtio_get_queue(s->vdev, i);
 
-        virtio_queue_aio_set_host_notifier_handler(vq, s->ctx,
-                virtio_blk_data_plane_handle_output);
+        virtio_queue_aio_attach_host_notifier(vq, s->ctx);
     }
     aio_context_release(s->ctx);
     return 0;
@@ -302,7 +290,7 @@ static void virtio_blk_data_plane_stop_bh(void *opaque)
     for (i = 0; i < s->conf->num_queues; i++) {
         VirtQueue *vq = virtio_get_queue(s->vdev, i);
 
-        virtio_queue_aio_set_host_notifier_handler(vq, s->ctx, NULL);
+        virtio_queue_aio_detach_host_notifier(vq, s->ctx);
     }
 }
 
diff --git a/hw/scsi/virtio-scsi-dataplane.c b/hw/scsi/virtio-scsi-dataplane.c
index 76137de67f..29575cbaf6 100644
--- a/hw/scsi/virtio-scsi-dataplane.c
+++ b/hw/scsi/virtio-scsi-dataplane.c
@@ -49,45 +49,6 @@ void virtio_scsi_dataplane_setup(VirtIOSCSI *s, Error **errp)
     }
 }
 
-static void virtio_scsi_data_plane_handle_cmd(VirtIODevice *vdev,
-                                              VirtQueue *vq)
-{
-    VirtIOSCSI *s = VIRTIO_SCSI(vdev);
-
-    virtio_scsi_acquire(s);
-    if (!s->dataplane_fenced) {
-        assert(s->ctx && s->dataplane_started);
-        virtio_scsi_handle_cmd_vq(s, vq);
-    }
-    virtio_scsi_release(s);
-}
-
-static void virtio_scsi_data_plane_handle_ctrl(VirtIODevice *vdev,
-                                               VirtQueue *vq)
-{
-    VirtIOSCSI *s = VIRTIO_SCSI(vdev);
-
-    virtio_scsi_acquire(s);
-    if (!s->dataplane_fenced) {
-        assert(s->ctx && s->dataplane_started);
-        virtio_scsi_handle_ctrl_vq(s, vq);
-    }
-    virtio_scsi_release(s);
-}
-
-static void virtio_scsi_data_plane_handle_event(VirtIODevice *vdev,
-                                                VirtQueue *vq)
-{
-    VirtIOSCSI *s = VIRTIO_SCSI(vdev);
-
-    virtio_scsi_acquire(s);
-    if (!s->dataplane_fenced) {
-        assert(s->ctx && s->dataplane_started);
-        virtio_scsi_handle_event_vq(s, vq);
-    }
-    virtio_scsi_release(s);
-}
-
 static int virtio_scsi_set_host_notifier(VirtIOSCSI *s, VirtQueue *vq, int n)
 {
     BusState *qbus = BUS(qdev_get_parent_bus(DEVICE(s)));
@@ -112,10 +73,10 @@ static void virtio_scsi_dataplane_stop_bh(void *opaque)
     VirtIOSCSICommon *vs = VIRTIO_SCSI_COMMON(s);
     int i;
 
-    virtio_queue_aio_set_host_notifier_handler(vs->ctrl_vq, s->ctx, NULL);
-    virtio_queue_aio_set_host_notifier_handler(vs->event_vq, s->ctx, NULL);
+    virtio_queue_aio_detach_host_notifier(vs->ctrl_vq, s->ctx);
+    virtio_queue_aio_detach_host_notifier(vs->event_vq, s->ctx);
     for (i = 0; i < vs->conf.num_queues; i++) {
-        virtio_queue_aio_set_host_notifier_handler(vs->cmd_vqs[i], s->ctx, NULL);
+        virtio_queue_aio_detach_host_notifier(vs->cmd_vqs[i], s->ctx);
     }
 }
 
@@ -176,14 +137,11 @@ int virtio_scsi_dataplane_start(VirtIODevice *vdev)
     memory_region_transaction_commit();
 
     aio_context_acquire(s->ctx);
-    virtio_queue_aio_set_host_notifier_handler(vs->ctrl_vq, s->ctx,
-                                            virtio_scsi_data_plane_handle_ctrl);
-    virtio_queue_aio_set_host_notifier_handler(vs->event_vq, s->ctx,
-                                           virtio_scsi_data_plane_handle_event);
+    virtio_queue_aio_attach_host_notifier(vs->ctrl_vq, s->ctx);
+    virtio_queue_aio_attach_host_notifier(vs->event_vq, s->ctx);
 
     for (i = 0; i < vs->conf.num_queues; i++) {
-        virtio_queue_aio_set_host_notifier_handler(vs->cmd_vqs[i], s->ctx,
-                                             virtio_scsi_data_plane_handle_cmd);
+        virtio_queue_aio_attach_host_notifier(vs->cmd_vqs[i], s->ctx);
     }
 
     s->dataplane_starting = false;
diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index a97a406d3c..ce182a4e57 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -3522,23 +3522,23 @@ static void virtio_queue_host_notifier_aio_poll_end(EventNotifier *n)
     virtio_queue_set_notification(vq, 1);
 }
 
-void virtio_queue_aio_set_host_notifier_handler(VirtQueue *vq, AioContext *ctx,
-        VirtIOHandleOutput handle_output)
+void virtio_queue_aio_attach_host_notifier(VirtQueue *vq, AioContext *ctx)
 {
-    if (handle_output) {
-        aio_set_event_notifier(ctx, &vq->host_notifier, true,
-                               virtio_queue_host_notifier_read,
-                               virtio_queue_host_notifier_aio_poll,
-                               virtio_queue_host_notifier_aio_poll_ready);
-        aio_set_event_notifier_poll(ctx, &vq->host_notifier,
-                                    virtio_queue_host_notifier_aio_poll_begin,
-                                    virtio_queue_host_notifier_aio_poll_end);
-    } else {
-        aio_set_event_notifier(ctx, &vq->host_notifier, true, NULL, NULL, NULL);
-        /* Test and clear notifier before after disabling event,
-         * in case poll callback didn't have time to run. */
-        virtio_queue_host_notifier_read(&vq->host_notifier);
-    }
+    aio_set_event_notifier(ctx, &vq->host_notifier, true,
+                           virtio_queue_host_notifier_read,
+                           virtio_queue_host_notifier_aio_poll,
+                           virtio_queue_host_notifier_aio_poll_ready);
+    aio_set_event_notifier_poll(ctx, &vq->host_notifier,
+                                virtio_queue_host_notifier_aio_poll_begin,
+                                virtio_queue_host_notifier_aio_poll_end);
+}
+
+void virtio_queue_aio_detach_host_notifier(VirtQueue *vq, AioContext *ctx)
+{
+    aio_set_event_notifier(ctx, &vq->host_notifier, true, NULL, NULL, NULL);
+    /* Test and clear notifier before after disabling event,
+     * in case poll callback didn't have time to run. */
+    virtio_queue_host_notifier_read(&vq->host_notifier);
 }
 
 void virtio_queue_host_notifier_read(EventNotifier *n)
-- 
2.33.1


