Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FB344891B3
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 08:38:24 +0100 (CET)
Received: from localhost ([::1]:44482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6pG3-0004h7-Cv
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 02:38:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n6oul-0007LC-MO
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 02:16:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:43789)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n6ouj-0001nk-TQ
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 02:16:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641798981;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WOchQAAD6NyARfKewJc/Jy9v/cbY3+ClrTZDCczKSP0=;
 b=fHv7MrPIOVQzGmwJkhDkqUmEZ/zRQQUEsAxHm/VRTaYAnyZJ5XQentffacAhNmFKPmbRyr
 DAg3pWJdPMg8+FnN8Yso/hA4wnQXNE/pxB8VBRYGeL0sKOg1OMZIP+DaZ1oAqxljHrlTlk
 3YQaMjnjEsHxfNlL5+Eo65A7yv3CLHM=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-67-QUeVoSvuOz2KqlU5A5VyEw-1; Mon, 10 Jan 2022 02:16:20 -0500
X-MC-Unique: QUeVoSvuOz2KqlU5A5VyEw-1
Received: by mail-wm1-f70.google.com with SMTP id
 z13-20020a05600c0a0d00b003457d6619f8so4533696wmp.1
 for <qemu-devel@nongnu.org>; Sun, 09 Jan 2022 23:16:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=WOchQAAD6NyARfKewJc/Jy9v/cbY3+ClrTZDCczKSP0=;
 b=uKiTOH7yejSttxptduErmXUyuzy3IzJsRu7k3n8zu+hAwO2Rp8NLliO+RL0T3jnPkM
 SqxcAfhw6sfCWoHcEvYSxA3C/fK3TDQImkdL2pvwqxqdVT2IrG2Y0ao+10DEf8oKFDH0
 lQI5qRfpxjXf80ClqnMkQezoB6dQbXCm1LudBfqSSBTmvA9b84Y/+nfsGJAWvX2gc5jq
 smIpsQ7Lvujkr5r3dcO8pZveCautxh4GR2wwh8laTS9hXkLbe42bnvrrO1sM7CotYUlJ
 T+vQY33L+7nl8JsfkDT+RkENHDR7pZNUzomkw4zQsKshmQZ6s+yRECmO8zrDnZj37Yaq
 aR3w==
X-Gm-Message-State: AOAM530iun26NmxP3KI1x0wfhTLxFCKO44TnbItAMcDRsp/WSXw4VIjH
 S7nYNJPR6A9XTrQEVp8W/kDTjbFzqikhn3UgRRKUJr+Nc0Q82voje+qVuKnVAM2gVPsTacglb7D
 90hI97i+QiI61Xqld9u6uTtncbA+43VIzUVAB8gvqYgFrVhCZvDQtRgNMVHbk
X-Received: by 2002:a1c:7908:: with SMTP id l8mr20444895wme.16.1641798978639; 
 Sun, 09 Jan 2022 23:16:18 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzmV6rcS4NVOOfwp4gwPsh0EFQQyk0GgcE0CvHPdeU8yVMWme06dlWmHjfrPgI8zOjA4N8uBg==
X-Received: by 2002:a1c:7908:: with SMTP id l8mr20444878wme.16.1641798978373; 
 Sun, 09 Jan 2022 23:16:18 -0800 (PST)
Received: from redhat.com ([2a03:c5c0:107d:b60c:c297:16fe:7528:e989])
 by smtp.gmail.com with ESMTPSA id 1sm6257866wrb.13.2022.01.09.23.16.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Jan 2022 23:16:17 -0800 (PST)
Date: Mon, 10 Jan 2022 02:16:16 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 05/10] Revert "virtio: add support for configure interrupt"
Message-ID: <20220110071547.195669-6-mst@redhat.com>
References: <20220110071547.195669-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220110071547.195669-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This reverts commit 081f864f56307551f59c5e934e3f30a7290d0faa.
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


