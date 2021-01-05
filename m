Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 603FE2EB113
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jan 2021 18:11:19 +0100 (CET)
Received: from localhost ([::1]:49862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwpra-0003sN-DS
	for lists+qemu-devel@lfdr.de; Tue, 05 Jan 2021 12:11:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben.widawsky@intel.com>)
 id 1kwpbP-0000Hk-MT
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 11:54:36 -0500
Received: from mga18.intel.com ([134.134.136.126]:10374)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben.widawsky@intel.com>)
 id 1kwpbI-00016I-5k
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 11:54:35 -0500
IronPort-SDR: VEf1fdsr5SGx3w6kzD0UX0bnVPFI6qZw8HzCmMekOB3unqVwKfIrSELipziFDIjGukCNnrk1Hi
 YA532U25f2qA==
X-IronPort-AV: E=McAfee;i="6000,8403,9855"; a="164841152"
X-IronPort-AV: E=Sophos;i="5.78,477,1599548400"; d="scan'208";a="164841152"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2021 08:54:12 -0800
IronPort-SDR: RwYDGOvaCRpbT/2UtfrO3khqc9H+O/UoHKCiuox9I/+EqDeg1cDKjbzO0mqCxcucWd0wFa7bbv
 0LgLfRHINiLg==
X-IronPort-AV: E=Sophos;i="5.78,477,1599548400"; d="scan'208";a="346338101"
Received: from tgeddam-mobl.amr.corp.intel.com (HELO bwidawsk-mobl5.local)
 ([10.252.140.57])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2021 08:54:08 -0800
From: Ben Widawsky <ben.widawsky@intel.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v2 31/32] WIP: i386/cxl: Initialize a host bridge
Date: Tue,  5 Jan 2021 08:53:22 -0800
Message-Id: <20210105165323.783725-32-ben.widawsky@intel.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210105165323.783725-1-ben.widawsky@intel.com>
References: <20210105165323.783725-1-ben.widawsky@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.126;
 envelope-from=ben.widawsky@intel.com; helo=mga18.intel.com
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
Cc: Thomas Huth <thuth@redhat.com>, Ben Widawsky <ben.widawsky@intel.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Vishal Verma <vishal.l.verma@intel.com>,
 Chris Browy <cbrowy@avery-design.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Jonathan Cameron <Jonathan.Cameron@Huawei.com>,
 Prashant V Agarwal <agpr123@gmail.com>,
 Dan Williams <dan.j.williams@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch allows initializing the primary host bridge as a CXL capable
hostbridge.

Signed-off-by: Ben Widawsky <ben.widawsky@intel.com>

--
This patch is WIP.
---
 hw/arm/virt.c        |  1 +
 hw/core/machine.c    | 26 ++++++++++++++++++++++++++
 hw/i386/acpi-build.c |  8 +++++++-
 hw/i386/microvm.c    |  1 +
 hw/i386/pc.c         |  1 +
 hw/ppc/spapr.c       |  2 ++
 include/hw/boards.h  |  2 ++
 include/hw/cxl/cxl.h |  4 ++++
 8 files changed, 44 insertions(+), 1 deletion(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 96985917d3..c9d6636efa 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2481,6 +2481,7 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
     hc->unplug_request = virt_machine_device_unplug_request_cb;
     hc->unplug = virt_machine_device_unplug_cb;
     mc->nvdimm_supported = true;
+    mc->cxl_supported = false;
     mc->auto_enable_numa_with_memhp = true;
     mc->auto_enable_numa_with_memdev = true;
     mc->default_ram_id = "mach-virt.ram";
diff --git a/hw/core/machine.c b/hw/core/machine.c
index de3b8f1b31..c739803854 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -30,6 +30,7 @@
 #include "sysemu/qtest.h"
 #include "hw/pci/pci.h"
 #include "hw/mem/nvdimm.h"
+#include "hw/cxl/cxl.h"
 #include "migration/global_state.h"
 #include "migration/vmstate.h"
 
@@ -502,6 +503,20 @@ static void machine_set_nvdimm_persistence(Object *obj, const char *value,
     nvdimms_state->persistence_string = g_strdup(value);
 }
 
+static bool machine_get_cxl(Object *obj, Error **errp)
+{
+    MachineState *ms = MACHINE(obj);
+
+    return ms->cxl_devices_state->is_enabled;
+}
+
+static void machine_set_cxl(Object *obj, bool value, Error **errp)
+{
+    MachineState *ms = MACHINE(obj);
+
+    ms->cxl_devices_state->is_enabled = value;
+}
+
 void machine_class_allow_dynamic_sysbus_dev(MachineClass *mc, const char *type)
 {
     QAPI_LIST_PREPEND(mc->allowed_dynamic_sysbus_devices, g_strdup(type));
@@ -903,6 +918,16 @@ static void machine_initfn(Object *obj)
                                         "Valid values are cpu, mem-ctrl");
     }
 
