Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D71642AE73
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Oct 2021 23:04:39 +0200 (CEST)
Received: from localhost ([::1]:53808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maOww-0003Kx-Ki
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 17:04:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1maOri-0005w8-Iz
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 16:59:14 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:34386)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1maOrg-0005ZF-Ut
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 16:59:14 -0400
Received: by mail-pg1-x530.google.com with SMTP id 133so284996pgb.1
 for <qemu-devel@nongnu.org>; Tue, 12 Oct 2021 13:59:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ATiigdiyl6eSZmUol7/b9Qr5eElVhu1VmJG7FVbfZqg=;
 b=XQfYPvEOCV3YdS1ENJoEXO0r1wYzcUtn02COLuUYSsN66QX57k9g9dTd60hfdG2pre
 1WqC3aJLiKlwAlFTOtsSNYP1FuhWv3u9fuO84VToWMb7CNa3ukKIIa9kEg95R63VfKPP
 s5BUcg9GBwF15MuTyO1SHZgBYwLsY4JiH9IxypxAEYvmP+2NKL0KgDpzBkFs+XECWNN/
 A3SRTc5LXpVhmv5j7Y0Ufgw6jD0JbcycKM20LiKVQuwZ0AahktluYHg0Ka95jaIeK1q0
 hvNzc3yts+7EWC0/iUFpWr9BmGSyMSbuxn3DtjtSgGILm7G3K8wDRgWpQkrlC8eCKsQh
 WxTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ATiigdiyl6eSZmUol7/b9Qr5eElVhu1VmJG7FVbfZqg=;
 b=VGq9dgd0NnSuwEhLK+XRQuTRKr/NRekdwWt7dzcY8EQ9VZDg9wLxVbWHTQ13DudOmC
 7iBwf9T18bsO1xzHKrFv7Zqll++u8PnE7VEIT9RduTiYWvqk+HQ3xp6Ms7/w+NTR7DV6
 e8gEEju38hqKeMTVZ+tOcfr1EmF8xJ/vbj5ftsZhctsFVNZkqSxClFra5NknJzVa7y6c
 aH1XezJkPpHQ0/jP4syxUCcSGZUkgt/Ac/4z1TMBSXkm+BYTse5YxpUm70syfP7UprKj
 nbilmpIfSTEaQlGGaEMa1pvTc1FbnCKuuRjwDP64E7o2Bkxt1zltq1EPDkvoR4UR3zVX
 1Gkw==
X-Gm-Message-State: AOAM532Miqv4ptaZ7mOBTdQLy/XeX/zwZwRws9MwassXBmVcMdHV4PE9
 +J4T8MJEdSRvGGPx9gTv64u1MQ==
X-Google-Smtp-Source: ABdhPJz1jcZQ0SvudDWBOc8T0GnCG797ydBrzfuAhPfZhvgMnEzP303JmufIAmbIgl1EMQQiFjy1RA==
X-Received: by 2002:a05:6a00:1488:b0:44d:25b2:f80b with SMTP id
 v8-20020a056a00148800b0044d25b2f80bmr10903806pfu.20.1634072351521; 
 Tue, 12 Oct 2021 13:59:11 -0700 (PDT)
Received: from p14s.cg.shawcable.net (S0106889e681aac74.cg.shawcable.net.
 [68.147.0.187])
 by smtp.gmail.com with ESMTPSA id e24sm11695087pfn.8.2021.10.12.13.59.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Oct 2021 13:59:10 -0700 (PDT)
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: mst@redhat.com
Subject: [PATCH v5 2/3] vhost-user-rng-pci: Add vhost-user-rng-pci
 implementation
Date: Tue, 12 Oct 2021 14:59:03 -0600
Message-Id: <20211012205904.4106769-3-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211012205904.4106769-1-mathieu.poirier@linaro.org>
References: <20211012205904.4106769-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=mathieu.poirier@linaro.org; helo=mail-pg1-x530.google.com
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
Cc: alex.bennee@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch provides a PCI bus interface to the vhost-user-rng backend.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 hw/virtio/meson.build          |  1 +
 hw/virtio/vhost-user-rng-pci.c | 79 ++++++++++++++++++++++++++++++++++
 2 files changed, 80 insertions(+)
 create mode 100644 hw/virtio/vhost-user-rng-pci.c

diff --git a/hw/virtio/meson.build b/hw/virtio/meson.build
index ae6b2cde1068..521f7d64a86a 100644
--- a/hw/virtio/meson.build
+++ b/hw/virtio/meson.build
@@ -28,6 +28,7 @@ virtio_ss.add(when: 'CONFIG_VIRTIO_MEM', if_true: files('virtio-mem.c'))
 virtio_ss.add(when: 'CONFIG_VHOST_USER_I2C', if_true: files('vhost-user-i2c.c'))
 virtio_ss.add(when: ['CONFIG_VIRTIO_PCI', 'CONFIG_VHOST_USER_I2C'], if_true: files('vhost-user-i2c-pci.c'))
 virtio_ss.add(when: 'CONFIG_VHOST_USER_RNG', if_true: files('vhost-user-rng.c'))
+virtio_ss.add(when: ['CONFIG_VHOST_USER_RNG', 'CONFIG_VIRTIO_PCI'], if_true: files('vhost-user-rng-pci.c'))
 
 virtio_pci_ss = ss.source_set()
 virtio_pci_ss.add(when: 'CONFIG_VHOST_VSOCK', if_true: files('vhost-vsock-pci.c'))
diff --git a/hw/virtio/vhost-user-rng-pci.c b/hw/virtio/vhost-user-rng-pci.c
new file mode 100644
index 000000000000..c83dc8681385
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
+    pcidev_k->class_id = PCI_CLASS_OTHERS;
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


