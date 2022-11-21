Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93662631DE2
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Nov 2022 11:12:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ox3li-0003h1-Bq; Mon, 21 Nov 2022 05:11:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1ox3lg-0003g4-Q0
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 05:11:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1ox3ld-0004Vk-G2
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 05:11:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669025468;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=AG1z4FQ1h8Ayn5Ce8rylxXckUaDgN+yFy6hsXsbYx+o=;
 b=DrqrQ7RJtrW2Sq+UxhlqIfCSkZ6ibPG0N0/x3bb7DqNWPXmb4BRiiuuKoxpMso7hI72sFS
 LhXjXHYlk/69w1UvCxRjuHs1t0B0kXFQejGddXqX3sO5q7sBTijuooOeOKum9MsLL+7BpI
 s1ofGUjSt9CM0hacHRJiA0i8+cJtQXI=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-216-53Ga4To9MfaZq_Iz1loHAA-1; Mon, 21 Nov 2022 05:11:07 -0500
X-MC-Unique: 53Ga4To9MfaZq_Iz1loHAA-1
Received: by mail-wr1-f71.google.com with SMTP id
 v12-20020adfa1cc000000b00236eaee7197so3025528wrv.0
 for <qemu-devel@nongnu.org>; Mon, 21 Nov 2022 02:11:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=AG1z4FQ1h8Ayn5Ce8rylxXckUaDgN+yFy6hsXsbYx+o=;
 b=LxsZWcDfjS8j2uN7W7hBzpR498QaRMNMxxhoiJUIX7fcCsRvWaB6bEXebbz9RZyoit
 YBnKKijXayNj773BEStk1wQFO6CZNCdCcIgFrhaU5kKh+gh5t282b5lKan1QBmvdt/AV
 0OAC7oT7UdXM6thTCTS8W797KkenuNz5VPzB5G0m/MIDolTUgFpAznLj2pb4ximBtD80
 UP+23WYlgeuF+kkeDZufH+zgoRu7kXUCl7NsVkYARmMX/03PChcRgf+aXTw5f5drCjbO
 jdY9UVZFzPZJL8/9McLxJX6EW3ctX/NbwH+zD1Jf0s+BUNqXSXn2HWPoDOm0qdubQ1ix
 PMYA==
X-Gm-Message-State: ANoB5pkGmaFXTO9Sz/Kpwral4HQ2HUF02MrjBTiUcrH+PUAM47fM+vvj
 KvEFZLpNgZCF6b2TLvNSPQLTqJvH7jfQ6Lr1HUrF8/JlYbfe7U1sfVOHH2HtiGIPhw0KHvXKWXS
 dmpMQ+YpuD5YsiCp4v8r8e1bVynNQeGXcZko+TDjkNkHsrMyVd1laSQB+dNO5cy9FHpk=
X-Received: by 2002:a05:600c:3647:b0:3b4:c00d:2329 with SMTP id
 y7-20020a05600c364700b003b4c00d2329mr1544170wmq.124.1669025464667; 
 Mon, 21 Nov 2022 02:11:04 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6PSqJ+sAT7ZlkA6pR3ibZ+7QaagTOYod4Iewo7fpO1ufmq8YPnQBEQDslVJ0Vl3pSJxA3jFg==
X-Received: by 2002:a05:600c:3647:b0:3b4:c00d:2329 with SMTP id
 y7-20020a05600c364700b003b4c00d2329mr1544121wmq.124.1669025464265; 
 Mon, 21 Nov 2022 02:11:04 -0800 (PST)
Received: from step1.redhat.com (host-82-53-134-234.retail.telecomitalia.it.
 [82.53.134.234]) by smtp.gmail.com with ESMTPSA id
 v15-20020a05600c444f00b003b4cba4ef71sm18719302wmn.41.2022.11.21.02.11.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Nov 2022 02:11:03 -0800 (PST)
From: Stefano Garzarella <sgarzare@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, virtio-fs@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Fam Zheng <fam@euphon.net>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Kevin Wolf <kwolf@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, kangjie.xu@linux.alibaba.com,
 Jason Wang <jasowang@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>
Subject: [PATCH] vhost: mask VIRTIO_F_RING_RESET for vhost and vhost-user
 devices
Date: Mon, 21 Nov 2022 11:11:01 +0100
Message-Id: <20221121101101.29400-1-sgarzare@redhat.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Commit 69e1c14aa2 ("virtio: core: vq reset feature negotation support")
enabled VIRTIO_F_RING_RESET by default for all virtio devices.

