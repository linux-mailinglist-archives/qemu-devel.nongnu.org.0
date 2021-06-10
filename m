Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58D773A21C1
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 03:06:11 +0200 (CEST)
Received: from localhost ([::1]:41790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lr998-00065J-6u
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 21:06:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiang.wang@bytedance.com>)
 id 1lr8LQ-0000PM-4v
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 20:14:48 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:51713)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jiang.wang@bytedance.com>)
 id 1lr8LL-0005k0-Ab
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 20:14:46 -0400
Received: by mail-pj1-x1033.google.com with SMTP id k5so2588170pjj.1
 for <qemu-devel@nongnu.org>; Wed, 09 Jun 2021 17:14:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id;
 bh=XvweDJLM/a8WG99pHQE9zcce6R3X4Cb9e85sNDb4E3Y=;
 b=i9n1DwI93XEL+GA7N8UBjtypawdYzemwM2g0ZOHBNJ0wP7e8bUh3tB8Am02Hr6GLEZ
 bklgU2c3E8D9o+CGo/3E48ZAJxMv0L+B94+ov1ZZKSrnoUhPcWE2ea2OAFlskoUN7ODY
 3RPwdrlu/AD+r10rnYclHtqLcv/G5O0sTELMHcW2YALH6Odd+fdV69Luxnlf/OEiIfGH
 /xpkLQ6a8dQHeDM1ES9gcQxqUVp2oaJZCya1OmO0aOksqX1nqgOkU+toBykiLGP8anlu
 a7jrKAWa8rIjFo3xmfldLsmnkLt5W5vrJG1jTFavWz471t2N9OCvEEJfo8x1487cNXim
 SBmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=XvweDJLM/a8WG99pHQE9zcce6R3X4Cb9e85sNDb4E3Y=;
 b=R1S1LDCbiLDQrpFSiChcnjCwPFgLN0MQoEru28vO+POxH6SQVX5hEzZG+mI+Qb0Urv
 Acgi+EeN08RspqOY7TLxWk2Iy80bPIFmPH/AOBlGwqXdQaDV9gD7MMcAWZuABQAmlu6Z
 Q/WEy+sgPrkcwvuY3xd7dyyRHliIy4Y8/xvaY6JZR1NuExs9HWaR6bAWxum14oLPMMBd
 mN1/1Dqef6PQtl1khmS3xf9T9tJb4+Yarh+RFkXQQ0n3LHshJoRc8Pdtn6Ok2HNcew5x
 dQ3nfQXjC9SU/9/ZTW3LVsGnEZ1bDoYedYPQgQCfOLGT/2yvNd+17aJLIsH+/4Xfnl9j
 Plwg==
X-Gm-Message-State: AOAM5305VLnG85v0QZzlIQl5Yepi9tZUPm29K7Wg6EWWvgnCUxvT9eq5
 BdnWotRgotGkMybO1CeeGKwOGw==
X-Google-Smtp-Source: ABdhPJxo7rG1EkzGsMkdIk/psRytGAMxC6kAJ5Q9O1W6Wy67eYVmP3VgXbEwcB+AxIVDM+S0wUXAMg==
X-Received: by 2002:a17:90a:d102:: with SMTP id
 l2mr298163pju.225.1623284078846; 
 Wed, 09 Jun 2021 17:14:38 -0700 (PDT)
Received: from n124-121-013.byted.org
 (ec2-54-241-92-238.us-west-1.compute.amazonaws.com. [54.241.92.238])
 by smtp.gmail.com with ESMTPSA id s3sm790613pgs.62.2021.06.09.17.14.38
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 09 Jun 2021 17:14:38 -0700 (PDT)
From: Jiang Wang <jiang.wang@bytedance.com>
To: mst@redhat.com,
	qemu-devel@nongnu.org
Subject: [RFC v1] virtio/vsock: add two more queues for datagram types
Date: Thu, 10 Jun 2021 00:14:24 +0000
Message-Id: <20210610001424.209158-1-jiang.wang@bytedance.com>
X-Mailer: git-send-email 2.11.0
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=jiang.wang@bytedance.com; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 09 Jun 2021 21:04:48 -0400
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

The virtio spec patch is here: 
https://www.spinics.net/lists/linux-virtualization/msg50027.html

Here is the link for the linux kernel git repo with patches
to support dgram sockets:
https://github.com/Jiang1155/linux/tree/vsock-dgram-v1

