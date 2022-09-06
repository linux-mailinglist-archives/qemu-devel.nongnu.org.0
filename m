Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4775C5AE12F
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Sep 2022 09:36:22 +0200 (CEST)
Received: from localhost ([::1]:51388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVT89-0008BM-4F
	for lists+qemu-devel@lfdr.de; Tue, 06 Sep 2022 03:36:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <d-tatianin@yandex-team.ru>)
 id 1oVT3Y-0003Is-0z; Tue, 06 Sep 2022 03:31:36 -0400
Received: from forwardcorp1o.mail.yandex.net ([2a02:6b8:0:1a2d::193]:43740)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <d-tatianin@yandex-team.ru>)
 id 1oVT3S-0002xN-BR; Tue, 06 Sep 2022 03:31:35 -0400
Received: from vla1-81430ab5870b.qloud-c.yandex.net
 (vla1-81430ab5870b.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0d:35a1:0:640:8143:ab5])
 by forwardcorp1o.mail.yandex.net (Yandex) with ESMTP id F18FF2E0F42;
 Tue,  6 Sep 2022 10:31:17 +0300 (MSK)
Received: from d-tatianin-nix.yandex.net (unknown
 [2a02:6b8:0:419:d8d0:8d85:2aad:ab5b])
 by vla1-81430ab5870b.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 WefwVQnsrp-VGXi6Avj; Tue, 06 Sep 2022 10:31:16 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
Precedence: bulk
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1662449476; bh=KNrFvrgdy1NLNEup9+sDAaS59t6E16z0cqN39qUBNac=;
 h=Message-Id:Date:In-Reply-To:Cc:Subject:References:To:From;
 b=xZZ2bBNlYnCt0xJ1ttSE3NyiWeCLYdIISK+50vWvWRt1pjTiEDtEzLlkrXOQBqIFe
 9lWU4ScDY5PMrLl1p4Uj4JUzhW9BUx7/jW435vnpH9nv5a4YCSuiZeXs5ifRr3sCi5
 U9Z3/w9byLx0tST9dVI1Mshs2xkXL9sxXR3qjfIc=
Authentication-Results: vla1-81430ab5870b.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
From: Daniil Tatianin <d-tatianin@yandex-team.ru>
To: qemu-devel@nongnu.org
Cc: yc-core@yandex-team.ru, mst@redhat.com, stefanha@redhat.com,
 raphael.norwitz@nutanix.com, kwolf@redhat.com, qemu-block@nongnu.org,
 jasowang@redhat.com, d-tatianin@yandex-team.ru
Subject: [PATCH v3 1/5] virtio: introduce VirtIOConfigSizeParams &
 virtio_get_config_size
Date: Tue,  6 Sep 2022 10:31:07 +0300
Message-Id: <20220906073111.353245-2-d-tatianin@yandex-team.ru>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220906073111.353245-1-d-tatianin@yandex-team.ru>
References: <20220906073111.353245-1-d-tatianin@yandex-team.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a02:6b8:0:1a2d::193;
 envelope-from=d-tatianin@yandex-team.ru; helo=forwardcorp1o.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is the first step towards moving all device config size calculation
logic into the virtio core code. In particular, this adds a struct that
contains all the necessary information for common virtio code to be able
to calculate the final config size for a device. This is expected to be
used with the new virtio_get_config_size helper, which calculates the
final length based on the provided host features.

This builds on top of already existing code like VirtIOFeature and
virtio_feature_get_config_size(), but adds additional fields, as well as
sanity checking so that device-specifc code doesn't have to duplicate it.

An example usage would be:

    static const VirtIOFeature dev_features[] = {
        {.flags = 1ULL << FEATURE_1_BIT,
         .end = endof(struct virtio_dev_config, feature_1)},
        {.flags = 1ULL << FEATURE_2_BIT,
         .end = endof(struct virtio_dev_config, feature_2)},
        {}
    };

    static const VirtIOConfigSizeParams dev_cfg_size_params = {
        .min_size = DEV_BASE_CONFIG_SIZE,
        .max_size = sizeof(struct virtio_dev_config),
        .feature_sizes = dev_features
    };

    // code inside my_dev_device_realize()
    size_t config_size = virtio_get_config_size(&dev_cfg_size_params,
                                                host_features);
    virtio_init(vdev, VIRTIO_ID_MYDEV, config_size);

Currently every device is expected to write its own boilerplate from the
example above in device_realize(), however, the next step of this
transition is moving VirtIOConfigSizeParams into VirtioDeviceClass,
so that it can be done automatically by the virtio initialization code.

All of the users of virtio_feature_get_config_size have been converted
to use virtio_get_config_size so it's no longer needed and is removed
with this commit.

