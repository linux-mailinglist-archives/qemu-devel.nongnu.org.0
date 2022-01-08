Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E732B48805B
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Jan 2022 02:14:22 +0100 (CET)
Received: from localhost ([::1]:57540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n60JK-0005Ik-0v
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 20:14:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n609V-0003mm-AC
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 20:04:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59212)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n609T-0002LU-Pv
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 20:04:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641603851;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cSicCZD+rdT4rp9zVpF4X3HF/ofaRyPJFH9NwIHYGDo=;
 b=jS3WDWWwhrE6Y1RLRZsdKwH78K0JrpdNY11sB/48VY0ykMN4Wt4GYG4xfGiw3j8QHGwf6G
 f60iJHjEg3FYiD+mRcNuPZ+UDhxKpKaq7hS94rbV/2MR7lxdk49+IjQ6AoLvZG29wE2I+n
 /7HAwD5yJak4wfwhUFxeEbA7xrJ0Gw0=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-568-TFsNwOyJMT2YY7-k4BFR7A-1; Fri, 07 Jan 2022 20:04:10 -0500
X-MC-Unique: TFsNwOyJMT2YY7-k4BFR7A-1
Received: by mail-wm1-f72.google.com with SMTP id
 j8-20020a05600c1c0800b00346504f5743so5603358wms.6
 for <qemu-devel@nongnu.org>; Fri, 07 Jan 2022 17:04:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=cSicCZD+rdT4rp9zVpF4X3HF/ofaRyPJFH9NwIHYGDo=;
 b=ZkszJWkhHx24FwBacqc7pwUoKeG170RN/GiAuPBIVdM+bVM/sX6DcMZVQwtyql9rmP
 kZ+/YLPGmV3xVXewXYGf3N+F+F0fR6yfjrHcxL96U2jcBsSTpfFaRdbBf5xfnnfX6fVT
 T6jObchtvbkVufOfD1WhdtVEPedE7gTsX2hpf+tjCGBfvhOn3gjvrCeghh13zI5zEKFI
 4+4tJDyYdsthZ6yrBHSwOSWRYbx43tPHXuo6pssDoUOHVqBAlJMyd1KLF8kOrSPhndpN
 9/QA0o6s28zDD8xVduHllILShqoAFlHNKP8acN65czBZF/csg0z/glFfi3yoLbNbQgVm
 9nTA==
X-Gm-Message-State: AOAM530UYZ/RBAirJcqlj7A7clzrzwPdMxQhBtTLojQUt7Qi4jE2bNT8
 jxoe8v+cqSGGsOTKBJoGVEDQG17bM8m51povVByplab733PByV8OoYA5DDtsoKi440UWAH9RVmr
 mB7h0S4vyQc8bgjv69VsR2GtMBPe13f8GdE02ClM4oivkEwpP3bFbQ/yRFPzn
X-Received: by 2002:a5d:64e1:: with SMTP id g1mr56219168wri.403.1641603848874; 
 Fri, 07 Jan 2022 17:04:08 -0800 (PST)
X-Google-Smtp-Source: ABdhPJweqfeNYlGWJZvfPRgieL8h5B+57V4WBPjJ+EqWWIiz1x3z73MI5Lk2wlN5IMCYhIfMhUJ6bA==
X-Received: by 2002:a5d:64e1:: with SMTP id g1mr56219159wri.403.1641603848676; 
 Fri, 07 Jan 2022 17:04:08 -0800 (PST)
Received: from redhat.com ([147.161.13.99])
 by smtp.gmail.com with ESMTPSA id m17sm226040wmq.31.2022.01.07.17.04.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 17:04:08 -0800 (PST)
Date: Fri, 7 Jan 2022 20:04:05 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v3 11/55] virtio-mmio: add support for configure interrupt
Message-ID: <20220108003423.15830-12-mst@redhat.com>
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


