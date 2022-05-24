Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5F07532DE0
	for <lists+qemu-devel@lfdr.de>; Tue, 24 May 2022 17:54:15 +0200 (CEST)
Received: from localhost ([::1]:33958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntWrO-00022j-Ga
	for lists+qemu-devel@lfdr.de; Tue, 24 May 2022 11:54:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ntWem-00049H-Lo
 for qemu-devel@nongnu.org; Tue, 24 May 2022 11:41:12 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:45601)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ntWei-0005MW-7B
 for qemu-devel@nongnu.org; Tue, 24 May 2022 11:41:12 -0400
Received: by mail-wr1-x434.google.com with SMTP id p10so7649706wrg.12
 for <qemu-devel@nongnu.org>; Tue, 24 May 2022 08:41:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TJYGQIz+rWx7e0twPEDMb7ZMcWZRr8Vc82PxTGHPmrg=;
 b=mKkwyDWINbHLLi93Re+r4vIPV20FFv+yvrrkwiezPir1JKQbFssYW/9VOKfbxRyZcx
 OrDJc/tPYSbApKTJF5/Zjg9alBOzibWhGSpsiuB3pghtiDigVQrf4//Y3dTrn7wVvAyM
 dQe7fQ8m2v3tR72rsXM3e79YHiVUhoWG2YAgOlYVIDPrkuWNNOpVjHVKIo4W/1J2a/HJ
 zqihnYQT1xXGMCi7/fCYoBUVMlMbTXudXS3NCa9Jm3oz84UZwMQ0RX9DpHYB13avTDHQ
 jdM+ARwcrGFWjdvMe2lvi/D3SLzGgx2jUPIvup7LBg8BUndbIqvoQTSnMf592i6cjW3Y
 rG3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TJYGQIz+rWx7e0twPEDMb7ZMcWZRr8Vc82PxTGHPmrg=;
 b=cJjWbc42PEvIj76t4rNC9DJHbRe/kZ2+CrRIIq7e7yvB40PVjAAkJpQ5qvtWhLQCHE
 4g3nk9tUYgVa9JWDHxfJEZUWJM/I7yz3dU6tf56CeKMVsLR+L35t7HXn3JYBWlnv7Y5L
 NravLdcL+b51z2xn7H9f05EoB0ib9oRBer3esf0nU8ksqDc/zPutc2bFkYoRQl4BF03d
 k4EkR1M5P7jDTzVbdpvDreKYr36GPridsddeZiF1yLomQLrJR7oONH6YspSDHr2M9riR
 kEIHeo14yPUExQauv+efXq54CADNSUxK4NNs+ZiSbhi7RRsq7FkKSCgzNSl60gxGVnvu
 gkeQ==
X-Gm-Message-State: AOAM530KBxAKDWjF+dOP323lVcaqBRamFQE4Vd3cLAU0OoAnSE0qDfiE
 bMCE08GBhQPJR85JWyXwiKK5MHFl5P4c7Q==
X-Google-Smtp-Source: ABdhPJxQhkMyFBRDzTENUuBhPu4Dir5LmoTXuLPN3AcAXj45k9piZlvZshjiuWArgPJlKPWl5S+O5Q==
X-Received: by 2002:adf:d08d:0:b0:20f:fb5a:6b43 with SMTP id
 y13-20020adfd08d000000b0020ffb5a6b43mr365028wrh.637.1653406866850; 
 Tue, 24 May 2022 08:41:06 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 o9-20020adfba09000000b0020d07d90b71sm13472736wrg.66.2022.05.24.08.40.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 May 2022 08:41:01 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E65F91FFBE;
 Tue, 24 May 2022 16:40:56 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: slp@redhat.com, mst@redhat.com, marcandre.lureau@redhat.com,
 stefanha@redhat.com, mathieu.poirier@linaro.org, viresh.kumar@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH  v2 06/15] hw/virtio: add vhost-user-gpio-pci boilerplate
Date: Tue, 24 May 2022 16:40:47 +0100
Message-Id: <20220524154056.2896913-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220524154056.2896913-1-alex.bennee@linaro.org>
References: <20220524154056.2896913-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x434.google.com
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

From: Viresh Kumar <viresh.kumar@linaro.org>

This allows is to instantiate a vhost-user-gpio device as part of a PCI
bus. It is mostly boilerplate which looks pretty similar to the
vhost-user-fs-pci device.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <5f560cab92d0d789b1c94295ec74b9952907d69d.1641987128.git.viresh.kumar@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 hw/virtio/vhost-user-gpio-pci.c | 69 +++++++++++++++++++++++++++++++++
 hw/virtio/meson.build           |  1 +
 2 files changed, 70 insertions(+)
 create mode 100644 hw/virtio/vhost-user-gpio-pci.c

