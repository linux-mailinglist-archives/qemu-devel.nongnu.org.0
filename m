Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CFC3409F96
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 00:21:23 +0200 (CEST)
Received: from localhost ([::1]:44302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPuKI-0001Ag-Fa
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 18:21:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiang.wang@bytedance.com>)
 id 1mPuI6-0000Sx-Rt
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 18:19:06 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434]:35561)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jiang.wang@bytedance.com>)
 id 1mPuI2-0007Ds-0k
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 18:19:04 -0400
Received: by mail-pf1-x434.google.com with SMTP id j16so10228049pfc.2
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 15:19:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Kr8r36k5mpGYuLjYcjWD9PWyziYzT/jbHaVwrahzbQg=;
 b=ZTfBB2a7tl4qpHDrT+0FWZLyweQx3nTDF+Zgl/fQxNf47qxOOHXSPtarmksbsoxGmz
 YpLQ7DAFw+FVsX8JmwvM3MDo5HmqAoZ47vRNtpl8d4G8FV31zNXl/EvF4cPZw65QBLyx
 nqIG9hwM3zV6/BDYuPFvDO6FddSqIUGS3Nkx2SUiFnHfezC48QcMqyHHU/AwTFR7I6iI
 OlX1vgV0ownRHLhS7Bl7r3W0pFu+gIHkbSmRGK0NR+uh2hfRoVE6yiZjqyOYDWrfVJ8I
 jeblFqgHLwKJVxHe5ehvHl3NbQhf+kDf2rGX9jwlDiEBXucY2ftOHd+AQfF8lyqdQqi4
 1k6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Kr8r36k5mpGYuLjYcjWD9PWyziYzT/jbHaVwrahzbQg=;
 b=qE+VxhAUSJq60BVccUQf5ByvhLQyrJAM6LJQMERazLm9ZCBCozXl5Tih7dcVXri9uM
 hXJF1tCdzAH/NU4eOaY191o0Epbn1o5htj4N2Y8/lgRn/uEktqCiEoo8cvLCgzO1y0oe
 ROTn64IEHELBxxOtisu/ZiRyC0UV+8max2ZMLU74Wp9JHuMHtVuLJcGZWOhS5Lxa5g5r
 2nPtXO2D06oU6gmdfcsVgHAwG+4POQblM2K9hU32udF9jzQTj6ZrGCh60nKghRIDxyDS
 ghkPDpRy4Ngk3+dJLEaMSN0SmYivuwTIRshOv0rzLgLYl/qVj9YMDihf4sefEPkjiy8b
 z0Mg==
X-Gm-Message-State: AOAM531EUdHGNxlz7sfRzxRwpRaZJkqhpTMOn2QgMGY/KRZjrSDY2lnf
 0n1UkYN0hggbmjDw7ixrQ/oitQ==
X-Google-Smtp-Source: ABdhPJwgBvpr6XsViFAepr+lsFnf05pX1OkWxp5pPs63YNhYYuezZzuPUPd5qdbs96kK0fjXfo7XKA==
X-Received: by 2002:a63:a55a:: with SMTP id r26mr12697163pgu.13.1631571538064; 
 Mon, 13 Sep 2021 15:18:58 -0700 (PDT)
Received: from ip-10-124-121-13.byted.org
 (ec2-54-241-92-238.us-west-1.compute.amazonaws.com. [54.241.92.238])
 by smtp.gmail.com with ESMTPSA id d22sm8042566pfq.158.2021.09.13.15.18.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Sep 2021 15:18:57 -0700 (PDT)
From: Jiang Wang <jiang.wang@bytedance.com>
To: mst@redhat.com,
	qemu-devel@nongnu.org
Subject: [RFC v6] virtio/vsock: add two more queues for datagram types
Date: Mon, 13 Sep 2021 22:18:43 +0000
Message-Id: <20210913221843.2304308-1-jiang.wang@bytedance.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=jiang.wang@bytedance.com; helo=mail-pf1-x434.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: jasowang@redhat.com, arseny.krasnov@kaspersky.com, stefanha@redhat.com,
 sgarzare@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Datagram sockets are connectionless and unreliable.
