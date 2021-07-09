Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC6093C22AC
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 13:18:10 +0200 (CEST)
Received: from localhost ([::1]:55770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1oWH-0002Zz-QD
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 07:18:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1m1oSd-0005o8-QQ
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 07:14:23 -0400
Received: from mga06.intel.com ([134.134.136.31]:37155)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1m1oSb-0004xl-DE
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 07:14:23 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10039"; a="270800769"
X-IronPort-AV: E=Sophos;i="5.84,226,1620716400"; d="scan'208";a="270800769"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2021 04:14:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,226,1620716400"; d="scan'208";a="428730155"
Received: from icx-2s.bj.intel.com ([10.240.192.119])
 by orsmga002.jf.intel.com with ESMTP; 09 Jul 2021 04:14:18 -0700
From: Yang Zhong <yang.zhong@intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 05/33] vl: Add sgx compound properties to expose SGX EPC
 sections to guest
Date: Fri,  9 Jul 2021 19:09:27 +0800
Message-Id: <20210709110955.73256-6-yang.zhong@intel.com>
X-Mailer: git-send-email 2.29.2.334.gfaefdd61ec
In-Reply-To: <20210709110955.73256-1-yang.zhong@intel.com>
References: <20210709110955.73256-1-yang.zhong@intel.com>
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
Cc: yang.zhong@intel.com, seanjc@google.com, kai.huang@intel.com,
 jarkko@kernel.org, pbonzini@redhat.com, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Sean Christopherson <sean.j.christopherson@intel.com>

Because SGX EPC is enumerated through CPUID, EPC "devices" need to be
realized prior to realizing the vCPUs themselves, i.e. long before
generic devices are parsed and realized.  From a virtualization
perspective, the CPUID aspect also means that EPC sections cannot be
hotplugged without paravirtualizing the guest kernel (hardware does
not support hotplugging as EPC sections must be locked down during
pre-boot to provide EPC's security properties).

So even though EPC sections could be realized through the generic
-devices command, they need to be created much earlier for them to
actually be usable by the guest.  Place all EPC sections in a
contiguous block, somewhat arbitrarily starting after RAM above 4g.
Ensuring EPC is in a contiguous region simplifies calculations, e.g.
device memory base, PCI hole, etc..., allows dynamic calculation of the
total EPC size, e.g. exposing EPC to guests does not require -maxmem,
and last but not least allows all of EPC to be enumerated in a single
ACPI entry, which is expected by some kernels, e.g. Windows 7 and 8.

The new compound properties command for sgx like below:
 ......
 -object memory-backend-epc,id=mem1,size=28M \
 -object memory-backend-epc,id=mem2,size=10M \
 -M sgx-epc.id.0=epc1,sgx-epc.memdev.0=mem1,sgx-epc.id.1=epc2,sgx-epc.memdev.1=mem2

Signed-off-by: Sean Christopherson <sean.j.christopherson@intel.com>
Signed-off-by: Yang Zhong <yang.zhong@intel.com>

v2-->v3:
   - Removed the QemuOptsList for sgx-epc virtual device and used the '-M' to
     replace '-sgx-epc' with compound properties(Paolo).
---
 hw/core/machine.c         | 36 ++++++++++++++++++++
 hw/i386/meson.build       |  1 +
 hw/i386/sgx-epc.c         | 20 +++++++----
 hw/i386/sgx.c             | 72 +++++++++++++++++++++++++++++++++++++++
 include/hw/boards.h       |  1 +
 include/hw/i386/pc.h      |  6 ++++
 include/hw/i386/sgx-epc.h | 14 ++++++++
 qapi/machine.json         | 17 +++++++++
 qemu-options.hx           | 10 ++++--
 9 files changed, 169 insertions(+), 8 deletions(-)
 create mode 100644 hw/i386/sgx.c

diff --git a/hw/core/machine.c b/hw/core/machine.c
index 57c18f909a..6090167d6a 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -21,6 +21,7 @@
 #include "qapi/qapi-visit-common.h"
 #include "qapi/qapi-visit-machine.h"
 #include "qapi/visitor.h"
+#include "qapi/clone-visitor.h"
 #include "hw/sysbus.h"
 #include "sysemu/cpus.h"
 #include "sysemu/sysemu.h"
@@ -851,6 +852,35 @@ out_free:
     qapi_free_SMPConfiguration(config);
 }
 
