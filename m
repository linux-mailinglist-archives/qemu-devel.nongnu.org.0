Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48A2E4F99FE
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Apr 2022 17:58:29 +0200 (CEST)
Received: from localhost ([::1]:56830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncr0F-00035b-TV
	for lists+qemu-devel@lfdr.de; Fri, 08 Apr 2022 11:58:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ncqz7-0002P4-2L
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 11:57:17 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:43571)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ncqz4-0003gk-Vw
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 11:57:16 -0400
Received: by mail-ej1-x634.google.com with SMTP id bq8so18148301ejb.10
 for <qemu-devel@nongnu.org>; Fri, 08 Apr 2022 08:57:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eoYHxzNQsl7hp9Yi6SYJFnsQ9bA+IMRrA4aYPKvhJ9s=;
 b=OtkRshwmZbkB+rxWI/2cbqf8dyVBXmxmgWZ0W9+fNwErM3eEgMhaLkEH/HGSjaoni7
 794o1YUSMU+dkN2IkXRgL1G0ZTI2IUFdcPB1J6mLZlRxdscXQ5m68aLzFL7yEzZkTy/q
 vQrLAtfOA+V959sY5594VJbEPIg24gv/Y+Kql41h319m797it1AMfUzW7wocXLW8xcf0
 tiHzUuelczMNF+mCHhz6Y61H3WnkdTip1SD0mDWvcwqvaXKCcho9XlD/89Fq/El+4tWK
 8IFpJcoEiofL3UrGHLIXH/ufc9rzK9oV0iArEPrrBMwFEHi1PkFBTf2uCciKktuvuM0+
 sHsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eoYHxzNQsl7hp9Yi6SYJFnsQ9bA+IMRrA4aYPKvhJ9s=;
 b=1Xgew0oOstiESNtZWhlVrQ2DfA34kD1gFMJRXZjOA7sQQoP4CUUNi+HKpaZhBl43pj
 NFMVyiEZvaKvn1OP9NJ7vv/TUIgfx2jh+jm05gB15oK4O2QRM99JYBh7eFbcv839Z2d2
 8VPsOboJH0W/E84KLUfmWzmbaNlwGy8iF8ErMPE/BXmD9dgdmlSmmMGoD3nDtWwmAKOz
 KBxuIJMCoYbi/LgRrEAeGE25M0dwnJXLOH9cwo7CdznMueFgjGB7QEXMheocattQViBP
 9FQjA3BYyZ+BGrTs5o/2HPQhqSxGXH5kKbaE3yMpwJQP8x5BTGdUDs1WLJbLAAe5Ivhe
 mfkg==
X-Gm-Message-State: AOAM53072SLPwnO33VKsGgj6vhzkuyj0nRrmy/Zl1qCmM27pE57kJryH
 ixN3sbwgWBQywD8msUXuUBtLIg==
X-Google-Smtp-Source: ABdhPJylHE5yb1O7Sfz5Vqdj0/fHCKFLogj8r3LpwJMoc92BsGM5fyHgLEgZDT16a68rvNnRPmAhYg==
X-Received: by 2002:a17:907:c309:b0:6e8:4e5:6504 with SMTP id
 tl9-20020a170907c30900b006e804e56504mr18473511ejc.706.1649433433287; 
 Fri, 08 Apr 2022 08:57:13 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 p3-20020a1709060e8300b006d0e8ada804sm8771603ejf.127.2022.04.08.08.57.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Apr 2022 08:57:12 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 8A65B1FFB7;
 Fri,  8 Apr 2022 16:57:11 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v2] tests/qtest: attempt to enable tests for virtio-gpio
 (!working)
Date: Fri,  8 Apr 2022 16:57:03 +0100
Message-Id: <20220408155704.2777166-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x634.google.com
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 slp@redhat.com, mathieu.poirier@linaro.org, mst@redhat.com,
 viresh.kumar@linaro.org, Eric Auger <eric.auger@redhat.com>,
 stefanha@redhat.com, Paolo Bonzini <pbonzini@redhat.com>,
 marcandre.lureau@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We don't have a virtio-gpio implementation in QEMU and only
support a vhost-user backend. The QEMU side of the code is minimal so
it should be enough to instantiate the device and pass some vhost-user
messages over the control socket. To do this we hook into the existing
vhost-user-test code and just add the bits required for gpio.

Based-on: 20220210145254.157790-1-eric.auger@redhat.com [+ my fix]
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Eric Auger <eric.auger@redhat.com>
Message-Id: <20220121151534.3654562-1-alex.bennee@linaro.org>

---
v2
  - made progress, now starts up cleanly
    - fix application of extra arguments (causing dupe ids)
    - added (partial) F_CONFIG support
  - however seems to hang qos-test which never sees the get_config msg
    - it should have failed the test in chr_read()
---
 tests/qtest/libqos/virtio-gpio.h | 34 +++++++++++
 tests/qtest/libqos/virtio-gpio.c | 98 ++++++++++++++++++++++++++++++++
 tests/qtest/vhost-user-test.c    | 60 +++++++++++++++++++
 tests/qtest/libqos/meson.build   |  1 +
 4 files changed, 193 insertions(+)
 create mode 100644 tests/qtest/libqos/virtio-gpio.h
 create mode 100644 tests/qtest/libqos/virtio-gpio.c