diff --git a/hw/virtio/vhost-user-gpio-pci.c b/hw/virtio/vhost-user-gpio-pci.c
new file mode 100644
index 0000000000..b3028a24a1
--- /dev/null
+++ b/hw/virtio/vhost-user-gpio-pci.c
@@ -0,0 +1,69 @@
+/*
+ * Vhost-user gpio virtio device PCI glue
+ *
+ * Copyright (c) 2022 Viresh Kumar <viresh.kumar@linaro.org>
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "qemu/osdep.h"
+#include "hw/qdev-properties.h"
+#include "hw/virtio/vhost-user-gpio.h"
+#include "hw/virtio/virtio-pci.h"
+
+struct VHostUserGPIOPCI {
+    VirtIOPCIProxy parent_obj;
+    VHostUserGPIO vdev;
+};
+
+typedef struct VHostUserGPIOPCI VHostUserGPIOPCI;
+
+#define TYPE_VHOST_USER_GPIO_PCI "vhost-user-gpio-pci-base"
+
+DECLARE_INSTANCE_CHECKER(VHostUserGPIOPCI, VHOST_USER_GPIO_PCI,
+                         TYPE_VHOST_USER_GPIO_PCI)
+
+static void vhost_user_gpio_pci_realize(VirtIOPCIProxy *vpci_dev, Error **errp)
+{
+    VHostUserGPIOPCI *dev = VHOST_USER_GPIO_PCI(vpci_dev);
+    DeviceState *vdev = DEVICE(&dev->vdev);
+
+    vpci_dev->nvectors = 1;
+    qdev_realize(vdev, BUS(&vpci_dev->bus), errp);
+}
+
+static void vhost_user_gpio_pci_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    VirtioPCIClass *k = VIRTIO_PCI_CLASS(klass);
+    PCIDeviceClass *pcidev_k = PCI_DEVICE_CLASS(klass);
+    k->realize = vhost_user_gpio_pci_realize;
+    set_bit(DEVICE_CATEGORY_INPUT, dc->categories);
+    pcidev_k->vendor_id = PCI_VENDOR_ID_REDHAT_QUMRANET;
+    pcidev_k->device_id = 0; /* Set by virtio-pci based on virtio id */
+    pcidev_k->revision = 0x00;
+    pcidev_k->class_id = PCI_CLASS_COMMUNICATION_OTHER;
+}
+
+static void vhost_user_gpio_pci_instance_init(Object *obj)
+{
+    VHostUserGPIOPCI *dev = VHOST_USER_GPIO_PCI(obj);
+
+    virtio_instance_init_common(obj, &dev->vdev, sizeof(dev->vdev),
+                                TYPE_VHOST_USER_GPIO);
+}
+
+static const VirtioPCIDeviceTypeInfo vhost_user_gpio_pci_info = {
+    .base_name = TYPE_VHOST_USER_GPIO_PCI,
+    .non_transitional_name = "vhost-user-gpio-pci",
+    .instance_size = sizeof(VHostUserGPIOPCI),
+    .instance_init = vhost_user_gpio_pci_instance_init,
+    .class_init = vhost_user_gpio_pci_class_init,
+};
+
+static void vhost_user_gpio_pci_register(void)
+{
+    virtio_pci_types_register(&vhost_user_gpio_pci_info);
+}
+
+type_init(vhost_user_gpio_pci_register);
diff --git a/hw/virtio/meson.build b/hw/virtio/meson.build
index 33c8e71fab..c14e3db10a 100644
--- a/hw/virtio/meson.build
+++ b/hw/virtio/meson.build
@@ -30,6 +30,7 @@ virtio_ss.add(when: 'CONFIG_VIRTIO_MEM', if_true: files('virtio-mem.c'))
 virtio_ss.add(when: 'CONFIG_VHOST_USER_I2C', if_true: files('vhost-user-i2c.c'))
 virtio_ss.add(when: 'CONFIG_VHOST_USER_RNG', if_true: files('vhost-user-rng.c'))
 virtio_ss.add(when: 'CONFIG_VHOST_USER_GPIO', if_true: files('vhost-user-gpio.c'))
+virtio_ss.add(when: ['CONFIG_VIRTIO_PCI', 'CONFIG_VHOST_USER_GPIO'], if_true: files('vhost-user-gpio-pci.c'))
 
 virtio_pci_ss = ss.source_set()
 virtio_pci_ss.add(when: 'CONFIG_VHOST_VSOCK', if_true: files('vhost-vsock-pci.c'))
-- 
2.30.2


