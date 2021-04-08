Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1803A358067
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Apr 2021 12:16:28 +0200 (CEST)
Received: from localhost ([::1]:49130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lURi7-0005jx-2o
	for lists+qemu-devel@lfdr.de; Thu, 08 Apr 2021 06:16:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xieyongji@bytedance.com>)
 id 1lURfK-00041I-A2
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 06:13:34 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:38562)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xieyongji@bytedance.com>)
 id 1lURfG-0008R6-2X
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 06:13:33 -0400
Received: by mail-pf1-x433.google.com with SMTP id y16so1446551pfc.5
 for <qemu-devel@nongnu.org>; Thu, 08 Apr 2021 03:13:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GdQA7i4e1lBcy96gGo+TunSjaHhdX0SSaNjE/aE+L9I=;
 b=wGlxRkgq+Q3noNbBmCDe/+hb35I4QFHDksI1IFt499UucVmI5cV2nTwOtBZxc//c/T
 pXuSqdr+Ye1rIu+oqVgYOr5QOuuM6ENEDzudVqG2STP4vyKjbzeBLrVWBH7FYKldkD6U
 ZFAaSVjIK+D3d8YeaaYHb0pqaYrMcBsFHJ9PHGmXUuJ/riu3aPrda12NFK4IxkRoPYIo
 Ko9e4HOidI7is3N3xnhlhvr88fURXZ5Fed+3APDL6Ut1sfL3iDLKRyNrX8wg4Zgd/Vuz
 4mdp2hnO/vO5RJcZGTLi8rAhHG3nTrlxnPQmm8NV01raFvYr9A/xb1bn34YWevmeYnqT
 HNGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GdQA7i4e1lBcy96gGo+TunSjaHhdX0SSaNjE/aE+L9I=;
 b=bga8CZPKz8twST77FLna3xLa6zVykqtsohmz02nVlpFknq7WznocYo0guaWk8S/bnK
 5irJ4xpcZcJmvQWzPAgQLem//bN6QgN5MQC9bx60E4VHmq/x0cayrKFewzj07D/qehqc
 N5YtvxfGFXuYgGSaccv4189MgZWILQ7QTVVRx/M36cR9ITYkQiAVNj9ZtLYutcyK9HxW
 e1L5Bmc+jmcwfCtayoLiKNN/S39MgxXh8iQCQWx0LmYWoF5xLp71/p7PZadoGmKsDF3G
 BDHXmjQ9ESIFi4bRF/Br8gTVfo0oVIz4jKsXMa2Kh6ktgqWwnoJ2v5uysrgzw4/9Oy0y
 Vq0g==
X-Gm-Message-State: AOAM5333iSD+tSM+Q5jSzujIKTb6eNGji1/FAXcxwfia5QqEiFLZL3a9
 DFkn5k8tompLE2Qx9iS6uumu
X-Google-Smtp-Source: ABdhPJz8TUMPsTS1Vs0OLdOsvxIvxQWOzWSK8e3jZw9/fQSMSbY26ZGZCY2/ydL4+Ayv8L8rWqnkQw==
X-Received: by 2002:aa7:9989:0:b029:1f5:aa05:94af with SMTP id
 k9-20020aa799890000b02901f5aa0594afmr6960796pfh.34.1617876808562; 
 Thu, 08 Apr 2021 03:13:28 -0700 (PDT)
Received: from localhost ([139.177.225.243])
 by smtp.gmail.com with ESMTPSA id j13sm23742058pfn.103.2021.04.08.03.13.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Apr 2021 03:13:28 -0700 (PDT)
From: Xie Yongji <xieyongji@bytedance.com>
To: mst@redhat.com, stefanha@redhat.com, sgarzare@redhat.com,
 raphael.norwitz@nutanix.com, lingshan.zhu@intel.com,
 changpeng.liu@intel.com, jasowang@redhat.com, kwolf@redhat.com,
 mreitz@redhat.com
Subject: [PATCH 2/3] vhost-blk: Add vhost-blk-common abstraction
Date: Thu,  8 Apr 2021 18:12:51 +0800
Message-Id: <20210408101252.552-3-xieyongji@bytedance.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210408101252.552-1-xieyongji@bytedance.com>
References: <20210408101252.552-1-xieyongji@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=xieyongji@bytedance.com; helo=mail-pf1-x433.google.com
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This commit abstracts part of vhost-user-blk into a common
parent class which is useful for the introducation of vhost-vdpa-blk.

Signed-off-by: Xie Yongji <xieyongji@bytedance.com>
---
 hw/block/meson.build                 |   2 +-
 hw/block/vhost-blk-common.c          | 291 +++++++++++++++++++++++++
 hw/block/vhost-user-blk.c            | 306 +++++----------------------
 hw/virtio/vhost-user-blk-pci.c       |   7 +-
 include/hw/virtio/vhost-blk-common.h |  50 +++++
 include/hw/virtio/vhost-user-blk.h   |  20 +-
 6 files changed, 396 insertions(+), 280 deletions(-)
 create mode 100644 hw/block/vhost-blk-common.c
 create mode 100644 include/hw/virtio/vhost-blk-common.h

diff --git a/hw/block/meson.build b/hw/block/meson.build
index 5b4a7699f9..5862bda4cb 100644
--- a/hw/block/meson.build
+++ b/hw/block/meson.build
@@ -16,6 +16,6 @@ softmmu_ss.add(when: 'CONFIG_TC58128', if_true: files('tc58128.c'))
 softmmu_ss.add(when: 'CONFIG_NVME_PCI', if_true: files('nvme.c', 'nvme-ns.c', 'nvme-subsys.c', 'nvme-dif.c'))
 
 specific_ss.add(when: 'CONFIG_VIRTIO_BLK', if_true: files('virtio-blk.c'))
