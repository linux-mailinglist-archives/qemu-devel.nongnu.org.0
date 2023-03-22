Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 042486C4D7C
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Mar 2023 15:23:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pezLw-00086Q-47; Wed, 22 Mar 2023 10:22:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aesteve@redhat.com>)
 id 1pezLt-000860-V5
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 10:22:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aesteve@redhat.com>)
 id 1pezLs-0007OF-1t
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 10:22:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679494927;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Cy45JThKfhw+pOczCa5UvFFxft7EmjKUU3fwffIkfGE=;
 b=bticcc1Vmq9LoUHbO+yj5ZSYm2JdeklOMbjFt8JMf3Id0Z0Kh0UPpOiXKp12XfDstkRPep
 ia6K0viuGfZ3HXpmjezdmAJAQcg9LIbYzVjcBRaFD4xwkqPlKdUFrTqkuLh15wAo9pM4U4
 NIcfGXbawd+8xPpEDZWKPbRuQosmqp8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-137-Fn0hgK4AOB-qQDuVRWAhCg-1; Wed, 22 Mar 2023 10:22:04 -0400
X-MC-Unique: Fn0hgK4AOB-qQDuVRWAhCg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 22483858F09;
 Wed, 22 Mar 2023 14:22:03 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.45.226.254])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8064540C6E67;
 Wed, 22 Mar 2023 14:22:00 +0000 (UTC)
From: Albert Esteve <aesteve@redhat.com>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, fmartine@redhat.com,
 Gerd Hoffmann <kraxel@redhat.com>, eballetb@redhat.com,
 Albert Esteve <aesteve@redhat.com>, alex.bennee@linaro.org,
 Laurent Vivier <lvivier@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 sgarzare@redhat.com,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 peter.griffin@linaro.org, Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH 09/12] tests/qtest: add virtio-video test
Date: Wed, 22 Mar 2023 15:21:29 +0100
Message-Id: <20230322142132.22909-10-aesteve@redhat.com>
In-Reply-To: <20230322142132.22909-1-aesteve@redhat.com>
References: <20230322142132.22909-1-aesteve@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=aesteve@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Add some minimal testing of the vhost-user-video
backend similar to what is tested for other
vhost-user devices. For now it only stresses
the backend instantiation and some message
passing through the control socket.

Signed-off-by: Albert Esteve <aesteve@redhat.com>
---
 tests/qtest/libqos/meson.build    |   1 +
 tests/qtest/libqos/virtio-video.c | 179 ++++++++++++++++++++++++++++++
 tests/qtest/libqos/virtio-video.h |  39 +++++++
 tests/qtest/vhost-user-test.c     |  32 ++++++
 4 files changed, 251 insertions(+)
 create mode 100644 tests/qtest/libqos/virtio-video.c
 create mode 100644 tests/qtest/libqos/virtio-video.h

