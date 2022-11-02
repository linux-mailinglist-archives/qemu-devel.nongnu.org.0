Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6378C616840
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Nov 2022 17:18:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqGJw-0007Oa-F4; Wed, 02 Nov 2022 12:10:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oqGJr-0007C6-09
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 12:10:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oqGJj-0002wK-7t
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 12:10:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667405414;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=05dzwNfg7HbBJ5DnJ73Qkx+E7eiNja915s9Il8Q0iOY=;
 b=g8lNYF1XO5CyT7MGEcBRv4Qf0KsvgbzHiQDSlPKRSZ3bRhEZzFnflsnX0i/SqCzQ3LozAr
 PkHIj2bucaWXKpEeVNRlrXpg3vibExrBC6tkt5cMstYmyoXXnZWzTPQLExLETKvRKfzYB4
 bLzZKRh9w6Tla+IDprADU/1r4OwIkHw=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-155-iI-ZuLQPPzeEyt2Y-MsJAg-1; Wed, 02 Nov 2022 12:10:05 -0400
X-MC-Unique: iI-ZuLQPPzeEyt2Y-MsJAg-1
Received: by mail-wm1-f69.google.com with SMTP id
 v23-20020a1cf717000000b003bff630f31aso646396wmh.5
 for <qemu-devel@nongnu.org>; Wed, 02 Nov 2022 09:10:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=05dzwNfg7HbBJ5DnJ73Qkx+E7eiNja915s9Il8Q0iOY=;
 b=NnQNF+Sk64jMhdZVyr7xRGFjk3lVMfC0sCXknbI3HQaBCj+lVzLLOf7zEJYNbaVxh2
 a3Z/5wwrghl9q28GRT1U8/lmuMvx4wsmaGgQ95kN/QwMKzXxD1UNT2EqsFmcDdcHbjG4
 GfK1w0ftX+8rj0iPfYUK0JKWENh5GZUw/jaLk40lZ5MBle1p6kwHJ4tg8UzGnoh/TCWQ
 ERB5/9arrDFxQImp+FFC7zJbBV5s3OUm8tng6a+C+veiseoZosw+AapTCyTNYnL4m81s
 Kw7ySC+02e/lBNG1rb/zJeF1I8BFLmocNnns6PHs3rMJiFHrHeJNHn+tR92pso0nWJIi
 qZlg==
X-Gm-Message-State: ACrzQf0mxI/nZabblQoNDMK2ELgVYoa6bh9S/01eZmMOi8WQ+n243Kka
 Pj7Ap22PB6Foc64uIiziPz9wR5o6BgGJbs20Uy9y3bTc55dH/LJl85sYk1JuNzr/AnSIuusV6Eg
 SbHrfD1XrKTr//xFJoQUQg/myqzjbcH7fNLEm8WxY+XVV/kWLZOv7QNSvh0lN
X-Received: by 2002:a5d:6a08:0:b0:236:e06b:ec19 with SMTP id
 m8-20020a5d6a08000000b00236e06bec19mr6897462wru.150.1667405404242; 
 Wed, 02 Nov 2022 09:10:04 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7u5zf9/uolrZtOS5jFeGfiHf07wZwxIub/JiMn7EwBq6rYXzdvWGriru1ZdCl3D9X/YpzB6A==
X-Received: by 2002:a5d:6a08:0:b0:236:e06b:ec19 with SMTP id
 m8-20020a5d6a08000000b00236e06bec19mr6897429wru.150.1667405403897; 
 Wed, 02 Nov 2022 09:10:03 -0700 (PDT)
Received: from redhat.com ([2.52.15.189]) by smtp.gmail.com with ESMTPSA id
 v7-20020a05600c444700b003c70191f267sm2799519wmn.39.2022.11.02.09.10.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Nov 2022 09:10:03 -0700 (PDT)
Date: Wed, 2 Nov 2022 12:10:01 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Jason Wang <jasowang@redhat.com>
Subject: [PULL v2 36/82] virtio: introduce virtio_queue_reset()
Message-ID: <20221102160336.616599-37-mst@redhat.com>
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
index ebb58feaac..b4c237201d 100644
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


