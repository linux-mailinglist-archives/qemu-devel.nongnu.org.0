Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C41CD3CD3EE
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 13:33:05 +0200 (CEST)
Received: from localhost ([::1]:48448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5RWC-0006Ye-O9
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 07:33:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1m5RQz-0004Qb-Mq
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 07:27:41 -0400
Received: from mga09.intel.com ([134.134.136.24]:16187)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1m5RQx-00065D-V7
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 07:27:41 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10049"; a="211035228"
X-IronPort-AV: E=Sophos;i="5.84,252,1620716400"; d="scan'208";a="211035228"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2021 04:27:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,252,1620716400"; d="scan'208";a="656813618"
Received: from icx-2s.bj.intel.com ([10.240.192.119])
 by fmsmga006.fm.intel.com with ESMTP; 19 Jul 2021 04:27:25 -0700
From: Yang Zhong <yang.zhong@intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 12/33] i386: Update SGX CPUID info according to
 hardware/KVM/user input
Date: Mon, 19 Jul 2021 19:21:15 +0800
Message-Id: <20210719112136.57018-13-yang.zhong@intel.com>
X-Mailer: git-send-email 2.29.2.334.gfaefdd61ec
In-Reply-To: <20210719112136.57018-1-yang.zhong@intel.com>
References: <20210719112136.57018-1-yang.zhong@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.24; envelope-from=yang.zhong@intel.com;
 helo=mga09.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: yang.zhong@intel.com, seanjc@google.com, kai.huang@intel.com,
 jarkko@kernel.org, pbonzini@redhat.com, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Sean Christopherson <sean.j.christopherson@intel.com>

Expose SGX to the guest if and only if KVM is enabled and supports
virtualization of SGX.  While the majority of ENCLS can be emulated to
some degree, because SGX uses a hardware-based root of trust, the
attestation aspects of SGX cannot be emulated in software, i.e.
ultimately emulation will fail as software cannot generate a valid
quote/report.  The complexity of partially emulating SGX in Qemu far
outweighs the value added, e.g. an SGX specific simulator for userspace
applications can emulate SGX for development and testing purposes.

Note, access to the PROVISIONKEY is not yet advertised to the guest as
KVM blocks access to the PROVISIONKEY by default and requires userspace
to provide additional credentials (via ioctl()) to expose PROVISIONKEY.

Signed-off-by: Sean Christopherson <sean.j.christopherson@intel.com>
Signed-off-by: Yang Zhong <yang.zhong@intel.com>

v3-->v4:
   - Replaced g_malloc0() with directly ....
---
 hw/i386/sgx.c             | 17 +++++++++
 include/hw/i386/sgx-epc.h |  2 +
 target/i386/cpu.c         | 77 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 96 insertions(+)

diff --git a/hw/i386/sgx.c b/hw/i386/sgx.c
index e77deb0b00..5f988c6368 100644
--- a/hw/i386/sgx.c
+++ b/hw/i386/sgx.c
@@ -18,6 +18,23 @@
 #include "qapi/error.h"
 #include "exec/address-spaces.h"
 
+int sgx_epc_get_section(int section_nr, uint64_t *addr, uint64_t *size)
+{
+    PCMachineState *pcms = PC_MACHINE(qdev_get_machine());
+    SGXEPCDevice *epc;
+
+    if (pcms->sgx_epc.size == 0 || pcms->sgx_epc.nr_sections <= section_nr) {
+        return 1;
+    }
+
+    epc = pcms->sgx_epc.sections[section_nr];
+
+    *addr = epc->addr;
+    *size = memory_device_get_region_size(MEMORY_DEVICE(epc), &error_fatal);
+
+    return 0;
+}
+
 static int sgx_epc_set_property(void *opaque, const char *name,
                                 const char *value, Error **errp)
 {
diff --git a/include/hw/i386/sgx-epc.h b/include/hw/i386/sgx-epc.h
index 2b2490892b..f85fd2a4ca 100644
--- a/include/hw/i386/sgx-epc.h
+++ b/include/hw/i386/sgx-epc.h
@@ -55,4 +55,6 @@ typedef struct SGXEPCState {
     int nr_sections;
 } SGXEPCState;
 
+int sgx_epc_get_section(int section_nr, uint64_t *addr, uint64_t *size);
+
 #endif
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index cea4307930..8adfe80312 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -36,6 +36,7 @@
 #ifndef CONFIG_USER_ONLY
 #include "exec/address-spaces.h"
 #include "hw/boards.h"
+#include "hw/i386/sgx-epc.h"
 #endif
 
 #include "disas/capstone.h"
@@ -5301,6 +5302,25 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
                 *ecx |= CPUID_7_0_ECX_OSPKE;
             }
             *edx = env->features[FEAT_7_0_EDX]; /* Feature flags */
