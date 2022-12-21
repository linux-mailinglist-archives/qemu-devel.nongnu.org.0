Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E34F365319B
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 14:24:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7ymn-0005IE-0x; Wed, 21 Dec 2022 08:05:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1p7ymg-0005G4-4w
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 08:05:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1p7yme-0004Ca-0w
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 08:05:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671627918;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+fJFy+bG2kFVCmcNoUDubLovIvAzDrzBEyx+UgjT1oY=;
 b=WxVfxNA0JOhB9Jlsb2Wns62taaMaKgZ16KICfV0ojodQ3BzCf6GyTspUGrmfAkgwFDJKcx
 xc3Xmr1rhylM034MGrire7fdLyJ3hW9CpQQ7i3OSL6eVyi76Pp27TYYn3t/QJfPPVD94gB
 Q/5vyx5dvoRG/edeDyKSm8EQMYJsRGI=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-247-BuxJMrHfO6aU78ev_cRRdg-1; Wed, 21 Dec 2022 08:05:02 -0500
X-MC-Unique: BuxJMrHfO6aU78ev_cRRdg-1
Received: by mail-wm1-f71.google.com with SMTP id
 h64-20020a1c2143000000b003d65ff910e1so927563wmh.2
 for <qemu-devel@nongnu.org>; Wed, 21 Dec 2022 05:05:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+fJFy+bG2kFVCmcNoUDubLovIvAzDrzBEyx+UgjT1oY=;
 b=wpkCRRHHUJqI2dl9pVuASNOS6aqOx55eI1Vd/aQxL+u/ECsxJmw/w/v+vo7hdjnEBJ
 WtrrLvdkvc0LIa+wg/G4MOH3RvMdlD/DS+9qlXXqVHicoplctdz3S6f2oFRZK4jLeSCK
 RLlZY5FNoFolMOJ1vDcB+HMhyAq3298lbb2txFQyC2BZ/9DBe6sDgrxGgIt2jMFKH8/1
 V/lUS41vfFGRMIQLjKRpgRrTfZm9+papongqHCBZrOPPIq72g1htLKVy9xkUlrtP56UQ
 eruKRhu5flaGOY8hUNQQjkONsvW+U/fnJzm5iNL/cXDVagm0oAmulft25wasI5z+icTr
 /VOQ==
X-Gm-Message-State: AFqh2krV99OR1t+me0g0mAUW8nM/VyL6LQQIJyVZB+9W8egnIBw60wTF
 TuupF1tnyIgRQW/JWZrP8aN9vLksf7S5mrUF0jimKc7LVHAiQQ5OA+7Rppic8r8jqDP90WhawUD
 YeUl0ffgCkUbtemvSzUOSZJrxWSW7czLK4dj5/wdFoxU/ytpYhEssbuvGMIHZ
X-Received: by 2002:a05:600c:22d4:b0:3cf:82b9:2fe6 with SMTP id
 20-20020a05600c22d400b003cf82b92fe6mr1912441wmg.8.1671627900699; 
 Wed, 21 Dec 2022 05:05:00 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtXQUag+a3wdgdUotlJsUOAc/JtL587YYYNl39oxmgYjyopmBHY/quy55SawbN8p0EgRDfyGA==
X-Received: by 2002:a05:600c:22d4:b0:3cf:82b9:2fe6 with SMTP id
 20-20020a05600c22d400b003cf82b92fe6mr1912419wmg.8.1671627900401; 
 Wed, 21 Dec 2022 05:05:00 -0800 (PST)
Received: from redhat.com ([2.52.8.61]) by smtp.gmail.com with ESMTPSA id
 p19-20020a1c5453000000b003d2157627a8sm2157430wmi.47.2022.12.21.05.04.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Dec 2022 05:04:59 -0800 (PST)
Date: Wed, 21 Dec 2022 08:04:56 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Longpeng <longpeng2@huawei.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PULL 10/41] vdpa: add vdpa-dev-pci support
Message-ID: <20221221130339.1234592-11-mst@redhat.com>
References: <20221221130339.1234592-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221221130339.1234592-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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

From: Longpeng <longpeng2@huawei.com>

Supports vdpa-dev-pci, we can use the device as follow:

-device vhost-vdpa-device-pci,vhostdev=/dev/vhost-vdpa-X

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
Acked-by: Jason Wang <jasowang@redhat.com>
Signed-off-by: Longpeng <longpeng2@huawei.com>
Message-Id: <20221215134944.2809-4-longpeng2@huawei.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/virtio/vdpa-dev-pci.c | 102 +++++++++++++++++++++++++++++++++++++++
 hw/virtio/meson.build    |   1 +
 2 files changed, 103 insertions(+)
 create mode 100644 hw/virtio/vdpa-dev-pci.c