-specific_ss.add(when: 'CONFIG_VHOST_USER_BLK', if_true: files('vhost-user-blk.c'))
+specific_ss.add(when: 'CONFIG_VHOST_USER_BLK', if_true: files('vhost-blk-common.c', 'vhost-user-blk.c'))
 
 subdir('dataplane')
diff --git a/hw/block/vhost-blk-common.c b/hw/block/vhost-blk-common.c
new file mode 100644
index 0000000000..96500f6c89
--- /dev/null
+++ b/hw/block/vhost-blk-common.c
@@ -0,0 +1,291 @@
+/*
+ * Parent class for vhost based block devices
+ *
+ * Copyright (C) 2021 Bytedance Inc. and/or its affiliates. All rights reserved.
+ *
+ * Author:
+ *   Xie Yongji <xieyongji@bytedance.com>
+ *
+ * Heavily based on the vhost-user-blk.c by:
+ *   Changpeng Liu <changpeng.liu@intel.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See
+ * the COPYING file in the top-level directory.
+ *
+ */
+
+#include "qemu/osdep.h"
+#include "qapi/error.h"
+#include "qemu/error-report.h"
+#include "qemu/cutils.h"
+#include "hw/qdev-core.h"
+#include "hw/qdev-properties.h"
+#include "hw/qdev-properties-system.h"
+#include "hw/virtio/vhost.h"
+#include "hw/virtio/virtio.h"
+#include "hw/virtio/virtio-bus.h"
+#include "hw/virtio/virtio-access.h"
+#include "hw/virtio/vhost-blk-common.h"
+#include "sysemu/sysemu.h"
+#include "sysemu/runstate.h"
+
+static void vhost_blk_common_update_config(VirtIODevice *vdev, uint8_t *config)
+{
+    VHostBlkCommon *vbc = VHOST_BLK_COMMON(vdev);
+
+    /* Our num_queues overrides the device backend */
+    virtio_stw_p(vdev, &vbc->blkcfg.num_queues, vbc->num_queues);
+
+    memcpy(config, &vbc->blkcfg, sizeof(struct virtio_blk_config));
+}
+
+static void vhost_blk_common_set_config(VirtIODevice *vdev,
+                                        const uint8_t *config)
+{
+    VHostBlkCommon *vbc = VHOST_BLK_COMMON(vdev);
+    struct virtio_blk_config *blkcfg = (struct virtio_blk_config *)config;
+    int ret;
+
+    if (blkcfg->wce == vbc->blkcfg.wce) {
+        return;
+    }
+
+    ret = vhost_dev_set_config(&vbc->dev, &blkcfg->wce,
+                               offsetof(struct virtio_blk_config, wce),
+                               sizeof(blkcfg->wce),
+                               VHOST_SET_CONFIG_TYPE_MASTER);
+    if (ret) {
+        error_report("set device config space failed");
+        return;
+    }
+
+    vbc->blkcfg.wce = blkcfg->wce;
+}
+
+static int vhost_blk_common_handle_config_change(struct vhost_dev *dev)
+{
+    VHostBlkCommon *vbc = VHOST_BLK_COMMON(dev->vdev);
+    struct virtio_blk_config blkcfg;
+    int ret;
+
+    ret = vhost_dev_get_config(dev, (uint8_t *)&blkcfg,
+                               sizeof(struct virtio_blk_config));
+    if (ret < 0) {
+        error_report("get config space failed");
+        return ret;
+    }
+
+    /* valid for resize only */
+    if (blkcfg.capacity != vbc->blkcfg.capacity) {
+        vbc->blkcfg.capacity = blkcfg.capacity;
+        memcpy(dev->vdev->config, &vbc->blkcfg,
+               sizeof(struct virtio_blk_config));
+        virtio_notify_config(dev->vdev);
+    }
+
+    return 0;
+}
+
+const VhostDevConfigOps blk_ops = {
+    .vhost_dev_config_notifier = vhost_blk_common_handle_config_change,
+};
+
+static uint64_t vhost_blk_common_get_features(VirtIODevice *vdev,
+                                              uint64_t features,
+                                              Error **errp)
+{
+    VHostBlkCommon *vbc = VHOST_BLK_COMMON(vdev);
+
+    /* Turn on pre-defined features */
+    virtio_add_feature(&features, VIRTIO_BLK_F_SEG_MAX);
+    virtio_add_feature(&features, VIRTIO_BLK_F_GEOMETRY);
+    virtio_add_feature(&features, VIRTIO_BLK_F_TOPOLOGY);
+    virtio_add_feature(&features, VIRTIO_BLK_F_BLK_SIZE);
+    virtio_add_feature(&features, VIRTIO_BLK_F_FLUSH);
+    virtio_add_feature(&features, VIRTIO_BLK_F_RO);
+    virtio_add_feature(&features, VIRTIO_BLK_F_DISCARD);
+    virtio_add_feature(&features, VIRTIO_BLK_F_WRITE_ZEROES);
+
+    if (vbc->config_wce) {
+        virtio_add_feature(&features, VIRTIO_BLK_F_CONFIG_WCE);
+    }
+    if (vbc->num_queues > 1) {
+        virtio_add_feature(&features, VIRTIO_BLK_F_MQ);
+    }
+
+    return vhost_get_features(&vbc->dev, vbc->feature_bits, features);
+}
+
+int vhost_blk_common_start(VHostBlkCommon *vbc)
+{
+    VirtIODevice *vdev = VIRTIO_DEVICE(vbc);
+    BusState *qbus = BUS(qdev_get_parent_bus(DEVICE(vdev)));
+    VirtioBusClass *k = VIRTIO_BUS_GET_CLASS(qbus);
+    int i, ret;
+
+    if (!k->set_guest_notifiers) {
+        error_report("binding does not support guest notifiers");
+        return -ENOSYS;
+    }
+
+    ret = vhost_dev_enable_notifiers(&vbc->dev, vdev);
+    if (ret < 0) {
+        error_report("Error enabling host notifiers: %d", -ret);
+        return ret;
+    }
+
+    ret = k->set_guest_notifiers(qbus->parent, vbc->dev.nvqs, true);
+    if (ret < 0) {
+        error_report("Error binding guest notifier: %d", -ret);
+        goto err_host_notifiers;
+    }
+
+    vbc->dev.acked_features = vdev->guest_features;
+
+    ret = vhost_dev_prepare_inflight(&vbc->dev, vdev);
+    if (ret < 0) {
+        error_report("Error set inflight format: %d", -ret);
+        goto err_guest_notifiers;
+    }
+
+    if (!vbc->inflight->addr) {
+        ret = vhost_dev_get_inflight(&vbc->dev, vbc->queue_size, vbc->inflight);
+        if (ret < 0) {
+            error_report("Error get inflight: %d", -ret);
+            goto err_guest_notifiers;
+        }
+    }
+
+    ret = vhost_dev_set_inflight(&vbc->dev, vbc->inflight);
+    if (ret < 0) {
+        error_report("Error set inflight: %d", -ret);
+        goto err_guest_notifiers;
+    }
+
+    ret = vhost_dev_start(&vbc->dev, vdev);
+    if (ret < 0) {
+        error_report("Error starting vhost: %d", -ret);
+        goto err_guest_notifiers;
+    }
+    vbc->started = true;
+
+    /* guest_notifier_mask/pending not used yet, so just unmask
+     * everything here. virtio-pci will do the right thing by
+     * enabling/disabling irqfd.
+     */
+    for (i = 0; i < vbc->dev.nvqs; i++) {
+        vhost_virtqueue_mask(&vbc->dev, vdev, i, false);
+    }
+
+    return ret;
+
+err_guest_notifiers:
+    k->set_guest_notifiers(qbus->parent, vbc->dev.nvqs, false);
+err_host_notifiers:
+    vhost_dev_disable_notifiers(&vbc->dev, vdev);
+    return ret;
+}
+
+void vhost_blk_common_stop(VHostBlkCommon *vbc)
+{
+    VirtIODevice *vdev = VIRTIO_DEVICE(vbc);
+    BusState *qbus = BUS(qdev_get_parent_bus(DEVICE(vdev)));
+    VirtioBusClass *k = VIRTIO_BUS_GET_CLASS(qbus);
+    int ret;
+
+    if (!vbc->started) {
+        return;
+    }
+    vbc->started = false;
+
+    if (!k->set_guest_notifiers) {
+        return;
+    }
+
+    vhost_dev_stop(&vbc->dev, vdev);
+
+    ret = k->set_guest_notifiers(qbus->parent, vbc->dev.nvqs, false);
+    if (ret < 0) {
+        error_report("vhost guest notifier cleanup failed: %d", ret);
+        return;
+    }
+
+    vhost_dev_disable_notifiers(&vbc->dev, vdev);
+}
+
+void vhost_blk_common_realize(VHostBlkCommon *vbc,
+                              VirtIOHandleOutput handle_output,
+                              Error **errp)
+{
+    VirtIODevice *vdev = VIRTIO_DEVICE(vbc);
+    int i;
+
+    if (vbc->num_queues == VHOST_BLK_AUTO_NUM_QUEUES) {
+        vbc->num_queues = 1;
+    }
+
+    if (!vbc->num_queues || vbc->num_queues > VIRTIO_QUEUE_MAX) {
+        error_setg(errp, "vhost-blk-common: invalid number of IO queues");
+        return;
+    }
+
+    if (!vbc->queue_size) {
+        error_setg(errp, "vhost-blk-common: queue size must be non-zero");
+        return;
+    }
+
+    virtio_init(vdev, "virtio-blk", VIRTIO_ID_BLOCK,
+                sizeof(struct virtio_blk_config));
+
+    vbc->virtqs = g_new(VirtQueue *, vbc->num_queues);
+    for (i = 0; i < vbc->num_queues; i++) {
+        vbc->virtqs[i] = virtio_add_queue(vdev, vbc->queue_size,
+                                          handle_output);
+    }
+
+    vbc->inflight = g_new0(struct vhost_inflight, 1);
+    vbc->vhost_vqs = g_new0(struct vhost_virtqueue, vbc->num_queues);
+}
+
+void vhost_blk_common_unrealize(VHostBlkCommon *vbc)
+{
+    VirtIODevice *vdev = VIRTIO_DEVICE(vbc);
+    int i;
+
+    g_free(vbc->vhost_vqs);
+    vbc->vhost_vqs = NULL;
+    g_free(vbc->inflight);
+    vbc->inflight = NULL;
+
+    for (i = 0; i < vbc->num_queues; i++) {
+        virtio_delete_queue(vbc->virtqs[i]);
+    }
+    g_free(vbc->virtqs);
+    virtio_cleanup(vdev);
+}
+
+static void vhost_blk_common_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    VirtioDeviceClass *vdc = VIRTIO_DEVICE_CLASS(klass);
+
+    set_bit(DEVICE_CATEGORY_STORAGE, dc->categories);
+    vdc->get_config = vhost_blk_common_update_config;
+    vdc->set_config = vhost_blk_common_set_config;
+    vdc->get_features = vhost_blk_common_get_features;
+}
+
+static const TypeInfo vhost_blk_common_info = {
+    .name = TYPE_VHOST_BLK_COMMON,
+    .parent = TYPE_VIRTIO_DEVICE,
+    .instance_size = sizeof(VHostBlkCommon),
+    .class_init = vhost_blk_common_class_init,
+    .abstract = true,
+};
+
+static void virtio_register_types(void)
+{
+    type_register_static(&vhost_blk_common_info);
+}
+
+type_init(virtio_register_types)
diff --git a/hw/block/vhost-user-blk.c b/hw/block/vhost-user-blk.c
index 0b5b9d44cd..0ad2cc030a 100644
--- a/hw/block/vhost-user-blk.c
+++ b/hw/block/vhost-user-blk.c
@@ -50,165 +50,10 @@ static const int user_feature_bits[] = {
     VHOST_INVALID_FEATURE_BIT
 };
 
