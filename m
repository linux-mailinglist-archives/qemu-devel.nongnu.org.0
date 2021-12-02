Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F8A44666DA
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Dec 2021 16:39:40 +0100 (CET)
Received: from localhost ([::1]:58318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1msoBP-0002C1-Dg
	for lists+qemu-devel@lfdr.de; Thu, 02 Dec 2021 10:39:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mso8L-0007iN-Hv
 for qemu-devel@nongnu.org; Thu, 02 Dec 2021 10:36:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59881)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mso8J-00024l-SV
 for qemu-devel@nongnu.org; Thu, 02 Dec 2021 10:36:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638459386;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WlTOxFvQ0Tou/htw9qCIl6rN+d5BTtmQf2AISykV2Lk=;
 b=XykS0hYttq5OP+WRH4P+x2wbI8g7D7xN6AFJ1hhvVEjApk1IcynZxEDf32PPRfVYGSv5sy
 0333+Hb84dlINPdI60MNvmm5SCwY8l93xvki7UK8wT2yHJTDt3EvvIZOuWsrqEF5FK7OzT
 KHS3RxwiKpcF9Qr036lv6+AYLzH7HKc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-528-jeYLELmgM4mFvkTo_4946Q-1; Thu, 02 Dec 2021 10:36:23 -0500
X-MC-Unique: jeYLELmgM4mFvkTo_4946Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5F68A1023F51;
 Thu,  2 Dec 2021 15:36:21 +0000 (UTC)
Received: from localhost (unknown [10.39.193.31])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 76D1A4ABA2;
 Thu,  2 Dec 2021 15:35:39 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/6] virtio: get rid of VirtIOHandleAIOOutput
Date: Thu,  2 Dec 2021 15:33:58 +0000
Message-Id: <20211202153402.604951-3-stefanha@redhat.com>
In-Reply-To: <20211202153402.604951-1-stefanha@redhat.com>
References: <20211202153402.604951-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
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
index 252c3a7a23..1b50ccd38b 100644
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
index 0039e1c74c..c042be3935 100644
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
@@ -2300,22 +2300,18 @@ void virtio_queue_set_align(VirtIODevice *vdev, int n, int align)
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
@@ -3552,7 +3548,7 @@ static void virtio_queue_host_notifier_aio_poll_end(EventNotifier *n)
 }
 
 void virtio_queue_aio_set_host_notifier_handler(VirtQueue *vq, AioContext *ctx,
-                                                VirtIOHandleAIOOutput handle_output)
+        VirtIOHandleOutput handle_output)
 {
     if (handle_output) {
         vq->handle_aio_output = handle_output;
-- 
2.33.1