This feature is not currently emulated by QEMU, so for vhost and
vhost-user devices we need to make sure it is supported by the offloaded
device emulation (in-kernel or in another process).
To do this we need to add VIRTIO_F_RING_RESET to the features bitmap
passed to vhost_get_features(). This way it will be masked if the device
does not support it.

This issue was initially discovered with vhost-vsock and vhost-user-vsock,
and then also tested with vhost-user-rng which confirmed the same issue.
They fail when sending features through VHOST_SET_FEATURES ioctl or
VHOST_USER_SET_FEATURES message, since VIRTIO_F_RING_RESET is negotiated
by the guest (Linux >= v6.0), but not supported by the device.

Fixes: 69e1c14aa2 ("virtio: core: vq reset feature negotation support")
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1318
Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
---

To prevent this problem in the future, perhaps we should provide a function
(e.g. vhost_device_get_features) where we go to mask all non-device-specific
features (e.g VIRTIO_F_*, VIRTIO_RING_F_*) that are not emulated by QEMU but
we expect them to be emulated by the vhost or vhost-user devices.
Then we can call it in all .get_features callbacks just before return the
features.

What do you think?

But maybe better to do that for the next release, I will send an RFC.

Thanks,
Stefano
---
 hw/block/vhost-user-blk.c      |  1 +
 hw/net/vhost_net.c             |  1 +
 hw/scsi/vhost-scsi.c           |  1 +
 hw/scsi/vhost-user-scsi.c      |  1 +
 hw/virtio/vhost-user-fs.c      |  1 +
 hw/virtio/vhost-user-gpio.c    |  1 +
 hw/virtio/vhost-user-i2c.c     |  1 +
 hw/virtio/vhost-user-rng.c     | 11 +++++++++--
 hw/virtio/vhost-vsock-common.c |  1 +
 net/vhost-vdpa.c               |  1 +
 10 files changed, 18 insertions(+), 2 deletions(-)

diff --git a/hw/block/vhost-user-blk.c b/hw/block/vhost-user-blk.c
index 16ad400889..0d5190accf 100644
--- a/hw/block/vhost-user-blk.c
+++ b/hw/block/vhost-user-blk.c
@@ -52,6 +52,7 @@ static const int user_feature_bits[] = {
     VIRTIO_F_NOTIFY_ON_EMPTY,
     VIRTIO_F_RING_PACKED,
     VIRTIO_F_IOMMU_PLATFORM,
+    VIRTIO_F_RING_RESET,
     VHOST_INVALID_FEATURE_BIT
 };
 
diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
index feda448878..26e4930676 100644
--- a/hw/net/vhost_net.c
+++ b/hw/net/vhost_net.c
@@ -75,6 +75,7 @@ static const int user_feature_bits[] = {
     VIRTIO_NET_F_MTU,
     VIRTIO_F_IOMMU_PLATFORM,
     VIRTIO_F_RING_PACKED,
+    VIRTIO_F_RING_RESET,
     VIRTIO_NET_F_RSS,
     VIRTIO_NET_F_HASH_REPORT,
 
diff --git a/hw/scsi/vhost-scsi.c b/hw/scsi/vhost-scsi.c
index bdf337a7a2..6a0fd0dfb1 100644
--- a/hw/scsi/vhost-scsi.c
+++ b/hw/scsi/vhost-scsi.c
@@ -38,6 +38,7 @@ static const int kernel_feature_bits[] = {
     VIRTIO_RING_F_INDIRECT_DESC,
     VIRTIO_RING_F_EVENT_IDX,
     VIRTIO_SCSI_F_HOTPLUG,
+    VIRTIO_F_RING_RESET,
     VHOST_INVALID_FEATURE_BIT
 };
 
diff --git a/hw/scsi/vhost-user-scsi.c b/hw/scsi/vhost-user-scsi.c
index bc37317d55..b7a71a802c 100644
--- a/hw/scsi/vhost-user-scsi.c
+++ b/hw/scsi/vhost-user-scsi.c
@@ -36,6 +36,7 @@ static const int user_feature_bits[] = {
     VIRTIO_RING_F_INDIRECT_DESC,
     VIRTIO_RING_F_EVENT_IDX,
     VIRTIO_SCSI_F_HOTPLUG,
+    VIRTIO_F_RING_RESET,
     VHOST_INVALID_FEATURE_BIT
 };
 
diff --git a/hw/virtio/vhost-user-fs.c b/hw/virtio/vhost-user-fs.c
index 1c40f42045..dc4014cdef 100644
--- a/hw/virtio/vhost-user-fs.c
+++ b/hw/virtio/vhost-user-fs.c
@@ -32,6 +32,7 @@ static const int user_feature_bits[] = {
     VIRTIO_F_NOTIFY_ON_EMPTY,
     VIRTIO_F_RING_PACKED,
     VIRTIO_F_IOMMU_PLATFORM,
+    VIRTIO_F_RING_RESET,
 
     VHOST_INVALID_FEATURE_BIT
 };
diff --git a/hw/virtio/vhost-user-gpio.c b/hw/virtio/vhost-user-gpio.c
index 677d1c7730..5851cb3bc9 100644
--- a/hw/virtio/vhost-user-gpio.c
+++ b/hw/virtio/vhost-user-gpio.c
@@ -24,6 +24,7 @@ static const int feature_bits[] = {
     VIRTIO_RING_F_INDIRECT_DESC,
     VIRTIO_RING_F_EVENT_IDX,
     VIRTIO_GPIO_F_IRQ,
+    VIRTIO_F_RING_RESET,
     VHOST_INVALID_FEATURE_BIT
 };
 
diff --git a/hw/virtio/vhost-user-i2c.c b/hw/virtio/vhost-user-i2c.c
index 864eba695e..1c9f3d20dc 100644
--- a/hw/virtio/vhost-user-i2c.c
+++ b/hw/virtio/vhost-user-i2c.c
@@ -16,6 +16,7 @@
 
 static const int feature_bits[] = {
     VIRTIO_I2C_F_ZERO_LENGTH_REQUEST,
+    VIRTIO_F_RING_RESET,
     VHOST_INVALID_FEATURE_BIT
 };
 
diff --git a/hw/virtio/vhost-user-rng.c b/hw/virtio/vhost-user-rng.c
index 8b47287875..f9084cde58 100644
--- a/hw/virtio/vhost-user-rng.c
+++ b/hw/virtio/vhost-user-rng.c
@@ -16,6 +16,11 @@
 #include "qemu/error-report.h"
 #include "standard-headers/linux/virtio_ids.h"
 
+static const int feature_bits[] = {
+    VIRTIO_F_RING_RESET,
+    VHOST_INVALID_FEATURE_BIT
+};
+
 static void vu_rng_start(VirtIODevice *vdev)
 {
     VHostUserRNG *rng = VHOST_USER_RNG(vdev);
@@ -106,8 +111,10 @@ static void vu_rng_set_status(VirtIODevice *vdev, uint8_t status)
 static uint64_t vu_rng_get_features(VirtIODevice *vdev,
                                     uint64_t requested_features, Error **errp)
 {
-    /* No feature bits used yet */
-    return requested_features;
+    VHostUserRNG *rng = VHOST_USER_RNG(vdev);
+
+    return vhost_get_features(&rng->vhost_dev, feature_bits,
+                              requested_features);
 }
 
 static void vu_rng_handle_output(VirtIODevice *vdev, VirtQueue *vq)
diff --git a/hw/virtio/vhost-vsock-common.c b/hw/virtio/vhost-vsock-common.c
index 29b9ab4f72..a67a275de2 100644
--- a/hw/virtio/vhost-vsock-common.c
+++ b/hw/virtio/vhost-vsock-common.c
@@ -21,6 +21,7 @@
 
 const int feature_bits[] = {
     VIRTIO_VSOCK_F_SEQPACKET,
+    VIRTIO_F_RING_RESET,
     VHOST_INVALID_FEATURE_BIT
 };
 
diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
index 6811089231..2b4b85d8f8 100644
--- a/net/vhost-vdpa.c
+++ b/net/vhost-vdpa.c
@@ -69,6 +69,7 @@ const int vdpa_feature_bits[] = {
     VIRTIO_NET_F_CTRL_VQ,
     VIRTIO_F_IOMMU_PLATFORM,
     VIRTIO_F_RING_PACKED,
+    VIRTIO_F_RING_RESET,
     VIRTIO_NET_F_RSS,
     VIRTIO_NET_F_HASH_REPORT,
     VIRTIO_NET_F_GUEST_ANNOUNCE,
-- 
2.38.1


