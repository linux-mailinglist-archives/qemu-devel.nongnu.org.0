Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38DC948C378
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 12:47:46 +0100 (CET)
Received: from localhost ([::1]:42950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7c6T-0003ny-Bs
	for lists+qemu-devel@lfdr.de; Wed, 12 Jan 2022 06:47:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <viresh.kumar@linaro.org>)
 id 1n7buJ-0005k7-Gi
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 06:35:11 -0500
Received: from [2607:f8b0:4864:20::102e] (port=53942
 helo=mail-pj1-x102e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <viresh.kumar@linaro.org>)
 id 1n7buH-0004PC-Hz
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 06:35:11 -0500
Received: by mail-pj1-x102e.google.com with SMTP id m13so4197596pji.3
 for <qemu-devel@nongnu.org>; Wed, 12 Jan 2022 03:35:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hc04GTwbHG5HNfG8t/ZjxlkSK9IsAkZHgUp1q6tJUYY=;
 b=PxAZLDECr2SXFw5deEk7OGWJjJjcTnPnKXwZPcJTjURsSI/d5Oa1Zu9PQFG3KTN74+
 rpqsqdAR8cN3iBj2XaKvU6FcvuTaW5pNQgUbEiegCkGdzuW2ZcdI+U9b71ocV3qUwy7i
 YVfBF5Akkcp3z3b6oxZf8gJGrQqJ927k9KzjofhfuAluMwjb7KRBIMS7+SYAAHQFVYY4
 vE7qmy7ZGHQLU02hjDZzCoJL/P25aJpCxak4Bqn223hGpNVJWADhThvodjm32ieESskF
 ViPLcWnFvuawyAQX6JWhrOY0gyD8a8zp6aSjW2GauG4l0lgdgvIqp+Gz/tJyEreYvdNs
 HXeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hc04GTwbHG5HNfG8t/ZjxlkSK9IsAkZHgUp1q6tJUYY=;
 b=l68ZCK0iiEG6pq2wGKtwP1aTn5nGVfyl3msLPKA+0Wezs2JQUE3Ymsc2mr6uwyYnzI
 D/H/YR3LfEHwlNZF+iq4jvweJTlzytSbxv7dvGMSoXxG8GCSVfiKg+d0YVMsl8bEH8ao
 Kwqu6Ucm2wPSm44i4/sgqPG3oAuyxxo06TSXKLMskII82v9Crb8RoUo2yN4BHvKihEWZ
 KShRiuENHr1KQZ/9hFEKUyw5aH/7Wgwrp3gETyco4rGAT2UEg0l7q7pONNh/cp7qpndb
 sPcjrQ1EE/lZ9l0iPX8jcZ+iZ8T1QcLfpVKXl+gmaIBD7LCh2vc8qybDaFEfrPvNtoJg
 Dg0g==
X-Gm-Message-State: AOAM531L+8hkfyEXCZ/vOO8tzXcCF6t6TPUhBuPCODGFtp8gKSoKjHBN
 u7b9SQdQ35GxQNU0Zp63D117d2Y4zcfPhQ==
X-Google-Smtp-Source: ABdhPJwQuezfB9jhswcG5mb0ugCvclUBvuIZU/vtdnCqBIwzULEySXpy5pyHUFRs1rGfz4DARVcW/Q==
X-Received: by 2002:a17:903:2287:b0:149:fa57:ea87 with SMTP id
 b7-20020a170903228700b00149fa57ea87mr8763045plh.94.1641987308316; 
 Wed, 12 Jan 2022 03:35:08 -0800 (PST)
Received: from localhost ([122.171.221.63])
 by smtp.gmail.com with ESMTPSA id y23sm10677970pfa.80.2022.01.12.03.35.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jan 2022 03:35:07 -0800 (PST)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: qemu-devel@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>
Subject: [PATCH 2/2] hw/virtio: add vhost-user-gpio-pci boilerplate
Date: Wed, 12 Jan 2022 17:04:59 +0530
Message-Id: <5f560cab92d0d789b1c94295ec74b9952907d69d.1641987128.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <cover.1641987128.git.viresh.kumar@linaro.org>
References: <cover.1641987128.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=viresh.kumar@linaro.org; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
 Vincent Guittot <vincent.guittot@linaro.org>, stratos-dev@op-lists.linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This allows is to instantiate a vhost-user-gpio device as part of a PCI
bus. It is mostly boilerplate which looks pretty similar to the
vhost-user-fs-pci device.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 hw/virtio/meson.build           |  1 +
 hw/virtio/vhost-user-gpio-pci.c | 69 +++++++++++++++++++++++++++++++++
 2 files changed, 70 insertions(+)
 create mode 100644 hw/virtio/vhost-user-gpio-pci.c

diff --git a/hw/virtio/meson.build b/hw/virtio/meson.build
index c7e67adff337..fe6a4e9acb2a 100644
--- a/hw/virtio/meson.build
+++ b/hw/virtio/meson.build
@@ -30,6 +30,7 @@ virtio_ss.add(when: ['CONFIG_VIRTIO_PCI', 'CONFIG_VHOST_USER_I2C'], if_true: fil
 virtio_ss.add(when: 'CONFIG_VHOST_USER_RNG', if_true: files('vhost-user-rng.c'))
 virtio_ss.add(when: ['CONFIG_VHOST_USER_RNG', 'CONFIG_VIRTIO_PCI'], if_true: files('vhost-user-rng-pci.c'))
 virtio_ss.add(when: 'CONFIG_VHOST_USER_GPIO', if_true: files('vhost-user-gpio.c'))
+virtio_ss.add(when: ['CONFIG_VIRTIO_PCI', 'CONFIG_VHOST_USER_GPIO'], if_true: files('vhost-user-gpio-pci.c'))
 
 virtio_pci_ss = ss.source_set()
 virtio_pci_ss.add(when: 'CONFIG_VHOST_VSOCK', if_true: files('vhost-vsock-pci.c'))
diff --git a/hw/virtio/vhost-user-gpio-pci.c b/hw/virtio/vhost-user-gpio-pci.c
new file mode 100644
index 000000000000..8dd042d5e1c1
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
+#include "virtio-pci.h"
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
-- 
2.31.1.272.g89b43f80a514


