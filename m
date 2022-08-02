Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37637587ACA
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Aug 2022 12:36:52 +0200 (CEST)
Received: from localhost ([::1]:41892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIpGc-0007cp-IZ
	for lists+qemu-devel@lfdr.de; Tue, 02 Aug 2022 06:36:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oIohS-0005G4-3j
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 06:00:30 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:37648)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oIohK-0006DB-8O
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 06:00:29 -0400
Received: by mail-wr1-x435.google.com with SMTP id z17so12498011wrq.4
 for <qemu-devel@nongnu.org>; Tue, 02 Aug 2022 03:00:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=ES3P1RAWW4Xg6DVYirTqKJQ7c1EO4knl3H0A5mgKf8M=;
 b=Cn/uODqppxqVEemKOblvb4+obYxHAx9C/sC794rr3wxk8cq3AacDOCYzQ21b5uH1lH
 mFW6zb64s4JbW2C658CP0eLhY7cQwII8X7oGXUbdNOppjGHZglbpzmFQF5GxUDW9XWsD
 euEySNVXRtDC9EMHwHH5RznUJB5XimaH28vOAmd2OWPEMkAuCL2p0uW0DVudSmQH5S89
 sJVRUZGrdjEogVOmgBRJ2uOYczpLwzQzPoRP2FwF2OZISjNe3/E4FXvXfSl4Rg8ocHc1
 Nx9BFOG4vNc4XUn3+DmfdxWnxf4idEAnyZ31b4schfGU/GyEsiQqrHceTZXawA/P0lz1
 +nFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=ES3P1RAWW4Xg6DVYirTqKJQ7c1EO4knl3H0A5mgKf8M=;
 b=z+NOizBpt5AROIidQceNBeyO5ytlhBQl/hTWoxDn1Dp74ULxs1b5nEqfBDzHUGtD//
 pj4sPatEYX5JeSzv/qpnGi1mEgflnFEowZcUAQOv2ogp1V/O8Wq4KfVHDcBWxZ7uSJGV
 ZveA+6YSoM9gbr69jri+GPO3wgW+6oDVwiAFkhZnTLlZJJlUV7z5i6JEwUBVXS1DzB7G
 rUQsqB77EsIWZaCb0XLsmU/vXwNcJMkoD2XtANyMQKtngFmzN821kkcdd1R4swuHCCsS
 WkSHCpOwglMxi8uBg+sSKFkYBnV1nxbc5lKjpik/fnLqFowYFKRPZekOSC9EaLsqLSqA
 V3Aw==
X-Gm-Message-State: ACgBeo2qNiMs0n9L9/xHF1ATP/Uykae1/93bMyTMmFU8STom2FMZq4Z9
 dTetKYPrRA8ZE8a+i0ytyDeLaQ==
X-Google-Smtp-Source: AA6agR7NbqDdDb5XjjwXKvTcf7RbSODWqKv13AawQnd8bOyMP4o6UGdvpT8LhpEF7SzmiTGZDTkMzg==
X-Received: by 2002:a5d:6d0b:0:b0:21d:9f54:efa2 with SMTP id
 e11-20020a5d6d0b000000b0021d9f54efa2mr12255842wrq.607.1659434421411; 
 Tue, 02 Aug 2022 03:00:21 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 q187-20020a1c43c4000000b003a302fb9df7sm4240923wma.21.2022.08.02.03.00.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Aug 2022 03:00:14 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A37861FFCE;
 Tue,  2 Aug 2022 10:50:12 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: slp@redhat.com, mst@redhat.com, marcandre.lureau@redhat.com,
 stefanha@redhat.com, mathieu.poirier@linaro.org, viresh.kumar@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Auger <eric.auger@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>
