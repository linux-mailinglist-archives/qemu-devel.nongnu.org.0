Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C3416D92D1
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Apr 2023 11:34:15 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkLzF-0001se-Qb; Thu, 06 Apr 2023 05:32:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <morbidrsa@gmail.com>)
 id 1pkLzE-0001p2-0w
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 05:32:56 -0400
Received: from mail-wm1-f54.google.com ([209.85.128.54])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <morbidrsa@gmail.com>)
 id 1pkLzB-0006sN-4T
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 05:32:55 -0400
Received: by mail-wm1-f54.google.com with SMTP id
 l10-20020a05600c1d0a00b003f04bd3691eso8503992wms.5
 for <qemu-devel@nongnu.org>; Thu, 06 Apr 2023 02:32:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680773571;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IzZmudEc9aOJm2qc1nFBgzCLmeytduaXPtcEf7a+9qI=;
 b=n1D4XyBinLzHsE1FqlV2DZDYn95sjhR0o0uwEm/Ec+IUHEQsyWmqSShqNxvKTVvLR+
 F/MlJT6R2m5YImCw3YWa+6PIVp6AbbZsnViOWiOT/2f/fSdcFLXQ4vi6UMzknapeXJxT
 GMrG2aHh08YBOtn/VpCA4G4fxNP9PF3GilFObfXXz1/EApH5RCsZe/UcaYIZv4zzGnvl
 +UbEJhqSiG99+LSPcup73bA0Yvia+lC/M+rYgWVsqv3uoRsZUb9ImtxOJYGdVx7neZJs
 OU3psxVJlCSDON/MmAA88OSDTihVPPeL/LVTjb3wjWAweQsg4t1kC06mG4ZsMKvThMzS
 t/bQ==
X-Gm-Message-State: AAQBX9cyKQVxpBlfULrS3u8F7C2yOvNnMujskeDiDfm6YsfuigK8laI1
 jzubrynTK5aNC4V6gUbVKb5xRnU37c7EDLkT
X-Google-Smtp-Source: AKy350ZYkPg+qBXx41Guf3Zk/0SvjVcY4sGV0riF5H+gpGKVzBxCHl8VlFyq1vhnZh5MHDObQ4MMhQ==
X-Received: by 2002:a05:600c:378d:b0:3ef:6ae7:89bd with SMTP id
 o13-20020a05600c378d00b003ef6ae789bdmr6599600wmr.6.1680773571148; 
 Thu, 06 Apr 2023 02:32:51 -0700 (PDT)
Received: from localhost.localdomain
 (aftr-82-135-86-174.dynamic.mnet-online.de. [82.135.86.174])
 by smtp.googlemail.com with ESMTPSA id
 g6-20020a05600c4ec600b003edc4788fa0sm4914832wmq.2.2023.04.06.02.32.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Apr 2023 02:32:50 -0700 (PDT)
From: Johannes Thumshirn <jth@kernel.org>
To: qemu-devel@nongnu.org
Cc: Alistair Francis <alistair@alistair23.me>,
 Javier Rodriguez <josejavier.rodriguez@duagon.com>,
 =?UTF-8?q?Jorge=20Sanjuan=20Garc=C3=ADa?= <Jorge.SanjuanGarcia@duagon.com>,
 Dmitry Fomichev <dmitry.fomichev@wdc.com>,
 Johannes Thumshirn <jth@kernel.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v2 1/4] Add MEN Chameleon Bus emulation
Date: Thu,  6 Apr 2023 11:31:54 +0200
Message-Id: <20230406093157.104145-2-jth@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230406093157.104145-1-jth@kernel.org>
References: <20230406093157.104145-1-jth@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=209.85.128.54; envelope-from=morbidrsa@gmail.com;
 helo=mail-wm1-f54.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

The MEN Chameleon Bus (MCB) is an on-chip bus system exposing IP Cores of an
FPGA to a outside bus system like PCIe.

