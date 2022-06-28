Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4771555BE67
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 07:15:26 +0200 (CEST)
Received: from localhost ([::1]:40944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o63ZM-0008FV-BQ
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 01:15:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1o633l-0007je-Ga
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 00:42:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:25982)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1o633j-0006qG-Kz
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 00:42:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656391363;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Gbt2IiGiHkBeCQ5UhW7nCSDaGcZcoE+4TJvIBEuZXJY=;
 b=OvEuR0wiHn84vy0t/HgYYiQp3hiYpcicu3jnDeAG0JlTGYINr6PALi3vnbFmRlDNPMh5aE
 N4CzAVGxXnw718c8MJcbbTJAurr2tDfHitQOrRj366jgJMKViJDWXIu9A2UlVvgdUNZFd/
 gmZ6yjYyfWUIohqVRyNRhPm7oTf6VzI=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-221-8TcyTF7bNXaRPSV0LCSezA-1; Tue, 28 Jun 2022 00:42:41 -0400
X-MC-Unique: 8TcyTF7bNXaRPSV0LCSezA-1
Received: by mail-wm1-f72.google.com with SMTP id
 h125-20020a1c2183000000b003a03a8475c6so4070247wmh.8
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 21:42:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Gbt2IiGiHkBeCQ5UhW7nCSDaGcZcoE+4TJvIBEuZXJY=;
 b=oM2GQjnZ8QWu3xbbMu3EtGPNM1JBwXHfcD0qo2SPP80gdJFyG7ChSQoObbw9SiXeL8
 mBlTNYZJxfPso3ImrRH3br3S40Aqdf9CSzVTG9WfyaSs5+rxevFM4sH7UDRD6zo3wbZ6
 jzhqsG/EEzQtEOUxKRJOiJ2qe34/Ba2HpTS+OewECq3jG2GDdY2ebekDKDhyeChrtkau
 DsoGAY54d9aA2B7IFU+wV822Oerfw/+vl00xxVZk3oT1j47yEDLHZMX6GaPU39PM1Sou
 tT6j449C6azLomQEXzvbwSbQTqRboiYSJoDBxlONvmfCSF9ddyuJsy0fodkV1uP+Wt8X
 +cFQ==
X-Gm-Message-State: AJIora886MClCkv1KclwScrtRi76U+8bkGFGkfLt5OJHcckmlbHMeVMk
 OiZYihxe4NvKgL5UWQLKnCvD0rTXTIbmNnrP8/lh3fVUsIu4U66hUzC5RZPYEJoulv7Cj7oAKsX
 h4cBHuD2rT2XXztPgfqCbOETotpXd/A4//iHvHimKK77OOpZshImuZoDZ3rWk
X-Received: by 2002:adf:e502:0:b0:21b:8de6:7f14 with SMTP id
 j2-20020adfe502000000b0021b8de67f14mr15255452wrm.3.1656391360048; 
 Mon, 27 Jun 2022 21:42:40 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vrH5jG1jR4SPG61pD/07fAwiSYK30nkWUnxb79Rur2xlOjEev/TSJ6pRN5cbM3My6iR8q9zg==
X-Received: by 2002:adf:e502:0:b0:21b:8de6:7f14 with SMTP id
 j2-20020adfe502000000b0021b8de67f14mr15255434wrm.3.1656391359710; 
 Mon, 27 Jun 2022 21:42:39 -0700 (PDT)
Received: from redhat.com ([2.52.23.204]) by smtp.gmail.com with ESMTPSA id
 l8-20020a7bc448000000b003a0332760c0sm15298238wmi.16.2022.06.27.21.42.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 21:42:39 -0700 (PDT)
Date: Tue, 28 Jun 2022 00:42:36 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Konstantin Khlebnikov <khlebnikov@yandex-team.ru>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Roman Kagan <rvkagan@yandex-team.ru>
Subject: [PULL 04/12] vhost: setup error eventfd and dump errors
Message-ID: <20220628044201.217173-5-mst@redhat.com>
References: <20220628044201.217173-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220628044201.217173-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

