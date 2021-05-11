Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39615379FB5
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 08:35:44 +0200 (CEST)
Received: from localhost ([::1]:44176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgLzZ-0005x0-A2
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 02:35:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1lgLrv-0005ny-8P
 for qemu-devel@nongnu.org; Tue, 11 May 2021 02:27:47 -0400
Received: from mga06.intel.com ([134.134.136.31]:46437)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1lgLrp-0004hV-D5
 for qemu-devel@nongnu.org; Tue, 11 May 2021 02:27:47 -0400
IronPort-SDR: 1oZ4kdF4yu8/4zvWn2YxalGnSxLyXTz/cFnr+pnx189hscb9PR4v+H9zc88P1CpfjHN0MNJpxn
 ewW5pJMtJVyw==
X-IronPort-AV: E=McAfee;i="6200,9189,9980"; a="260631495"
X-IronPort-AV: E=Sophos;i="5.82,290,1613462400"; d="scan'208";a="260631495"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2021 23:27:35 -0700
IronPort-SDR: sxZm4UjqNuJcgMkMGRlXLMGHKy1uXDgxzQw0r6VAUsF6C0Tp6CgtfSXkXrnWebLiWdrZN1cpMo
 zpQUV7qEDb5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,290,1613462400"; d="scan'208";a="391281077"
Received: from icx-2s.bj.intel.com ([10.240.192.119])
 by orsmga003.jf.intel.com with ESMTP; 10 May 2021 23:27:33 -0700
From: Yang Zhong <yang.zhong@intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 04/32] i386: Add 'sgx-epc' device to expose EPC sections to
 guest
Date: Tue, 11 May 2021 14:20:23 +0800
Message-Id: <20210511062051.41948-5-yang.zhong@intel.com>
X-Mailer: git-send-email 2.29.2.334.gfaefdd61ec
In-Reply-To: <20210511062051.41948-1-yang.zhong@intel.com>
References: <20210511062051.41948-1-yang.zhong@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.31; envelope-from=yang.zhong@intel.com;
 helo=mga06.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
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
Cc: yang.zhong@intel.com, pbonzini@redhat.com, kai.huang@intel.com,
 seanjc@google.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Sean Christopherson <sean.j.christopherson@intel.com>

SGX EPC is enumerated through CPUID, i.e. EPC "devices" need to be
realized prior to realizing the vCPUs themselves, which occurs long
before generic devices are parsed and realized.  Because of this,
do not allow 'sgx-epc' devices to be instantiated after vCPUS have
been created.

The 'sgx-epc' device is essentially a placholder at this time, it will
be fully implemented in a future patch along with a dedicated command
to create 'sgx-epc' devices.

Signed-off-by: Sean Christopherson <sean.j.christopherson@intel.com>
Signed-off-by: Yang Zhong <yang.zhong@intel.com>
---
 hw/i386/meson.build       |   1 +
 hw/i386/sgx-epc.c         | 161 ++++++++++++++++++++++++++++++++++++++
 include/hw/i386/sgx-epc.h |  44 +++++++++++
 3 files changed, 206 insertions(+)
 create mode 100644 hw/i386/sgx-epc.c
 create mode 100644 include/hw/i386/sgx-epc.h

