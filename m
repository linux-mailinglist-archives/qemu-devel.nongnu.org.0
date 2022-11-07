Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E97F6203AD
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Nov 2022 00:22:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osAwR-0000k7-Eq; Mon, 07 Nov 2022 17:50:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1osAwJ-0000hf-W3
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 17:50:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1osAwI-0003VU-Fq
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 17:49:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667861398;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NZGu6mZymcXJ37zfWS1UhYBl5zXTWFn3Wk/fHKtTf4w=;
 b=TDTk3WUUviVmMpkNV0n2eK1K0d4FW6ZRjEdYG3dt4k78Z5SgywKoOOouG2BY/wRbPRFzWs
 kFDX1TKKITY/3xLZzyrn7+QewpiVVyTL0Lj7U5UVGV0ZFp6L6sryyWp2EyQb8oE3EBFYJ8
 RICGQ8ph/OiRqW3rTCCNy+z/kWgf4qw=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-550-0Rbr21gHMoyUqRkAP7XOpw-1; Mon, 07 Nov 2022 17:49:57 -0500
X-MC-Unique: 0Rbr21gHMoyUqRkAP7XOpw-1
Received: by mail-qv1-f71.google.com with SMTP id
 mb6-20020a056214550600b004bc0f14f7b2so8505150qvb.2
 for <qemu-devel@nongnu.org>; Mon, 07 Nov 2022 14:49:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NZGu6mZymcXJ37zfWS1UhYBl5zXTWFn3Wk/fHKtTf4w=;
 b=M5iQNFoOtwQ6Fq6kAvPWYyrhBIg54zD/IOiMfRN7Abg1B9sgqjoMMtsKeQqO6QmG4B
 fG39Cx+c6Ri9ou1ZYQRfZW+fJo3flJZ1WV93WoI2pz3qt9HbkKUPuCLotO6IunH08JTd
 OVZIHMnwozSnazPS5jCaW3hEDD/SPFOCpxkr9X0kiyFri1YMhOhXW/K3WxKnPcPb+W/f
 TsUHgPdz8qvDy/yCogzrkxADRzbCbL622D38MJywOLVarGL2SYURLagQ6ZO8KpH9D8UV
 KbgS0GkySdTK82r42RHLykk3+4cBUqXIRgIQC9NWE+Xfc1ejknrswkf7yMoaRufxUnm9
 TdsQ==
X-Gm-Message-State: ACrzQf3PzafMTa+5Vohc06RkNMPnMsFO8bi1ThjPMgkk3I433lfgj6dW
 SDIAcwesQqh3fnMJFFeSaBp1zDwS67X+NCtKBhg9V9zjJvasJdmRSpSqGD9qOEmQIRkund0Dvxu
 YYd4JFgjCqBe2K7rEWMQcdIJcjKMAik2eI421mnrDciKRmgZUzWKh/f/gWbHs
X-Received: by 2002:a0c:e512:0:b0:4bb:95ea:d6d with SMTP id
 l18-20020a0ce512000000b004bb95ea0d6dmr47402668qvm.72.1667861396390; 
 Mon, 07 Nov 2022 14:49:56 -0800 (PST)
X-Google-Smtp-Source: AMsMyM7ZPM4atfHIx0+N25s5G6cqB5TybpCfWGxxqufu7576yXgtflcIk9j8hmeMGAY9rs9H43w63Q==
X-Received: by 2002:a0c:e512:0:b0:4bb:95ea:d6d with SMTP id
 l18-20020a0ce512000000b004bb95ea0d6dmr47402650qvm.72.1667861396017; 
 Mon, 07 Nov 2022 14:49:56 -0800 (PST)
Received: from redhat.com ([87.249.138.11]) by smtp.gmail.com with ESMTPSA id
 bx12-20020a05622a090c00b0039c7b9522ecsm7044759qtb.35.2022.11.07.14.49.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Nov 2022 14:49:55 -0800 (PST)
Date: Mon, 7 Nov 2022 17:49:51 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Jason Wang <jasowang@redhat.com>
Subject: [PULL v4 28/83] virtio: introduce virtio_queue_reset()
Message-ID: <20221107224600.934080-29-mst@redhat.com>
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


