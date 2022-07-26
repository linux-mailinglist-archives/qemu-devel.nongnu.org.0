Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0D78581AC8
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jul 2022 22:14:00 +0200 (CEST)
Received: from localhost ([::1]:51524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGQwJ-0003gz-86
	for lists+qemu-devel@lfdr.de; Tue, 26 Jul 2022 16:13:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oGQGA-0006bj-6V
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 15:30:35 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:34779)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oGQG4-0003bF-3k
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 15:30:22 -0400
Received: by mail-wr1-x42c.google.com with SMTP id h8so21457802wrw.1
 for <qemu-devel@nongnu.org>; Tue, 26 Jul 2022 12:30:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TJYGQIz+rWx7e0twPEDMb7ZMcWZRr8Vc82PxTGHPmrg=;
 b=rbC3RCkFQLOWSKwxagAYuVJF2zp2n0bmKFOy5vbWFv0oWniEMmWI8VGPrj00yOq/RY
 lmrijP9isQ0gJmD4ZjL1mJcPXzNfb2gyogn1amPM+wc5/ffM9jhvE496ilnfO3FFaKdP
 1wz2FORZIdXkeaiy8juQbUQNO4YoENc+WW36Fstgu2KUMwYEcY6Y9TQsHtTdtVHyRGEW
 ZdzIYdpdixxW3mYd4s396W9WIElndQgkEUOVXS87JMUdC+zIs8c+su2yQR+ggjvbypeX
 Y/bcubCquOg1aUCH8BVRwqM+MMDkAGA+HSQu8kQJ62+6jOOh3yaexPFqoKFK8/fNZCAr
 jw9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TJYGQIz+rWx7e0twPEDMb7ZMcWZRr8Vc82PxTGHPmrg=;
 b=jiuYZ/TcMzPN+CjHikXny8TI+AsrIsuk8QdLrrhTIZNxfgIynMItFVw0KleBUKJdaI
 nPmDXT9rtV2l1aQoyqQFcMp1t2fER6Ut598r1WBgYsy1NJ0sZQMSEEE3B6B4nBiEHm6F
 GVeRvprU9GKFenNh6p9KO/vORgZ/lLSX00xYXhjyaA1/CRFKHiMbtIOfSTW8bcjft3hN
 f0xwtv7RCIpkw0dzyoBzdDDXfybQfRLbjSyVvgpjzthFJlVjwMybBt38Ix1iuZt5kP9z
 Sbh7BFLq9DVluvSSuIudQFjlP2UnxG89O5T/KrBB/3fevA4P3fSwFLkZJjtH7b8TkUbX
 Firg==
X-Gm-Message-State: AJIora+StU0UN2GK2wqIbSrUZCIGUNAg2Cbk/NBQd5+5oRacEatXzDgy
 q8xqqvIlyUPbRkbF0lAUshaG3Q==
X-Google-Smtp-Source: AGRyM1v/EP8nba2SBussHKMr4DmX2ICvXysTtIL+uDUDZD2N32iJBtYInsYbekT6bupmWHAUZKX9Pw==
X-Received: by 2002:a5d:460e:0:b0:21e:6d12:d308 with SMTP id
 t14-20020a5d460e000000b0021e6d12d308mr11951414wrq.419.1658863818534; 
 Tue, 26 Jul 2022 12:30:18 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 i6-20020a5d5226000000b0021d6d9c0bd9sm15124735wra.82.2022.07.26.12.30.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Jul 2022 12:30:14 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 62CE21FFC4;
 Tue, 26 Jul 2022 20:21:51 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: slp@redhat.com, mst@redhat.com, marcandre.lureau@redhat.com,
 stefanha@redhat.com, mathieu.poirier@linaro.org, viresh.kumar@linaro.org,
 mark.cave-ayland@ilande.co.uk, jasowang@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH  v3 12/21] hw/virtio: add vhost-user-gpio-pci boilerplate
Date: Tue, 26 Jul 2022 20:21:41 +0100
Message-Id: <20220726192150.2435175-13-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220726192150.2435175-1-alex.bennee@linaro.org>
References: <20220726192150.2435175-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42c.google.com
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


