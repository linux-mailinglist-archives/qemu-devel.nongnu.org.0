Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5404936F5C0
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 08:38:39 +0200 (CEST)
Received: from localhost ([::1]:57536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcMnO-0004nk-AS
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 02:38:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1lcMdr-0004Pt-0A
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 02:28:50 -0400
Received: from mga11.intel.com ([192.55.52.93]:63439)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1lcMdX-00016y-A9
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 02:28:40 -0400
IronPort-SDR: hPRWOkbYO5cZevBdiefckYT/m6Va1ofnF2PO49jzd9RI+R2+Iiad/F3z+3rtSzpN2g1Dak2PlY
 Fw08/4OiCkjw==
X-IronPort-AV: E=McAfee;i="6200,9189,9969"; a="194023054"
X-IronPort-AV: E=Sophos;i="5.82,260,1613462400"; d="scan'208";a="194023054"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2021 23:28:22 -0700
IronPort-SDR: EWHTFQKaUI/wIQNiqslHhPPTLvLb24e3zFnWBuCh0HStWroKgPvbpy+5kUg/kUAGn7o+B/cWv0
 RX4+qb7/HjDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,260,1613462400"; d="scan'208";a="387258444"
Received: from icx-2s.bj.intel.com ([10.240.192.119])
 by orsmga003.jf.intel.com with ESMTP; 29 Apr 2021 23:28:21 -0700
From: Yang Zhong <yang.zhong@intel.com>
To: qemu-devel@nongnu.org
Subject: [RESEND PATCH 05/32] vl: Add "sgx-epc" option to expose SGX EPC
 sections to guest
Date: Fri, 30 Apr 2021 14:24:28 +0800
Message-Id: <20210430062455.8117-6-yang.zhong@intel.com>
X-Mailer: git-send-email 2.29.2.334.gfaefdd61ec
In-Reply-To: <20210430062455.8117-1-yang.zhong@intel.com>
References: <20210430062455.8117-1-yang.zhong@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.93; envelope-from=yang.zhong@intel.com;
 helo=mga11.intel.com
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
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

Signed-off-by: Sean Christopherson <sean.j.christopherson@intel.com>
Signed-off-by: Yang Zhong <yang.zhong@intel.com>
---
 hw/i386/sgx-epc.c         | 104 +++++++++++++++++++++++++++++++++++++-
 include/hw/i386/pc.h      |   6 +++
 include/hw/i386/sgx-epc.h |  16 ++++++
 qemu-options.hx           |   8 +++
 softmmu/globals.c         |   1 +
 softmmu/vl.c              |   9 ++++
 6 files changed, 143 insertions(+), 1 deletion(-)

diff --git a/hw/i386/sgx-epc.c b/hw/i386/sgx-epc.c
index aa487dea79..0858819a71 100644
--- a/hw/i386/sgx-epc.c
+++ b/hw/i386/sgx-epc.c
@@ -56,6 +56,8 @@ static void sgx_epc_realize(DeviceState *dev, Error **errp)
 {
     PCMachineState *pcms = PC_MACHINE(qdev_get_machine());
     X86MachineState *x86ms = X86_MACHINE(pcms);
+    MemoryDeviceState *md = MEMORY_DEVICE(dev);
+    SGXEPCState *sgx_epc = pcms->sgx_epc;
     SGXEPCDevice *epc = SGX_EPC(dev);
     const char *path;
 
@@ -74,7 +76,18 @@ static void sgx_epc_realize(DeviceState *dev, Error **errp)
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
@@ -159,3 +172,92 @@ static void sgx_epc_register_types(void)
 }
 
 type_init(sgx_epc_register_types)
+
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
+static int sgx_epc_init_func(void *opaque, QemuOpts *opts, Error **errp)
+{
+    Error *err = NULL;
+    Object *obj;
+
+    obj = object_new("sgx-epc");
+
+    qdev_set_id(DEVICE(obj), qemu_opts_id(opts));
+
+    if (qemu_opt_foreach(opts, sgx_epc_set_property, obj, &err)) {
+        goto out;
+    }
+
+    object_property_set_bool(obj, "realized", true, &err);
+
+out:
+    if (err != NULL) {
+        error_propagate(errp, err);
+    }
+    object_unref(obj);
+    return err != NULL ? -1 : 0;
+}
+
+void pc_machine_init_sgx_epc(PCMachineState *pcms)
+{
+    SGXEPCState *sgx_epc;
+    X86MachineState *x86ms = X86_MACHINE(pcms);
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
+    qemu_opts_foreach(qemu_find_opts("sgx-epc"), sgx_epc_init_func, NULL,
+                      &error_fatal);
+
+    if ((sgx_epc->base + sgx_epc->size) < sgx_epc->base) {
+        error_report("Size of all 'sgx-epc' =0x%"PRIu64" causes EPC to wrap",
+                     sgx_epc->size);
+        exit(EXIT_FAILURE);
+    }
+
+    memory_region_set_size(&sgx_epc->mr, sgx_epc->size);
+}
+
+static QemuOptsList sgx_epc_opts = {
+    .name = "sgx-epc",
+    .implied_opt_name = "id",
+    .head = QTAILQ_HEAD_INITIALIZER(sgx_epc_opts.head),
+    .desc = {
+        {
+            .name = "id",
+            .type = QEMU_OPT_STRING,
+            .help = "SGX EPC section ID",
+        },{
+            .name = "memdev",
+            .type = QEMU_OPT_STRING,
+            .help = "memory object backend",
+        },
+        { /* end of list */ }
+    },
+};
+
+static void sgx_epc_register_opts(void)
+{
+    qemu_add_opts(&sgx_epc_opts);
+}
+
+opts_init(sgx_epc_register_opts);
diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
index dcf060b791..71e2fc6f26 100644
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
+    SGXEPCState *sgx_epc;
 } PCMachineState;
 
 #define PC_MACHINE_ACPI_DEVICE_PROP "acpi-device"
