Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CEED64954A
	for <lists+qemu-devel@lfdr.de>; Sun, 11 Dec 2022 18:23:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4Q1D-0003m7-U0; Sun, 11 Dec 2022 12:21:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1p4Q1A-0003lv-5a
 for qemu-devel@nongnu.org; Sun, 11 Dec 2022 12:21:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1p4Q18-0006um-7L
 for qemu-devel@nongnu.org; Sun, 11 Dec 2022 12:21:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670779293;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8XyevMbFk3pIkWT37nHCwV3xO/V38NH8SVVrwx6HmAk=;
 b=Uo+7KsPIh/EG/KGKmoHOHFO00mBpNoLnAX1ngTC5TZvm9JcSwPUvEFkATixg0HPsj1Styi
 nKj8mIup03lJ85/ezu73tepJhFoHufXRXGySkRylgiICo9AAwzu2sawzD+fCBwjaxN0EyL
 2+ccCrm1KHFf859n+SQ/G01L6ryu0SQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-510-vhtXLgMyNQmR9XPJNiOt3A-1; Sun, 11 Dec 2022 12:21:32 -0500
X-MC-Unique: vhtXLgMyNQmR9XPJNiOt3A-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0E60F85A588
 for <qemu-devel@nongnu.org>; Sun, 11 Dec 2022 17:21:32 +0000 (UTC)
Received: from server.redhat.com (ovpn-12-92.pek2.redhat.com [10.72.12.92])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 17CA9492CA2;
 Sun, 11 Dec 2022 17:21:29 +0000 (UTC)
From: Cindy Lu <lulu@redhat.com>
To: lulu@redhat.com, mst@redhat.com, jasowang@redhat.com, qemu-devel@nongnu.org
Subject: [PATCH v20 06/10] virtio: add support for configure interrupt
Date: Mon, 12 Dec 2022 01:20:38 +0800
Message-Id: <20221211172042.3969410-7-lulu@redhat.com>
In-Reply-To: <20221211172042.3969410-1-lulu@redhat.com>
References: <20221211172042.3969410-1-lulu@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=lulu@redhat.com;
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
index eb6347ab5d..34e9c5d141 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -4012,7 +4012,14 @@ static void virtio_queue_guest_notifier_read(EventNotifier *n)
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
@@ -4029,6 +4036,23 @@ void virtio_queue_set_guest_notifier_fd_handler(VirtQueue *vq, bool assign,
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
@@ -4109,6 +4133,11 @@ EventNotifier *virtio_queue_get_host_notifier(VirtQueue *vq)
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
index 1f4a41b958..9c3a4642f2 100644
--- a/include/hw/virtio/virtio.h
+++ b/include/hw/virtio/virtio.h
@@ -138,6 +138,7 @@ struct VirtIODevice
     AddressSpace *dma_as;
     QLIST_HEAD(, VirtQueue) *vector_queues;
     QTAILQ_ENTRY(VirtIODevice) next;
+    EventNotifier config_notifier;
 };
 
 struct VirtioDeviceClass {
@@ -360,6 +361,9 @@ void virtio_queue_aio_attach_host_notifier_no_poll(VirtQueue *vq, AioContext *ct
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