From: Konstantin Khlebnikov <khlebnikov@yandex-team.ru>

Vhost has error notifications, let's log them like other errors.
For each virt-queue setup eventfd for vring error notifications.

Signed-off-by: Konstantin Khlebnikov <khlebnikov@yandex-team.ru>
[vsementsov: rename patch, change commit message  and dump error like
             other errors in the file]
Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Message-Id: <20220623161325.18813-3-vsementsov@yandex-team.ru>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Roman Kagan <rvkagan@yandex-team.ru>
---
 include/hw/virtio/vhost.h |  1 +
 hw/virtio/vhost.c         | 37 +++++++++++++++++++++++++++++++++++++
 2 files changed, 38 insertions(+)

diff --git a/include/hw/virtio/vhost.h b/include/hw/virtio/vhost.h
index b291fe4e24..1e7cbd9a10 100644
--- a/include/hw/virtio/vhost.h
+++ b/include/hw/virtio/vhost.h
@@ -29,6 +29,7 @@ struct vhost_virtqueue {
     unsigned long long used_phys;
     unsigned used_size;
     EventNotifier masked_notifier;
+    EventNotifier error_notifier;
     struct vhost_dev *dev;
 };
 
diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
index 6c41fa13e3..0827d631c0 100644
--- a/hw/virtio/vhost.c
+++ b/hw/virtio/vhost.c
@@ -1278,6 +1278,19 @@ static int vhost_virtqueue_set_busyloop_timeout(struct vhost_dev *dev,
     return 0;
 }
 
+static void vhost_virtqueue_error_notifier(EventNotifier *n)
+{
+    struct vhost_virtqueue *vq = container_of(n, struct vhost_virtqueue,
+                                              error_notifier);
+    struct vhost_dev *dev = vq->dev;
+    int index = vq - dev->vqs;
+
+    if (event_notifier_test_and_clear(n) && dev->vdev) {
+        VHOST_OPS_DEBUG(-EINVAL,  "vhost vring error in virtqueue %d",
+                        dev->vq_index + index);
+    }
+}
+
 static int vhost_virtqueue_init(struct vhost_dev *dev,
                                 struct vhost_virtqueue *vq, int n)
 {
@@ -1299,7 +1312,27 @@ static int vhost_virtqueue_init(struct vhost_dev *dev,
 
     vq->dev = dev;
 
+    if (dev->vhost_ops->vhost_set_vring_err) {
+        r = event_notifier_init(&vq->error_notifier, 0);
+        if (r < 0) {
+            goto fail_call;
+        }
+
+        file.fd = event_notifier_get_fd(&vq->error_notifier);
+        r = dev->vhost_ops->vhost_set_vring_err(dev, &file);
+        if (r) {
+            VHOST_OPS_DEBUG(r, "vhost_set_vring_err failed");
+            goto fail_err;
+        }
+
+        event_notifier_set_handler(&vq->error_notifier,
+                                   vhost_virtqueue_error_notifier);
+    }
+
     return 0;
+
+fail_err:
+    event_notifier_cleanup(&vq->error_notifier);
 fail_call:
     event_notifier_cleanup(&vq->masked_notifier);
     return r;
@@ -1308,6 +1341,10 @@ fail_call:
 static void vhost_virtqueue_cleanup(struct vhost_virtqueue *vq)
 {
     event_notifier_cleanup(&vq->masked_notifier);
+    if (vq->dev->vhost_ops->vhost_set_vring_err) {
+        event_notifier_set_handler(&vq->error_notifier, NULL);
+        event_notifier_cleanup(&vq->error_notifier);
+    }
 }
 
 int vhost_dev_init(struct vhost_dev *hdev, void *opaque,
-- 
MST