The sender does not know the capacity of the receiver
and may send more packets than the receiver can handle.

Add two more dedicate virtqueues for datagram sockets,
so that it will not unfairly steal resources from
stream and future connection-oriented sockets.

Signed-off-by: Jiang Wang <jiang.wang@bytedance.com>
---
v1 -> v2: use qemu cmd option to control number of queues,
        removed configuration settings for dgram.
v2 -> v3: use ioctl to get features and decide number of
        virt queues, instead of qemu cmd option.
v3 -> v4: change DGRAM feature bit value to 2. Add an argument
        in vhost_vsock_common_realize to indicate dgram is supported or not.
v4 -> v5: don't open dev to get vhostfd. Removed leftover definition of
        enable_dgram
v5 -> v6: fix style errors. Imporve error handling of
        vhost_vsock_dgram_supported. Rename MAX_VQS_WITH_DGRAM and another one.

 hw/virtio/vhost-user-vsock.c                  |  2 +-
 hw/virtio/vhost-vsock-common.c                | 25 ++++++++++++--
 hw/virtio/vhost-vsock.c                       | 34 ++++++++++++++++++-
 include/hw/virtio/vhost-vsock-common.h        |  6 ++--
 include/hw/virtio/vhost-vsock.h               |  3 ++
 include/standard-headers/linux/virtio_vsock.h |  1 +
 6 files changed, 64 insertions(+), 7 deletions(-)

diff --git a/hw/virtio/vhost-user-vsock.c b/hw/virtio/vhost-user-vsock.c
index 6095ed7349..e9ec0e1c00 100644
--- a/hw/virtio/vhost-user-vsock.c
+++ b/hw/virtio/vhost-user-vsock.c
@@ -105,7 +105,7 @@ static void vuv_device_realize(DeviceState *dev, Error **errp)
         return;
     }
 
-    vhost_vsock_common_realize(vdev, "vhost-user-vsock");
+    vhost_vsock_common_realize(vdev, "vhost-user-vsock", false);
 
     vhost_dev_set_config_notifier(&vvc->vhost_dev, &vsock_ops);
 
diff --git a/hw/virtio/vhost-vsock-common.c b/hw/virtio/vhost-vsock-common.c
index 4ad6e234ad..d94636e04e 100644
--- a/hw/virtio/vhost-vsock-common.c
+++ b/hw/virtio/vhost-vsock-common.c
@@ -17,6 +17,8 @@
 #include "hw/virtio/vhost-vsock.h"
 #include "qemu/iov.h"
 #include "monitor/monitor.h"
+#include <sys/ioctl.h>
+#include <linux/vhost.h>
 
 int vhost_vsock_common_start(VirtIODevice *vdev)
 {
@@ -196,9 +198,11 @@ int vhost_vsock_common_post_load(void *opaque, int version_id)
     return 0;
 }
 
