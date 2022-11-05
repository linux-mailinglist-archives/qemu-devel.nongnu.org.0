Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2249361DC7A
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Nov 2022 18:29:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1orMqB-0000Rk-T2; Sat, 05 Nov 2022 13:20:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1orMnU-00074H-LV
 for qemu-devel@nongnu.org; Sat, 05 Nov 2022 13:17:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1orMnS-0007WT-H6
 for qemu-devel@nongnu.org; Sat, 05 Nov 2022 13:17:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667668649;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9WAG+6UVBZa9BFa+G580I9ppzoTYCiRdriGpJVhyE2E=;
 b=VKzUa1Pq1ndhkOs4iHMx8z75rmb+VyG87/ezr/edmKvV2T+PySRsXkEWH7ag4NT9Qj/8tq
 RlN6hW6eSqg1PXUdnwxWxyM11d0mJFdvjiSMH3tpJIyu6lhZ9zMfskgDjL3PV5gn4KOeUx
 IwLFfwM5V6BQH3zLHZRraaCrNn+nSzg=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-90-16hXVT9oNHWbaFJ8ROHDsg-1; Sat, 05 Nov 2022 13:17:28 -0400
X-MC-Unique: 16hXVT9oNHWbaFJ8ROHDsg-1
Received: by mail-wm1-f72.google.com with SMTP id
 bg25-20020a05600c3c9900b003cf3ed7e27bso3839771wmb.4
 for <qemu-devel@nongnu.org>; Sat, 05 Nov 2022 10:17:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9WAG+6UVBZa9BFa+G580I9ppzoTYCiRdriGpJVhyE2E=;
 b=uD69w3uxqlSsohFsPLaCKiHv8YNWDrgWGua9VOaPDRlYgvI13pWPOvxYPbKfy8wV3s
 7hn4NA9kqhSjPu+zHIVzVqACsN/IYX6FmE8tXuGhvyQP3FQCvg3YJ/2jZpwDwHwrDrPq
 xl24QJaEt8QFUGh+xMqdcDVLnPZUqsRAEch2bq5JakDlKp7zLeRW63dthLlllb/p1bKB
 THwhM05f6K7pn/ZtGGz/DFyw/RtG6/4cUtkXbm/UpCG8NTnTw2vMv1v+wHv08S6oAYst
 6BJB/MirnIrhlNrGTsw61Jz05oeE2XC/ySyhmgvKtjO4KQa3dz1vA3ZvN8NkrduQTdn3
 G+Tw==
X-Gm-Message-State: ACrzQf1v8ECGbsRTTeZAG4Menzi6ILbPrjxvSYt4nQZt6+HV/mOeXXgi
 cE23Ged2SMHDMJ1GAca754n1Y2wTDZrOY4uQ76+7LjQnJpp6B51iQyvWARcd4Dano0KK0IxPCfX
 zT+OUZn8UxsMtxmI9zWteJcqqcnhzAd91RzgyZSPPpnSIhDfbzk0VeARmlI/U
X-Received: by 2002:a5d:6884:0:b0:236:f5e5:13c1 with SMTP id
 h4-20020a5d6884000000b00236f5e513c1mr12139178wru.43.1667668647435; 
 Sat, 05 Nov 2022 10:17:27 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM64e2gaMiwROyYlnps5uYjkdKTIfqw8Lm6BSO1dBFlSfHBHOBsyzJiUWfyPNMTTPNL46zh5Hg==
X-Received: by 2002:a5d:6884:0:b0:236:f5e5:13c1 with SMTP id
 h4-20020a5d6884000000b00236f5e513c1mr12139162wru.43.1667668647130; 
 Sat, 05 Nov 2022 10:17:27 -0700 (PDT)
Received: from redhat.com ([2.52.152.137]) by smtp.gmail.com with ESMTPSA id
 u8-20020adfeb48000000b002366b17ca8bsm3015925wrn.108.2022.11.05.10.17.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Nov 2022 10:17:26 -0700 (PDT)
