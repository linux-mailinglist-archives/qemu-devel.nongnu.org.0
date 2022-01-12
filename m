Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4653D48C95D
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 18:28:11 +0100 (CET)
Received: from localhost ([::1]:50868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7hPu-00066g-55
	for lists+qemu-devel@lfdr.de; Wed, 12 Jan 2022 12:28:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1n7hFg-0001jl-G7
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 12:17:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:51238)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1n7hFd-0006H3-Dq
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 12:17:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642007853;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aqsXFWsKyZZ5dZYudB6A80tOB2G/EpTCq3EVK0XRkP8=;
 b=TX33KMosoxuNWKFdR4EzehaLuASl6kR2agR/knYlF+9CR5Au+EB6atoLYh3ZibVESswall
 8YsDrv6upx/L/R/AXDDo70NbqPbCfZqKSv7ifAiiPS+jHauoJ9tKgcomsvB+Bi0yfisryX
 ZavpiFYinCCf1dRdiSbu67YPZVJSjb0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-515-EJiA3gwjNV6WDvp4X4azrg-1; Wed, 12 Jan 2022 12:17:29 -0500
X-MC-Unique: EJiA3gwjNV6WDvp4X4azrg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B2ADA101F002;
 Wed, 12 Jan 2022 17:17:25 +0000 (UTC)
Received: from localhost (unknown [10.39.195.79])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4BB6B7FB9E;
 Wed, 12 Jan 2022 17:17:25 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 5/6] virtio: use ->handle_output() instead of
 ->handle_aio_output()
Date: Wed, 12 Jan 2022 17:14:01 +0000
Message-Id: <20220112171402.112183-6-stefanha@redhat.com>
In-Reply-To: <20220112171402.112183-1-stefanha@redhat.com>
References: <20220112171402.112183-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

The difference between ->handle_output() and ->handle_aio_output() was
that ->handle_aio_output() returned a bool return value indicating
progress. This was needed by the old polling API but now that the bool
return value is gone, the two functions can be unified.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
Message-id: 20211207132336.36627-6-stefanha@redhat.com
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 hw/virtio/virtio.c | 33 +++------------------------------
 1 file changed, 3 insertions(+), 30 deletions(-)

diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index 323f549aad..e938e6513b 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -125,7 +125,6 @@ struct VirtQueue
 
     uint16_t vector;
     VirtIOHandleOutput handle_output;
-    VirtIOHandleOutput handle_aio_output;
     VirtIODevice *vdev;
     EventNotifier guest_notifier;
     EventNotifier host_notifier;
@@ -2303,20 +2302,6 @@ void virtio_queue_set_align(VirtIODevice *vdev, int n, int align)
     }
 }
 
-static void virtio_queue_notify_aio_vq(VirtQueue *vq)
-{
-    if (vq->vring.desc && vq->handle_aio_output) {
-        VirtIODevice *vdev = vq->vdev;
-
-        trace_virtio_queue_notify(vdev, vq - vdev->vq, vq);
-        vq->handle_aio_output(vdev, vq);
-
-        if (unlikely(vdev->start_on_kick)) {
-            virtio_set_started(vdev, true);
-        }
-    }
-}
-
 static void virtio_queue_notify_vq(VirtQueue *vq)
 {
     if (vq->vring.desc && vq->handle_output) {
@@ -2395,7 +2380,6 @@ VirtQueue *virtio_add_queue(VirtIODevice *vdev, int queue_size,
     vdev->vq[i].vring.num_default = queue_size;
     vdev->vq[i].vring.align = VIRTIO_PCI_VRING_ALIGN;
     vdev->vq[i].handle_output = handle_output;
-    vdev->vq[i].handle_aio_output = NULL;
     vdev->vq[i].used_elems = g_malloc0(sizeof(VirtQueueElement) *
                                        queue_size);
 
@@ -2407,7 +2391,6 @@ void virtio_delete_queue(VirtQueue *vq)
     vq->vring.num = 0;
     vq->vring.num_default = 0;
     vq->handle_output = NULL;
-    vq->handle_aio_output = NULL;
     g_free(vq->used_elems);
     vq->used_elems = NULL;
     virtio_virtqueue_reset_region_cache(vq);
@@ -3512,14 +3495,6 @@ EventNotifier *virtio_queue_get_guest_notifier(VirtQueue *vq)
     return &vq->guest_notifier;
 }
 
-static void virtio_queue_host_notifier_aio_read(EventNotifier *n)
-{
-    VirtQueue *vq = container_of(n, VirtQueue, host_notifier);
-    if (event_notifier_test_and_clear(n)) {
-        virtio_queue_notify_aio_vq(vq);
-    }
-}
-
 static void virtio_queue_host_notifier_aio_poll_begin(EventNotifier *n)
 {
     VirtQueue *vq = container_of(n, VirtQueue, host_notifier);
@@ -3539,7 +3514,7 @@ static void virtio_queue_host_notifier_aio_poll_ready(EventNotifier *n)
 {
     VirtQueue *vq = container_of(n, VirtQueue, host_notifier);
 
-    virtio_queue_notify_aio_vq(vq);
+    virtio_queue_notify_vq(vq);
 }
 
 static void virtio_queue_host_notifier_aio_poll_end(EventNotifier *n)
@@ -3554,9 +3529,8 @@ void virtio_queue_aio_set_host_notifier_handler(VirtQueue *vq, AioContext *ctx,
         VirtIOHandleOutput handle_output)
 {
     if (handle_output) {
-        vq->handle_aio_output = handle_output;
         aio_set_event_notifier(ctx, &vq->host_notifier, true,
-                               virtio_queue_host_notifier_aio_read,
+                               virtio_queue_host_notifier_read,
                                virtio_queue_host_notifier_aio_poll,
                                virtio_queue_host_notifier_aio_poll_ready);
         aio_set_event_notifier_poll(ctx, &vq->host_notifier,
@@ -3566,8 +3540,7 @@ void virtio_queue_aio_set_host_notifier_handler(VirtQueue *vq, AioContext *ctx,
         aio_set_event_notifier(ctx, &vq->host_notifier, true, NULL, NULL, NULL);
         /* Test and clear notifier before after disabling event,
          * in case poll callback didn't have time to run. */
-        virtio_queue_host_notifier_aio_read(&vq->host_notifier);
-        vq->handle_aio_output = NULL;
+        virtio_queue_host_notifier_read(&vq->host_notifier);
     }
 }
 
-- 
2.34.1


