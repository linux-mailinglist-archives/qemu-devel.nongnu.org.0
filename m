Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13CFD401C39
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Sep 2021 15:24:59 +0200 (CEST)
Received: from localhost ([::1]:51524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNEcL-0001M1-W5
	for lists+qemu-devel@lfdr.de; Mon, 06 Sep 2021 09:24:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mNEPQ-0000n4-0a
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 09:11:37 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:37845)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mNEPF-0007XX-Cn
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 09:11:35 -0400
Received: by mail-wr1-x42a.google.com with SMTP id v10so9797576wrd.4
 for <qemu-devel@nongnu.org>; Mon, 06 Sep 2021 06:11:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Fteikzbi+eW+yBRFLwBCBCGyqxhgFxorzPuFFkZl4zQ=;
 b=WzCjx347vok1ZtGHQ5ddrTtqnu198hOUDPNjwAkzXcJmn3iabq6jS/jGsKKndiB6X/
 cFGmL+ysookUDYB1+Wj2duooaaSyeiDHhaPxtFdrqgBdapMfzt9BnYjGHYnjwzyBZ9tr
 u8IcSxzi0xvoa25o5KVId//XSvkJPdydUFlNlo0sxSYIDxma21GaJhNDBNK/YJlKKdwf
 e6zyKlx8sYvJpIqCPgCSQirtpUpQUvImVviIL5h5L1CoNZvOSmzjXCcImKxRpAHQUgIK
 XTl0d3MLNEgf24uiD9BvfUT/fHCBBO4+uQukoHXjKRG/wNjq49KOdlds3kG6Mr3VNKpA
 ywDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Fteikzbi+eW+yBRFLwBCBCGyqxhgFxorzPuFFkZl4zQ=;
 b=g9LUck07LzuZ/XjzgUYEZj2l2TYXDh9yB8s2gC0qpEOCSkRyACeomPhG8Ub3G32QCu
 EN9JxAOe/KnbtjyEpO1wf5orZ3ccnwgKE+mc/h4gCw3ZpAXoqL7RTuSIZSsFZYJSU8lq
 PwbvuajLE70KC4jn0uEHvq3ZYfuFvBQdBQ/4iOcjuT+JZzNVCdbZPCoMB3yVngWCq0GH
 ni6spyqOkE8JKu3YHu7EoS22Pf9scklQI9ZZfpNPtLxopb42YvBrV+JvaFfrTJJbCTD6
 p5ZeaqZl8sV09JfXZ9ignoLDPtIUeWP0ROmP7TtBFRhVCpKkUfglrHVKoPflp0cuz8cn
 Qnbg==
X-Gm-Message-State: AOAM531tSFncsAEesGrokD7/6BJQallyxLe/U46BfQXyGZBWB4CZ7Yam
 r/7+G5gMRsWdBVWL8sDKDxPtzG5OEHk=
X-Google-Smtp-Source: ABdhPJydmwLVTRVKlpTlYRjpg6QYtlv9A6XtTH/al+0rEkFJE0RkQmOOkk1KsRhFiu/hdN2USQhqMg==
X-Received: by 2002:adf:e604:: with SMTP id p4mr13464395wrm.37.1630933883958; 
 Mon, 06 Sep 2021 06:11:23 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 k4sm7992331wrm.74.2021.09.06.06.11.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Sep 2021 06:11:23 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 13/36] vl: Add sgx compound properties to expose SGX EPC
 sections to guest
Date: Mon,  6 Sep 2021 15:10:36 +0200
Message-Id: <20210906131059.55234-14-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210906131059.55234-1-pbonzini@redhat.com>
References: <20210906131059.55234-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: 7
X-Spam_score: 0.7
X-Spam_bar: /
X-Spam_report: (0.7 / 5.0 requ) DKIM_INVALID=0.1, DKIM_SIGNED=0.1,
 FREEMAIL_FORGED_FROMDOMAIN=0.25, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Yang Zhong <yang.zhong@intel.com>,
 Sean Christopherson <sean.j.christopherson@intel.com>
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
 -object memory-backend-epc,id=mem1,size=28M,prealloc=on \
 -object memory-backend-epc,id=mem2,size=10M \
 -M sgx-epc.0.memdev=mem1,sgx-epc.1.memdev=mem2