+static void machine_get_sgx_epc(Object *obj, Visitor *v, const char *name,
+                                void *opaque, Error **errp)
+{
+    MachineState *ms = MACHINE(obj);
+    SgxEPC *sgx = &(SgxEPC){
+        .id = ms->sgx_epc.id,
+        .memdev = ms->sgx_epc.memdev,
+    };
+
+    if (!visit_type_SgxEPC(v, name, &sgx, errp)) {
+        return;
+    }
+}
+
+static void machine_set_sgx_epc(Object *obj, Visitor *v, const char *name,
+                                void *opaque, Error **errp)
+{
+    MachineState *ms = MACHINE(obj);
+    SgxEPC *sgx;
+
+    if (!visit_type_SgxEPC(v, name, &sgx, errp)) {
+        return;
+    }
+
+    ms->sgx_epc.id = QAPI_CLONE(strList, sgx->id);
+    ms->sgx_epc.memdev = QAPI_CLONE(strList, sgx->memdev);
+    qapi_free_SgxEPC(sgx);
+}
+
 static void machine_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
@@ -956,6 +986,12 @@ static void machine_class_init(ObjectClass *oc, void *data)
     object_class_property_set_description(oc, "memory-backend",
                                           "Set RAM backend"
                                           "Valid value is ID of hostmem based backend");
+
+    object_class_property_add(oc, "sgx-epc", "SgxEPC",
+        machine_get_sgx_epc, machine_set_sgx_epc,
+        NULL, NULL);
+    object_class_property_set_description(oc, "sgx-epc",
+        "SGX EPC device");
 }
 
 static void machine_class_base_init(ObjectClass *oc, void *data)
diff --git a/hw/i386/meson.build b/hw/i386/meson.build
index 087426c75c..cafc487e22 100644
--- a/hw/i386/meson.build
+++ b/hw/i386/meson.build
@@ -6,6 +6,7 @@ i386_ss.add(files(
   'multiboot.c',
   'x86.c',
   'sgx-epc.c',
+  'sgx.c'
 ))
 
 i386_ss.add(when: 'CONFIG_X86_IOMMU', if_true: files('x86-iommu.c'),
diff --git a/hw/i386/sgx-epc.c b/hw/i386/sgx-epc.c
index aa487dea79..904531107a 100644
--- a/hw/i386/sgx-epc.c
+++ b/hw/i386/sgx-epc.c
@@ -14,13 +14,8 @@
 #include "hw/i386/sgx-epc.h"
 #include "hw/mem/memory-device.h"
 #include "hw/qdev-properties.h"
-#include "monitor/qdev.h"
 #include "qapi/error.h"
 #include "qapi/visitor.h"
-#include "qemu/config-file.h"
-#include "qemu/error-report.h"
-#include "qemu/option.h"
-#include "qemu/units.h"
 #include "target/i386/cpu.h"
 #include "exec/address-spaces.h"
 
@@ -56,6 +51,8 @@ static void sgx_epc_realize(DeviceState *dev, Error **errp)
 {
     PCMachineState *pcms = PC_MACHINE(qdev_get_machine());
     X86MachineState *x86ms = X86_MACHINE(pcms);
+    MemoryDeviceState *md = MEMORY_DEVICE(dev);
+    SGXEPCState *sgx_epc = pcms->sgx_epc;
     SGXEPCDevice *epc = SGX_EPC(dev);
     const char *path;
 
@@ -74,7 +71,18 @@ static void sgx_epc_realize(DeviceState *dev, Error **errp)
         return;
     }
 
-    error_setg(errp, "'" TYPE_SGX_EPC "' not supported");
+    epc->addr = sgx_epc->base + sgx_epc->size;
+
+    memory_region_add_subregion(&sgx_epc->mr, epc->addr - sgx_epc->base,
+                                host_memory_backend_get_memory(epc->hostmem));
+
+    host_memory_backend_set_mapped(epc->hostmem, true);
+
+    sgx_epc->sections = g_renew(SGXEPCDevice *, sgx_epc->sections,
+                                sgx_epc->nr_sections + 1);
+    sgx_epc->sections[sgx_epc->nr_sections++] = epc;
+
+    sgx_epc->size += memory_device_get_region_size(md, errp);
 }
 
 static void sgx_epc_unrealize(DeviceState *dev)
