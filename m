Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A367401C21
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Sep 2021 15:13:17 +0200 (CEST)
Received: from localhost ([::1]:45454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNER2-0003HJ-Ds
	for lists+qemu-devel@lfdr.de; Mon, 06 Sep 2021 09:13:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mNEOy-0000SZ-Ue
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 09:11:08 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:43672)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mNEOw-0007Gq-8V
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 09:11:08 -0400
Received: by mail-wr1-x431.google.com with SMTP id b6so9793745wrh.10
 for <qemu-devel@nongnu.org>; Mon, 06 Sep 2021 06:11:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tfrJRkAq0ykW5VhqYtFu7rbruustJjnKv79ktXDdBp8=;
 b=nn8lR4kKaZcYxxH1S7KWC+NhiIrnS3oXHdNm3hCcs26nuRpx1B7fNvmZ8KxQi/eawf
 h8sEWl5207ObIb9hmCD1/hagmW8CeCidBf2IMFjHrYkXN1/tvm5KW1UYrNjbGZItLn/8
 LwmbQThttPeM96htxNMt2mdoTwU427D2+nnkunmeBE13iXiYPqjwAb0ItxNaOsRPbmNK
 +N55zuZyPIy57M/JmmbvBHQwSx9AuyeXnPREk8c3NuDJPRjVVBiZUcD7XM4xAJ48si07
 1dgw5fg63aAy9xZA2YSluKulj6GDd+Su3+Gh2vvOpciQG+tdjYL/UVfoznXuE+RWqAXu
 hyYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=tfrJRkAq0ykW5VhqYtFu7rbruustJjnKv79ktXDdBp8=;
 b=rL6GdHQVG3CXFMz3KECbfZUwKQw/F11345sSgIuSHqajwYYbPODzkA3x3kNw4Kr0rX
 2E+faBD32lTjvVh4aVA5AoDNohDYUsjuiqExkGzhxcBHsvfpS3oqJVZE8G2L2OY2fqir
 +nIL4UHvqbblA52cZO4CIUbJa+HOmhfc/vLOi5bwfkDEtTUKDr16AGDFaZR5lfksI3Gm
 jyKYF9ccMyoL/VCu5YyFi59CXpvaoFIFUHZ6nGqFCkBpEh7WKXfl17n/8YDgrRuJOcsf
 0ZqM2slax+dzO7f4eQLm3ddkbRcx6ZKTRVvqgm/GmrORe31j0nCB3HO7KlIruPpCDryn
 A6nw==
X-Gm-Message-State: AOAM532a3fv6ULdZ0GZcknTVo4ey3POLJBbvJxHUtafFLNsqpnCu/NFK
 diS23ABsT9CgxF0fCNE1RRinaRxLowA=
X-Google-Smtp-Source: ABdhPJwAqtOy5BjA4x6nnta10RdF80PY3WKzNp34nlm7dnvm26AV6i7v1ZywN/TDzKgCgmkZ2FgBPw==
X-Received: by 2002:adf:fec8:: with SMTP id q8mr13035219wrs.218.1630933863899; 
 Mon, 06 Sep 2021 06:11:03 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 k4sm7992331wrm.74.2021.09.06.06.11.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Sep 2021 06:11:03 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 01/36] target/i386: VMRUN and VMLOAD canonicalizations
Date: Mon,  6 Sep 2021 15:10:24 +0200
Message-Id: <20210906131059.55234-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210906131059.55234-1-pbonzini@redhat.com>
References: <20210906131059.55234-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x431.google.com
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
Cc: Lara Lazier <laramglazier@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Lara Lazier <laramglazier@gmail.com>

APM2 requires that VMRUN and VMLOAD canonicalize (sign extend to 63
from 48/57) all base addresses in the segment registers that have been
respectively loaded.

Signed-off-by: Lara Lazier <laramglazier@gmail.com>
Message-Id: <20210804113058.45186-1-laramglazier@gmail.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/cpu.c                   | 19 +++++++++++--------
 target/i386/cpu.h                   |  2 ++
 target/i386/tcg/sysemu/svm_helper.c | 27 +++++++++++++++++----------
 3 files changed, 30 insertions(+), 18 deletions(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 97e250e876..fbca4e5860 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -5115,6 +5115,15 @@ static void x86_register_cpudef_types(const X86CPUDefinition *def)
 
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
@@ -5517,16 +5526,10 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
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
index 0d549b3d6c..0e7de4e054 100644
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
@@ -245,16 +256,6 @@ void helper_vmrun(CPUX86State *env, int aflag, int next_eip_addend)
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
@@ -308,6 +309,10 @@ void helper_vmrun(CPUX86State *env, int aflag, int next_eip_addend)
                        R_SS);
     svm_load_seg_cache(env, env->vm_vmcb + offsetof(struct vmcb, save.ds),
                        R_DS);
+    svm_load_seg(env, env->vm_vmcb + offsetof(struct vmcb, save.idtr),
+                       &env->idt);
+    svm_load_seg(env, env->vm_vmcb + offsetof(struct vmcb, save.gdtr),
+                       &env->gdt);
 
     env->eip = x86_ldq_phys(cs,
                         env->vm_vmcb + offsetof(struct vmcb, save.rip));
@@ -446,6 +451,7 @@ void helper_vmload(CPUX86State *env, int aflag)
     env->lstar = x86_ldq_phys(cs, addr + offsetof(struct vmcb, save.lstar));
     env->cstar = x86_ldq_phys(cs, addr + offsetof(struct vmcb, save.cstar));
     env->fmask = x86_ldq_phys(cs, addr + offsetof(struct vmcb, save.sfmask));
+    svm_canonicalization(env, &env->kernelgsbase);
 #endif
     env->star = x86_ldq_phys(cs, addr + offsetof(struct vmcb, save.star));
     env->sysenter_cs = x86_ldq_phys(cs,
@@ -454,6 +460,7 @@ void helper_vmload(CPUX86State *env, int aflag)
                                                  save.sysenter_esp));
     env->sysenter_eip = x86_ldq_phys(cs, addr + offsetof(struct vmcb,
                                                  save.sysenter_eip));
+
 }
 
 void helper_vmsave(CPUX86State *env, int aflag)
-- 
2.31.1