Subject: [PATCH  v4 22/22] tests/qtest: enable tests for virtio-gpio
Date: Tue,  2 Aug 2022 10:50:10 +0100
Message-Id: <20220802095010.3330793-23-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220802095010.3330793-1-alex.bennee@linaro.org>
References: <20220802095010.3330793-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We don't have a virtio-gpio implementation in QEMU and only
support a vhost-user backend. The QEMU side of the code is minimal so
it should be enough to instantiate the device and pass some vhost-user
messages over the control socket. To do this we hook into the existing
vhost-user-test code and just add the bits required for gpio.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Eric Auger <eric.auger@redhat.com>
Message-Id: <20220408155704.2777166-1-alex.bennee@linaro.org>

---
v2
  - add more of the missing boilerplate
  - don't request LOG_SHMD
  - use get_features op
  - report VIRTIO_F_VERSION_1
  - more comments
v4
  - update MAINTAINERS
---
 tests/qtest/libqos/virtio-gpio.h |  35 +++++++
 tests/qtest/libqos/virtio-gpio.c | 171 +++++++++++++++++++++++++++++++
 tests/qtest/libqos/virtio.c      |   2 +-
 tests/qtest/vhost-user-test.c    |  66 ++++++++++++
 MAINTAINERS                      |   1 +
 tests/qtest/libqos/meson.build   |   1 +
 6 files changed, 275 insertions(+), 1 deletion(-)
 create mode 100644 tests/qtest/libqos/virtio-gpio.h
 create mode 100644 tests/qtest/libqos/virtio-gpio.c

