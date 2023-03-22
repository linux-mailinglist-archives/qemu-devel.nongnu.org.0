Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F6EE6C4D7D
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Mar 2023 15:23:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pezLr-00084K-Li; Wed, 22 Mar 2023 10:22:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aesteve@redhat.com>)
 id 1pezLi-000819-Jv
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 10:21:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aesteve@redhat.com>)
 id 1pezLg-0007Jp-1V
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 10:21:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679494915;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lT1AatYzR6Bv0y6n+UEd84VWzqmG0+0xg1T4GGxISYs=;
 b=Ghx9Brt6zprjp6eD8u2aIQzw3DSpvF4S449ez2qGp0F4LeV3P1y1nlYCjnsZfCZrShieaQ
 0T8NRvvZXfPD6jyuKXNTZ0/xJQPiULGsXpMWtziEc+C0BF8Vfb9tp5n855BqdUwUBjwDMg
 umWXs3IJXvNMJ4ix+I9QiPLqiAqp8NQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-253-GKB3iiILOMye_EludEGPRA-1; Wed, 22 Mar 2023 10:21:54 -0400
X-MC-Unique: GKB3iiILOMye_EludEGPRA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D85A038173CB;
 Wed, 22 Mar 2023 14:21:53 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.45.226.254])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7DAA540C6E67;
 Wed, 22 Mar 2023 14:21:51 +0000 (UTC)
From: Albert Esteve <aesteve@redhat.com>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, fmartine@redhat.com,
 Gerd Hoffmann <kraxel@redhat.com>, eballetb@redhat.com,
 Albert Esteve <aesteve@redhat.com>, alex.bennee@linaro.org,
 Laurent Vivier <lvivier@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 sgarzare@redhat.com,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 peter.griffin@linaro.org, Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH 06/12] hw/display: add vhost-user-video-pci
Date: Wed, 22 Mar 2023 15:21:26 +0100
Message-Id: <20230322142132.22909-7-aesteve@redhat.com>
In-Reply-To: <20230322142132.22909-1-aesteve@redhat.com>
References: <20230322142132.22909-1-aesteve@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=aesteve@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Peter Griffin <peter.griffin@linaro.org>

Add boiler plate code for vhost-user-video-pci.

Example
-device vhost-user-video-pci,chardev=video,id=video
-chardev socket,path=video.sock,id=video

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
Message-Id: <20211209145601.331477-8-peter.griffin@linaro.org>
---
 hw/display/vhost-user-video-pci.c | 82 +++++++++++++++++++++++++++++++
 1 file changed, 82 insertions(+)
 create mode 100644 hw/display/vhost-user-video-pci.c

diff --git a/hw/display/vhost-user-video-pci.c b/hw/display/vhost-user-video-pci.c
new file mode 100644
index 0000000000..ceeaad2742
--- /dev/null
+++ b/hw/display/vhost-user-video-pci.c
@@ -0,0 +1,82 @@
+/*
+ * Vhost-user VIDEO virtio device PCI glue
+ *
+ * Copyright (c) 2021 Linaro Ltd
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "qemu/osdep.h"
+#include "hw/qdev-properties.h"
+#include "hw/virtio/vhost-user-video.h"
+#include "hw/virtio/virtio-pci.h"
+
+struct VHostUserVIDEOPCI {
+    VirtIOPCIProxy parent_obj;
+    VHostUserVIDEO vdev;
+};
+
+typedef struct VHostUserVIDEOPCI VHostUserVIDEOPCI;
+
+#define TYPE_VHOST_USER_VIDEO_PCI "vhost-user-video-pci-base"
+
+#define VHOST_USER_VIDEO_PCI(obj) \
+        OBJECT_CHECK(VHostUserVIDEOPCI, (obj), TYPE_VHOST_USER_VIDEO_PCI)
+
+static Property vuvideo_pci_properties[] = {
+    DEFINE_PROP_BIT("ioeventfd", VirtIOPCIProxy, flags,
+                    VIRTIO_PCI_FLAG_USE_IOEVENTFD_BIT, true),
+    DEFINE_PROP_UINT32("vectors", VirtIOPCIProxy, nvectors,
+                       DEV_NVECTORS_UNSPECIFIED),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void vuvideo_pci_realize(VirtIOPCIProxy *vpci_dev, Error **errp)
+{
+    VHostUserVIDEOPCI *dev = VHOST_USER_VIDEO_PCI(vpci_dev);
+    DeviceState *vdev = DEVICE(&dev->vdev);
+
+    if (vpci_dev->nvectors == DEV_NVECTORS_UNSPECIFIED) {
+        vpci_dev->nvectors = 1;
+    }
+
+    qdev_set_parent_bus(vdev, BUS(&vpci_dev->bus), errp);
+    object_property_set_bool(OBJECT(vdev), "realized", true, errp);
+}
+
+static void vuvideo_pci_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    VirtioPCIClass *k = VIRTIO_PCI_CLASS(klass);
+    PCIDeviceClass *pcidev_k = PCI_DEVICE_CLASS(klass);
+    k->realize = vuvideo_pci_realize;
+    set_bit(DEVICE_CATEGORY_STORAGE, dc->categories);
+    device_class_set_props(dc, vuvideo_pci_properties);
+    pcidev_k->vendor_id = PCI_VENDOR_ID_REDHAT_QUMRANET;
+    pcidev_k->device_id = 0; /* Set by virtio-pci based on virtio id */
+    pcidev_k->revision = 0x00;
+    pcidev_k->class_id = PCI_CLASS_STORAGE_OTHER;
+}
+
+static void vuvideo_pci_instance_init(Object *obj)
+{
+    VHostUserVIDEOPCI *dev = VHOST_USER_VIDEO_PCI(obj);
+
+    virtio_instance_init_common(obj, &dev->vdev, sizeof(dev->vdev),
+                                TYPE_VHOST_USER_VIDEO);
+}
+
+static const VirtioPCIDeviceTypeInfo vuvideo_pci_info = {
+    .base_name             = TYPE_VHOST_USER_VIDEO_PCI,
+    .non_transitional_name = "vhost-user-video-pci",
+    .instance_size = sizeof(VHostUserVIDEOPCI),
+    .instance_init = vuvideo_pci_instance_init,
+    .class_init    = vuvideo_pci_class_init,
+};
+
+static void vuvideo_pci_register(void)
+{
+    virtio_pci_types_register(&vuvideo_pci_info);
+}
+
+type_init(vuvideo_pci_register);
-- 
2.39.2


