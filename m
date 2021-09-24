Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE07641710C
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 13:42:14 +0200 (CEST)
Received: from localhost ([::1]:37102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTjan-00083j-Vt
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 07:42:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mTjKW-0007kO-O8
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 07:25:24 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:44564)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mTjKU-0000XN-OV
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 07:25:24 -0400
Received: by mail-ed1-x534.google.com with SMTP id v22so34024830edd.11
 for <qemu-devel@nongnu.org>; Fri, 24 Sep 2021 04:25:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ckm63rG6PrQKNaZYx9GzsYEPnaX0K6c7bQ2QgLspzxc=;
 b=go+e4gP9kX9uUKuY/lOVKa3LGwxdMU56eCYr8uW2hlD2l83BouTpmCwAKmiIsOaeOS
 CDKXGEioKX3OK3G22ZksE+b5cen2pJoW7ONtN2AAaI7rgjQYio1/x7/KqmVlq3ibAk5G
 JfiyGCXdtsBa9qbaLSe18sr57xWj622VmRZzyRgUtZxUJIm3Kk+L/xTvDpABQSv1MC4q
 zlS/jRSPlry7AXLbcqeXgw32JuUbvsGyYm62Lt4baJdVwciDcLkTyqrGpzUd2EXG/dkQ
 Vb7btY12UKgzFGvIdQZIJjop9iw0pziFWEJJfIL32WSZIW5nQcCHX5XwZWr7PoSRGDn3
 0geA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Ckm63rG6PrQKNaZYx9GzsYEPnaX0K6c7bQ2QgLspzxc=;
 b=CyIlOUIuTB8DqmBnN/U3WA1ceuGNmv4yRzay59MegeVzdr3rlU8WPfu/0F6Xkbvmq/
 mN4T0I0p/o9Tzv7glgkZ49K8xGOaF3ZnkRncTMiixRKtfoTgO7nQ2H8r0Cfc6rvrx+ti
 YctJ+dLVUp3qLJv0aBB3w13LDTdcKMLkb9gAFaEGKcWqXmrEb9Z2XAuzVHY/8GU09Kqg
 /8ShlUxMMNZMg4cvVrlqFNQ1+ovGMEGDBAlADiPVAE3yRmgWpYyCvOeuBKpSUTtJEaLH
 UO0LB6K1w7kFOrH0IFUPSVzjlNG4mHAJZuNECiCp3yKKtxxYIcsG3oOKvMLFncr6kBge
 MTPg==
X-Gm-Message-State: AOAM531wwWK7uudk5iHzDD+L0UqTwodYM4X0fYMJWfBP+4p7v6eNj6+/
 b4lsDVvkY8lP9XnlrIbQZOHfNyqlVaE=
X-Google-Smtp-Source: ABdhPJxiR2SNzmBBquNMBDYMijvAWHvbqT+s5Iv91ArdAtVPlmfvPqs4ntfSzZCMSiscoK6oSJRLFQ==
X-Received: by 2002:a17:906:5855:: with SMTP id
 h21mr10339908ejs.230.1632482721372; 
 Fri, 24 Sep 2021 04:25:21 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id t14sm4886961ejf.24.2021.09.24.04.25.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Sep 2021 04:25:21 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 13/26] i386: Update SGX CPUID info according to
 hardware/KVM/user input
Date: Fri, 24 Sep 2021 13:24:56 +0200
Message-Id: <20210924112509.25061-14-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210924112509.25061-1-pbonzini@redhat.com>
References: <20210924112509.25061-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x534.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: yang.zhong@intel.com, philmd@redhat.com, eblake@redhat.com,
 Sean Christopherson <sean.j.christopherson@intel.com>
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
Message-Id: <20210719112136.57018-13-yang.zhong@intel.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/i386/meson.build       |  3 +-
 hw/i386/sgx-stub.c        | 13 +++++++
 hw/i386/sgx.c             | 73 +++++++++++++++++++++++++++++++++++++
 include/hw/i386/pc.h      |  3 ++
 include/hw/i386/sgx-epc.h |  2 +
 target/i386/cpu.c         | 77 +++++++++++++++++++++++++++++++++++++++
 6 files changed, 170 insertions(+), 1 deletion(-)
 create mode 100644 hw/i386/sgx-stub.c
 create mode 100644 hw/i386/sgx.c