Acked-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Johannes Thumshirn <jth@kernel.org>
---
 MAINTAINERS          |   6 ++
 hw/Kconfig           |   1 +
 hw/mcb/Kconfig       |   2 +
 hw/mcb/mcb.c         | 182 +++++++++++++++++++++++++++++++++++++++++++
 hw/mcb/meson.build   |   1 +
 hw/meson.build       |   1 +
 include/hw/mcb/mcb.h | 106 +++++++++++++++++++++++++
 7 files changed, 299 insertions(+)
 create mode 100644 hw/mcb/Kconfig
 create mode 100644 hw/mcb/mcb.c
 create mode 100644 hw/mcb/meson.build
 create mode 100644 include/hw/mcb/mcb.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 98cb2d64cf..badec8abdd 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1947,6 +1947,12 @@ R: Paolo Bonzini <pbonzini@redhat.com>
 S: Odd Fixes
 F: hw/char/
 
+MEN Chameleon Bus
+M: Johannes Thumshirn <jth@kernel.org>
+S: Maintained
+F: hw/mcb/
+F: include/hw/mcb/
+
 Network devices
 M: Jason Wang <jasowang@redhat.com>
 S: Odd Fixes
diff --git a/hw/Kconfig b/hw/Kconfig
index ba62ff6417..f5ef84b10b 100644
--- a/hw/Kconfig
+++ b/hw/Kconfig
@@ -18,6 +18,7 @@ source intc/Kconfig
 source ipack/Kconfig
 source ipmi/Kconfig
 source isa/Kconfig
+source mcb/Kconfig
 source mem/Kconfig
 source misc/Kconfig
 source net/Kconfig
