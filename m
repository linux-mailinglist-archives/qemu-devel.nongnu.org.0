Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA069613708
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 13:54:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opUIJ-0001by-3V; Mon, 31 Oct 2022 08:53:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1opUHm-00079C-Lw
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 08:53:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1opUHk-0002tJ-SP
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 08:53:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667220780;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=k3h2/R6ixFTO5bNpkZpGb1wFDhh1s402BZASy50X1Mk=;
 b=ZKAeVrySW3UjYg1dow9h+fJr31hSY1X44qCnoNAcJjUEKdiNRV9LrgAcibBUvDb+ye7m9f
 9jnM1dXEvaDrSUlnwms/fBpnPWFVroklm4A6DIAiz2IvirlmOa9PzOh4zDArBUNiYZ8HwP
 wTkNSMZKiDpxomXFsZvREs17gSAZskE=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-495-DrwydJs7NKaV0WrIm74f7A-1; Mon, 31 Oct 2022 08:52:58 -0400
X-MC-Unique: DrwydJs7NKaV0WrIm74f7A-1
Received: by mail-wr1-f72.google.com with SMTP id
 n13-20020adf8b0d000000b0023658a75751so3041165wra.23
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 05:52:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=k3h2/R6ixFTO5bNpkZpGb1wFDhh1s402BZASy50X1Mk=;
 b=UR65zEbubzo2ujJoqzB7TEJ7nOCows57IiRTUPs7XZ5TVRDO7SnoUfxMvTpdCrx/jp
 YA7LtRgX+UKZrwnxgGJ8DnAUaW3ljK8xmvgKfYtfbeANpXAJ94Vvq9jfXYvjpAmyVaqa
 xeB5XaDSg2n+sKdA+MBapiqjWKkxk1ohjlpvPwQNi/069Z14iPT5fvMPX7MEnZ35US3u
 998Hi7OB5BPJHi9WaNaC92tk2k8ehsJ5Txduzj5xcPdIsFaTPbA/SsEPe+Xj+P1aFXH9
 BtsYxhs1qw9M9+FhBGHr0JKwaLGNPBbnQGPnOzjO5lqkVFdlxWn6WCpjZyk67hpzmaQd
 qwOA==
X-Gm-Message-State: ACrzQf025qHA/JUfcG7inJj/fWeU53fIO6aSw1ToOoVp10YOUDmvZZmO
 iUZiRt/EkKGQuOVrc58bqHhmJ4qNWyNuhYN5w9tf/+jddalu7xfCXXY7FB7u6dWJ0GROrshZKxY
 1Z2/gpqJk1YY67Ju4gNJCLdprUkKNCL2r9X3RWazW91uzIPW1PAPX9ONb3wXL
X-Received: by 2002:a05:600c:3d9a:b0:3cf:4969:850f with SMTP id
 bi26-20020a05600c3d9a00b003cf4969850fmr7962440wmb.130.1667220777302; 
 Mon, 31 Oct 2022 05:52:57 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5cgS4WJKyOP0yu14rt8kS0/sLFl7epiXI43c/StlnCD/MYJdGE2KopPNAIs/NVKzL+jXQbZQ==
X-Received: by 2002:a05:600c:3d9a:b0:3cf:4969:850f with SMTP id
 bi26-20020a05600c3d9a00b003cf4969850fmr7962419wmb.130.1667220777038; 
 Mon, 31 Oct 2022 05:52:57 -0700 (PDT)
Received: from redhat.com ([2.52.15.189]) by smtp.gmail.com with ESMTPSA id
 q7-20020a1ce907000000b003c701c12a17sm7140371wmc.12.2022.10.31.05.52.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Oct 2022 05:52:56 -0700 (PDT)
Date: Mon, 31 Oct 2022 08:52:54 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Kangjie Xu <kangjie.xu@linux.alibaba.com>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Jason Wang <jasowang@redhat.com>
Subject: [PULL 46/86] vhost-net: vhost-kernel: introduce
 vhost_net_virtqueue_restart()
Message-ID: <20221031124928.128475-47-mst@redhat.com>
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


