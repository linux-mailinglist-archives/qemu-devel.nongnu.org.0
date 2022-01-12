Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A289048C94A
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 18:25:33 +0100 (CET)
Received: from localhost ([::1]:39626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7hNM-00085x-OV
	for lists+qemu-devel@lfdr.de; Wed, 12 Jan 2022 12:25:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1n7hJl-00053p-Q3
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 12:21:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:22812)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1n7hJe-0006uO-I3
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 12:21:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642008101;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yjHInqzmPrCv4N46YVTfuK0G8vvJKHp5wvZGRJen2mw=;
 b=O5RCw8wgudihK9RNpHKRmQTONyGxe3mYflo2qSxM7W5c+aagFGCvWWXLQO/4fl48UlkSso
 7iBfBk/LnIGMC2yF3ZzHIKGLrRuF2boLfg3w4ef42ok6+5+wIHW4hpBr8nuwj4ZgIpjGTC
 Pdss8bc1naQQ/fKBUrgB48AUkeCQCBU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-433-VJYu9YkOM2CA6tra9T3WQg-1; Wed, 12 Jan 2022 12:17:35 -0500
X-MC-Unique: VJYu9YkOM2CA6tra9T3WQg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3651883DD2D;
 Wed, 12 Jan 2022 17:16:21 +0000 (UTC)
Received: from localhost (unknown [10.39.195.79])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B2181105C89A;
 Wed, 12 Jan 2022 17:16:20 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 2/6] virtio: get rid of VirtIOHandleAIOOutput
Date: Wed, 12 Jan 2022 17:13:58 +0000
Message-Id: <20220112171402.112183-3-stefanha@redhat.com>
In-Reply-To: <20220112171402.112183-1-stefanha@redhat.com>
References: <20220112171402.112183-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.595,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
 Paul Durrant <paul@xen.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Stefano Stabellini <sstabellini@kernel.org>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, Anthony Perard <anthony.perard@citrix.com>,
 xen-devel@lists.xenproject.org, Stefano Garzarella <sgarzare@redhat.com>,
 Peter Lieven <pl@kamp.de>, Julia Suvorova <jusual@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>,
 Aarushi Mehta <mehta.aaru20@gmail.com>, Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 "Richard W.M. Jones" <rjones@redhat.com>, Coiby Xu <Coiby.Xu@gmail.com>,
 Hanna Reitz <hreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The virtqueue host notifier API
virtio_queue_aio_set_host_notifier_handler() polls the virtqueue for new
buffers. AioContext previously required a bool progress return value
indicating whether an event was handled or not. This is no longer
necessary because the AioContext polling API has been split into a poll
check function and an event handler function. The event handler is only
run when we know there is work to do, so it doesn't return bool.

The VirtIOHandleAIOOutput function signature is now the same as
VirtIOHandleOutput. Get rid of the bool return value.

Further simplifications will be made for virtio-blk and virtio-scsi in
the next patch.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
Message-id: 20211207132336.36627-3-stefanha@redhat.com
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 include/hw/virtio/virtio.h      |  3 +--
 hw/block/dataplane/virtio-blk.c |  4 ++--
 hw/scsi/virtio-scsi-dataplane.c | 18 ++++++------------
 hw/virtio/virtio.c              | 12 ++++--------
 4 files changed, 13 insertions(+), 24 deletions(-)

diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
index 8bab9cfb75..b90095628f 100644
--- a/include/hw/virtio/virtio.h
+++ b/include/hw/virtio/virtio.h
@@ -175,7 +175,6 @@ void virtio_error(VirtIODevice *vdev, const char *fmt, ...) GCC_FMT_ATTR(2, 3);
 void virtio_device_set_child_bus_name(VirtIODevice *vdev, char *bus_name);
 
 typedef void (*VirtIOHandleOutput)(VirtIODevice *, VirtQueue *);
-typedef bool (*VirtIOHandleAIOOutput)(VirtIODevice *, VirtQueue *);
 
 VirtQueue *virtio_add_queue(VirtIODevice *vdev, int queue_size,
                             VirtIOHandleOutput handle_output);
@@ -318,7 +317,7 @@ EventNotifier *virtio_queue_get_host_notifier(VirtQueue *vq);
 void virtio_queue_set_host_notifier_enabled(VirtQueue *vq, bool enabled);
 void virtio_queue_host_notifier_read(EventNotifier *n);
 void virtio_queue_aio_set_host_notifier_handler(VirtQueue *vq, AioContext *ctx,
-                                                VirtIOHandleAIOOutput handle_output);
+        VirtIOHandleOutput handle_output);
 VirtQueue *virtio_vector_first_queue(VirtIODevice *vdev, uint16_t vector);
 VirtQueue *virtio_vector_next_queue(VirtQueue *vq);
 
diff --git a/hw/block/dataplane/virtio-blk.c b/hw/block/dataplane/virtio-blk.c
index ee5a5352dc..a2fa407b98 100644
--- a/hw/block/dataplane/virtio-blk.c
+++ b/hw/block/dataplane/virtio-blk.c
@@ -154,7 +154,7 @@ void virtio_blk_data_plane_destroy(VirtIOBlockDataPlane *s)
     g_free(s);
 }
 