Date: Sat, 5 Nov 2022 13:17:24 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Kangjie Xu <kangjie.xu@linux.alibaba.com>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Jason Wang <jasowang@redhat.com>
Subject: [PULL v3 40/81] vhost-net: vhost-kernel: introduce
 vhost_net_virtqueue_reset()
Message-ID: <20221105171116.432921-41-mst@redhat.com>
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

Introduce vhost_virtqueue_reset(), which can reset the specific
virtqueue in the device. Then it will unmap vrings and the desc
of the virtqueue.

Here we do not reuse the vhost_net_stop_one() or vhost_dev_stop(),
because they work at queue pair level. We do not use
vhost_virtqueue_stop() because it may stop the device in the
backend.

This patch only considers the case of vhost-kernel, when
NetClientDriver is NET_CLIENT_DRIVER_TAP.

Furthermore, we do not need net->nc->info->poll() because
it enables userspace datapath and we want to stop all
datapaths for this reset virtqueue here.

Signed-off-by: Kangjie Xu <kangjie.xu@linux.alibaba.com>
Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Acked-by: Jason Wang <jasowang@redhat.com>
Message-Id: <20221017092558.111082-10-xuanzhuo@linux.alibaba.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/net/vhost_net.h |  2 ++
 hw/net/vhost_net-stub.c |  6 ++++++
 hw/net/vhost_net.c      | 25 +++++++++++++++++++++++++
 3 files changed, 33 insertions(+)

diff --git a/include/net/vhost_net.h b/include/net/vhost_net.h
index 387e913e4e..85d85a4957 100644
--- a/include/net/vhost_net.h
+++ b/include/net/vhost_net.h
@@ -48,4 +48,6 @@ uint64_t vhost_net_get_acked_features(VHostNetState *net);
 
 int vhost_net_set_mtu(struct vhost_net *net, uint16_t mtu);
 
+void vhost_net_virtqueue_reset(VirtIODevice *vdev, NetClientState *nc,
+                               int vq_index);
 #endif
diff --git a/hw/net/vhost_net-stub.c b/hw/net/vhost_net-stub.c
index 89d71cfb8e..2d745e359c 100644
--- a/hw/net/vhost_net-stub.c
+++ b/hw/net/vhost_net-stub.c
@@ -101,3 +101,9 @@ int vhost_net_set_mtu(struct vhost_net *net, uint16_t mtu)
 {
     return 0;
 }
+
+void vhost_net_virtqueue_reset(VirtIODevice *vdev, NetClientState *nc,
+                               int vq_index)
+{
+
+}
diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
index d28f8b974b..8beecb4d22 100644
--- a/hw/net/vhost_net.c
+++ b/hw/net/vhost_net.c
@@ -531,3 +531,28 @@ int vhost_net_set_mtu(struct vhost_net *net, uint16_t mtu)
 
     return vhost_ops->vhost_net_set_mtu(&net->dev, mtu);
 }
+
+void vhost_net_virtqueue_reset(VirtIODevice *vdev, NetClientState *nc,
+                               int vq_index)
+{
+    VHostNetState *net = get_vhost_net(nc->peer);
+    const VhostOps *vhost_ops = net->dev.vhost_ops;
+    struct vhost_vring_file file = { .fd = -1 };
+    int idx;
+
+    /* should only be called after backend is connected */
+    assert(vhost_ops);
+
+    idx = vhost_ops->vhost_get_vq_index(&net->dev, vq_index);
+
+    if (net->nc->info->type == NET_CLIENT_DRIVER_TAP) {
+        file.index = idx;
+        int r = vhost_net_set_backend(&net->dev, &file);
+        assert(r >= 0);
+    }
+
+    vhost_virtqueue_stop(&net->dev,
+                         vdev,
+                         net->dev.vqs + idx,
+                         net->dev.vq_index + idx);
+}
-- 
MST