diff --git a/hw/i386/meson.build b/hw/i386/meson.build
index b1862c83d4..c502965219 100644
--- a/hw/i386/meson.build
+++ b/hw/i386/meson.build
@@ -16,7 +16,8 @@ i386_ss.add(when: 'CONFIG_Q35', if_true: files('pc_q35.c'))
 i386_ss.add(when: 'CONFIG_VMMOUSE', if_true: files('vmmouse.c'))
 i386_ss.add(when: 'CONFIG_VMPORT', if_true: files('vmport.c'))
 i386_ss.add(when: 'CONFIG_VTD', if_true: files('intel_iommu.c'))
-i386_ss.add(when: 'CONFIG_SGX', if_true: files('sgx-epc.c'))
+i386_ss.add(when: 'CONFIG_SGX', if_true: files('sgx-epc.c','sgx.c'),
+                                if_false: files('sgx-stub.c'))
 
 i386_ss.add(when: 'CONFIG_ACPI', if_true: files('acpi-common.c'))
 i386_ss.add(when: 'CONFIG_ACPI_HW_REDUCED', if_true: files('generic_event_device_x86.c'))
diff --git a/hw/i386/sgx-stub.c b/hw/i386/sgx-stub.c
new file mode 100644
index 0000000000..483c72bba6
--- /dev/null
+++ b/hw/i386/sgx-stub.c
@@ -0,0 +1,13 @@
+#include "qemu/osdep.h"
+#include "hw/i386/pc.h"
+#include "hw/i386/sgx-epc.h"
+
+void pc_machine_init_sgx_epc(PCMachineState *pcms)
+{
+    memset(&pcms->sgx_epc, 0, sizeof(SGXEPCState));
+}
+
+int sgx_epc_get_section(int section_nr, uint64_t *addr, uint64_t *size)
+{
+    g_assert_not_reached();
+}
diff --git a/hw/i386/sgx.c b/hw/i386/sgx.c
new file mode 100644
index 0000000000..8a18cddc3f
--- /dev/null
+++ b/hw/i386/sgx.c
@@ -0,0 +1,73 @@
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
+void pc_machine_init_sgx_epc(PCMachineState *pcms)
+{
+    SGXEPCState *sgx_epc = &pcms->sgx_epc;
+    X86MachineState *x86ms = X86_MACHINE(pcms);
+    SgxEPCList *list = NULL;
+    Object *obj;
+
+    memset(sgx_epc, 0, sizeof(SGXEPCState));
+    if (!x86ms->sgx_epc_list) {
+        return;
+    }
+
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
+        object_property_parse(obj, SGX_EPC_MEMDEV_PROP, list->value->memdev,
+                              &error_fatal);
+        object_property_set_bool(obj, "realized", true, &error_fatal);
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
diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
index 668e48be8a..5748d7c55f 100644
--- a/include/hw/i386/pc.h
+++ b/include/hw/i386/pc.h
@@ -195,6 +195,9 @@ void pc_system_parse_ovmf_flash(uint8_t *flash_ptr, size_t flash_size);
 void pc_madt_cpu_entry(AcpiDeviceIf *adev, int uid,
                        const CPUArchIdList *apic_ids, GArray *entry);
 
+/* sgx.c */
+void pc_machine_init_sgx_epc(PCMachineState *pcms);
+
 extern GlobalProperty pc_compat_6_1[];
 extern const size_t pc_compat_6_1_len;
 
diff --git a/include/hw/i386/sgx-epc.h b/include/hw/i386/sgx-epc.h
index 83269972e0..75b19f464c 100644
--- a/include/hw/i386/sgx-epc.h
+++ b/include/hw/i386/sgx-epc.h
@@ -55,4 +55,6 @@ typedef struct SGXEPCState {
     int nr_sections;
 } SGXEPCState;
 
+int sgx_epc_get_section(int section_nr, uint64_t *addr, uint64_t *size);
+
 #endif
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index af6cd73eed..8a62986819 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -36,6 +36,7 @@
 #ifndef CONFIG_USER_ONLY
 #include "exec/address-spaces.h"
 #include "hw/boards.h"
+#include "hw/i386/sgx-epc.h"
 #endif
 
 #include "disas/capstone.h"
@@ -5334,6 +5335,25 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
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
@@ -5469,6 +5489,63 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
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
2.31.1



