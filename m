Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46B8A3E0036
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Aug 2021 13:32:37 +0200 (CEST)
Received: from localhost ([::1]:52626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBF8V-00016N-TZ
	for lists+qemu-devel@lfdr.de; Wed, 04 Aug 2021 07:32:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laramglazier@gmail.com>)
 id 1mBF79-0008Vx-TE
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 07:31:11 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:40917)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <laramglazier@gmail.com>)
 id 1mBF78-0000jW-3B
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 07:31:11 -0400
Received: by mail-wr1-x430.google.com with SMTP id p5so1845500wro.7
 for <qemu-devel@nongnu.org>; Wed, 04 Aug 2021 04:31:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dHLRt9TuVHix+tiAlFLN5mFqqxwoh+bArXSR3KDnX4M=;
 b=Ki+8F5FO3GTXAQI1ITWz1InJVxUO16y28Gb8uHQU+40FVkWTzd4WBjALW1qcYUrm6V
 j0Tec5MPsQDuggXM/ri6EFl+isOg6Jmm+3Lcxoexo+1ye/eqD8Nhy0RxVkQ+/gjp5eHJ
 prEKRgvHVDGUdYiRuCyqg72cNZPjIVLRix9t5lI9yhJtaDWEvmrCTcClQ6CLPjCzcEF5
 p+MsR+daniPFCLt6ZCwL9yoMMoL/LCPRw8B0s3T6lKa5DqDhoniOagTU0EDdFBDSOIdR
 Oa/Z0HJg6pSIDRdLNSbYibd8pW6Y+/X/eu6gb8tB7TqVMuL0p1A8T9tfgsRJsSoc6KnU
 CHvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dHLRt9TuVHix+tiAlFLN5mFqqxwoh+bArXSR3KDnX4M=;
 b=OwqYdhAne8IwBOTlvHmTNhK780/UuhDBhJjEFaHJmzjEYIaKGkW+2hv9aRQ1uiPSgT
 RrRzfiM8DeYurv4AbKoJ7i5YMfY1LC75g/E2jUGjEbWpuc7ozmRBAcJDCGHWpbI2wj4e
 ZukXHPYu3E1KEiocoIetQ6ptgxOdkQtuFRDkFBRhWOEzxDUG5qx6XzUa0wJkCUNoWQUR
 livcqgV/Azj6u+oq9o9g1XgElirXfF44owTQNqzY9d30AlbUb1Tk8TzB7Wiiv2pF0NDz
 eckIWmQvmQ9ZxoQ40Ze9XZiER6nteiSZjxUhPZZo5nNfuUS6ZA9ZqKt2+InbP805gRxY
 2UrQ==
X-Gm-Message-State: AOAM531eieUGH50Rbbr2RuWUtLXmaMCM9sSfJh6e3AgJrsQE9tLYUlew
 uJF02nWRcMx8Rk3kT6V0SblFqD4wVUheinlHF+E=
X-Google-Smtp-Source: ABdhPJzHuadLsbfJoXAOClKR0UzRGiApzDnsz3/Chm8AQ1Hp9jHJK0na76gO/nvPxecgDLaswDv/XQ==
X-Received: by 2002:adf:d1e3:: with SMTP id g3mr28664228wrd.104.1628076667757; 
 Wed, 04 Aug 2021 04:31:07 -0700 (PDT)
Received: from laral.fritz.box
 (200116b82bd8960014b79be16de1e56b.dip.versatel-1u1.de.
 [2001:16b8:2bd8:9600:14b7:9be1:6de1:e56b])
 by smtp.gmail.com with ESMTPSA id q14sm2123388wrs.8.2021.08.04.04.31.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Aug 2021 04:31:07 -0700 (PDT)
From: Lara Lazier <laramglazier@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] target/i386: VMRUN and VMLOAD canonicalizations
Date: Wed,  4 Aug 2021 13:30:58 +0200
Message-Id: <20210804113058.45186-1-laramglazier@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=laramglazier@gmail.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: pbonzini@redhat.com, Lara Lazier <laramglazier@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

APM2 requires that VMRUN and VMLOAD canonicalize (sign extend to 63
from 48/57) all base addresses in the segment registers that have been
respectively loaded.

Signed-off-by: Lara Lazier <laramglazier@gmail.com>
---
 target/i386/cpu.c                   | 19 +++++++++++--------
 target/i386/cpu.h                   |  2 ++
 target/i386/tcg/sysemu/svm_helper.c | 27 +++++++++++++++++----------
 3 files changed, 30 insertions(+), 18 deletions(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 71d26cf1bd..de4c8316c9 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -5108,6 +5108,15 @@ static void x86_register_cpudef_types(const X86CPUDefinition *def)
 
 }
 
+uint32_t cpu_x86_virtual_addr_width(CPUX86State *env)
+{
+    if  (env->features[FEAT_7_0_ECX] & CPUID_7_0_ECX_LA57) {
+        return 57; /* 57 bits virtual */
+    } else {
+        return 48; /* 48 bits virtual */
+    }
+}
+
 void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
                    uint32_t *eax, uint32_t *ebx,
                    uint32_t *ecx, uint32_t *edx)
@@ -5510,16 +5519,10 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
         break;
     case 0x80000008:
         /* virtual & phys address size in low 2 bytes. */
