Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75BA561DC70
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Nov 2022 18:28:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1orMpU-000838-EV; Sat, 05 Nov 2022 13:19:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1orMnA-0006wj-KQ
 for qemu-devel@nongnu.org; Sat, 05 Nov 2022 13:17:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1orMn8-0007Rw-5Z
 for qemu-devel@nongnu.org; Sat, 05 Nov 2022 13:17:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667668629;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NZGu6mZymcXJ37zfWS1UhYBl5zXTWFn3Wk/fHKtTf4w=;
 b=XUkdAThI49HsOdmz3zK8Dg8sfYvIkNbdjfCycXC1RSvIFmqGByP2otNRRUnlo+OPOz5BNK
 WHFqI087LyGoJWq7bnWCiL5bhrsjghxcVuLoPGOh6HbdEQwazm0q/84WCcXQnPx5HeUSHZ
 eY6UvoSyfike0kxHEIiSf2ROMNPQNNw=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-57-pG0mej7LP5q4hLu6VrgFhQ-1; Sat, 05 Nov 2022 13:17:08 -0400
X-MC-Unique: pG0mej7LP5q4hLu6VrgFhQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 c5-20020a1c3505000000b003c56da8e894so6016969wma.0
 for <qemu-devel@nongnu.org>; Sat, 05 Nov 2022 10:17:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NZGu6mZymcXJ37zfWS1UhYBl5zXTWFn3Wk/fHKtTf4w=;
 b=ILLrEbJynfWGoD/IY/Gwkt4fUP0Uo0xuhF955uicVLbXVU5GMOITamN/d2fNE3J9u+
 kpCYfXDPPQTsV6KkkfhaiXq/hChWH/NvSZsaK1ZX2B8TdrR57bG7TX7I0gnrgfhCTOLd
 xOrjjnUO6tegoZW+8ExsassNYL1soLQB/Oi/iFNPZvJ7NNluxacflRSD25yTgwIzApK6
 v+eFnydcyK7g7TBAkF9CiDMHD0Yni7GrsnOY7Jq6/Jfa3A9AK2dxf74PMlq3OnuTkMal
 2QhFoxIpWE7KIDQqGDqDIGo0CobZizk2ifCJmZN1Wc0xgwV5K7QviL25WXFRwdyC8hsR
 sVvg==
X-Gm-Message-State: ACrzQf3769sMCXISNff90iyJ4ekVvah9pDxYnZ6tJ7kFoIL8t99JZ++2
 N9XVjThqqPi7Ap/7+khriydixk+8ENbC6Cp+pxD8iDTtCGMjIJc9j7Z8j/uijHy8bxLYlOTMiCA
 Z7S3JmCN1X6JNaj2FuEvYnkPEZRVks8QAX+MfxMWLl43MH+MjaVcwwjdxpvE+
X-Received: by 2002:a5d:6145:0:b0:236:a948:9e35 with SMTP id
 y5-20020a5d6145000000b00236a9489e35mr25446361wrt.185.1667668626996; 
 Sat, 05 Nov 2022 10:17:06 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM63nLOyM1mGdDSmsG/UYfhQtbMh1tU1SYPb01rao3bTiXfM+pv2WX3hLusmyFg5vTAYrEL/vg==
X-Received: by 2002:a5d:6145:0:b0:236:a948:9e35 with SMTP id
 y5-20020a5d6145000000b00236a9489e35mr25446349wrt.185.1667668626700; 
 Sat, 05 Nov 2022 10:17:06 -0700 (PDT)
Received: from redhat.com ([2.52.152.137]) by smtp.gmail.com with ESMTPSA id
 k25-20020a5d5259000000b0022cc3e67fc5sm2626203wrc.65.2022.11.05.10.17.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Nov 2022 10:17:06 -0700 (PDT)
Date: Sat, 5 Nov 2022 13:17:04 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Jason Wang <jasowang@redhat.com>
Subject: [PULL v3 33/81] virtio: introduce virtio_queue_reset()
Message-ID: <20221105171116.432921-34-mst@redhat.com>
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

From: Xuan Zhuo <xuanzhuo@linux.alibaba.com>

Introduce a new interface function virtio_queue_reset() to implement
reset for vq.

Add a new callback to VirtioDeviceClass for queue reset operation for
each child device.

Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Acked-by: Jason Wang <jasowang@redhat.com>
Message-Id: <20221017092558.111082-3-xuanzhuo@linux.alibaba.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/virtio/virtio.h |  2 ++
 hw/virtio/virtio.c         | 11 +++++++++++
 2 files changed, 13 insertions(+)

diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
index f41b4a7e64..74d76c1dbc 100644
--- a/include/hw/virtio/virtio.h
+++ b/include/hw/virtio/virtio.h
@@ -148,6 +148,7 @@ struct VirtioDeviceClass {
     void (*set_config)(VirtIODevice *vdev, const uint8_t *config);
     void (*reset)(VirtIODevice *vdev);
     void (*set_status)(VirtIODevice *vdev, uint8_t val);
+    void (*queue_reset)(VirtIODevice *vdev, uint32_t queue_index);
     /* For transitional devices, this is a bitmap of features
      * that are only exposed on the legacy interface but not
      * the modern one.
@@ -286,6 +287,7 @@ int virtio_queue_set_host_notifier_mr(VirtIODevice *vdev, int n,
                                       MemoryRegion *mr, bool assign);
 int virtio_set_status(VirtIODevice *vdev, uint8_t val);
 void virtio_reset(void *opaque);
+void virtio_queue_reset(VirtIODevice *vdev, uint32_t queue_index);
 void virtio_update_irq(VirtIODevice *vdev);
 int virtio_set_features(VirtIODevice *vdev, uint64_t val);
 
diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index 6f42fcadd7..cf5f9ca387 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -2484,6 +2484,17 @@ static void __virtio_queue_reset(VirtIODevice *vdev, uint32_t i)
     virtio_virtqueue_reset_region_cache(&vdev->vq[i]);
 }
 
+void virtio_queue_reset(VirtIODevice *vdev, uint32_t queue_index)
+{
+    VirtioDeviceClass *k = VIRTIO_DEVICE_GET_CLASS(vdev);
+
+    if (k->queue_reset) {
+        k->queue_reset(vdev, queue_index);
+    }
+
+    __virtio_queue_reset(vdev, queue_index);
+}
+
 void virtio_reset(void *opaque)
 {
     VirtIODevice *vdev = opaque;
-- 
MST