+    if (mc->cxl_supported) {
+        Object *obj = OBJECT(ms);
+
+        ms->cxl_devices_state = g_new0(CXLState, 1);
+        object_property_add_bool(obj, "cxl", machine_get_cxl, machine_set_cxl);
+        object_property_set_description(obj, "cxl",
+                                        "Set on/off to enable/disable "
+                                        "CXL instantiation");
+    }
+
     if (mc->cpu_index_to_instance_props && mc->get_default_cpu_node_id) {
         ms->numa_state = g_new0(NumaState, 1);
         object_property_add_bool(obj, "hmat",
@@ -939,6 +964,7 @@ static void machine_finalize(Object *obj)
     g_free(ms->device_memory);
     g_free(ms->nvdimms_state);
     g_free(ms->numa_state);
+    g_free(ms->cxl_devices_state);
 }
 
 bool machine_usb(MachineState *machine)
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 470dd7ddf4..90d52e7774 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -53,6 +53,7 @@
 #include "sysemu/numa.h"
 #include "sysemu/reset.h"
 #include "hw/hyperv/vmbus-bridge.h"
+#include "hw/cxl/cxl.h"
 
 /* Supported chipsets: */
 #include "hw/southbridge/piix.h"
@@ -1277,8 +1278,13 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
         build_piix4_pci0_int(dsdt);
     } else {
         sb_scope = aml_scope("_SB");
+        /*
+         * XXX: CXL spec calls this "CXL0", but that would require lots of
+         * changes throughout and so even for CXL enabled, we call it "PCI0"
+         */
         dev = aml_device("PCI0");
-        init_pci_acpi(dev, 0, PCIE);
+        init_pci_acpi(dev, 0,
+                machine->cxl_devices_state->is_enabled ? CXL : PCIE);
         aml_append(dev, aml_name_decl("_ADR", aml_int(0)));
         aml_append(sb_scope, dev);
 
diff --git a/hw/i386/microvm.c b/hw/i386/microvm.c
index edf2b0f061..970b299a69 100644
--- a/hw/i386/microvm.c
+++ b/hw/i386/microvm.c
@@ -688,6 +688,7 @@ static void microvm_class_init(ObjectClass *oc, void *data)
     mc->auto_enable_numa_with_memdev = false;
     mc->default_cpu_type = TARGET_DEFAULT_CPU_TYPE;
     mc->nvdimm_supported = false;
+    mc->cxl_supported = false;
     mc->default_ram_id = "microvm.ram";
 
     /* Avoid relying too much on kernel components */
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 5d41809b37..7350eeea9c 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -1725,6 +1725,7 @@ static void pc_machine_class_init(ObjectClass *oc, void *data)
     hc->unplug = pc_machine_device_unplug_cb;
     mc->default_cpu_type = TARGET_DEFAULT_CPU_TYPE;
     mc->nvdimm_supported = true;
+    mc->cxl_supported = true;
     mc->default_ram_id = "pc.ram";
 
     object_class_property_add(oc, PC_MACHINE_MAX_RAM_BELOW_4G, "size",
diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index 489cefcb81..b5ea497403 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -4442,6 +4442,7 @@ static void spapr_machine_class_init(ObjectClass *oc, void *data)
     mc->default_cpu_type = POWERPC_CPU_TYPE_NAME("power9_v2.0");
     mc->has_hotpluggable_cpus = true;
     mc->nvdimm_supported = true;
+    mc->cxl_supported = false;
     smc->resize_hpt_default = SPAPR_RESIZE_HPT_ENABLED;
     fwc->get_dev_path = spapr_get_fw_dev_path;
     nc->nmi_monitor_handler = spapr_nmi;
@@ -4602,6 +4603,7 @@ static void spapr_machine_4_2_class_options(MachineClass *mc)
     smc->default_caps.caps[SPAPR_CAP_FWNMI] = SPAPR_CAP_OFF;
     smc->rma_limit = 16 * GiB;
     mc->nvdimm_supported = false;
+    mc->cxl_supported = false;
 }
 
 DEFINE_SPAPR_MACHINE(4_2, "4.2", false);
diff --git a/include/hw/boards.h b/include/hw/boards.h
index 17b1f3f0b9..808f73e134 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -206,6 +206,7 @@ struct MachineClass {
     bool ignore_boot_device_suffixes;
     bool smbus_no_migration_support;
     bool nvdimm_supported;
+    bool cxl_supported;
     bool numa_mem_supported;
     bool auto_enable_numa;
     const char *default_ram_id;
@@ -292,6 +293,7 @@ struct MachineState {
     CPUArchIdList *possible_cpus;
     CpuTopology smp;
     struct NVDIMMState *nvdimms_state;
+    struct CXLState *cxl_devices_state;
     struct NumaState *numa_state;
 };
 
diff --git a/include/hw/cxl/cxl.h b/include/hw/cxl/cxl.h
index 809ed7de60..6961e47076 100644
--- a/include/hw/cxl/cxl.h
+++ b/include/hw/cxl/cxl.h
@@ -22,5 +22,9 @@
 #define CXL_HOST_BASE 0xD0000000
 #define CXL_WINDOW_MAX 10
 
+typedef struct CXLState {
+    bool is_enabled;
+} CXLState;
+
 #endif
 
-- 
2.30.0


