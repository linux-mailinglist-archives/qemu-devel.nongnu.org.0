Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A4D66E695B
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Apr 2023 18:23:20 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1poo5b-0006pQ-Ii; Tue, 18 Apr 2023 12:21:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1poo5a-0006pE-37
 for qemu-devel@nongnu.org; Tue, 18 Apr 2023 12:21:54 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1poo5S-0001BU-T6
 for qemu-devel@nongnu.org; Tue, 18 Apr 2023 12:21:53 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-3f178da21b2so8517035e9.1
 for <qemu-devel@nongnu.org>; Tue, 18 Apr 2023 09:21:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681834905; x=1684426905;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eC5A3sVizk95geXn4I1Vdcti4PHMTBsSCbklkuaCJpg=;
 b=xX9KuWORBVoBfQaDp//Zj0pCE5vi9R8pcHOLPKEJQIUMXddEwHNwZq084NqimIeyhB
 HuFcJaY/AtdyL1kOOyxH198nMH9K/P/HP+qmddQwx85LZzJujl3jUeF9M2i01toKnPT8
 paS0v4aJQ/co9mcaY2FT4MJPfGtPthzwnL17/d/BXS1xRsDrnexwQ0n48m4ZZWKatO63
 AduMP3Hpmv2mrlGVvfagKIKaM995d/8qGx7v4PeV9l5dgCktjjW0W78lYWdCS+kcRWPu
 cqJ/synPvQ2RAMUPgUELdkVLjjoM+T3VuKmdANkLxsUcqdV7e2cASOlr47p1Tu5O0oXd
 110w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681834905; x=1684426905;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eC5A3sVizk95geXn4I1Vdcti4PHMTBsSCbklkuaCJpg=;
 b=jWK8vEjXZXGv8OgO51PvJH3MUYAOVxT6NgROVmHc3FfVkgNixnbdS6wFmQfFdx4Twn
 AztN/HQ4GMXFYrXC9uRU3x95t5gwmgAooUIr9kvBHqZ79dz3NPZfDqcdr1z5uIXV1lLe
 3K4PhVj66eGsz0Go+/0G8Hyuvn5IYfa9+Uy2JRb9d0/q2sTYgbeZmPdV2sZxmaoqcbtm
 E1FIpKWQGxUkf5vpuMN3XRRK3BU9Gv8sJVnip5fxF5SjmmKSTzw7nXKeRH3r/trAa/ET
 n2X0YNrwiUGmlLGtT/wOwm6RGE34ZkKXEVqyTLAy+OSaze73+6i31QJFTDj/vtJj/5Kw
 LbHw==
X-Gm-Message-State: AAQBX9dj4UC+lUsdx5FBWdK/N0YHv2j2Bck+2x9ajZtZr+Aodd6Go6Y6
 TMqbOSPXmNr4Zt4Crek2SxLi6g==
X-Google-Smtp-Source: AKy350Y3EkGcFH4MgJreFztMUeROhPvCrndmp97Mj0E9HSXHOgeUS78r6WLfkzhOMeNnwf76Si/XvQ==
X-Received: by 2002:adf:d0c2:0:b0:2f2:86cd:3e11 with SMTP id
 z2-20020adfd0c2000000b002f286cd3e11mr2405489wrh.36.1681834905522; 
 Tue, 18 Apr 2023 09:21:45 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 e2-20020a5d65c2000000b002ceacff44c7sm13404133wrw.83.2023.04.18.09.21.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Apr 2023 09:21:43 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 09CE81FFB8;
 Tue, 18 Apr 2023 17:21:41 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Markus Armbruster <armbru@redhat.com>,
 Erik Schilling <erik.schilling@linaro.org>,
 Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Gerd Hoffmann <kraxel@redhat.com>, virtio-fs@redhat.com,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Eric Blake <eblake@redhat.com>
Subject: [PATCH v2 08/13] virtio: add PCI stub for vhost-user-device
Date: Tue, 18 Apr 2023 17:21:35 +0100
Message-Id: <20230418162140.373219-9-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230418162140.373219-1-alex.bennee@linaro.org>
References: <20230418162140.373219-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32a.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This is all pretty much boilerplate.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Tested-by: Erik Schilling <erik.schilling@linaro.org>
---
 hw/virtio/vhost-user-device-pci.c | 71 +++++++++++++++++++++++++++++++
 hw/virtio/meson.build             |  1 +
 2 files changed, 72 insertions(+)
 create mode 100644 hw/virtio/vhost-user-device-pci.c

