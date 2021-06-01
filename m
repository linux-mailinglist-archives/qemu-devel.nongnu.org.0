Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEF97397AF8
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 22:05:38 +0200 (CEST)
Received: from localhost ([::1]:54390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loAdt-0004S4-V6
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 16:05:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1loAbb-0002LN-M8
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 16:03:15 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:37382)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1loAbZ-0002tP-Jp
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 16:03:15 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 22-20020a17090a0c16b0290164a5354ad0so2097508pjs.2
 for <qemu-devel@nongnu.org>; Tue, 01 Jun 2021 13:03:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=S/O1M1xy8qnEH5DkM7qojc/M8Nl3BQRdLguDgKBWfTs=;
 b=YoGcrAavacaYvrhB0kKTS/cEqqtP+LX30mTCG3MGptOqIK5hgqzkIakNFm+tvE0RJC
 rY2oSzhIQ+FSDksGfIkqgxxSNy5Frzwf0tnla3iLt54wIPBA/lljEPdyHrX9zRcDeGs3
 TxAjLR1mnfTvHJyhDBING8EFRj3FOU1Lk1GktTQBcb4r7JvIUJoaoxKg5e7Kx4FXyq80
 81rJHsM8OPwsom73iIkvck8MQDwkFOR+8zlaBF5snM53bdEbpOJ5kAwgvzw8dfg5zaX+
 rhTrryciVF+wBDAwVKSQfVStUzwWLnpDvzi2tnfZBo3vY2k7hN82O6jfEFfanSgxvubd
 gY8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=S/O1M1xy8qnEH5DkM7qojc/M8Nl3BQRdLguDgKBWfTs=;
 b=rk4WbhdwjmEGvNoidXntsY5tHJdzVqQ8XLGuxCTaN9iZEGDtn9I4JOYrn/HYttUOpm
 b+DRIbUd9BW3eOIL8Ij8PnQrwgvOGKlZTIPQRfm8NAWZ8aAWRbakYhSzU7Ig10ZYGJvj
 //fhhn54kMn2oZP6tACsJ/b3f+UHzpvJGBf+fbfVDBzoQvHcRrpYfGwrWe691z4C/rtw
 3DB/45bosOuz2Havxi2PTvDb0QkfBHdMnPlLq0OS/6EUQ7bcvtAYf0H6NzFi3pmCoxHw
 DuoVwrx40IxTUyWf3agHZ4iU/vNGzRXjf6MeYz5HkQzIf9VY5wQFvEMUTvpYS2VyHxgH
 dTLw==
X-Gm-Message-State: AOAM530tfIBZgOQLg6OxpWosg9qrQfmMjjs7JApJMRk1/cyo3hC0yElM
 M2gR5IPIXv/nh6SBdiGiFMpWMA==
X-Google-Smtp-Source: ABdhPJyj9TJm8j0fOHrFzYvtuFdqxlGvbQ+xbm256BZCFYirXFq5GJzqGNedWX9+PXuI8HuCQwn2XQ==
X-Received: by 2002:a17:90a:8581:: with SMTP id
 m1mr26781567pjn.47.1622577791191; 
 Tue, 01 Jun 2021 13:03:11 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106889e681aac74.cg.shawcable.net.
 [68.147.0.187])
 by smtp.gmail.com with ESMTPSA id 23sm15486229pgv.90.2021.06.01.13.03.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Jun 2021 13:03:09 -0700 (PDT)
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: mst@redhat.com
Subject: [PATCH 2/5] vhost-user-rng-pci: Add vhost-user-rng-pci implementation
Date: Tue,  1 Jun 2021 14:03:02 -0600
Message-Id: <20210601200305.1772391-3-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210601200305.1772391-1-mathieu.poirier@linaro.org>
References: <20210601200305.1772391-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=mathieu.poirier@linaro.org; helo=mail-pj1-x1030.google.com
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
Cc: viresh.kumar@linaro.org, alex.bennee@linaro.org, qemu-devel@nongnu.org,
 stratos-dev@op-lists.linaro.org
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


