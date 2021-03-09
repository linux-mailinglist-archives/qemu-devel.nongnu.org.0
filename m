Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F36E3330FE
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 22:37:16 +0100 (CET)
Received: from localhost ([::1]:36744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJk2V-00067s-Cn
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 16:37:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <osy86github@gmail.com>)
 id 1lJk0k-0004Sp-Rj
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 16:35:26 -0500
Received: from mail-pf1-f174.google.com ([209.85.210.174]:40642)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <osy86github@gmail.com>)
 id 1lJk0d-0005cZ-OD
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 16:35:22 -0500
Received: by mail-pf1-f174.google.com with SMTP id x7so6896740pfi.7
 for <qemu-devel@nongnu.org>; Tue, 09 Mar 2021 13:35:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=h87+BQRAY+NP+o3seQKydpXF/ivAKG7yDbH/a9XLY/k=;
 b=trDuv/3igQ2FLoiN/HZvR57XEv15iF/2+8yXemM4YoctYuaABGwSOIyV2KAgsBLvNt
 dzOc7IwGxG5OiAuPDRWeSW06HZxSTG7Zmr122ofANqufzHCR4Q1SnHoYb6XVYcA3odHX
 46DTbLXfiJTTkBWxrR8pyIPN0qCiKX0x/F3TvVaEr+Dfqu/i8fBocAzUJGyV3JONLBqT
 251xeza5xNwYzzSHs9hs9jfCIu6yqUoS3YdlqYVdGJxzpFC+a+TKca8tY8zJv/xAf+Ef
 KQKszckGSCsik4cjeKOY3V38ds/JUKQPgTq5YE3Thx+izJ7+TiHIs7a9rAcXZCEJT3nv
 GxuA==
X-Gm-Message-State: AOAM532lycDDfnO/dK7vch24l7BCRpZbHWjljhQ6evE2gQg2IT8b18en
 UIM2pnT4bwaoyhTj4U3vffjgTGysjBQ=
X-Google-Smtp-Source: ABdhPJxdfLyrLVM8pitBFuesAGn7PTaYxAcGRyzuUZZuCkEhzmc98YBZoSCdWcPjoKaVR0k0nzPypw==
X-Received: by 2002:a63:2bc4:: with SMTP id
 r187mr27048708pgr.131.1615325715953; 
 Tue, 09 Mar 2021 13:35:15 -0800 (PST)
Received: from Yifans-Mac-Mini.hsd1.ca.comcast.net
 (c-73-170-32-51.hsd1.ca.comcast.net. [73.170.32.51])
 by smtp.gmail.com with ESMTPSA id y68sm15433995pgy.5.2021.03.09.13.35.14
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 09 Mar 2021 13:35:15 -0800 (PST)
From: Joelle van Dyne <j@getutm.app>
To: qemu-devel@nongnu.org
Subject: [RFC] hw/display: add virtio-ramfb device
Date: Tue,  9 Mar 2021 13:35:13 -0800
Message-Id: <20210309213513.12925-1-j@getutm.app>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=209.85.210.174;
 envelope-from=osy86github@gmail.com; helo=mail-pf1-f174.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Joelle van Dyne <j@getutm.app>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Like virtio-vga, but using ramfb instead of legacy vga.
Useful for booting from OVMF (with updated drivers) into Windows
ARM which expects a linear FB that the virtio-gpu driver in OVMF
does not provide.

This code was originally written by Gerd Hoffmann and was
updated to contain later changes to the display driver tree.

Co-authored-by: Gerd Hoffmann <kraxel@redhat.com>
Signed-off-by: Joelle van Dyne <j@getutm.app>
---
 hw/display/virtio-ramfb.c | 188 ++++++++++++++++++++++++++++++++++++++
 hw/display/meson.build    |   1 +
 2 files changed, 189 insertions(+)
 create mode 100644 hw/display/virtio-ramfb.c