diff --git a/hw/i386/meson.build b/hw/i386/meson.build
index e5d109f5c6..087426c75c 100644
--- a/hw/i386/meson.build
+++ b/hw/i386/meson.build
@@ -5,6 +5,7 @@ i386_ss.add(files(
   'e820_memory_layout.c',
   'multiboot.c',
   'x86.c',
+  'sgx-epc.c',
 ))
 
 i386_ss.add(when: 'CONFIG_X86_IOMMU', if_true: files('x86-iommu.c'),
diff --git a/hw/i386/sgx-epc.c b/hw/i386/sgx-epc.c
new file mode 100644
index 0000000000..aa487dea79
--- /dev/null
+++ b/hw/i386/sgx-epc.c
@@ -0,0 +1,161 @@
+/*
+ * SGX EPC device
+ *
+ * Copyright (C) 2019 Intel Corporation
+ *
+ * Authors:
+ *   Sean Christopherson <sean.j.christopherson@intel.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+#include "qemu/osdep.h"
+#include "hw/i386/pc.h"
+#include "hw/i386/sgx-epc.h"
+#include "hw/mem/memory-device.h"
+#include "hw/qdev-properties.h"
+#include "monitor/qdev.h"
+#include "qapi/error.h"
+#include "qapi/visitor.h"
+#include "qemu/config-file.h"
+#include "qemu/error-report.h"
+#include "qemu/option.h"
+#include "qemu/units.h"
+#include "target/i386/cpu.h"
+#include "exec/address-spaces.h"
+
+static Property sgx_epc_properties[] = {
+    DEFINE_PROP_UINT64(SGX_EPC_ADDR_PROP, SGXEPCDevice, addr, 0),
+    DEFINE_PROP_LINK(SGX_EPC_MEMDEV_PROP, SGXEPCDevice, hostmem,
+                     TYPE_MEMORY_BACKEND, HostMemoryBackend *),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void sgx_epc_get_size(Object *obj, Visitor *v, const char *name,
+                             void *opaque, Error **errp)
+{
+    Error *local_err = NULL;
+    uint64_t value;
+
+    value = memory_device_get_region_size(MEMORY_DEVICE(obj), &local_err);
+    if (local_err) {
+        error_propagate(errp, local_err);
+        return;
+    }
+
+    visit_type_uint64(v, name, &value, errp);
+}
+
+static void sgx_epc_init(Object *obj)
+{
+    object_property_add(obj, SGX_EPC_SIZE_PROP, "uint64", sgx_epc_get_size,
+                        NULL, NULL, NULL);
+}
+
+static void sgx_epc_realize(DeviceState *dev, Error **errp)
+{
+    PCMachineState *pcms = PC_MACHINE(qdev_get_machine());
+    X86MachineState *x86ms = X86_MACHINE(pcms);
+    SGXEPCDevice *epc = SGX_EPC(dev);
+    const char *path;
+
+    if (x86ms->boot_cpus != 0) {
+        error_setg(errp, "'" TYPE_SGX_EPC "' can't be created after vCPUs,"
+                         "e.g. via -device");
+        return;
+    }
+
+    if (!epc->hostmem) {
+        error_setg(errp, "'" SGX_EPC_MEMDEV_PROP "' property is not set");
+        return;
+    } else if (host_memory_backend_is_mapped(epc->hostmem)) {
+        path = object_get_canonical_path_component(OBJECT(epc->hostmem));
+        error_setg(errp, "can't use already busy memdev: %s", path);
+        return;
+    }
+
+    error_setg(errp, "'" TYPE_SGX_EPC "' not supported");
+}
+
+static void sgx_epc_unrealize(DeviceState *dev)
+{
+    SGXEPCDevice *epc = SGX_EPC(dev);
+
+    host_memory_backend_set_mapped(epc->hostmem, false);
+}
+
+static uint64_t sgx_epc_md_get_addr(const MemoryDeviceState *md)
+{
+    const SGXEPCDevice *epc = SGX_EPC(md);
+
+    return epc->addr;
+}
+
+static void sgx_epc_md_set_addr(MemoryDeviceState *md, uint64_t addr,
+                                Error **errp)
+{
+    object_property_set_uint(OBJECT(md), SGX_EPC_ADDR_PROP, addr, errp);
+}
+
+static uint64_t sgx_epc_md_get_plugged_size(const MemoryDeviceState *md,
+                                            Error **errp)
+{
+    return 0;
+}
+
+static MemoryRegion *sgx_epc_md_get_memory_region(MemoryDeviceState *md,
+                                                  Error **errp)
+{
+    SGXEPCDevice *epc = SGX_EPC(md);
+
+    if (!epc->hostmem) {
+        error_setg(errp, "'" SGX_EPC_MEMDEV_PROP "' property must be set");
+        return NULL;
+    }
+
+    return host_memory_backend_get_memory(epc->hostmem);
+}
+
+static void sgx_epc_md_fill_device_info(const MemoryDeviceState *md,
+                                        MemoryDeviceInfo *info)
+{
+    /* TODO */
+}
+
+static void sgx_epc_class_init(ObjectClass *oc, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(oc);
+    MemoryDeviceClass *mdc = MEMORY_DEVICE_CLASS(oc);
+
+    dc->hotpluggable = false;
+    dc->realize = sgx_epc_realize;
+    dc->unrealize = sgx_epc_unrealize;
+    dc->desc = "SGX EPC section";
+    device_class_set_props(dc, sgx_epc_properties);
+
+    mdc->get_addr = sgx_epc_md_get_addr;
+    mdc->set_addr = sgx_epc_md_set_addr;
+    mdc->get_plugged_size = sgx_epc_md_get_plugged_size;
+    mdc->get_memory_region = sgx_epc_md_get_memory_region;
+    mdc->fill_device_info = sgx_epc_md_fill_device_info;
+}
+
+static TypeInfo sgx_epc_info = {
+    .name          = TYPE_SGX_EPC,
+    .parent        = TYPE_DEVICE,
+    .instance_size = sizeof(SGXEPCDevice),
+    .instance_init = sgx_epc_init,
+    .class_init    = sgx_epc_class_init,
+    .class_size    = sizeof(DeviceClass),
+    .interfaces = (InterfaceInfo[]) {
+        { TYPE_MEMORY_DEVICE },
+        { }
+    },
+};
+
+static void sgx_epc_register_types(void)
+{
+    type_register_static(&sgx_epc_info);
+}
+
+type_init(sgx_epc_register_types)
diff --git a/include/hw/i386/sgx-epc.h b/include/hw/i386/sgx-epc.h
new file mode 100644
index 0000000000..5fd9ae2d0c
--- /dev/null
+++ b/include/hw/i386/sgx-epc.h
@@ -0,0 +1,44 @@
+/*
+ * SGX EPC device
+ *
+ * Copyright (C) 2019 Intel Corporation
+ *
+ * Authors:
+ *   Sean Christopherson <sean.j.christopherson@intel.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+#ifndef QEMU_SGX_EPC_H
+#define QEMU_SGX_EPC_H
+
+#include "sysemu/hostmem.h"
+
+#define TYPE_SGX_EPC "sgx-epc"
+#define SGX_EPC(obj) \
+    OBJECT_CHECK(SGXEPCDevice, (obj), TYPE_SGX_EPC)
+#define SGX_EPC_CLASS(oc) \
+    OBJECT_CLASS_CHECK(SGXEPCDeviceClass, (oc), TYPE_SGX_EPC)
+#define SGX_EPC_GET_CLASS(obj) \
+    OBJECT_GET_CLASS(SGXEPCDeviceClass, (obj), TYPE_SGX_EPC)
+
+#define SGX_EPC_ADDR_PROP "addr"
+#define SGX_EPC_SIZE_PROP "size"
+#define SGX_EPC_MEMDEV_PROP "memdev"
+
+/**
+ * SGXEPCDevice:
+ * @addr: starting guest physical address, where @SGXEPCDevice is mapped.
+ *         Default value: 0, means that address is auto-allocated.
+ * @hostmem: host memory backend providing memory for @SGXEPCDevice
+ */
+typedef struct SGXEPCDevice {
+    /* private */
+    DeviceState parent_obj;
+
+    /* public */
+    uint64_t addr;
+    HostMemoryBackend *hostmem;
+} SGXEPCDevice;
+
+#endif
-- 
2.29.2.334.gfaefdd61ec


