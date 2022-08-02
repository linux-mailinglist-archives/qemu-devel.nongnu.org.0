Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3D79587A70
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Aug 2022 12:15:23 +0200 (CEST)
Received: from localhost ([::1]:37796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIovq-00041a-U8
	for lists+qemu-devel@lfdr.de; Tue, 02 Aug 2022 06:15:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oIoXr-0001X7-FU
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 05:50:35 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:35554)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oIoXp-0002WD-Mf
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 05:50:35 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 v131-20020a1cac89000000b003a4bb3f786bso2898128wme.0
 for <qemu-devel@nongnu.org>; Tue, 02 Aug 2022 02:50:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=UmxR2E4mbxJZdFKpR2RK7UtJOZ7yVasaorcYyzhlbQs=;
 b=uGRZuCp+Zbp3xdIldAdE5QKkEql/6hR8zK2yfY/RMh3PejTP1GNesyFfYlaElvRR/t
 52R4JI8rAdsBQqyjQeF2FhlcNCFkKtVXTqfoj9GXJ7CLoOiNREBvN/GjEhoEbObINRMJ
 pdhWOrLDHJtDZjKyrin74pdelsRH/aGHktLYkdcy+1qRXJt8Uje5mOuPpG//ZbI6Or2Q
 YDs1LnT06HdOde6zK8uU8/itOJZ0WokgHXzI1zBb9QDRARmsOiGOC9OwKCl4LAxjFd9Z
 sbYcM+tdwPIForc1YduWWhCGrXOMs0pYmNw03MCQv8dk2wk+W5lgrOAxA8ZFIpn2Jm89
 6AFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=UmxR2E4mbxJZdFKpR2RK7UtJOZ7yVasaorcYyzhlbQs=;
 b=w5Xc88Ki3cUYMP5rTqRPKQZevD6tnkai4u74Lf42J/QctWLmvwORED1BhxVypKSsYc
 r2zjsy/sliDoZxRSePmF8i0R9gAJYvUxNshJsISIIJCHZcdAL64VHUbMZu4k1lo+YwRq
 35Hd44l9oQeTVCXpcoX+fFpQdbSu+1td1nOE8BB0Wbs1bXBc4tWFXMEJEk8dndABZd9t
 rBOyuVzdpekJ+X2SyzV2Ah2/PXmSFzuyMqGcU/eL3Syea01ZS2JulQgwbX/QbJrjPfg4
 hNN0jD2VFJ9nXC0bQjDYWunWbsVoxH4djmLP1ktEExroFK0ktOYbp8GHaeixrg2lSuyJ
 lWow==
X-Gm-Message-State: AJIora9CtCqNZVmNQS2S8+Af+8S9Hhqs5yC15jKwRkIMQlDtWi8yGZ03
 dKyev0EMyXLk7U8t4cMbPHQkjfImKK9txQ==
X-Google-Smtp-Source: AGRyM1s9O4w1XAf4zhRrc/9jrGOHS8bKdGK0LKqGaxLHD9oMugZOIaXS8cU1/awjyagDCIcjCefPLA==
X-Received: by 2002:a1c:7915:0:b0:3a3:11a3:7452 with SMTP id
 l21-20020a1c7915000000b003a311a37452mr13421975wme.27.1659433831298; 
 Tue, 02 Aug 2022 02:50:31 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 d14-20020adfef8e000000b0021d6dad334bsm14645190wro.4.2022.08.02.02.50.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Aug 2022 02:50:22 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E6B1B1FFC5;
 Tue,  2 Aug 2022 10:50:11 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: slp@redhat.com, mst@redhat.com, marcandre.lureau@redhat.com,
 stefanha@redhat.com, mathieu.poirier@linaro.org, viresh.kumar@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH  v4 13/22] hw/virtio: add vhost-user-gpio-pci boilerplate
Date: Tue,  2 Aug 2022 10:50:01 +0100
Message-Id: <20220802095010.3330793-14-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220802095010.3330793-1-alex.bennee@linaro.org>
References: <20220802095010.3330793-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x335.google.com
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
v4
  - tweak MAINTAINER
---
 hw/virtio/vhost-user-gpio-pci.c | 69 +++++++++++++++++++++++++++++++++
 MAINTAINERS                     |  2 +-
 hw/virtio/meson.build           |  1 +
 3 files changed, 71 insertions(+), 1 deletion(-)
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
diff --git a/MAINTAINERS b/MAINTAINERS
index 2c4749a110..bb526df674 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2102,7 +2102,7 @@ vhost-user-gpio
 M: Alex Bennée <alex.bennee@linaro.org>
 R: Viresh Kumar <viresh.kumar@linaro.org>
 S: Maintained
-F: hw/virtio/vhost-user-gpio.c
+F: hw/virtio/vhost-user-gpio*
 F: include/hw/virtio/vhost-user-gpio.h
 
 virtio-crypto
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


