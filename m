Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4029E3DF899
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Aug 2021 01:43:04 +0200 (CEST)
Received: from localhost ([::1]:52166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mB43q-000887-RG
	for lists+qemu-devel@lfdr.de; Tue, 03 Aug 2021 19:43:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiang.wang@bytedance.com>)
 id 1mB42j-0007Q6-41
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 19:41:53 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:43951)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jiang.wang@bytedance.com>)
 id 1mB42d-0005rh-OQ
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 19:41:50 -0400
Received: by mail-pl1-x629.google.com with SMTP id u2so949074plg.10
 for <qemu-devel@nongnu.org>; Tue, 03 Aug 2021 16:41:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/9KQclbmqIyx6RUgafYpmDMpNL9WUcrPY3l68tLNfyw=;
 b=wCNN8erCR2fyvg+FwF7gh2ftNkF1h0UHJtqodBMs3ZjkEEYi7ev9m1cxmPAvAtLaqj
 QlstF83McqoaFD67AykqbMXUZlHEwYXqriikAHNEGLZPiaYd9ObmRfnMGjEx2BbHlydQ
 RQc3o/hMSoG8l0MZ+0IssMJ7vZjumWKdg0wlfSkjQp0ap+P5nKC3tbyidwwd3rypYaID
 Utu2hntyY56LTrSrzEZR37VQO3lUzQnZ8X/+mZx0JbLip0dkV7B73jfjOzIBx378etSq
 YIByt4UrPp6HDC7rKpguYSMLVn6pouLZOK8qQkvi06ibS2eeEcvddkgEJZrnO2KvQ5BL
 MkCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/9KQclbmqIyx6RUgafYpmDMpNL9WUcrPY3l68tLNfyw=;
 b=HvCdT/4q/IMfcLTpadFLyYobVIf+gKvMJIjNkmHVoz4ol+WOTytm1G7S42vQmveiXk
 9NP1xXkoKh3RWTg8k3oyNrLWfnRcegMbbP6TJn2qRsQYbgyJI5WrkpXceZ/QTdzhnMTa
 Rqf7WfHz4OqwrGH316p+vbGhNbybSP7gsq3R+4Wr+Jb4dHFUiNMbv8RFwLQYQzcN6SuO
 IOlR3Esyt0eGHqrNz5tVvdl4olVqyQ3p77fqJLRb4Vygk09A/d3tgLwD9Sv2hDYZnJXY
 DHP/5lfwxe/hhfE+1vCeI4gTeX71HYIB/qIEfOL/qHtAnCB0UPXrrCrkWxU9zVXEJnAY
 XFVQ==
X-Gm-Message-State: AOAM532+/Ljppvcq8ZmtY74h3iHzX35oTlHD1ibJJ5kH0mMRQ+mC5m2h
 nwn05kbtUrr3bC/lCJfIN8hFfw==
X-Google-Smtp-Source: ABdhPJzbNKx2Ur1T4z0mAT+RKxbPOEvH+2J0JIxieGHSydtsIpMWQXcus3cZkMU7tEgXOCFByQ8FgQ==
X-Received: by 2002:a17:90a:8403:: with SMTP id
 j3mr6532107pjn.112.1628034105426; 
 Tue, 03 Aug 2021 16:41:45 -0700 (PDT)
Received: from ip-10-124-121-13.byted.org
 (ec2-54-241-92-238.us-west-1.compute.amazonaws.com. [54.241.92.238])
 by smtp.gmail.com with ESMTPSA id n12sm266918pgr.2.2021.08.03.16.41.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Aug 2021 16:41:45 -0700 (PDT)
From: Jiang Wang <jiang.wang@bytedance.com>
To: mst@redhat.com,
	qemu-devel@nongnu.org
Subject: [PATCH v4] virtio/vsock: add two more queues for datagram types
Date: Tue,  3 Aug 2021 23:41:32 +0000
Message-Id: <20210803234132.1557394-1-jiang.wang@bytedance.com>
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

Signed-off-by: Jiang Wang <jiang.wang@bytedance.com>
---
v1 -> v2: use qemu cmd option to control number of queues,
	removed configuration settings for dgram.
v2 -> v3: use ioctl to get features and decide number of
        virt queues, instead of qemu cmd option.
v3 -> v4: change DGRAM feature bit value to 2. Add an argument
	in vhost_vsock_common_realize to indicate dgram is supported or not.

 hw/virtio/vhost-user-vsock.c                  |  2 +-
 hw/virtio/vhost-vsock-common.c                | 58 ++++++++++++++++++-
 hw/virtio/vhost-vsock.c                       |  5 +-
 include/hw/virtio/vhost-vsock-common.h        |  6 +-
 include/hw/virtio/vhost-vsock.h               |  4 ++
 include/standard-headers/linux/virtio_vsock.h |  1 +
 6 files changed, 69 insertions(+), 7 deletions(-)

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
index 4ad6e234ad..c78536911a 100644
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
@@ -196,9 +198,39 @@ int vhost_vsock_common_post_load(void *opaque, int version_id)
     return 0;
 }
 
-void vhost_vsock_common_realize(VirtIODevice *vdev, const char *name)
+static int vhost_vsock_get_max_qps(bool enable_dgram)
+{
+    uint64_t features;
+    int ret;
+    int fd = -1;
+
+    if (!enable_dgram)
+        return MAX_VQS_WITHOUT_DGRAM;
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
+void vhost_vsock_common_realize(VirtIODevice *vdev, const char *name, bool enable_dgram)
 {
     VHostVSockCommon *vvc = VHOST_VSOCK_COMMON(vdev);
+    int nvqs = MAX_VQS_WITHOUT_DGRAM;
 
     virtio_init(vdev, name, VIRTIO_ID_VSOCK,
                 sizeof(struct virtio_vsock_config));
@@ -209,12 +241,24 @@ void vhost_vsock_common_realize(VirtIODevice *vdev, const char *name)
     vvc->trans_vq = virtio_add_queue(vdev, VHOST_VSOCK_QUEUE_SIZE,
                                        vhost_vsock_common_handle_output);
 
+    nvqs = vhost_vsock_get_max_qps(enable_dgram);
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
@@ -227,6 +271,14 @@ void vhost_vsock_common_unrealize(VirtIODevice *vdev)
 
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
index 1b1a5c70ed..f73523afaf 100644
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
@@ -175,7 +178,7 @@ static void vhost_vsock_device_realize(DeviceState *dev, Error **errp)
         qemu_set_nonblock(vhostfd);
     }
 
-    vhost_vsock_common_realize(vdev, "vhost-vsock");
+    vhost_vsock_common_realize(vdev, "vhost-vsock", true);
 
     ret = vhost_dev_init(&vvc->vhost_dev, (void *)(uintptr_t)vhostfd,
                          VHOST_BACKEND_TYPE_KERNEL, 0, errp);
diff --git a/include/hw/virtio/vhost-vsock-common.h b/include/hw/virtio/vhost-vsock-common.h
index e412b5ee98..6669d24714 100644
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
+			       bool enable_dgram);
 void vhost_vsock_common_unrealize(VirtIODevice *vdev);
 
 #endif /* _QEMU_VHOST_VSOCK_COMMON_H */
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


