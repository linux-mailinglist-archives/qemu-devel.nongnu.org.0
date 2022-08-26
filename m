Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0107D5A2AEA
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 17:17:39 +0200 (CEST)
Received: from localhost ([::1]:45376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRb5W-00043U-01
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 11:17:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <d-tatianin@yandex-team.ru>)
 id 1oRaOe-0004Fh-AZ; Fri, 26 Aug 2022 10:33:20 -0400
Received: from forwardcorp1o.mail.yandex.net ([95.108.205.193]:35878)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <d-tatianin@yandex-team.ru>)
 id 1oRaOb-0007Af-UG; Fri, 26 Aug 2022 10:33:20 -0400
Received: from iva4-f06c35e68a0a.qloud-c.yandex.net
 (iva4-f06c35e68a0a.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0c:152e:0:640:f06c:35e6])
 by forwardcorp1o.mail.yandex.net (Yandex) with ESMTP id E51BB2E0F26;
 Fri, 26 Aug 2022 17:33:06 +0300 (MSK)
Received: from d-tatianin-nix.yandex-team.ru (unknown
 [2a02:6b8:b081:b581::1:d])
 by iva4-f06c35e68a0a.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 7Ht2PirWaX-X5OqnhIA; Fri, 26 Aug 2022 17:33:06 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
Precedence: bulk
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1661524386; bh=C+ZHXpwmrG4+y1s6jjepg0BNXgrg5nstqnXUn4kXKaE=;
 h=Message-Id:Date:In-Reply-To:Cc:Subject:References:To:From;
 b=uHYsFaw4zHm5d8xaa+cth83bLcuPoaXuvTBQYt78Qe7tObwHj/od6J0JJ1wYSqh9j
 2VdHT1VOwonGOX2l0Boy6xXAkle8pzN421G+alztkUeDxU5tJ1K5DbhJ0la/6cf6DZ
 76wR8xvbUbTLcuYLKn/GMD46r3s+hxIN18eeEgSM=
Authentication-Results: iva4-f06c35e68a0a.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
From: Daniil Tatianin <d-tatianin@yandex-team.ru>
To: qemu-devel@nongnu.org
Cc: yc-core@yandex-team.ru, mst@redhat.com, stefanha@redhat.com,
 raphael.norwitz@nutanix.com, kwolf@redhat.com, qemu-block@nongnu.org,
 jasowang@redhat.com, d-tatianin@yandex-team.ru
Subject: [PATCH v2 1/8] virtio: introduce VirtIOConfigSizeParams &
 virtio_get_config_size
Date: Fri, 26 Aug 2022 17:32:41 +0300
Message-Id: <20220826143248.580939-2-d-tatianin@yandex-team.ru>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220826143248.580939-1-d-tatianin@yandex-team.ru>
References: <20220826143248.580939-1-d-tatianin@yandex-team.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=95.108.205.193;
 envelope-from=d-tatianin@yandex-team.ru; helo=forwardcorp1o.mail.yandex.net
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Signed-off-by: Daniil Tatianin <d-tatianin@yandex-team.ru>
---
 hw/virtio/virtio.c         | 17 +++++++++++++++++
 include/hw/virtio/virtio.h |  9 +++++++++
 2 files changed, 26 insertions(+)

diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index 5d607aeaa0..8518382025 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -3014,6 +3014,23 @@ size_t virtio_feature_get_config_size(const VirtIOFeature *feature_sizes,
     return config_size;
 }
 
+size_t virtio_get_config_size(const VirtIOConfigSizeParams *params,
+                              uint64_t host_features)
+{
+    size_t config_size = params->min_size;
+    const VirtIOFeature *feature_sizes = params->feature_sizes;
+    size_t i;
+
+    for (i = 0; feature_sizes[i].flags != 0; i++) {
+        if (host_features & feature_sizes[i].flags) {
+            config_size = MAX(feature_sizes[i].end, config_size);
+        }
+    }
+
+    assert(config_size <= params->max_size);
+    return config_size;
+}
+
 int virtio_load(VirtIODevice *vdev, QEMUFile *f, int version_id)
 {
     int i, ret;
diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
index db1c0ddf6b..1991c58d9b 100644
--- a/include/hw/virtio/virtio.h
+++ b/include/hw/virtio/virtio.h
@@ -44,6 +44,15 @@ typedef struct VirtIOFeature {
     size_t end;
 } VirtIOFeature;
 
+typedef struct VirtIOConfigSizeParams {
+    size_t min_size;
+    size_t max_size;
+    const VirtIOFeature *feature_sizes;
+} VirtIOConfigSizeParams;
+
+size_t virtio_get_config_size(const VirtIOConfigSizeParams *params,
+                              uint64_t host_features);
+
 size_t virtio_feature_get_config_size(const VirtIOFeature *features,
                                       uint64_t host_features);
 
-- 
2.25.1


