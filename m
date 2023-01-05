Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0827E65E7E2
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 10:33:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDMLj-0002Th-6D; Thu, 05 Jan 2023 04:15:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pDMLU-0002Ep-19
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 04:15:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pDMLS-000770-7W
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 04:15:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672910129;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SX8qIklmUF8EkSd2KYgJ3YK4hBq7RqmE4YSjRP8TIv4=;
 b=IndNBwkOysQbeQRrRjAj6RKqSh92OMcnWYLHmJgHlLo4bxqTbseBprmUMqRquY3rUlebb1
 LWsScSWigloCAZKOH6V7o6cpHKHWLcIoPAiW9kXAk63cepFy1QLcbHG8SWd5PbPM+tzlp/
 BkrKk6GAyUghf1wWAyKqYwXC1WWWzH4=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-440-9_8BSvILPHeA0qA-_sTlgg-1; Thu, 05 Jan 2023 04:15:25 -0500
X-MC-Unique: 9_8BSvILPHeA0qA-_sTlgg-1
Received: by mail-wr1-f71.google.com with SMTP id
 h24-20020adfaa98000000b0028abfe5b8d9so2511932wrc.2
 for <qemu-devel@nongnu.org>; Thu, 05 Jan 2023 01:15:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SX8qIklmUF8EkSd2KYgJ3YK4hBq7RqmE4YSjRP8TIv4=;
 b=5fDlxUNXtEnAXnSi61xfE9NOGWfE8MVr9uf16NK30KW/N6fGmVhp3eZ1ePutmvP3qT
 EGnSQRx7QRJiBuRqpa+Knj3lX/LUzev5tsmW39FhsbZNuYHmdhqO1M8G0RMPabFMGxi2
 nkzhCiWFJW33RQVk9rgX7epN5Zv3bgOaRuFfDnLvMi28EQJJrO4uPCpNeNhMEfRZHolL
 gGxjJUCXESEcTsIFZaBQJVZO92plPfqIuVsPijn3/YikkgQp0rXBzot2qrqlCR/nCeEA
 0f48aaAC1cA/RhVuO0MrrwRR+4eLOiVCYE7KL70/9byBCPqFz00WOJB4oI3cVYHTgnFk
 o5IQ==
X-Gm-Message-State: AFqh2kpCamTnOrvDbWjmhShwTIa74v4y1RhbqIypHInLWxZfMa5oziva
 6gp4gGkpfRcSu6Kswwt4DopXKa8dNmNlnmRqNwsiuL+UE1IdtjfLLZ5YXinTcGMEdsyQsveSlbE
 nAhBWBKdGVt9h1Spq1Z0CQpiaE4fWsVhgVG1WnSG4tAyEzgokHL1sxawtSW1g
X-Received: by 2002:a05:600c:228b:b0:3d2:37a4:222a with SMTP id
 11-20020a05600c228b00b003d237a4222amr39944708wmf.38.1672910124057; 
 Thu, 05 Jan 2023 01:15:24 -0800 (PST)
X-Google-Smtp-Source: AMrXdXv12ExmkV9igizXC+4HjCmRUocW3oBP2k3nmfgS0R0P6KseNxy5vOPDuLfygDiR7Gam/AgMyw==
X-Received: by 2002:a05:600c:228b:b0:3d2:37a4:222a with SMTP id
 11-20020a05600c228b00b003d237a4222amr39944689wmf.38.1672910123688; 
 Thu, 05 Jan 2023 01:15:23 -0800 (PST)
Received: from redhat.com ([2.52.151.85]) by smtp.gmail.com with ESMTPSA id
 v16-20020a05600c445000b003c6c3fb3cf6sm1859332wmn.18.2023.01.05.01.15.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jan 2023 01:15:23 -0800 (PST)
Date: Thu, 5 Jan 2023 04:15:20 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Cindy Lu <lulu@redhat.com>,
 Jason Wang <jasowang@redhat.com>
Subject: [PULL 20/51] virtio: add support for configure interrupt
Message-ID: <20230105091310.263867-21-mst@redhat.com>
References: <20230105091310.263867-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230105091310.263867-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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

From: Cindy Lu <lulu@redhat.com>

Add the functions to support the configure interrupt in virtio
The function virtio_config_guest_notifier_read will notify the
guest if there is an configure interrupt.
The function virtio_config_set_guest_notifier_fd_handler is
to set the fd hander for the notifier

Signed-off-by: Cindy Lu <lulu@redhat.com>
Message-Id: <20221222070451.936503-7-lulu@redhat.com>
Acked-by: Jason Wang <jasowang@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/virtio/virtio.h |  4 ++++
 hw/virtio/virtio.c         | 29 +++++++++++++++++++++++++++++
 2 files changed, 33 insertions(+)

diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
index 8266d240cc..4219968fd8 100644
--- a/include/hw/virtio/virtio.h
+++ b/include/hw/virtio/virtio.h
@@ -155,6 +155,7 @@ struct VirtIODevice
     AddressSpace *dma_as;
     QLIST_HEAD(, VirtQueue) *vector_queues;
     QTAILQ_ENTRY(VirtIODevice) next;
+    EventNotifier config_notifier;
 };
 
 struct VirtioDeviceClass {
@@ -377,6 +378,9 @@ void virtio_queue_aio_attach_host_notifier_no_poll(VirtQueue *vq, AioContext *ct
 void virtio_queue_aio_detach_host_notifier(VirtQueue *vq, AioContext *ctx);
 VirtQueue *virtio_vector_first_queue(VirtIODevice *vdev, uint16_t vector);
 VirtQueue *virtio_vector_next_queue(VirtQueue *vq);
+EventNotifier *virtio_config_get_guest_notifier(VirtIODevice *vdev);
+void virtio_config_set_guest_notifier_fd_handler(VirtIODevice *vdev,
+                                                 bool assign, bool with_irqfd);
 
 static inline void virtio_add_feature(uint64_t *features, unsigned int fbit)
 {
diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index 289eb71045..6ff797e1cf 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -3417,7 +3417,14 @@ static void virtio_queue_guest_notifier_read(EventNotifier *n)
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
@@ -3434,6 +3441,23 @@ void virtio_queue_set_guest_notifier_fd_handler(VirtQueue *vq, bool assign,
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
@@ -3514,6 +3538,11 @@ EventNotifier *virtio_queue_get_host_notifier(VirtQueue *vq)
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