diff --git a/tests/qtest/libqos/virtio-gpio.h b/tests/qtest/libqos/virtio-gpio.h
new file mode 100644
index 0000000000..f11d41bd19
--- /dev/null
+++ b/tests/qtest/libqos/virtio-gpio.h
@@ -0,0 +1,35 @@
+/*
+ * virtio-gpio structures
+ *
+ * Copyright (c) 2022 Linaro Ltd
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#ifndef TESTS_LIBQOS_VIRTIO_GPIO_H
+#define TESTS_LIBQOS_VIRTIO_GPIO_H
+
+#include "qgraph.h"
+#include "virtio.h"
+#include "virtio-pci.h"
+
+typedef struct QVhostUserGPIO QVhostUserGPIO;
+typedef struct QVhostUserGPIOPCI QVhostUserGPIOPCI;
+typedef struct QVhostUserGPIODevice QVhostUserGPIODevice;
+
+struct QVhostUserGPIO {
+    QVirtioDevice *vdev;
+    QVirtQueue **queues;
+};
+
+struct QVhostUserGPIOPCI {
+    QVirtioPCIDevice pci_vdev;
+    QVhostUserGPIO gpio;
+};
+
+struct QVhostUserGPIODevice {
+    QOSGraphObject obj;
+    QVhostUserGPIO gpio;
+};
+
+#endif
diff --git a/tests/qtest/libqos/virtio-gpio.c b/tests/qtest/libqos/virtio-gpio.c
new file mode 100644
index 0000000000..762aa6695b
--- /dev/null
+++ b/tests/qtest/libqos/virtio-gpio.c
@@ -0,0 +1,171 @@
+/*
+ * virtio-gpio nodes for testing
+ *
+ * Copyright (c) 2022 Linaro Ltd
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "qemu/osdep.h"
+#include "standard-headers/linux/virtio_config.h"
+#include "../libqtest.h"
+#include "qemu/module.h"
+#include "qgraph.h"
+#include "virtio-gpio.h"
+
+static QGuestAllocator *alloc;
+
+static void virtio_gpio_cleanup(QVhostUserGPIO *gpio)
+{
+    QVirtioDevice *vdev = gpio->vdev;
+    int i;
+
+    for (i = 0; i < 2; i++) {
+        qvirtqueue_cleanup(vdev->bus, gpio->queues[i], alloc);
+    }
+    g_free(gpio->queues);
+}
+
+/*
+ * This handles the VirtIO setup from the point of view of the driver
+ * frontend and therefor doesn't present any vhost specific features
+ * and in fact masks of the re-used bit.
+ */
+static void virtio_gpio_setup(QVhostUserGPIO *gpio)
+{
+    QVirtioDevice *vdev = gpio->vdev;
+    uint64_t features;
+    int i;
+
+    features = qvirtio_get_features(vdev);
+    features &= ~QVIRTIO_F_BAD_FEATURE;
+    qvirtio_set_features(vdev, features);
+
+    gpio->queues = g_new(QVirtQueue *, 2);
+    for (i = 0; i < 2; i++) {
+        gpio->queues[i] = qvirtqueue_setup(vdev, alloc, i);
+    }
+    qvirtio_set_driver_ok(vdev);
+}
+
+static void *qvirtio_gpio_get_driver(QVhostUserGPIO *v_gpio,
+                                     const char *interface)
+{
+    if (!g_strcmp0(interface, "vhost-user-gpio")) {
+        return v_gpio;
+    }
+    if (!g_strcmp0(interface, "virtio")) {
+        return v_gpio->vdev;
+    }
+
+    g_assert_not_reached();
+}
+
+static void *qvirtio_gpio_device_get_driver(void *object,
+                                            const char *interface)
+{
+    QVhostUserGPIODevice *v_gpio = object;
+    return qvirtio_gpio_get_driver(&v_gpio->gpio, interface);
+}
+
+/* virtio-gpio (mmio) */
+static void qvirtio_gpio_device_destructor(QOSGraphObject *obj)
+{
+    QVhostUserGPIODevice *gpio_dev = (QVhostUserGPIODevice *) obj;
+    virtio_gpio_cleanup(&gpio_dev->gpio);
+}
+
+static void qvirtio_gpio_device_start_hw(QOSGraphObject *obj)
+{
+    QVhostUserGPIODevice *gpio_dev = (QVhostUserGPIODevice *) obj;
+    virtio_gpio_setup(&gpio_dev->gpio);
+}
+
+static void *virtio_gpio_device_create(void *virtio_dev,
+                                       QGuestAllocator *t_alloc,
+                                       void *addr)
+{
+    QVhostUserGPIODevice *virtio_device = g_new0(QVhostUserGPIODevice, 1);
+    QVhostUserGPIO *interface = &virtio_device->gpio;
+
+    interface->vdev = virtio_dev;
+    alloc = t_alloc;
+
+    virtio_device->obj.get_driver = qvirtio_gpio_device_get_driver;
+    virtio_device->obj.start_hw = qvirtio_gpio_device_start_hw;
+    virtio_device->obj.destructor = qvirtio_gpio_device_destructor;
+
+    return &virtio_device->obj;
+}
+
+/* virtio-gpio-pci */
+static void qvirtio_gpio_pci_destructor(QOSGraphObject *obj)
+{
+    QVhostUserGPIOPCI *gpio_pci = (QVhostUserGPIOPCI *) obj;
+    QOSGraphObject *pci_vobj =  &gpio_pci->pci_vdev.obj;
+
+    virtio_gpio_cleanup(&gpio_pci->gpio);
+    qvirtio_pci_destructor(pci_vobj);
+}
+
+static void qvirtio_gpio_pci_start_hw(QOSGraphObject *obj)
+{
+    QVhostUserGPIOPCI *gpio_pci = (QVhostUserGPIOPCI *) obj;
+    QOSGraphObject *pci_vobj =  &gpio_pci->pci_vdev.obj;
+
+    qvirtio_pci_start_hw(pci_vobj);
+    virtio_gpio_setup(&gpio_pci->gpio);
+}
+
+static void *qvirtio_gpio_pci_get_driver(void *object, const char *interface)
+{
+    QVhostUserGPIOPCI *v_gpio = object;
+
+    if (!g_strcmp0(interface, "pci-device")) {
+        return v_gpio->pci_vdev.pdev;
+    }
+    return qvirtio_gpio_get_driver(&v_gpio->gpio, interface);
+}
+
+static void *virtio_gpio_pci_create(void *pci_bus, QGuestAllocator *t_alloc,
+                                    void *addr)
+{
+    QVhostUserGPIOPCI *virtio_spci = g_new0(QVhostUserGPIOPCI, 1);
+    QVhostUserGPIO *interface = &virtio_spci->gpio;
+    QOSGraphObject *obj = &virtio_spci->pci_vdev.obj;
+
+    virtio_pci_init(&virtio_spci->pci_vdev, pci_bus, addr);
+    interface->vdev = &virtio_spci->pci_vdev.vdev;
+    alloc = t_alloc;
+
+    obj->get_driver = qvirtio_gpio_pci_get_driver;
+    obj->start_hw = qvirtio_gpio_pci_start_hw;
+    obj->destructor = qvirtio_gpio_pci_destructor;
+
+    return obj;
+}
+
+static void virtio_gpio_register_nodes(void)
+{
+    QPCIAddress addr = {
+        .devfn = QPCI_DEVFN(4, 0),
+    };
+
+    QOSGraphEdgeOptions edge_opts = { };
+
+    /* vhost-user-gpio-device */
+    edge_opts.extra_device_opts = "id=gpio0,chardev=chr-vhost-user-test";
+    qos_node_create_driver("vhost-user-gpio-device",
+                            virtio_gpio_device_create);
+    qos_node_consumes("vhost-user-gpio-device", "virtio-bus", &edge_opts);
+    qos_node_produces("vhost-user-gpio-device", "vhost-user-gpio");
+
+    /* virtio-gpio-pci */
+    edge_opts.extra_device_opts = "id=gpio0,addr=04.0,chardev=chr-vhost-user-test";
+    add_qpci_address(&edge_opts, &addr);
+    qos_node_create_driver("vhost-user-gpio-pci", virtio_gpio_pci_create);
+    qos_node_consumes("vhost-user-gpio-pci", "pci-bus", &edge_opts);
+    qos_node_produces("vhost-user-gpio-pci", "vhost-user-gpio");
+}
+
+libqos_init(virtio_gpio_register_nodes);
diff --git a/tests/qtest/libqos/virtio.c b/tests/qtest/libqos/virtio.c
index 03056e5187..410513225f 100644
--- a/tests/qtest/libqos/virtio.c
+++ b/tests/qtest/libqos/virtio.c
@@ -110,7 +110,7 @@ void qvirtio_set_features(QVirtioDevice *d, uint64_t features)
      * This could be a separate function for drivers that want to access
      * configuration space before setting FEATURES_OK, but no existing users
      * need that and it's less code for callers if this is done implicitly.
