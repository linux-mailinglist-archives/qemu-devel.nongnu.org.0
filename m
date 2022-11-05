Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DF8661DCB6
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Nov 2022 18:53:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1orMpT-0007yf-13; Sat, 05 Nov 2022 13:19:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1orMn7-0006pf-8c
 for qemu-devel@nongnu.org; Sat, 05 Nov 2022 13:17:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1orMn5-0007QU-DE
 for qemu-devel@nongnu.org; Sat, 05 Nov 2022 13:17:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667668626;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XvXLXZbH32FwhzwswFLnLBocqzfMXY1xZbOkdJP1NMw=;
 b=bj/XZYM6IEgZUSyzYV0pYrOcwriaj7Eojn6lwJHOo8pQcNbhC3KwaKCgODm37YcGnMBAJ+
 4wAksTYFPY81/pxq3i4F3alJv7STbwcIZFYIZ9bLqJvQBGniI4PSsBNSsIhZeOY9O/ZSS7
 AJ8kz1noxQFlV7V8FclkUD8c/Qs9zh8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-108-SlM_AGJIOfeW-P1aISrdPQ-1; Sat, 05 Nov 2022 13:17:05 -0400
X-MC-Unique: SlM_AGJIOfeW-P1aISrdPQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 j2-20020a05600c1c0200b003cf7397fc9bso3837123wms.5
 for <qemu-devel@nongnu.org>; Sat, 05 Nov 2022 10:17:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XvXLXZbH32FwhzwswFLnLBocqzfMXY1xZbOkdJP1NMw=;
 b=hI8i72DHSNdQMMV9wl1m5OvMeXgj+YjC9RZDq0zrSVV63AVayRX0uClgV51JwepHtF
 JiTcX0hfz0K1jSSPlvnE4E0KwgLUiT/WkDSekXQw6rQweiRkzlpBsvgPk+OKV3GapIzv
 gXCIkBSyaE4KMNFXq/cbL2xdQcnHKH/L2t9d9xENAxrUxpjOPOwF8m6rjiHTMmOdl4FN
 uLtFULLbTXWGSf4jRoyUhJeOcggYn9Q4mAEfWiSwJTRDDXPBnLdPVDfaRuIAo+a3Vi2y
 NKSn5bW8Z5wiGkeXJdSycKxW7bj2b3U+g0UYoMO3nWTfMYiaQ02lZGxqkM71DV6Asmin
 RNzQ==
X-Gm-Message-State: ACrzQf0OwhO2tLw4k+GKCJPShRKQs9t1+Zlq6wM61uj2Z6F8Typzt6pb
 YED5XOYEowX4BdZPycfnhbFprcRZbgZUiVITlUH3xResUtSMYrQDajC3197J6/23d40fOKQ09tW
 x7cKCJyhUvTAalbRqow8rh3AhmaGZZCPHZj9pvRl0fJB0DQEvCj3uZltDw8Tf
X-Received: by 2002:a5d:48ce:0:b0:236:e7d2:f5f0 with SMTP id
 p14-20020a5d48ce000000b00236e7d2f5f0mr16132959wrs.172.1667668624392; 
 Sat, 05 Nov 2022 10:17:04 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6UlbKmMIcpvkbG5FlW0m4Qbje/ZsxDt9TfAdXb14YkQvlzCNjHSWzLMAsJyEkZvNHElWmkDQ==
X-Received: by 2002:a5d:48ce:0:b0:236:e7d2:f5f0 with SMTP id
 p14-20020a5d48ce000000b00236e7d2f5f0mr16132943wrs.172.1667668624126; 
 Sat, 05 Nov 2022 10:17:04 -0700 (PDT)
Received: from redhat.com ([2.52.152.137]) by smtp.gmail.com with ESMTPSA id
 p15-20020a1c544f000000b003cf483ee8e0sm6142210wmi.24.2022.11.05.10.17.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Nov 2022 10:17:03 -0700 (PDT)
Date: Sat, 5 Nov 2022 13:17:01 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Jason Wang <jasowang@redhat.com>
Subject: [PULL v3 32/81] virtio: introduce __virtio_queue_reset()
Message-ID: <20221105171116.432921-33-mst@redhat.com>
References: <20221105171116.432921-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221105171116.432921-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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


