Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 723046203AB
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Nov 2022 00:21:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osAwI-0000f2-6U; Mon, 07 Nov 2022 17:49:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1osAwF-0000ZQ-LB
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 17:49:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1osAwE-0003Um-21
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 17:49:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667861393;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XvXLXZbH32FwhzwswFLnLBocqzfMXY1xZbOkdJP1NMw=;
 b=aLeaPUFZElKyqABqJGXDLZmrLnaw3WUe5Wg6gtPoEBhPvMjbBkGGN/J2Dgysj89glKq2Bf
 TN95kxsC6GSIqYf7Gqnrmz00WoxcRa6vNWEMVERePc3+6+YU8eNHv7sVThB3+dLgbNj/Bg
 t21U8XOKMCMOqJnTdy5DGkWvNLkdp7A=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-647-IBggulmWMK2sSjkV3uEIuQ-1; Mon, 07 Nov 2022 17:49:52 -0500
X-MC-Unique: IBggulmWMK2sSjkV3uEIuQ-1
Received: by mail-qv1-f70.google.com with SMTP id
 z18-20020a0cfed2000000b004bc28af6f7dso8529562qvs.4
 for <qemu-devel@nongnu.org>; Mon, 07 Nov 2022 14:49:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XvXLXZbH32FwhzwswFLnLBocqzfMXY1xZbOkdJP1NMw=;
 b=WpJONjeikUb91QslyKsnhVuEqO6JTpkyihl74d+VzCTNs5Inva1SRgAOTcDQqbp89A
 tGv0WOrgNASQBhy5P6b4CeSIXIOuYD3mLDf+s8UUgymHVjugpIDrldO1SvqF/KQaCeiA
 2EEdhBjrsiJ3cPH0YL3BgfjIe8dA5QtcMRFlqwfSzFkClonIaCxvgcVv77+/tvmM+A8T
 McE6YP+yldYCJL/uvjGbt7EdWSGFHTf5xJKhizClE6elanb2KTd8kfEMuUNBsFGKOKRp
 qypQUgGxi6MSB+LOcX/zbPZeMhI7wyTq61t8miKu+O0SCrGjJ4Wn+tOw5qM75kO9sAXZ
 Bdmg==
X-Gm-Message-State: ACrzQf1t+Uuzt+t6QRLyRf87NfiNDff3ze+6WQ6v+Sj2V6VqClwxt1Kr
 /ooUPPbPOuKfMYLS0CeuHo3Q0vexTL6fINpAPz1elA69QkehGFed9y0WFwApvqo7Z35KYrhAC9t
 eehN6Lja8JNz4/YRuKBTOgzEeXHTwZfdJtKBV8WRLZ1/G2nLrdlpe/1yA57NS
X-Received: by 2002:a05:6214:c21:b0:4ad:75e:93bb with SMTP id
 a1-20020a0562140c2100b004ad075e93bbmr48729710qvd.27.1667861391769; 
 Mon, 07 Nov 2022 14:49:51 -0800 (PST)
X-Google-Smtp-Source: AMsMyM5RAnLaC6QxEraknEzSiz2eheZHvpDELGr9kJNWz42MRLeWLBnK/EMSfcfQy0yeam3iRWebWA==
X-Received: by 2002:a05:6214:c21:b0:4ad:75e:93bb with SMTP id
 a1-20020a0562140c2100b004ad075e93bbmr48729686qvd.27.1667861391444; 
 Mon, 07 Nov 2022 14:49:51 -0800 (PST)
Received: from redhat.com ([87.249.138.11]) by smtp.gmail.com with ESMTPSA id
 bq44-20020a05620a46ac00b006f7ee901674sm7816796qkb.2.2022.11.07.14.49.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Nov 2022 14:49:51 -0800 (PST)
Date: Mon, 7 Nov 2022 17:49:47 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Jason Wang <jasowang@redhat.com>
Subject: [PULL v4 27/83] virtio: introduce __virtio_queue_reset()
Message-ID: <20221107224600.934080-28-mst@redhat.com>
References: <20221107224600.934080-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221107224600.934080-1-mst@redhat.com>
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

From: Xuan Zhuo <xuanzhuo@linux.alibaba.com>

Separate the logic of vq reset. This logic will be called directly
later.

Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Acked-by: Jason Wang <jasowang@redhat.com>
Message-Id: <20221017092558.111082-2-xuanzhuo@linux.alibaba.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/virtio/virtio.c | 37 +++++++++++++++++++++----------------
 1 file changed, 21 insertions(+), 16 deletions(-)

diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index 808446b4c9..6f42fcadd7 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -2464,6 +2464,26 @@ static enum virtio_device_endian virtio_current_cpu_endian(void)
     }
 }
 
+static void __virtio_queue_reset(VirtIODevice *vdev, uint32_t i)
+{
+    vdev->vq[i].vring.desc = 0;
+    vdev->vq[i].vring.avail = 0;
+    vdev->vq[i].vring.used = 0;
+    vdev->vq[i].last_avail_idx = 0;
+    vdev->vq[i].shadow_avail_idx = 0;
+    vdev->vq[i].used_idx = 0;
+    vdev->vq[i].last_avail_wrap_counter = true;
+    vdev->vq[i].shadow_avail_wrap_counter = true;
+    vdev->vq[i].used_wrap_counter = true;
+    virtio_queue_set_vector(vdev, i, VIRTIO_NO_VECTOR);
+    vdev->vq[i].signalled_used = 0;
+    vdev->vq[i].signalled_used_valid = false;
+    vdev->vq[i].notification = true;
+    vdev->vq[i].vring.num = vdev->vq[i].vring.num_default;
+    vdev->vq[i].inuse = 0;
+    virtio_virtqueue_reset_region_cache(&vdev->vq[i]);
+}
+
 void virtio_reset(void *opaque)
 {
     VirtIODevice *vdev = opaque;
@@ -2495,22 +2515,7 @@ void virtio_reset(void *opaque)
     virtio_notify_vector(vdev, vdev->config_vector);
 
     for(i = 0; i < VIRTIO_QUEUE_MAX; i++) {
-        vdev->vq[i].vring.desc = 0;
-        vdev->vq[i].vring.avail = 0;
-        vdev->vq[i].vring.used = 0;
-        vdev->vq[i].last_avail_idx = 0;
-        vdev->vq[i].shadow_avail_idx = 0;
-        vdev->vq[i].used_idx = 0;
-        vdev->vq[i].last_avail_wrap_counter = true;
-        vdev->vq[i].shadow_avail_wrap_counter = true;
-        vdev->vq[i].used_wrap_counter = true;
-        virtio_queue_set_vector(vdev, i, VIRTIO_NO_VECTOR);
-        vdev->vq[i].signalled_used = 0;
-        vdev->vq[i].signalled_used_valid = false;
-        vdev->vq[i].notification = true;
-        vdev->vq[i].vring.num = vdev->vq[i].vring.num_default;
-        vdev->vq[i].inuse = 0;
-        virtio_virtqueue_reset_region_cache(&vdev->vq[i]);
+        __virtio_queue_reset(vdev, i);
     }
 }
 
-- 
MST


