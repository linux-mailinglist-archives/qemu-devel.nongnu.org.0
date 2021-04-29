Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B78D36EA25
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Apr 2021 14:14:33 +0200 (CEST)
Received: from localhost ([::1]:43308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lc5Yu-0004dJ-DK
	for lists+qemu-devel@lfdr.de; Thu, 29 Apr 2021 08:14:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chouhan.shreyansh2702@gmail.com>)
 id 1lc5QX-0007ml-Ts
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 08:05:54 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:34362)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <chouhan.shreyansh2702@gmail.com>)
 id 1lc5QR-0000QG-Ah
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 08:05:53 -0400
Received: by mail-pf1-x42f.google.com with SMTP id 10so3396275pfl.1
 for <qemu-devel@nongnu.org>; Thu, 29 Apr 2021 05:05:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=q8CG3MTdO9ZS49CdlyZtKiyCmiwxPeoJ30Onwv+zoQs=;
 b=FHe0ARuDhEckZVSdL49r+pbP3MP+NlU91HUcfWEoIdPBEHN7sOYoz6PD88sE7Q9Jys
 VBjFblY0mnryoJmLg0lOOMp2+wKD2xV21VdWnZZTckDTR4Pwcjye9tlLyE+ZUNWpe9Oq
 1BJWASdoQ2nRJta6ZQV20tbs3y5PjvFH6I4nAHqKJ0EI34/DEr2UbL0Zs2A1bc+wBFcQ
 EUmRoU707odW+4WJVM7Qckue6tfZ+LGslmiOkJW+v9z/ELMZ0sBbfFvTJeSNqDw8leOd
 KK74SbA9xQJoqXIp6D2excOaNcygbBjt7DGDmCZc0s7TevwTkIt2+Q6wDiuD0bAVPBm2
 y5Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=q8CG3MTdO9ZS49CdlyZtKiyCmiwxPeoJ30Onwv+zoQs=;
 b=H4A67rFEDNjzQlo/K9sIf17JN5isLyxeOkF0LT+lVmQ/uLx+6r+22ijtaARkuYPl0z
 aUZUNBBkY7vcztaDitoYz8CEpsQRUgzZCcok0l9oBJKpQQO2dwMamrKyNqpov+vQud0w
 4Wp99QvAUthtSpiHryKMVJX5YCPFIIbZcUrl3cD6HhWkGiRsIsSms0IiAejfzEt106Vd
 RMGpaieaX+Gt33sQ5HXrF5lwC0nIdUaIp8pc4V0KWpX1EBIa71soeQonAcYJdLyu4Wje
 Ji+shLVuCXS9+WEjp72fyuA+SXKUpTXtmbEMHBlYAfV1CU5z92AkaUQkrgpT+lRjL6DK
 PiOQ==
X-Gm-Message-State: AOAM532UrOHb0M5OGzKpcsUlKMeliR4cO7Sm+mIgSUPBpwbVYE/2sWmE
 YpbBli7v/ohGKp52fosiXKw=
X-Google-Smtp-Source: ABdhPJxIUuWkrqJB5DYEMYHGQPMGtL/y6yhi9gltXsFaw190mJok5GcEvoK2TuUsaaSzJ8g+nPREDA==
X-Received: by 2002:a63:5562:: with SMTP id f34mr31964247pgm.391.1619697945950; 
 Thu, 29 Apr 2021 05:05:45 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:6008:61b4:c0b1:be0f:608e:9a45])
 by smtp.gmail.com with ESMTPSA id p6sm713643pjg.35.2021.04.29.05.05.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Apr 2021 05:05:45 -0700 (PDT)
From: Shreyansh Chouhan <chouhan.shreyansh2702@gmail.com>
To: kraxel@redhat.com,
	mst@redhat.com
Subject: [RFC PATCH 06/27] virtio-snd: Add PCI wrapper code for VirtIOSound
Date: Thu, 29 Apr 2021 17:34:24 +0530
Message-Id: <20210429120445.694420-7-chouhan.shreyansh2702@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210429120445.694420-1-chouhan.shreyansh2702@gmail.com>
References: <20210429120445.694420-1-chouhan.shreyansh2702@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=chouhan.shreyansh2702@gmail.com; helo=mail-pf1-x42f.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Cc: Shreyansh Chouhan <chouhan.shreyansh2702@gmail.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Added the virito-snd.c file which contains a wrapper
for combining the device with the VirtIOPCIProxy.

