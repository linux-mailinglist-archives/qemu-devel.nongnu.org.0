Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B09EB3BDF62
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 00:27:38 +0200 (CEST)
Received: from localhost ([::1]:51868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0tXV-0006gQ-7K
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 18:27:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiang.wang@bytedance.com>)
 id 1m0tWL-0005T1-B6
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 18:26:25 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:41675)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jiang.wang@bytedance.com>)
 id 1m0tWG-00011g-Cx
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 18:26:22 -0400
Received: by mail-pf1-x435.google.com with SMTP id f17so385941pfj.8
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 15:26:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id;
 bh=DMgSSx2blxZ/UfD76qDxZDRoYCI6eIzlZxX6g1FilWI=;
 b=WfRERAB9jF/kKIfpDWNMIvCsnrD+gW63pTQ93I5rxdRS7FWubpJkM/uBezgIpI4Qsc
 PQXy8l/tm358y1/YBDQkuClhVwKkButbL7fbMsYA9Gxa9J6see8+Fm6P5eGQYC57DnbP
 ZCj9ByUbk8JTmwnpMJW4DcQct4+SQQ/uiyWd6bTzXq11H+HiNLhq6hb4hbC+YgDDuypo
 28RmTbs/Bbbr4MLTtj1+pgis4+TmxkJ2Q9ow1wZcmt5mK34yQ/nRUWhO45Uujf3ZA/gB
 ZmhSKaK9t7fx2lRcu8lPholdtayUGJxFBYZk08NUm30SXbFZwf0qDhiB+lJoBUgUVORq
 1CFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=DMgSSx2blxZ/UfD76qDxZDRoYCI6eIzlZxX6g1FilWI=;
 b=KywrwX39QOK/jQgnHWnag+ZJW34aX1nOSiGcKEqUrQrewfqjZzy2xP8pcpwI4ZA7KH
 p16d5e+Y70ZEreV6x5ylGYwKdHdMjuMWVJbb6baS91XT02GQHj/eQsDKZ0iS+E+g30UL
 Em0WlBhzsJs0ZNssUdyySQC73/9+1aBx8r+SaKkEqP4EKV3oplB/YdY+LGBMv2QzGBS3
 wGenDYtVK4nYzlmwlNczoU6UgER0PVUNcqeD1EfI0Ht59b7fihZdKZoF1XtTwBMDp5Gi
 57qciiY/QSxPb1fwvD3W3IEv02Balm1rzWi6R0grP8CRdEmV2BjygVIo5sMQRtfOfAvK
 Z+HA==
X-Gm-Message-State: AOAM531D1Ti+t6iZe3YO4D3nOe8VBr8iqUPH9yAXVcPX+fgqxDhE4yGv
 2NfR5mA0584O2nbcmYLR2QMMcg==
X-Google-Smtp-Source: ABdhPJxplpRvYF/wyOIOwvdS99udX9v87JLDWCVY54A8GVXxq7mQwPk48KB3dH3GmbCUxM5Y46HLzw==
X-Received: by 2002:a63:4815:: with SMTP id v21mr22634640pga.213.1625610377211; 
 Tue, 06 Jul 2021 15:26:17 -0700 (PDT)
Received: from n124-121-013.byted.org
 (ec2-54-241-92-238.us-west-1.compute.amazonaws.com. [54.241.92.238])
 by smtp.gmail.com with ESMTPSA id k20sm3953547pji.3.2021.07.06.15.26.16
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 06 Jul 2021 15:26:16 -0700 (PDT)
From: Jiang Wang <jiang.wang@bytedance.com>
To: mst@redhat.com,
	qemu-devel@nongnu.org
Subject: [RFC v3] virtio/vsock: add two more queues for datagram types
Date: Tue,  6 Jul 2021 22:26:07 +0000
Message-Id: <20210706222607.1058040-1-jiang.wang@bytedance.com>
X-Mailer: git-send-email 2.11.0
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=jiang.wang@bytedance.com; helo=mail-pf1-x435.google.com
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
---
v1 -> v2: use qemu cmd option to control number of queues,
        removed configuration settings for dgram.
v2 -> v3: use ioctl to get features and decie numbr of
       virt queues, instead of qemu cmd option.

btw: this patch is based on Arseny's SEQPACKET patch.

 hw/virtio/vhost-vsock-common.c                | 53 ++++++++++++++++++++++++++-
 hw/virtio/vhost-vsock.c                       |  3 ++
 include/hw/virtio/vhost-vsock-common.h        |  3 +-
 include/hw/virtio/vhost-vsock.h               |  4 ++
 include/standard-headers/linux/virtio_vsock.h |  3 ++
 5 files changed, 63 insertions(+), 3 deletions(-)

diff --git a/hw/virtio/vhost-vsock-common.c b/hw/virtio/vhost-vsock-common.c
index 4ad6e234ad..8164e09445 100644
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
@@ -196,9 +198,36 @@ int vhost_vsock_common_post_load(void *opaque, int version_id)
     return 0;
 }
 
