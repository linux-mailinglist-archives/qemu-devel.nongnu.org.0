Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E40AC4D16C5
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 13:00:37 +0100 (CET)
Received: from localhost ([::1]:56338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRYW3-0003Pq-Rc
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 07:00:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nRY7k-0007rd-IC
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 06:35:28 -0500
Received: from [2a00:1450:4864:20::530] (port=34484
 helo=mail-ed1-x530.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nRY7e-00060F-El
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 06:35:26 -0500
Received: by mail-ed1-x530.google.com with SMTP id g3so11831793edu.1
 for <qemu-devel@nongnu.org>; Tue, 08 Mar 2022 03:35:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vN+clp7Q8VAT6jg2uzPLPsUUCcrwWH3qWN2JGe/o84A=;
 b=oDmwq9Tp3GrmhxhbSpHte3KE0nXUC+5lIlkpQwqGSTHipIRE6y4h8OvnfAzKaHV4xW
 2Jmr9dNoJAftVmrZAkC8yUZE9lMGQO5uREzfYEx8WYS0t6/oSXgj/gNSisXAzmHZR7Oe
 19DsMc4gdatC2nAlVeARWvWRVw2mVhAF1PbVrtL3av40+W3/f/ftpdga1ugYSepngc4u
 79NOTAxfvqFPFbQ9Wobh2lv+JoqMXauTHjSFQfntokHxyu5ykNWeyYdhrwYQoozH3cwA
 KoPV2zQx3wswVh6v94vCpn2l0VNmF0M74Ly/RgJwdksMjlIZdPtoBCvzR6Fv+KoHCD1n
 GGCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=vN+clp7Q8VAT6jg2uzPLPsUUCcrwWH3qWN2JGe/o84A=;
 b=6BXmWc0WGCtwvmkCNO9bRtVoerC5Sz0RQS+ubFAHRbWD9iO3ohMtOaXeLxQAFBda+h
 rkveEE1qAnV2Ka4PTat2UVPC6Ldw694HDH9evVPqT5DcOMVcb6kjwgfrOXyM+KcJgncm
 XotEJxkdoEu3Aih0ivRNfdtKplqNXn+Z06iqebYuBeTf9hVmpuUDRm+ZtzrNwYSEihOo
 IPRQ6qrLWNzOt9Tc349qTXq6LBporMTcdz8DwdHaHb1pwCuQu5fRJekOl2CrIUCAy8y9
 ZvtfICtBBn8LTJJtrdbyQZXnWCBTS9OJNPa5Kmfis/Hj9UWzaUR6egxjDaTUmgildmPf
 NS0A==
X-Gm-Message-State: AOAM531oqlSgj6LixtxwrgmrMMmbcAG7bhXdLlt15Yx2Tr2VmQ0GwEpe
 lt8XzJbYPQv3KGO4Go+IgIJPFijEyww=
X-Google-Smtp-Source: ABdhPJxJvBZV56B330+WK37t3qGwraASPfcUfizYmrhfRojdJ1EY6Bg4yfl3nT/iQoEtlvHLO0gabA==
X-Received: by 2002:a05:6402:442:b0:416:14b7:4d55 with SMTP id
 p2-20020a056402044200b0041614b74d55mr15471166edw.183.1646739314344; 
 Tue, 08 Mar 2022 03:35:14 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 l2-20020aa7cac2000000b003f9b3ac68d6sm7491868edt.15.2022.03.08.03.35.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Mar 2022 03:35:13 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 15/22] x86: Grant AMX permission for guest
Date: Tue,  8 Mar 2022 12:34:38 +0100
Message-Id: <20220308113445.859669-16-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220308113445.859669-1-pbonzini@redhat.com>
References: <20220308113445.859669-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::530
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x530.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Yang Zhong <yang.zhong@intel.com>, Jing Liu <jing2.liu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Yang Zhong <yang.zhong@intel.com>

Kernel allocates 4K xstate buffer by default. For XSAVE features
which require large state component (e.g. AMX), Linux kernel
dynamically expands the xstate buffer only after the process has
acquired the necessary permissions. Those are called dynamically-
enabled XSAVE features (or dynamic xfeatures).

There are separate permissions for native tasks and guests.

Qemu should request the guest permissions for dynamic xfeatures
which will be exposed to the guest. This only needs to be done
once before the first vcpu is created.

KVM implemented one new ARCH_GET_XCOMP_SUPP system attribute API to
get host side supported_xcr0 and Qemu can decide if it can request
dynamically enabled XSAVE features permission.
https://lore.kernel.org/all/20220126152210.3044876-1-pbonzini@redhat.com/

Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Yang Zhong <yang.zhong@intel.com>
Signed-off-by: Jing Liu <jing2.liu@intel.com>
Message-Id: <20220217060434.52460-4-yang.zhong@intel.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/cpu.c          |  7 +++++
 target/i386/cpu.h          |  4 +++
 target/i386/kvm/kvm-cpu.c  | 12 ++++----
 target/i386/kvm/kvm.c      | 57 ++++++++++++++++++++++++++++++++++++++
 target/i386/kvm/kvm_i386.h |  1 +
 5 files changed, 75 insertions(+), 6 deletions(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index ec35dd1717..505ee289bc 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -6007,6 +6007,7 @@ static void x86_cpu_enable_xsave_components(X86CPU *cpu)
     CPUX86State *env = &cpu->env;
     int i;
     uint64_t mask;
+    static bool request_perm;
 
     if (!(env->features[FEAT_1_ECX] & CPUID_EXT_XSAVE)) {
         env->features[FEAT_XSAVE_COMP_LO] = 0;
@@ -6022,6 +6023,12 @@ static void x86_cpu_enable_xsave_components(X86CPU *cpu)
         }
     }
 
+    /* Only request permission for first vcpu */
+    if (kvm_enabled() && !request_perm) {
+        kvm_request_xsave_components(cpu, mask);
+        request_perm = true;
+    }
+
     env->features[FEAT_XSAVE_COMP_LO] = mask;
     env->features[FEAT_XSAVE_COMP_HI] = mask >> 32;
 }
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 3ff1b49d29..9630f4712a 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -551,6 +551,10 @@ typedef enum X86Seg {
 #define XSTATE_ZMM_Hi256_MASK           (1ULL << XSTATE_ZMM_Hi256_BIT)
 #define XSTATE_Hi16_ZMM_MASK            (1ULL << XSTATE_Hi16_ZMM_BIT)
 #define XSTATE_PKRU_MASK                (1ULL << XSTATE_PKRU_BIT)
+#define XSTATE_XTILE_CFG_MASK           (1ULL << XSTATE_XTILE_CFG_BIT)
+#define XSTATE_XTILE_DATA_MASK          (1ULL << XSTATE_XTILE_DATA_BIT)
+
+#define XSTATE_DYNAMIC_MASK             (XSTATE_XTILE_DATA_MASK)
 
 #define ESA_FEATURE_ALIGN64_BIT         1
 
diff --git a/target/i386/kvm/kvm-cpu.c b/target/i386/kvm/kvm-cpu.c
index ce27d3b1df..a35a1bf9fe 100644
--- a/target/i386/kvm/kvm-cpu.c
+++ b/target/i386/kvm/kvm-cpu.c
@@ -84,7 +84,7 @@ static void kvm_cpu_max_instance_init(X86CPU *cpu)
 static void kvm_cpu_xsave_init(void)
 {
     static bool first = true;
-    KVMState *s = kvm_state;
+    uint32_t eax, ebx, ecx, edx;
     int i;
 
     if (!first) {
@@ -100,11 +100,11 @@ static void kvm_cpu_xsave_init(void)
         ExtSaveArea *esa = &x86_ext_save_areas[i];
 
         if (esa->size) {
-            int sz = kvm_arch_get_supported_cpuid(s, 0xd, i, R_EAX);
-            if (sz != 0) {
-                assert(esa->size == sz);
-                esa->offset = kvm_arch_get_supported_cpuid(s, 0xd, i, R_EBX);
-                esa->ecx = kvm_arch_get_supported_cpuid(s, 0xd, i, R_ECX);
+            host_cpuid(0xd, i, &eax, &ebx, &ecx, &edx);
+            if (eax != 0) {
+                assert(esa->size == eax);
+                esa->offset = ebx;
+                esa->ecx = ecx;
             }
         }
     }
diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index cfef36a14e..1e4436ee74 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -17,6 +17,7 @@
 #include "qapi/error.h"
 #include <sys/ioctl.h>
 #include <sys/utsname.h>
+#include <sys/syscall.h>
 
 #include <linux/kvm.h>
 #include "standard-headers/asm-x86/kvm_para.h"
@@ -348,6 +349,7 @@ uint32_t kvm_arch_get_supported_cpuid(KVMState *s, uint32_t function,
     struct kvm_cpuid2 *cpuid;
     uint32_t ret = 0;
     uint32_t cpuid_1_edx;
+    uint64_t bitmask;
 
     cpuid = get_supported_cpuid(s);
 
@@ -405,6 +407,25 @@ uint32_t kvm_arch_get_supported_cpuid(KVMState *s, uint32_t function,
         if (!has_msr_arch_capabs) {
             ret &= ~CPUID_7_0_EDX_ARCH_CAPABILITIES;
         }
+    } else if (function == 0xd && index == 0 &&
+               (reg == R_EAX || reg == R_EDX)) {
+        struct kvm_device_attr attr = {
+            .group = 0,
+            .attr = KVM_X86_XCOMP_GUEST_SUPP,
+            .addr = (unsigned long) &bitmask
+        };
+
+        bool sys_attr = kvm_check_extension(s, KVM_CAP_SYS_ATTRIBUTES);
+        if (!sys_attr) {
+            warn_report("cannot get sys attribute capabilities %d", sys_attr);
+        }
+
+        int rc = kvm_ioctl(s, KVM_GET_DEVICE_ATTR, &attr);
+        if (rc == -1 && (errno == ENXIO || errno == EINVAL)) {
+            warn_report("KVM_GET_DEVICE_ATTR(0, KVM_X86_XCOMP_GUEST_SUPP) "
+                        "error: %d", rc);
+        }
+        ret = (reg == R_EAX) ? bitmask : bitmask >> 32;
     } else if (function == 0x80000001 && reg == R_ECX) {
         /*
          * It's safe to enable TOPOEXT even if it's not returned by
@@ -5150,3 +5171,39 @@ bool kvm_arch_cpu_check_are_resettable(void)
 {
     return !sev_es_enabled();
 }
+
+#define ARCH_REQ_XCOMP_GUEST_PERM       0x1025
+
+void kvm_request_xsave_components(X86CPU *cpu, uint64_t mask)
+{
+    KVMState *s = kvm_state;
+    uint64_t supported;
+
+    mask &= XSTATE_DYNAMIC_MASK;
+    if (!mask) {
+        return;
+    }
+    /*
+     * Just ignore bits that are not in CPUID[EAX=0xD,ECX=0].
+     * ARCH_REQ_XCOMP_GUEST_PERM would fail, and QEMU has warned
+     * about them already because they are not supported features.
+     */
+    supported = kvm_arch_get_supported_cpuid(s, 0xd, 0, R_EAX);
+    supported |= (uint64_t)kvm_arch_get_supported_cpuid(s, 0xd, 0, R_EDX) << 32;
+    mask &= supported;
+
+    while (mask) {
+        int bit = ctz64(mask);
+        int rc = syscall(SYS_arch_prctl, ARCH_REQ_XCOMP_GUEST_PERM, bit);
+        if (rc) {
+            /*
+             * Older kernel version (<5.17) do not support
+             * ARCH_REQ_XCOMP_GUEST_PERM, but also do not return
+             * any dynamic feature from kvm_arch_get_supported_cpuid.
+             */
+            warn_report("prctl(ARCH_REQ_XCOMP_GUEST_PERM) failure "
+                        "for feature bit %d", bit);
+        }
+        mask &= ~BIT_ULL(bit);
+    }
+}
diff --git a/target/i386/kvm/kvm_i386.h b/target/i386/kvm/kvm_i386.h
index a978509d50..4124912c20 100644
--- a/target/i386/kvm/kvm_i386.h
+++ b/target/i386/kvm/kvm_i386.h
@@ -52,5 +52,6 @@ bool kvm_hyperv_expand_features(X86CPU *cpu, Error **errp);
 uint64_t kvm_swizzle_msi_ext_dest_id(uint64_t address);
 
 bool kvm_enable_sgx_provisioning(KVMState *s);
+void kvm_request_xsave_components(X86CPU *cpu, uint64_t mask);
 
 #endif
-- 
2.35.1



