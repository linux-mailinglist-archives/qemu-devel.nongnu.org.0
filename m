Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CCF23A1A48
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 17:57:55 +0200 (CEST)
Received: from localhost ([::1]:46722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lr0aY-0005l4-6p
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 11:57:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lr0QR-0007S2-NS
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 11:47:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21793)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lr0QP-0003Zz-0Q
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 11:47:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623253644;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lafPdDNgOaGiAFN1M8pIDu3WhjvwtEu+uS/zG3ymrgQ=;
 b=JrUV8SNEeOCRy6Pf+Aacj6hOvpenoySKng9DPDmB4qQpKijUkTeNaFPNPcwKq3NwhoSsjn
 kD3fucfcLvT1os00TRaPkgFLt5Qc2Xs8UrH+wBpdCidQAlelw/TR95ASTS+QomaBZPGDeN
 SamALejLCXYfVSzsr9rL2L1RUrsBiC0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-191-RcxI_WUwMM-yuDeZ_btCDg-1; Wed, 09 Jun 2021 11:47:23 -0400
X-MC-Unique: RcxI_WUwMM-yuDeZ_btCDg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 035A9800D62;
 Wed,  9 Jun 2021 15:47:22 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-230.ams2.redhat.com [10.36.114.230])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DB24560C04;
 Wed,  9 Jun 2021 15:47:20 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH 5/7] vhost: Distinguish errors in vhost_dev_get_config()
Date: Wed,  9 Jun 2021 17:46:56 +0200
Message-Id: <20210609154658.350308-6-kwolf@redhat.com>
In-Reply-To: <20210609154658.350308-1-kwolf@redhat.com>
References: <20210609154658.350308-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, raphael.norwitz@nutanix.com, qemu-devel@nongnu.org,
 mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Instead of just returning 0/-1 and letting the caller make up a
meaningless error message, add an Error parameter to allow reporting the
real error and switch to 0/-errno so that different kind of errors can
be distinguished in the caller.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 include/hw/virtio/vhost-backend.h |  2 +-
 include/hw/virtio/vhost.h         |  4 ++--
 hw/block/vhost-user-blk.c         |  9 +++++----
 hw/display/vhost-user-gpu.c       |  6 ++++--
 hw/input/vhost-user-input.c       |  6 ++++--
 hw/net/vhost_net.c                |  2 +-
 hw/virtio/vhost-user-vsock.c      |  9 +++++----
 hw/virtio/vhost-user.c            | 24 ++++++++++++------------
 hw/virtio/vhost-vdpa.c            |  2 +-
 hw/virtio/vhost.c                 | 14 +++++++++++---
 10 files changed, 46 insertions(+), 32 deletions(-)

