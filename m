Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D54448A199
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 22:14:03 +0100 (CET)
Received: from localhost ([::1]:50066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n71zO-0008RT-I6
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 16:14:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n71rR-0007wY-LF
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 16:05:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44376)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n71r8-0004a5-UT
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 16:05:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641848704;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=p5yHGm2AE8EBE8vdM8NbrUMTccOP1B1Olh98WNMySZg=;
 b=YfK0K6zXRmRBEWAqNSdorezdawgz8uSrgz2HNRp1KevHaDQNuExyvtUe0OnFJnO9fV5ooX
 SS4cuxtoDXmOvFSMKkhfDSsIM3mDJRiDD+FeI0cQjm0o+Hsp2zNo59fDivrKuWexiSZvI6
 AXs78p3VH0rgkfRjZX127dhcoU14Z7A=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-658-JEQPe9cFMtm7GYMALpWPBw-1; Mon, 10 Jan 2022 16:05:03 -0500
X-MC-Unique: JEQPe9cFMtm7GYMALpWPBw-1
Received: by mail-wm1-f71.google.com with SMTP id
 c188-20020a1c35c5000000b00346a2160ea8so2645328wma.9
 for <qemu-devel@nongnu.org>; Mon, 10 Jan 2022 13:05:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=p5yHGm2AE8EBE8vdM8NbrUMTccOP1B1Olh98WNMySZg=;
 b=SPog3kWh8ggMqJLRCmJg+Od37ymJ24wBHy2VXOBbn0bO/eiaov6qJ4dKEOqGTmy/Av
 +ww1jsrzGnTeD1ZBDURf7Z6S0uf6sOZWG1tq6qUpilWRCD+1aI0LJNNRYpadOwWJlbl5
 bSBjGZDIjEQI1UfWskKnXS6MypmTVJ3FtSk/XHujnGvZwN7Snf45WwXAsUe3ZjnzVZMw
 Qf78wxKsQhEG01u+wc+OjRpD9yXzQpVH25zf9yT+6AgnpAr7YeFMvgNHch0x+erVEgo4
 F/LrXr672+BDh3Nkg8TZ7/RkEI418K/qduDFn1WgL5eOGadcG3Mk1Zl20FNFPkx9Bcvk
 IF8A==
X-Gm-Message-State: AOAM530Nkf0tXjx+tw5Ae0K2v/0QoESRE8hZuB58uhkuO7z7kJn45DU7
 hZYcudbazJBnsJ2yB9a8XKt5sfsLpxujEbdBbILdki8946yQ6GbnMfSJJ1mU6Z1sJ4nHMeBF23r
 CWnszL0994B+94f09itPIftbRjte8Engu8HdX/XaL4w49Rl/33u51KHbuPi1G
X-Received: by 2002:adf:fa85:: with SMTP id h5mr1145094wrr.681.1641848701853; 
 Mon, 10 Jan 2022 13:05:01 -0800 (PST)
X-Google-Smtp-Source: ABdhPJywsGd6pNSbbCCozJ2c8jsr3SUSjfChUVEebO9y7EwpKrwQKCE9ys5qG+upz/u74Wnm1JLbbQ==
X-Received: by 2002:adf:fa85:: with SMTP id h5mr1145076wrr.681.1641848701531; 
 Mon, 10 Jan 2022 13:05:01 -0800 (PST)
Received: from redhat.com ([2.55.19.241])
 by smtp.gmail.com with ESMTPSA id x22sm2360929wmi.13.2022.01.10.13.05.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jan 2022 13:05:01 -0800 (PST)
Date: Mon, 10 Jan 2022 16:04:59 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 05/10] Revert "virtio: add support for configure interrupt"
Message-ID: <20220110210416.18779-6-mst@redhat.com>
References: <20220110210416.18779-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220110210416.18779-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.597,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Cindy Lu <lulu@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This reverts commit 081f864f56307551f59c5e934e3f30a7290d0faa.

