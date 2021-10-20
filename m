Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5957543495B
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Oct 2021 12:49:35 +0200 (CEST)
Received: from localhost ([::1]:44832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1md9A6-0002ln-CM
	for lists+qemu-devel@lfdr.de; Wed, 20 Oct 2021 06:49:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1md8ht-0004TC-Ih
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 06:20:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49613)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1md8hr-0003Sv-Mr
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 06:20:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634725223;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jYEn3VZIxvZ4Dxo5UlkZgMWK5p2ofZWjA/KPLo/RDe4=;
 b=Y7JvgTubUZlnqNhLspX2xTzgWIcPOEztlxo0oONgSQyToP+k1R1GokEGTrJDMBISFo6Ldo
 VBlaz0aVN52DmbsoenA40N5qb3dW/tUY44M1RxiLB+QVerG6gScknN0NXURAfwJxRbFjXH
 SuSYJ/evFzIznAb+OW13I/0T7yey/BU=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-540-1_EMN9N1MxSigoTpv_HveQ-1; Wed, 20 Oct 2021 06:20:21 -0400
X-MC-Unique: 1_EMN9N1MxSigoTpv_HveQ-1
Received: by mail-ed1-f69.google.com with SMTP id
 r25-20020a05640216d900b003dca3501ab4so4076734edx.15
 for <qemu-devel@nongnu.org>; Wed, 20 Oct 2021 03:20:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=jYEn3VZIxvZ4Dxo5UlkZgMWK5p2ofZWjA/KPLo/RDe4=;
 b=8QGUkDXf5pTl3cBktLYvQn+lO5zZ4daZ+8cphAPHUjBVtH8ZY+19FFbYCMY1/qIX/f
 PYb2zRQQ9mjlYEZUjq5MWqV1DAJg15ITesNKLx+OwNd62iaQ0vKW05jOi9CA1nlwG3Z2
 obH89m7LXkiz5Di9+Y9QBxH+6+1frtRzZumjVfHI3r+jHubEQz21TjQHoEsuPj8X84PG
 aHY7KDOyg/a5+wSygQPRgzdEGdT4PHgmzw0I0gOhFwqdMZGd9vs8cwFc2RLNR+HL5jfW
 YRbIFiPsP5ZKn0iT22DAkQfpC5MQr2+KzygtrTrCFvSALRbFUbXEkTDeGO4IcE4CThEG
 5KLg==
X-Gm-Message-State: AOAM530R+G1LrVEokAHS7VAemIjdezwKNQMHLaPspFvp1UTvPUt/vISa
 n+0DkKZrR1B1BlOn9XJL1M3ZfIrDv7OcCzhkVQ0vkVGnvxwRD5h4G4pqY8zkBVtQ3Ol6tgX19RC
 6D1f4tQ8/nbcp/ah3ri+vcQFaBCFAL78fvHJQGLw6sH1tLXaNNXp+UHJn6dBb
X-Received: by 2002:a05:6402:3509:: with SMTP id
 b9mr60813697edd.187.1634725220375; 
 Wed, 20 Oct 2021 03:20:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwObBB94UsPTaD0oYjPUbshve/3p0dsa5jv4zPSx+uecUmI0Ceka5k4Ns06ihgQVVv033Q0PQ==
X-Received: by 2002:a05:6402:3509:: with SMTP id
 b9mr60813667edd.187.1634725220155; 
 Wed, 20 Oct 2021 03:20:20 -0700 (PDT)
Received: from redhat.com ([2.55.24.172])
 by smtp.gmail.com with ESMTPSA id w1sm415196edd.17.2021.10.20.03.20.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Oct 2021 03:20:19 -0700 (PDT)
Date: Wed, 20 Oct 2021 06:20:17 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 23/44] vhost-user-rng-pci: Add vhost-user-rng-pci
 implementation
Message-ID: <20211020101844.988480-24-mst@redhat.com>
References: <20211020101844.988480-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211020101844.988480-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Mathieu Poirier <mathieu.poirier@linaro.org>

This patch provides a PCI bus interface to the vhost-user-rng backend.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Message-Id: <20211012205904.4106769-3-mathieu.poirier@linaro.org>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/virtio/vhost-user-rng-pci.c | 79 ++++++++++++++++++++++++++++++++++
 hw/virtio/meson.build          |  1 +
 2 files changed, 80 insertions(+)
 create mode 100644 hw/virtio/vhost-user-rng-pci.c

diff --git a/hw/virtio/vhost-user-rng-pci.c b/hw/virtio/vhost-user-rng-pci.c
new file mode 100644
index 0000000000..c83dc86813
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
diff --git a/hw/virtio/meson.build b/hw/virtio/meson.build
index ae6b2cde10..521f7d64a8 100644
--- a/hw/virtio/meson.build
+++ b/hw/virtio/meson.build
@@ -28,6 +28,7 @@ virtio_ss.add(when: 'CONFIG_VIRTIO_MEM', if_true: files('virtio-mem.c'))
 virtio_ss.add(when: 'CONFIG_VHOST_USER_I2C', if_true: files('vhost-user-i2c.c'))
 virtio_ss.add(when: ['CONFIG_VIRTIO_PCI', 'CONFIG_VHOST_USER_I2C'], if_true: files('vhost-user-i2c-pci.c'))
 virtio_ss.add(when: 'CONFIG_VHOST_USER_RNG', if_true: files('vhost-user-rng.c'))
+virtio_ss.add(when: ['CONFIG_VHOST_USER_RNG', 'CONFIG_VIRTIO_PCI'], if_true: files('vhost-user-rng-pci.c'))
 
 virtio_pci_ss = ss.source_set()
 virtio_pci_ss.add(when: 'CONFIG_VHOST_VSOCK', if_true: files('vhost-vsock-pci.c'))
-- 
MST


