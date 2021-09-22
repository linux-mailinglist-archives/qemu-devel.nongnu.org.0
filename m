Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EECA2413E31
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Sep 2021 02:02:16 +0200 (CEST)
Received: from localhost ([::1]:34950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSpiJ-0003mC-IO
	for lists+qemu-devel@lfdr.de; Tue, 21 Sep 2021 20:02:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiang.wang@bytedance.com>)
 id 1mSpgr-00030f-5Y
 for qemu-devel@nongnu.org; Tue, 21 Sep 2021 20:00:45 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:37534)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jiang.wang@bytedance.com>)
 id 1mSpgm-0004Gi-Ml
 for qemu-devel@nongnu.org; Tue, 21 Sep 2021 20:00:43 -0400
Received: by mail-pl1-x629.google.com with SMTP id j14so564962plx.4
 for <qemu-devel@nongnu.org>; Tue, 21 Sep 2021 17:00:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=06KmwqB/WFMAGksj1aH0eVFDHAbohJ9jf/X//BG4WIM=;
 b=CKYC0qfzwUIpB154kfEG2uJYrArQAtBkrzHFLbEOxloRqANdh2HgAA4X/2rPDZ9Ol9
 4TWxW80lfOeqL9A3i0blb3pO/NHGJfLXA4LEhIoHIk0GqJP8j15JGJI40iPBrfqtMEBD
 ud3p21odwoNgW9qytRcEx2Zk2q+BGPnnXbfzMtZeIhFq6X7WMaOwXbiZRlbUB6sFXjJS
 2S1E0aMYGlSYUA1oUhZ3S/2aALvF6ru543AXm7jLmljCH/shnN9DrwwNH1bjcSPtvp3z
 w6deWaiu5/usLeXdU3Kf++gEb15oFVdA4Q33BMXTTaC3cUNilynLYPV8ES+YxMoVrrp9
 epaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=06KmwqB/WFMAGksj1aH0eVFDHAbohJ9jf/X//BG4WIM=;
 b=xQBQxmFtItIdGvlJWOgeL3F+Qw9JXQuUCfD6AOGw5G/g7uzgjadQcTrWFVejq+V67H
 vLbgYIDkjRLz8cJRcsp6bj7Zh2Sx8UCLrErKTyO7Bsjkf8kAJ8UajsS5QpC3liggQR8Y
 j22G0mDnwx+7fQlIfM8sE+0wIBt9SAXiePivrUiswKOEgEDhY4KRfx5RXE6R6kTEQynW
 LCC3IJ9ossP69ES+M7rISKfab9se03oSzIv7RxBHFSwmgOnTwIDm4D6tF2VxpoYmvFfT
 hxsKMuhyp7xlSSdHqACy5a13/oHdMmHPkkvkAiA7xs71fLk3oUr1xSURsASNcSu5Z+gb
 jMBA==
X-Gm-Message-State: AOAM532o8DRxkI/3sdguK+HRRF4GabOyuACETo19N4puruPTJmWdxLVu
 ou5GpVPxfD4ivc5YSpwUsN1uaw==
X-Google-Smtp-Source: ABdhPJwrlFDBGVWFE9DYoQjKQPApEw9tzjx827it8eTv1RtEPM1Zyqxum/0SQ0SOOvlGfHRmhGmJqA==
X-Received: by 2002:a17:90a:1b2a:: with SMTP id
 q39mr8138971pjq.219.1632268837687; 
 Tue, 21 Sep 2021 17:00:37 -0700 (PDT)
Received: from ip-10-124-121-13.byted.org
 (ec2-54-241-92-238.us-west-1.compute.amazonaws.com. [54.241.92.238])
 by smtp.gmail.com with ESMTPSA id v6sm238008pfv.83.2021.09.21.17.00.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Sep 2021 17:00:37 -0700 (PDT)
From: Jiang Wang <jiang.wang@bytedance.com>
To: mst@redhat.com,
	qemu-devel@nongnu.org
Subject: [RFC v7] virtio/vsock: add two more queues for datagram types
Date: Wed, 22 Sep 2021 00:00:24 +0000
Message-Id: <20210922000024.524646-1-jiang.wang@bytedance.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=jiang.wang@bytedance.com; helo=mail-pl1-x629.google.com
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

The two new virtqueues are enabled by default and will
be removed if the guest does not support. This will help
migration work.

btw: enable_dgram argument in vhost_vsock_common_realize
is redundant for now, but will be used later when we
want to disable DGRAM feature bit for old versions.

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
v6 -> v7: Always enable dgram for vhost-user and vhost kernel.
        Delete unused virtqueues at the beginning of 
        vhost_vsock_common_start for migration. Otherwise, migration will fail.

 hw/virtio/vhost-user-vsock.c                  |  2 +-
 hw/virtio/vhost-vsock-common.c                | 32 +++++++++++++++++--
 hw/virtio/vhost-vsock.c                       |  6 +++-
 include/hw/virtio/vhost-vsock-common.h        |  6 ++--
 include/hw/virtio/vhost-vsock.h               |  3 ++
 include/standard-headers/linux/virtio_vsock.h |  1 +
 6 files changed, 43 insertions(+), 7 deletions(-)