diff --git a/tests/qtest/libqos/virtio-gpio.h b/tests/qtest/libqos/virtio-gpio.h
new file mode 100644
index 0000000000..abe6967ae9
--- /dev/null
+++ b/tests/qtest/libqos/virtio-gpio.h
@@ -0,0 +1,34 @@
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
index 0000000000..a12671c8b1
--- /dev/null
+++ b/tests/qtest/libqos/virtio-gpio.c
@@ -0,0 +1,98 @@
+/*
+ * virtio-gpio nodes for testing
+ *
+ * Copyright (c) 2022 Linaro Ltd
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "qemu/osdep.h"
+#include "libqtest.h"
+#include "qemu/module.h"
+#include "qgraph.h"
+#include "virtio-gpio.h"
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
+    fprintf(stderr, "%s not present in virtio-gpio-device\n", interface);
+    g_assert_not_reached();
+}
+
+static void *qvirtio_gpio_device_get_driver(void *object,
+                                              const char *interface)
+{
+    QVhostUserGPIODevice *v_gpio = object;
+    return qvirtio_gpio_get_driver(&v_gpio->gpio, interface);
+}
+
+static void *virtio_gpio_device_create(void *virtio_dev,
+                                         QGuestAllocator *t_alloc,
+                                         void *addr)
+{
+    QVhostUserGPIODevice *virtio_device = g_new0(QVhostUserGPIODevice, 1);
+    QVhostUserGPIO *interface = &virtio_device->gpio;
+
+    interface->vdev = virtio_dev;
+
+    virtio_device->obj.get_driver = qvirtio_gpio_device_get_driver;
+
+    return &virtio_device->obj;
+}
+
+/* virtio-gpio-pci */
+static void *qvirtio_gpio_pci_get_driver(void *object, const char *interface)
+{
+    QVhostUserGPIOPCI *v_gpio = object;
+    if (!g_strcmp0(interface, "pci-device")) {
+        return v_gpio->pci_vdev.pdev;
+    }
+    return qvirtio_gpio_get_driver(&v_gpio->gpio, interface);
+}
+
+static void *virtio_gpio_pci_create(void *pci_bus, QGuestAllocator *t_alloc,
+                                      void *addr)
+{
+    QVhostUserGPIOPCI *virtio_spci = g_new0(QVhostUserGPIOPCI, 1);
+    QVhostUserGPIO *interface = &virtio_spci->gpio;
+    QOSGraphObject *obj = &virtio_spci->pci_vdev.obj;
+
+    virtio_pci_init(&virtio_spci->pci_vdev, pci_bus, addr);
+    interface->vdev = &virtio_spci->pci_vdev.vdev;
+
+    obj->get_driver = qvirtio_gpio_pci_get_driver;
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
diff --git a/tests/qtest/vhost-user-test.c b/tests/qtest/vhost-user-test.c
index ee30f54796..836f30a4be 100644
--- a/tests/qtest/vhost-user-test.c
+++ b/tests/qtest/vhost-user-test.c
@@ -55,6 +55,7 @@
 #define VHOST_USER_PROTOCOL_F_MQ 0
 #define VHOST_USER_PROTOCOL_F_LOG_SHMFD 1
 #define VHOST_USER_PROTOCOL_F_CROSS_ENDIAN   6
+#define VHOST_USER_PROTOCOL_F_CONFIG 9
 
 #define VHOST_LOG_PAGE 0x1000
 
@@ -78,6 +79,8 @@ typedef enum VhostUserRequest {
     VHOST_USER_SET_PROTOCOL_FEATURES = 16,
     VHOST_USER_GET_QUEUE_NUM = 17,
     VHOST_USER_SET_VRING_ENABLE = 18,
+    VHOST_USER_GET_CONFIG = 24,
+    VHOST_USER_SET_CONFIG = 25,
     VHOST_USER_MAX
 } VhostUserRequest;
 
@@ -137,6 +140,7 @@ enum {
 
 enum {
     VHOST_USER_NET,
+    VHOST_USER_GPIO,
 };
 
 typedef struct TestServer {
@@ -194,6 +198,19 @@ static void append_vhost_net_opts(TestServer *s, GString *cmd_line,
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
@@ -426,6 +443,8 @@ static void chr_read(void *opaque, const uint8_t *buf, int size)
         break;
 
     default:
+        g_test_message("unhandled vhost-user message: %d", msg.request);
+        g_test_fail();
         break;
     }
 
@@ -1014,3 +1033,44 @@ static void register_vhost_user_test(void)
                  test_multiqueue, &opts);
 }
 libqos_init(register_vhost_user_test);
+
+/*
+ * This stub can't handle all the message types but we should reply
+ * that we support VHOST_USER_PROTOCOL_F_CONFIG as gpio would use it
+ * talking to a read vhost-user daemon.
+ */
+static void vu_gpio_get_protocol_features(TestServer *s, CharBackend *chr,
+        VhostUserMsg *msg)
+{
+    /* send back features to qemu */
+    msg->flags |= VHOST_USER_REPLY_MASK;
+    msg->size = sizeof(m.payload.u64);
+    msg->payload.u64 = 1ULL << VHOST_USER_PROTOCOL_F_LOG_SHMFD;
+    msg->payload.u64 |= 1ULL << VHOST_USER_PROTOCOL_F_CONFIG;
+
+    qemu_chr_fe_write_all(chr, (uint8_t *)msg, VHOST_USER_HDR_SIZE + msg->size);
+}
+
+static struct vhost_user_ops g_vu_gpio_ops = {
+    .type = VHOST_USER_GPIO,
+
+    .append_opts = append_vhost_gpio_opts,
+
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
diff --git a/tests/qtest/libqos/meson.build b/tests/qtest/libqos/meson.build
index 8c8ee15553..f581330d8b 100644
--- a/tests/qtest/libqos/meson.build
+++ b/tests/qtest/libqos/meson.build
@@ -42,6 +42,7 @@ libqos_srcs = files('../libqtest.c',
         'virtio-scsi.c',
         'virtio-serial.c',
         'virtio-iommu.c',
+        'virtio-gpio.c',
         'generic-pcihost.c',
 
         # qgraph machines:
-- 
2.30.2


