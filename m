Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FBD83B9854
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Jul 2021 23:51:18 +0200 (CEST)
Received: from localhost ([::1]:52468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lz4ab-0003kE-Lm
	for lists+qemu-devel@lfdr.de; Thu, 01 Jul 2021 17:51:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiang.wang@bytedance.com>)
 id 1lz4Yo-0002qf-BO
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 17:49:26 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:43966)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jiang.wang@bytedance.com>)
 id 1lz4Yj-0001p5-N9
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 17:49:24 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 x21-20020a17090aa395b029016e25313bfcso4836697pjp.2
 for <qemu-devel@nongnu.org>; Thu, 01 Jul 2021 14:49:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id;
 bh=OYCGv6pk9zpuvzazUd/Fyj4qoP3d9gpGYgpGg5c3Aik=;
 b=v3g74VAqfQB86MGtc/u/YYLnaFqVVD9EFVP5lwnZR0eMwrLVuBp5HGkL+9YHbGtYII
 HgZVMUVKjVydLL6U+Wch+cnaTo66rIH816+Sc806qAhgt6a1lTLgzb7YGd0cxYOBJYcC
 34yuBO+CWts6gZ8tmteyXTrdOCCYil8j8d/FDE8G4YMGb8bEpU9TuN0iCEUHqFbcJoVc
 FIAVRkOpy8fa8CDj3MAnnJx9ricecQM/FiK2sFY+IOtWXcOGhsyr7vPFMwjCl4XRJLOY
 FnsIqVjg+ROi7G1FQbJlOco/L+9kyI/4/ElLTS+tfFOOi1fH+ekwkPAqr6n15sXcBAM8
 TARQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=OYCGv6pk9zpuvzazUd/Fyj4qoP3d9gpGYgpGg5c3Aik=;
 b=s7cMSEkp37K6403ps+MMR1t1zH1I9rYkZ62ZBQHfc7zyiTHFpAJJWIBMi1ZgCGzEQj
 iPryh3OvWce0OIEBMnj7twudBy9cawIOHobwhwJDqkSAm+yriQQOokahfK67ob5SFwlv
 fVJWVxQFql0sU1CBcXokbbvbYT9kRrAwoZKlHeZzRWRDHT9HOnsEV3mJIc9HJZs2rF6W
 aGAVhEMIxovJ3aWqHMMtOPMrjTfn2oDxmcrwlIkTDohx+K0kBg8fr38JD9ap+ZNU+lx4
 DgvPeXY68djOhsvCKqpqefblKXvSkeOrA245rPygHURuVkGQ2n0pERGlc+d+zYCwmoH7
 tF9Q==
X-Gm-Message-State: AOAM5311THUgNH4w3tbeGJCecnK32bur+/zQCQ0qezaEDzbqrxcU3C1J
 UI51YDu28rPQDEs0T+CEv1aLhg==
X-Google-Smtp-Source: ABdhPJxGAHTvXP8FpgQalElGHf7+btg+iuSKDxhytj35D54alpFCfEOKlEmejNK4UZocOdq3x6msiA==
X-Received: by 2002:a17:90a:2f66:: with SMTP id
 s93mr1656405pjd.19.1625176159671; 
 Thu, 01 Jul 2021 14:49:19 -0700 (PDT)
Received: from n124-121-013.byted.org
 (ec2-54-241-92-238.us-west-1.compute.amazonaws.com. [54.241.92.238])
 by smtp.gmail.com with ESMTPSA id y21sm983112pfb.120.2021.07.01.14.49.18
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 01 Jul 2021 14:49:19 -0700 (PDT)
From: Jiang Wang <jiang.wang@bytedance.com>
To: mst@redhat.com,
	qemu-devel@nongnu.org
Subject: [RFC v2] virtio/vsock: add two more queues for datagram types
Date: Thu,  1 Jul 2021 21:49:10 +0000
Message-Id: <20210701214910.33913-1-jiang.wang@bytedance.com>
X-Mailer: git-send-email 2.11.0
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=jiang.wang@bytedance.com; helo=mail-pj1-x1034.google.com
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
Cc: stefanha@redhat.com, sgarzare@redhat.com
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


 hw/virtio/vhost-user-vsock.c                  |  6 +++---
 hw/virtio/vhost-vsock-common.c                | 23 ++++++++++++++++++-----
 hw/virtio/vhost-vsock.c                       | 11 ++++++++---
 include/hw/virtio/vhost-vsock-common.h        |  8 +++++---
 include/hw/virtio/vhost-vsock.h               |  1 +
 include/standard-headers/linux/virtio_vsock.h |  3 +++
 6 files changed, 38 insertions(+), 14 deletions(-)