+static int vhost_vsock_get_max_qps(void)
+{
+    uint64_t features;
+    int ret;
+    int fd = -1;
+
+    fd = qemu_open_old("/dev/vhost-vsock", O_RDONLY);
+    if (fd == -1) {
+        error_report("vhost-vsock: failed to open device. %s", strerror(errno));
+        return -1;
+    }
+
+    ret = ioctl(fd, VHOST_GET_FEATURES, &features);
+    if (ret) {
+        error_report("vhost-vsock: failed to read  device. %s", strerror(errno));
+        qemu_close(fd);
+        return ret;
+    }
+
+    qemu_close(fd);
+    if (features & (1 << VIRTIO_VSOCK_F_DGRAM))
+        return MAX_VQS_WITH_DGRAM;
+
+    return MAX_VQS_WITHOUT_DGRAM;
+}
+
 void vhost_vsock_common_realize(VirtIODevice *vdev, const char *name)
 {
     VHostVSockCommon *vvc = VHOST_VSOCK_COMMON(vdev);
+    int nvqs = MAX_VQS_WITHOUT_DGRAM;
 
     virtio_init(vdev, name, VIRTIO_ID_VSOCK,
                 sizeof(struct virtio_vsock_config));
@@ -209,12 +238,24 @@ void vhost_vsock_common_realize(VirtIODevice *vdev, const char *name)
     vvc->trans_vq = virtio_add_queue(vdev, VHOST_VSOCK_QUEUE_SIZE,
                                        vhost_vsock_common_handle_output);
 
+    nvqs = vhost_vsock_get_max_qps();
+
+    if (nvqs < 0)
+        nvqs = MAX_VQS_WITHOUT_DGRAM;
+
+    if (nvqs == MAX_VQS_WITH_DGRAM) {
+        vvc->dgram_recv_vq = virtio_add_queue(vdev, VHOST_VSOCK_QUEUE_SIZE,
+                                              vhost_vsock_common_handle_output);
+        vvc->dgram_trans_vq = virtio_add_queue(vdev, VHOST_VSOCK_QUEUE_SIZE,
+                                               vhost_vsock_common_handle_output);
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
@@ -227,6 +268,14 @@ void vhost_vsock_common_unrealize(VirtIODevice *vdev)
 
     virtio_delete_queue(vvc->recv_vq);
     virtio_delete_queue(vvc->trans_vq);
+    if (vvc->vhost_dev.nvqs == MAX_VQS_WITH_DGRAM) {
+        virtio_delete_queue(vvc->dgram_recv_vq);
+        virtio_delete_queue(vvc->dgram_trans_vq);
+    }
+
+    if (vvc->vhost_dev.vqs)
+        g_free(vvc->vhost_dev.vqs);
+
     virtio_delete_queue(vvc->event_vq);
     virtio_cleanup(vdev);
 }
diff --git a/hw/virtio/vhost-vsock.c b/hw/virtio/vhost-vsock.c
index 1b1a5c70ed..33bbe16983 100644
--- a/hw/virtio/vhost-vsock.c
+++ b/hw/virtio/vhost-vsock.c
@@ -23,6 +23,7 @@
 
 const int feature_bits[] = {
     VIRTIO_VSOCK_F_SEQPACKET,
+    VIRTIO_VSOCK_F_DGRAM,
     VHOST_INVALID_FEATURE_BIT
 };
 
@@ -116,6 +117,8 @@ static uint64_t vhost_vsock_get_features(VirtIODevice *vdev,
     VHostVSockCommon *vvc = VHOST_VSOCK_COMMON(vdev);
 
     virtio_add_feature(&requested_features, VIRTIO_VSOCK_F_SEQPACKET);
+    if (vvc->vhost_dev.nvqs == MAX_VQS_WITH_DGRAM)
+        virtio_add_feature(&requested_features, VIRTIO_VSOCK_F_DGRAM);
     return vhost_get_features(&vvc->vhost_dev, feature_bits,
                                 requested_features);
 }
diff --git a/include/hw/virtio/vhost-vsock-common.h b/include/hw/virtio/vhost-vsock-common.h
index e412b5ee98..798715241f 100644
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
diff --git a/include/hw/virtio/vhost-vsock.h b/include/hw/virtio/vhost-vsock.h
index 84f4e727c7..e10319785d 100644
--- a/include/hw/virtio/vhost-vsock.h
+++ b/include/hw/virtio/vhost-vsock.h
@@ -23,6 +23,7 @@ OBJECT_DECLARE_SIMPLE_TYPE(VHostVSock, VHOST_VSOCK)
 typedef struct {
     uint64_t guest_cid;
     char *vhostfd;
+    bool enable_dgram;
 } VHostVSockConf;
 
 struct VHostVSock {
@@ -33,4 +34,7 @@ struct VHostVSock {
     /*< public >*/
 };
 
+#define MAX_VQS_WITHOUT_DGRAM 2
+#define MAX_VQS_WITH_DGRAM 4
+
 #endif /* QEMU_VHOST_VSOCK_H */
diff --git a/include/standard-headers/linux/virtio_vsock.h b/include/standard-headers/linux/virtio_vsock.h
index 5eac522ee2..6ff8c5084c 100644
--- a/include/standard-headers/linux/virtio_vsock.h
+++ b/include/standard-headers/linux/virtio_vsock.h
@@ -41,6 +41,9 @@
 /* The feature bitmap for virtio vsock */
 #define VIRTIO_VSOCK_F_SEQPACKET       1       /* SOCK_SEQPACKET supported */
 
+/* Feature bits */
+#define VIRTIO_VSOCK_F_DGRAM 0 /*Does vsock support dgram */
+
 struct virtio_vsock_config {
 	uint64_t guest_cid;
 } QEMU_PACKED;
-- 
2.11.0