diff --git a/hw/mcb/Kconfig b/hw/mcb/Kconfig
new file mode 100644
index 0000000000..36a7a583a8
--- /dev/null
+++ b/hw/mcb/Kconfig
@@ -0,0 +1,2 @@
+config MCB
+    bool
diff --git a/hw/mcb/mcb.c b/hw/mcb/mcb.c
new file mode 100644
index 0000000000..f2bf722de5
--- /dev/null
+++ b/hw/mcb/mcb.c
@@ -0,0 +1,182 @@
+/*
+ * QEMU MEN Chameleon Bus emulation
+ *
+ * Copyright (C) 2023 Johannes Thumshirn <jth@kernel.org>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See
+ * the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include "qapi/error.h"
+#include "qemu/module.h"
+#include "hw/mcb/mcb.h"
+#include "hw/irq.h"
+#include "hw/qdev-properties.h"
+#include "migration/vmstate.h"
+
+ChameleonDeviceDescriptor *mcb_new_chameleon_descriptor(MCBus *bus, uint8_t id,
+                                                        uint8_t rev,
+                                                        uint8_t var,
+                                                        uint32_t size)
+{
+    BusChild *kid;
+    ChameleonDeviceDescriptor *gdd;
+    uint32_t reg1 = 0;
+    uint32_t offset = 0x200;
+    uint32_t end = 0;
+
+    gdd =  g_new0(ChameleonDeviceDescriptor, 1);
+    if (!gdd) {
+        return NULL;
+    }
+
+    reg1 |= GDD_DEV(id);
+    reg1 |= GDD_DTY(CHAMELEON_DTYPE_GENERAL);
+    reg1 |= GDD_REV(rev);
+    reg1 |= GDD_VAR(var);
+    gdd->reg1 = cpu_to_le32(reg1);
+
+    QTAILQ_FOREACH(kid, &BUS(bus)->children, sibling) {
+        DeviceState *qdev = kid->child;
+        MCBDevice *mdev = MCB_DEVICE(qdev);
+
+        if (mdev->gdd) {
+            offset = mdev->gdd->offset;
+            end = offset + mdev->gdd->size;
+        }
+    }
+
+    gdd->offset = offset + end;
+    gdd->size = size;
+
+    return gdd;
+}
+
+static void mcb_irq_handler(void *opaque, int irq_num, int level)
+{
+    MCBDevice *dev = opaque;
+    MCBus *bus = MCB_BUS(qdev_get_parent_bus(DEVICE(dev)));
+
+    if (bus->set_irq) {
+        bus->set_irq(dev, irq_num, level);
+    }
+}
+
+qemu_irq mcb_allocate_irq(MCBDevice *dev)
+{
+    int irq = 0;
+    return qemu_allocate_irq(mcb_irq_handler, dev, irq);
+}
+
+MCBDevice *mcb_device_find(MCBus *bus, hwaddr addr)
+{
+    BusChild *kid;
+    uint32_t start;
+    uint32_t end;
+
+    QTAILQ_FOREACH(kid, &BUS(bus)->children, sibling) {
+        DeviceState *qdev = kid->child;
+        MCBDevice *mdev = MCB_DEVICE(qdev);
+
+        start = mdev->gdd->offset;
+        end = start + mdev->gdd->size;
+
+        if (addr >= start && addr <= end) {
+            return mdev;
+        }
+    }
+    return NULL;
+}
+
+void mcb_bus_init(MCBus *bus, size_t bus_size,
+                  DeviceState *parent,
+                  uint8_t n_slots,
+                  qemu_irq_handler handler)
+{
+    qbus_init(bus, bus_size, TYPE_MCB_BUS, parent, NULL);
+    bus->n_slots = n_slots;
+    bus->set_irq = handler;
+}
+
+static void mcb_device_realize(DeviceState *dev, Error **errp)
+{
+    MCBDevice *mdev = MCB_DEVICE(dev);
+    MCBus *bus = MCB_BUS(qdev_get_parent_bus(dev));
+    MCBDeviceClass *k = MCB_DEVICE_GET_CLASS(dev);
+
+    if (mdev->slot < 0) {
+        mdev->slot = bus->free_slot;
+    }
+
+    if (mdev->slot >= bus->n_slots) {
+        error_setg(errp, "Only %" PRIu8 " slots available.", bus->n_slots);
+        return;
+    }
+    bus->free_slot = mdev->slot + 1;
+
+    mdev->irq = qemu_allocate_irqs(bus->set_irq, mdev, 1);
+
+    k->realize(dev, errp);
+}
+
+static void mcb_device_unrealize(DeviceState *dev)
+{
+    MCBDevice *mdev = MCB_DEVICE(dev);
+    MCBDeviceClass *k = MCB_DEVICE_GET_CLASS(dev);
+
+    if (k->unrealize) {
+        k->unrealize(dev);
+        return;
+    }
+
+    qemu_free_irqs(mdev->irq, 1);
+}
+
+static Property mcb_device_props[] = {
+    DEFINE_PROP_INT32("slot", MCBDevice, slot, -1),
+    DEFINE_PROP_END_OF_LIST()
+};
+
+static void mcb_device_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *k = DEVICE_CLASS(klass);
+
+    set_bit(DEVICE_CATEGORY_INPUT, k->categories);
+    k->bus_type = TYPE_MCB_BUS;
+    k->realize = mcb_device_realize;
+    k->unrealize = mcb_device_unrealize;
+    device_class_set_props(k, mcb_device_props);
+}
+
+const VMStateDescription vmstate_mcb_device = {
+    .name = "mcb_device",
+    .version_id = 1,
+    .fields = (VMStateField[]) {
+        VMSTATE_INT32(slot, MCBDevice),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static const TypeInfo mcb_device_info = {
+    .name = TYPE_MCB_DEVICE,
+    .parent = TYPE_DEVICE,
+    .instance_size = sizeof(MCBDevice),
+    .class_size = sizeof(MCBDeviceClass),
+    .class_init = mcb_device_class_init,
+    .abstract = true,
+};
+
+static const TypeInfo mcb_bus_info = {
+    .name = TYPE_MCB_BUS,
+    .parent = TYPE_BUS,
+    .instance_size = sizeof(MCBus),
+};
+
+static void mcb_register_types(void)
+{
+    type_register_static(&mcb_device_info);
+    type_register_static(&mcb_bus_info);
+}
+
+type_init(mcb_register_types);
diff --git a/hw/mcb/meson.build b/hw/mcb/meson.build
new file mode 100644
index 0000000000..a385edc07c
--- /dev/null
+++ b/hw/mcb/meson.build
@@ -0,0 +1 @@
+softmmu_ss.add(when: 'CONFIG_MCB', if_true: files('mcb.c'))
diff --git a/hw/meson.build b/hw/meson.build
index c7ac7d3d75..3d1462ad8b 100644
--- a/hw/meson.build
+++ b/hw/meson.build
@@ -18,6 +18,7 @@ subdir('intc')
 subdir('ipack')
 subdir('ipmi')
 subdir('isa')
+subdir('mcb')
 subdir('mem')
 subdir('misc')
 subdir('net')
diff --git a/include/hw/mcb/mcb.h b/include/hw/mcb/mcb.h
new file mode 100644
index 0000000000..ff120073e1
--- /dev/null
+++ b/include/hw/mcb/mcb.h
@@ -0,0 +1,106 @@
+/*
+ * QEMU MEN Chameleon Bus emulation
+ *
+ * Copyright (C) 2023 Johannes Thumshirn <jth@kernel.org>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See
+ * the COPYING file in the top-level directory.
+ */
+
+#ifndef QEMU_MCB_H
+#define QEMU_MCB_H
+
+#include "hw/qdev-core.h"
+#include "qom/object.h"
+#include "exec/memory.h"
+
+#define CHAMELEON_DTYPE_GENERAL  0x0
+#define CHAMELEON_DTYPE_END 0xf
+
+typedef struct {
+    uint32_t reg1;
+    uint32_t reg2;
+    uint32_t offset;
+    uint32_t size;
+} ChameleonDeviceDescriptor;
+
+#define GDD_DEV(x) (((x) & 0x3ff) << 18)
+#define GDD_DTY(x) (((x) & 0xf) << 28)
+#define GDD_REV(x) (((x) & 0x3f) << 5)
+#define GDD_VAR(x) (((x) & 0x3f) << 11)
+
+/* GDD Register 1 fields */
+#define GDD_IRQ(x) ((x) & 0x1f)
+
+/* GDD Register 2 fields */
+#define GDD_BAR(x) ((x) & 0x7)
+#define GDD_INS(x) (((x) >> 3) & 0x3f)
+#define GDD_GRP(x) (((x) >> 9) & 0x3f)
+
+typedef struct MCBus MCBus;
+
+#define TYPE_MCB_BUS "MEN Chameleon Bus"
+OBJECT_DECLARE_SIMPLE_TYPE(MCBus, MCB_BUS)
+
+struct MCBus {
+    /*< private >*/
+    BusState parent_obj;
+
+    uint8_t n_slots;
+    uint8_t free_slot;
+    qemu_irq_handler set_irq;
+    MemoryRegion mmio_region;
+};
+
+typedef struct MCBDevice MCBDevice;
+typedef struct MCBDeviceClass MCBDeviceClass;
+
+#define TYPE_MCB_DEVICE "mcb-device"
+#define MCB_DEVICE(obj) \
+    OBJECT_CHECK(MCBDevice, (obj), TYPE_MCB_DEVICE)
+#define MCB_DEVICE_CLASS(klass) \
+    OBJECT_CLASS_CHECK(MCBDeviceClass, (klass), TYPE_MCB_DEVICE)
+#define MCB_DEVICE_GET_CLASS(obj) \
+     OBJECT_GET_CLASS(MCBDeviceClass, (obj), TYPE_MCB_DEVICE)
+
+struct MCBDeviceClass {
+    /*< private >*/
+    DeviceClass parent_class;
+    /*< public >*/
+
+
+    DeviceRealize realize;
+    DeviceUnrealize unrealize;
+};
+
+struct MCBDevice {
+    /*< private >*/
+    DeviceState parent_obj;
+    /*< public >*/
+
+    qemu_irq *irq;
+    ChameleonDeviceDescriptor *gdd;
+    int slot;
+
+    uint8_t rev;
+    uint8_t var;
+};
+
+extern const VMStateDescription vmstate_mcb_device;
+
+ChameleonDeviceDescriptor *mcb_new_chameleon_descriptor(MCBus *bus, uint8_t id,
+                                                        uint8_t rev,
+                                                        uint8_t var,
+                                                        uint32_t size);
+
+#define VMSTATE_MCB_DEVICE(_field, _state)      \
+    VMSTATE_STRUCT(_field, _state, 1, vmstate_mcb_device, MCBDevice)
+
+MCBDevice *mcb_device_find(MCBus *bus, hwaddr addr);
+void mcb_bus_init(MCBus *bus, size_t bus_size,
+                  DeviceState *parent,
+                  uint8_t n_slots,
+                  qemu_irq_handler handler);
+
+qemu_irq mcb_allocate_irq(MCBDevice *dev);
+#endif
-- 
2.39.2


