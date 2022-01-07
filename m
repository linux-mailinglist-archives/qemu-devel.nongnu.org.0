Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38C42487678
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 12:28:13 +0100 (CET)
Received: from localhost ([::1]:52436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5nPo-0001Ek-8d
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 06:28:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n5n29-0007BF-3H
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 06:03:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:58786)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n5n27-0001om-JN
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 06:03:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641553423;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cSicCZD+rdT4rp9zVpF4X3HF/ofaRyPJFH9NwIHYGDo=;
 b=GbOi6NlNu4rJOH+8ANVcSt1KmklYTTj4Fh3xupFEdXRrTHfpiWhbnkaq+X4S6OeSrOtdsx
 JhrLDMhT/E6vxCfNL+wq0aZ3v/MieXPvEt+YIHJ6geVNpyIEdthrJw2mIUshhfkg3jjZw8
 ibeos7UgbjxjsdjxYnhglwtZ3rfukqI=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-223-B-htt01kPN-9QbUCKb606A-1; Fri, 07 Jan 2022 06:03:42 -0500
X-MC-Unique: B-htt01kPN-9QbUCKb606A-1
Received: by mail-wr1-f71.google.com with SMTP id
 a11-20020adffb8b000000b001a0b0f4afe9so2112553wrr.13
 for <qemu-devel@nongnu.org>; Fri, 07 Jan 2022 03:03:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=cSicCZD+rdT4rp9zVpF4X3HF/ofaRyPJFH9NwIHYGDo=;
 b=DxfFMAmPNDanNrhWTLT9kb8ZPN0TJUATGxP2bkw9nPcGEFI+2u5pw5WI7bYoqJc4DE
 fDuieXmA4TscdiRTNos2cJEB+VINciGVTbCsczsRHB8ojqc5tAi+qEaRQUA6vNIr/Vmr
 nv3ah6BYa9a/okgiqdYsMRLVYLoO7iydbjA4bqeY5uRsJRtbG+zEfkYvFdy4kqGTVt8f
 SROnAR4FoNqJ9KPt/GYGfHUc4bR67OTdGmdWWGB8KM20fhhUKmg6nS7kwS//CGmhrshz
 A0btezTkAV9dMrQsJkaBCD9EOtUPihvZjRF2pKlejFrhTMaOBtpM+gdOwhrc4N4Gvo/H
 KP6A==
X-Gm-Message-State: AOAM533PDeqHlLcJ1HFidwkM5ylE+k3+kbeOVRZ0194OX5raVB3XZR1W
 An1bL5e+RB0uGTSrxLNv7nzLiYzPyqBCWoYW3IpF/SxNEsDh/KJcE7M2NqY+H/3zwhX9e7EHZew
 T5A3a7jZhyBcoboxNSwUgfNb4UrK3alLBR8CHMLDLyTGutM7MGFQRNOwsvKav
X-Received: by 2002:a5d:6d4f:: with SMTP id k15mr40361673wri.345.1641553420536; 
 Fri, 07 Jan 2022 03:03:40 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwolG/GAeijGo9GawYLWpzhB9mAbJLtWnIEoxWO1MfjSBQsjnXhhDruhTmX4mS7LXgRdi6j3Q==
X-Received: by 2002:a5d:6d4f:: with SMTP id k15mr40361646wri.345.1641553420203; 
 Fri, 07 Jan 2022 03:03:40 -0800 (PST)
Received: from redhat.com ([2.55.16.192])
 by smtp.gmail.com with ESMTPSA id g18sm8826020wmq.5.2022.01.07.03.03.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 03:03:39 -0800 (PST)
Date: Fri, 7 Jan 2022 06:03:37 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 11/55] virtio-mmio: add support for configure interrupt
Message-ID: <20220107102526.39238-12-mst@redhat.com>
References: <20220107102526.39238-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220107102526.39238-1-mst@redhat.com>
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