+
+            /*
+             * SGX cannot be emulated in software.  If hardware does not
+             * support enabling SGX and/or SGX flexible launch control,
+             * then we need to update the VM's CPUID values accordingly.
+             */
+            if ((*ebx & CPUID_7_0_EBX_SGX) &&
+                (!kvm_enabled() ||
+                 !(kvm_arch_get_supported_cpuid(cs->kvm_state, 0x7, 0, R_EBX) &
+                    CPUID_7_0_EBX_SGX))) {
+                *ebx &= ~CPUID_7_0_EBX_SGX;
+            }
+
+            if ((*ecx & CPUID_7_0_ECX_SGX_LC) &&
+                (!(*ebx & CPUID_7_0_EBX_SGX) || !kvm_enabled() ||
+                 !(kvm_arch_get_supported_cpuid(cs->kvm_state, 0x7, 0, R_ECX) &
+                    CPUID_7_0_ECX_SGX_LC))) {
+                *ecx &= ~CPUID_7_0_ECX_SGX_LC;
+            }
         } else if (count == 1) {
             *eax = env->features[FEAT_7_1_EAX];
             *ebx = 0;
@@ -5436,6 +5456,63 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
         }
         break;
     }
+    case 0x12:
+#ifndef CONFIG_USER_ONLY
+        if (!kvm_enabled() ||
+            !(env->features[FEAT_7_0_EBX] & CPUID_7_0_EBX_SGX)) {
+            *eax = *ebx = *ecx = *edx = 0;
+            break;
+        }
+
+        /*
+         * SGX sub-leafs CPUID.0x12.{0x2..N} enumerate EPC sections.  Retrieve
+         * the EPC properties, e.g. confidentiality and integrity, from the
+         * host's first EPC section, i.e. assume there is one EPC section or
+         * that all EPC sections have the same security properties.
+         */
+        if (count > 1) {
+            uint64_t epc_addr, epc_size;
+
+            if (sgx_epc_get_section(count - 2, &epc_addr, &epc_size)) {
+                *eax = *ebx = *ecx = *edx = 0;
+                break;
+            }
+            host_cpuid(index, 2, eax, ebx, ecx, edx);
+            *eax = (uint32_t)(epc_addr & 0xfffff000) | 0x1;
+            *ebx = (uint32_t)(epc_addr >> 32);
+            *ecx = (uint32_t)(epc_size & 0xfffff000) | (*ecx & 0xf);
+            *edx = (uint32_t)(epc_size >> 32);
+            break;
+        }
+
+        /*
+         * SGX sub-leafs CPUID.0x12.{0x0,0x1} are heavily dependent on hardware
+         * and KVM, i.e. QEMU cannot emulate features to override what KVM
+         * supports.  Features can be further restricted by userspace, but not
+         * made more permissive.
+         */
+        *eax = kvm_arch_get_supported_cpuid(cs->kvm_state, 0x12, count, R_EAX);
+        *ebx = kvm_arch_get_supported_cpuid(cs->kvm_state, 0x12, count, R_EBX);
+        *ecx = kvm_arch_get_supported_cpuid(cs->kvm_state, 0x12, count, R_ECX);
+        *edx = kvm_arch_get_supported_cpuid(cs->kvm_state, 0x12, count, R_EDX);
+
+        if (count == 0) {
+            *eax &= env->features[FEAT_SGX_12_0_EAX];
+            *ebx &= env->features[FEAT_SGX_12_0_EBX];
+        } else {
+            *eax &= env->features[FEAT_SGX_12_1_EAX];
+            *ebx &= 0; /* ebx reserve */
+            *ecx &= env->features[FEAT_XSAVE_COMP_LO];
+            *edx &= env->features[FEAT_XSAVE_COMP_HI];
+
+            /* FP and SSE are always allowed regardless of XSAVE/XCR0. */
+            *ecx |= XSTATE_FP_MASK | XSTATE_SSE_MASK;
+
+            /* Access to PROVISIONKEY requires additional credentials. */
+            *eax &= ~(1U << 4);
+        }
+#endif
+        break;
     case 0x14: {
         /* Intel Processor Trace Enumeration */
         *eax = 0;