-static bool virtio_blk_data_plane_handle_output(VirtIODevice *vdev,
+static void virtio_blk_data_plane_handle_output(VirtIODevice *vdev,
                                                 VirtQueue *vq)
 {
     VirtIOBlock *s = (VirtIOBlock *)vdev;
@@ -162,7 +162,7 @@ static bool virtio_blk_data_plane_handle_output(VirtIODevice *vdev,
     assert(s->dataplane);
     assert(s->dataplane_started);
 
-    return virtio_blk_handle_vq(s, vq);
+    virtio_blk_handle_vq(s, vq);
 }
 
 /* Context: QEMU global mutex held */
diff --git a/hw/scsi/virtio-scsi-dataplane.c b/hw/scsi/virtio-scsi-dataplane.c
index 18eb824c97..76137de67f 100644
--- a/hw/scsi/virtio-scsi-dataplane.c
+++ b/hw/scsi/virtio-scsi-dataplane.c
@@ -49,49 +49,43 @@ void virtio_scsi_dataplane_setup(VirtIOSCSI *s, Error **errp)
     }
 }
 
-static bool virtio_scsi_data_plane_handle_cmd(VirtIODevice *vdev,
+static void virtio_scsi_data_plane_handle_cmd(VirtIODevice *vdev,
                                               VirtQueue *vq)
 {
-    bool progress = false;
     VirtIOSCSI *s = VIRTIO_SCSI(vdev);
 
     virtio_scsi_acquire(s);
     if (!s->dataplane_fenced) {
         assert(s->ctx && s->dataplane_started);
-        progress = virtio_scsi_handle_cmd_vq(s, vq);
+        virtio_scsi_handle_cmd_vq(s, vq);
     }
     virtio_scsi_release(s);
-    return progress;
 }
 
-static bool virtio_scsi_data_plane_handle_ctrl(VirtIODevice *vdev,
+static void virtio_scsi_data_plane_handle_ctrl(VirtIODevice *vdev,
                                                VirtQueue *vq)
 {
-    bool progress = false;
     VirtIOSCSI *s = VIRTIO_SCSI(vdev);
 
     virtio_scsi_acquire(s);
     if (!s->dataplane_fenced) {
         assert(s->ctx && s->dataplane_started);
-        progress = virtio_scsi_handle_ctrl_vq(s, vq);
+        virtio_scsi_handle_ctrl_vq(s, vq);
     }
     virtio_scsi_release(s);
-    return progress;
 }
 
-static bool virtio_scsi_data_plane_handle_event(VirtIODevice *vdev,
+static void virtio_scsi_data_plane_handle_event(VirtIODevice *vdev,
                                                 VirtQueue *vq)
 {
-    bool progress = false;
     VirtIOSCSI *s = VIRTIO_SCSI(vdev);
 
     virtio_scsi_acquire(s);
     if (!s->dataplane_fenced) {
         assert(s->ctx && s->dataplane_started);
-        progress = virtio_scsi_handle_event_vq(s, vq);
+        virtio_scsi_handle_event_vq(s, vq);
     }
     virtio_scsi_release(s);
-    return progress;
 }
 
 static int virtio_scsi_set_host_notifier(VirtIOSCSI *s, VirtQueue *vq, int n)
diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index 5db7f69237..323f549aad 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -125,7 +125,7 @@ struct VirtQueue
 
     uint16_t vector;
     VirtIOHandleOutput handle_output;
-    VirtIOHandleAIOOutput handle_aio_output;
+    VirtIOHandleOutput handle_aio_output;
     VirtIODevice *vdev;
     EventNotifier guest_notifier;
     EventNotifier host_notifier;
@@ -2303,22 +2303,18 @@ void virtio_queue_set_align(VirtIODevice *vdev, int n, int align)
     }
 }
 
-static bool virtio_queue_notify_aio_vq(VirtQueue *vq)
+static void virtio_queue_notify_aio_vq(VirtQueue *vq)
 {
-    bool ret = false;
-
     if (vq->vring.desc && vq->handle_aio_output) {
         VirtIODevice *vdev = vq->vdev;
 
         trace_virtio_queue_notify(vdev, vq - vdev->vq, vq);
-        ret = vq->handle_aio_output(vdev, vq);
+        vq->handle_aio_output(vdev, vq);
 
         if (unlikely(vdev->start_on_kick)) {
             virtio_set_started(vdev, true);
         }
     }
-
-    return ret;
 }
 
 static void virtio_queue_notify_vq(VirtQueue *vq)
@@ -3555,7 +3551,7 @@ static void virtio_queue_host_notifier_aio_poll_end(EventNotifier *n)
 }
 
 void virtio_queue_aio_set_host_notifier_handler(VirtQueue *vq, AioContext *ctx,
-                                                VirtIOHandleAIOOutput handle_output)
+        VirtIOHandleOutput handle_output)
 {
     if (handle_output) {
         vq->handle_aio_output = handle_output;
-- 
2.34.1


