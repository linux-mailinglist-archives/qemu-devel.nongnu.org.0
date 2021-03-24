Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7EDF3472BE
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 08:35:42 +0100 (CET)
Received: from localhost ([::1]:48428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOy3J-0007Rx-Sz
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 03:35:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <viresh.kumar@linaro.org>)
 id 1lOy1I-0005wm-7l
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 03:33:36 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:54883)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <viresh.kumar@linaro.org>)
 id 1lOy1G-0005pb-Eb
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 03:33:36 -0400
Received: by mail-pj1-x102e.google.com with SMTP id w8so11281640pjf.4
 for <qemu-devel@nongnu.org>; Wed, 24 Mar 2021 00:33:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=39/+0LJ0WNF4zm8Jo7cFRlR6uT3LdZ8Gs1InHlxe1es=;
 b=oLBBdxHKbJJjJIsauj4M5wU95awk/RmT1jaRxnk4rQKs90beVtQzkYooj3qJFfMLIZ
 I2rPkGW9hqYnzNhKTOKlIzRf+H4QdMpEhFo27QRYhz9QMmzp/6gPyV0kJP8zL0WHB6Rf
 +kCvjdDHdPaLdysAsgXE79YBsYeIeUabZ0QRdIyikfXHk9PgNRvrUwqSmPGYaD/wUr1G
 1rrOEtzU5rJsKHcP1hJAmkXWYt0jT1aL9TdaASTM8cHHALzNLBGzJYKtOCp+FumCvYgN
 cV9VqiXRm6faridxgskRgxZ40wp/iC10eu9hVrEVJwgKWZUfQdNyWTZJaG/Ccq4iWxL/
 LWQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=39/+0LJ0WNF4zm8Jo7cFRlR6uT3LdZ8Gs1InHlxe1es=;
 b=Hujo/IYAajagKGFsqB5wYqCiDsaliLdNmhZIKi3T1ecXsf9TMProHdwpD7qL9yDXQY
 t2T0BNk4t+4vfMzgoI+Nr4Tz948Oa5B/iAj3vI/uAEA+Fq21MCXgoIb67A66BjylAKG3
 ViyKetx/FgABNjsdawY2u5S5HbYY4xNdiLNCi3nBWeRjjwCckT11YgcX9UFJImx0A/K+
 7kgsE/ha9jRwZCDetn8ftExl31HAp+ACzNPDoy98tP6Wg8QQbdQQIhlBuor/uRVf32GI
 /s3bTwRAtVvMIKruy7rOGIuNhpdrhKi3ZVoCdzSmidaQ1cnx5dW45qgrpeMH+C2lhjGm
 MIcQ==
X-Gm-Message-State: AOAM532q9kboVM5wfIeR7PA1R4OD/1s8TpDscej0Ux5wEfifwLdERwOO
 yyRk4Tou9h0Mj8OA1gGbfLMRsNqVOsfKtg==
X-Google-Smtp-Source: ABdhPJxeTsQ2ryCEctBiySbZEMBlxS632jipG6llBfiqdlR3u1nOdo6cD1VW5LtGnO0asBMSLwr23g==
X-Received: by 2002:a17:902:54e:b029:e7:1029:8ddb with SMTP id
 72-20020a170902054eb02900e710298ddbmr1589540plf.29.1616571212347; 
 Wed, 24 Mar 2021 00:33:32 -0700 (PDT)
Received: from localhost ([122.172.6.13])
 by smtp.gmail.com with ESMTPSA id 138sm1465299pfv.192.2021.03.24.00.33.27
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 24 Mar 2021 00:33:28 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/5] hw/virtio: add vhost-user-i2c-pci boilerplate
Date: Wed, 24 Mar 2021 13:03:11 +0530
Message-Id: <9fbb332cc66aa1df562ac0dd1f54166d68671681.1616570702.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.25.0.rc1.19.g042ed3e048af
In-Reply-To: <cover.1616570702.git.viresh.kumar@linaro.org>
References: <cover.1616570702.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=viresh.kumar@linaro.org; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>, Jie Deng <jie.deng@intel.com>,
 Viresh Kumar <viresh.kumar@linaro.org>, Bill Mills <bill.mills@linaro.org>,
 Arnd Bergmann <arnd.bergmann@linaro.com>, Mike Holmes <mike.holmes@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 stratos-dev@op-lists.linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This allows is to instantiate a vhost-user-i2c device as part of a PCI
bus. It is mostly boilerplate which looks pretty similar to the
vhost-user-fs-pci device.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 hw/virtio/meson.build          |  1 +
 hw/virtio/vhost-user-i2c-pci.c | 79 ++++++++++++++++++++++++++++++++++
 2 files changed, 80 insertions(+)
 create mode 100644 hw/virtio/vhost-user-i2c-pci.c

