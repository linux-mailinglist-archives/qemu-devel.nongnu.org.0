Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CA5D48654E
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 14:34:00 +0100 (CET)
Received: from localhost ([::1]:40960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5Stv-0004m7-KW
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 08:33:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n5SdJ-00044V-Ir
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 08:16:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54352)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n5SdH-0000oQ-04
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 08:16:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641475002;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=m0o2ISf2fuLkjyQa6eo4LTXkqbFcr+aoyo0kUY28Ncc=;
 b=Q664L/gek76X6JSLmGpf6LXH4keq4beHNEgi9TD6hUvWF6DAWgp03h6iZ6ae18XepJAHdR
 kWaX1XgiweYfb0qEcJO7fzqK/e6wv83CzRtVqo7zo72/XlZ46QQgwihqEkQe6VrrUTk+zO
 Jc9M1uXkH6/B4KmgRH8GC6Was/RqgVI=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-530-9INMkKndMSCwMlAt4L-W6w-1; Thu, 06 Jan 2022 08:16:41 -0500
X-MC-Unique: 9INMkKndMSCwMlAt4L-W6w-1
Received: by mail-wm1-f72.google.com with SMTP id
 k40-20020a05600c1ca800b00345bf554707so1928146wms.4
 for <qemu-devel@nongnu.org>; Thu, 06 Jan 2022 05:16:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=m0o2ISf2fuLkjyQa6eo4LTXkqbFcr+aoyo0kUY28Ncc=;
 b=gwhAXUOXVj6wQ5bYpAM1scTJFr34uqcoQ3zV0fD3If9TOX9XzDxRmrZnSL3jVoUqHx
 yCCf43/N1L6QT+JI42O1FpajF4LjtIXVByr5P+3dUAQBKY+C/jJfDZAYNlvzthOoBohq
 7EOYButqYLx8hDre9+z4b4XyWkN94ObwnyQi+fvvQvaR1nstsLz3LEMGvCSKZ2GxnRk3
 jDN9A1IdKVbEtDAuUhOXpCsWbI+kX7JT5Ez9rutmgBbcEx6wD6o0wMyAj9BVmwNmmU/H
 Tl4Agf01dbV455VG4PL67UAz8UUsM6rVEexrx+0rkFa9o8G/sZiQviPNPc0ThXYEqlFo
 Er1g==
X-Gm-Message-State: AOAM532h90E0UMYCeAltFYsV7F31O0p7vbShWc2FhLfzkFW38aUAtwbW
 dyr327KqB0A4FXADyt3SaxGVkaNkiz+yB9Jnk0pnaTz4yMaC2j2I6hl5IAu4VfT7aFTXsIDRr5m
 ZaBQmQzfJeqk4+My2EdlgZD/W3VOd0jYLTjhDxPc9Sv8o03i/YLDo1a8LtKV9
X-Received: by 2002:a7b:c959:: with SMTP id i25mr2623395wml.164.1641474999746; 
 Thu, 06 Jan 2022 05:16:39 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy7gnWuIq3IoY/IWeL2h4+K/3lg8vFbUgvr8rbQD/9QFHO1VVO2RE9v1hQGmAI+3d86HK5E+A==
X-Received: by 2002:a7b:c959:: with SMTP id i25mr2623372wml.164.1641474999478; 
 Thu, 06 Jan 2022 05:16:39 -0800 (PST)
Received: from redhat.com ([2a03:c5c0:207e:991b:6857:5652:b903:a63b])
 by smtp.gmail.com with ESMTPSA id i8sm1840682wmq.4.2022.01.06.05.16.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jan 2022 05:16:39 -0800 (PST)
Date: Thu, 6 Jan 2022 08:16:37 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 08/52] virtio: add support for configure interrupt
Message-ID: <20220106131534.423671-9-mst@redhat.com>
References: <20220106131534.423671-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220106131534.423671-1-mst@redhat.com>
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
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
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

From: Cindy Lu <lulu@redhat.com>

Add the functions to support the configure interrupt in virtio
The function virtio_config_guest_notifier_read will notify the
guest if there is an configure interrupt.
The function virtio_config_set_guest_notifier_fd_handler is
to set the fd hander for the notifier

Signed-off-by: Cindy Lu <lulu@redhat.com>
Message-Id: <20211104164827.21911-7-lulu@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/virtio/virtio.h |  4 ++++
 hw/virtio/virtio.c         | 29 +++++++++++++++++++++++++++++
 2 files changed, 33 insertions(+)

diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
index 605ea79c90..d78088d872 100644
--- a/include/hw/virtio/virtio.h
+++ b/include/hw/virtio/virtio.h
@@ -111,6 +111,7 @@ struct VirtIODevice
     bool use_guest_notifier_mask;
     AddressSpace *dma_as;
     QLIST_HEAD(, VirtQueue) *vector_queues;
+    EventNotifier config_notifier;
 };
 
 struct VirtioDeviceClass {
@@ -313,11 +314,14 @@ uint16_t virtio_get_queue_index(VirtQueue *vq);
 EventNotifier *virtio_queue_get_guest_notifier(VirtQueue *vq);
 void virtio_queue_set_guest_notifier_fd_handler(VirtQueue *vq, bool assign,
                                                 bool with_irqfd);
+void virtio_config_set_guest_notifier_fd_handler(VirtIODevice *vdev,
+                                                 bool assign, bool with_irqfd);
 int virtio_device_start_ioeventfd(VirtIODevice *vdev);
 int virtio_device_grab_ioeventfd(VirtIODevice *vdev);
 void virtio_device_release_ioeventfd(VirtIODevice *vdev);
 bool virtio_device_ioeventfd_enabled(VirtIODevice *vdev);
 EventNotifier *virtio_queue_get_host_notifier(VirtQueue *vq);
+EventNotifier *virtio_config_get_guest_notifier(VirtIODevice *vdev);
 void virtio_queue_set_host_notifier_enabled(VirtQueue *vq, bool enabled);
 void virtio_queue_host_notifier_read(EventNotifier *n);
 void virtio_queue_aio_set_host_notifier_handler(VirtQueue *vq, AioContext *ctx,
diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index e11a8a0dba..36edb1dad5 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -3493,7 +3493,14 @@ static void virtio_queue_guest_notifier_read(EventNotifier *n)
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
@@ -3510,6 +3517,23 @@ void virtio_queue_set_guest_notifier_fd_handler(VirtQueue *vq, bool assign,
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
@@ -3583,6 +3607,11 @@ EventNotifier *virtio_queue_get_host_notifier(VirtQueue *vq)
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
-- 
MST