Signed-off-by: Jiang Wang <jiang.wang@bytedance.com>
---
 configure                                     | 13 +++++++++++++
 hw/virtio/vhost-vsock-common.c                | 11 ++++++++++-
 hw/virtio/vhost-vsock.c                       |  8 +++++---
 include/hw/virtio/vhost-vsock-common.h        | 10 +++++++++-
 include/standard-headers/linux/virtio_vsock.h |  3 +++
 meson.build                                   |  1 +
 6 files changed, 41 insertions(+), 5 deletions(-)

diff --git a/configure b/configure
index 9f016b06b5..6455b283a5 100755
--- a/configure
+++ b/configure
@@ -343,6 +343,7 @@ vhost_net="$default_feature"
 vhost_crypto="$default_feature"
 vhost_scsi="$default_feature"
 vhost_vsock="$default_feature"
+vhost_vsock_dgram="no"
 vhost_user="no"
 vhost_user_blk_server="auto"
 vhost_user_fs="$default_feature"
@@ -1272,6 +1273,10 @@ for opt do
   ;;
   --enable-vhost-vsock) vhost_vsock="yes"
   ;;
+  --disable-vhost-vsock-dgram) vhost_vsock_dgram="no"
+  ;;
+  --enable-vhost-vsock-dgram) vhost_vsock_dgram="yes"
+  ;;
   --disable-vhost-user-blk-server) vhost_user_blk_server="disabled"
   ;;
   --enable-vhost-user-blk-server) vhost_user_blk_server="enabled"
@@ -1839,6 +1844,7 @@ disabled with --disable-FEATURE, default is enabled if available
   attr            attr and xattr support
   vhost-net       vhost-net kernel acceleration support
   vhost-vsock     virtio sockets device support
+  vhost-vsock-dgram     virtio sockets datagram type support
   vhost-scsi      vhost-scsi kernel target support
   vhost-crypto    vhost-user-crypto backend support
   vhost-kernel    vhost kernel backend support
@@ -2389,6 +2395,10 @@ test "$vhost_vsock" = "" && vhost_vsock=$vhost_kernel
 if test "$vhost_vsock" = "yes" && test "$vhost_kernel" != "yes"; then
   error_exit "--enable-vhost-vsock requires --enable-vhost-kernel"
 fi
+test "$vhost_vsock_dgram" = "" && vhost_vsock_dgram=$vhost_vsock
+if test "$vhost_vsock_dgram" = "yes" && test "$vhost_vsock" != "yes"; then
+  error_exit "--enable-vhost-vsock-dgram requires --enable-vhost-vsock"
+fi
 
 # vhost-user backends
 test "$vhost_net_user" = "" && vhost_net_user=$vhost_user
@@ -5810,6 +5820,9 @@ if test "$vhost_vsock" = "yes" ; then
   if test "$vhost_user" = "yes" ; then
     echo "CONFIG_VHOST_USER_VSOCK=y" >> $config_host_mak
   fi
+  if test "$vhost_vsock_dgram" = "yes" ; then
+    echo "CONFIG_VHOST_VSOCK_DGRAM=y" >> $config_host_mak
+  fi
 fi
 if test "$vhost_kernel" = "yes" ; then
   echo "CONFIG_VHOST_KERNEL=y" >> $config_host_mak
diff --git a/hw/virtio/vhost-vsock-common.c b/hw/virtio/vhost-vsock-common.c
index 4ad6e234ad..fff8d12d91 100644
--- a/hw/virtio/vhost-vsock-common.c
+++ b/hw/virtio/vhost-vsock-common.c
@@ -208,7 +208,12 @@ void vhost_vsock_common_realize(VirtIODevice *vdev, const char *name)
                                       vhost_vsock_common_handle_output);
     vvc->trans_vq = virtio_add_queue(vdev, VHOST_VSOCK_QUEUE_SIZE,
                                        vhost_vsock_common_handle_output);
-
+#ifdef CONFIG_VHOST_VSOCK_DGRAM
+    vvc->dgram_recv_vq = virtio_add_queue(vdev, VHOST_VSOCK_QUEUE_SIZE,
+                                      vhost_vsock_common_handle_output);
+    vvc->dgram_trans_vq = virtio_add_queue(vdev, VHOST_VSOCK_QUEUE_SIZE,
+                                       vhost_vsock_common_handle_output);
+#endif
     /* The event queue belongs to QEMU */
     vvc->event_vq = virtio_add_queue(vdev, VHOST_VSOCK_QUEUE_SIZE,
                                        vhost_vsock_common_handle_output);