diff --git a/hw/display/virtio-ramfb.c b/hw/display/virtio-ramfb.c
new file mode 100644
index 0000000000..d08bb90a14
--- /dev/null
+++ b/hw/display/virtio-ramfb.c
@@ -0,0 +1,188 @@
+#include "qemu/osdep.h"
+#include "hw/pci/pci.h"
+#include "ui/console.h"
+#include "hw/qdev-properties.h"
+#include "hw/virtio/virtio-gpu-pci.h"
+#include "qapi/error.h"
+#include "hw/display/ramfb.h"
+#include "qom/object.h"
+
+/*
+ * virtio-ramfb-base: This extends VirtioPCIProxy.
+ */
+#define TYPE_VIRTIO_RAMFB_BASE "virtio-ramfb-base"
+OBJECT_DECLARE_TYPE(VirtIORAMFBBase, VirtIORAMFBBaseClass,
+                    VIRTIO_RAMFB_BASE)
+
+struct VirtIORAMFBBase {
+    VirtIOPCIProxy parent_obj;
+
+    VirtIOGPUBase *vgpu;
+    RAMFBState    *ramfb;
+};
+
+struct VirtIORAMFBBaseClass {
+    VirtioPCIClass parent_class;
+
+    DeviceReset parent_reset;
+};
+
+static void virtio_ramfb_invalidate_display(void *opaque)
+{
+    VirtIORAMFBBase *vramfb = opaque;
+    VirtIOGPUBase *g = vramfb->vgpu;
+
+    if (g->enable) {
+        g->hw_ops->invalidate(g);
+    }
+}
+
+static void virtio_ramfb_update_display(void *opaque)
+{
+    VirtIORAMFBBase *vramfb = opaque;
+    VirtIOGPUBase *g = vramfb->vgpu;
+
+    if (g->enable) {
+        g->hw_ops->gfx_update(g);
+    } else {
+        ramfb_display_update(g->scanout[0].con, vramfb->ramfb);
+    }
+}
+
+static int virtio_ramfb_ui_info(void *opaque, uint32_t idx, QemuUIInfo *info)
+{
+    VirtIORAMFBBase *vramfb = opaque;
+    VirtIOGPUBase *g = vramfb->vgpu;
+
+    if (g->hw_ops->ui_info) {
+        return g->hw_ops->ui_info(g, idx, info);
+    }
+    return -1;
+}
+
+static void virtio_ramfb_gl_block(void *opaque, bool block)
+{
+    VirtIORAMFBBase *vramfb = opaque;
+    VirtIOGPUBase *g = vramfb->vgpu;
+
+    if (g->hw_ops->gl_block) {
+        g->hw_ops->gl_block(g, block);
+    }
+}
+
+static const GraphicHwOps virtio_ramfb_ops = {
+    .invalidate = virtio_ramfb_invalidate_display,
+    .gfx_update = virtio_ramfb_update_display,
+    .ui_info = virtio_ramfb_ui_info,
+    .gl_block = virtio_ramfb_gl_block,
+};
+
+static const VMStateDescription vmstate_virtio_ramfb = {
+    .name = "virtio-ramfb",
+    .version_id = 2,
+    .minimum_version_id = 2,
+    .fields = (VMStateField[]) {
+        /* no pci stuff here, saving the virtio device will handle that */
+        /* FIXME */
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+/* RAMFB device wrapper around PCI device around virtio GPU */
+static void virtio_ramfb_realize(VirtIOPCIProxy *vpci_dev, Error **errp)
+{
+    VirtIORAMFBBase *vramfb = VIRTIO_RAMFB_BASE(vpci_dev);
+    VirtIOGPUBase *g = vramfb->vgpu;
+    int i;
+
+    /* init virtio bits */
+    virtio_pci_force_virtio_1(vpci_dev);
+    if (!qdev_realize(DEVICE(g), BUS(&vpci_dev->bus), errp)) {
+        return;
+    }
+
+    /* init ramfb */
+    vramfb->ramfb = ramfb_setup(errp);
+    graphic_console_set_hwops(g->scanout[0].con, &virtio_ramfb_ops, vramfb);
+
+    for (i = 0; i < g->conf.max_outputs; i++) {
+        object_property_set_link(OBJECT(g->scanout[i].con), "device",
+                                 OBJECT(vpci_dev), &error_abort);
+    }
+}
+
+static void virtio_ramfb_reset(DeviceState *dev)
+{
+    VirtIORAMFBBaseClass *klass = VIRTIO_RAMFB_BASE_GET_CLASS(dev);
+
+    /* reset virtio-gpu */
+    klass->parent_reset(dev);
+}
+
+static Property virtio_ramfb_base_properties[] = {
+    DEFINE_VIRTIO_GPU_PCI_PROPERTIES(VirtIOPCIProxy),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void virtio_ramfb_base_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    VirtioPCIClass *k = VIRTIO_PCI_CLASS(klass);
+    VirtIORAMFBBaseClass *v = VIRTIO_RAMFB_BASE_CLASS(klass);
+    PCIDeviceClass *pcidev_k = PCI_DEVICE_CLASS(klass);
+
+    set_bit(DEVICE_CATEGORY_DISPLAY, dc->categories);
+    device_class_set_props(dc, virtio_ramfb_base_properties);
+    dc->vmsd = &vmstate_virtio_ramfb;
+    dc->hotpluggable = false;
+    device_class_set_parent_reset(dc, virtio_ramfb_reset,
+                                  &v->parent_reset);
+
+    k->realize = virtio_ramfb_realize;
+    pcidev_k->class_id = PCI_CLASS_DISPLAY_OTHER;
+}
+
+static TypeInfo virtio_ramfb_base_info = {
+    .name          = TYPE_VIRTIO_RAMFB_BASE,
+    .parent        = TYPE_VIRTIO_PCI,
+    .instance_size = sizeof(VirtIORAMFBBase),
+    .class_size    = sizeof(VirtIORAMFBBaseClass),
+    .class_init    = virtio_ramfb_base_class_init,
+    .abstract      = true,
+};
+
+#define TYPE_VIRTIO_RAMFB "virtio-ramfb"
+
+typedef struct VirtIORAMFB VirtIORAMFB;
+DECLARE_INSTANCE_CHECKER(VirtIORAMFB, VIRTIO_RAMFB,
+                         TYPE_VIRTIO_RAMFB)
+
+struct VirtIORAMFB {
+    VirtIORAMFBBase parent_obj;
+
+    VirtIOGPU     vdev;
+};
+
+static void virtio_ramfb_inst_initfn(Object *obj)
+{
+    VirtIORAMFB *dev = VIRTIO_RAMFB(obj);
+
+    virtio_instance_init_common(obj, &dev->vdev, sizeof(dev->vdev),
+                                TYPE_VIRTIO_GPU);
+    VIRTIO_RAMFB_BASE(dev)->vgpu = VIRTIO_GPU_BASE(&dev->vdev);
+}
+
+static VirtioPCIDeviceTypeInfo virtio_ramfb_info = {
+    .generic_name  = TYPE_VIRTIO_RAMFB,
+    .parent        = TYPE_VIRTIO_RAMFB_BASE,
+    .instance_size = sizeof(VirtIORAMFB),
+    .instance_init = virtio_ramfb_inst_initfn,
+};
+
+static void virtio_ramfb_register_types(void)
+{
+    type_register_static(&virtio_ramfb_base_info);
+    virtio_pci_types_register(&virtio_ramfb_info);
+}
+
+type_init(virtio_ramfb_register_types)
diff --git a/hw/display/meson.build b/hw/display/meson.build
index 9d79e3951d..14f5fa39f4 100644
--- a/hw/display/meson.build
+++ b/hw/display/meson.build
@@ -60,6 +60,7 @@ if config_all_devices.has_key('CONFIG_VIRTIO_GPU')
   virtio_gpu_ss.add(when: ['CONFIG_VIRTIO_GPU', 'CONFIG_VIRGL'],
                     if_true: [files('virtio-gpu-3d.c'), pixman, virgl])
   virtio_gpu_ss.add(when: 'CONFIG_VHOST_USER_GPU', if_true: files('vhost-user-gpu.c'))
+  virtio_gpu_ss.add(when: 'CONFIG_FW_CFG_DMA', if_true: files('virtio-ramfb.c'))
   hw_display_modules += {'virtio-gpu': virtio_gpu_ss}
 endif
 
-- 
2.28.0