diff --git a/include/hw/virtio/vhost-backend.h b/include/hw/virtio/vhost-backend.h
index 728ebb0ed9..8475c5a29d 100644
--- a/include/hw/virtio/vhost-backend.h
+++ b/include/hw/virtio/vhost-backend.h
@@ -98,7 +98,7 @@ typedef int (*vhost_set_config_op)(struct vhost_dev *dev, const uint8_t *data,
                                    uint32_t offset, uint32_t size,
                                    uint32_t flags);
 typedef int (*vhost_get_config_op)(struct vhost_dev *dev, uint8_t *config,
-                                   uint32_t config_len);
+                                   uint32_t config_len, Error **errp);
 
 typedef int (*vhost_crypto_create_session_op)(struct vhost_dev *dev,
                                               void *session_info,
diff --git a/include/hw/virtio/vhost.h b/include/hw/virtio/vhost.h
index 2d7aaad67b..045d0fd9f2 100644
--- a/include/hw/virtio/vhost.h
+++ b/include/hw/virtio/vhost.h
@@ -130,8 +130,8 @@ int vhost_net_set_backend(struct vhost_dev *hdev,
                           struct vhost_vring_file *file);
 
 int vhost_device_iotlb_miss(struct vhost_dev *dev, uint64_t iova, int write);
-int vhost_dev_get_config(struct vhost_dev *dev, uint8_t *config,
-                         uint32_t config_len);
+int vhost_dev_get_config(struct vhost_dev *hdev, uint8_t *config,
+                         uint32_t config_len, Error **errp);
 int vhost_dev_set_config(struct vhost_dev *dev, const uint8_t *data,
                          uint32_t offset, uint32_t size, uint32_t flags);
 /* notifier callback in case vhost device config space changed
diff --git a/hw/block/vhost-user-blk.c b/hw/block/vhost-user-blk.c
index e9382e152a..3770f715da 100644
--- a/hw/block/vhost-user-blk.c
+++ b/hw/block/vhost-user-blk.c
@@ -91,11 +91,13 @@ static int vhost_user_blk_handle_config_change(struct vhost_dev *dev)
     int ret;
     struct virtio_blk_config blkcfg;
     VHostUserBlk *s = VHOST_USER_BLK(dev->vdev);
+    Error *local_err = NULL;
 
     ret = vhost_dev_get_config(dev, (uint8_t *)&blkcfg,
-                               sizeof(struct virtio_blk_config));
+                               sizeof(struct virtio_blk_config),
+                               &local_err);
     if (ret < 0) {
-        error_report("get config space failed");
+        error_report_err(local_err);
         return -1;
     }
 
@@ -478,9 +480,8 @@ static void vhost_user_blk_device_realize(DeviceState *dev, Error **errp)
     assert(s->connected);
 
     ret = vhost_dev_get_config(&s->dev, (uint8_t *)&s->blkcfg,
-                               sizeof(struct virtio_blk_config));
+                               sizeof(struct virtio_blk_config), errp);
     if (ret < 0) {
-        error_setg(errp, "vhost-user-blk: get block config failed");
         goto vhost_err;
     }
 
diff --git a/hw/display/vhost-user-gpu.c b/hw/display/vhost-user-gpu.c
index 6cdaa1c73b..389199e6ca 100644
--- a/hw/display/vhost-user-gpu.c
+++ b/hw/display/vhost-user-gpu.c
@@ -415,14 +415,16 @@ vhost_user_gpu_get_config(VirtIODevice *vdev, uint8_t *config_data)
     VirtIOGPUBase *b = VIRTIO_GPU_BASE(vdev);
     struct virtio_gpu_config *vgconfig =
         (struct virtio_gpu_config *)config_data;
+    Error *local_err = NULL;
     int ret;
 
     memset(config_data, 0, sizeof(struct virtio_gpu_config));
 
     ret = vhost_dev_get_config(&g->vhost->dev,
-                               config_data, sizeof(struct virtio_gpu_config));
+                               config_data, sizeof(struct virtio_gpu_config),
+                               &local_err);
     if (ret) {
-        error_report("vhost-user-gpu: get device config space failed");
+        error_report_err(local_err);
         return;
     }
 
diff --git a/hw/input/vhost-user-input.c b/hw/input/vhost-user-input.c
index 63984a8ba7..273e96a7b1 100644
--- a/hw/input/vhost-user-input.c
+++ b/hw/input/vhost-user-input.c
@@ -49,13 +49,15 @@ static void vhost_input_get_config(VirtIODevice *vdev, uint8_t *config_data)
 {
     VirtIOInput *vinput = VIRTIO_INPUT(vdev);
     VHostUserInput *vhi = VHOST_USER_INPUT(vdev);
+    Error *local_err = NULL;
     int ret;
 
     memset(config_data, 0, vinput->cfg_size);
 
-    ret = vhost_dev_get_config(&vhi->vhost->dev, config_data, vinput->cfg_size);
+    ret = vhost_dev_get_config(&vhi->vhost->dev, config_data, vinput->cfg_size,
+                               &local_err);
     if (ret) {
-        error_report("vhost-user-input: get device config space failed");
+        error_report_err(local_err);
         return;
     }
 }
diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
index 447b119f85..10a7780a13 100644
--- a/hw/net/vhost_net.c
+++ b/hw/net/vhost_net.c
@@ -117,7 +117,7 @@ uint64_t vhost_net_get_features(struct vhost_net *net, uint64_t features)
 int vhost_net_get_config(struct vhost_net *net,  uint8_t *config,
                          uint32_t config_len)
 {
-    return vhost_dev_get_config(&net->dev, config, config_len);
+    return vhost_dev_get_config(&net->dev, config, config_len, NULL);
 }
 int vhost_net_set_config(struct vhost_net *net, const uint8_t *data,
                          uint32_t offset, uint32_t size, uint32_t flags)
diff --git a/hw/virtio/vhost-user-vsock.c b/hw/virtio/vhost-user-vsock.c
index b6a4a25ea1..6095ed7349 100644
--- a/hw/virtio/vhost-user-vsock.c
+++ b/hw/virtio/vhost-user-vsock.c
@@ -34,10 +34,12 @@ static void vuv_get_config(VirtIODevice *vdev, uint8_t *config)
 static int vuv_handle_config_change(struct vhost_dev *dev)
 {
     VHostUserVSock *vsock = VHOST_USER_VSOCK(dev->vdev);
+    Error *local_err = NULL;
     int ret = vhost_dev_get_config(dev, (uint8_t *)&vsock->vsockcfg,
-                                   sizeof(struct virtio_vsock_config));
+                                   sizeof(struct virtio_vsock_config),
+                                   &local_err);
     if (ret < 0) {
-        error_report("get config space failed");
+        error_report_err(local_err);
         return -1;
     }
 
@@ -114,9 +116,8 @@ static void vuv_device_realize(DeviceState *dev, Error **errp)
     }
 
     ret = vhost_dev_get_config(&vvc->vhost_dev, (uint8_t *)&vsock->vsockcfg,
-                               sizeof(struct virtio_vsock_config));
+                               sizeof(struct virtio_vsock_config), errp);
     if (ret < 0) {
-        error_setg_errno(errp, -ret, "get config space failed");
         goto err_vhost_dev;
     }
 
diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
index 889559d86a..1ac4a2ebec 100644
--- a/hw/virtio/vhost-user.c
+++ b/hw/virtio/vhost-user.c
@@ -2117,7 +2117,7 @@ static void vhost_user_set_iotlb_callback(struct vhost_dev *dev, int enabled)
 }
 
 static int vhost_user_get_config(struct vhost_dev *dev, uint8_t *config,
-                                 uint32_t config_len)
+                                 uint32_t config_len, Error **errp)
 {
     VhostUserMsg msg = {
         .hdr.request = VHOST_USER_GET_CONFIG,
@@ -2127,32 +2127,32 @@ static int vhost_user_get_config(struct vhost_dev *dev, uint8_t *config,
 
     if (!virtio_has_feature(dev->protocol_features,
                 VHOST_USER_PROTOCOL_F_CONFIG)) {
-        return -1;
+        error_setg(errp, "VHOST_USER_PROTOCOL_F_CONFIG not supported");
+        return -EINVAL;
     }
 
-    if (config_len > VHOST_USER_MAX_CONFIG_SIZE) {
-        return -1;
-    }
+    assert(config_len <= VHOST_USER_MAX_CONFIG_SIZE);
 
     msg.payload.config.offset = 0;
     msg.payload.config.size = config_len;
     if (vhost_user_write(dev, &msg, NULL, 0) < 0) {
-        return -1;
+        return -EPROTO;
     }
 
     if (vhost_user_read(dev, &msg) < 0) {
-        return -1;
+        return -EPROTO;
     }
 
     if (msg.hdr.request != VHOST_USER_GET_CONFIG) {
-        error_report("Received unexpected msg type. Expected %d received %d",
-                     VHOST_USER_GET_CONFIG, msg.hdr.request);
-        return -1;
+        error_setg(errp,
+                   "Received unexpected msg type. Expected %d received %d",
+                   VHOST_USER_GET_CONFIG, msg.hdr.request);
+        return -EINVAL;
     }
 
     if (msg.hdr.size != VHOST_USER_CONFIG_HDR_SIZE + config_len) {
-        error_report("Received bad msg size.");
-        return -1;
+        error_setg(errp, "Received bad msg size.");
+        return -EINVAL;
     }
 
     memcpy(config, msg.payload.config.region, config_len);
diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index 71897c1a01..6b6f974a83 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -451,7 +451,7 @@ static int vhost_vdpa_set_config(struct vhost_dev *dev, const uint8_t *data,
 }
 
 static int vhost_vdpa_get_config(struct vhost_dev *dev, uint8_t *config,
-                                   uint32_t config_len)
+                                   uint32_t config_len, Error **errp)
 {
     struct vhost_vdpa_config *v_config;
     unsigned long config_size = offsetof(struct vhost_vdpa_config, buf);
diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
index c7f9d8bb06..1b66f1de70 100644
--- a/hw/virtio/vhost.c
+++ b/hw/virtio/vhost.c
@@ -1562,15 +1562,23 @@ void vhost_ack_features(struct vhost_dev *hdev, const int *feature_bits,
 }
 
 int vhost_dev_get_config(struct vhost_dev *hdev, uint8_t *config,
-                         uint32_t config_len)
+                         uint32_t config_len, Error **errp)
 {
+    ERRP_GUARD();
+    int ret;
+
     assert(hdev->vhost_ops);
 
     if (hdev->vhost_ops->vhost_get_config) {
-        return hdev->vhost_ops->vhost_get_config(hdev, config, config_len);
+        ret = hdev->vhost_ops->vhost_get_config(hdev, config, config_len, errp);
+        if (ret < 0 && !*errp) {
+            error_setg_errno(errp, -ret, "vhost_get_config failed");
+        }
+        return ret;
     }
 
-    return -1;
+    error_setg(errp, "vhost_dev_get_config not implemented");
+    return -ENOTSUP;
 }
 
 int vhost_dev_set_config(struct vhost_dev *hdev, const uint8_t *data,
-- 
2.30.2


