Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40A02486557
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 14:38:06 +0100 (CET)
Received: from localhost ([::1]:50264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5Sxv-0002js-VN
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 08:38:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n5SdR-00047J-VV
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 08:16:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:58276)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n5SdO-0000p6-7h
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 08:16:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641475009;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cSicCZD+rdT4rp9zVpF4X3HF/ofaRyPJFH9NwIHYGDo=;
 b=gSKEDsVurF7HihEKQLJBd0Hy4pakzwpGWJ6OnTg6Snuu+FKRBuo+tWAeZ0mwup+ipit/KA
 pSAW5wTw3t9M9IQggbacuuZxUGqTLL0xEPVpc0hTjQLM7sXDEyBNcWA6KwXqKzoehns5WG
 UuYcU7mRm0PGJZkldZPAXGKCzQVgxPc=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-433-sQliyDFUMvWyXoolceDAgw-1; Thu, 06 Jan 2022 08:16:48 -0500
X-MC-Unique: sQliyDFUMvWyXoolceDAgw-1
Received: by mail-wr1-f72.google.com with SMTP id
 w25-20020adf8bd9000000b001a255212b7cso1232356wra.18
 for <qemu-devel@nongnu.org>; Thu, 06 Jan 2022 05:16:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=cSicCZD+rdT4rp9zVpF4X3HF/ofaRyPJFH9NwIHYGDo=;
 b=ZInt+BXME9E5Q/6A6VzCPMievtLAEwg5EVwyqa2Zzx4yFixx14TTWhent20pe79vE2
 2lZW0WABhTJyNzfJumbMgB3PjFizLYO8bkcPJI1OQtPy0IJuPLf2o6AH+Zl1GIiz1ORL
 N+91rgTga6n9RI4GcBfVmseNUOUBuwn0giiPQkJn1KnlmyJ1UBmNRoqYGfCvs8VaycoK
 96dfUNK9XMB29QL0oIzPP8KSEIK+814m+xk3hJzrURuwhbmdg+lp45shsE3Ik3SxA/wb
 J/JBA3uVv18JGc6PP3FxjKcggV335Fn9/T0h2UK3k1P38XrNCga/exKoPm0x/gGO7sHD
 /Vpg==
X-Gm-Message-State: AOAM533qu3jm7+XMy2ozArxOYBp7YiV869N3OTyqh7Wg9KyiGdB9IRgM
 +ems0I0xh34MPFFdRG29PBGUxW4L1Mdxi8gSyIUZofd7JFX4UjK4FdtQnxSN4w5OqFbi9H5ZmH8
 jIVz78Zwq7KfLK1zalsUyo6qUTlCr4QA/ICR4mWXTZ13hnOCOgmIFDKwd//qK
X-Received: by 2002:a05:600c:2114:: with SMTP id
 u20mr4465209wml.67.1641475007333; 
 Thu, 06 Jan 2022 05:16:47 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx5ZgHC6FztOMLVC4WpnnL0hUyjegs5o0MP0ukrw1iDQxbhpanGepyjELZRn0Xecvsv8M2tog==
X-Received: by 2002:a05:600c:2114:: with SMTP id
 u20mr4465194wml.67.1641475007131; 
 Thu, 06 Jan 2022 05:16:47 -0800 (PST)
Received: from redhat.com ([2a03:c5c0:207e:991b:6857:5652:b903:a63b])
 by smtp.gmail.com with ESMTPSA id 14sm2157125wry.23.2022.01.06.05.16.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jan 2022 05:16:46 -0800 (PST)
Date: Thu, 6 Jan 2022 08:16:44 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 11/52] virtio-mmio: add support for configure interrupt
Message-ID: <20220106131534.423671-12-mst@redhat.com>
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
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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

Add configure interrupt support for virtio-mmio bus. This
interrupt will be working while the backend is vhost-vdpa

Signed-off-by: Cindy Lu <lulu@redhat.com>
Message-Id: <20211104164827.21911-10-lulu@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/virtio/virtio-mmio.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/hw/virtio/virtio-mmio.c b/hw/virtio/virtio-mmio.c
index 72da12fea5..809132018b 100644
--- a/hw/virtio/virtio-mmio.c
+++ b/hw/virtio/virtio-mmio.c
@@ -673,7 +673,30 @@ static int virtio_mmio_set_guest_notifier(DeviceState *d, int n, bool assign,
 
     return 0;
 }
+static int virtio_mmio_set_config_guest_notifier(DeviceState *d, bool assign)
+{
+    VirtIOMMIOProxy *proxy = VIRTIO_MMIO(d);
+    VirtIODevice *vdev = virtio_bus_get_device(&proxy->bus);
+    VirtioDeviceClass *vdc = VIRTIO_DEVICE_GET_CLASS(vdev);
+    bool with_irqfd = false;
+    EventNotifier *notifier = virtio_config_get_guest_notifier(vdev);
+    int r = 0;
 
+    if (assign) {
+        r = event_notifier_init(notifier, 0);
+        if (r < 0) {
+            return r;
+        }
+        virtio_config_set_guest_notifier_fd_handler(vdev, assign, with_irqfd);
+    } else {
+        virtio_config_set_guest_notifier_fd_handler(vdev, assign, with_irqfd);
+        event_notifier_cleanup(notifier);
+    }
+    if (vdc->guest_notifier_mask && vdev->use_guest_notifier_mask) {
+        vdc->guest_notifier_mask(vdev, VIRTIO_CONFIG_IRQ_IDX, !assign);
+    }
+    return r;
+}
 static int virtio_mmio_set_guest_notifiers(DeviceState *d, int nvqs,
                                            bool assign)
 {
@@ -695,6 +718,10 @@ static int virtio_mmio_set_guest_notifiers(DeviceState *d, int nvqs,
             goto assign_error;
         }
     }
+    r = virtio_mmio_set_config_guest_notifier(d, assign);
+    if (r < 0) {
+        goto assign_error;
+    }
 
     return 0;
 
-- 
MST