diff --git a/hw/virtio/vhost-user-vsock.c b/hw/virtio/vhost-user-vsock.c
index a6f08c26b9..409286aa8d 100644
--- a/hw/virtio/vhost-user-vsock.c
+++ b/hw/virtio/vhost-user-vsock.c
@@ -103,7 +103,7 @@ static void vuv_device_realize(DeviceState *dev, Error **errp)
         return;
     }
 
-    vhost_vsock_common_realize(vdev, "vhost-user-vsock");
+    vhost_vsock_common_realize(vdev, "vhost-user-vsock", false);
 
     vhost_dev_set_config_notifier(&vvc->vhost_dev, &vsock_ops);
 
@@ -126,7 +126,7 @@ static void vuv_device_realize(DeviceState *dev, Error **errp)
 err_vhost_dev:
     vhost_dev_cleanup(&vvc->vhost_dev);
 err_virtio:
-    vhost_vsock_common_unrealize(vdev);
+    vhost_vsock_common_unrealize(vdev, false);
     vhost_user_cleanup(&vsock->vhost_user);
     return;
 }
@@ -142,7 +142,7 @@ static void vuv_device_unrealize(DeviceState *dev)
 
     vhost_dev_cleanup(&vvc->vhost_dev);
 
-    vhost_vsock_common_unrealize(vdev);
+    vhost_vsock_common_unrealize(vdev, false);
 
     vhost_user_cleanup(&vsock->vhost_user);
 
diff --git a/hw/virtio/vhost-vsock-common.c b/hw/virtio/vhost-vsock-common.c
index 4ad6e234ad..a36cb36496 100644
--- a/hw/virtio/vhost-vsock-common.c
+++ b/hw/virtio/vhost-vsock-common.c
@@ -196,9 +196,10 @@ int vhost_vsock_common_post_load(void *opaque, int version_id)
     return 0;
 }
 
-void vhost_vsock_common_realize(VirtIODevice *vdev, const char *name)
+void vhost_vsock_common_realize(VirtIODevice *vdev, const char *name, bool enable_dgram)
 {
     VHostVSockCommon *vvc = VHOST_VSOCK_COMMON(vdev);
+    int nvq = 2;
 
     virtio_init(vdev, name, VIRTIO_ID_VSOCK,
                 sizeof(struct virtio_vsock_config));
@@ -209,17 +210,24 @@ void vhost_vsock_common_realize(VirtIODevice *vdev, const char *name)
     vvc->trans_vq = virtio_add_queue(vdev, VHOST_VSOCK_QUEUE_SIZE,
                                        vhost_vsock_common_handle_output);
 
-    /* The event queue belongs to QEMU */
+    if (enable_dgram) {
+        vvc->dgram_recv_vq = virtio_add_queue(vdev, VHOST_VSOCK_QUEUE_SIZE,
+					      vhost_vsock_common_handle_output);
+        vvc->dgram_trans_vq = virtio_add_queue(vdev, VHOST_VSOCK_QUEUE_SIZE,
+					       vhost_vsock_common_handle_output);
+	nvq = 4;
+    }
+	    /* The event queue belongs to QEMU */
     vvc->event_vq = virtio_add_queue(vdev, VHOST_VSOCK_QUEUE_SIZE,
                                        vhost_vsock_common_handle_output);
 
-    vvc->vhost_dev.nvqs = ARRAY_SIZE(vvc->vhost_vqs);
-    vvc->vhost_dev.vqs = vvc->vhost_vqs;
+    vvc->vhost_dev.nvqs = nvq;
+    vvc->vhost_dev.vqs = g_new0(struct vhost_virtqueue, vvc->vhost_dev.nvqs);
 
     vvc->post_load_timer = NULL;
 }
 
