Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B9F71E6F39
	for <lists+qemu-devel@lfdr.de>; Fri, 29 May 2020 00:36:48 +0200 (CEST)
Received: from localhost ([::1]:51056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jeR8o-0005yV-C1
	for lists+qemu-devel@lfdr.de; Thu, 28 May 2020 18:36:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vishal.l.verma@intel.com>)
 id 1jeR73-00042L-UF
 for qemu-devel@nongnu.org; Thu, 28 May 2020 18:34:57 -0400
Received: from mga14.intel.com ([192.55.52.115]:41319)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vishal.l.verma@intel.com>)
 id 1jeR72-00080T-8m
 for qemu-devel@nongnu.org; Thu, 28 May 2020 18:34:57 -0400
IronPort-SDR: BN+YDiCsJ8AwgoLp5mhzQbLzNqvzbM8pNgRF5YrrmIqgj3j5OnfFc7yEHc5akRppWItR27M4G3
 yPStuS0gVaVg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2020 15:34:54 -0700
IronPort-SDR: S5cX/nOXgD3I4UxwPIhoui2l0+3nYaxFEI7k49gnPGFI+TdZS2gLivZzG/dq4+cA2/G3ir76rI
 rohBo2GXm1tg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,446,1583222400"; d="scan'208";a="256314840"
Received: from vverma7-mobl4.lm.intel.com ([10.251.139.189])
 by orsmga007.jf.intel.com with ESMTP; 28 May 2020 15:34:53 -0700
From: Vishal Verma <vishal.l.verma@intel.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH v4 2/3] hw/acpi/nvdimm: add a helper to augment SRAT generation
Date: Thu, 28 May 2020 16:34:36 -0600
Message-Id: <20200528223437.12568-3-vishal.l.verma@intel.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200528223437.12568-1-vishal.l.verma@intel.com>
References: <20200528223437.12568-1-vishal.l.verma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.115;
 envelope-from=vishal.l.verma@intel.com; helo=mga14.intel.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/28 18:34:49
X-ACL-Warn: Detected OS   = FreeBSD 9.x or newer [fuzzy]
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, jingqi.liu@intel.com,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Vishal Verma <vishal.l.verma@intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Dan Williams <dan.j.williams@intel.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

NVDIMMs can belong to their own proximity domains, as described by the
NFIT. In such cases, the SRAT needs to have Memory Affinity structures
in the SRAT for these NVDIMMs, otherwise Linux doesn't populate node
data structures properly during NUMA initialization. See the following
for an example failure case.

https://lore.kernel.org/linux-nvdimm/20200416225438.15208-1-vishal.l.verma@intel.com/

Introduce a new helper, nvdimm_build_srat(), and call it for both the
i386 and arm versions of 'build_srat()' to augment the SRAT with
memory affinity information for NVDIMMs.

The relevant command line options to exercise this are below. Nodes 0-1
contain CPUs and regular memory, and nodes 2-3 are the NVDIMM address
space.

  -numa node,nodeid=0,mem=2048M,
  -numa node,nodeid=1,mem=2048M,
  -numa node,nodeid=2,mem=0,
  -object memory-backend-file,id=nvmem0,share,mem-path=nvdimm-0,size=16384M,align=128M
  -device nvdimm,memdev=nvmem0,id=nv0,label-size=2M,node=2
  -numa node,nodeid=3,mem=0,
  -object memory-backend-file,id=nvmem1,share,mem-path=nvdimm-1,size=16384M,align=128M
  -device nvdimm,memdev=nvmem1,id=nv1,label-size=2M,node=3

Cc: Jingqi Liu <jingqi.liu@intel.com>
Cc: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Jingqi Liu <jingqi.liu@intel.com>
Signed-off-by: Vishal Verma <vishal.l.verma@intel.com>
---
 hw/acpi/nvdimm.c         | 23 +++++++++++++++++++++++
 hw/arm/virt-acpi-build.c |  4 ++++
 hw/i386/acpi-build.c     |  5 +++++
 include/hw/mem/nvdimm.h  |  1 +
 4 files changed, 33 insertions(+)

