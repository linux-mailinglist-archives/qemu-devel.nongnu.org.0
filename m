Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 903523A7074
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 22:31:35 +0200 (CEST)
Received: from localhost ([::1]:36700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lstF8-0004Fd-KJ
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 16:31:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1lstCX-0001Zn-CH
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 16:28:53 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434]:39469)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1lstCV-0005hh-8L
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 16:28:53 -0400
Received: by mail-pf1-x434.google.com with SMTP id k15so11479269pfp.6
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 13:28:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=S/O1M1xy8qnEH5DkM7qojc/M8Nl3BQRdLguDgKBWfTs=;
 b=uwJlMdZVaXiyGEgP+3OEI/TXrlInB9r6omG3EGV92FwIFilzEzEyMgd33NakDVtMYK
 xUj07IrAoTyapdoBi7XR0pb3BgkR3OQJWqhso3tIm8OAfeJ1RXmNLRHRMytpQYhCJqYO
 RLw5X7IjmM6jsA0FZhd55K6LdJoWcs0Paas5Z/lhH5wbU73VL4bom8AJk5ob9NWsEJ3W
 EAaVXZ9Wr/YVNIReLb9ZCMrO3L/WPhUOcO9gFdV8byUSYcl0FUDLncF3eiTjZipxeA66
 y7L/uCe0USgK81wbm+eFfmg0asCfFQAqIi58vegIuYEnEOQEdGS1d0rf1fb3rIIJ4wI0
 9m7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=S/O1M1xy8qnEH5DkM7qojc/M8Nl3BQRdLguDgKBWfTs=;
 b=gNqq4qnMgSqhoWiya5f6xaZ5BxFfU25RnxLmAW28L70U3s64x0FYAVjA6NOoCQICxz
 S7GCsE/95y+h2POdE/vVdtCkWprvq2UmM12kLH9VUUyF1lebTV/WpZKHmSiaGoIPGj8J
 rizj1wMXotM/dtsFXrxHHxd6nsvWZYQzWYvd4/xnX1LVa9BZRDh1RcuAXGJoTQkSE6Qy
 FzWl9R1BjTdpfWSqgHykKX/WPpbLx9I9rxqAhE9Tz15Pvoz+PhedOLtSH7sa1ckIe7Sh
 smiVLhnnDX1wuuLbnYYfz+8ZmAYFWOyGfjxYAMIXJSr3077zrU86E4xepGtoHbuuCvfd
 gxCQ==
X-Gm-Message-State: AOAM530UsOQUOrv6ZPBC59UjlFk57ItfrOYAd7ZQf6N7LufP1i5Ll+zK
 K1QRwauWvKodYnrB6CefVCG1dB3DITIAMA==
X-Google-Smtp-Source: ABdhPJzV/cWJUdCNWt52bxEXbZv6A2yormcPdxPcqgG20w5zRGev5fUPUojim0utPKTC2jBJ6+L4og==
X-Received: by 2002:a63:4849:: with SMTP id x9mr19000109pgk.59.1623702530017; 
 Mon, 14 Jun 2021 13:28:50 -0700 (PDT)
Received: from p14s.cg.shawcable.net (S0106889e681aac74.cg.shawcable.net.
 [68.147.0.187])
 by smtp.gmail.com with ESMTPSA id fs10sm289029pjb.31.2021.06.14.13.28.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jun 2021 13:28:49 -0700 (PDT)
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: mst@redhat.com,
	alex.bennee@linaro.org
Subject: [PATCH v2 2/5] vhost-user-rng-pci: Add vhost-user-rng-pci
 implementation
Date: Mon, 14 Jun 2021 14:28:39 -0600
Message-Id: <20210614202842.581640-3-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210614202842.581640-1-mathieu.poirier@linaro.org>
References: <20210614202842.581640-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=mathieu.poirier@linaro.org; helo=mail-pf1-x434.google.com
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
Cc: qemu-devel@nongnu.org, stratos-dev@op-lists.linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch provides a PCI bus interface to the vhost-user-rng backed.
The implentation is similar to what was done for vhost-user-i2c-pci and
vhost-user-fs-pci.

Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 hw/virtio/meson.build          |  1 +
 hw/virtio/vhost-user-rng-pci.c | 79 ++++++++++++++++++++++++++++++++++
 2 files changed, 80 insertions(+)
 create mode 100644 hw/virtio/vhost-user-rng-pci.c

