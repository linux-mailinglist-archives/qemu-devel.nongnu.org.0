Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CA8F488069
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Jan 2022 02:23:22 +0100 (CET)
Received: from localhost ([::1]:44128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n60S0-0007BV-Md
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 20:23:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n609O-0003OA-2U
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 20:04:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59041)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n609M-0002Kz-Ht
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 20:04:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641603842;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=m0o2ISf2fuLkjyQa6eo4LTXkqbFcr+aoyo0kUY28Ncc=;
 b=YxXmMHtAV3CxpgxxgnYQi1VENsbv2IByYls+gLW68QrzWlNL7jd9UNeyHbx2jYEETgqMvw
 lObv4132gZrIpeOZPtT56VemgOuz7lTmGZWmXcWuaiPtlFVYOSw5aHKxXXo/Jg75U2crH+
 9VATIk7joYuxkuCy1T40FVUOia+mDq4=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-44-UV_BU6SGND6dRyPS4XLd1A-1; Fri, 07 Jan 2022 20:04:01 -0500
X-MC-Unique: UV_BU6SGND6dRyPS4XLd1A-1
Received: by mail-wm1-f70.google.com with SMTP id
 r65-20020a1c4444000000b003478a458f01so2179212wma.4
 for <qemu-devel@nongnu.org>; Fri, 07 Jan 2022 17:04:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=m0o2ISf2fuLkjyQa6eo4LTXkqbFcr+aoyo0kUY28Ncc=;
 b=TDfANL7wo7RWE33kgww/IAp1JKFKT615vtPkYkx1PLnp9yCEKTOl/FA5Wghgah0UXF
 CZmJJtJvNhu+N98Rf4YSRNAZkzyhyl1AY5GzZ7Im16JHs2fgeCJPpYnY/w3Z0WujA0Up
 MHISaQeVbiTiwBF/gFHyrfumupHBgMP2oap+yt1FY0OIQgAku7A/Sqk45y9J2mCMOhcU
 laZk1aajlgvxX9401EK5vK0uwW3H7iApZlUINRr+VJpf/SQtC9Gt4myISNq/+mo6ih+Z
 gbAQOQrwGajURAzMtjhcUfN/lxD+GO/6KQzSQyMlFAEw5PTsIqBU/8ZUt9N+DuwfqY/O
 B0vw==
X-Gm-Message-State: AOAM532lpOF1Zz7ZETH4WMjTftMeoSVMXAi5fMbob+3px82XHuknBaS1
 mi2oyQw1nkHd9Qq2IZR9kvait4CzN1YtQDq6XJBBkeAJvaPZlxN2OKpB/idfp49eB1wzxDzRyaQ
 EMxOmJd37BxnnLOJAaIdiEQQS6VE+3RT3BkkXZzsUHMPaGLwISKZJXYsGPsHE
X-Received: by 2002:adf:df87:: with SMTP id z7mr6373884wrl.667.1641603839986; 
 Fri, 07 Jan 2022 17:03:59 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyp/5pzlt3ZxIjjyuB2FKoVH27ZJBuYQE0etHXOVUnXTVAiecQh/8ergjxYN8J7DX2QSYRhXA==
X-Received: by 2002:adf:df87:: with SMTP id z7mr6373872wrl.667.1641603839721; 
 Fri, 07 Jan 2022 17:03:59 -0800 (PST)
Received: from redhat.com ([147.161.13.99])
 by smtp.gmail.com with ESMTPSA id z17sm235306wmi.22.2022.01.07.17.03.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 17:03:59 -0800 (PST)
Date: Fri, 7 Jan 2022 20:03:56 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v3 08/55] virtio: add support for configure interrupt
Message-ID: <20220108003423.15830-9-mst@redhat.com>
References: <20220108003423.15830-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220108003423.15830-1-mst@redhat.com>
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


