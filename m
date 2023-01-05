Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6D5865E7C5
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 10:27:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDMMk-0003i0-7o; Thu, 05 Jan 2023 04:16:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pDMMY-0003VV-UJ
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 04:16:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pDMMX-0007dB-I1
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 04:16:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672910197;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dwzRVI2ztB1zYurY7r7UlysiEcUkeDrm2KTfIAufzmo=;
 b=jI6mXUIap24TbMvEsPyiiuna+Ld+wlVS6yWcMuTRJRICX1BUS3RawiP2V9pAmwgBpyZ6hV
 zmnoGBOYgbKt9/mwhXCtDXx8X96IGOZNImizCwbhKZndBL0gqwl2rDo/BdN9g7r9xnb8Au
 4iX41U5qJOVgN3xtuBHX7bdBltpMZgE=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-336-NHcQmqv3MvWvBOCNxkOnsg-1; Thu, 05 Jan 2023 04:16:35 -0500
X-MC-Unique: NHcQmqv3MvWvBOCNxkOnsg-1
Received: by mail-wm1-f69.google.com with SMTP id
 bd6-20020a05600c1f0600b003d96f7f2396so734165wmb.3
 for <qemu-devel@nongnu.org>; Thu, 05 Jan 2023 01:16:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dwzRVI2ztB1zYurY7r7UlysiEcUkeDrm2KTfIAufzmo=;
 b=HSBUIG00k9n29I1SdFKtZxIKdfv5ETgKsMbDuRQy4LPZhMoomJZJFsUEUq7lbY5GFh
 ugE7o5Nnb0ctUqG1O2NLEjNqvlEaIW7bB7u93pWM6bW3N9DIMrpcnE7JkAkgX9h6P0fk
 4luXkQPRg2x71aJQcgSB1SY60XpCbvXpqE1YYppNGIUz2v3Wc6L0mgHKfluIRmQ1wXWY
 SAiIB4CWfVVD51I5p8RicoWjK8ooLPZH/Tt2ORC68bccIonN/0SXCsLLgO0HyQ08eq5p
 uPpjs56MeqCNjyu6szC5DMGHFMG0mcs/Sx9+eh9ZvDIn2IbFBYZrtooh0kEzAIGQdRFG
 C5zA==
X-Gm-Message-State: AFqh2kor0xn3y1ZzMkdVLW216MStErukSSjrV776DgUUGAaOAhFgGwcr
 Y3ZNyhcko8qaVJZdsmVx0pTUj3psbQJpb8FpGKdjnSuOJMgL0o8ZHH6WZsdI42i6memvPJZZjWN
 xnhJFN31QzM0Mq3/lFcYhWn50CIALhOxgdXI5g1wu0j3ccwri7Hwm/TpssP3F
X-Received: by 2002:a05:600c:4193:b0:3c6:e60f:3f4f with SMTP id
 p19-20020a05600c419300b003c6e60f3f4fmr34725520wmh.6.1672910194302; 
 Thu, 05 Jan 2023 01:16:34 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtcroqHfDALVs/a+ajuC2o7D8BKKs9CVlitclH56P5dzXqwwDgd5QmdkZrB29z5Pm1qiw2Gbw==
X-Received: by 2002:a05:600c:4193:b0:3c6:e60f:3f4f with SMTP id
 p19-20020a05600c419300b003c6e60f3f4fmr34725503wmh.6.1672910194005; 
 Thu, 05 Jan 2023 01:16:34 -0800 (PST)
Received: from redhat.com ([2.52.151.85]) by smtp.gmail.com with ESMTPSA id
 h7-20020a05600c314700b003d973e939d3sm1905349wmo.1.2023.01.05.01.16.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jan 2023 01:16:33 -0800 (PST)
Date: Thu, 5 Jan 2023 04:16:31 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Longpeng <longpeng2@huawei.com>
Subject: [PULL 40/51] vhost: simplify vhost_dev_enable_notifiers
Message-ID: <20230105091310.263867-41-mst@redhat.com>
References: <20230105091310.263867-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230105091310.263867-1-mst@redhat.com>
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

From: Longpeng <longpeng2@huawei.com>

Simplify the error path in vhost_dev_enable_notifiers by using
vhost_dev_disable_notifiers directly.

Signed-off-by: Longpeng <longpeng2@huawei.com>
Message-Id: <20221227072015.3134-2-longpeng2@huawei.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/virtio/vhost.c | 20 ++++----------------
 1 file changed, 4 insertions(+), 16 deletions(-)

diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
index 2c566dc539..87c49fa679 100644
--- a/hw/virtio/vhost.c
+++ b/hw/virtio/vhost.c
@@ -1551,7 +1551,7 @@ void vhost_dev_cleanup(struct vhost_dev *hdev)
 int vhost_dev_enable_notifiers(struct vhost_dev *hdev, VirtIODevice *vdev)
 {
     BusState *qbus = BUS(qdev_get_parent_bus(DEVICE(vdev)));
-    int i, r, e;
+    int i, r;
 
     /* We will pass the notifiers to the kernel, make sure that QEMU
      * doesn't interfere.
@@ -1559,7 +1559,7 @@ int vhost_dev_enable_notifiers(struct vhost_dev *hdev, VirtIODevice *vdev)
     r = virtio_device_grab_ioeventfd(vdev);
     if (r < 0) {
         error_report("binding does not support host notifiers");
-        goto fail;
+        return r;
     }
 
     for (i = 0; i < hdev->nvqs; ++i) {
@@ -1567,24 +1567,12 @@ int vhost_dev_enable_notifiers(struct vhost_dev *hdev, VirtIODevice *vdev)
                                          true);
         if (r < 0) {
             error_report("vhost VQ %d notifier binding failed: %d", i, -r);
-            goto fail_vq;
+            vhost_dev_disable_notifiers(hdev, vdev);
+            return r;
         }
     }
 
     return 0;
-fail_vq:
-    while (--i >= 0) {
-        e = virtio_bus_set_host_notifier(VIRTIO_BUS(qbus), hdev->vq_index + i,
-                                         false);
-        if (e < 0) {
-            error_report("vhost VQ %d notifier cleanup error: %d", i, -r);
-        }
-        assert (e >= 0);
-        virtio_bus_cleanup_host_notifier(VIRTIO_BUS(qbus), hdev->vq_index + i);
-    }
-    virtio_device_release_ioeventfd(vdev);
-fail:
-    return r;
 }
 
 /* Stop processing guest IO notifications in vhost.
-- 
MST