Signed-off-by: Sean Christopherson <sean.j.christopherson@intel.com>
Signed-off-by: Yang Zhong <yang.zhong@intel.com>

v3-->v4:
  - Moved sgx compound property setter/getter from MachineState
    to X86MachineState(Paolo).
  - Re-defined struct SgxEPC, removed 'id' property and added struct
    SgxEPCList for sgx-epc.0.{memdev}(Paolo).
  - Removed g_malloc0(), and changed the 'SGXEPCState *sgx_epc' to
    'SGXEPCState sgx_epc' in struct PCMachineState(Paolo).
  - Changed the SGX compound property cmdline from sgx-epc.{memdev}.0
    to sgx-epc.0.{memdev}(Paolo).

v2-->v3:
   - Removed the QemuOptsList for sgx-epc virtual device and used the '-M' to
     replace '-sgx-epc' with compound properties(Paolo).
Message-Id: <20210719112136.57018-6-yang.zhong@intel.com>

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/i386/meson.build       |  1 +
 hw/i386/sgx-epc.c         | 20 ++++++++----
 hw/i386/sgx.c             | 67 +++++++++++++++++++++++++++++++++++++++
 hw/i386/x86.c             | 29 +++++++++++++++++
 include/hw/i386/pc.h      |  6 ++++
 include/hw/i386/sgx-epc.h | 14 ++++++++
 include/hw/i386/x86.h     |  1 +
 qapi/machine.json         | 26 +++++++++++++++
 qemu-options.hx           | 10 ++++--
 9 files changed, 166 insertions(+), 8 deletions(-)
 create mode 100644 hw/i386/sgx.c

