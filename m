Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94509437598
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Oct 2021 12:38:27 +0200 (CEST)
Received: from localhost ([::1]:49222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdrwQ-0001Bg-MA
	for lists+qemu-devel@lfdr.de; Fri, 22 Oct 2021 06:38:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1mdrqN-0001BA-75
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 06:32:11 -0400
Received: from mga06.intel.com ([134.134.136.31]:5671)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1mdrqK-00008H-MX
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 06:32:10 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10144"; a="290113959"
X-IronPort-AV: E=Sophos;i="5.87,172,1631602800"; d="scan'208";a="290113959"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2021 03:32:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,172,1631602800"; d="scan'208";a="595506436"
Received: from icx.bj.intel.com ([10.240.192.117])
 by orsmga004.jf.intel.com with ESMTP; 22 Oct 2021 03:32:06 -0700
From: Yang Zhong <yang.zhong@intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 5/5] sgx: Reset the vEPC regions during VM reboot
Date: Fri, 22 Oct 2021 15:27:54 -0400
Message-Id: <20211022192754.58196-6-yang.zhong@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211022192754.58196-1-yang.zhong@intel.com>
References: <20211022192754.58196-1-yang.zhong@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.31; envelope-from=yang.zhong@intel.com;
 helo=mga06.intel.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DATE_IN_FUTURE_06_12=1.947,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: yang.zhong@intel.com, pbonzini@redhat.com, jarkko@kernel.org,
 eblake@redhat.com, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For bare-metal SGX on real hardware, the hardware provides guarantees
SGX state at reboot.  For instance, all pages start out uninitialized.
The vepc driver provides a similar guarantee today for freshly-opened
vepc instances, but guests such as Windows expect all pages to be in
uninitialized state on startup, including after every guest reboot.

Qemu can invoke the ioctl to bring its vEPC pages back to uninitialized
state. There is a possibility that some pages fail to be removed if they
are SECS pages, and the child and SECS pages could be in separate vEPC
regions.  Therefore, the ioctl returns the number of EREMOVE failures,
telling Qemu to try the ioctl again after it's done with all vEPC regions.

The related kernel patches v4 will be merged into kernel release and link:
https://lore.kernel.org/all/20211021201155.1523989-1-pbonzini@redhat.com/

Once this kernel patchset is merged, the kernel commit ids will be updated
here.

Signed-off-by: Yang Zhong <yang.zhong@intel.com>
---
 include/hw/i386/x86.h     |  1 +
 linux-headers/linux/kvm.h |  6 +++++
 hw/i386/sgx.c             | 53 +++++++++++++++++++++++++++++++++++++++
 hw/i386/x86.c             |  4 +++
 4 files changed, 64 insertions(+)

diff --git a/include/hw/i386/x86.h b/include/hw/i386/x86.h
index 23267a3674..e78ca6c156 100644
--- a/include/hw/i386/x86.h
+++ b/include/hw/i386/x86.h
@@ -141,5 +141,6 @@ qemu_irq x86_allocate_cpu_irq(void);
 void gsi_handler(void *opaque, int n, int level);
 void ioapic_init_gsi(GSIState *gsi_state, const char *parent_name);
 DeviceState *ioapic_init_secondary(GSIState *gsi_state);
+void sgx_epc_reset(void *opaque);
 
 #endif
diff --git a/linux-headers/linux/kvm.h b/linux-headers/linux/kvm.h
index bcaf66cc4d..ee110e660b 100644
--- a/linux-headers/linux/kvm.h
+++ b/linux-headers/linux/kvm.h
@@ -887,6 +887,12 @@ struct kvm_ppc_resize_hpt {
 #define KVM_GET_EMULATED_CPUID	  _IOWR(KVMIO, 0x09, struct kvm_cpuid2)
 #define KVM_GET_MSR_FEATURE_INDEX_LIST    _IOWR(KVMIO, 0x0a, struct kvm_msr_list)
 
+/*
+ * ioctl for /dev/sgx_vepc
+ */
+#define SGX_MAGIC 0xA4
+#define SGX_IOC_VEPC_REMOVE_ALL       _IO(SGX_MAGIC, 0x04)
+
 /*
  * Extension capability list.
  */
diff --git a/hw/i386/sgx.c b/hw/i386/sgx.c
index b5b710a556..3e21094c30 100644
--- a/hw/i386/sgx.c
+++ b/hw/i386/sgx.c
@@ -22,6 +22,8 @@
 #include "exec/address-spaces.h"
 #include "sysemu/hw_accel.h"
 #include "hw/acpi/aml-build.h"
+#include "hw/i386/x86.h"
+#include <sys/ioctl.h>
 
 #define SGX_MAX_EPC_SECTIONS            8
 #define SGX_CPUID_EPC_INVALID           0x0
@@ -70,6 +72,57 @@ void sgx_epc_build_srat(GArray *table_data)
     g_slist_free(device_list);
 }
 
+static int sgx_remove_all_pages(PCMachineState *pcms, int num)
+{
+    HostMemoryBackend *hostmem;
+    SGXEPCDevice *epc;
+    int failures = 0, failures_1 = 0;
+    unsigned long ret = 0;
+    int fd, j;
+
+    for (j = 0; j < num; j++) {
+        epc = pcms->sgx_epc.sections[j];
+        hostmem = MEMORY_BACKEND(epc->hostmem);
+        fd = memory_region_get_fd(host_memory_backend_get_memory(hostmem));
+
+        failures = ioctl(fd, SGX_IOC_VEPC_REMOVE_ALL);
+        if (failures < 0) {
+            return failures;
+        } else if (failures > 0) {
+            /* Remove SECS pages */
+            sleep(1);
+            failures_1 = ioctl(fd, SGX_IOC_VEPC_REMOVE_ALL);
+        }
+
+        /*
+         * The host or guest can support 8 EPC sections, use the
+         * corresponding bit to show each section removal status.
+         */
+        if (failures_1) {
+            set_bit(j, &ret);
+        }
+    }
+
+    return ret;
+}
+
+void sgx_epc_reset(void *opaque)
+{
+    PCMachineState *pcms = PC_MACHINE(qdev_get_machine());
+    GSList *device_list = sgx_epc_get_device_list();
+    int len = g_slist_length(device_list);
+    int ret;
+
+    do {
+        ret = sgx_remove_all_pages(pcms, len);
+        if (ret == -ENOTTY) {
+            break;
+        }
+    } while (ret);
+
+    g_slist_free(device_list);
+}
+
 static uint64_t sgx_calc_section_metric(uint64_t low, uint64_t high)
 {
     return (low & MAKE_64BIT_MASK(12, 20)) +
diff --git a/hw/i386/x86.c b/hw/i386/x86.c
index 76de7e2265..03d30a487a 100644
--- a/hw/i386/x86.c
+++ b/hw/i386/x86.c
@@ -39,6 +39,7 @@
 #include "sysemu/replay.h"
 #include "sysemu/sysemu.h"
 #include "sysemu/cpu-timers.h"
+#include "sysemu/reset.h"
 #include "trace.h"
 
 #include "hw/i386/x86.h"
@@ -1307,6 +1308,9 @@ static void machine_set_sgx_epc(Object *obj, Visitor *v, const char *name,
     visit_type_SgxEPCList(v, name, &x86ms->sgx_epc_list, errp);
 
     qapi_free_SgxEPCList(list);
+
+    /* register the reset callback for sgx reset */
+    qemu_register_reset(sgx_epc_reset, NULL);
 }
 
 static void x86_machine_initfn(Object *obj)