Fixes: 081f864f56 ("virtio: add support for configure interrupt")
Cc: "Cindy Lu" <lulu@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/virtio/virtio.h |  4 ----
 hw/virtio/virtio.c         | 29 -----------------------------
 2 files changed, 33 deletions(-)

diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
index d78088d872..605ea79c90 100644
--- a/include/hw/virtio/virtio.h
+++ b/include/hw/virtio/virtio.h
@@ -111,7 +111,6 @@ struct VirtIODevice
     bool use_guest_notifier_mask;
     AddressSpace *dma_as;
     QLIST_HEAD(, VirtQueue) *vector_queues;
-    EventNotifier config_notifier;
 };
 
 struct VirtioDeviceClass {
@@ -314,14 +313,11 @@ uint16_t virtio_get_queue_index(VirtQueue *vq);
 EventNotifier *virtio_queue_get_guest_notifier(VirtQueue *vq);
 void virtio_queue_set_guest_notifier_fd_handler(VirtQueue *vq, bool assign,
                                                 bool with_irqfd);
-void virtio_config_set_guest_notifier_fd_handler(VirtIODevice *vdev,
-                                                 bool assign, bool with_irqfd);
 int virtio_device_start_ioeventfd(VirtIODevice *vdev);
 int virtio_device_grab_ioeventfd(VirtIODevice *vdev);
 void virtio_device_release_ioeventfd(VirtIODevice *vdev);
 bool virtio_device_ioeventfd_enabled(VirtIODevice *vdev);
 EventNotifier *virtio_queue_get_host_notifier(VirtQueue *vq);
-EventNotifier *virtio_config_get_guest_notifier(VirtIODevice *vdev);
 void virtio_queue_set_host_notifier_enabled(VirtQueue *vq, bool enabled);
 void virtio_queue_host_notifier_read(EventNotifier *n);
 void virtio_queue_aio_set_host_notifier_handler(VirtQueue *vq, AioContext *ctx,
diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index 971e59a663..5d18868d7d 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -3494,14 +3494,7 @@ static void virtio_queue_guest_notifier_read(EventNotifier *n)
         virtio_irq(vq);
     }
 }
-static void virtio_config_guest_notifier_read(EventNotifier *n)
-{
-    VirtIODevice *vdev = container_of(n, VirtIODevice, config_notifier);
 
-    if (event_notifier_test_and_clear(n)) {
-        virtio_notify_config(vdev);
-    }
-}
 void virtio_queue_set_guest_notifier_fd_handler(VirtQueue *vq, bool assign,
                                                 bool with_irqfd)
 {
@@ -3518,23 +3511,6 @@ void virtio_queue_set_guest_notifier_fd_handler(VirtQueue *vq, bool assign,
     }
 }
 
-void virtio_config_set_guest_notifier_fd_handler(VirtIODevice *vdev,
-                                                 bool assign, bool with_irqfd)
-{
-    EventNotifier *n;
-    n = &vdev->config_notifier;
-    if (assign && !with_irqfd) {
-        event_notifier_set_handler(n, virtio_config_guest_notifier_read);
-    } else {
-        event_notifier_set_handler(n, NULL);
-    }
-    if (!assign) {
-        /* Test and clear notifier before closing it,*/
-        /* in case poll callback didn't have time to run. */
-        virtio_config_guest_notifier_read(n);
-    }
-}
-
 EventNotifier *virtio_queue_get_guest_notifier(VirtQueue *vq)
 {
     return &vq->guest_notifier;
@@ -3608,11 +3584,6 @@ EventNotifier *virtio_queue_get_host_notifier(VirtQueue *vq)
     return &vq->host_notifier;
 }
 
-EventNotifier *virtio_config_get_guest_notifier(VirtIODevice *vdev)
-{
-    return &vdev->config_notifier;
-}
-
 void virtio_queue_set_host_notifier_enabled(VirtQueue *vq, bool enabled)
 {
     vq->host_notifier_enabled = enabled;
-- 
MST


