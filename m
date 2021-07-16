Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 344B93CB989
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Jul 2021 17:18:10 +0200 (CEST)
Received: from localhost ([::1]:53856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4PbN-0005Bd-9e
	for lists+qemu-devel@lfdr.de; Fri, 16 Jul 2021 11:18:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1m4PYl-00013N-R8
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 11:15:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38780)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1m4PYj-00042g-Fu
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 11:15:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626448524;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=L7iObvtBFmPk0+FN/s4T6VgVW41+HOKgYbVN1kxGfA8=;
 b=fyiJmYIxpyKXk2TAE7paFHn8gzbkunsbF/24kl1oP1HctLgvXIMpEas/0aJm+2/RNVr6ws
 g2Va2TLQJJRkxD0bfMDW1RoLbb1Sk+azJ0j0ibm2wjB7bnZmUIxRSFU4EE+X7FPN9ZE+kO
 Zmsx/CKsL8uaSxgDTkcCa7WJYZcFVSY=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-537-K0SvUndhNsCGm0qwg6GqTg-1; Fri, 16 Jul 2021 11:15:23 -0400
X-MC-Unique: K0SvUndhNsCGm0qwg6GqTg-1
Received: by mail-wr1-f70.google.com with SMTP id
 m9-20020a5d4a090000b029013e2b4a9d1eso4967377wrq.4
 for <qemu-devel@nongnu.org>; Fri, 16 Jul 2021 08:15:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=L7iObvtBFmPk0+FN/s4T6VgVW41+HOKgYbVN1kxGfA8=;
 b=atSTJRZiz3WDnG6GRqcEjugOlM3c6DOqsSHcY65YUNgty6KIXpdGZkWHo6V+W8LB7F
 4T2QiKXlOpRn7Gyx0LK+MF7rjH6clz9l/sfYF90GUjUAz++D5WIJhjEk4BScVnh2zdGE
 XH6p4wFeFnFqIj3zeJEpKi+wkvxSnHAkKBF0/jpm0TrrW//jlyV7qyAlRsA3qaSML5IR
 76hpd9xElUNujC5dHDRGV/DZUTNFM0ZFLR9YWP0XtiWeq7w5j//j79ctm+7M4Ttru1dR
 xtJ9KTNVHSYvRaXJoram+HsoSvd0kWuHUDnE+IH12pN/+31uc6P8SAnzAiESwsy74OUG
 tAZA==
X-Gm-Message-State: AOAM5307imHtOFF2gAr3TnmvtexVSjV65ldqz0rHBRwMDpt4s/J3TS1b
 04JHL+ynVcKRuy1nLW7vdw6Xd8UVgPVZ6eeYYDXTmkAg2oc8hvhqxe1JEr5PcZaabuOzam2FEHR
 hg3DBRYMBtadsMEkmsLP447DXkRM4jC59HjZTEU1fH7H7vJ1ozcBNBJguYNtk
X-Received: by 2002:a1c:741a:: with SMTP id p26mr11153016wmc.47.1626448522080; 
 Fri, 16 Jul 2021 08:15:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyhTVNyymByhSQRKOzh8dPwxIMNmTIHzlv0awm0hRLmndHotZOL5KmVdFt3M0+nIifvaZcSJw==
X-Received: by 2002:a1c:741a:: with SMTP id p26mr11152988wmc.47.1626448521790; 
 Fri, 16 Jul 2021 08:15:21 -0700 (PDT)
Received: from redhat.com ([2a10:8004:6ff2:0:a1b1:b3d8:4c4e:4825])
 by smtp.gmail.com with ESMTPSA id y19sm11329116wma.21.2021.07.16.08.15.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Jul 2021 08:15:21 -0700 (PDT)
Date: Fri, 16 Jul 2021 11:15:19 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v3 08/19] hw/virtio: add vhost-user-i2c-pci boilerplate
Message-ID: <20210716151416.155127-9-mst@redhat.com>
References: <20210716151416.155127-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210716151416.155127-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Viresh Kumar <viresh.kumar@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Viresh Kumar <viresh.kumar@linaro.org>

This allows is to instantiate a vhost-user-i2c device as part of a PCI
bus. It is mostly boilerplate which looks pretty similar to the
vhost-user-fs-pci device.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
Message-Id: <8a083eaa57d93feaab12acd1f94b225879212f20.1625806763.git.viresh.kumar@linaro.org>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/virtio/vhost-user-i2c-pci.c | 69 ++++++++++++++++++++++++++++++++++
 hw/virtio/meson.build          |  1 +
 2 files changed, 70 insertions(+)
 create mode 100644 hw/virtio/vhost-user-i2c-pci.c

diff --git a/hw/virtio/vhost-user-i2c-pci.c b/hw/virtio/vhost-user-i2c-pci.c
new file mode 100644
index 0000000000..70b7b65fd9
--- /dev/null
+++ b/hw/virtio/vhost-user-i2c-pci.c
@@ -0,0 +1,69 @@
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
+static void vhost_user_i2c_pci_realize(VirtIOPCIProxy *vpci_dev, Error **errp)
+{
+    VHostUserI2CPCI *dev = VHOST_USER_I2C_PCI(vpci_dev);
+    DeviceState *vdev = DEVICE(&dev->vdev);
+
+    vpci_dev->nvectors = 1;
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
diff --git a/hw/virtio/meson.build b/hw/virtio/meson.build
index 1a0d736a0d..bc352a6009 100644
--- a/hw/virtio/meson.build
+++ b/hw/virtio/meson.build
@@ -26,6 +26,7 @@ virtio_ss.add(when: 'CONFIG_VIRTIO_RNG', if_true: files('virtio-rng.c'))
 virtio_ss.add(when: 'CONFIG_VIRTIO_IOMMU', if_true: files('virtio-iommu.c'))
 virtio_ss.add(when: 'CONFIG_VIRTIO_MEM', if_true: files('virtio-mem.c'))
 virtio_ss.add(when: 'CONFIG_VHOST_USER_I2C', if_true: files('vhost-user-i2c.c'))
+virtio_ss.add(when: ['CONFIG_VIRTIO_PCI', 'CONFIG_VHOST_USER_I2C'], if_true: files('vhost-user-i2c-pci.c'))
 
 virtio_pci_ss = ss.source_set()
 virtio_pci_ss.add(when: 'CONFIG_VHOST_VSOCK', if_true: files('vhost-vsock-pci.c'))
-- 
MST