-void vhost_vsock_common_unrealize(VirtIODevice *vdev)
+void vhost_vsock_common_unrealize(VirtIODevice *vdev, bool enable_dgram)
 {
     VHostVSockCommon *vvc = VHOST_VSOCK_COMMON(vdev);
 
@@ -227,6 +235,11 @@ void vhost_vsock_common_unrealize(VirtIODevice *vdev)
 
     virtio_delete_queue(vvc->recv_vq);
     virtio_delete_queue(vvc->trans_vq);
+    if (enable_dgram) {
+        virtio_delete_queue(vvc->dgram_recv_vq);
+        virtio_delete_queue(vvc->dgram_trans_vq);
+    }
+
     virtio_delete_queue(vvc->event_vq);
     virtio_cleanup(vdev);
 }
diff --git a/hw/virtio/vhost-vsock.c b/hw/virtio/vhost-vsock.c
index 5eaa207504..d15c672c38 100644
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
+    if (vvc->vhost_dev.nvqs == 4) /* 4 means has dgram support */
+        virtio_add_feature(&requested_features, VIRTIO_VSOCK_F_DGRAM);
     return vhost_get_features(&vvc->vhost_dev, feature_bits,
                                 requested_features);
 }
@@ -175,7 +178,7 @@ static void vhost_vsock_device_realize(DeviceState *dev, Error **errp)
         qemu_set_nonblock(vhostfd);
     }
 
-    vhost_vsock_common_realize(vdev, "vhost-vsock");
+    vhost_vsock_common_realize(vdev, "vhost-vsock", vsock->conf.enable_dgram);
 
     ret = vhost_dev_init(&vvc->vhost_dev, (void *)(uintptr_t)vhostfd,
                          VHOST_BACKEND_TYPE_KERNEL, 0);
@@ -197,7 +200,7 @@ err_vhost_dev:
     /* vhost_dev_cleanup() closes the vhostfd passed to vhost_dev_init() */
     vhostfd = -1;
 err_virtio:
-    vhost_vsock_common_unrealize(vdev);
+    vhost_vsock_common_unrealize(vdev, vsock->conf.enable_dgram);
     if (vhostfd >= 0) {
         close(vhostfd);
     }
@@ -208,17 +211,19 @@ static void vhost_vsock_device_unrealize(DeviceState *dev)
 {
     VHostVSockCommon *vvc = VHOST_VSOCK_COMMON(dev);
     VirtIODevice *vdev = VIRTIO_DEVICE(dev);
+    VHostVSock *vsock = VHOST_VSOCK(dev);
 
     /* This will stop vhost backend if appropriate. */
     vhost_vsock_set_status(vdev, 0);
 
     vhost_dev_cleanup(&vvc->vhost_dev);
-    vhost_vsock_common_unrealize(vdev);
+    vhost_vsock_common_unrealize(vdev, vsock->conf.enable_dgram);
 }
 
 static Property vhost_vsock_properties[] = {
     DEFINE_PROP_UINT64("guest-cid", VHostVSock, conf.guest_cid, 0),
     DEFINE_PROP_STRING("vhostfd", VHostVSock, conf.vhostfd),
+    DEFINE_PROP_BOOL("enable_dgram", VHostVSock, conf.enable_dgram, false),
     DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/include/hw/virtio/vhost-vsock-common.h b/include/hw/virtio/vhost-vsock-common.h
index e412b5ee98..cd15db3da7 100644
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
-void vhost_vsock_common_unrealize(VirtIODevice *vdev);
+void vhost_vsock_common_realize(VirtIODevice *vdev, const char *name, 
+				bool enable_dgram);
+void vhost_vsock_common_unrealize(VirtIODevice *vdev, bool enable_dgram);
 
 #endif /* _QEMU_VHOST_VSOCK_COMMON_H */
diff --git a/include/hw/virtio/vhost-vsock.h b/include/hw/virtio/vhost-vsock.h
index 84f4e727c7..509a9a60eb 100644
--- a/include/hw/virtio/vhost-vsock.h
+++ b/include/hw/virtio/vhost-vsock.h
@@ -23,6 +23,7 @@ OBJECT_DECLARE_SIMPLE_TYPE(VHostVSock, VHOST_VSOCK)
 typedef struct {
     uint64_t guest_cid;
     char *vhostfd;
+    bool enable_dgram;
 } VHostVSockConf;
 
 struct VHostVSock {
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


