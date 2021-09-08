Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F28524037C4
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 12:22:51 +0200 (CEST)
Received: from localhost ([::1]:45186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNujC-0001N6-V0
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 06:22:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mNuRs-0006f3-DX
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 06:04:56 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:51819)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mNuRo-00031z-DW
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 06:04:56 -0400
Received: by mail-wm1-x32a.google.com with SMTP id y132so1292119wmc.1
 for <qemu-devel@nongnu.org>; Wed, 08 Sep 2021 03:04:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LC5VH5NI8pKhGNYk7uPvZs6fVdmsLzpsFOKaHgxPcHE=;
 b=Oq/zZoGyCtR+6Y9I+DDerY2xBCQ7dnVqDcqBnXCFzCwJ3imFp7rb0vMt/FNnpTHD6k
 pXMG/quNRWac6UprtWWXtXBSL/YQkZdVTLU2+nQVm+NXPaJ/PaWv04HaZOzt5qUp6ZC7
 630MEkMCY6EfIQumQhL/ni24xilfm19SJMIb2fvdkra7wdur7yoJdUiTJBbDcsAmiT3r
 wrb2ibk+l25P6uIG7NF0EVcqqE+GSA8W6j4MHnKiy+2vUKIh/hxBofVKDYMmwF0vyEwp
 KYNgKDGPPHd6AfcrJwHZf9p70pidlT8m/lRf65qJ3Lz9wEN1JhccFj+MKGDL7pr1pX+W
 Fy2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=LC5VH5NI8pKhGNYk7uPvZs6fVdmsLzpsFOKaHgxPcHE=;
 b=Lyg4OgTRQ2jyxwePcqQG2wFOU6zs2qLZEifyGwqWa50SCG+gM1jEBlypLlx3M+/LT+
 m7SCp4MQmvwtwE0mGTu8aU3kB+sL+yfjuHVUnmpwCr2EL/HHUn5yKd7OmtR5F4I1noe8
 pdQsY5YxFS63AfrHZqgemIlcY/fia27J7Jv8U0WVEotVxZC1Gu0Cq2T4Oa207vdpJYlG
 jufkKRiA6TVH9eV2D/hRnz2mwIyflj9SCBwz2GMFfPwUwBogeo1XEg/sWWqKC4jqVxMs
 8AB6gv5Ur80E/cOtyNGtzdeOt3yqKCkReWklVHLC1DuJTDWrWeK3+Z0LyVn74gZXjOFC
 X25w==
X-Gm-Message-State: AOAM530tn8mqW1AA4zOSG1PsdbznzpaGVKQ+us8Am4ofre9a8Wi9mhJ3
 QjFD6p+V7wugQpfq4zNIiu1TjQhUmAw=
X-Google-Smtp-Source: ABdhPJxKIB1PUhDGyqHlddMqxlUUrd+13ncwtkQgcEsGjmvLDZ09AgYfDGy05Nw9mQFJDRED5l/nfw==
X-Received: by 2002:a1c:e91a:: with SMTP id q26mr2028896wmc.128.1631095490996; 
 Wed, 08 Sep 2021 03:04:50 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id u8sm1683715wmq.45.2021.09.08.03.04.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Sep 2021 03:04:50 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v4 21/43] i386: Update SGX CPUID info according to
 hardware/KVM/user input
Date: Wed,  8 Sep 2021 12:04:04 +0200
Message-Id: <20210908100426.264356-22-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210908100426.264356-1-pbonzini@redhat.com>
References: <20210908100426.264356-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: Yang Zhong <yang.zhong@intel.com>,
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

v3-->v4:
   - Replaced g_malloc0() with directly ....
Message-Id: <20210719112136.57018-13-yang.zhong@intel.com>

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
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
index 59cb2c2d03..38cf507199 100644
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