-static void vhost_user_blk_update_config(VirtIODevice *vdev, uint8_t *config)
-{
-    VHostUserBlk *s = VHOST_USER_BLK(vdev);
-
-    /* Our num_queues overrides the device backend */
-    virtio_stw_p(vdev, &s->blkcfg.num_queues, s->num_queues);
-
-    memcpy(config, &s->blkcfg, sizeof(struct virtio_blk_config));
-}
-
-static void vhost_user_blk_set_config(VirtIODevice *vdev, const uint8_t *config)
-{
-    VHostUserBlk *s = VHOST_USER_BLK(vdev);
-    struct virtio_blk_config *blkcfg = (struct virtio_blk_config *)config;
-    int ret;
-
-    if (blkcfg->wce == s->blkcfg.wce) {
-        return;
-    }
-
-    ret = vhost_dev_set_config(&s->dev, &blkcfg->wce,
-                               offsetof(struct virtio_blk_config, wce),
-                               sizeof(blkcfg->wce),
-                               VHOST_SET_CONFIG_TYPE_MASTER);
-    if (ret) {
-        error_report("set device config space failed");
-        return;
-    }
-
-    s->blkcfg.wce = blkcfg->wce;
-}
-
-static int vhost_user_blk_handle_config_change(struct vhost_dev *dev)
-{
-    int ret;
-    struct virtio_blk_config blkcfg;
-    VHostUserBlk *s = VHOST_USER_BLK(dev->vdev);
-
-    ret = vhost_dev_get_config(dev, (uint8_t *)&blkcfg,
-                               sizeof(struct virtio_blk_config));
-    if (ret < 0) {
-        error_report("get config space failed");
-        return -1;
-    }
-
-    /* valid for resize only */
-    if (blkcfg.capacity != s->blkcfg.capacity) {
-        s->blkcfg.capacity = blkcfg.capacity;
-        memcpy(dev->vdev->config, &s->blkcfg, sizeof(struct virtio_blk_config));
-        virtio_notify_config(dev->vdev);
-    }
-
-    return 0;
-}
-
-const VhostDevConfigOps blk_ops = {
-    .vhost_dev_config_notifier = vhost_user_blk_handle_config_change,
-};
-
-static int vhost_user_blk_start(VirtIODevice *vdev)
-{
-    VHostUserBlk *s = VHOST_USER_BLK(vdev);
-    BusState *qbus = BUS(qdev_get_parent_bus(DEVICE(vdev)));
-    VirtioBusClass *k = VIRTIO_BUS_GET_CLASS(qbus);
-    int i, ret;
-
-    if (!k->set_guest_notifiers) {
-        error_report("binding does not support guest notifiers");
-        return -ENOSYS;
-    }
-
-    ret = vhost_dev_enable_notifiers(&s->dev, vdev);
-    if (ret < 0) {
-        error_report("Error enabling host notifiers: %d", -ret);
-        return ret;
-    }
-
-    ret = k->set_guest_notifiers(qbus->parent, s->dev.nvqs, true);
-    if (ret < 0) {
-        error_report("Error binding guest notifier: %d", -ret);
-        goto err_host_notifiers;
-    }
-
-    s->dev.acked_features = vdev->guest_features;
-
-    ret = vhost_dev_prepare_inflight(&s->dev, vdev);
-    if (ret < 0) {
-        error_report("Error set inflight format: %d", -ret);
-        goto err_guest_notifiers;
-    }
-
-    if (!s->inflight->addr) {
-        ret = vhost_dev_get_inflight(&s->dev, s->queue_size, s->inflight);
-        if (ret < 0) {
-            error_report("Error get inflight: %d", -ret);
-            goto err_guest_notifiers;
-        }
-    }
-
-    ret = vhost_dev_set_inflight(&s->dev, s->inflight);
-    if (ret < 0) {
-        error_report("Error set inflight: %d", -ret);
-        goto err_guest_notifiers;
-    }
-
-    ret = vhost_dev_start(&s->dev, vdev);
-    if (ret < 0) {
-        error_report("Error starting vhost: %d", -ret);
-        goto err_guest_notifiers;
-    }
-    s->started_vu = true;
-
-    /* guest_notifier_mask/pending not used yet, so just unmask
-     * everything here. virtio-pci will do the right thing by
-     * enabling/disabling irqfd.
-     */
-    for (i = 0; i < s->dev.nvqs; i++) {
-        vhost_virtqueue_mask(&s->dev, vdev, i, false);
-    }
-
-    return ret;
-
-err_guest_notifiers:
-    k->set_guest_notifiers(qbus->parent, s->dev.nvqs, false);
-err_host_notifiers:
-    vhost_dev_disable_notifiers(&s->dev, vdev);
-    return ret;
-}
-
-static void vhost_user_blk_stop(VirtIODevice *vdev)
-{
-    VHostUserBlk *s = VHOST_USER_BLK(vdev);
-    BusState *qbus = BUS(qdev_get_parent_bus(DEVICE(vdev)));
-    VirtioBusClass *k = VIRTIO_BUS_GET_CLASS(qbus);
-    int ret;
-
-    if (!s->started_vu) {
-        return;
-    }
-    s->started_vu = false;
-
-    if (!k->set_guest_notifiers) {
-        return;
-    }
-
-    vhost_dev_stop(&s->dev, vdev);
-
-    ret = k->set_guest_notifiers(qbus->parent, s->dev.nvqs, false);
-    if (ret < 0) {
-        error_report("vhost guest notifier cleanup failed: %d", ret);
-        return;
-    }
-
-    vhost_dev_disable_notifiers(&s->dev, vdev);
-}
-
 static void vhost_user_blk_set_status(VirtIODevice *vdev, uint8_t status)
 {
     VHostUserBlk *s = VHOST_USER_BLK(vdev);
+    VHostBlkCommon *vbc = VHOST_BLK_COMMON(s);
     bool should_start = virtio_device_started(vdev, status);
     int ret;
 
@@ -220,52 +65,27 @@ static void vhost_user_blk_set_status(VirtIODevice *vdev, uint8_t status)
         return;
     }
 
