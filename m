Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 531DE61682D
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Nov 2022 17:16:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqGJl-0006b0-VY; Wed, 02 Nov 2022 12:10:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oqGJe-0006Qu-75
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 12:10:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oqGJZ-0002lU-5c
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 12:10:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667405404;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XvXLXZbH32FwhzwswFLnLBocqzfMXY1xZbOkdJP1NMw=;
 b=eWBmpt0uj4G87HRqSRwvRtSa2yDtCFHxeDYqQH2EWMORRQ5pkojOp+H6e4hu4BwDo122zu
 KnAPLr52829wwf1YIAQ1kN2PcxPDwDd8oELNXUqHmYH52P/nJoG5Gh2tqFE47h+7p62OF7
 r3RXw1tN6Lk49ouq4iwpTzdkHeSUKjo=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-653-2qY1aE86MCKlmInh8OkLhw-1; Wed, 02 Nov 2022 12:10:03 -0400
X-MC-Unique: 2qY1aE86MCKlmInh8OkLhw-1
Received: by mail-wm1-f69.google.com with SMTP id
 1-20020a05600c028100b003cf7833293cso1259634wmk.3
 for <qemu-devel@nongnu.org>; Wed, 02 Nov 2022 09:10:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XvXLXZbH32FwhzwswFLnLBocqzfMXY1xZbOkdJP1NMw=;
 b=cM2BrXNKbzgUO9FVa1p36ddL1gcr4XoCmwyrIkVKziId0TliJbTPtiJapel0vdxrF3
 S2IZZJvPv6KRb11LTywtRraTtQs9oyvyKnQ54AWgvutGl2X6MNkf2SqqwOWdS6rfNmbv
 g1A7+vaiUb98TRQji/NScK6YH5NxAgqXR/CbC4v6POv1RU5TraMl01oLBh/vgb3DXlHY
 tRomJWwUhYrxWX9xksH6Al6fTmoJ/6Xdb2vnB0LABYl58U1cpcg7nMlEUubu96/2QAtX
 QgkOTWetXWxdTfvJuSDqQc4ojUTSj9nzFzUng3TdpIaz6N/T67bgqWplZcEe/WguRcJB
 vhXA==
X-Gm-Message-State: ACrzQf3aOnSUbrTvEqQMtNMMDAYF9YRiQvEdyN8jCBhnzGMDYD2+ihjy
 v2e2cYcsaG3ZoSjur1HB54D8azmKMiMHlmJMDY9sI9FDfNnoMLVN+kyQ6bjdT6s+DNaZrMY260C
 OUp5bFIrq5WpHw6JcMkEgxKb+2WW/DQUDWQ/vAxpB/LoGekVVO2UBECNgRQXZ
X-Received: by 2002:a7b:cb49:0:b0:3b4:b08a:89b with SMTP id
 v9-20020a7bcb49000000b003b4b08a089bmr16023333wmj.173.1667405401477; 
 Wed, 02 Nov 2022 09:10:01 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4oym5mdbXO1nKTmDEWY10wPaDCgK8e6WkJprD18WC6cmv0J/BK+w2eQFE9tdZUg8lBnUduCg==
X-Received: by 2002:a7b:cb49:0:b0:3b4:b08a:89b with SMTP id
 v9-20020a7bcb49000000b003b4b08a089bmr16023294wmj.173.1667405401092; 
 Wed, 02 Nov 2022 09:10:01 -0700 (PDT)
Received: from redhat.com ([2.52.15.189]) by smtp.gmail.com with ESMTPSA id
 h3-20020a05600c350300b003c6deb5c1edsm3061448wmq.45.2022.11.02.09.09.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Nov 2022 09:10:00 -0700 (PDT)
Date: Wed, 2 Nov 2022 12:09:58 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Jason Wang <jasowang@redhat.com>
Subject: [PULL v2 35/82] virtio: introduce __virtio_queue_reset()
Message-ID: <20221102160336.616599-36-mst@redhat.com>
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