diff --git a/hw/i386/sgx.c b/hw/i386/sgx.c
new file mode 100644
index 0000000000..3f85fb1089
--- /dev/null
+++ b/hw/i386/sgx.c
@@ -0,0 +1,72 @@
+/*
+ * SGX common code
+ *
+ * Copyright (C) 2021 Intel Corporation
+ *
+ * Authors:
+ *   Yang Zhong<yang.zhong@intel.com>
+ *   Sean Christopherson <sean.j.christopherson@intel.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+#include "qemu/osdep.h"
+#include "hw/i386/pc.h"
+#include "hw/i386/sgx-epc.h"
+#include "hw/mem/memory-device.h"
+#include "monitor/qdev.h"
+#include "qapi/error.h"
+#include "exec/address-spaces.h"
+
+static int sgx_epc_set_property(void *opaque, const char *name,
+                                const char *value, Error **errp)
+{
+    Object *obj = opaque;
+    Error *err = NULL;
+
+    object_property_parse(obj, name, value, &err);
+    if (err != NULL) {
+        error_propagate(errp, err);
+        return -1;
+    }
+    return 0;
+}
+
+void pc_machine_init_sgx_epc(PCMachineState *pcms)
+{
+    SGXEPCState *sgx_epc;
+    X86MachineState *x86ms = X86_MACHINE(pcms);
+    MachineState *ms = MACHINE(qdev_get_machine());
+    Error *err = NULL;
+    strList *mdev = NULL;
+    strList *id = NULL;
+    Object *obj;
+
+    sgx_epc = g_malloc0(sizeof(*sgx_epc));
+    pcms->sgx_epc = sgx_epc;
+
+    sgx_epc->base = 0x100000000ULL + x86ms->above_4g_mem_size;
+
+    memory_region_init(&sgx_epc->mr, OBJECT(pcms), "sgx-epc", UINT64_MAX);
+    memory_region_add_subregion(get_system_memory(), sgx_epc->base,
+                                &sgx_epc->mr);
+
+    for (mdev = ms->sgx_epc.memdev, id = ms->sgx_epc.id; mdev;
+         mdev = mdev->next, id = id->next) {
+        obj = object_new("sgx-epc");
+        qdev_set_id(DEVICE(obj), id->value);
+
+        /* set the memdev link with memory backend */
+        sgx_epc_set_property(obj, SGX_EPC_MEMDEV_PROP, mdev->value, &err);
+        object_property_set_bool(obj, "realized", true, &err);
+        object_unref(obj);
+    }
+
+    if ((sgx_epc->base + sgx_epc->size) < sgx_epc->base) {
+        error_report("Size of all 'sgx-epc' =0x%"PRIu64" causes EPC to wrap",
+                     sgx_epc->size);
+        exit(EXIT_FAILURE);
+    }
+
+    memory_region_set_size(&sgx_epc->mr, sgx_epc->size);
+}
diff --git a/include/hw/boards.h b/include/hw/boards.h
index accd6eff35..fcd7c540f4 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -332,6 +332,7 @@ struct MachineState {
     AccelState *accelerator;
     CPUArchIdList *possible_cpus;
     CpuTopology smp;
+    SgxEPC sgx_epc;
     struct NVDIMMState *nvdimms_state;
     struct NumaState *numa_state;
 };
diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
index 87294f2632..c22f5eded6 100644
--- a/include/hw/i386/pc.h
+++ b/include/hw/i386/pc.h
@@ -12,6 +12,7 @@
 #include "hw/acpi/acpi_dev_interface.h"
 #include "hw/hotplug.h"
 #include "qom/object.h"
+#include "hw/i386/sgx-epc.h"
 
 #define HPET_INTCAP "hpet-intcap"
 
@@ -52,6 +53,8 @@ typedef struct PCMachineState {
 
     /* ACPI Memory hotplug IO base address */
     hwaddr memhp_io_base;
+
+    SGXEPCState *sgx_epc;
 } PCMachineState;
 
 #define PC_MACHINE_ACPI_DEVICE_PROP "acpi-device"
@@ -197,6 +200,9 @@ void pc_madt_cpu_entry(AcpiDeviceIf *adev, int uid,
 extern GlobalProperty pc_compat_6_0[];
 extern const size_t pc_compat_6_0_len;
 
+/* sgx-epc.c */
+void pc_machine_init_sgx_epc(PCMachineState *pcms);
+
 extern GlobalProperty pc_compat_5_2[];
 extern const size_t pc_compat_5_2_len;
 
diff --git a/include/hw/i386/sgx-epc.h b/include/hw/i386/sgx-epc.h
index 5fd9ae2d0c..2b2490892b 100644
--- a/include/hw/i386/sgx-epc.h
+++ b/include/hw/i386/sgx-epc.h
@@ -41,4 +41,18 @@ typedef struct SGXEPCDevice {
     HostMemoryBackend *hostmem;
 } SGXEPCDevice;
 
+/*
+ * @base: address in guest physical address space where EPC regions start
+ * @mr: address space container for memory devices
+ */
+typedef struct SGXEPCState {
+    uint64_t base;
+    uint64_t size;
+
+    MemoryRegion mr;
+
+    struct SGXEPCDevice **sections;
+    int nr_sections;
+} SGXEPCState;
+
 #endif
diff --git a/qapi/machine.json b/qapi/machine.json
index c3210ee1fb..39ccbea894 100644
--- a/qapi/machine.json
+++ b/qapi/machine.json
@@ -1194,6 +1194,23 @@
           }
 }
 
+##
+# @SgxEPC:
+#
+# Sgx EPC cmdline information
+#
+# @id: device's ID
+#
+# @memdev: memory backend linked with device
+#
+# Since: 6.1
+##
+{ 'struct': 'SgxEPC',
+  'data': { 'id': [ 'str' ],
+            'memdev': [ 'str' ]
+          }
+}
+
 ##
 # @MemoryDeviceInfo:
 #
diff --git a/qemu-options.hx b/qemu-options.hx
index 8965dabc83..47dfc81e8d 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -122,8 +122,14 @@ SRST
         -m 512M
 ERST
 
-HXCOMM Deprecated by -machine
-DEF("M", HAS_ARG, QEMU_OPTION_M, "", QEMU_ARCH_ALL)
+DEF("M", HAS_ARG, QEMU_OPTION_M,
+    "                sgx-epc.id.0=epcid,sgx-epc.memdev.0=memid\n",
+    QEMU_ARCH_ALL)
+
+SRST
+``sgx-epc.id.0=@var{epcid},sgx-epc.memdev.0=@var{memid}``
+    Define an SGX EPC section.
+ERST
 
 DEF("cpu", HAS_ARG, QEMU_OPTION_cpu,
     "-cpu cpu        select CPU ('-cpu help' for list)\n", QEMU_ARCH_ALL)
-- 
2.29.2.334.gfaefdd61ec


