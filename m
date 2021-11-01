Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE950441434
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 08:29:51 +0100 (CET)
Received: from localhost ([::1]:55754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhRlP-0002dl-2W
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 03:29:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1mhRgE-00034p-FE
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 03:24:30 -0400
Received: from mga17.intel.com ([192.55.52.151]:18021)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1mhRgC-00029Z-DX
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 03:24:30 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10154"; a="211729030"
X-IronPort-AV: E=Sophos;i="5.87,198,1631602800"; d="scan'208";a="211729030"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2021 00:24:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,198,1631602800"; d="scan'208";a="448855959"
Received: from icx.bj.intel.com ([10.240.192.117])
 by orsmga006.jf.intel.com with ESMTP; 01 Nov 2021 00:24:24 -0700
From: Yang Zhong <yang.zhong@intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 5/5] sgx: Reset the vEPC regions during VM reboot
Date: Mon,  1 Nov 2021 12:20:09 -0400
Message-Id: <20211101162009.62161-6-yang.zhong@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211101162009.62161-1-yang.zhong@intel.com>
References: <20211101162009.62161-1-yang.zhong@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.151; envelope-from=yang.zhong@intel.com;
 helo=mga17.intel.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DATE_IN_FUTURE_06_12=1.947,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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

The related kernel patches:
Link: https://lkml.kernel.org/r/20211021201155.1523989-3-pbonzini@redhat.com

Signed-off-by: Yang Zhong <yang.zhong@intel.com>
---
 include/hw/i386/x86.h     |  1 +
 linux-headers/linux/kvm.h |  6 ++++++
 hw/i386/sgx.c             | 42 +++++++++++++++++++++++++++++++++++++++
 hw/i386/x86.c             |  4 ++++
 4 files changed, 53 insertions(+)

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
index b5b710a556..640bd4198f 100644
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
@@ -29,6 +31,7 @@
 /* A valid EPC section. */
 #define SGX_CPUID_EPC_SECTION           0x1
 #define SGX_CPUID_EPC_MASK              0xF
+#define RETRY_NUM                       2
 
 static int sgx_epc_device_list(Object *obj, void *opaque)
 {
@@ -70,6 +73,45 @@ void sgx_epc_build_srat(GArray *table_data)
     g_slist_free(device_list);
 }
 
+void sgx_epc_reset(void *opaque)
+{
+    PCMachineState *pcms = PC_MACHINE(qdev_get_machine());
+    HostMemoryBackend *hostmem;
+    SGXEPCDevice *epc;
+    int failures;
+    int fd, i, j, r;
+
+    /*
+     * The second pass is needed to remove SECS pages that could not
+     * be removed during the first.
+     */
+    for (i = 0; i < RETRY_NUM; i++) {
+        failures = 0;
+        for (j = 0; j < pcms->sgx_epc.nr_sections; j++) {
+            epc = pcms->sgx_epc.sections[j];
+            hostmem = MEMORY_BACKEND(epc->hostmem);
+            fd = memory_region_get_fd(host_memory_backend_get_memory(hostmem));
+
+            r = ioctl(fd, SGX_IOC_VEPC_REMOVE_ALL);
+            if (r < 0) {
+                if (r == -ENOTTY) {
+                    error_report("use the error ioctl number");
+                    break;
+                }
+            } else if (r > 0) {
+                /* SECS pages remain */
+                failures++;
+                if (i == 1) {
+                    error_report("cannot reset vEPC section %d", j);
+                }
+            }
+        }
+        if (!failures) {
+            break;
+        }
+     }
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

