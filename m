Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3926A83959
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Aug 2019 21:06:33 +0200 (CEST)
Received: from localhost ([::1]:35832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hv4n2-0007Cs-G3
	for lists+qemu-devel@lfdr.de; Tue, 06 Aug 2019 15:06:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41169)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <sean.j.christopherson@intel.com>) id 1hv4dz-0004Oq-52
 for qemu-devel@nongnu.org; Tue, 06 Aug 2019 14:57:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <sean.j.christopherson@intel.com>) id 1hv4dw-00074G-Fu
 for qemu-devel@nongnu.org; Tue, 06 Aug 2019 14:57:11 -0400
Received: from mga14.intel.com ([192.55.52.115]:31803)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <sean.j.christopherson@intel.com>)
 id 1hv4dv-0006z4-OC
 for qemu-devel@nongnu.org; Tue, 06 Aug 2019 14:57:08 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 06 Aug 2019 11:57:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,353,1559545200"; d="scan'208";a="176715068"
Received: from sjchrist-coffee.jf.intel.com ([10.54.74.41])
 by orsmga003.jf.intel.com with ESMTP; 06 Aug 2019 11:56:59 -0700
From: Sean Christopherson <sean.j.christopherson@intel.com>
To: Eduardo Habkost <ehabkost@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
 Cornelia Huck <cohuck@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>
Date: Tue,  6 Aug 2019 11:56:32 -0700
Message-Id: <20190806185649.2476-4-sean.j.christopherson@intel.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190806185649.2476-1-sean.j.christopherson@intel.com>
References: <20190806185649.2476-1-sean.j.christopherson@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 192.55.52.115
Subject: [Qemu-devel] [RFC PATCH 03/20] vl: Add "sgx-epc" option to expose
 SGX EPC sections to guest
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
Cc: qemu-devel@nongnu.org, kvm@vger.kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

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
---
 hw/i386/sgx-epc.c         | 107 +++++++++++++++++++++++++++++++++++++-
 include/hw/i386/pc.h      |   3 ++
 include/hw/i386/sgx-epc.h |  18 +++++++
 qemu-options.hx           |  12 +++++
 vl.c                      |   9 ++++
 5 files changed, 148 insertions(+), 1 deletion(-)

diff --git a/hw/i386/sgx-epc.c b/hw/i386/sgx-epc.c
index 73221ba86b..09aba1f8ea 100644
--- a/hw/i386/sgx-epc.c
+++ b/hw/i386/sgx-epc.c
@@ -53,6 +53,8 @@ static void sgx_epc_init(Object *obj)
 static void sgx_epc_realize(DeviceState *dev, Error **errp)
 {
     PCMachineState *pcms = PC_MACHINE(qdev_get_machine());
+    MemoryDeviceState *md = MEMORY_DEVICE(dev);
+    SGXEPCState *sgx_epc = pcms->sgx_epc;
     SGXEPCDevice *epc = SGX_EPC(dev);
 
     if (pcms->boot_cpus != 0) {
@@ -71,7 +73,18 @@ static void sgx_epc_realize(DeviceState *dev, Error **errp)
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
 
 static void sgx_epc_unrealize(DeviceState *dev, Error **errp)
@@ -167,3 +180,95 @@ static void sgx_epc_register_types(void)
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
+    object_property_parse(obj, value, name, &err);
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
+    object_property_set_bool(obj, true, "realized", &err);
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
+
+    if (!sgx_epc_enabled) {
+        return;
+    }
+
+    sgx_epc = g_malloc0(sizeof(*sgx_epc));
+    pcms->sgx_epc = sgx_epc;
+
+    sgx_epc->base = 0x100000000ULL + pcms->above_4g_mem_size;
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
index 859b64c51d..bb9071c3bd 100644
--- a/include/hw/i386/pc.h
+++ b/include/hw/i386/pc.h
@@ -8,6 +8,7 @@
 #include "hw/block/flash.h"
 #include "net/net.h"
 #include "hw/i386/ioapic.h"
+#include "hw/i386/sgx-epc.h"
 
 #include "qemu/range.h"
 #include "qemu/bitmap.h"
@@ -69,6 +70,8 @@ struct PCMachineState {
     /* Address space used by IOAPIC device. All IOAPIC interrupts
      * will be translated to MSI messages in the address space. */
     AddressSpace *ioapic_as;
+
+    SGXEPCState *sgx_epc;
 };
 
 #define PC_MACHINE_ACPI_DEVICE_PROP "acpi-device"
diff --git a/include/hw/i386/sgx-epc.h b/include/hw/i386/sgx-epc.h
index 5fd9ae2d0c..562c66148f 100644
--- a/include/hw/i386/sgx-epc.h
+++ b/include/hw/i386/sgx-epc.h
@@ -41,4 +41,22 @@ typedef struct SGXEPCDevice {
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
+void pc_machine_init_sgx_epc(PCMachineState *pcms);
+
 #endif
diff --git a/qemu-options.hx b/qemu-options.hx
index 9621e934c0..8e83dbddbd 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -103,6 +103,9 @@ NOTE: this parameter is deprecated. Please use @option{-global}
 @option{migration.send-configuration}=@var{on|off} instead.
 @item memory-encryption=@var{}
 Memory encryption object to use. The default is none.
+@item epc=size
+Defines the maximum size of the guest's SGX EPC, required for running
+SGX enclaves in the guest.  The default is 0.
 @end table
 ETEXI
 
@@ -394,6 +397,15 @@ STEXI
 Preallocate memory when using -mem-path.
 ETEXI
 
+DEF("sgx-epc", HAS_ARG, QEMU_OPTION_sgx_epc,
+    "-sgx-epc memdev=memid[,id=epcid]\n",
+    QEMU_ARCH_I386)
+STEXI
+@item -sgx-epc memdev=@var{memid}[,id=@var{epcid}]
+@findex -sgx-epc
+Define an SGX EPC section.
+ETEXI
+
 DEF("k", HAS_ARG, QEMU_OPTION_k,
     "-k language     use keyboard layout (for example 'fr' for French)\n",
     QEMU_ARCH_ALL)
diff --git a/vl.c b/vl.c
index b426b32134..8d3621ec4d 100644
--- a/vl.c
+++ b/vl.c
@@ -141,6 +141,7 @@ const char* keyboard_layout = NULL;
 ram_addr_t ram_size;
 const char *mem_path = NULL;
 int mem_prealloc = 0; /* force preallocation of physical target memory */
+int sgx_epc_enabled;
 bool enable_mlock = false;
 bool enable_cpu_pm = false;
 int nb_nics;
@@ -3193,6 +3194,14 @@ int main(int argc, char **argv, char **envp)
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
2.22.0


