Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 789B261371F
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 13:56:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opUHz-0007xj-4L; Mon, 31 Oct 2022 08:53:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1opUHO-000481-TF
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 08:52:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1opUHN-0002iB-2s
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 08:52:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667220755;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XvXLXZbH32FwhzwswFLnLBocqzfMXY1xZbOkdJP1NMw=;
 b=GcTJkRm0lIgjqxP+mZnQ5MUypbMUTE5T7V+UXU18P8eyhBuc+2lDDB35rNrdyliOZNUWcq
 kLuGZD1/L774eybbs1ZRKmwCBUgwxjTSdSC2+DtFv0NULS1TN4SrQbJeISutbYdVxNTvby
 QQ88A4lYKI+6uZOfX3qadSrGEGUjgI8=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-595-3cxeGDYFPVikvFOffACa5g-1; Mon, 31 Oct 2022 08:52:34 -0400
X-MC-Unique: 3cxeGDYFPVikvFOffACa5g-1
Received: by mail-wr1-f70.google.com with SMTP id
 d23-20020adfa417000000b002364a31b7c9so3018242wra.15
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 05:52:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XvXLXZbH32FwhzwswFLnLBocqzfMXY1xZbOkdJP1NMw=;
 b=b+JzloprEDRcdxIL+sxCxcmPxODxi0IQLWWB0OMJAd0jI+aFT56JnoIosiv5zqKUDE
 O+5pjWrBsAXcSgD4beinOFBfn8BFv6VQpWT1KSxn6/uBJ3sOVQ76sJRHvsAGnuWhpqBx
 BeUWrRsEbAK+WX9hThjxmROY7mmsQjL8g34Utn86ZeI3KF3CNB6LRE22ADRKhfkNPgrT
 RLkEytkGdtgUPO/eRCsho7h9XR+le0GB5Z52J+hT9U9XGmB00Dw3+iLn4oElqRTEwNUY
 u6LhLOYwGqu7tfQy7UPgrK39YaENbfY5IjbhHoAFo9rqi+2kKdxtElpNbF+35pmxxXVJ
 e5Ww==
X-Gm-Message-State: ACrzQf3qy4Plncx7mY/Wza6yiwx31TCftbBuYeSZWqW7yA1ZEonmIxMA
 djP9NIyN6cJJBL0aBI0huaAV0EfOMY+ZLMOvqDtpScrhepXEW//CgNNzhyPG4ZMRNW95z85A4Yl
 ZAyEYsHzZd7vxYx1whRT5lPfCs3IKJPo6POLGaA+Cy91rhg+T60yyJufXWz5E
X-Received: by 2002:a1c:3b87:0:b0:3cf:5d41:bf27 with SMTP id
 i129-20020a1c3b87000000b003cf5d41bf27mr9873718wma.16.1667220752385; 
 Mon, 31 Oct 2022 05:52:32 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5UJQ3xjSXw7yG7nWaaiCHjfZGXy6PoQdrCM5uf60F5tLevTC3k5gJCKrhwt6jB6hwOrZgdTQ==
X-Received: by 2002:a1c:3b87:0:b0:3cf:5d41:bf27 with SMTP id
 i129-20020a1c3b87000000b003cf5d41bf27mr9873697wma.16.1667220752061; 
 Mon, 31 Oct 2022 05:52:32 -0700 (PDT)
Received: from redhat.com ([2.52.15.189]) by smtp.gmail.com with ESMTPSA id
 i11-20020a1c540b000000b003a3442f1229sm7216084wmb.29.2022.10.31.05.52.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Oct 2022 05:52:31 -0700 (PDT)
Date: Mon, 31 Oct 2022 08:52:29 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Jason Wang <jasowang@redhat.com>
Subject: [PULL 37/86] virtio: introduce __virtio_queue_reset()
Message-ID: <20221031124928.128475-38-mst@redhat.com>
References: <20221031124928.128475-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221031124928.128475-1-mst@redhat.com>
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

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