diff --git a/tests/qtest/libqos/meson.build b/tests/qtest/libqos/meson.build
index cc209a8de5..055bd47928 100644
--- a/tests/qtest/libqos/meson.build
+++ b/tests/qtest/libqos/meson.build
@@ -46,6 +46,7 @@ libqos_srcs = files(
         'virtio-serial.c',
         'virtio-iommu.c',
         'virtio-gpio.c',
+        'virtio-video.c',
         'generic-pcihost.c',
 
         # qgraph machines:
diff --git a/tests/qtest/libqos/virtio-video.c b/tests/qtest/libqos/virtio-video.c
new file mode 100644
index 0000000000..f61c34753d
--- /dev/null
+++ b/tests/qtest/libqos/virtio-video.c
@@ -0,0 +1,179 @@
+/*
+ * libqos virtio-video driver
+ *
+ * Copyright (c) 2023 Red Hat Inc.
+ * 
+ * Authors:
+ *  Albert Esteve <aesteve@redhat.com>
+ *   (based on virtio-gpio.c)
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "qemu/osdep.h"
+#include "standard-headers/linux/virtio_config.h"
+#include "../libqtest.h"
+#include "qemu/module.h"
+#include "qgraph.h"
+#include "virtio-video.h"
+
+#define NUM_VQUEUES 2
+#define PCI_SLOT    0x04
+#define PCI_FN      0x00
+
+static QGuestAllocator *alloc;
+
+static void virtio_video_cleanup(QVhostUserVideo *video)
+{
+    QVirtioDevice *vdev = video->vdev;
+    int i;
+
+    for (i = 0; i < NUM_VQUEUES; i++) {
+        qvirtqueue_cleanup(vdev->bus, video->queues[i], alloc);
+    }
+    g_free(video->queues);
+}
+
+/*
+ * This handles the VirtIO setup from the point of view of the driver
+ * frontend and therefore doesn't present any vhost specific features
+ * and in fact masks off the re-used bit.
+ */
+static void virtio_video_setup(QVhostUserVideo *video)
+{
+    QVirtioDevice *vdev = video->vdev;
+    uint64_t features;
+    int i;
+
+    features = qvirtio_get_features(vdev);
+    features &= ~QVIRTIO_F_BAD_FEATURE;
+    qvirtio_set_features(vdev, features);
+
+    video->queues = g_new(QVirtQueue *, NUM_VQUEUES);
+    for (i = 0; i < NUM_VQUEUES; i++) {
+        video->queues[i] = qvirtqueue_setup(vdev, alloc, i);
+    }
+    qvirtio_set_driver_ok(vdev);
+}
+
+static void *qvirtio_video_get_driver(QVhostUserVideo *v_video,
+                                      const char *interface)
+{
+    if (!g_strcmp0(interface, "vhost-user-video")) {
+        return v_video;
+    }
+    if (!g_strcmp0(interface, "virtio")) {
+        return v_video->vdev;
+    }
+
+    g_assert_not_reached();
+}
+
+static void *qvirtio_video_device_get_driver(void *object,
+                                             const char *interface)
+{
+    QVhostUserVideoDevice *v_video = object;
+    return qvirtio_video_get_driver(&v_video->video, interface);
+}
+
+/* virtio-video (mmio) */
+static void qvirtio_video_device_destructor(QOSGraphObject *obj)
+{
+    QVhostUserVideoDevice *video_dev = (QVhostUserVideoDevice *) obj;
+    virtio_video_cleanup(&video_dev->video);
+}
+
+static void qvirtio_video_device_start_hw(QOSGraphObject *obj)
+{
+    QVhostUserVideoDevice *video_dev = (QVhostUserVideoDevice *) obj;
+    virtio_video_setup(&video_dev->video);
+}
+
+static void *virtio_video_device_create(void *virtio_dev,
+                                       QGuestAllocator *t_alloc,
+                                       void *addr)
+{
+    QVhostUserVideoDevice *virtio_device = g_new0(QVhostUserVideoDevice, 1);
+    QVhostUserVideo *interface = &virtio_device->video;
+
+    interface->vdev = virtio_dev;
+    alloc = t_alloc;
+
+    virtio_device->obj.get_driver = qvirtio_video_device_get_driver;
+    virtio_device->obj.start_hw = qvirtio_video_device_start_hw;
+    virtio_device->obj.destructor = qvirtio_video_device_destructor;
+
+    return &virtio_device->obj;
+}
+
+/* virtio-video-pci */
+static void qvirtio_video_pci_destructor(QOSGraphObject *obj)
+{
+    QVhostUserVideoPCI *video_pci = (QVhostUserVideoPCI *) obj;
+    QOSGraphObject *pci_vobj = &video_pci->pci_vdev.obj;
+
+    virtio_video_cleanup(&video_pci->video);
+    qvirtio_pci_destructor(pci_vobj);
+}
+
+static void qvirtio_video_pci_start_hw(QOSGraphObject *obj)
+{
+    QVhostUserVideoPCI *video_pci = (QVhostUserVideoPCI *) obj;
+    QOSGraphObject *pci_vobj = &video_pci->pci_vdev.obj;
+
+    qvirtio_pci_start_hw(pci_vobj);
+    virtio_video_setup(&video_pci->video);
+}
+
+static void *qvirtio_video_pci_get_driver(void *object, const char *interface)
+{
+    QVhostUserVideoPCI *v_video = object;
+
+    if (!g_strcmp0(interface, "pci-device")) {
+        return v_video->pci_vdev.pdev;
+    }
+    return qvirtio_video_get_driver(&v_video->video, interface);
+}
+
+static void *virtio_video_pci_create(void *pci_bus, QGuestAllocator *t_alloc,
+                                    void *addr)
+{
+    QVhostUserVideoPCI *virtio_spci = g_new0(QVhostUserVideoPCI, 1);
+    QVhostUserVideo *interface = &virtio_spci->video;
+    QOSGraphObject *obj = &virtio_spci->pci_vdev.obj;
+
+    virtio_pci_init(&virtio_spci->pci_vdev, pci_bus, addr);
+    interface->vdev = &virtio_spci->pci_vdev.vdev;
+    alloc = t_alloc;
+
+    obj->get_driver = qvirtio_video_pci_get_driver;
+    obj->start_hw = qvirtio_video_pci_start_hw;
+    obj->destructor = qvirtio_video_pci_destructor;
+
+    return obj;
+}
+
+static void virtio_video_register_nodes(void)
+{
+    QPCIAddress addr = {
+        .devfn = QPCI_DEVFN(PCI_SLOT, PCI_FN),
+    };
+
+    QOSGraphEdgeOptions edge_opts = {
+        .extra_device_opts = "id=video0,chardev=chr-vhost-user-test",
+    };
+
+    /* vhost-user-video-device */
+    qos_node_create_driver("vhost-user-video-device",
+                            virtio_video_device_create);
+    qos_node_consumes("vhost-user-video-device", "virtio-bus", &edge_opts);
+    qos_node_produces("vhost-user-video-device", "vhost-user-video");
+
+    /* vhost-user-video-pci */
+    add_qpci_address(&edge_opts, &addr);
+    qos_node_create_driver("vhost-user-video-pci", virtio_video_pci_create);
+    qos_node_consumes("vhost-user-video-pci", "pci-bus", &edge_opts);
+    qos_node_produces("vhost-user-video-pci", "vhost-user-video");
+}
+
+libqos_init(virtio_video_register_nodes);
diff --git a/tests/qtest/libqos/virtio-video.h b/tests/qtest/libqos/virtio-video.h
new file mode 100644
index 0000000000..6ce42f5edb
--- /dev/null
+++ b/tests/qtest/libqos/virtio-video.h
@@ -0,0 +1,39 @@
+/*
+ * libqos virtio-video definitions
+ *
+ * Copyright (c) 2023 Red Hat Inc.
+ *
+ * Authors:
+ *  Albert Esteve <aesteve@redhat.com>
+ *   (based on virtio-gpio.h)
+ * 
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#ifndef TESTS_LIBQOS_VIRTIO_VIDEO_H
+#define TESTS_LIBQOS_VIRTIO_VIDEO_H
+
+#include "qgraph.h"
+#include "virtio.h"
+#include "virtio-pci.h"
+
+typedef struct QVhostUserVideo QVhostUserVideo;
+typedef struct QVhostUserVideoPCI QVhostUserVideoPCI;
+typedef struct QVhostUserVideoDevice QVhostUserVideoDevice;
+
+struct QVhostUserVideo {
+    QVirtioDevice *vdev;
+    QVirtQueue **queues;
+};
+
+struct QVhostUserVideoPCI {
+    QVirtioPCIDevice pci_vdev;
+    QVhostUserVideo video;
+};
+
+struct QVhostUserVideoDevice {
+    QOSGraphObject obj;
+    QVhostUserVideo video;
+};
+
+#endif /* TESTS_LIBQOS_VIRTIO_VIDEO_H */
diff --git a/tests/qtest/vhost-user-test.c b/tests/qtest/vhost-user-test.c
index bf9f7c4248..27d5c4042e 100644
--- a/tests/qtest/vhost-user-test.c
+++ b/tests/qtest/vhost-user-test.c
@@ -33,6 +33,7 @@
 #include "standard-headers/linux/virtio_ids.h"
 #include "standard-headers/linux/virtio_net.h"
 #include "standard-headers/linux/virtio_gpio.h"
+#include "standard-headers/linux/virtio_video.h"
 
 #ifdef CONFIG_LINUX
 #include <sys/vfs.h>
@@ -145,6 +146,7 @@ enum {
 enum {
     VHOST_USER_NET,
     VHOST_USER_GPIO,
+    VHOST_USER_VIDEO,
 };
 
 typedef struct TestServer {
@@ -1156,3 +1158,33 @@ static void register_vhost_gpio_test(void)
                  "vhost-user-gpio", test_read_guest_mem, &opts);
 }
 libqos_init(register_vhost_gpio_test);
+
+static uint64_t vu_video_get_features(TestServer *s)
+{
+    return 0x1ULL << VHOST_USER_F_PROTOCOL_FEATURES;
+}
+
+static struct vhost_user_ops g_vu_video_ops = {
+    .type = VHOST_USER_VIDEO,
+
+    .append_opts = append_vhost_gpio_opts,
+
+    .get_features = vu_video_get_features,
+    .set_features = vu_net_set_features,
+    .get_protocol_features = vu_gpio_get_protocol_features,
+};
+
+static void register_vhost_video_test(void)
+{
+    QOSGraphTestOptions opts = {
+        .before = vhost_user_test_setup,
+        .subprocess = true,
+        .arg = &g_vu_video_ops,
+    };
+
+    qemu_add_opts(&qemu_chardev_opts);
+
+    qos_add_test("read-guest-mem/memfile",
+                 "vhost-user-video", test_read_guest_mem, &opts);
+}
+libqos_init(register_vhost_video_test);
-- 
2.39.2