Signed-off-by: Shreyansh Chouhan <chouhan.shreyansh2702@gmail.com>
---
 hw/virtio/meson.build      |  1 +
 hw/virtio/virtio-snd-pci.c | 72 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 73 insertions(+)
 create mode 100644 hw/virtio/virtio-snd-pci.c

diff --git a/hw/virtio/meson.build b/hw/virtio/meson.build
index fbff9bc9d4..a4593f7631 100644
--- a/hw/virtio/meson.build
+++ b/hw/virtio/meson.build
@@ -45,6 +45,7 @@ virtio_pci_ss.add(when: 'CONFIG_VIRTIO_SERIAL', if_true: files('virtio-serial-pc
 virtio_pci_ss.add(when: 'CONFIG_VIRTIO_PMEM', if_true: files('virtio-pmem-pci.c'))
 virtio_pci_ss.add(when: 'CONFIG_VIRTIO_IOMMU', if_true: files('virtio-iommu-pci.c'))
 virtio_pci_ss.add(when: 'CONFIG_VIRTIO_MEM', if_true: files('virtio-mem-pci.c'))
+virtio_pci_ss.add(when: 'CONFIG_VIRTIO_SND', if_true: files('virtio-snd-pci.c'))
 
 virtio_ss.add_all(when: 'CONFIG_VIRTIO_PCI', if_true: virtio_pci_ss)
 
diff --git a/hw/virtio/virtio-snd-pci.c b/hw/virtio/virtio-snd-pci.c
new file mode 100644
index 0000000000..8d8e4ffa51
--- /dev/null
+++ b/hw/virtio/virtio-snd-pci.c
@@ -0,0 +1,72 @@
+/*
+ * Virtio sound PCI Bindings
+ */
+
+#include "qemu/osdep.h"
+#include "hw/virtio/virtio-snd.h"
+#include "hw/virtio/virtio-pci.h"
+#include "qapi/error.h"
+#include "qemu/module.h"
+#include "qom/object.h"
+
+typedef struct VirtIOSoundPCI VirtIOSoundPCI;
+
+/*
+ * virtio-snd-pci: This extends VirtioPCIProxy.
+ */
+#define TYPE_VIRTIO_SOUND_PCI "virtio-sound-pci-base"
+DECLARE_INSTANCE_CHECKER(VirtIOSoundPCI, VIRTIO_SOUND_PCI,
+                         TYPE_VIRTIO_SOUND_PCI)
+
+struct VirtIOSoundPCI {
+    VirtIOPCIProxy parent_obj;
+    VirtIOSound vdev;
+};
+
+static Property virtio_sound_properties[] = {
+    DEFINE_PROP_BIT("ioeventfd", VirtIOPCIProxy, flags,
+                    VIRTIO_PCI_FLAG_USE_IOEVENTFD_BIT, true),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void virtio_snd_pci_realize(VirtIOPCIProxy *vpci_dev, Error **errp)
+{
+    VirtIOSoundPCI *dev = VIRTIO_SOUND_PCI(vpci_dev);
+    DeviceState *vdev = DEVICE(&dev->vdev);
+
+    qdev_realize(vdev, BUS(&vpci_dev->bus), errp);
+}
+
+static void virtio_snd_pci_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
+    VirtioPCIClass *vpciklass = VIRTIO_PCI_CLASS(klass);
+
+    k->class_id = PCI_CLASS_MULTIMEDIA_AUDIO;
+    set_bit(DEVICE_CATEGORY_SOUND, dc->categories);
+    device_class_set_props(dc, virtio_sound_properties);
+    vpciklass->realize = virtio_snd_pci_realize;
+}
+
+static void virtio_snd_pci_instance_init(Object *obj)
+{
+    VirtIOSoundPCI *dev = VIRTIO_SOUND_PCI(obj);
+    virtio_instance_init_common(obj, &dev->vdev, sizeof(dev->vdev),
+                                TYPE_VIRTIO_SOUND);
+}
+
+static const VirtioPCIDeviceTypeInfo virtio_snd_pci_info = {
+    .base_name              = TYPE_VIRTIO_SOUND_PCI,
+    .generic_name           = "virtio-snd-pci",
+    .instance_size = sizeof(VirtIOSoundPCI),
+    .instance_init = virtio_snd_pci_instance_init,
+    .class_init    = virtio_snd_pci_class_init,
+};
+
+static void virtio_snd_pci_register(void)
+{
+    virtio_pci_types_register(&virtio_snd_pci_info);
+}
+
+type_init(virtio_snd_pci_register);
-- 
2.25.1


