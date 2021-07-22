Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 976923D26D7
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Jul 2021 17:38:51 +0200 (CEST)
Received: from localhost ([::1]:51888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6amg-0003Ig-MR
	for lists+qemu-devel@lfdr.de; Thu, 22 Jul 2021 11:38:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m6akK-0000bY-6b
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 11:36:24 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:43576)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m6akH-0002kp-6q
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 11:36:23 -0400
Received: by mail-ed1-x530.google.com with SMTP id l26so7309665eda.10
 for <qemu-devel@nongnu.org>; Thu, 22 Jul 2021 08:36:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iRNjWU+xQBwxSuzOkzKqjOuCIKJsPrHkUb10noaPNJw=;
 b=vaDcE0cSAqU3cFZQDwJaiWcC0FVbyPhviVvcnvYIoA9MQ8FwOl2DP+vimiPSCTLI2F
 /11wNVLaKN7qHMIOtRNnwPHFQBJ0vucGMVbtZ5qR7OdZLHwE7A350WnQ5hIKat4X7RhI
 dWC0+Zzqf7szObl/I4oAGMvR7fPnWVB1M89DLU/DBZRToOZV8mbPVwQ145gB/Ib+Yd5h
 6dLyEFQeWq/2A6jnbxkDlYaLXZx5A5IfV5Z0OHyc4bTDBYttlN8hTAU9YMKkSjH6UjRZ
 fYSQB32lrz4Y0UgnIhxNj7vdH3VGQkhcgdW300023nezv4fBLwoPtTQoz7DKm1N35wRR
 lU+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=iRNjWU+xQBwxSuzOkzKqjOuCIKJsPrHkUb10noaPNJw=;
 b=nXuiCA3R6Y0tBdrC2YHUoSWdiCuCd+frbrE0cmRiWI39HaBQ/TP5F3ZrOJ4Z+/61Ny
 Z9ITOgWdpL5f/MEI7dFjtrN0fGP4KnqUNq5Q5NszCy6AmcVVNnz86DMoUPAQYFdk5F2A
 yhJZFzVOj0K1pCHVS7FsYv8EFWeESK1ipwG9h3Zk5hpuIvU+0dl7HXHDySKRGTOVcSs6
 fDB/jTHGw4IvHkmXG0DbqZCVlt/4Oycugobye0demeZCE5mFSCb1pFpPEx1ffsbT89t8
 fDq8OGBbuhZKmYiZulMMNTriRrg8XjJuxPgtodbatwmknH0kHUVn739YMKPVP4fO79yp
 Rwsw==
X-Gm-Message-State: AOAM530xUa9exyOzvyRCN56+z3tmlHamJJPudJ7c++LUZUtFKdyApe1U
 +AKL/Lwr0bVsJh438onM0qWSphwDjFrBWw==
X-Google-Smtp-Source: ABdhPJwb6rMn+ny5+6XwEPVHo29BIGoN88p5pUSvm+SapwymmIIhhGsGausapR4DhqvfJ1AtLE+SOQ==
X-Received: by 2002:aa7:d703:: with SMTP id t3mr294912edq.50.1626968179645;
 Thu, 22 Jul 2021 08:36:19 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id qo6sm9638628ejb.122.2021.07.22.08.36.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jul 2021 08:36:19 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 08/15] target/i386: Added consistency checks for CR4
Date: Thu, 22 Jul 2021 17:36:05 +0200
Message-Id: <20210722153612.955537-9-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210722153612.955537-1-pbonzini@redhat.com>
References: <20210722153612.955537-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x530.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

All MBZ bits in CR4 must be zero. (APM2 15.5)
Added reserved bitmask and added checks in both
helper_vmrun and helper_write_crN.

Signed-off-by: Lara Lazier <laramglazier@gmail.com>
Message-Id: <20210721152651.14683-2-laramglazier@gmail.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/cpu.h                    | 39 ++++++++++++++++++++++++++++
 target/i386/tcg/sysemu/misc_helper.c |  3 +++
 target/i386/tcg/sysemu/svm_helper.c  |  9 ++++---
 3 files changed, 48 insertions(+), 3 deletions(-)

diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 5d98a4e7c0..1f7e8d7f0a 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -240,6 +240,7 @@ typedef enum X86Seg {
 #define CR4_OSFXSR_SHIFT 9
 #define CR4_OSFXSR_MASK (1U << CR4_OSFXSR_SHIFT)
 #define CR4_OSXMMEXCPT_MASK  (1U << 10)
+#define CR4_UMIP_MASK   (1U << 11)
 #define CR4_LA57_MASK   (1U << 12)
 #define CR4_VMXE_MASK   (1U << 13)
 #define CR4_SMXE_MASK   (1U << 14)
@@ -251,6 +252,14 @@ typedef enum X86Seg {
 #define CR4_PKE_MASK   (1U << 22)
 #define CR4_PKS_MASK   (1U << 24)
 
+#define CR4_RESERVED_MASK \
+(~(target_ulong)(CR4_VME_MASK | CR4_PVI_MASK | CR4_TSD_MASK \
+                | CR4_DE_MASK | CR4_PSE_MASK | CR4_PAE_MASK \
+                | CR4_MCE_MASK | CR4_PGE_MASK | CR4_PCE_MASK \
+                | CR4_OSFXSR_MASK | CR4_OSXMMEXCPT_MASK |CR4_UMIP_MASK \
+                | CR4_FSGSBASE_MASK | CR4_PCIDE_MASK | CR4_OSXSAVE_MASK \
+                | CR4_SMEP_MASK | CR4_SMAP_MASK | CR4_PKE_MASK | CR4_PKS_MASK))
+
 #define DR6_BD          (1 << 13)
 #define DR6_BS          (1 << 14)
 #define DR6_BT          (1 << 15)
@@ -2196,6 +2205,36 @@ static inline bool hyperv_feat_enabled(X86CPU *cpu, int feat)
     return !!(cpu->hyperv_features & BIT(feat));
 }
 
+static inline uint64_t cr4_reserved_bits(CPUX86State *env)
+{
+    uint64_t reserved_bits = CR4_RESERVED_MASK;
+    if (!env->features[FEAT_XSAVE]) {
+        reserved_bits |= CR4_OSXSAVE_MASK;
+    }
+    if (!(env->features[FEAT_7_0_EBX] & CPUID_7_0_EBX_SMEP)) {
+        reserved_bits |= CR4_SMEP_MASK;
+    }
+    if (!(env->features[FEAT_7_0_EBX] & CPUID_7_0_EBX_SMAP)) {
+        reserved_bits |= CR4_SMAP_MASK;
+    }
+    if (!(env->features[FEAT_7_0_EBX] & CPUID_7_0_EBX_FSGSBASE)) {
+        reserved_bits |= CR4_FSGSBASE_MASK;
+    }
+    if (!(env->features[FEAT_7_0_ECX] & CPUID_7_0_ECX_PKU)) {
+        reserved_bits |= CR4_PKE_MASK;
+    }
+    if (!(env->features[FEAT_7_0_ECX] & CPUID_7_0_ECX_LA57)) {
+        reserved_bits |= CR4_LA57_MASK;
+    }
+    if (!(env->features[FEAT_7_0_ECX] & CPUID_7_0_ECX_UMIP)) {
+        reserved_bits |= CR4_UMIP_MASK;
+    }
+    if (!(env->features[FEAT_7_0_ECX] & CPUID_7_0_ECX_PKS)) {
+        reserved_bits |= CR4_PKS_MASK;
+    }
+    return reserved_bits;
+}
+
 #if defined(TARGET_X86_64) && \
     defined(CONFIG_USER_ONLY) && \
     defined(CONFIG_LINUX)
diff --git a/target/i386/tcg/sysemu/misc_helper.c b/target/i386/tcg/sysemu/misc_helper.c
index db0d8a9d79..a2af2c9bba 100644
--- a/target/i386/tcg/sysemu/misc_helper.c
+++ b/target/i386/tcg/sysemu/misc_helper.c
@@ -99,6 +99,9 @@ void helper_write_crN(CPUX86State *env, int reg, target_ulong t0)
         cpu_x86_update_cr3(env, t0);
         break;
     case 4:
+        if (t0 & cr4_reserved_bits(env)) {
+            cpu_vmexit(env, SVM_EXIT_ERR, 0, GETPC());
+        }
         if (((t0 ^ env->cr[4]) & CR4_LA57_MASK) &&
             (env->hflags & HF_CS64_MASK)) {
             raise_exception_ra(env, EXCP0D_GPF, GETPC());
diff --git a/target/i386/tcg/sysemu/svm_helper.c b/target/i386/tcg/sysemu/svm_helper.c
index 72b03a345d..d7d7a86aa9 100644
--- a/target/i386/tcg/sysemu/svm_helper.c
+++ b/target/i386/tcg/sysemu/svm_helper.c
@@ -85,6 +85,7 @@ void helper_vmrun(CPUX86State *env, int aflag, int next_eip_addend)
     uint32_t int_ctl;
     uint32_t asid;
     uint64_t new_cr0;
+    uint64_t new_cr4;
 
     cpu_svm_check_intercept_param(env, SVM_EXIT_VMRUN, 0, GETPC());
 
@@ -225,14 +226,16 @@ void helper_vmrun(CPUX86State *env, int aflag, int next_eip_addend)
     if ((new_cr0 & CR0_NW_MASK) && !(new_cr0 & CR0_CD_MASK)) {
         cpu_vmexit(env, SVM_EXIT_ERR, 0, GETPC());
     }
+    new_cr4 = x86_ldq_phys(cs, env->vm_vmcb + offsetof(struct vmcb, save.cr4));
+    if (new_cr4 & cr4_reserved_bits(env)) {
+        cpu_vmexit(env, SVM_EXIT_ERR, 0, GETPC());
+    }
     /* clear exit_info_2 so we behave like the real hardware */
     x86_stq_phys(cs,
              env->vm_vmcb + offsetof(struct vmcb, control.exit_info_2), 0);
 
     cpu_x86_update_cr0(env, new_cr0);
-    cpu_x86_update_cr4(env, x86_ldq_phys(cs,
-                                     env->vm_vmcb + offsetof(struct vmcb,
-                                                             save.cr4)));
+    cpu_x86_update_cr4(env, new_cr4);
     cpu_x86_update_cr3(env, x86_ldq_phys(cs,
                                      env->vm_vmcb + offsetof(struct vmcb,
                                                              save.cr3)));
-- 
2.31.1



