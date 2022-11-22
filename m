Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8166B6339FD
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Nov 2022 11:24:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxQRG-0008HP-OC; Tue, 22 Nov 2022 05:23:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oxQRB-0008Fo-QL
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 05:23:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oxQR9-0004kN-SR
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 05:23:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669112611;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=eDwgZDiyyCgip4i0+7/CBveDv0WhKC1DL4TSrg/EZuY=;
 b=iy+pgOpgBqFEoUUmMZ8Lzc9zyo31xLynKqeeA9Sse0YSBlHD6pt3kXpvsSO5TWaYO9HSkX
 ZJacN63CupED/P1I6FLlGrrA6dxkygyJvJXV5sOjd2qaDf9lJIuKj9q8TpFQJ/gKq5qZa0
 5suOGGkBht9uxEpp/x9blx/+51Bta1g=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-333-gkW-RjpaPMe9MFK6iYBFEw-1; Tue, 22 Nov 2022 05:23:29 -0500
X-MC-Unique: gkW-RjpaPMe9MFK6iYBFEw-1
Received: by mail-wr1-f72.google.com with SMTP id
 v12-20020adfa1cc000000b00236eaee7197so4084389wrv.0
 for <qemu-devel@nongnu.org>; Tue, 22 Nov 2022 02:23:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eDwgZDiyyCgip4i0+7/CBveDv0WhKC1DL4TSrg/EZuY=;
 b=p1ZnsfHQ48uuClalNv8hNqdIsiySS/coCf6I4xxPn6lWmLxgUTjv41wkiIghIEdmzt
 y5rJOHI58HXmIYxFPrzdZU+gE8Uj6rPS5dpFfSQsxu5CY6vX4naVnWb4J+C0rfCmkaBl
 YYLuTwNl42imPo/Jrn82q7AbunzLsY3tkmb8xSPONv+4lzYp24Ys5E5Dc/deHj3ErSJB
 RQSn+k4VxMBrZZLVBQwDZnKN33Hg/YUz0hie68mmfbfBefqyYi/stSmaBaiXqsgPeN5E
 y9s9OjPLdF7blyJFvRoM561O5f8YRp8i8ywBKMhhjNoiWR7tEadssa9AysZYsoCrvZg4
 7m+w==
X-Gm-Message-State: ANoB5pmE3f3NfSMmylugyiYHEk45wlvyN9V6aNXwBkvIfWhUsVJ1jKR8
 Mqs/watcAksOJU5fbRKsD01NNUCtUu1fWlz7RXdr55WnlToTBmrebyzqzh/z057N2Rtej0NFQE/
 4KNO/yMedDaE0BliRxWa7C/tUmWonhc9OGbqXNm5uLZsVD8NmH2Hes8Rx5rSw
X-Received: by 2002:adf:f843:0:b0:241:bcae:987f with SMTP id
 d3-20020adff843000000b00241bcae987fmr2146924wrq.619.1669112607090; 
 Tue, 22 Nov 2022 02:23:27 -0800 (PST)
X-Google-Smtp-Source: AA0mqf70kDhutNVllYbMaYJcYdCjWeQ8Pw9+qf6vczFGSIJ2h3RIhE4TIr0Kc+OVL5zDt3hlgUuOEw==
X-Received: by 2002:adf:f843:0:b0:241:bcae:987f with SMTP id
 d3-20020adff843000000b00241bcae987fmr2146880wrq.619.1669112606658; 
 Tue, 22 Nov 2022 02:23:26 -0800 (PST)
Received: from redhat.com ([2.52.21.254]) by smtp.gmail.com with ESMTPSA id
 e13-20020a5d500d000000b0022cc6b8df5esm13741575wrt.7.2022.11.22.02.23.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Nov 2022 02:23:26 -0800 (PST)
Date: Tue, 22 Nov 2022 05:23:23 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Jason Wang <jasowang@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Fam Zheng <fam@euphon.net>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, qemu-block@nongnu.org,
 virtio-fs@redhat.com
Subject: [PULL 1/8] vhost: mask VIRTIO_F_RING_RESET for vhost and vhost-user
 devices
Message-ID: <20221122102227.6603-2-mst@redhat.com>
References: <20221122102227.6603-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221122102227.6603-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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

From: Stefano Garzarella <sgarzare@redhat.com>

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
Message-Id: <20221121101101.29400-1-sgarzare@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Acked-by: Raphael Norwitz <raphael.norwitz@nutanix.com>
Acked-by: Jason Wang <jasowang@redhat.com>
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
MST