-    */
+     */
     if (features & (1ull << VIRTIO_F_VERSION_1)) {
         uint8_t status = d->bus->get_status(d) |
                          VIRTIO_CONFIG_S_FEATURES_OK;
diff --git a/tests/qtest/vhost-user-test.c b/tests/qtest/vhost-user-test.c
index fe46e28cf2..d79bd28cd1 100644
--- a/tests/qtest/vhost-user-test.c
+++ b/tests/qtest/vhost-user-test.c
@@ -32,6 +32,7 @@
 #include "standard-headers/linux/vhost_types.h"
 #include "standard-headers/linux/virtio_ids.h"
 #include "standard-headers/linux/virtio_net.h"
+#include "standard-headers/linux/virtio_gpio.h"
 
 #ifdef CONFIG_LINUX
 #include <sys/vfs.h>
@@ -53,9 +54,12 @@
 #define VHOST_MAX_VIRTQUEUES    0x100
 
 #define VHOST_USER_F_PROTOCOL_FEATURES 30
+#define VIRTIO_F_VERSION_1 32
+
 #define VHOST_USER_PROTOCOL_F_MQ 0
 #define VHOST_USER_PROTOCOL_F_LOG_SHMFD 1
 #define VHOST_USER_PROTOCOL_F_CROSS_ENDIAN   6
+#define VHOST_USER_PROTOCOL_F_CONFIG 9
 
 #define VHOST_LOG_PAGE 0x1000
 
@@ -140,6 +144,7 @@ enum {
 
 enum {
     VHOST_USER_NET,
+    VHOST_USER_GPIO,
 };
 
 typedef struct TestServer {
@@ -198,6 +203,19 @@ static void append_vhost_net_opts(TestServer *s, GString *cmd_line,
                            chr_opts, s->chr_name);
 }
 
+/*
+ * For GPIO there are no other magic devices we need to add (like
+ * block or netdev) so all we need to worry about is the vhost-user
+ * chardev socket.
+ */
+static void append_vhost_gpio_opts(TestServer *s, GString *cmd_line,
+                             const char *chr_opts)
+{
+    g_string_append_printf(cmd_line, QEMU_CMD_CHR,
+                           s->chr_name, s->socket_path,
+                           chr_opts);
+}
+
 static void append_mem_opts(TestServer *server, GString *cmd_line,
                             int size, enum test_memfd memfd)
 {
@@ -1088,3 +1106,51 @@ static void register_vhost_user_test(void)
                  test_multiqueue, &opts);
 }
 libqos_init(register_vhost_user_test);
+
+static uint64_t vu_gpio_get_features(TestServer *s)
+{
+    return 0x1ULL << VIRTIO_F_VERSION_1 |
+        0x1ULL << VIRTIO_GPIO_F_IRQ |
+        0x1ULL << VHOST_USER_F_PROTOCOL_FEATURES;
+}
+
+/*
+ * This stub can't handle all the message types but we should reply
+ * that we support VHOST_USER_PROTOCOL_F_CONFIG as gpio would use it
+ * talking to a read vhost-user daemon.
+ */
+static void vu_gpio_get_protocol_features(TestServer *s, CharBackend *chr,
+                                          VhostUserMsg *msg)
+{
+    /* send back features to qemu */
+    msg->flags |= VHOST_USER_REPLY_MASK;
+    msg->size = sizeof(m.payload.u64);
+    msg->payload.u64 = 1ULL << VHOST_USER_PROTOCOL_F_CONFIG;
+
+    qemu_chr_fe_write_all(chr, (uint8_t *)msg, VHOST_USER_HDR_SIZE + msg->size);
+}
+
+static struct vhost_user_ops g_vu_gpio_ops = {
+    .type = VHOST_USER_GPIO,
+
+    .append_opts = append_vhost_gpio_opts,
+
+    .get_features = vu_gpio_get_features,
+    .set_features = vu_net_set_features,
+    .get_protocol_features = vu_gpio_get_protocol_features,
+};
+
+static void register_vhost_gpio_test(void)
+{
+    QOSGraphTestOptions opts = {
+        .before = vhost_user_test_setup,
+        .subprocess = true,
+        .arg = &g_vu_gpio_ops,
+    };
+
+    qemu_add_opts(&qemu_chardev_opts);
+
+    qos_add_test("read-guest-mem/memfile",
+                 "vhost-user-gpio", test_read_guest_mem, &opts);
+}
+libqos_init(register_vhost_gpio_test);
diff --git a/MAINTAINERS b/MAINTAINERS
index bb526df674..a8a94da424 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2104,6 +2104,7 @@ R: Viresh Kumar <viresh.kumar@linaro.org>
 S: Maintained
 F: hw/virtio/vhost-user-gpio*
 F: include/hw/virtio/vhost-user-gpio.h
+F: tests/qtest/libqos/virtio-gpio.*
 
 virtio-crypto
 M: Gonglei <arei.gonglei@huawei.com>
diff --git a/tests/qtest/libqos/meson.build b/tests/qtest/libqos/meson.build
index fd5d6e5ae1..9dc815ddd4 100644
--- a/tests/qtest/libqos/meson.build
+++ b/tests/qtest/libqos/meson.build
@@ -45,6 +45,7 @@ libqos_srcs = files(
         'virtio-scsi.c',
         'virtio-serial.c',
         'virtio-iommu.c',
+        'virtio-gpio.c',
         'generic-pcihost.c',
 
         # qgraph machines:
-- 
2.30.2