-void vhost_vsock_common_realize(VirtIODevice *vdev, const char *name)
+void vhost_vsock_common_realize(VirtIODevice *vdev, const char *name,
+                               bool enable_dgram)
 {
     VHostVSockCommon *vvc = VHOST_VSOCK_COMMON(vdev);
+    int nvqs = VHOST_VSOCK_NVQS;
 
     virtio_init(vdev, name, VIRTIO_ID_VSOCK,
                 sizeof(struct virtio_vsock_config));
@@ -209,12 +213,20 @@ void vhost_vsock_common_realize(VirtIODevice *vdev, const char *name)
     vvc->trans_vq = virtio_add_queue(vdev, VHOST_VSOCK_QUEUE_SIZE,
                                        vhost_vsock_common_handle_output);
 
+    if (enable_dgram) {
+        nvqs = VHOST_VSOCK_NVQS_DGRAM;
+        vvc->dgram_recv_vq = virtio_add_queue(vdev, VHOST_VSOCK_QUEUE_SIZE,
+                                              vhost_vsock_common_handle_output);
+        vvc->dgram_trans_vq = virtio_add_queue(vdev, VHOST_VSOCK_QUEUE_SIZE,
+                                              vhost_vsock_common_handle_output);
+    }
+
     /* The event queue belongs to QEMU */
     vvc->event_vq = virtio_add_queue(vdev, VHOST_VSOCK_QUEUE_SIZE,
                                        vhost_vsock_common_handle_output);
 
-    vvc->vhost_dev.nvqs = ARRAY_SIZE(vvc->vhost_vqs);
-    vvc->vhost_dev.vqs = vvc->vhost_vqs;
+    vvc->vhost_dev.nvqs = nvqs;
+    vvc->vhost_dev.vqs = g_new0(struct vhost_virtqueue, vvc->vhost_dev.nvqs);
 
     vvc->post_load_timer = NULL;
 }
@@ -227,6 +239,13 @@ void vhost_vsock_common_unrealize(VirtIODevice *vdev)
 
     virtio_delete_queue(vvc->recv_vq);
     virtio_delete_queue(vvc->trans_vq);
+    if (vvc->vhost_dev.nvqs == VHOST_VSOCK_NVQS_DGRAM) {
+        virtio_delete_queue(vvc->dgram_recv_vq);
+        virtio_delete_queue(vvc->dgram_trans_vq);
+    }
+
+    g_free(vvc->vhost_dev.vqs);
+
     virtio_delete_queue(vvc->event_vq);
     virtio_cleanup(vdev);
 }
diff --git a/hw/virtio/vhost-vsock.c b/hw/virtio/vhost-vsock.c
index 1b1a5c70ed..891d38e226 100644
--- a/hw/virtio/vhost-vsock.c
+++ b/hw/virtio/vhost-vsock.c
@@ -20,9 +20,12 @@
 #include "hw/qdev-properties.h"
 #include "hw/virtio/vhost-vsock.h"
 #include "monitor/monitor.h"
+#include <sys/ioctl.h>
+#include <linux/vhost.h>
 
 const int feature_bits[] = {
     VIRTIO_VSOCK_F_SEQPACKET,
+    VIRTIO_VSOCK_F_DGRAM,
     VHOST_INVALID_FEATURE_BIT
 };
 
@@ -116,6 +119,9 @@ static uint64_t vhost_vsock_get_features(VirtIODevice *vdev,
     VHostVSockCommon *vvc = VHOST_VSOCK_COMMON(vdev);
 
     virtio_add_feature(&requested_features, VIRTIO_VSOCK_F_SEQPACKET);
+    if (vvc->vhost_dev.nvqs == VHOST_VSOCK_NVQS_DGRAM) {
+        virtio_add_feature(&requested_features, VIRTIO_VSOCK_F_DGRAM);
+    }
     return vhost_get_features(&vvc->vhost_dev, feature_bits,
                                 requested_features);
 }
@@ -132,13 +138,34 @@ static const VMStateDescription vmstate_virtio_vhost_vsock = {
     .post_load = vhost_vsock_common_post_load,
 };
 
