Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B17274B3065
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Feb 2022 23:26:30 +0100 (CET)
Received: from localhost ([::1]:55628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIeN3-0002Dn-KP
	for lists+qemu-devel@lfdr.de; Fri, 11 Feb 2022 17:26:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chouhan.shreyansh2702@gmail.com>)
 id 1nIeC2-00059f-9G
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 17:15:06 -0500
Received: from [2607:f8b0:4864:20::634] (port=40944
 helo=mail-pl1-x634.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <chouhan.shreyansh2702@gmail.com>)
 id 1nIeC0-0002qy-A4
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 17:15:05 -0500
Received: by mail-pl1-x634.google.com with SMTP id y17so5737839plg.7
 for <qemu-devel@nongnu.org>; Fri, 11 Feb 2022 14:15:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aGClOHN7GG+aZ6hxDiFXoXxNY0G3eZiRVwIAS9Xw/V4=;
 b=AQbbcwemFY6b4SJb4um9B+5UYVWnAdhCmZrgLfMDP07m3dDnIb8XKi8qsCUSMrsGSq
 FSgpF/B46C/ZDClxfUaQopDxQ7H6ZVq0TgiQDhHB+zDfylknngnVKN0BjR4FVyXsgCG5
 1KvrYDUlbeonJLg7uHi5v2f9TJkZTGURlE4V+zPchPFHpJsS4ZJ4fpvFudbyZLfa4w65
 lPdnTTi1rJLgx84ljvk8m+/vrobFZs8U6W9MvnJdKFG2wMaX6Bo877pjiVuOjglJ6Apo
 CEYSvXhBpHolvmSnfSL42tIexd5eQ1Krz5QBNowJfGbjNISn5knX448hTrV9Wfto06q2
 1sSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aGClOHN7GG+aZ6hxDiFXoXxNY0G3eZiRVwIAS9Xw/V4=;
 b=IAIBGTKTeXGiI8/+7xa10eSvpPPGU1H/25XqvAaVG1v3VCa5begHQ+6VLpAH1SwVwO
 Vwr75ZIIqh12nwaxZAYM1RI8ejjBdxFPlcWoWlhKN/ut3nfhEbLVZY6JOZm/avuGJNT0
 jWhc6+f1JdahXTsNeGKoLgapY84zFTA2L1kyYh108QFH7fTUlBl9iVBeKizzEZoRHL2s
 GRgi6ioalIckvRAcN6E197apXE/hO2IjMn0Xvr4aTXuUA/plwJfpNb0iXHbHzhK2qy18
 hibraCzry7F7gQsRsuzPLyFrkO/dk9EOfa2CfZIws+AZZCw3136zrCti4P2EQ2WsxEhw
 ntOA==
X-Gm-Message-State: AOAM532kjHjB9d0jCleaoYHOCubvcPTxaFotk3KhL0taQ2pSg0uraEpX
 YQwjUS3GduM5frLu9kxD43s=
X-Google-Smtp-Source: ABdhPJxOX+CfgpuIXMquAdI7MbOZFqMyTJBP+Q3akV4FxoVJPi3et++6kF/1uKZYoR/aA7qmVYJEKQ==
X-Received: by 2002:a17:90a:1a54:: with SMTP id
 20mr2500254pjl.232.1644617703021; 
 Fri, 11 Feb 2022 14:15:03 -0800 (PST)
Received: from fedora.. ([2405:201:6008:6f15:d26f:133e:cd11:90dd])
 by smtp.googlemail.com with ESMTPSA id j23sm20623576pgb.75.2022.02.11.14.14.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Feb 2022 14:15:02 -0800 (PST)
From: Shreyansh Chouhan <chouhan.shreyansh2702@gmail.com>
To: kraxel@redhat.com,
	mst@redhat.com,
	laurent@vivier.eu
Subject: [RFC PATCH 06/25] virtio-snd: Add PCI wrapper code for VirtIOSound
Date: Sat, 12 Feb 2022 03:43:00 +0530
Message-Id: <20220211221319.193404-7-chouhan.shreyansh2702@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210429120445.694420-1-chouhan.shreyansh2702@gmail.com>
References: <20210429120445.694420-1-chouhan.shreyansh2702@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::634
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=chouhan.shreyansh2702@gmail.com; helo=mail-pl1-x634.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
index 521f7d64a8..86d6594c20 100644
--- a/hw/virtio/meson.build
+++ b/hw/virtio/meson.build
@@ -49,6 +49,7 @@ virtio_pci_ss.add(when: 'CONFIG_VIRTIO_SERIAL', if_true: files('virtio-serial-pc
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
2.31.1