diff --git a/hw/acpi/nvdimm.c b/hw/acpi/nvdimm.c
index 9316d12b70..8f7cc16add 100644
--- a/hw/acpi/nvdimm.c
+++ b/hw/acpi/nvdimm.c
@@ -28,6 +28,7 @@
 
 #include "qemu/osdep.h"
 #include "qemu/uuid.h"
+#include "qapi/error.h"
 #include "hw/acpi/acpi.h"
 #include "hw/acpi/aml-build.h"
 #include "hw/acpi/bios-linker-loader.h"
@@ -1334,6 +1335,28 @@ static void nvdimm_build_ssdt(GArray *table_offsets, GArray *table_data,
     free_aml_allocator();
 }
 
+void nvdimm_build_srat(GArray *table_data)
+{
+    GSList *device_list = nvdimm_get_device_list();
+
+    for (; device_list; device_list = device_list->next) {
+        AcpiSratMemoryAffinity *numamem = NULL;
+        DeviceState *dev = device_list->data;
+        Object *obj = OBJECT(dev);
+        uint64_t addr, size;
+        int node;
+
+        node = object_property_get_int(obj, PC_DIMM_NODE_PROP, &error_abort);
+        addr = object_property_get_uint(obj, PC_DIMM_ADDR_PROP, &error_abort);
+        size = object_property_get_uint(obj, PC_DIMM_SIZE_PROP, &error_abort);
+
+        numamem = acpi_data_push(table_data, sizeof *numamem);
+        build_srat_memory(numamem, addr, size, node,
+                          MEM_AFFINITY_ENABLED | MEM_AFFINITY_NON_VOLATILE);
+    }
+    g_slist_free(device_list);
+}
+
 void nvdimm_build_acpi(GArray *table_offsets, GArray *table_data,
                        BIOSLinker *linker, NVDIMMState *state,
                        uint32_t ram_slots)
diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 1b0a584c7b..2cbccd5fe2 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -539,6 +539,10 @@ build_srat(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
         }
     }
 
+    if (ms->nvdimms_state->is_enabled) {
+        nvdimm_build_srat(table_data);
+    }
+
     if (ms->device_memory) {
         numamem = acpi_data_push(table_data, sizeof *numamem);
         build_srat_memory(numamem, ms->device_memory->base,
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 2e15f6848e..d996525e2c 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -2428,6 +2428,11 @@ build_srat(GArray *table_data, BIOSLinker *linker, MachineState *machine)
                               MEM_AFFINITY_ENABLED);
         }
     }
+
+    if (machine->nvdimms_state->is_enabled) {
+        nvdimm_build_srat(table_data);
+    }
+
     slots = (table_data->len - numa_start) / sizeof *numamem;
     for (; slots < pcms->numa_nodes + 2; slots++) {
         numamem = acpi_data_push(table_data, sizeof *numamem);
diff --git a/include/hw/mem/nvdimm.h b/include/hw/mem/nvdimm.h
index a3c08955e8..b67a1aedf6 100644
--- a/include/hw/mem/nvdimm.h
+++ b/include/hw/mem/nvdimm.h
@@ -155,6 +155,7 @@ typedef struct NVDIMMState NVDIMMState;
 void nvdimm_init_acpi_state(NVDIMMState *state, MemoryRegion *io,
                             struct AcpiGenericAddress dsm_io,
                             FWCfgState *fw_cfg, Object *owner);
+void nvdimm_build_srat(GArray *table_data);
 void nvdimm_build_acpi(GArray *table_offsets, GArray *table_data,
                        BIOSLinker *linker, NVDIMMState *state,
                        uint32_t ram_slots);
-- 
2.26.2