@@ -197,6 +200,9 @@ bool pc_system_ovmf_table_find(const char *entry, uint8_t **data,
 void pc_madt_cpu_entry(AcpiDeviceIf *adev, int uid,
                        const CPUArchIdList *apic_ids, GArray *entry);
 
+/* sgx-epc.c */
+void pc_machine_init_sgx_epc(PCMachineState *pcms);
+
 extern GlobalProperty pc_compat_5_2[];
 extern const size_t pc_compat_5_2_len;
 
diff --git a/include/hw/i386/sgx-epc.h b/include/hw/i386/sgx-epc.h
index 5fd9ae2d0c..1f7dd17c17 100644
--- a/include/hw/i386/sgx-epc.h
+++ b/include/hw/i386/sgx-epc.h
@@ -41,4 +41,20 @@ typedef struct SGXEPCDevice {
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
+extern int sgx_epc_enabled;
+
 #endif
diff --git a/qemu-options.hx b/qemu-options.hx
index fd21002bd6..262c3084af 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -532,6 +532,14 @@ SRST
     Preallocate memory when using -mem-path.
 ERST
 
+DEF("sgx-epc", HAS_ARG, QEMU_OPTION_sgx_epc,
+    "-sgx-epc memdev=memid[,id=epcid]\n",
+    QEMU_ARCH_I386)
+SRST
+``-sgx-epc memdev=@var{memid}[,id=@var{epcid}]``
+    Define an SGX EPC section.
+ERST
+
 DEF("k", HAS_ARG, QEMU_OPTION_k,
     "-k language     use keyboard layout (for example 'fr' for French)\n",
     QEMU_ARCH_ALL)
diff --git a/softmmu/globals.c b/softmmu/globals.c
index 7d0fc81183..d3029953ce 100644
--- a/softmmu/globals.c
+++ b/softmmu/globals.c
@@ -70,3 +70,4 @@ bool qemu_uuid_set;
 uint32_t xen_domid;
 enum xen_mode xen_mode = XEN_EMULATE;
 bool xen_domid_restrict;
+int sgx_epc_enabled;
diff --git a/softmmu/vl.c b/softmmu/vl.c
index aadb526138..0c7e9fab78 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -74,6 +74,7 @@
 #include "hw/block/block.h"
 #include "hw/i386/x86.h"
 #include "hw/i386/pc.h"
+#include "hw/i386/sgx-epc.h"
 #include "migration/misc.h"
 #include "migration/snapshot.h"
 #include "sysemu/tpm.h"
@@ -2891,6 +2892,14 @@ void qemu_init(int argc, char **argv, char **envp)
             case QEMU_OPTION_mem_prealloc:
                 mem_prealloc = 1;
                 break;
+            case QEMU_OPTION_sgx_epc:
+                opts = qemu_opts_parse_noisily(qemu_find_opts("sgx-epc"),
+                                               optarg, false);
+                if (!opts) {
+                    exit(1);
+                }
+                sgx_epc_enabled = 1;
+                break;
             case QEMU_OPTION_d:
                 log_mask = optarg;
                 break;
-- 
2.29.2.334.gfaefdd61ec


