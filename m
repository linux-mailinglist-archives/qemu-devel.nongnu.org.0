Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 960A66202CF
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Nov 2022 23:57:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osAwX-0000oH-TZ; Mon, 07 Nov 2022 17:50:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1osAwO-0000lD-QB
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 17:50:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1osAwN-0003X0-87
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 17:50:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667861402;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/1+QGWngyUk+ROvYsKSqSr0kMzhOMxUWJz6yd4Jq5v0=;
 b=P3xUbGKsqWcUhFbfWt0WBfwWYJkt3ca48NjiaOPPS5rrEHW3T17o2tQpPuXhV/N0RKapK/
 GNBESrzqEoHHNFQ58UUK77W+R1hCyeGkM8yi0qK+xSJQ3GV87BGBHQEVlfBkeKQ8zx3jXw
 64x++DA1pjoePO07lx26HgXwDgc6XMA=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-604-QVcJtJfhO8adIcc0pguqPQ-1; Mon, 07 Nov 2022 17:50:01 -0500
X-MC-Unique: QVcJtJfhO8adIcc0pguqPQ-1
Received: by mail-qv1-f72.google.com with SMTP id
 mi12-20020a056214558c00b004bb63393567so8666685qvb.21
 for <qemu-devel@nongnu.org>; Mon, 07 Nov 2022 14:50:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/1+QGWngyUk+ROvYsKSqSr0kMzhOMxUWJz6yd4Jq5v0=;
 b=OatwnWtI1aNPsXWtMpJEL1MhEX0dk+5Q2rXal403xt8pRzAyiyRJUXNrcqr5uxelYG
 7G34DiTrh9wMy6vGYUixPTzrcwdaXfapj+J//YjHkLsyIHkJ+jILtDZj+V9heGcx+aWB
 ZSA5dP2wxGIOV6Pq+L5Zm1XyU0ebxA1JLk9AMATHkTx6IMdLCrwgz44Tre5GtzRd3lwz
 YkehlnL6q8QklUNtFeyYEwC6AFwgM2BW0sPtn0mykksjv8em5x/94e0s5GLksBzKPT52
 RecmhC2dcMBlwEIb2w8qi94kaftcEzu0Ali3JBZjtsMK4moWZR2ZxQpqgcrFKBvg4NtZ
 Y8RA==
X-Gm-Message-State: ACrzQf3HS6bCgwMl/HZr6hM1GYbQ7ZAzH5pzF5KXKrc+rPeULFMWBCZh
 03hl/YeMhKdoOJ037naIBCZUhKO8fGQC2Tko8TZVUE1I6/b1rOD0ru1DpGHRFhJT0tazJbBaGJT
 mAtvjeXGQDrXY+bECS1H7OB6RYEdEWn1wCN2E05bCj4bl3RngRT+RvjbN18pE
X-Received: by 2002:a05:622a:1491:b0:3a5:74c4:477c with SMTP id
 t17-20020a05622a149100b003a574c4477cmr12006539qtx.505.1667861400632; 
 Mon, 07 Nov 2022 14:50:00 -0800 (PST)
X-Google-Smtp-Source: AMsMyM5rVBqUBX+8KWyi2Jb5Uk8gH3DJ3It3xH8ODDoAmvNbg1/kP2+fPQcDJXQvouLQLdwhvs5utA==
X-Received: by 2002:a05:622a:1491:b0:3a5:74c4:477c with SMTP id
 t17-20020a05622a149100b003a574c4477cmr12006519qtx.505.1667861400318; 
 Mon, 07 Nov 2022 14:50:00 -0800 (PST)
Received: from redhat.com ([87.249.138.11]) by smtp.gmail.com with ESMTPSA id
 w13-20020a05620a444d00b006cbc00db595sm7966770qkp.23.2022.11.07.14.49.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Nov 2022 14:50:00 -0800 (PST)
Date: Mon, 7 Nov 2022 17:49:56 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Kangjie Xu <kangjie.xu@linux.alibaba.com>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Jason Wang <jasowang@redhat.com>
Subject: [PULL v4 29/83] virtio: introduce virtio_queue_enable()
Message-ID: <20221107224600.934080-30-mst@redhat.com>
References: <20221107224600.934080-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221107224600.934080-1-mst@redhat.com>
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
index 74d76c1dbc..b00b3fcf31 100644
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


