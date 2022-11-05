Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3DC461DCD7
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Nov 2022 18:55:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1orMpT-000812-NU; Sat, 05 Nov 2022 13:19:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1orMnF-0006yN-2N
 for qemu-devel@nongnu.org; Sat, 05 Nov 2022 13:17:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1orMnD-0007SB-DX
 for qemu-devel@nongnu.org; Sat, 05 Nov 2022 13:17:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667668632;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/1+QGWngyUk+ROvYsKSqSr0kMzhOMxUWJz6yd4Jq5v0=;
 b=FHrJv3eSooO9Lym7yHTfaLdfIiZoF+c0V//3A6t1bPb6JaVNuB0dq7k8DGD9/AmSBb5n3Y
 6oJUcxTpVkc7tik2AdvScWiu0bVx9tQf7uqh/+sZSUU7UqXC9AvqXbQ/koN7o2z18FIo0u
 nn3zYVRR1nXDMuae3s1rQVIIRv9tc3M=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-119-4wtu3GPcPOi_kfOhj95f-Q-1; Sat, 05 Nov 2022 13:17:10 -0400
X-MC-Unique: 4wtu3GPcPOi_kfOhj95f-Q-1
Received: by mail-wm1-f72.google.com with SMTP id
 v125-20020a1cac83000000b003cfa148576dso898747wme.3
 for <qemu-devel@nongnu.org>; Sat, 05 Nov 2022 10:17:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/1+QGWngyUk+ROvYsKSqSr0kMzhOMxUWJz6yd4Jq5v0=;
 b=pmaD5Enji+sQDUrWq2saGnLU4uaqnCcKKI0nB6/w/0SYjUGAUjZwwYSTwPjoux4pWS
 q/siBnm8vigXxvbb5iuG26VHdFrP3OamIQ9ExhhLDT0UibOMYDgLxt/VdJBCkaIceiv7
 IMc4wBi2IEnFcWp9Ktl1AqPEkBp/NbWq0HBH0WRramoJS37zxpkep1aegPI4KcDVaHIp
 L82f/7aJoEi1yVRh0QQDq5+Pv1OHdwCsBUDuFc/mxjCb0Jh6HmdmVd9DAG+xwET5ZezF
 hps16W/7DtHeYOBPZ9GFhnyHIXMMp03sLj6h+7Cqab4K7QSb4cFnBk8GQoNttCsjHzez
 LuDg==
X-Gm-Message-State: ACrzQf0mhTy2wV65TxPnXjhK1CdRX7nE/zJN0gfsavxI3zmr9H7mRMYv
 NsaK8bPHEznPar55/puFlQS3AtZ2+h8UkPzJlgIPXd7L1s5UZmqCpHsl/8cYZmmrrXALIZlnEjL
 XKp+iMEOX/w/nMzMEFQokKJNRfDEMlTT47zaGNkytWocs8IpumNREuZQfdTjY
X-Received: by 2002:adf:e3c1:0:b0:236:6d5d:ffa2 with SMTP id
 k1-20020adfe3c1000000b002366d5dffa2mr26075117wrm.557.1667668629450; 
 Sat, 05 Nov 2022 10:17:09 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6w4XiY6+qLdgXfWGFhAxaklDk0IAzg6K3fq0LtdeTvphbbCq19iN0wdoqVMO9gfDaUZUR/Yw==
X-Received: by 2002:adf:e3c1:0:b0:236:6d5d:ffa2 with SMTP id
 k1-20020adfe3c1000000b002366d5dffa2mr26075102wrm.557.1667668629098; 
 Sat, 05 Nov 2022 10:17:09 -0700 (PDT)
Received: from redhat.com ([2.52.152.137]) by smtp.gmail.com with ESMTPSA id
 h18-20020a5d6e12000000b002365730eae8sm2627687wrz.55.2022.11.05.10.17.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Nov 2022 10:17:08 -0700 (PDT)
Date: Sat, 5 Nov 2022 13:17:06 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Kangjie Xu <kangjie.xu@linux.alibaba.com>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Jason Wang <jasowang@redhat.com>
Subject: [PULL v3 34/81] virtio: introduce virtio_queue_enable()
Message-ID: <20221105171116.432921-35-mst@redhat.com>
References: <20221105171116.432921-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221105171116.432921-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.045,
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