diff --git a/hw/virtio/vhost-user-vsock.c b/hw/virtio/vhost-user-vsock.c
index 6095ed7349..9823a2f3bd 100644
--- a/hw/virtio/vhost-user-vsock.c
+++ b/hw/virtio/vhost-user-vsock.c
@@ -105,7 +105,7 @@ static void vuv_device_realize(DeviceState *dev, Error **errp)
         return;
     }
 
-    vhost_vsock_common_realize(vdev, "vhost-user-vsock");
+    vhost_vsock_common_realize(vdev, "vhost-user-vsock", true);
 
     vhost_dev_set_config_notifier(&vvc->vhost_dev, &vsock_ops);
 
diff --git a/hw/virtio/vhost-vsock-common.c b/hw/virtio/vhost-vsock-common.c
index 4ad6e234ad..7d89b4d242 100644
--- a/hw/virtio/vhost-vsock-common.c
+++ b/hw/virtio/vhost-vsock-common.c
@@ -26,6 +26,18 @@ int vhost_vsock_common_start(VirtIODevice *vdev)
     int ret;
     int i;
 
+    if (!virtio_has_feature(vdev->guest_features, VIRTIO_VSOCK_F_DGRAM)) {
+        struct vhost_virtqueue *vqs;
+        virtio_delete_queue(vvc->dgram_recv_vq);
+        virtio_delete_queue(vvc->dgram_trans_vq);
+
+        vqs = vvc->vhost_dev.vqs;
+        vvc->vhost_dev.nvqs = MAX_VQS_WITHOUT_DGRAM;
+        vvc->vhost_dev.vqs = g_new0(struct vhost_virtqueue,
+                                   vvc->vhost_dev.nvqs);
+        g_free(vqs);
+    }
+
     if (!k->set_guest_notifiers) {
         error_report("binding does not support guest notifiers");
         return -ENOSYS;
@@ -196,9 +208,11 @@ int vhost_vsock_common_post_load(void *opaque, int version_id)
     return 0;
 }
 
-void vhost_vsock_common_realize(VirtIODevice *vdev, const char *name)
+void vhost_vsock_common_realize(VirtIODevice *vdev, const char *name,
+                               bool enable_dgram)
 {
     VHostVSockCommon *vvc = VHOST_VSOCK_COMMON(vdev);
+    int nvqs = MAX_VQS_WITH_DGRAM;
 
     virtio_init(vdev, name, VIRTIO_ID_VSOCK,
                 sizeof(struct virtio_vsock_config));
@@ -209,12 +223,17 @@ void vhost_vsock_common_realize(VirtIODevice *vdev, const char *name)
     vvc->trans_vq = virtio_add_queue(vdev, VHOST_VSOCK_QUEUE_SIZE,
                                        vhost_vsock_common_handle_output);
 
+    vvc->dgram_recv_vq = virtio_add_queue(vdev, VHOST_VSOCK_QUEUE_SIZE,
+                                          vhost_vsock_common_handle_output);
+    vvc->dgram_trans_vq = virtio_add_queue(vdev, VHOST_VSOCK_QUEUE_SIZE,
+                                          vhost_vsock_common_handle_output);
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
@@ -227,6 +246,13 @@ void vhost_vsock_common_unrealize(VirtIODevice *vdev)
 
     virtio_delete_queue(vvc->recv_vq);
     virtio_delete_queue(vvc->trans_vq);
+    if (vvc->vhost_dev.nvqs == MAX_VQS_WITH_DGRAM) {
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
index 1b1a5c70ed..6e315ecf23 100644
--- a/hw/virtio/vhost-vsock.c
+++ b/hw/virtio/vhost-vsock.c
@@ -23,6 +23,7 @@
 
 const int feature_bits[] = {
     VIRTIO_VSOCK_F_SEQPACKET,
+    VIRTIO_VSOCK_F_DGRAM,
     VHOST_INVALID_FEATURE_BIT
 };
 
@@ -116,6 +117,9 @@ static uint64_t vhost_vsock_get_features(VirtIODevice *vdev,
     VHostVSockCommon *vvc = VHOST_VSOCK_COMMON(vdev);
 
     virtio_add_feature(&requested_features, VIRTIO_VSOCK_F_SEQPACKET);
+    if (vvc->vhost_dev.nvqs == MAX_VQS_WITH_DGRAM) {
+        virtio_add_feature(&requested_features, VIRTIO_VSOCK_F_DGRAM);
+    }
     return vhost_get_features(&vvc->vhost_dev, feature_bits,
                                 requested_features);
 }
@@ -175,7 +179,7 @@ static void vhost_vsock_device_realize(DeviceState *dev, Error **errp)
         qemu_set_nonblock(vhostfd);
     }
 
-    vhost_vsock_common_realize(vdev, "vhost-vsock");
+    vhost_vsock_common_realize(vdev, "vhost-vsock", true);
 
     ret = vhost_dev_init(&vvc->vhost_dev, (void *)(uintptr_t)vhostfd,
                          VHOST_BACKEND_TYPE_KERNEL, 0, errp);
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
index 84f4e727c7..7d16c0e218 100644
--- a/include/hw/virtio/vhost-vsock.h
+++ b/include/hw/virtio/vhost-vsock.h
@@ -33,4 +33,7 @@ struct VHostVSock {
     /*< public >*/
 };
 
+#define MAX_VQS_WITHOUT_DGRAM 2
+#define MAX_VQS_WITH_DGRAM 4
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