diff --git a/hw/virtio/vhost-user-device-pci.c b/hw/virtio/vhost-user-device-pci.c
new file mode 100644
index 0000000000..41f9b7905b
--- /dev/null
+++ b/hw/virtio/vhost-user-device-pci.c
@@ -0,0 +1,71 @@
+/*
+ * Vhost-user generic virtio device PCI glue
+ *
+ * Copyright (c) 2023 Linaro Ltd
+ * Author: Alex Bennée <alex.bennee@linaro.org>
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "qemu/osdep.h"
+#include "hw/qdev-properties.h"
+#include "hw/virtio/vhost-user-device.h"
+#include "hw/virtio/virtio-pci.h"
+
+struct VHostUserDevicePCI {
+    VirtIOPCIProxy parent_obj;
+    VHostUserBase vub;
+};
+
+typedef struct VHostUserDevicePCI VHostUserDevicePCI;
+
+#define TYPE_VHOST_USER_DEVICE_PCI "vhost-user-device-pci-base"
+
+DECLARE_INSTANCE_CHECKER(VHostUserDevicePCI,
+                         VHOST_USER_DEVICE_PCI,
+                         TYPE_VHOST_USER_DEVICE_PCI)
+
+static void vhost_user_device_pci_realize(VirtIOPCIProxy *vpci_dev, Error **errp)
+{
+    VHostUserDevicePCI *dev = VHOST_USER_DEVICE_PCI(vpci_dev);
+    DeviceState *vdev = DEVICE(&dev->vub);
+
+    vpci_dev->nvectors = 1;
+    qdev_realize(vdev, BUS(&vpci_dev->bus), errp);
+}
+
+static void vhost_user_device_pci_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    VirtioPCIClass *k = VIRTIO_PCI_CLASS(klass);
+    PCIDeviceClass *pcidev_k = PCI_DEVICE_CLASS(klass);
+    k->realize = vhost_user_device_pci_realize;
+    set_bit(DEVICE_CATEGORY_INPUT, dc->categories);
+    pcidev_k->vendor_id = PCI_VENDOR_ID_REDHAT_QUMRANET;
+    pcidev_k->device_id = 0; /* Set by virtio-pci based on virtio id */
+    pcidev_k->revision = 0x00;
+    pcidev_k->class_id = PCI_CLASS_COMMUNICATION_OTHER;
+}
+
+static void vhost_user_device_pci_instance_init(Object *obj)
+{
+    VHostUserDevicePCI *dev = VHOST_USER_DEVICE_PCI(obj);
+
+    virtio_instance_init_common(obj, &dev->vub, sizeof(dev->vub),
+                                TYPE_VHOST_USER_DEVICE);
+}
+
+static const VirtioPCIDeviceTypeInfo vhost_user_device_pci_info = {
+    .base_name = TYPE_VHOST_USER_DEVICE_PCI,
+    .non_transitional_name = "vhost-user-device-pci",
+    .instance_size = sizeof(VHostUserDevicePCI),
+    .instance_init = vhost_user_device_pci_instance_init,
+    .class_init = vhost_user_device_pci_class_init,
+};
+
+static void vhost_user_device_pci_register(void)
+{
+    virtio_pci_types_register(&vhost_user_device_pci_info);
+}
+
+type_init(vhost_user_device_pci_register);
diff --git a/hw/virtio/meson.build b/hw/virtio/meson.build
index 43e5fa3f7d..c0a86b94ae 100644
--- a/hw/virtio/meson.build
+++ b/hw/virtio/meson.build
@@ -13,6 +13,7 @@ if have_vhost
     # fixme - this really should be generic
     specific_virtio_ss.add(files('vhost-user.c'))
     softmmu_virtio_ss.add(files('vhost-user-device.c'))
+    softmmu_virtio_ss.add(when: 'CONFIG_VIRTIO_PCI', if_true: files('vhost-user-device-pci.c'))
   endif
   if have_vhost_vdpa
     specific_virtio_ss.add(files('vhost-vdpa.c', 'vhost-shadow-virtqueue.c'))
-- 
2.39.2


