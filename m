Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 357F836F5DF
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 08:46:04 +0200 (CEST)
Received: from localhost ([::1]:52274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcMuZ-0006Bg-8n
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 02:46:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1lcMe3-0004aO-7C
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 02:28:59 -0400
Received: from mga11.intel.com ([192.55.52.93]:63436)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1lcMe0-00015T-6L
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 02:28:58 -0400
IronPort-SDR: exZsNrkmDrpY0LZObJX2ID4Ux07GdxZeHt0tN3b5zVH1+CBd8tyKXnFT+WM0nAIBpKppaOkAwA
 wpicWMFd5tPg==
X-IronPort-AV: E=McAfee;i="6200,9189,9969"; a="194023072"
X-IronPort-AV: E=Sophos;i="5.82,260,1613462400"; d="scan'208";a="194023072"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2021 23:28:35 -0700
IronPort-SDR: gksesCaOCPPVY4lX/0OKCJG+V1JGDN0dUbqXDcBWgpsLMiFM/g3tqreSDdQVtF0Gy3LJJVbej9
 Q6+3ZRlexJIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,260,1613462400"; d="scan'208";a="387258488"
Received: from icx-2s.bj.intel.com ([10.240.192.119])
 by orsmga003.jf.intel.com with ESMTP; 29 Apr 2021 23:28:33 -0700
From: Yang Zhong <yang.zhong@intel.com>
To: qemu-devel@nongnu.org
Subject: [RESEND PATCH 12/32] i386: Update SGX CPUID info according to
 hardware/KVM/user input
Date: Fri, 30 Apr 2021 14:24:35 +0800
Message-Id: <20210430062455.8117-13-yang.zhong@intel.com>
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
---
 hw/i386/sgx-epc.c         | 17 +++++++++
 include/hw/i386/sgx-epc.h |  2 +
 target/i386/cpu.c         | 77 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 96 insertions(+)

diff --git a/hw/i386/sgx-epc.c b/hw/i386/sgx-epc.c
index 0858819a71..d5ba7bb68c 100644
--- a/hw/i386/sgx-epc.c
+++ b/hw/i386/sgx-epc.c
@@ -173,6 +173,23 @@ static void sgx_epc_register_types(void)
 
 type_init(sgx_epc_register_types)
 
+int sgx_epc_get_section(int section_nr, uint64_t *addr, uint64_t *size)
+{
+    PCMachineState *pcms = PC_MACHINE(qdev_get_machine());
+    SGXEPCDevice *epc;
+
+    if (pcms->sgx_epc == NULL || pcms->sgx_epc->nr_sections <= section_nr) {
+        return 1;
+    }
+
+    epc = pcms->sgx_epc->sections[section_nr];
+
+    *addr = epc->addr;
+    *size = memory_device_get_region_size(MEMORY_DEVICE(epc), &error_fatal);
+
+    return 0;
+}
+
 
 static int sgx_epc_set_property(void *opaque, const char *name,
                                 const char *value, Error **errp)
diff --git a/include/hw/i386/sgx-epc.h b/include/hw/i386/sgx-epc.h
index 1f7dd17c17..8d80b34fb7 100644
--- a/include/hw/i386/sgx-epc.h
+++ b/include/hw/i386/sgx-epc.h
@@ -57,4 +57,6 @@ typedef struct SGXEPCState {
 
 extern int sgx_epc_enabled;
 
+int sgx_epc_get_section(int section_nr, uint64_t *addr, uint64_t *size);
+
 #endif
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 43e6fdf162..e630e57f03 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -60,6 +60,7 @@
 #include "exec/address-spaces.h"
 #include "hw/i386/apic_internal.h"
 #include "hw/boards.h"
+#include "hw/i386/sgx-epc.h"
 #endif
 
 #include "disas/capstone.h"
@@ -5807,6 +5808,25 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
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
@@ -5942,6 +5962,63 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
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
-- 
2.29.2.334.gfaefdd61ec


