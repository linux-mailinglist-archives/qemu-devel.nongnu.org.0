Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF93051FE07
	for <lists+qemu-devel@lfdr.de>; Mon,  9 May 2022 15:22:46 +0200 (CEST)
Received: from localhost ([::1]:39782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1no3LZ-0003EZ-VH
	for lists+qemu-devel@lfdr.de; Mon, 09 May 2022 09:22:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1no2tV-0006Yr-V9
 for qemu-devel@nongnu.org; Mon, 09 May 2022 08:53:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:52683)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1no2tS-0002tP-NG
 for qemu-devel@nongnu.org; Mon, 09 May 2022 08:53:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652100821;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mNp9vKNk6TLpZIcuWmm8RGsbRIZqMiqNSmsamrjag1w=;
 b=Y9EY7CwcVdHN8BWrBXhJ0Cv0OuFZkUupVjVDeHyTI/QxPJ2XvxiLze15MZ9qczBW1uLvz3
 uycyGKbuu9ZWK3X4D9iEFxenVxBCxl/KArsbX97o7bjI+/IvIiBCnm14uT3BN3/+ZDuN2d
 BDLwKzOABxUVo7zrW3BjRv9P3iWNu7g=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-471-tUYIXxbSNFGRpHLWMI2uog-1; Mon, 09 May 2022 08:53:38 -0400
X-MC-Unique: tUYIXxbSNFGRpHLWMI2uog-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 459DD1C0F684;
 Mon,  9 May 2022 12:53:38 +0000 (UTC)
Received: from localhost (unknown [10.39.195.157])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F196F400DFA0;
 Mon,  9 May 2022 12:53:37 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: <qemu-block@nongnu.org>, Richard Henderson <richard.henderson@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Nir Soffer <nsoffer@redhat.com>
Subject: [PULL 5/9] virtio-scsi: don't waste CPU polling the event virtqueue
Date: Mon,  9 May 2022 13:53:11 +0100
Message-Id: <20220509125315.3746865-6-stefanha@redhat.com>
In-Reply-To: <20220509125315.3746865-1-stefanha@redhat.com>
References: <20220509125315.3746865-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

The virtio-scsi event virtqueue is not emptied by its handler function.
This is typical for rx virtqueues where the device uses buffers when
some event occurs (e.g. a packet is received, an error condition
happens, etc).

Polling non-empty virtqueues wastes CPU cycles. We are not waiting for
new buffers to become available, we are waiting for an event to occur,
so it's a misuse of CPU resources to poll for buffers.

Introduce the new virtio_queue_aio_attach_host_notifier_no_poll() API,
which is identical to virtio_queue_aio_attach_host_notifier() except
that it does not poll the virtqueue.

Before this patch the following command-line consumed 100% CPU in the
IOThread polling and calling virtio_scsi_handle_event():

  $ qemu-system-x86_64 -M accel=kvm -m 1G -cpu host \
      --object iothread,id=iothread0 \
      --device virtio-scsi-pci,iothread=iothread0 \
      --blockdev file,filename=test.img,aio=native,cache.direct=on,node-name=drive0 \
      --device scsi-hd,drive=drive0

After this patch CPU is no longer wasted.

Reported-by: Nir Soffer <nsoffer@redhat.com>
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
Tested-by: Nir Soffer <nsoffer@redhat.com>
Message-id: 20220427143541.119567-3-stefanha@redhat.com
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 include/hw/virtio/virtio.h      |  1 +
 hw/scsi/virtio-scsi-dataplane.c |  2 +-
 hw/virtio/virtio.c              | 13 +++++++++++++
 3 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
index b31c4507f5..b62a35fdca 100644
--- a/include/hw/virtio/virtio.h
+++ b/include/hw/virtio/virtio.h
@@ -317,6 +317,7 @@ EventNotifier *virtio_queue_get_host_notifier(VirtQueue *vq);
 void virtio_queue_set_host_notifier_enabled(VirtQueue *vq, bool enabled);
 void virtio_queue_host_notifier_read(EventNotifier *n);
 void virtio_queue_aio_attach_host_notifier(VirtQueue *vq, AioContext *ctx);
+void virtio_queue_aio_attach_host_notifier_no_poll(VirtQueue *vq, AioContext *ctx);
 void virtio_queue_aio_detach_host_notifier(VirtQueue *vq, AioContext *ctx);
 VirtQueue *virtio_vector_first_queue(VirtIODevice *vdev, uint16_t vector);
 VirtQueue *virtio_vector_next_queue(VirtQueue *vq);
diff --git a/hw/scsi/virtio-scsi-dataplane.c b/hw/scsi/virtio-scsi-dataplane.c
index 29575cbaf6..8bb6e6acfc 100644
--- a/hw/scsi/virtio-scsi-dataplane.c
+++ b/hw/scsi/virtio-scsi-dataplane.c
@@ -138,7 +138,7 @@ int virtio_scsi_dataplane_start(VirtIODevice *vdev)
 
     aio_context_acquire(s->ctx);
     virtio_queue_aio_attach_host_notifier(vs->ctrl_vq, s->ctx);
-    virtio_queue_aio_attach_host_notifier(vs->event_vq, s->ctx);
+    virtio_queue_aio_attach_host_notifier_no_poll(vs->event_vq, s->ctx);
 
     for (i = 0; i < vs->conf.num_queues; i++) {
         virtio_queue_aio_attach_host_notifier(vs->cmd_vqs[i], s->ctx);
diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index 9d637e043e..67a873f54a 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -3534,6 +3534,19 @@ void virtio_queue_aio_attach_host_notifier(VirtQueue *vq, AioContext *ctx)
                                 virtio_queue_host_notifier_aio_poll_end);
 }
 
+/*
+ * Same as virtio_queue_aio_attach_host_notifier() but without polling. Use
+ * this for rx virtqueues and similar cases where the virtqueue handler
+ * function does not pop all elements. When the virtqueue is left non-empty
+ * polling consumes CPU cycles and should not be used.
+ */
+void virtio_queue_aio_attach_host_notifier_no_poll(VirtQueue *vq, AioContext *ctx)
+{
+    aio_set_event_notifier(ctx, &vq->host_notifier, true,
+                           virtio_queue_host_notifier_read,
+                           NULL, NULL);
+}
+
 void virtio_queue_aio_detach_host_notifier(VirtQueue *vq, AioContext *ctx)
 {
     aio_set_event_notifier(ctx, &vq->host_notifier, true, NULL, NULL, NULL);
-- 
2.35.1