+static bool vhost_vsock_dgram_supported(int vhostfd, Error **errp)
+{
+    uint64_t features;
+    int ret;
+
+    ret = ioctl(vhostfd, VHOST_GET_FEATURES, &features);
+    if (ret) {
+        error_setg(errp, "vhost-vsock: failed to read device freatures. %s",
+                     strerror(errno));
+        return false;
+    }
+
+    if (features & (1 << VIRTIO_VSOCK_F_DGRAM)) {
+        return true;
+    }
+
+    return false;
+}
+
 static void vhost_vsock_device_realize(DeviceState *dev, Error **errp)
 {
+    ERRP_GUARD();
     VHostVSockCommon *vvc = VHOST_VSOCK_COMMON(dev);
     VirtIODevice *vdev = VIRTIO_DEVICE(dev);
     VHostVSock *vsock = VHOST_VSOCK(dev);
     int vhostfd;
     int ret;
+    bool enable_dgram;
 
     /* Refuse to use reserved CID numbers */
     if (vsock->conf.guest_cid <= 2) {
@@ -175,7 +202,11 @@ static void vhost_vsock_device_realize(DeviceState *dev, Error **errp)
         qemu_set_nonblock(vhostfd);
     }
 
-    vhost_vsock_common_realize(vdev, "vhost-vsock");
+    enable_dgram = vhost_vsock_dgram_supported(vhostfd, errp);
+    if (*errp) {
+        goto err_dgram;
+    }
+    vhost_vsock_common_realize(vdev, "vhost-vsock", enable_dgram);
 
     ret = vhost_dev_init(&vvc->vhost_dev, (void *)(uintptr_t)vhostfd,
                          VHOST_BACKEND_TYPE_KERNEL, 0, errp);
@@ -197,6 +228,7 @@ err_vhost_dev:
     vhostfd = -1;
 err_virtio:
     vhost_vsock_common_unrealize(vdev);
+err_dgram:
     if (vhostfd >= 0) {
         close(vhostfd);
     }
diff --git a/include/hw/virtio/vhost-vsock-common.h b/include/hw/virtio/vhost-vsock-common.h
index e412b5ee98..80151aee35 100644
--- a/include/hw/virtio/vhost-vsock-common.h
+++ b/include/hw/virtio/vhost-vsock-common.h
@@ -27,12 +27,13 @@ enum {
 struct VHostVSockCommon {
     VirtIODevice parent;
 
-    struct vhost_virtqueue vhost_vqs[2];
     struct vhost_dev vhost_dev;
 
     VirtQueue *event_vq;
     VirtQueue *recv_vq;
     VirtQueue *trans_vq;
+    VirtQueue *dgram_recv_vq;
+    VirtQueue *dgram_trans_vq;
 
     QEMUTimer *post_load_timer;
 };
@@ -41,7 +42,8 @@ int vhost_vsock_common_start(VirtIODevice *vdev);
 void vhost_vsock_common_stop(VirtIODevice *vdev);
 int vhost_vsock_common_pre_save(void *opaque);
 int vhost_vsock_common_post_load(void *opaque, int version_id);
-void vhost_vsock_common_realize(VirtIODevice *vdev, const char *name);
+void vhost_vsock_common_realize(VirtIODevice *vdev, const char *name,
+                                bool enable_dgram);
 void vhost_vsock_common_unrealize(VirtIODevice *vdev);
 
 #endif /* _QEMU_VHOST_VSOCK_COMMON_H */
diff --git a/include/hw/virtio/vhost-vsock.h b/include/hw/virtio/vhost-vsock.h
index 84f4e727c7..87b2019b5a 100644
--- a/include/hw/virtio/vhost-vsock.h
+++ b/include/hw/virtio/vhost-vsock.h
@@ -33,4 +33,7 @@ struct VHostVSock {
     /*< public >*/
 };
 
+#define VHOST_VSOCK_NVQS 2
+#define VHOST_VSOCK_NVQS_DGRAM 4
+
 #endif /* QEMU_VHOST_VSOCK_H */
diff --git a/include/standard-headers/linux/virtio_vsock.h b/include/standard-headers/linux/virtio_vsock.h
index 3a23488e42..7e35acf3d4 100644
--- a/include/standard-headers/linux/virtio_vsock.h
+++ b/include/standard-headers/linux/virtio_vsock.h
@@ -40,6 +40,7 @@
 
 /* The feature bitmap for virtio vsock */
 #define VIRTIO_VSOCK_F_SEQPACKET	1	/* SOCK_SEQPACKET supported */
+#define VIRTIO_VSOCK_F_DGRAM		2	/* SOCK_DGRAM supported */
 
 struct virtio_vsock_config {
 	uint64_t guest_cid;
-- 
2.20.1