+        *eax = cpu->phys_bits;
         if (env->features[FEAT_8000_0001_EDX] & CPUID_EXT2_LM) {
             /* 64 bit processor */
-            *eax = cpu->phys_bits; /* configurable physical bits */
-            if  (env->features[FEAT_7_0_ECX] & CPUID_7_0_ECX_LA57) {
-                *eax |= 0x00003900; /* 57 bits virtual */
-            } else {
-                *eax |= 0x00003000; /* 48 bits virtual */
-            }
-        } else {
-            *eax = cpu->phys_bits;
+             *eax |= (cpu_x86_virtual_addr_width(env) << 8);
         }
         *ebx = env->features[FEAT_8000_0008_EBX];
         if (cs->nr_cores * cs->nr_threads > 1) {
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 6c50d3ab4f..c9c7350c76 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -1954,6 +1954,8 @@ typedef struct PropValue {
 } PropValue;
 void x86_cpu_apply_props(X86CPU *cpu, PropValue *props);
 
+uint32_t cpu_x86_virtual_addr_width(CPUX86State *env);
+
 /* cpu.c other functions (cpuid) */
 void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
                    uint32_t *eax, uint32_t *ebx,
diff --git a/target/i386/tcg/sysemu/svm_helper.c b/target/i386/tcg/sysemu/svm_helper.c
index 6c29a6a778..032561ef8c 100644
--- a/target/i386/tcg/sysemu/svm_helper.c
+++ b/target/i386/tcg/sysemu/svm_helper.c
@@ -41,6 +41,16 @@ static inline void svm_save_seg(CPUX86State *env, hwaddr addr,
              ((sc->flags >> 8) & 0xff) | ((sc->flags >> 12) & 0x0f00));
 }
 
+/*
+ * VMRUN and VMLOAD canonicalizes (i.e., sign-extend to bit 63) all base
+ * addresses in the segment registers that have been loaded.
+ */
+static inline void svm_canonicalization(CPUX86State *env, target_ulong *seg_base)
+{
+    uint16_t shift_amt = 64 - cpu_x86_virtual_addr_width(env);
+    *seg_base = ((((long) *seg_base) << shift_amt) >> shift_amt);
+}
+
 static inline void svm_load_seg(CPUX86State *env, hwaddr addr,
                                 SegmentCache *sc)
 {
@@ -53,6 +63,7 @@ static inline void svm_load_seg(CPUX86State *env, hwaddr addr,
     sc->limit = x86_ldl_phys(cs, addr + offsetof(struct vmcb_seg, limit));
     flags = x86_lduw_phys(cs, addr + offsetof(struct vmcb_seg, attrib));
     sc->flags = ((flags & 0xff) << 8) | ((flags & 0x0f00) << 12);
+    svm_canonicalization(env, &sc->base);
 }
 
 static inline void svm_load_seg_cache(CPUX86State *env, hwaddr addr,
@@ -256,16 +267,6 @@ void helper_vmrun(CPUX86State *env, int aflag, int next_eip_addend)
     env->tsc_offset = x86_ldq_phys(cs, env->vm_vmcb +
                                offsetof(struct vmcb, control.tsc_offset));
 
-    env->gdt.base  = x86_ldq_phys(cs, env->vm_vmcb + offsetof(struct vmcb,
-                                                      save.gdtr.base));
-    env->gdt.limit = x86_ldl_phys(cs, env->vm_vmcb + offsetof(struct vmcb,
-                                                      save.gdtr.limit));
-
-    env->idt.base  = x86_ldq_phys(cs, env->vm_vmcb + offsetof(struct vmcb,
-                                                      save.idtr.base));
-    env->idt.limit = x86_ldl_phys(cs, env->vm_vmcb + offsetof(struct vmcb,
-                                                      save.idtr.limit));
-
     new_cr0 = x86_ldq_phys(cs, env->vm_vmcb + offsetof(struct vmcb, save.cr0));
     if (new_cr0 & SVM_CR0_RESERVED_MASK) {
         cpu_vmexit(env, SVM_EXIT_ERR, 0, GETPC());
@@ -319,6 +320,10 @@ void helper_vmrun(CPUX86State *env, int aflag, int next_eip_addend)
                        R_SS);
     svm_load_seg_cache(env, env->vm_vmcb + offsetof(struct vmcb, save.ds),
                        R_DS);
+    svm_load_seg(env, env->vm_vmcb + offsetof(struct vmcb, save.idtr),
+                       &env->idt);
+    svm_load_seg(env, env->vm_vmcb + offsetof(struct vmcb, save.gdtr),
+                       &env->gdt);
 
     env->eip = x86_ldq_phys(cs,
                         env->vm_vmcb + offsetof(struct vmcb, save.rip));
@@ -456,6 +461,7 @@ void helper_vmload(CPUX86State *env, int aflag)
     env->lstar = x86_ldq_phys(cs, addr + offsetof(struct vmcb, save.lstar));
     env->cstar = x86_ldq_phys(cs, addr + offsetof(struct vmcb, save.cstar));
     env->fmask = x86_ldq_phys(cs, addr + offsetof(struct vmcb, save.sfmask));
+    svm_canonicalization(env, &env->kernelgsbase);
 #endif
     env->star = x86_ldq_phys(cs, addr + offsetof(struct vmcb, save.star));
     env->sysenter_cs = x86_ldq_phys(cs,
@@ -464,6 +470,7 @@ void helper_vmload(CPUX86State *env, int aflag)
                                                  save.sysenter_esp));
     env->sysenter_eip = x86_ldq_phys(cs, addr + offsetof(struct vmcb,
                                                  save.sysenter_eip));
+
 }
 
 void helper_vmsave(CPUX86State *env, int aflag)
-- 
2.25.1


