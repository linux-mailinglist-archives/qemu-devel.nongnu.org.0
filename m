Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A7D257B76D
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jul 2022 15:28:47 +0200 (CEST)
Received: from localhost ([::1]:37990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oE9ks-0005pp-K5
	for lists+qemu-devel@lfdr.de; Wed, 20 Jul 2022 09:28:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1oE9VT-0006Ye-TC
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 09:12:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31138)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1oE9VR-0006tk-9e
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 09:12:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658322768;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=nXZSH4llBhYszCPXN3mWokGoalQ4xjKJs9hNtX154SA=;
 b=fZ4weLVTxBHOg13uu00EwsOHOYNgJ9/f6gUnMnWLG2oPnAERWoZCSyQW52g+wiiD2Nk/Ei
 jxZhf9RKXb9VvEgG3A9eGzm/cobsRkBYxhQT84QASS0lFDGmfZFRUa++BtnehRkKCS3eyl
 jN7PsoXMo/f7iZO+H7xAo77sO2n3vHw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-310-bxHuUAXTPqu2uy-OzpsBQg-1; Wed, 20 Jul 2022 09:12:39 -0400
X-MC-Unique: bxHuUAXTPqu2uy-OzpsBQg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 602238041B5;
 Wed, 20 Jul 2022 13:12:39 +0000 (UTC)
Received: from server.redhat.com (ovpn-13-124.pek2.redhat.com [10.72.13.124])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 84590C2811A;
 Wed, 20 Jul 2022 13:12:35 +0000 (UTC)
From: Cindy Lu <lulu@redhat.com>
To: lulu@redhat.com,
	qemu-devel@nongnu.org
Cc: Jason Wang <jasowang@redhat.com>, virtio-fs@redhat.com,
 Stefan Hajnoczi <stefanha@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH v13 06/10] virtio: add support for configure interrupt
Date: Wed, 20 Jul 2022 21:12:00 +0800
Message-Id: <20220720131204.591104-7-lulu@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=lulu@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Add the functions to support the configure interrupt in virtio
The function virtio_config_guest_notifier_read will notify the
guest if there is an configure interrupt.
The function virtio_config_set_guest_notifier_fd_handler is
to set the fd hander for the notifier

Signed-off-by: Cindy Lu <lulu@redhat.com>
---
 hw/virtio/virtio.c         | 29 +++++++++++++++++++++++++++++
 include/hw/virtio/virtio.h |  4 ++++
 2 files changed, 33 insertions(+)

diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index 9d637e043e..ff1f72b9ff 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -3471,7 +3471,14 @@ static void virtio_queue_guest_notifier_read(EventNotifier *n)
         virtio_irq(vq);
     }
 }
+static void virtio_config_guest_notifier_read(EventNotifier *n)
+{
+    VirtIODevice *vdev = container_of(n, VirtIODevice, config_notifier);
 
+    if (event_notifier_test_and_clear(n)) {
+        virtio_notify_config(vdev);
+    }
+}
 void virtio_queue_set_guest_notifier_fd_handler(VirtQueue *vq, bool assign,
                                                 bool with_irqfd)
 {
@@ -3488,6 +3495,23 @@ void virtio_queue_set_guest_notifier_fd_handler(VirtQueue *vq, bool assign,
     }
 }
 
+void virtio_config_set_guest_notifier_fd_handler(VirtIODevice *vdev,
+                                                 bool assign, bool with_irqfd)
+{
+    EventNotifier *n;
+    n = &vdev->config_notifier;
+    if (assign && !with_irqfd) {
+        event_notifier_set_handler(n, virtio_config_guest_notifier_read);
+    } else {
+        event_notifier_set_handler(n, NULL);
+    }
+    if (!assign) {
+        /* Test and clear notifier before closing it,*/
+        /* in case poll callback didn't have time to run. */
+        virtio_config_guest_notifier_read(n);
+    }
+}
+
 EventNotifier *virtio_queue_get_guest_notifier(VirtQueue *vq)
 {
     return &vq->guest_notifier;
@@ -3555,6 +3579,11 @@ EventNotifier *virtio_queue_get_host_notifier(VirtQueue *vq)
     return &vq->host_notifier;
 }
 
+EventNotifier *virtio_config_get_guest_notifier(VirtIODevice *vdev)
+{
+    return &vdev->config_notifier;
+}
+
 void virtio_queue_set_host_notifier_enabled(VirtQueue *vq, bool enabled)
 {
     vq->host_notifier_enabled = enabled;
diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
index 4512205503..d3087ed5e8 100644
--- a/include/hw/virtio/virtio.h
+++ b/include/hw/virtio/virtio.h
@@ -111,6 +111,7 @@ struct VirtIODevice
     bool use_guest_notifier_mask;
     AddressSpace *dma_as;
     QLIST_HEAD(, VirtQueue) *vector_queues;
+    EventNotifier config_notifier;
 };
 
 struct VirtioDeviceClass {
@@ -323,6 +324,9 @@ void virtio_queue_aio_attach_host_notifier(VirtQueue *vq, AioContext *ctx);
 void virtio_queue_aio_detach_host_notifier(VirtQueue *vq, AioContext *ctx);
 VirtQueue *virtio_vector_first_queue(VirtIODevice *vdev, uint16_t vector);
 VirtQueue *virtio_vector_next_queue(VirtQueue *vq);
+EventNotifier *virtio_config_get_guest_notifier(VirtIODevice *vdev);
+void virtio_config_set_guest_notifier_fd_handler(VirtIODevice *vdev,
+                                                 bool assign, bool with_irqfd);
 
 static inline void virtio_add_feature(uint64_t *features, unsigned int fbit)
 {
-- 
2.34.3


