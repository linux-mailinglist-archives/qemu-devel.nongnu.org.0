Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A97B11D5485
	for <lists+qemu-devel@lfdr.de>; Fri, 15 May 2020 17:26:07 +0200 (CEST)
Received: from localhost ([::1]:53490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jZcDu-0002zv-M1
	for lists+qemu-devel@lfdr.de; Fri, 15 May 2020 11:26:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1jZc9O-0005Rj-FB
 for qemu-devel@nongnu.org; Fri, 15 May 2020 11:21:26 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:34500
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1jZc9H-0006sT-Lx
 for qemu-devel@nongnu.org; Fri, 15 May 2020 11:21:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589556079;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=i2fyX1V0RnSLQyZTxpxJ2iKSg2iCs6Xwft/knJQisaQ=;
 b=UNgkc5zBGM0Cj562QfoQN1KR3aNqKYlHe+e7HlpT125Mmr0gFbEo2Zb20gYEIfgjjoAB+X
 RUxkgdi//3c8JXQWqyXr+MhV8g4yENAhl/FmvF2oWUU+veEmw7YZUq+Epn6Yw/bwmRLj67
 TsfOrlBLzWrvS34PJkCyzicDiwKQepY=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-145-nVoMZ7MAPY-h3N_KuZTEzg-1; Fri, 15 May 2020 11:21:17 -0400
X-MC-Unique: nVoMZ7MAPY-h3N_KuZTEzg-1
Received: by mail-wm1-f71.google.com with SMTP id a206so1140932wmh.6
 for <qemu-devel@nongnu.org>; Fri, 15 May 2020 08:21:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=i2fyX1V0RnSLQyZTxpxJ2iKSg2iCs6Xwft/knJQisaQ=;
 b=VYgq98omz3Yr5+UUGxPRJMBTGtnZTXv5CWevgBb1iyrXg8PhQp8j33aswWTHKZlUEw
 ldlWq6K9MjFhZG8ML1CGoCMGHUpps4ntRVwYn43ENUN/nZAEvZDMqjy7vu8ae7pNzvyP
 KHEppL3aEapAaBX4TLwrQg4glmeby1jTMLzci6gH5Q3RR7EUzVvWs2gWtMN6MMmcBAxf
 ePHNhveUgvoUYg82eh04z/4yvltcEpkb0qAWEEWya6MWaslUYsS7CQx2YPvkG44ocz4K
 Ag1tc1tZFBCbjUfPhv1wQnghmYtbl5zoaElCiF65s4/6rxDwACkO0nIM49j+FLys1WxV
 15IQ==
X-Gm-Message-State: AOAM531OCRGtw7b4HR1UAqbc5OyfIdKoKB4VhUFC+OoHMX2xm/eQRZl/
 jYuFSWG+xjobhs+0ppbildU3ILK45esUdPdqvkFwrs1kFCG0TGsebMDoWJS7VuP+YKt5yaVossk
 wufeVWl1UvdwKw50=
X-Received: by 2002:adf:cd92:: with SMTP id q18mr4961643wrj.237.1589556075239; 
 Fri, 15 May 2020 08:21:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw5u0xeyLnxDIb0tjBRzzGRLwXF1sw5IU/OlhsY5yHeHmbrTkObnNQcHhTD1txvykFIdmIL9A==
X-Received: by 2002:adf:cd92:: with SMTP id q18mr4961617wrj.237.1589556074970; 
 Fri, 15 May 2020 08:21:14 -0700 (PDT)
Received: from steredhat.redhat.com ([79.49.207.108])
 by smtp.gmail.com with ESMTPSA id q9sm3913849wmb.34.2020.05.15.08.21.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 May 2020 08:21:14 -0700 (PDT)
From: Stefano Garzarella <sgarzare@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/3] virtio: add vhost-user-vsock base device
Date: Fri, 15 May 2020 17:21:09 +0200
Message-Id: <20200515152110.202917-3-sgarzare@redhat.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200515152110.202917-1-sgarzare@redhat.com>
References: <20200515152110.202917-1-sgarzare@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/15 00:39:12
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Julio Montes <julio.montes@intel.com>,
 Sebastien Boeuf <sebastien.boeuf@intel.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch introduces a vhost-user device for vsock, using the
vhost-vsock-common parent class.

The vhost-user-vsock device can be used to implement the virtio-vsock
device emulation in user-space.

Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
---
 configure                            |   3 +
 include/hw/virtio/vhost-user-vsock.h |  36 +++++
 hw/virtio/vhost-user-vsock.c         | 188 +++++++++++++++++++++++++++
 hw/virtio/Makefile.objs              |   1 +
 4 files changed, 228 insertions(+)
 create mode 100644 include/hw/virtio/vhost-user-vsock.h
 create mode 100644 hw/virtio/vhost-user-vsock.c

diff --git a/configure b/configure
index 26084fc53a..367d474e89 100755
--- a/configure
+++ b/configure
@@ -7175,6 +7175,9 @@ if test "$vhost_crypto" = "yes" ; then
 fi
 if test "$vhost_vsock" = "yes" ; then
   echo "CONFIG_VHOST_VSOCK=y" >> $config_host_mak
