Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D822397FB3
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 05:51:23 +0200 (CEST)
Received: from localhost ([::1]:53802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loHuc-0006No-Ie
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 23:51:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1loHrd-0006oG-NN
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 23:48:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45780)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1loHrb-0006Wh-Cw
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 23:48:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622605694;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gEbhTrq27MKRtlxLZ9baoi7NU0Rpki416KuFWz21nS0=;
 b=Y7q1VQm/Xxde8M0viLAyecewkGZszmTtglVNy3q1N9VhOTbT2PTBPj7MO3+2hflVqtt8E8
 DLuLGTZSO/vkeezizpRQpvK6bcIUXmqyikNbJF/XS43rj6tsfvM2Rmp+qGbv36vQc4PAG2
 64KcmUJfReOJUD4vpYJS/afcsQ08TzQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-137-pCSBr9yFONmppyedxV1lew-1; Tue, 01 Jun 2021 23:48:13 -0400
X-MC-Unique: pCSBr9yFONmppyedxV1lew-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 760F2180FD6E
 for <qemu-devel@nongnu.org>; Wed,  2 Jun 2021 03:48:12 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-13-199.pek2.redhat.com [10.72.13.199])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EB2895D6D5;
 Wed,  2 Jun 2021 03:48:04 +0000 (UTC)
From: Cindy Lu <lulu@redhat.com>
To: lulu@redhat.com, mst@redhat.com, jasowang@redhat.com, qemu-devel@nongnu.org
Subject: [PATCH v7 03/10] virtio: decouple virtqueue from set notifier fd
 handler
Date: Wed,  2 Jun 2021 11:47:43 +0800
Message-Id: <20210602034750.23377-4-lulu@redhat.com>
In-Reply-To: <20210602034750.23377-1-lulu@redhat.com>
References: <20210602034750.23377-1-lulu@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lulu@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=lulu@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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

To support config interrupt.we need to decouple virtqueue number
from virtio_queue_set_guest_notifier_fd_handler,

Signed-off-by: Cindy Lu <lulu@redhat.com>
---
 hw/s390x/virtio-ccw.c      |  6 +++---
 hw/virtio/virtio-mmio.c    |  4 ++--
 hw/virtio/virtio-pci.c     |  4 ++--
 hw/virtio/virtio.c         | 17 +++++++++++------
 include/hw/virtio/virtio.h |  2 +-
 5 files changed, 19 insertions(+), 14 deletions(-)

diff --git a/hw/s390x/virtio-ccw.c b/hw/s390x/virtio-ccw.c
index 8195f3546e..58bb5232fd 100644
--- a/hw/s390x/virtio-ccw.c
+++ b/hw/s390x/virtio-ccw.c
@@ -1028,11 +1028,11 @@ static int virtio_ccw_set_guest_notifier(VirtioCcwDevice *dev, int n,
         if (r < 0) {
             return r;
         }
-        virtio_queue_set_guest_notifier_fd_handler(vq, true, with_irqfd);
+        virtio_set_notifier_fd_handler(vdev, n, true, with_irqfd);
         if (with_irqfd) {
             r = virtio_ccw_add_irqfd(dev, n);
             if (r) {
-                virtio_queue_set_guest_notifier_fd_handler(vq, false,
+                virtio_set_notifier_fd_handler(vdev, n, false,
                                                            with_irqfd);
                 return r;
             }
@@ -1056,7 +1056,7 @@ static int virtio_ccw_set_guest_notifier(VirtioCcwDevice *dev, int n,
         if (with_irqfd) {
             virtio_ccw_remove_irqfd(dev, n);
         }
-        virtio_queue_set_guest_notifier_fd_handler(vq, false, with_irqfd);
+        virtio_set_notifier_fd_handler(vdev, n, false, with_irqfd);
         event_notifier_cleanup(notifier);
     }
     return 0;
diff --git a/hw/virtio/virtio-mmio.c b/hw/virtio/virtio-mmio.c
index 342c918ea7..13772d52bb 100644
--- a/hw/virtio/virtio-mmio.c
+++ b/hw/virtio/virtio-mmio.c
@@ -658,9 +658,9 @@ static int virtio_mmio_set_guest_notifier(DeviceState *d, int n, bool assign,
         if (r < 0) {
             return r;
         }
-        virtio_queue_set_guest_notifier_fd_handler(vq, true, with_irqfd);
+        virtio_set_notifier_fd_handler(vdev, n, true, with_irqfd);
     } else {
-        virtio_queue_set_guest_notifier_fd_handler(vq, false, with_irqfd);
+        virtio_set_notifier_fd_handler(vdev, n, false, with_irqfd);
         event_notifier_cleanup(notifier);
     }
 
diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
index c5c080ec94..6a4ef413a4 100644
--- a/hw/virtio/virtio-pci.c
+++ b/hw/virtio/virtio-pci.c
@@ -958,9 +958,9 @@ static int virtio_pci_set_guest_notifier(DeviceState *d, int n, bool assign,
         if (r < 0) {
             return r;
         }
-        virtio_queue_set_guest_notifier_fd_handler(vq, true, with_irqfd);
+        virtio_set_notifier_fd_handler(vdev, n, true, with_irqfd);
     } else {
-        virtio_queue_set_guest_notifier_fd_handler(vq, false, with_irqfd);
+        virtio_set_notifier_fd_handler(vdev, n, false, with_irqfd);
         event_notifier_cleanup(notifier);
     }
 
diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index 07f4e60b30..c5d786bb5e 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -3505,19 +3505,24 @@ static void virtio_queue_guest_notifier_read(EventNotifier *n)
     }
 }
 
-void virtio_queue_set_guest_notifier_fd_handler(VirtQueue *vq, bool assign,
-                                                bool with_irqfd)
+
+void virtio_set_notifier_fd_handler(VirtIODevice *vdev, int queue_no,
+                               bool assign, bool with_irqfd)
 {
+    EventNotifier *e ;
+    EventNotifierHandler *handler;
+    VirtQueue *vq = virtio_get_queue(vdev, queue_no);
+    e = &vq->guest_notifier;
+    handler = virtio_queue_guest_notifier_read;
     if (assign && !with_irqfd) {
-        event_notifier_set_handler(&vq->guest_notifier,
-                                   virtio_queue_guest_notifier_read);
+        event_notifier_set_handler(e, handler);
     } else {
-        event_notifier_set_handler(&vq->guest_notifier, NULL);
+        event_notifier_set_handler(e, NULL);
     }
     if (!assign) {
         /* Test and clear notifier before closing it,
          * in case poll callback didn't have time to run. */
-        virtio_queue_guest_notifier_read(&vq->guest_notifier);
+        handler(e);
     }
 }
 
diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
index 63cb9455ed..447899dea5 100644
--- a/include/hw/virtio/virtio.h
+++ b/include/hw/virtio/virtio.h
@@ -310,7 +310,7 @@ void virtio_queue_update_used_idx(VirtIODevice *vdev, int n);
 VirtQueue *virtio_get_queue(VirtIODevice *vdev, int n);
 uint16_t virtio_get_queue_index(VirtQueue *vq);
 EventNotifier *virtio_queue_get_guest_notifier(VirtQueue *vq);
-void virtio_queue_set_guest_notifier_fd_handler(VirtQueue *vq, bool assign,
+void virtio_set_notifier_fd_handler(VirtIODevice *vdev, int n, bool assign,
                                                 bool with_irqfd);
 int virtio_device_start_ioeventfd(VirtIODevice *vdev);
 int virtio_device_grab_ioeventfd(VirtIODevice *vdev);
-- 
2.21.3


