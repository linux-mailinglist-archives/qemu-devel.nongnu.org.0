Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C17A1DE6DD
	for <lists+qemu-devel@lfdr.de>; Fri, 22 May 2020 14:27:51 +0200 (CEST)
Received: from localhost ([::1]:34676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jc6mE-0002NE-Jc
	for lists+qemu-devel@lfdr.de; Fri, 22 May 2020 08:27:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1jc6kJ-00015t-Hq
 for qemu-devel@nongnu.org; Fri, 22 May 2020 08:25:51 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:40734
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1jc6kI-0002cA-EA
 for qemu-devel@nongnu.org; Fri, 22 May 2020 08:25:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590150349;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Sg8iGobYcJLRYy7cpkwMAac/lbJFxgnD9DJhyPMEXQ0=;
 b=VU6YLTQtTJA0VGYySP3b6X+ULtfrTUFB6tvxRppEiI15lZc5RiVJjyQGsLGAuF3cujRl8Y
 OHBqgStayVlIcETBalXreq5QCYO592EZFX/JGIi36WBJZGGHlOtt2sXDYm1sLq63ue4vS1
 34ncwjVqhq68slxPK+X0NTpWg8JJs88=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-168-CB2b5LubMjS8uaXafjtMkw-1; Fri, 22 May 2020 08:25:47 -0400
X-MC-Unique: CB2b5LubMjS8uaXafjtMkw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CE5C6EC1A4;
 Fri, 22 May 2020 12:25:45 +0000 (UTC)
Received: from steredhat.redhat.com (ovpn-114-19.ams2.redhat.com
 [10.36.114.19])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DBC9E60CC0;
 Fri, 22 May 2020 12:25:33 +0000 (UTC)
From: Stefano Garzarella <sgarzare@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/3] virtio: add vhost-user-vsock base device
Date: Fri, 22 May 2020 14:25:11 +0200
Message-Id: <20200522122512.87413-3-sgarzare@redhat.com>
In-Reply-To: <20200522122512.87413-1-sgarzare@redhat.com>
References: <20200522122512.87413-1-sgarzare@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/22 08:25:49
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
v1 -> v2:
  - removed live migration code since vhost-user-vsock application built
    with Cloud Hypervisor crates doesn't support VHOST_USER_PROTOCOL_F_LOG_SHMFD
    so I'm not able to test this code [Stefan]
---
 configure                            |   3 +
 include/hw/virtio/vhost-user-vsock.h |  36 ++++++
 hw/virtio/vhost-user-vsock.c         | 181 +++++++++++++++++++++++++++
 hw/virtio/Makefile.objs              |   1 +
 4 files changed, 221 insertions(+)
 create mode 100644 include/hw/virtio/vhost-user-vsock.h
 create mode 100644 hw/virtio/vhost-user-vsock.c

diff --git a/configure b/configure
index 2fc05c4465..b60ddbec41 100755
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
index 0000000000..3534a39d62
--- /dev/null
+++ b/hw/virtio/vhost-user-vsock.c
@@ -0,0 +1,181 @@
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
+    .unmigratable = 1,
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


