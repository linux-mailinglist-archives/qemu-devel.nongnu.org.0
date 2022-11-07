Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A67D6203AC
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Nov 2022 00:22:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osAxN-0001tR-9I; Mon, 07 Nov 2022 17:51:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1osAx1-0001hc-9r
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 17:50:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1osAww-0003wi-7b
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 17:50:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667861435;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LSGuNO4vjhRuhRUypjNteJrUGVo70hUc7qmpgDdqD3w=;
 b=TVNQL8PGgxMfBqS/LmGpxudcP55ze5rJJXcoLWJ9d7sRaj/1u8v+l4x2c0p1gni7+Lp3Ha
 2AckM64G0bYvSdEf8o8LR2hVEoDgpXcbe6fSTDvBAadEp7SuFFqd3NyM578oGbbiLhEUTA
 4s4pTjMOg2Yb8Nrb2rFSHaEN4D12J8k=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-471-0jKU5Ep0N1OIK3KMQZBUOQ-1; Mon, 07 Nov 2022 17:50:34 -0500
X-MC-Unique: 0jKU5Ep0N1OIK3KMQZBUOQ-1
Received: by mail-qk1-f198.google.com with SMTP id
 u6-20020a05620a430600b006e47fa02576so11431599qko.22
 for <qemu-devel@nongnu.org>; Mon, 07 Nov 2022 14:50:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LSGuNO4vjhRuhRUypjNteJrUGVo70hUc7qmpgDdqD3w=;
 b=Z3NELkV5U9fqwH5us4QCLPN9UtY7eNRU4tR9Km4P6r7YZc/S3U+dAu2Wzc1FmGPrzE
 R0nnjc6m7Mq8vWRMeHyeQwUlvZh/FLCGqtimufLNwzt7qxSBcf5IMaADIUbHbMaSvlpr
 kAbVubkj1vRAZr9KS9fA7rx11iSYt51w05YQEJPhLBQ41wlkZZsrQyq9UlRPYZvebNAv
 Y45X+bCHO7gHpXXR9D+tgKxArLrrqV2i77OsFd0yWKPAIk6GMMsnUn76QyMEFLlbHM88
 IUqzCWOde2wIjPypajiLMrTxwZrQws6G2dCQGttbOBoPywPWEhVvPNQ++E2F0QPML58E
 dMvA==
X-Gm-Message-State: ACrzQf1ifHsCrBfv7maN4rDpNZWkKmGOjwKPSYxaJr0GvHFz9haYxOqy
 tlk1pnt2oMUPoNZqWQ2z0HpbbdVnEyPREY3LKSZWkQdWi3OCqZOSYFZ770J/3Gq1DlhHEb/EvvH
 ocecsfUpg4rsjcsn14HAmFR2WOcdXdNEBuIBE/FAXvjHj6Ag0uvh/FpuSZ1UW
X-Received: by 2002:ac8:4996:0:b0:3a5:2502:92d7 with SMTP id
 f22-20020ac84996000000b003a5250292d7mr35230080qtq.521.1667861433782; 
 Mon, 07 Nov 2022 14:50:33 -0800 (PST)
X-Google-Smtp-Source: AMsMyM4ObJcMx7zXxSXRBITpHT6iozDveIGl1W4Am8TR7yaJD1ugUR+K0jXluGmjYCqe38b1KVGNjQ==
X-Received: by 2002:ac8:4996:0:b0:3a5:2502:92d7 with SMTP id
 f22-20020ac84996000000b003a5250292d7mr35230060qtq.521.1667861433458; 
 Mon, 07 Nov 2022 14:50:33 -0800 (PST)
Received: from redhat.com ([87.249.138.11]) by smtp.gmail.com with ESMTPSA id
 9-20020a370c09000000b006cfc9846594sm7714867qkm.93.2022.11.07.14.50.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Nov 2022 14:50:33 -0800 (PST)
Date: Mon, 7 Nov 2022 17:50:29 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Kangjie Xu <kangjie.xu@linux.alibaba.com>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Jason Wang <jasowang@redhat.com>
Subject: [PULL v4 36/83] vhost-net: vhost-kernel: introduce
 vhost_net_virtqueue_restart()
Message-ID: <20221107224600.934080-37-mst@redhat.com>
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

From: Kangjie Xu <kangjie.xu@linux.alibaba.com>

