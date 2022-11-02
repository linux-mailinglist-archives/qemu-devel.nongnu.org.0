Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9920F616737
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Nov 2022 17:10:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqGJp-0006yL-Br; Wed, 02 Nov 2022 12:10:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oqGJi-0006aQ-Fs
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 12:10:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oqGJf-0002uJ-Bd
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 12:10:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667405409;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VO3BBxO0X5ks5yU4onVcXc3gcZDPjGyyspfwJYAFCtU=;
 b=Z+yR2hjVeg2weCM5I1GoG8RRqMzf5fm6uY4e5+BGkxQoUgRnwunbmTuzqg6HOoOd6+Pft2
 /UufMJyPUn86q87qAXN3krBb1M6mha+Z3w+OLqNUuIrWRtoZa7sGkdvv84JeoUIUlrvALB
 Dz5ZPrcGYVqohRCnjAxTDpC6p0U5KLg=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-251-jssK9jahOu6Jo9mCPyZa4g-1; Wed, 02 Nov 2022 12:10:08 -0400
X-MC-Unique: jssK9jahOu6Jo9mCPyZa4g-1
Received: by mail-wr1-f71.google.com with SMTP id
 d23-20020adfa417000000b002364a31b7c9so5013080wra.15
 for <qemu-devel@nongnu.org>; Wed, 02 Nov 2022 09:10:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VO3BBxO0X5ks5yU4onVcXc3gcZDPjGyyspfwJYAFCtU=;
 b=r6gKzUd6Ti8viO2uiJwC5ojSDtJRbt/hW77hvia6O4uzxQWtS1kdGDPhorEJPlo4k5
 1E8hpRcsZ+bKlKNv8dNLZ0XFFZTOOSax0uzNTLttk0AQxwKZG8PstL37JoKN0lyuYjQB
 b8gopyVceuL8VS2pze4uf4E/Ssqy1oi4phcRSjdlhbOa51D6a23tKoYdBTqJhYh6ND14
 gx/HfigJwVdygDhe43qDLhEsFH6CKh9a7bCfE5+up936ahRKgTfq4eprxyqUBsCAfI8W
 RED06vZbMWeUCdWiXf7PINx3r5TxTAov6L64HxcZrKEiQQDrFuoZGw2wN86AD/LjOnPi
 8cxw==
X-Gm-Message-State: ACrzQf1HZTyAERfUdLAbAxMcC/EqWJt4GQqhdl2WZXQMK1+nIAF0y9bb
 voASaSuVMEqFUGrUj49Pzx5H2LJQi+lZ9D+AuEZ4nhE2FwToOGfo1O3HihWEOe0QSGLl/+OBPOM
 gq/mq90uElctjTeN0uuR7OlQX6uJtFolqxzQWCiB7cPq1QBVe7bQeRWJoNqfW
X-Received: by 2002:a1c:2743:0:b0:3b3:f017:f23a with SMTP id
 n64-20020a1c2743000000b003b3f017f23amr27472917wmn.137.1667405406969; 
 Wed, 02 Nov 2022 09:10:06 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5S7R8dDuViktHi995cvLc9G3RC39argiKDAjx5hCTTWTKoBTa47iLjTu2QD3jfLfPrG4SouQ==
X-Received: by 2002:a1c:2743:0:b0:3b3:f017:f23a with SMTP id
 n64-20020a1c2743000000b003b3f017f23amr27472880wmn.137.1667405406659; 
 Wed, 02 Nov 2022 09:10:06 -0700 (PDT)
Received: from redhat.com ([2.52.15.189]) by smtp.gmail.com with ESMTPSA id
 bs14-20020a056000070e00b0023647841c5bsm13474730wrb.60.2022.11.02.09.10.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Nov 2022 09:10:06 -0700 (PDT)
Date: Wed, 2 Nov 2022 12:10:04 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Kangjie Xu <kangjie.xu@linux.alibaba.com>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Jason Wang <jasowang@redhat.com>
Subject: [PULL v2 37/82] virtio: introduce virtio_queue_enable()
Message-ID: <20221102160336.616599-38-mst@redhat.com>
References: <20221102160336.616599-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221102160336.616599-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.048,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Kangjie Xu <kangjie.xu@linux.alibaba.com>

Introduce the interface queue_enable() in VirtioDeviceClass and the
fucntion virtio_queue_enable() in virtio, it can be called when
VIRTIO_PCI_COMMON_Q_ENABLE is written and related virtqueue can be
started. It only supports the devices of virtio 1 or later. The
not-supported devices can only start the virtqueue when DRIVER_OK.

Signed-off-by: Kangjie Xu <kangjie.xu@linux.alibaba.com>
Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Acked-by: Jason Wang <jasowang@redhat.com>
Message-Id: <20221017092558.111082-4-xuanzhuo@linux.alibaba.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/virtio/virtio.h |  2 ++
 hw/virtio/virtio.c         | 14 ++++++++++++++
 2 files changed, 16 insertions(+)

diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
index b4c237201d..5cd7861aeb 100644
--- a/include/hw/virtio/virtio.h
+++ b/include/hw/virtio/virtio.h
@@ -149,6 +149,7 @@ struct VirtioDeviceClass {
     void (*reset)(VirtIODevice *vdev);
     void (*set_status)(VirtIODevice *vdev, uint8_t val);
     void (*queue_reset)(VirtIODevice *vdev, uint32_t queue_index);
+    void (*queue_enable)(VirtIODevice *vdev, uint32_t queue_index);
     /* For transitional devices, this is a bitmap of features
      * that are only exposed on the legacy interface but not
      * the modern one.
@@ -288,6 +289,7 @@ int virtio_queue_set_host_notifier_mr(VirtIODevice *vdev, int n,
 int virtio_set_status(VirtIODevice *vdev, uint8_t val);
 void virtio_reset(void *opaque);
 void virtio_queue_reset(VirtIODevice *vdev, uint32_t queue_index);
+void virtio_queue_enable(VirtIODevice *vdev, uint32_t queue_index);
 void virtio_update_irq(VirtIODevice *vdev);
 int virtio_set_features(VirtIODevice *vdev, uint64_t val);
 
diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index cf5f9ca387..9683b2e158 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -2495,6 +2495,20 @@ void virtio_queue_reset(VirtIODevice *vdev, uint32_t queue_index)
     __virtio_queue_reset(vdev, queue_index);
 }
 
+void virtio_queue_enable(VirtIODevice *vdev, uint32_t queue_index)
+{
+    VirtioDeviceClass *k = VIRTIO_DEVICE_GET_CLASS(vdev);
+
+    if (!virtio_vdev_has_feature(vdev, VIRTIO_F_VERSION_1)) {
+        error_report("queue_enable is only suppported in devices of virtio "
+                     "1.0 or later.");
+    }
+
+    if (k->queue_enable) {
+        k->queue_enable(vdev, queue_index);
+    }
+}
+
 void virtio_reset(void *opaque)
 {
     VirtIODevice *vdev = opaque;
-- 
MST