Signed-off-by: Daniil Tatianin <d-tatianin@yandex-team.ru>
---
 hw/block/virtio-blk.c      | 16 +++++++---------
 hw/net/virtio-net.c        |  9 +++++++--
 hw/virtio/virtio.c         | 10 ++++++----
 include/hw/virtio/virtio.h | 10 ++++++++--
 4 files changed, 28 insertions(+), 17 deletions(-)

diff --git a/hw/block/virtio-blk.c b/hw/block/virtio-blk.c
index e9ba752f6b..10c47c2934 100644
--- a/hw/block/virtio-blk.c
+++ b/hw/block/virtio-blk.c
@@ -49,13 +49,11 @@ static const VirtIOFeature feature_sizes[] = {
     {}
 };
 
-static void virtio_blk_set_config_size(VirtIOBlock *s, uint64_t host_features)
-{
-    s->config_size = MAX(VIRTIO_BLK_CFG_SIZE,
-        virtio_feature_get_config_size(feature_sizes, host_features));
-
-    assert(s->config_size <= sizeof(struct virtio_blk_config));
-}
+static const VirtIOConfigSizeParams cfg_size_params = {
+    .min_size = VIRTIO_BLK_CFG_SIZE,
+    .max_size = sizeof(struct virtio_blk_config),
+    .feature_sizes = feature_sizes
+};
 
 static void virtio_blk_init_request(VirtIOBlock *s, VirtQueue *vq,
                                     VirtIOBlockReq *req)
@@ -1204,8 +1202,8 @@ static void virtio_blk_device_realize(DeviceState *dev, Error **errp)
         return;
     }
 
-    virtio_blk_set_config_size(s, s->host_features);
-
+    s->config_size = virtio_get_config_size(&cfg_size_params,
+                                            s->host_features);
     virtio_init(vdev, VIRTIO_ID_BLOCK, s->config_size);
 
     s->blk = conf->conf.blk;
diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index dd0d056fde..78b003a158 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -106,6 +106,12 @@ static const VirtIOFeature feature_sizes[] = {
     {}
 };
 
+static const VirtIOConfigSizeParams cfg_size_params = {
+    .min_size = endof(struct virtio_net_config, mac),
+    .max_size = sizeof(struct virtio_net_config),
+    .feature_sizes = feature_sizes
+};
+
 static VirtIONetQueue *virtio_net_get_subqueue(NetClientState *nc)
 {
     VirtIONet *n = qemu_get_nic_opaque(nc);
@@ -3246,8 +3252,7 @@ static void virtio_net_set_config_size(VirtIONet *n, uint64_t host_features)
 {
     virtio_add_feature(&host_features, VIRTIO_NET_F_MAC);
 
-    n->config_size = virtio_feature_get_config_size(feature_sizes,
-                                                    host_features);
+    n->config_size = virtio_get_config_size(&cfg_size_params, host_features);
 }
 
 void virtio_net_set_netclient_name(VirtIONet *n, const char *name,
diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index 5d607aeaa0..c0bf8dd6fd 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -2999,11 +2999,12 @@ int virtio_set_features(VirtIODevice *vdev, uint64_t val)
     return ret;
 }
 
-size_t virtio_feature_get_config_size(const VirtIOFeature *feature_sizes,
-                                      uint64_t host_features)
+size_t virtio_get_config_size(const VirtIOConfigSizeParams *params,
+                              uint64_t host_features)
 {
-    size_t config_size = 0;
-    int i;
+    size_t config_size = params->min_size;
+    const VirtIOFeature *feature_sizes = params->feature_sizes;
+    size_t i;
 
     for (i = 0; feature_sizes[i].flags != 0; i++) {
         if (host_features & feature_sizes[i].flags) {
@@ -3011,6 +3012,7 @@ size_t virtio_feature_get_config_size(const VirtIOFeature *feature_sizes,
         }
     }
 
+    assert(config_size <= params->max_size);
     return config_size;
 }
 
diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
index db1c0ddf6b..f3ff6710d5 100644
--- a/include/hw/virtio/virtio.h
+++ b/include/hw/virtio/virtio.h
@@ -44,8 +44,14 @@ typedef struct VirtIOFeature {
     size_t end;
 } VirtIOFeature;
 
-size_t virtio_feature_get_config_size(const VirtIOFeature *features,
-                                      uint64_t host_features);
+typedef struct VirtIOConfigSizeParams {
+    size_t min_size;
+    size_t max_size;
+    const VirtIOFeature *feature_sizes;
+} VirtIOConfigSizeParams;
+
+size_t virtio_get_config_size(const VirtIOConfigSizeParams *params,
+                              uint64_t host_features);
 
 typedef struct VirtQueue VirtQueue;
 
-- 
2.25.1