diff --git a/hw/virtio/vdpa-dev-pci.c b/hw/virtio/vdpa-dev-pci.c
new file mode 100644
index 0000000000..5446e6b393
--- /dev/null
+++ b/hw/virtio/vdpa-dev-pci.c
@@ -0,0 +1,102 @@
+/*
+ * Vhost Vdpa Device PCI Bindings
+ *
+ * Copyright (c) Huawei Technologies Co., Ltd. 2022. All Rights Reserved.
+ *
+ * Authors:
+ *   Longpeng <longpeng2@huawei.com>
+ *
+ * Largely based on the "vhost-user-blk-pci.c" and "vhost-user-blk.c"
+ * implemented by:
+ *   Changpeng Liu <changpeng.liu@intel.com>
+ *
+ * This work is licensed under the terms of the GNU LGPL, version 2 or later.
+ * See the COPYING.LIB file in the top-level directory.
+ */
+#include "qemu/osdep.h"
+#include <sys/ioctl.h>
+#include <linux/vhost.h>
+#include "hw/virtio/virtio.h"
+#include "hw/virtio/vdpa-dev.h"
+#include "hw/pci/pci.h"
+#include "hw/qdev-properties.h"
+#include "qapi/error.h"
+#include "qemu/error-report.h"
+#include "qemu/module.h"
+#include "hw/virtio/virtio-pci.h"
+#include "qom/object.h"
+
+
+typedef struct VhostVdpaDevicePCI VhostVdpaDevicePCI;
+
+#define TYPE_VHOST_VDPA_DEVICE_PCI "vhost-vdpa-device-pci-base"
+DECLARE_INSTANCE_CHECKER(VhostVdpaDevicePCI, VHOST_VDPA_DEVICE_PCI,
+                         TYPE_VHOST_VDPA_DEVICE_PCI)
+
+struct VhostVdpaDevicePCI {
+    VirtIOPCIProxy parent_obj;
+    VhostVdpaDevice vdev;
+};
+
+static void vhost_vdpa_device_pci_instance_init(Object *obj)
+{
+    VhostVdpaDevicePCI *dev = VHOST_VDPA_DEVICE_PCI(obj);
+
+    virtio_instance_init_common(obj, &dev->vdev, sizeof(dev->vdev),
+                                TYPE_VHOST_VDPA_DEVICE);
+    object_property_add_alias(obj, "bootindex", OBJECT(&dev->vdev),
+                              "bootindex");
+}
+
+static Property vhost_vdpa_device_pci_properties[] = {
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static int vhost_vdpa_device_pci_post_init(VhostVdpaDevice *v, Error **errp)
+{
+    VhostVdpaDevicePCI *dev = container_of(v, VhostVdpaDevicePCI, vdev);
+    VirtIOPCIProxy *vpci_dev = &dev->parent_obj;
+
+    vpci_dev->class_code = virtio_pci_get_class_id(v->vdev_id);
+    vpci_dev->trans_devid = virtio_pci_get_trans_devid(v->vdev_id);
+    /* one for config vector */
+    vpci_dev->nvectors = v->num_queues + 1;
+
+    return 0;
+}
+
+static void
+vhost_vdpa_device_pci_realize(VirtIOPCIProxy *vpci_dev, Error **errp)
+{
+    VhostVdpaDevicePCI *dev = VHOST_VDPA_DEVICE_PCI(vpci_dev);
+
+    dev->vdev.post_init = vhost_vdpa_device_pci_post_init;
+    qdev_realize(DEVICE(&dev->vdev), BUS(&vpci_dev->bus), errp);
+}
+
+static void vhost_vdpa_device_pci_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    VirtioPCIClass *k = VIRTIO_PCI_CLASS(klass);
+
+    set_bit(DEVICE_CATEGORY_MISC, dc->categories);
+    device_class_set_props(dc, vhost_vdpa_device_pci_properties);
+    k->realize = vhost_vdpa_device_pci_realize;
+}
+
+static const VirtioPCIDeviceTypeInfo vhost_vdpa_device_pci_info = {
+    .base_name               = TYPE_VHOST_VDPA_DEVICE_PCI,
+    .generic_name            = "vhost-vdpa-device-pci",
+    .transitional_name       = "vhost-vdpa-device-pci-transitional",
+    .non_transitional_name   = "vhost-vdpa-device-pci-non-transitional",
+    .instance_size  = sizeof(VhostVdpaDevicePCI),
+    .instance_init  = vhost_vdpa_device_pci_instance_init,
+    .class_init     = vhost_vdpa_device_pci_class_init,
+};
+
+static void vhost_vdpa_device_pci_register(void)
+{
+    virtio_pci_types_register(&vhost_vdpa_device_pci_info);
+}
+
+type_init(vhost_vdpa_device_pci_register);
diff --git a/hw/virtio/meson.build b/hw/virtio/meson.build
index 54d6d29af7..559b80cb28 100644
--- a/hw/virtio/meson.build
+++ b/hw/virtio/meson.build
@@ -57,6 +57,7 @@ virtio_pci_ss.add(when: 'CONFIG_VIRTIO_SERIAL', if_true: files('virtio-serial-pc
 virtio_pci_ss.add(when: 'CONFIG_VIRTIO_PMEM', if_true: files('virtio-pmem-pci.c'))
 virtio_pci_ss.add(when: 'CONFIG_VIRTIO_IOMMU', if_true: files('virtio-iommu-pci.c'))
 virtio_pci_ss.add(when: 'CONFIG_VIRTIO_MEM', if_true: files('virtio-mem-pci.c'))
+virtio_pci_ss.add(when: 'CONFIG_VHOST_VDPA_DEV', if_true: files('vdpa-dev-pci.c'))
 
 virtio_ss.add_all(when: 'CONFIG_VIRTIO_PCI', if_true: virtio_pci_ss)
 
-- 
MST


