Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 038C561DC62
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Nov 2022 18:24:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1orMqC-0000TS-K7; Sat, 05 Nov 2022 13:20:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1orMnT-00074E-3H
 for qemu-devel@nongnu.org; Sat, 05 Nov 2022 13:17:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1orMnQ-0007Ut-HP
 for qemu-devel@nongnu.org; Sat, 05 Nov 2022 13:17:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667668647;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=iblFjKpaXIHtiQIUGFA8gXnv2AWbCgLXsgXlMDiv4m8=;
 b=K4AXTtK6JZPFLoJj9V1VsLisGxKrbUlHSu127eesR/8kNw8ngRhFdOr+/Afp5TIzfzbWkk
 IekpvK9K5wPKa9AQWhn0nFMxVKjnOb+5HEReqU0yaiAlB0tELpcenxBB/eBfQu8tRiBsHR
 snkTKtO6JezTGZhA8mYjp3hqtdMkPJQ=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-56-adceIjbqM_q1tWZo5_EUjQ-1; Sat, 05 Nov 2022 13:17:25 -0400
X-MC-Unique: adceIjbqM_q1tWZo5_EUjQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 ay19-20020a05600c1e1300b003cf758f1617so5237620wmb.5
 for <qemu-devel@nongnu.org>; Sat, 05 Nov 2022 10:17:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iblFjKpaXIHtiQIUGFA8gXnv2AWbCgLXsgXlMDiv4m8=;
 b=eIP6vG0FkuIU8WY5DMCJcfsPgKGecJAqW6stJ/ne8n5nNJ8w9UuaAzzRyiR3Qjdwpx
 ir+9fOeRz1pqcvIpR0UFhATIidGwu9EJduDxYxpUbyJCxDpt1ECYiJWHAF7mwlQIrxxt
 fxZGFnf5Hz1h/Bg70iW8MYR5RjBzpWtB8KJNxTC7jYaIOMod91YyD/QAV0iITI8Sjsa5
 8hS/OFWioE7IJ8OqiLAzuGB293FDe9OJzkhp5uoEqM/567Kyl3MMceDlF6fT5jjEKHKD
 UPcmgg45L/lze0BCyDf21upwQoaW3RFZuAjj95MU7INEtRN0OutbsjYEV/4CXgysgRkC
 TndQ==
X-Gm-Message-State: ACrzQf2ypDRdzxutfzr7O2YTIyaU9elkLgXh4cUUXOlIomUYh4eGf6Xz
 n034sjOgTOrk/cWLz3k9LXIUjOEIF68AFTcC2Ybc2cqJ3oAEZmDlU7RwgphnO1nzG5G7vrTr7Uv
 9gvu0Q4sQlEinIj/xlYo6ONqrrLtOjgr7y8t8S5Cgwwy1PMDtJKX9i3suJctX
X-Received: by 2002:adf:f38b:0:b0:236:6eca:d9e4 with SMTP id
 m11-20020adff38b000000b002366ecad9e4mr27179697wro.436.1667668644472; 
 Sat, 05 Nov 2022 10:17:24 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM60g9AYaJehhB5g4JoP0EnvPgntECenz6/eaCG5lvxNtbgxnsVzYcrhNMHUTKk8KuBVyj2iWQ==
X-Received: by 2002:adf:f38b:0:b0:236:6eca:d9e4 with SMTP id
 m11-20020adff38b000000b002366ecad9e4mr27179683wro.436.1667668644230; 
 Sat, 05 Nov 2022 10:17:24 -0700 (PDT)
Received: from redhat.com ([2.52.152.137]) by smtp.gmail.com with ESMTPSA id
 h1-20020adffd41000000b0022da3977ec5sm2528046wrs.113.2022.11.05.10.17.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Nov 2022 10:17:23 -0700 (PDT)
Date: Sat, 5 Nov 2022 13:17:21 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Kangjie Xu <kangjie.xu@linux.alibaba.com>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Jason Wang <jasowang@redhat.com>
Subject: [PULL v3 39/81] vhost: expose vhost_virtqueue_stop()
Message-ID: <20221105171116.432921-40-mst@redhat.com>
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

From: Kangjie Xu <kangjie.xu@linux.alibaba.com>

Expose vhost_virtqueue_stop(), we need to use it when resetting a
virtqueue.

Signed-off-by: Kangjie Xu <kangjie.xu@linux.alibaba.com>
Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Acked-by: Jason Wang <jasowang@redhat.com>
Message-Id: <20221017092558.111082-9-xuanzhuo@linux.alibaba.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/virtio/vhost.h | 2 ++
 hw/virtio/vhost.c         | 8 ++++----
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/include/hw/virtio/vhost.h b/include/hw/virtio/vhost.h
index 0054a695dc..353252ac3e 100644
--- a/include/hw/virtio/vhost.h
+++ b/include/hw/virtio/vhost.h
@@ -299,6 +299,8 @@ int vhost_device_iotlb_miss(struct vhost_dev *dev, uint64_t iova, int write);
 
 int vhost_virtqueue_start(struct vhost_dev *dev, struct VirtIODevice *vdev,
                           struct vhost_virtqueue *vq, unsigned idx);
+void vhost_virtqueue_stop(struct vhost_dev *dev, struct VirtIODevice *vdev,
+                          struct vhost_virtqueue *vq, unsigned idx);
 
 void vhost_dev_reset_inflight(struct vhost_inflight *inflight);
 void vhost_dev_free_inflight(struct vhost_inflight *inflight);
diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
index 788d0a0679..d1c4c20b8c 100644
--- a/hw/virtio/vhost.c
+++ b/hw/virtio/vhost.c
@@ -1201,10 +1201,10 @@ fail_alloc_desc:
     return r;
 }
 
-static void vhost_virtqueue_stop(struct vhost_dev *dev,
-                                    struct VirtIODevice *vdev,
-                                    struct vhost_virtqueue *vq,
-                                    unsigned idx)
+void vhost_virtqueue_stop(struct vhost_dev *dev,
+                          struct VirtIODevice *vdev,
+                          struct vhost_virtqueue *vq,
+                          unsigned idx)
 {
     int vhost_vq_index = dev->vhost_ops->vhost_get_vq_index(dev, idx);
     struct vhost_vring_state state = {
-- 
MST