diff --git a/hw/virtio/meson.build b/hw/virtio/meson.build
index 1a0d736a0db5..bc352a600911 100644
--- a/hw/virtio/meson.build
+++ b/hw/virtio/meson.build
@@ -26,6 +26,7 @@ virtio_ss.add(when: 'CONFIG_VIRTIO_RNG', if_true: files('virtio-rng.c'))
 virtio_ss.add(when: 'CONFIG_VIRTIO_IOMMU', if_true: files('virtio-iommu.c'))
 virtio_ss.add(when: 'CONFIG_VIRTIO_MEM', if_true: files('virtio-mem.c'))
 virtio_ss.add(when: 'CONFIG_VHOST_USER_I2C', if_true: files('vhost-user-i2c.c'))
+virtio_ss.add(when: ['CONFIG_VIRTIO_PCI', 'CONFIG_VHOST_USER_I2C'], if_true: files('vhost-user-i2c-pci.c'))
 
 virtio_pci_ss = ss.source_set()
 virtio_pci_ss.add(when: 'CONFIG_VHOST_VSOCK', if_true: files('vhost-vsock-pci.c'))
diff --git a/hw/virtio/vhost-user-i2c-pci.c b/hw/virtio/vhost-user-i2c-pci.c
new file mode 100644
index 000000000000..4bcfeafcb632
--- /dev/null
+++ b/hw/virtio/vhost-user-i2c-pci.c
@@ -0,0 +1,79 @@
+/*
+ * Vhost-user i2c virtio device PCI glue
+ *
+ * Copyright (c) 2021 Viresh Kumar <viresh.kumar@linaro.org>
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "qemu/osdep.h"
+#include "hw/qdev-properties.h"
+#include "hw/virtio/vhost-user-i2c.h"
+#include "virtio-pci.h"
+
+struct VHostUserI2CPCI {
+    VirtIOPCIProxy parent_obj;
+    VHostUserI2C vdev;
+};
+
+typedef struct VHostUserI2CPCI VHostUserI2CPCI;
+
+#define TYPE_VHOST_USER_I2C_PCI "vhost-user-i2c-pci-base"
+
+DECLARE_INSTANCE_CHECKER(VHostUserI2CPCI, VHOST_USER_I2C_PCI,
+                         TYPE_VHOST_USER_I2C_PCI)
+
+static Property vhost_user_i2c_pci_properties[] = {
+    DEFINE_PROP_UINT32("vectors", VirtIOPCIProxy, nvectors,
+                       DEV_NVECTORS_UNSPECIFIED),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void vhost_user_i2c_pci_realize(VirtIOPCIProxy *vpci_dev, Error **errp)
+{
+    VHostUserI2CPCI *dev = VHOST_USER_I2C_PCI(vpci_dev);
+    DeviceState *vdev = DEVICE(&dev->vdev);
+
+    if (vpci_dev->nvectors == DEV_NVECTORS_UNSPECIFIED) {
+        vpci_dev->nvectors = 1;
+    }
+
+    qdev_realize(vdev, BUS(&vpci_dev->bus), errp);
+}
+
+static void vhost_user_i2c_pci_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    VirtioPCIClass *k = VIRTIO_PCI_CLASS(klass);
+    PCIDeviceClass *pcidev_k = PCI_DEVICE_CLASS(klass);
+    k->realize = vhost_user_i2c_pci_realize;
+    set_bit(DEVICE_CATEGORY_INPUT, dc->categories);
+    device_class_set_props(dc, vhost_user_i2c_pci_properties);
+    pcidev_k->vendor_id = PCI_VENDOR_ID_REDHAT_QUMRANET;
+    pcidev_k->device_id = 0; /* Set by virtio-pci based on virtio id */
+    pcidev_k->revision = 0x00;
+    pcidev_k->class_id = PCI_CLASS_COMMUNICATION_OTHER;
+}
+
+static void vhost_user_i2c_pci_instance_init(Object *obj)
+{
+    VHostUserI2CPCI *dev = VHOST_USER_I2C_PCI(obj);
+
+    virtio_instance_init_common(obj, &dev->vdev, sizeof(dev->vdev),
+                                TYPE_VHOST_USER_I2C);
+}
+
+static const VirtioPCIDeviceTypeInfo vhost_user_i2c_pci_info = {
+    .base_name = TYPE_VHOST_USER_I2C_PCI,
+    .non_transitional_name = "vhost-user-i2c-pci",
+    .instance_size = sizeof(VHostUserI2CPCI),
+    .instance_init = vhost_user_i2c_pci_instance_init,
+    .class_init = vhost_user_i2c_pci_class_init,
+};
+
+static void vhost_user_i2c_pci_register(void)
+{
+    virtio_pci_types_register(&vhost_user_i2c_pci_info);
+}
+
+type_init(vhost_user_i2c_pci_register);
-- 
2.25.0.rc1.19.g042ed3e048af