@@ -227,6 +232,10 @@ void vhost_vsock_common_unrealize(VirtIODevice *vdev)
 
     virtio_delete_queue(vvc->recv_vq);
     virtio_delete_queue(vvc->trans_vq);
+#ifdef CONFIG_VHOST_VSOCK_DGRAM
+    virtio_delete_queue(vvc->dgram_recv_vq);
+    virtio_delete_queue(vvc->dgram_trans_vq);
+#endif
     virtio_delete_queue(vvc->event_vq);
     virtio_cleanup(vdev);
 }
diff --git a/hw/virtio/vhost-vsock.c b/hw/virtio/vhost-vsock.c
index 8ddfb9abfe..f6066a69bd 100644
--- a/hw/virtio/vhost-vsock.c
+++ b/hw/virtio/vhost-vsock.c
@@ -105,11 +105,13 @@ static void vhost_vsock_set_status(VirtIODevice *vdev, uint8_t status)
 }
 
 static uint64_t vhost_vsock_get_features(VirtIODevice *vdev,
-                                         uint64_t requested_features,
+                                         uint64_t features,
                                          Error **errp)
 {
-    /* No feature bits used yet */
-    return requested_features;
+#ifdef CONFIG_VHOST_VSOCK_DGRAM
+    virtio_add_feature(&features, VIRTIO_VSOCK_F_DGRAM);
+#endif
+    return features;
 }
 
 static const VMStateDescription vmstate_virtio_vhost_vsock = {
diff --git a/include/hw/virtio/vhost-vsock-common.h b/include/hw/virtio/vhost-vsock-common.h
index e412b5ee98..647ec8c8b3 100644
--- a/include/hw/virtio/vhost-vsock-common.h
+++ b/include/hw/virtio/vhost-vsock-common.h
@@ -27,13 +27,21 @@ enum {
 struct VHostVSockCommon {
     VirtIODevice parent;
 
+#ifdef CONFIG_VHOST_VSOCK_DGRAM
+    struct vhost_virtqueue vhost_vqs[4];
+#else
     struct vhost_virtqueue vhost_vqs[2];
+#endif
+
     struct vhost_dev vhost_dev;
 
     VirtQueue *event_vq;
     VirtQueue *recv_vq;
     VirtQueue *trans_vq;
-
+#ifdef CONFIG_VHOST_VSOCK_DGRAM
+    VirtQueue *dgram_recv_vq;
+    VirtQueue *dgram_trans_vq;
+#endif
     QEMUTimer *post_load_timer;
 };
 
diff --git a/include/standard-headers/linux/virtio_vsock.h b/include/standard-headers/linux/virtio_vsock.h
index be443211ce..abcf2a8adf 100644
--- a/include/standard-headers/linux/virtio_vsock.h
+++ b/include/standard-headers/linux/virtio_vsock.h
@@ -38,6 +38,9 @@
 #include "standard-headers/linux/virtio_ids.h"
 #include "standard-headers/linux/virtio_config.h"
 
+/* Feature bits */
+#define VIRTIO_VSOCK_F_DGRAM 0 /*Does vsock support dgram */
+
 struct virtio_vsock_config {
 	uint64_t guest_cid;
 } QEMU_PACKED;
diff --git a/meson.build b/meson.build
index 3d889857a0..9d170e0476 100644
--- a/meson.build
+++ b/meson.build
@@ -2430,6 +2430,7 @@ summary_info += {'vhost-net support': config_host.has_key('CONFIG_VHOST_NET')}
 summary_info += {'vhost-crypto support': config_host.has_key('CONFIG_VHOST_CRYPTO')}
 summary_info += {'vhost-scsi support': config_host.has_key('CONFIG_VHOST_SCSI')}
 summary_info += {'vhost-vsock support': config_host.has_key('CONFIG_VHOST_VSOCK')}
+summary_info += {'vhost-vsock-dgram support': config_host.has_key('CONFIG_VHOST_VSOCK_DGRAM')}
 summary_info += {'vhost-user support': config_host.has_key('CONFIG_VHOST_USER')}
 summary_info += {'vhost-user-blk server support': have_vhost_user_blk_server}
 summary_info += {'vhost-user-fs support': config_host.has_key('CONFIG_VHOST_USER_FS')}
-- 
2.11.0