Introduce vhost_net_virtqueue_restart(), which can restart the
specific virtqueue when the vhost net started running before.
If it fails to restart the virtqueue, the device will be stopped.

Here we do not reuse vhost_net_start_one() or vhost_dev_start()
because they work at queue pair level. The mem table and features
do not change, so we can call the vhost_virtqueue_start() to
restart a specific queue.

This patch only considers the case of vhost-kernel, when
NetClientDriver is NET_CLIENT_DRIVER_TAP.

Signed-off-by: Kangjie Xu <kangjie.xu@linux.alibaba.com>
Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Acked-by: Jason Wang <jasowang@redhat.com>
Message-Id: <20221017092558.111082-11-xuanzhuo@linux.alibaba.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/net/vhost_net.h |  2 ++
 hw/net/vhost_net-stub.c |  6 +++++
 hw/net/vhost_net.c      | 53 +++++++++++++++++++++++++++++++++++++++++
 3 files changed, 61 insertions(+)

diff --git a/include/net/vhost_net.h b/include/net/vhost_net.h
index 85d85a4957..40b9a40074 100644
--- a/include/net/vhost_net.h
+++ b/include/net/vhost_net.h
@@ -50,4 +50,6 @@ int vhost_net_set_mtu(struct vhost_net *net, uint16_t mtu);
 
 void vhost_net_virtqueue_reset(VirtIODevice *vdev, NetClientState *nc,
                                int vq_index);
+int vhost_net_virtqueue_restart(VirtIODevice *vdev, NetClientState *nc,
+                                int vq_index);
 #endif
diff --git a/hw/net/vhost_net-stub.c b/hw/net/vhost_net-stub.c
index 2d745e359c..9f7daae99c 100644
--- a/hw/net/vhost_net-stub.c
+++ b/hw/net/vhost_net-stub.c
@@ -107,3 +107,9 @@ void vhost_net_virtqueue_reset(VirtIODevice *vdev, NetClientState *nc,
 {
 
 }
+
+int vhost_net_virtqueue_restart(VirtIODevice *vdev, NetClientState *nc,
+                                int vq_index)
+{
+    return 0;
+}
diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
index 8beecb4d22..d2926e2ed6 100644
--- a/hw/net/vhost_net.c
+++ b/hw/net/vhost_net.c
@@ -34,6 +34,7 @@
 #include "standard-headers/linux/virtio_ring.h"
 #include "hw/virtio/vhost.h"
 #include "hw/virtio/virtio-bus.h"
+#include "linux-headers/linux/vhost.h"
 
 
 /* Features supported by host kernel. */
@@ -556,3 +557,55 @@ void vhost_net_virtqueue_reset(VirtIODevice *vdev, NetClientState *nc,
                          net->dev.vqs + idx,
                          net->dev.vq_index + idx);
 }
+
+int vhost_net_virtqueue_restart(VirtIODevice *vdev, NetClientState *nc,
+                                int vq_index)
+{
+    VHostNetState *net = get_vhost_net(nc->peer);
+    const VhostOps *vhost_ops = net->dev.vhost_ops;
+    struct vhost_vring_file file = { };
+    int idx, r;
+
+    if (!net->dev.started) {
+        return -EBUSY;
+    }
+
+    /* should only be called after backend is connected */
+    assert(vhost_ops);
+
+    idx = vhost_ops->vhost_get_vq_index(&net->dev, vq_index);
+
+    r = vhost_virtqueue_start(&net->dev,
+                              vdev,
+                              net->dev.vqs + idx,
+                              net->dev.vq_index + idx);
+    if (r < 0) {
+        goto err_start;
+    }
+
+    if (net->nc->info->type == NET_CLIENT_DRIVER_TAP) {
+        file.index = idx;
+        file.fd = net->backend;
+        r = vhost_net_set_backend(&net->dev, &file);
+        if (r < 0) {
+            r = -errno;
+            goto err_start;
+        }
+    }
+
+    return 0;
+
+err_start:
+    error_report("Error when restarting the queue.");
+
+    if (net->nc->info->type == NET_CLIENT_DRIVER_TAP) {
+        file.fd = VHOST_FILE_UNBIND;
+        file.index = idx;
+        int r = vhost_net_set_backend(&net->dev, &file);
+        assert(r >= 0);
+    }
+
+    vhost_dev_stop(&net->dev, vdev);
+
+    return r;
+}
-- 
MST


