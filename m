Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E52E06A23F0
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 22:42:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVfpE-0005kd-T7; Fri, 24 Feb 2023 16:41:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mail@maciej.szmigiero.name>)
 id 1pVfpA-0005in-VP
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 16:41:52 -0500
Received: from vps-vb.mhejs.net ([37.28.154.113])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mail@maciej.szmigiero.name>)
 id 1pVfp7-0002dY-Bu
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 16:41:52 -0500
Received: from MUA by vps-vb.mhejs.net with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <mail@maciej.szmigiero.name>)
 id 1pVfol-0000j3-Q9; Fri, 24 Feb 2023 22:41:27 +0100
From: "Maciej S. Szmigiero" <mail@maciej.szmigiero.name>
To: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>
Cc: "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
Subject: [PATCH][RESEND v3 1/3] hapvdimm: add a virtual DIMM device for memory
 hot-add protocols
Date: Fri, 24 Feb 2023 22:41:14 +0100
Message-Id: <369d848fdc86994ca646a5aa4e04c4dc049d04f1.1677274611.git.maciej.szmigiero@oracle.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1677274611.git.maciej.szmigiero@oracle.com>
References: <cover.1677274611.git.maciej.szmigiero@oracle.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=37.28.154.113;
 envelope-from=mail@maciej.szmigiero.name; helo=vps-vb.mhejs.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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

From: "Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>

This device works like a virtual DIMM stick: it allows inserting extra RAM
into the guest at run time and later removing it without having to
duplicate all of the address space management logic of TYPE_MEMORY_DEVICE
in each memory hot-add protocol driver.

This device is not meant to be instantiated or removed by the QEMU user
directly: rather, the protocol driver is supposed to add and remove it as
required.

In fact, its very existence is supposed to be an implementation detail,
transparent to the QEMU user.

To prevent the user from accidentally manually creating an instance of this
device the protocol driver is supposed to place the qdev_device_add*() call
(that is uses to add this device) between hapvdimm_allow_adding() and
hapvdimm_disallow_adding() calls in order to temporary authorize the
operation.

Signed-off-by: Maciej S. Szmigiero <maciej.szmigiero@oracle.com>
---
 hw/i386/Kconfig           |   2 +
 hw/i386/pc.c              |   4 +-
 hw/mem/Kconfig            |   4 +
 hw/mem/hapvdimm.c         | 221 ++++++++++++++++++++++++++++++++++++++
 hw/mem/meson.build        |   1 +
 include/hw/mem/hapvdimm.h |  27 +++++
 6 files changed, 258 insertions(+), 1 deletion(-)
 create mode 100644 hw/mem/hapvdimm.c
 create mode 100644 include/hw/mem/hapvdimm.h

diff --git a/hw/i386/Kconfig b/hw/i386/Kconfig
index 9fbfe748b5..13f70707ed 100644
--- a/hw/i386/Kconfig
+++ b/hw/i386/Kconfig
@@ -68,6 +68,7 @@ config I440FX
     imply E1000_PCI
     imply VMPORT
     imply VMMOUSE
+    imply HAPVDIMM
     select ACPI_PIIX4
     select PC_PCI
     select PC_ACPI
@@ -95,6 +96,7 @@ config Q35
     imply E1000E_PCI_EXPRESS
     imply VMPORT
     imply VMMOUSE
+    imply HAPVDIMM
     select PC_PCI
     select PC_ACPI
     select PCI_EXPRESS_Q35
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index a7a2ededf9..5469d89bcc 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -73,6 +73,7 @@
 #include "hw/acpi/acpi.h"
 #include "hw/acpi/cpu_hotplug.h"
 #include "acpi-build.h"
+#include "hw/mem/hapvdimm.h"
 #include "hw/mem/pc-dimm.h"
 #include "hw/mem/nvdimm.h"
 #include "hw/cxl/cxl.h"
