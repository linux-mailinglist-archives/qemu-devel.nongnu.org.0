Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA72D6167C7
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Nov 2022 17:14:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqGK2-0007sB-3A; Wed, 02 Nov 2022 12:10:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oqGK0-0007nK-Eo
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 12:10:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oqGJy-00034b-H7
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 12:10:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667405429;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=k3h2/R6ixFTO5bNpkZpGb1wFDhh1s402BZASy50X1Mk=;
 b=UERi84FvHtgU1VT2qgLdRQsIWR/ISh00Gi8N9FCXW8Mk5NCRkOGZMr1eYL+h6FYAWQ8X/y
 wl1DZNNWXinuwS/l4+V/uwAyLs/FRADFL0iUs2n//FVGXWM/b4JekrE5D6cPtUTuFYwNHe
 Wxtd4mNH2OGC0tBxl7uYvRZ01D4Bc24=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-21-uGQOJZsiOI21SgZsTkjE2w-1; Wed, 02 Nov 2022 12:10:28 -0400
X-MC-Unique: uGQOJZsiOI21SgZsTkjE2w-1
Received: by mail-wm1-f72.google.com with SMTP id
 m34-20020a05600c3b2200b003cf549cb32bso1262647wms.1
 for <qemu-devel@nongnu.org>; Wed, 02 Nov 2022 09:10:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=k3h2/R6ixFTO5bNpkZpGb1wFDhh1s402BZASy50X1Mk=;
 b=ITu6Gcz3a3em86z5HkjCVlNL3bWkf46DMslA/VrQF8FU7VHU57+e7KjpvNvZWOYtJI
 L4msLaM9BZBOcasRvEFL9+WheyRk5rTJP3j2UadWpwbnQrvQuQ6pb09430ZFuCHcIsHY
 l6iZ8+QHUFv1RIuRqg+qjsgdTn66WIrsOygasU7kiNi0RP2vpU24DefEzTZGPwZPkixg
 aPbmYw83n/dqtLXD5a/2OH5Fy8o9LJzVT6rGkq+tK3a7e2KQByJ9NnOuu1BQJK4EZPAi
 KVzlETF2TET5sL1aGjv/K2iaX63sJihen5kQvbuVNYF6NpeHudg6ipMOenBHHmE3igSs
 on7Q==
X-Gm-Message-State: ACrzQf13YTg6Cr4H+VIxBAKQ3JS1RfbCg5vqnN4C20i1QlQr7zb5FlZB
 Cwu/7FBAZVIiqCM+0Dkr6GYtVJ0KbG3oyzDVMaWLciKylqk+r0Ad70KuP841H1c50Nh2Xqapl3K
 Fv0VcWCnhrpEcQzxrI3DucaEDbsHM2BesZ2yn/P1Olx/5Q7OrGew+07qLX0Lt
X-Received: by 2002:a5d:4381:0:b0:236:d073:d9f with SMTP id
 i1-20020a5d4381000000b00236d0730d9fmr9744619wrq.158.1667405426861; 
 Wed, 02 Nov 2022 09:10:26 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM62S4Sjulh52YeOIBG6lNXrswucyBWxCVw2uFUvMvqTvmCQVU6pPJCp9RfXuO6EeLElm5ZmRw==
X-Received: by 2002:a5d:4381:0:b0:236:d073:d9f with SMTP id
 i1-20020a5d4381000000b00236d0730d9fmr9744599wrq.158.1667405426579; 
 Wed, 02 Nov 2022 09:10:26 -0700 (PDT)
Received: from redhat.com ([2.52.15.189]) by smtp.gmail.com with ESMTPSA id
 g7-20020a05600c310700b003c6bd12ac27sm2671674wmo.37.2022.11.02.09.10.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Nov 2022 09:10:26 -0700 (PDT)
Date: Wed, 2 Nov 2022 12:10:23 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Kangjie Xu <kangjie.xu@linux.alibaba.com>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Jason Wang <jasowang@redhat.com>
Subject: [PULL v2 44/82] vhost-net: vhost-kernel: introduce
 vhost_net_virtqueue_restart()
Message-ID: <20221102160336.616599-45-mst@redhat.com>
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
index 519dced899..f2ada02781 100644
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