diff --git a/hw/i386/meson.build b/hw/i386/meson.build
index 27476b36bb..fefce9e4ba 100644
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
index aa487dea79..924dea22f0 100644
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
+    SGXEPCState *sgx_epc = &pcms->sgx_epc;
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
index 0000000000..e77deb0b00
--- /dev/null
+++ b/hw/i386/sgx.c
@@ -0,0 +1,67 @@
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
+    SGXEPCState *sgx_epc = &pcms->sgx_epc;
+    X86MachineState *x86ms = X86_MACHINE(pcms);
+    Error *err = NULL;
+    SgxEPCList *list = NULL;
+    Object *obj;
+
+    memset(sgx_epc, 0, sizeof(SGXEPCState));
+    sgx_epc->base = 0x100000000ULL + x86ms->above_4g_mem_size;
+
+    memory_region_init(&sgx_epc->mr, OBJECT(pcms), "sgx-epc", UINT64_MAX);
+    memory_region_add_subregion(get_system_memory(), sgx_epc->base,
+                                &sgx_epc->mr);
+
+    for (list = x86ms->sgx_epc_list; list; list = list->next) {
+        obj = object_new("sgx-epc");
+
+        /* set the memdev link with memory backend */
+        sgx_epc_set_property(obj, SGX_EPC_MEMDEV_PROP, list->value->memdev,
+                             &err);
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
diff --git a/hw/i386/x86.c b/hw/i386/x86.c
index 00448ed55a..41ef9a84a9 100644
--- a/hw/i386/x86.c
+++ b/hw/i386/x86.c
@@ -30,6 +30,8 @@
 #include "qapi/error.h"
 #include "qapi/qmp/qerror.h"
 #include "qapi/qapi-visit-common.h"
+#include "qapi/clone-visitor.h"
+#include "qapi/qapi-visit-machine.h"
 #include "qapi/visitor.h"
 #include "sysemu/qtest.h"
 #include "sysemu/whpx.h"
@@ -1263,6 +1265,27 @@ static void x86_machine_set_bus_lock_ratelimit(Object *obj, Visitor *v,
     visit_type_uint64(v, name, &x86ms->bus_lock_ratelimit, errp);
 }
 
+static void machine_get_sgx_epc(Object *obj, Visitor *v, const char *name,
+                                void *opaque, Error **errp)
+{
+    X86MachineState *x86ms = X86_MACHINE(obj);
+    SgxEPCList *list = x86ms->sgx_epc_list;
+
+    visit_type_SgxEPCList(v, name, &list, errp);
+}
+
+static void machine_set_sgx_epc(Object *obj, Visitor *v, const char *name,
+                                void *opaque, Error **errp)
+{
+    X86MachineState *x86ms = X86_MACHINE(obj);
+    SgxEPCList *list;
+
+    list = x86ms->sgx_epc_list;
+    visit_type_SgxEPCList(v, name, &x86ms->sgx_epc_list, errp);
+
+    qapi_free_SgxEPCList(list);
+}
+
 static void x86_machine_initfn(Object *obj)
 {
     X86MachineState *x86ms = X86_MACHINE(obj);
@@ -1322,6 +1345,12 @@ static void x86_machine_class_init(ObjectClass *oc, void *data)
                                 x86_machine_set_bus_lock_ratelimit, NULL, NULL);
     object_class_property_set_description(oc, X86_MACHINE_BUS_LOCK_RATELIMIT,
             "Set the ratelimit for the bus locks acquired in VMs");
+
+    object_class_property_add(oc, "sgx-epc", "SgxEPC",
+        machine_get_sgx_epc, machine_set_sgx_epc,
+        NULL, NULL);
+    object_class_property_set_description(oc, "sgx-epc",
+        "SGX EPC device");
 }
 
 static const TypeInfo x86_machine_info = {
diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
index 97b4ab79b5..b274179307 100644
--- a/include/hw/i386/pc.h
+++ b/include/hw/i386/pc.h
@@ -12,6 +12,7 @@
 #include "hw/acpi/acpi_dev_interface.h"
 #include "hw/hotplug.h"
 #include "qom/object.h"
+#include "hw/i386/sgx-epc.h"
 
 #define HPET_INTCAP "hpet-intcap"
 
@@ -53,6 +54,8 @@ typedef struct PCMachineState {
 
     /* ACPI Memory hotplug IO base address */
     hwaddr memhp_io_base;
+
+    SGXEPCState sgx_epc;
 } PCMachineState;
 
 #define PC_MACHINE_ACPI_DEVICE_PROP "acpi-device"
@@ -202,6 +205,9 @@ extern const size_t pc_compat_6_1_len;
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
diff --git a/include/hw/i386/x86.h b/include/hw/i386/x86.h
index 6e9244a82c..23267a3674 100644
--- a/include/hw/i386/x86.h
+++ b/include/hw/i386/x86.h
@@ -62,6 +62,7 @@ struct X86MachineState {
     unsigned pci_irq_mask;
     unsigned apic_id_limit;
     uint16_t boot_cpus;
+    SgxEPCList *sgx_epc_list;
 
     OnOffAuto smm;
     OnOffAuto acpi;
diff --git a/qapi/machine.json b/qapi/machine.json
index 157712f006..10d36da83f 100644
--- a/qapi/machine.json
+++ b/qapi/machine.json
@@ -1194,6 +1194,32 @@
           }
 }
 
+##
+# @SgxEPC:
+#
+# Sgx EPC cmdline information
+#
+# @memdev: memory backend linked with device
+#
+# Since: 6.1
+##
+{ 'struct': 'SgxEPC',
+  'data': { 'memdev': 'str' }
+}
+
+##
+# @SgxEPCProperties:
+#
+# Properties for SgxEPC objects.
+#
+# @sgx-epc: sgx epc section properties.
+#
+# Since: 6.1
+##
+{ 'struct': 'SgxEPCProperties',
+  'data': { 'sgx-epc': ['SgxEPC'] }
+}
+
 ##
 # @MemoryDeviceInfo:
 #
diff --git a/qemu-options.hx b/qemu-options.hx
index 4a9ee722c9..c39705b45e 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -126,8 +126,14 @@ SRST
             -m 512M
 ERST
 
-HXCOMM Deprecated by -machine
-DEF("M", HAS_ARG, QEMU_OPTION_M, "", QEMU_ARCH_ALL)
+DEF("M", HAS_ARG, QEMU_OPTION_M,
+    "                sgx-epc.0.memdev=memid\n",
+    QEMU_ARCH_ALL)
+
+SRST
+``sgx-epc.0.memdev=@var{memid}``
+    Define an SGX EPC section.
+ERST
 
 DEF("cpu", HAS_ARG, QEMU_OPTION_cpu,
     "-cpu cpu        select CPU ('-cpu help' for list)\n", QEMU_ARCH_ALL)
-- 
2.31.1



