Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EEEE403797
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 12:11:00 +0200 (CEST)
Received: from localhost ([::1]:34916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNuXj-0000gh-B0
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 06:10:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mNuRe-0006J2-QU
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 06:04:42 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:40505)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mNuRa-0002os-TN
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 06:04:41 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 n14-20020a05600c3b8e00b002f8bd2f8ab6so1108454wms.5
 for <qemu-devel@nongnu.org>; Wed, 08 Sep 2021 03:04:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XWN6TWfYGXaOKzPRhA5oC6s5wzK7ZkowpHJRh9f6v9w=;
 b=VD+3ToXJonH47J01v3WUPNcO8cWSXb0zt8WcylqE6o9Hgpr0tS1UDSdOC65vCvxtWj
 QnEmBy/3tigpC+X1GHeaLHXO5uLYGLN6dxcHyKD/SPndRDzZfsXioQC9nQ2zMn6F9cD9
 aQumrkmrp1zwIbNoK+mQZQ5Y4hvRs5Lm6ecY0MRmDmadnEc+xqA4pFwlFBll8Y5vwPQY
 85dxvqmVzeHWn8IoYvDCRHKOyU4bfFqZPecfDgKDLCCpcRdip2E9+rM5QsE+FEFkk63o
 PrGEd9JY6tpw7CZVoS4dHhkNrUyshgnot6Xk3EzN/+bOKDOWlI4YxDQ2zU/9ofvyUi1h
 +ZZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=XWN6TWfYGXaOKzPRhA5oC6s5wzK7ZkowpHJRh9f6v9w=;
 b=EUVA4HXPvqjvQ32LLQ7r1gKqylva08sZh2ro4bPnDW8WHnsyw/upwuHp6VndQ5zvOl
 +XmL2KXoodW8HHvisOYomuxTXUAJY0yF93Iy45ma5/G30U1CXttfJyY58CwYCJ9Ctfmh
 MRM5wWZdvdxX4QI4nrLYJtiGi/LD2sNdowFcXnBNZEUMyzwlz8jOj/AVTl9+rqijzGYm
 SZUa7F8zenh0+L3SHsJRsxKr3uTiUQScM4vLUni9sA29kGZaplfqrKnh7SKFPhcMcC1O
 kne015draJbowt46CpJDiHqsKWEUO4HZ2SoZ9D6P8hfIqleUaQKDcRax3cRGg+IEU1sc
 qQoQ==
X-Gm-Message-State: AOAM530nJYsVssvqCo+3mVmleXD8HxkIX64Ar5Shqu+BqOG0hts85d1f
 xmr3bBX8FedMHxWreTPfRNzXcQSOD5o=
X-Google-Smtp-Source: ABdhPJxIkVjDy3WUHnImH4G6qXKnvG6sMQWF72aqpsAnEyy9VvDjMpBB6RXcbe32wthiLrveFqMEWQ==
X-Received: by 2002:a05:600c:3209:: with SMTP id
 r9mr2712287wmp.106.1631095477481; 
 Wed, 08 Sep 2021 03:04:37 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id u8sm1683715wmq.45.2021.09.08.03.04.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Sep 2021 03:04:37 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v4 02/43] target/i386: VMRUN and VMLOAD canonicalizations
Date: Wed,  8 Sep 2021 12:03:45 +0200
Message-Id: <20210908100426.264356-3-pbonzini@redhat.com>
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
index 21b33fbe2e..aafc2eb696 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -1955,6 +1955,8 @@ typedef struct PropValue {
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