-    if (s->dev.started == should_start) {
+    if (vbc->dev.started == should_start) {
         return;
     }
 
     if (should_start) {
-        ret = vhost_user_blk_start(vdev);
+        ret = vhost_blk_common_start(vbc);
         if (ret < 0) {
             error_report("vhost-user-blk: vhost start failed: %s",
                          strerror(-ret));
             qemu_chr_fe_disconnect(&s->chardev);
         }
     } else {
-        vhost_user_blk_stop(vdev);
+        vhost_blk_common_stop(vbc);
     }
 
 }
 
-static uint64_t vhost_user_blk_get_features(VirtIODevice *vdev,
-                                            uint64_t features,
-                                            Error **errp)
-{
-    VHostUserBlk *s = VHOST_USER_BLK(vdev);
-
-    /* Turn on pre-defined features */
-    virtio_add_feature(&features, VIRTIO_BLK_F_SEG_MAX);
-    virtio_add_feature(&features, VIRTIO_BLK_F_GEOMETRY);
-    virtio_add_feature(&features, VIRTIO_BLK_F_TOPOLOGY);
-    virtio_add_feature(&features, VIRTIO_BLK_F_BLK_SIZE);
-    virtio_add_feature(&features, VIRTIO_BLK_F_FLUSH);
-    virtio_add_feature(&features, VIRTIO_BLK_F_RO);
-    virtio_add_feature(&features, VIRTIO_BLK_F_DISCARD);
-    virtio_add_feature(&features, VIRTIO_BLK_F_WRITE_ZEROES);
-
-    if (s->config_wce) {
-        virtio_add_feature(&features, VIRTIO_BLK_F_CONFIG_WCE);
-    }
-    if (s->num_queues > 1) {
-        virtio_add_feature(&features, VIRTIO_BLK_F_MQ);
-    }
-
-    return vhost_get_features(&s->dev, user_feature_bits, features);
-}
-
 static void vhost_user_blk_handle_output(VirtIODevice *vdev, VirtQueue *vq)
 {
     VHostUserBlk *s = VHOST_USER_BLK(vdev);
+    VHostBlkCommon *vbc = VHOST_BLK_COMMON(s);
     int i, ret;
 
     if (!vdev->start_on_kick) {
@@ -276,14 +96,14 @@ static void vhost_user_blk_handle_output(VirtIODevice *vdev, VirtQueue *vq)
         return;
     }
 
-    if (s->dev.started) {
+    if (vbc->dev.started) {
         return;
     }
 
     /* Some guests kick before setting VIRTIO_CONFIG_S_DRIVER_OK so start
      * vhost here instead of waiting for .set_status().
      */
-    ret = vhost_user_blk_start(vdev);
+    ret = vhost_blk_common_start(vbc);
     if (ret < 0) {
         error_report("vhost-user-blk: vhost start failed: %s",
                      strerror(-ret));
@@ -292,7 +112,7 @@ static void vhost_user_blk_handle_output(VirtIODevice *vdev, VirtQueue *vq)
     }
 
     /* Kick right away to begin processing requests already in vring */
-    for (i = 0; i < s->dev.nvqs; i++) {
+    for (i = 0; i < vbc->dev.nvqs; i++) {
         VirtQueue *kick_vq = virtio_get_queue(vdev, i);
 
         if (!virtio_queue_get_desc_addr(vdev, i)) {
@@ -305,14 +125,16 @@ static void vhost_user_blk_handle_output(VirtIODevice *vdev, VirtQueue *vq)
 static void vhost_user_blk_reset(VirtIODevice *vdev)
 {
     VHostUserBlk *s = VHOST_USER_BLK(vdev);
+    VHostBlkCommon *vbc = VHOST_BLK_COMMON(s);
 
-    vhost_dev_free_inflight(s->inflight);
+    vhost_dev_free_inflight(vbc->inflight);
 }
 
 static int vhost_user_blk_connect(DeviceState *dev)
 {
     VirtIODevice *vdev = VIRTIO_DEVICE(dev);
     VHostUserBlk *s = VHOST_USER_BLK(vdev);
+    VHostBlkCommon *vbc = VHOST_BLK_COMMON(s);
     int ret = 0;
 
     if (s->connected) {
@@ -320,14 +142,15 @@ static int vhost_user_blk_connect(DeviceState *dev)
     }
     s->connected = true;
 
-    s->dev.nvqs = s->num_queues;
-    s->dev.vqs = s->vhost_vqs;
-    s->dev.vq_index = 0;
-    s->dev.backend_features = 0;
+    vbc->dev.nvqs = vbc->num_queues;
+    vbc->dev.vqs = vbc->vhost_vqs;
+    vbc->dev.vq_index = 0;
+    vbc->dev.backend_features = 0;
 
-    vhost_dev_set_config_notifier(&s->dev, &blk_ops);
+    vhost_dev_set_config_notifier(&vbc->dev, &blk_ops);
 
-    ret = vhost_dev_init(&s->dev, &s->vhost_user, VHOST_BACKEND_TYPE_USER, 0);
+    ret = vhost_dev_init(&vbc->dev, &s->vhost_user,
+                         VHOST_BACKEND_TYPE_USER, 0);
     if (ret < 0) {
         error_report("vhost-user-blk: vhost initialization failed: %s",
                      strerror(-ret));
@@ -336,7 +159,7 @@ static int vhost_user_blk_connect(DeviceState *dev)
 
     /* restore vhost state */
     if (virtio_device_started(vdev, vdev->status)) {
-        ret = vhost_user_blk_start(vdev);
+        ret = vhost_blk_common_start(vbc);
         if (ret < 0) {
             error_report("vhost-user-blk: vhost start failed: %s",
                          strerror(-ret));
@@ -351,15 +174,16 @@ static void vhost_user_blk_disconnect(DeviceState *dev)
 {
     VirtIODevice *vdev = VIRTIO_DEVICE(dev);
     VHostUserBlk *s = VHOST_USER_BLK(vdev);
+    VHostBlkCommon *vbc = VHOST_BLK_COMMON(s);
 
     if (!s->connected) {
         return;
     }
     s->connected = false;
 
-    vhost_user_blk_stop(vdev);
+    vhost_blk_common_stop(vbc);
 
-    vhost_dev_cleanup(&s->dev);
+    vhost_dev_cleanup(&vbc->dev);
 }
 
 static void vhost_user_blk_event(void *opaque, QEMUChrEvent event,
@@ -392,6 +216,7 @@ static void vhost_user_blk_event(void *opaque, QEMUChrEvent event,
     DeviceState *dev = opaque;
     VirtIODevice *vdev = VIRTIO_DEVICE(dev);
     VHostUserBlk *s = VHOST_USER_BLK(vdev);
+    VHostBlkCommon *vbc = VHOST_BLK_COMMON(s);
 
     switch (event) {
     case CHR_EVENT_OPENED:
@@ -430,7 +255,7 @@ static void vhost_user_blk_event(void *opaque, QEMUChrEvent event,
              * option for the general vhost code to get the dev state without
              * knowing its type (in this case vhost-user).
              */
-            s->dev.started = false;
+            vbc->dev.started = false;
         } else {
             vhost_user_blk_disconnect(dev);
         }
@@ -447,42 +272,24 @@ static void vhost_user_blk_device_realize(DeviceState *dev, Error **errp)
 {
     VirtIODevice *vdev = VIRTIO_DEVICE(dev);
     VHostUserBlk *s = VHOST_USER_BLK(vdev);
+    VHostBlkCommon *vbc = VHOST_BLK_COMMON(s);
     Error *err = NULL;
-    int i, ret;
+    int ret;
 
     if (!s->chardev.chr) {
         error_setg(errp, "vhost-user-blk: chardev is mandatory");
         return;
     }
 
-    if (s->num_queues == VHOST_USER_BLK_AUTO_NUM_QUEUES) {
-        s->num_queues = 1;
-    }
-    if (!s->num_queues || s->num_queues > VIRTIO_QUEUE_MAX) {
-        error_setg(errp, "vhost-user-blk: invalid number of IO queues");
-        return;
-    }
-
-    if (!s->queue_size) {
-        error_setg(errp, "vhost-user-blk: queue size must be non-zero");
-        return;
-    }
-
     if (!vhost_user_init(&s->vhost_user, &s->chardev, errp)) {
         return;
     }
 
-    virtio_init(vdev, "virtio-blk", VIRTIO_ID_BLOCK,
-                sizeof(struct virtio_blk_config));
-
-    s->virtqs = g_new(VirtQueue *, s->num_queues);
-    for (i = 0; i < s->num_queues; i++) {
-        s->virtqs[i] = virtio_add_queue(vdev, s->queue_size,
-                                        vhost_user_blk_handle_output);
+    vhost_blk_common_realize(vbc, vhost_user_blk_handle_output, &err);
+    if (err != NULL) {
+        error_propagate(errp, err);
+        goto blk_err;
     }
-
-    s->inflight = g_new0(struct vhost_inflight, 1);
-    s->vhost_vqs = g_new0(struct vhost_virtqueue, s->num_queues);
     s->connected = false;
 
     qemu_chr_fe_set_handlers(&s->chardev,  NULL, NULL,
@@ -492,7 +299,7 @@ static void vhost_user_blk_device_realize(DeviceState *dev, Error **errp)
 reconnect:
     if (qemu_chr_fe_wait_connected(&s->chardev, &err) < 0) {
         error_report_err(err);
-        goto virtio_err;
+        goto connect_err;
     }
 
     /* check whether vhost_user_blk_connect() failed or not */
@@ -500,7 +307,7 @@ reconnect:
         goto reconnect;
     }
 
-    ret = vhost_dev_get_config(&s->dev, (uint8_t *)&s->blkcfg,
+    ret = vhost_dev_get_config(&vbc->dev, (uint8_t *)&vbc->blkcfg,
                                sizeof(struct virtio_blk_config));
     if (ret < 0) {
         error_report("vhost-user-blk: get block config failed");
@@ -513,16 +320,9 @@ reconnect:
                              NULL, true);
     return;
 
-virtio_err:
-    g_free(s->vhost_vqs);
-    s->vhost_vqs = NULL;
-    g_free(s->inflight);
-    s->inflight = NULL;
-    for (i = 0; i < s->num_queues; i++) {
-        virtio_delete_queue(s->virtqs[i]);
-    }
-    g_free(s->virtqs);
-    virtio_cleanup(vdev);
+connect_err:
+    vhost_blk_common_unrealize(vbc);
+blk_err:
     vhost_user_cleanup(&s->vhost_user);
 }
 
@@ -530,31 +330,24 @@ static void vhost_user_blk_device_unrealize(DeviceState *dev)
 {
     VirtIODevice *vdev = VIRTIO_DEVICE(dev);
     VHostUserBlk *s = VHOST_USER_BLK(dev);
-    int i;
+    VHostBlkCommon *vbc = VHOST_BLK_COMMON(s);
 
     virtio_set_status(vdev, 0);
     qemu_chr_fe_set_handlers(&s->chardev,  NULL, NULL, NULL,
                              NULL, NULL, NULL, false);
-    vhost_dev_cleanup(&s->dev);
-    vhost_dev_free_inflight(s->inflight);
-    g_free(s->vhost_vqs);
-    s->vhost_vqs = NULL;
-    g_free(s->inflight);
-    s->inflight = NULL;
-
-    for (i = 0; i < s->num_queues; i++) {
-        virtio_delete_queue(s->virtqs[i]);
-    }
-    g_free(s->virtqs);
-    virtio_cleanup(vdev);
+    vhost_dev_cleanup(&vbc->dev);
+    vhost_dev_free_inflight(vbc->inflight);
+    vhost_blk_common_unrealize(vbc);
     vhost_user_cleanup(&s->vhost_user);
 }
 
 static void vhost_user_blk_instance_init(Object *obj)
 {
-    VHostUserBlk *s = VHOST_USER_BLK(obj);
+    VHostBlkCommon *vbc = VHOST_BLK_COMMON(obj);
+
+    vbc->feature_bits = user_feature_bits;
 
-    device_add_bootindex_property(obj, &s->bootindex, "bootindex",
+    device_add_bootindex_property(obj, &vbc->bootindex, "bootindex",
                                   "/disk@0,0", DEVICE(obj));
 }
 
@@ -570,10 +363,10 @@ static const VMStateDescription vmstate_vhost_user_blk = {
 
 static Property vhost_user_blk_properties[] = {
     DEFINE_PROP_CHR("chardev", VHostUserBlk, chardev),
-    DEFINE_PROP_UINT16("num-queues", VHostUserBlk, num_queues,
-                       VHOST_USER_BLK_AUTO_NUM_QUEUES),
-    DEFINE_PROP_UINT32("queue-size", VHostUserBlk, queue_size, 128),
-    DEFINE_PROP_BIT("config-wce", VHostUserBlk, config_wce, 0, true),
+    DEFINE_PROP_UINT16("num-queues", VHostBlkCommon, num_queues,
+                       VHOST_BLK_AUTO_NUM_QUEUES),
+    DEFINE_PROP_UINT32("queue-size", VHostBlkCommon, queue_size, 128),
+    DEFINE_PROP_BIT("config-wce", VHostBlkCommon, config_wce, 0, true),
     DEFINE_PROP_END_OF_LIST(),
 };
 
@@ -587,16 +380,13 @@ static void vhost_user_blk_class_init(ObjectClass *klass, void *data)
     set_bit(DEVICE_CATEGORY_STORAGE, dc->categories);
     vdc->realize = vhost_user_blk_device_realize;
     vdc->unrealize = vhost_user_blk_device_unrealize;
-    vdc->get_config = vhost_user_blk_update_config;
-    vdc->set_config = vhost_user_blk_set_config;
-    vdc->get_features = vhost_user_blk_get_features;
     vdc->set_status = vhost_user_blk_set_status;
     vdc->reset = vhost_user_blk_reset;
 }
 
 static const TypeInfo vhost_user_blk_info = {
     .name = TYPE_VHOST_USER_BLK,
-    .parent = TYPE_VIRTIO_DEVICE,
+    .parent = TYPE_VHOST_BLK_COMMON,
     .instance_size = sizeof(VHostUserBlk),
     .instance_init = vhost_user_blk_instance_init,
     .class_init = vhost_user_blk_class_init,
diff --git a/hw/virtio/vhost-user-blk-pci.c b/hw/virtio/vhost-user-blk-pci.c
index 33b404d8a2..8fb01552f5 100644
--- a/hw/virtio/vhost-user-blk-pci.c
+++ b/hw/virtio/vhost-user-blk-pci.c
@@ -54,13 +54,14 @@ static void vhost_user_blk_pci_realize(VirtIOPCIProxy *vpci_dev, Error **errp)
 {
     VHostUserBlkPCI *dev = VHOST_USER_BLK_PCI(vpci_dev);
     DeviceState *vdev = DEVICE(&dev->vdev);
+    VHostBlkCommon *vbc = VHOST_BLK_COMMON(&dev->vdev);
 
-    if (dev->vdev.num_queues == VHOST_USER_BLK_AUTO_NUM_QUEUES) {
-        dev->vdev.num_queues = virtio_pci_optimal_num_queues(0);
+    if (vbc->num_queues == VHOST_BLK_AUTO_NUM_QUEUES) {
+        vbc->num_queues = virtio_pci_optimal_num_queues(0);
     }
 
     if (vpci_dev->nvectors == DEV_NVECTORS_UNSPECIFIED) {
-        vpci_dev->nvectors = dev->vdev.num_queues + 1;
+        vpci_dev->nvectors = vbc->num_queues + 1;
     }
 
     qdev_realize(vdev, BUS(&vpci_dev->bus), errp);
diff --git a/include/hw/virtio/vhost-blk-common.h b/include/hw/virtio/vhost-blk-common.h
new file mode 100644
index 0000000000..1a12a58b60
--- /dev/null
+++ b/include/hw/virtio/vhost-blk-common.h
@@ -0,0 +1,50 @@
+/*
+ * Parent class for vhost based block devices
+ *
+ * Copyright (C) 2021 Bytedance Inc. and/or its affiliates. All rights reserved.
+ *
+ * Author:
+ *   Xie Yongji <xieyongji@bytedance.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See
+ * the COPYING file in the top-level directory.
+ *
+ */
+
+#ifndef VHOST_BLK_COMMON_H
+#define VHOST_BLK_COMMON_H
+
+#include "standard-headers/linux/virtio_blk.h"
+#include "hw/virtio/vhost.h"
+#include "qom/object.h"
+
+#define TYPE_VHOST_BLK_COMMON "vhost-blk-common"
+OBJECT_DECLARE_SIMPLE_TYPE(VHostBlkCommon, VHOST_BLK_COMMON)
+
+#define VHOST_BLK_AUTO_NUM_QUEUES UINT16_MAX
+
+struct VHostBlkCommon {
+    VirtIODevice parent_obj;
+    int32_t bootindex;
+    struct virtio_blk_config blkcfg;
+    uint16_t num_queues;
+    uint32_t queue_size;
+    const int *feature_bits;
+    uint32_t config_wce;
+    struct vhost_dev dev;
+    struct vhost_inflight *inflight;
+    struct vhost_virtqueue *vhost_vqs;
+    VirtQueue **virtqs;
+    bool started;
+};
+
+extern const VhostDevConfigOps blk_ops;
+
+int vhost_blk_common_start(VHostBlkCommon *vbc);
+void vhost_blk_common_stop(VHostBlkCommon *vbc);
+void vhost_blk_common_realize(VHostBlkCommon *vbc,
+                              VirtIOHandleOutput handle_output,
+                              Error **errp);
+void vhost_blk_common_unrealize(VHostBlkCommon *vbc);
+
+#endif
diff --git a/include/hw/virtio/vhost-user-blk.h b/include/hw/virtio/vhost-user-blk.h
index 7c91f15040..100275602f 100644
--- a/include/hw/virtio/vhost-user-blk.h
+++ b/include/hw/virtio/vhost-user-blk.h
@@ -15,32 +15,18 @@
 #ifndef VHOST_USER_BLK_H
 #define VHOST_USER_BLK_H
 
-#include "standard-headers/linux/virtio_blk.h"
-#include "hw/block/block.h"
 #include "chardev/char-fe.h"
-#include "hw/virtio/vhost.h"
 #include "hw/virtio/vhost-user.h"
+#include "hw/virtio/vhost-blk-common.h"
 #include "qom/object.h"
 
 #define TYPE_VHOST_USER_BLK "vhost-user-blk"
 OBJECT_DECLARE_SIMPLE_TYPE(VHostUserBlk, VHOST_USER_BLK)
 
-#define VHOST_USER_BLK_AUTO_NUM_QUEUES UINT16_MAX
-
 struct VHostUserBlk {
-    VirtIODevice parent_obj;
+    VHostBlkCommon parent_obj;
     CharBackend chardev;
-    int32_t bootindex;
-    struct virtio_blk_config blkcfg;
-    uint16_t num_queues;
-    uint32_t queue_size;
-    uint32_t config_wce;
-    struct vhost_dev dev;
-    struct vhost_inflight *inflight;
     VhostUserState vhost_user;
-    struct vhost_virtqueue *vhost_vqs;
-    VirtQueue **virtqs;
-
     /*
      * There are at least two steps of initialization of the
      * vhost-user device. The first is a "connect" step and
@@ -49,8 +35,6 @@ struct VHostUserBlk {
      */
     /* vhost_user_blk_connect/vhost_user_blk_disconnect */
     bool connected;
-    /* vhost_user_blk_start/vhost_user_blk_stop */
-    bool started_vu;
 };
 
 #endif
-- 
2.25.1