+  if test "$vhost_user" = "yes" ; then
+    echo "CONFIG_VHOST_USER_VSOCK=y" >> $config_host_mak
+  fi
 fi
 if test "$vhost_kernel" = "yes" ; then
   echo "CONFIG_VHOST_KERNEL=y" >> $config_host_mak
diff --git a/include/hw/virtio/vhost-user-vsock.h b/include/hw/virtio/vhost-user-vsock.h
new file mode 100644
index 0000000000..4e128a4b9f
--- /dev/null
+++ b/include/hw/virtio/vhost-user-vsock.h
@@ -0,0 +1,36 @@
+/*
+ * Vhost-user vsock virtio device
+ *
+ * Copyright 2020 Red Hat, Inc.
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or
+ * (at your option) any later version.  See the COPYING file in the
+ * top-level directory.
+ */
+
+#ifndef _QEMU_VHOST_USER_VSOCK_H
+#define _QEMU_VHOST_USER_VSOCK_H
+
+#include "hw/virtio/vhost-vsock-common.h"
+#include "hw/virtio/vhost-user.h"
+#include "standard-headers/linux/virtio_vsock.h"
+
+#define TYPE_VHOST_USER_VSOCK "vhost-user-vsock-device"
+#define VHOST_USER_VSOCK(obj) \
+        OBJECT_CHECK(VHostUserVSock, (obj), TYPE_VHOST_USER_VSOCK)
+
+typedef struct {
+    CharBackend chardev;
+} VHostUserVSockConf;
+
+typedef struct {
+    /*< private >*/
+    VHostVSockCommon parent;
+    VhostUserState vhost_user;
+    VHostUserVSockConf conf;
+    struct virtio_vsock_config vsockcfg;
+
+    /*< public >*/
+} VHostUserVSock;
+
+#endif /* _QEMU_VHOST_USER_VSOCK_H */
diff --git a/hw/virtio/vhost-user-vsock.c b/hw/virtio/vhost-user-vsock.c
new file mode 100644
index 0000000000..a401204b7d
--- /dev/null
+++ b/hw/virtio/vhost-user-vsock.c
@@ -0,0 +1,188 @@
+/*
+ * Vhost-user vsock virtio device
+ *
+ * Copyright 2020 Red Hat, Inc.
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or
+ * (at your option) any later version.  See the COPYING file in the
+ * top-level directory.
+ */
+
+#include "qemu/osdep.h"
+
+#include "qapi/error.h"
+#include "qemu/error-report.h"
+#include "hw/qdev-properties.h"
+#include "hw/virtio/vhost-user-vsock.h"
+
+static const int user_feature_bits[] = {
+    VIRTIO_F_VERSION_1,
+    VIRTIO_RING_F_INDIRECT_DESC,
+    VIRTIO_RING_F_EVENT_IDX,
+    VIRTIO_F_NOTIFY_ON_EMPTY,
+    VHOST_INVALID_FEATURE_BIT
+};
+
+static void vuv_get_config(VirtIODevice *vdev, uint8_t *config)
+{
+    VHostUserVSock *vsock = VHOST_USER_VSOCK(vdev);
+
+    memcpy(config, &vsock->vsockcfg, sizeof(struct virtio_vsock_config));
+}
+
+static int vuv_handle_config_change(struct vhost_dev *dev)
+{
+    VHostUserVSock *vsock = VHOST_USER_VSOCK(dev->vdev);
+    int ret = vhost_dev_get_config(dev, (uint8_t *)&vsock->vsockcfg,
+                                   sizeof(struct virtio_vsock_config));
+    if (ret < 0) {
+        error_report("get config space failed");
+        return -1;
+    }
+
+    virtio_notify_config(dev->vdev);
+
+    return 0;
+}
+
+const VhostDevConfigOps vsock_ops = {
+    .vhost_dev_config_notifier = vuv_handle_config_change,
+};
+
+static void vuv_set_status(VirtIODevice *vdev, uint8_t status)
+{
+    VHostVSockCommon *vvc = VHOST_VSOCK_COMMON(vdev);
+    bool should_start = status & VIRTIO_CONFIG_S_DRIVER_OK;
+
+    if (!vdev->vm_running) {
+        should_start = false;
+    }
+
+    if (vvc->vhost_dev.started == should_start) {
+        return;
+    }
+
+    if (should_start) {
+        int ret = vhost_vsock_common_start(vdev);
+        if (ret < 0) {
+            return;
+        }
+    } else {
+        vhost_vsock_common_stop(vdev);
+    }
+}
+
+static uint64_t vuv_get_features(VirtIODevice *vdev,
+                                 uint64_t features,
+                                 Error **errp)
+{
+    VHostVSockCommon *vvc = VHOST_VSOCK_COMMON(vdev);
+
+    return vhost_get_features(&vvc->vhost_dev, user_feature_bits, features);
+}
+
+static const VMStateDescription vuv_vmstate = {
+    .name = "vhost-user-vsock",
+    .minimum_version_id = VHOST_VSOCK_SAVEVM_VERSION,
+    .version_id = VHOST_VSOCK_SAVEVM_VERSION,
+    .fields = (VMStateField[]) {
+        VMSTATE_VIRTIO_DEVICE,
+        VMSTATE_END_OF_LIST()
+    },
+    .pre_save = vhost_vsock_common_pre_save,
+    .post_load = vhost_vsock_common_post_load,
+};
+
+static void vuv_device_realize(DeviceState *dev, Error **errp)
+{
+    VHostVSockCommon *vvc = VHOST_VSOCK_COMMON(dev);
+    VirtIODevice *vdev = VIRTIO_DEVICE(dev);
+    VHostUserVSock *vsock = VHOST_USER_VSOCK(dev);
+    int ret;
+
+    if (!vsock->conf.chardev.chr) {
+        error_setg(errp, "missing chardev");
+        return;
+    }
+
+    if (!vhost_user_init(&vsock->vhost_user, &vsock->conf.chardev, errp)) {
+        return;
+    }
+
+    vhost_vsock_common_realize(vdev, "vhost-user-vsock");
+
+    vhost_dev_set_config_notifier(&vvc->vhost_dev, &vsock_ops);
+
+    ret = vhost_dev_init(&vvc->vhost_dev, &vsock->vhost_user,
+                         VHOST_BACKEND_TYPE_USER, 0);
+    if (ret < 0) {
+        error_setg_errno(errp, -ret, "vhost_dev_init failed");
+        goto err_virtio;
+    }
+
+    ret = vhost_dev_get_config(&vvc->vhost_dev, (uint8_t *)&vsock->vsockcfg,
+                               sizeof(struct virtio_vsock_config));
+    if (ret < 0) {
+        error_setg_errno(errp, -ret, "get config space failed");
+        goto err_vhost_dev;
+    }
+
+    return;
+
+err_vhost_dev:
+    vhost_dev_cleanup(&vvc->vhost_dev);
+err_virtio:
+    vhost_vsock_common_unrealize(vdev);
+    vhost_user_cleanup(&vsock->vhost_user);
+    return;
+}
+
+static void vuv_device_unrealize(DeviceState *dev)
+{
+    VHostVSockCommon *vvc = VHOST_VSOCK_COMMON(dev);
+    VirtIODevice *vdev = VIRTIO_DEVICE(dev);
+    VHostUserVSock *vsock = VHOST_USER_VSOCK(dev);
+
+    /* This will stop vhost backend if appropriate. */
+    vuv_set_status(vdev, 0);
+
+    vhost_dev_cleanup(&vvc->vhost_dev);
+
+    vhost_vsock_common_unrealize(vdev);
+
+    vhost_user_cleanup(&vsock->vhost_user);
+
+}
+
+static Property vuv_properties[] = {
+    DEFINE_PROP_CHR("chardev", VHostUserVSock, conf.chardev),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void vuv_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    VirtioDeviceClass *vdc = VIRTIO_DEVICE_CLASS(klass);
+
+    device_class_set_props(dc, vuv_properties);
+    dc->vmsd = &vuv_vmstate;
+    vdc->realize = vuv_device_realize;
+    vdc->unrealize = vuv_device_unrealize;
+    vdc->get_features = vuv_get_features;
+    vdc->get_config = vuv_get_config;
+    vdc->set_status = vuv_set_status;
+}
+
+static const TypeInfo vuv_info = {
+    .name = TYPE_VHOST_USER_VSOCK,
+    .parent = TYPE_VHOST_VSOCK_COMMON,
+    .instance_size = sizeof(VHostUserVSock),
+    .class_init = vuv_class_init,
+};
+
+static void vuv_register_types(void)
+{
+    type_register_static(&vuv_info);
+}
+
+type_init(vuv_register_types)
diff --git a/hw/virtio/Makefile.objs b/hw/virtio/Makefile.objs
index b1eeb44eac..dd42daedb1 100644
--- a/hw/virtio/Makefile.objs
+++ b/hw/virtio/Makefile.objs
@@ -18,6 +18,7 @@ common-obj-$(call land,$(CONFIG_VIRTIO_PMEM),$(CONFIG_VIRTIO_PCI)) += virtio-pme
 obj-$(call land,$(CONFIG_VHOST_USER_FS),$(CONFIG_VIRTIO_PCI)) += vhost-user-fs-pci.o
 obj-$(CONFIG_VIRTIO_IOMMU) += virtio-iommu.o
 obj-$(CONFIG_VHOST_VSOCK) += vhost-vsock-common.o vhost-vsock.o
+obj-$(CONFIG_VHOST_USER_VSOCK) += vhost-vsock-common.o vhost-user-vsock.o
 
 ifeq ($(CONFIG_VIRTIO_PCI),y)
 obj-$(CONFIG_VHOST_VSOCK) += vhost-vsock-pci.o
-- 
2.25.4