diff --git a/hw/virtio/meson.build b/hw/virtio/meson.build
index e386791f2a05..1430b370e64d 100644
--- a/hw/virtio/meson.build
+++ b/hw/virtio/meson.build
@@ -26,6 +26,7 @@ virtio_ss.add(when: 'CONFIG_VIRTIO_RNG', if_true: files('virtio-rng.c'))
 virtio_ss.add(when: 'CONFIG_VIRTIO_IOMMU', if_true: files('virtio-iommu.c'))
 virtio_ss.add(when: 'CONFIG_VIRTIO_MEM', if_true: files('virtio-mem.c'))
 virtio_ss.add(when: 'CONFIG_VHOST_USER_RNG', if_true: files('vhost-user-rng.c'))
+virtio_ss.add(when: ['CONFIG_VHOST_USER_RNG', 'CONFIG_VIRTIO_PCI'], if_true: files('vhost-user-rng-pci.c'))
 
 virtio_pci_ss = ss.source_set()
 virtio_pci_ss.add(when: 'CONFIG_VHOST_VSOCK', if_true: files('vhost-vsock-pci.c'))
diff --git a/hw/virtio/vhost-user-rng-pci.c b/hw/virtio/vhost-user-rng-pci.c
new file mode 100644
index 000000000000..ffff2de39fd4
--- /dev/null
+++ b/hw/virtio/vhost-user-rng-pci.c
@@ -0,0 +1,79 @@
+/*
+ * Vhost-user RNG virtio device PCI glue
+ *
+ * Copyright (c) 2021 Mathieu Poirier <mathieu.poirier@linaro.org>
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "qemu/osdep.h"
+#include "hw/qdev-properties.h"
+#include "hw/virtio/vhost-user-rng.h"
+#include "virtio-pci.h"
+
+struct VHostUserRNGPCI {
+    VirtIOPCIProxy parent_obj;
+    VHostUserRNG vdev;
+};
+
+typedef struct VHostUserRNGPCI VHostUserRNGPCI;
+
+#define TYPE_VHOST_USER_RNG_PCI "vhost-user-rng-pci-base"
+
+DECLARE_INSTANCE_CHECKER(VHostUserRNGPCI, VHOST_USER_RNG_PCI,
+                         TYPE_VHOST_USER_RNG_PCI)
+
+static Property vhost_user_rng_pci_properties[] = {
+    DEFINE_PROP_UINT32("vectors", VirtIOPCIProxy, nvectors,
+                       DEV_NVECTORS_UNSPECIFIED),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void vhost_user_rng_pci_realize(VirtIOPCIProxy *vpci_dev, Error **errp)
+{
+    VHostUserRNGPCI *dev = VHOST_USER_RNG_PCI(vpci_dev);
+    DeviceState *vdev = DEVICE(&dev->vdev);
+
+    if (vpci_dev->nvectors == DEV_NVECTORS_UNSPECIFIED) {
+        vpci_dev->nvectors = 1;
+    }
+
+    qdev_realize(vdev, BUS(&vpci_dev->bus), errp);
+}
+
+static void vhost_user_rng_pci_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    VirtioPCIClass *k = VIRTIO_PCI_CLASS(klass);
+    PCIDeviceClass *pcidev_k = PCI_DEVICE_CLASS(klass);
+    k->realize = vhost_user_rng_pci_realize;
+    set_bit(DEVICE_CATEGORY_INPUT, dc->categories);
+    device_class_set_props(dc, vhost_user_rng_pci_properties);
+    pcidev_k->vendor_id = PCI_VENDOR_ID_REDHAT_QUMRANET;
+    pcidev_k->device_id = 0; /* Set by virtio-pci based on virtio id */
+    pcidev_k->revision = 0x00;
+    pcidev_k->class_id = PCI_CLASS_COMMUNICATION_OTHER;
+}
+
+static void vhost_user_rng_pci_instance_init(Object *obj)
+{
+    VHostUserRNGPCI *dev = VHOST_USER_RNG_PCI(obj);
+
+    virtio_instance_init_common(obj, &dev->vdev, sizeof(dev->vdev),
+                                TYPE_VHOST_USER_RNG);
+}
+
+static const VirtioPCIDeviceTypeInfo vhost_user_rng_pci_info = {
+    .base_name = TYPE_VHOST_USER_RNG_PCI,
+    .non_transitional_name = "vhost-user-rng-pci",
+    .instance_size = sizeof(VHostUserRNGPCI),
+    .instance_init = vhost_user_rng_pci_instance_init,
+    .class_init = vhost_user_rng_pci_class_init,
+};
+
+static void vhost_user_rng_pci_register(void)
+{
+    virtio_pci_types_register(&vhost_user_rng_pci_info);
+}
+
+type_init(vhost_user_rng_pci_register);
-- 
2.25.1