@@ -1609,7 +1610,8 @@ static HotplugHandler *pc_get_hotplug_handler(MachineState *machine,
         object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_PMEM_PCI) ||
         object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_MEM_PCI) ||
         object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_IOMMU_PCI) ||
-        object_dynamic_cast(OBJECT(dev), TYPE_X86_IOMMU_DEVICE)) {
+        object_dynamic_cast(OBJECT(dev), TYPE_X86_IOMMU_DEVICE) ||
+        object_dynamic_cast(OBJECT(dev), TYPE_HAPVDIMM)) {
         return HOTPLUG_HANDLER(machine);
     }
 
diff --git a/hw/mem/Kconfig b/hw/mem/Kconfig
index 73c5ae8ad9..d8c1feafed 100644
--- a/hw/mem/Kconfig
+++ b/hw/mem/Kconfig
@@ -16,3 +16,7 @@ config CXL_MEM_DEVICE
     bool
     default y if CXL
     select MEM_DEVICE
+
+config HAPVDIMM
+    bool
+    select MEM_DEVICE
diff --git a/hw/mem/hapvdimm.c b/hw/mem/hapvdimm.c
new file mode 100644
index 0000000000..9ae82edb2c
--- /dev/null
+++ b/hw/mem/hapvdimm.c
@@ -0,0 +1,221 @@
+/*
+ * A memory hot-add protocol vDIMM device
+ *
+ * Copyright (C) 2020-2023 Oracle and/or its affiliates.
+ *
+ * Heavily based on pc-dimm.c:
+ * Copyright ProfitBricks GmbH 2012
+ * Copyright (C) 2014 Red Hat Inc
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+
+#include "exec/memory.h"
+#include "hw/boards.h"
+#include "hw/mem/hapvdimm.h"
+#include "hw/mem/memory-device.h"
+#include "hw/qdev-core.h"
+#include "hw/qdev-properties.h"
+#include "migration/vmstate.h"
+#include "qapi/error.h"
+#include "qapi/visitor.h"
+#include "qemu/module.h"
+#include "sysemu/hostmem.h"
+#include "trace.h"
+
+typedef struct HAPVDIMMDevice {
+    /* private */
+    DeviceState parent_obj;
+
+    /* public */
+    bool ever_realized;
+    uint64_t addr;
+    uint64_t align;
+    uint32_t node;
+    HostMemoryBackend *hostmem;
+} HAPVDIMMDevice;
+
+typedef struct HAPVDIMMDeviceClass {
+    /* private */
+    DeviceClass parent_class;
+} HAPVDIMMDeviceClass;
+
+static bool hapvdimm_adding_allowed;
+static Property hapvdimm_properties[] = {
+    DEFINE_PROP_UINT64(HAPVDIMM_ADDR_PROP, HAPVDIMMDevice, addr, 0),
+    DEFINE_PROP_UINT64(HAPVDIMM_ALIGN_PROP, HAPVDIMMDevice, align, 0),
+    DEFINE_PROP_LINK(HAPVDIMM_MEMDEV_PROP, HAPVDIMMDevice, hostmem,
+                     TYPE_MEMORY_BACKEND, HostMemoryBackend *),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+void hapvdimm_allow_adding(void)
+{
+    hapvdimm_adding_allowed = true;
+}
+
+void hapvdimm_disallow_adding(void)
+{
+    hapvdimm_adding_allowed = false;
+}
+
+static void hapvdimm_get_size(Object *obj, Visitor *v, const char *name,
+                            void *opaque, Error **errp)
+{
+    ERRP_GUARD();
+    uint64_t value;
+
+    value = memory_device_get_region_size(MEMORY_DEVICE(obj), errp);
+    if (*errp) {
+        return;
+    }
+
+    visit_type_uint64(v, name, &value, errp);
+}
+
+static void hapvdimm_init(Object *obj)
+{
+    object_property_add(obj, HAPVDIMM_SIZE_PROP, "uint64", hapvdimm_get_size,
+                        NULL, NULL, NULL);
+}
+
+static void hapvdimm_realize(DeviceState *dev, Error **errp)
+{
+    ERRP_GUARD();
+    HAPVDIMMDevice *hapvdimm = HAPVDIMM(dev);
+    MachineState *ms = MACHINE(qdev_get_machine());
+
+    if (!hapvdimm->ever_realized) {
+        if (!hapvdimm_adding_allowed) {
+            error_setg(errp, "direct adding not allowed");
+            return;
+        }
+
+        hapvdimm->ever_realized = true;
+    }
+
+    memory_device_pre_plug(MEMORY_DEVICE(hapvdimm), ms,
+                           hapvdimm->align ? &hapvdimm->align : NULL,
+                           errp);
+    if (*errp) {
+        return;
+    }
+
+    if (!hapvdimm->hostmem) {
+        error_setg(errp, "'" HAPVDIMM_MEMDEV_PROP "' property is not set");
+        return;
+    } else if (host_memory_backend_is_mapped(hapvdimm->hostmem)) {
+        const char *path;
+
+        path = object_get_canonical_path_component(OBJECT(hapvdimm->hostmem));
+        error_setg(errp, "can't use already busy memdev: %s", path);
+        return;
+    }
+
+    host_memory_backend_set_mapped(hapvdimm->hostmem, true);
+
+    memory_device_plug(MEMORY_DEVICE(hapvdimm), ms);
+    vmstate_register_ram(host_memory_backend_get_memory(hapvdimm->hostmem),
+                         dev);
+}
+
+static void hapvdimm_unrealize(DeviceState *dev)
+{
+    HAPVDIMMDevice *hapvdimm = HAPVDIMM(dev);
+    MachineState *ms = MACHINE(qdev_get_machine());
+
+    memory_device_unplug(MEMORY_DEVICE(hapvdimm), ms);
+    vmstate_unregister_ram(host_memory_backend_get_memory(hapvdimm->hostmem),
+                           dev);
+
+    host_memory_backend_set_mapped(hapvdimm->hostmem, false);
+}
+
+static uint64_t hapvdimm_md_get_addr(const MemoryDeviceState *md)
+{
+    return object_property_get_uint(OBJECT(md), HAPVDIMM_ADDR_PROP,
+                                    &error_abort);
+}
+
+static void hapvdimm_md_set_addr(MemoryDeviceState *md, uint64_t addr,
+                               Error **errp)
+{
+    object_property_set_uint(OBJECT(md), HAPVDIMM_ADDR_PROP, addr, errp);
+}
+
+static MemoryRegion *hapvdimm_md_get_memory_region(MemoryDeviceState *md,
+                                                 Error **errp)
+{
+    HAPVDIMMDevice *hapvdimm = HAPVDIMM(md);
+
+    if (!hapvdimm->hostmem) {
+        error_setg(errp, "'" HAPVDIMM_MEMDEV_PROP "' property must be set");
+        return NULL;
+    }
+
+    return host_memory_backend_get_memory(hapvdimm->hostmem);
+}
+
+static void hapvdimm_md_fill_device_info(const MemoryDeviceState *md,
+                                       MemoryDeviceInfo *info)
+{
+    PCDIMMDeviceInfo *di = g_new0(PCDIMMDeviceInfo, 1);
+    const DeviceClass *dc = DEVICE_GET_CLASS(md);
+    const HAPVDIMMDevice *hapvdimm = HAPVDIMM(md);
+    const DeviceState *dev = DEVICE(md);
+
+    if (dev->id) {
+        di->id = g_strdup(dev->id);
+    }
+    di->hotplugged = dev->hotplugged;
+    di->hotpluggable = dc->hotpluggable;
+    di->addr = hapvdimm->addr;
+    di->slot = -1;
+    di->node = 0; /* FIXME: report proper node */
+    di->size = object_property_get_uint(OBJECT(hapvdimm), HAPVDIMM_SIZE_PROP,
+                                        NULL);
+    di->memdev = object_get_canonical_path(OBJECT(hapvdimm->hostmem));
+
+    info->u.dimm.data = di;
+    info->type = MEMORY_DEVICE_INFO_KIND_DIMM;
+}
+
+static void hapvdimm_class_init(ObjectClass *oc, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(oc);
+    MemoryDeviceClass *mdc = MEMORY_DEVICE_CLASS(oc);
+
+    dc->realize = hapvdimm_realize;
+    dc->unrealize = hapvdimm_unrealize;
+    device_class_set_props(dc, hapvdimm_properties);
+    dc->desc = "vDIMM for a hot add protocol";
+
+    mdc->get_addr = hapvdimm_md_get_addr;
+    mdc->set_addr = hapvdimm_md_set_addr;
+    mdc->get_plugged_size = memory_device_get_region_size;
+    mdc->get_memory_region = hapvdimm_md_get_memory_region;
+    mdc->fill_device_info = hapvdimm_md_fill_device_info;
+}
+
+static const TypeInfo hapvdimm_info = {
+    .name          = TYPE_HAPVDIMM,
+    .parent        = TYPE_DEVICE,
+    .instance_size = sizeof(HAPVDIMMDevice),
+    .instance_init = hapvdimm_init,
+    .class_init    = hapvdimm_class_init,
+    .class_size    = sizeof(HAPVDIMMDeviceClass),
+    .interfaces = (InterfaceInfo[]) {
+        { TYPE_MEMORY_DEVICE },
+        { }
+    },
+};
+
+static void hapvdimm_register_types(void)
+{
+    type_register_static(&hapvdimm_info);
+}
+
+type_init(hapvdimm_register_types)
diff --git a/hw/mem/meson.build b/hw/mem/meson.build
index 609b2b36fc..5f7a0181d3 100644
--- a/hw/mem/meson.build
+++ b/hw/mem/meson.build
@@ -4,6 +4,7 @@ mem_ss.add(when: 'CONFIG_DIMM', if_true: files('pc-dimm.c'))
 mem_ss.add(when: 'CONFIG_NPCM7XX', if_true: files('npcm7xx_mc.c'))
 mem_ss.add(when: 'CONFIG_NVDIMM', if_true: files('nvdimm.c'))
 mem_ss.add(when: 'CONFIG_CXL_MEM_DEVICE', if_true: files('cxl_type3.c'))
+mem_ss.add(when: 'CONFIG_HAPVDIMM', if_true: files('hapvdimm.c'))
 
 softmmu_ss.add_all(when: 'CONFIG_MEM_DEVICE', if_true: mem_ss)
 
diff --git a/include/hw/mem/hapvdimm.h b/include/hw/mem/hapvdimm.h
new file mode 100644
index 0000000000..bb9a135a52
--- /dev/null
+++ b/include/hw/mem/hapvdimm.h
@@ -0,0 +1,27 @@
+/*
+ * A memory hot-add protocol vDIMM device
+ *
+ * Copyright (C) 2020-2023 Oracle and/or its affiliates.
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ *
+ */
+
+#ifndef QEMU_HAPVDIMM_H
+#define QEMU_HAPVDIMM_H
+
+#include "qom/object.h"
+
+#define TYPE_HAPVDIMM "mem-hapvdimm"
+OBJECT_DECLARE_SIMPLE_TYPE(HAPVDIMMDevice, HAPVDIMM)
+
+#define HAPVDIMM_ADDR_PROP "addr"
+#define HAPVDIMM_ALIGN_PROP "align"
+#define HAPVDIMM_SIZE_PROP "size"
+#define HAPVDIMM_MEMDEV_PROP "memdev"
+
+void hapvdimm_allow_adding(void);
+void hapvdimm_disallow_adding(void);
+
+#endif

