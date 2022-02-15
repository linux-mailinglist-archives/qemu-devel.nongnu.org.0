Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 542AE4B67B3
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 10:35:22 +0100 (CET)
Received: from localhost ([::1]:33528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJuEz-0006dy-F2
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 04:35:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nJuCD-0003iy-Fb
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 04:32:29 -0500
Received: from [2a00:1450:4864:20::62f] (port=33544
 helo=mail-ej1-x62f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nJuCB-0008PO-MW
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 04:32:29 -0500
Received: by mail-ej1-x62f.google.com with SMTP id vz16so3427150ejb.0
 for <qemu-devel@nongnu.org>; Tue, 15 Feb 2022 01:32:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cZrXMB5tJRusd/ppAGIci5Tvar4CQ/zDlx5H3rnz1Yg=;
 b=DIy69pqNH7B3VrU6JzWrWyyZws8gJ1yCIEPU5B1b4Ul8KIQdmVZT9yodaajXVunzhE
 F1fd3QfhPSJHaT/DEYWQSr0UHVxBjL/ozTFKZaa6oylRJNNcQCfsf9aGo9r97VxtDMLm
 giO7T7a2pdwVLVjkppvNrnS9p9lRACPChIpvizyVzqScBlggT6OngIBk1Q9YIDtcnGRj
 3cvcJ/T7PJCRZWWSOdU8QAwpWaYIflLpQxmgPDjK8TGXjXBZZThvFn/Xd/jkWjUioUB1
 cUl1Hw580f5a3oJRSZyJmaNINDZlkPxla3WyqI7xqkub+2AgZCCnEDBWd20l4KTbpquQ
 w7JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=cZrXMB5tJRusd/ppAGIci5Tvar4CQ/zDlx5H3rnz1Yg=;
 b=QCJzIa7k98Tm/SwXlqjUHfiBLsRLdlKJaNkrsPKhpjCw2Av6CwNe6PD4Cht3az/GIC
 se+S87Gkgg95y8NSFllvgDXuvyRh3SMm1pS5OiqBf0FiQVtJVe+kLgE/cYepJ4Ik2yT/
 H8ewoZJBvvdml10tkCQBHlpoI6C2EXYHYw7KJjqnFFw4BPYqd3MsNe06lTiYvEKbBJAi
 n3iwTmcYrwXTEq6iPGTMg65hkXMZlr8u46VPbU0/si4DL2pp6DXKyl7PQ6aMjD5Q4nA2
 UEP2v2yHI6gxOl5RZ2FVJTfNptmgXNoGc0d70QAAU32mn6ylfUHO4t5ksHU/Ti0Ny6AU
 56mA==
X-Gm-Message-State: AOAM532IfqyVDS0L4/MYHvAR5+SjhemgE+pKZ9QY4p3H/NBWyHE66zrA
 AKFpNH5zhbo2GmEyRASDB51Evd0+3TI=
X-Google-Smtp-Source: ABdhPJwFVTqLPgO9C9MGinOrzaPdACh36x6EtHDAMtPx3ELjlbKlj4CKDkiD6+rta3tMyVsPx0VOiQ==
X-Received: by 2002:a17:906:794c:: with SMTP id
 l12mr2304432ejo.304.1644917546122; 
 Tue, 15 Feb 2022 01:32:26 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id m4sm6634308ejl.45.2022.02.15.01.32.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Feb 2022 01:32:25 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 01/30] target/i386: add TCG support for UMIP
Date: Tue, 15 Feb 2022 10:31:54 +0100
Message-Id: <20220215093223.110827-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220215093223.110827-1-pbonzini@redhat.com>
References: <20220215093223.110827-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::62f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62f.google.com
X-Spam_score_int: 2
X-Spam_score: 0.2
X-Spam_bar: /
X-Spam_report: (0.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, PDS_HP_HELO_NORDNS=0.904,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Gareth Webb <gareth.webb@umbralsoftware.co.uk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Gareth Webb <gareth.webb@umbralsoftware.co.uk>

Signed-off-by: Gareth Webb <gareth.webb@umbralsoftware.co.uk>
Message-Id: <164425598317.21902.4257759159329756142-1@git.sr.ht>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/cpu.c           |  2 +-
 target/i386/cpu.h           |  4 +++-
 target/i386/helper.c        |  8 +++++++-
 target/i386/tcg/translate.c | 15 +++++++++++++++
 4 files changed, 26 insertions(+), 3 deletions(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index aa9e636800..20639c375a 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -645,7 +645,7 @@ void x86_cpu_vendor_words2str(char *dst, uint32_t vendor1,
           CPUID_7_0_EBX_HLE, CPUID_7_0_EBX_AVX2,
           CPUID_7_0_EBX_INVPCID, CPUID_7_0_EBX_RTM,
           CPUID_7_0_EBX_RDSEED */
-#define TCG_7_0_ECX_FEATURES (CPUID_7_0_ECX_PKU | \
+#define TCG_7_0_ECX_FEATURES (CPUID_7_0_ECX_UMIP | CPUID_7_0_ECX_PKU | \
           /* CPUID_7_0_ECX_OSPKE is dynamic */ \
           CPUID_7_0_ECX_LA57 | CPUID_7_0_ECX_PKS)
 #define TCG_7_0_EDX_FEATURES 0
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 9911d7c871..e69ab5dd78 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -167,6 +167,7 @@ typedef enum X86Seg {
 #define HF_IOBPT_SHIFT      24 /* an io breakpoint enabled */
 #define HF_MPX_EN_SHIFT     25 /* MPX Enabled (CR4+XCR0+BNDCFGx) */
 #define HF_MPX_IU_SHIFT     26 /* BND registers in-use */
+#define HF_UMIP_SHIFT       27 /* CR4.UMIP */
 
 #define HF_CPL_MASK          (3 << HF_CPL_SHIFT)
 #define HF_INHIBIT_IRQ_MASK  (1 << HF_INHIBIT_IRQ_SHIFT)
@@ -192,6 +193,7 @@ typedef enum X86Seg {
 #define HF_IOBPT_MASK        (1 << HF_IOBPT_SHIFT)
 #define HF_MPX_EN_MASK       (1 << HF_MPX_EN_SHIFT)
 #define HF_MPX_IU_MASK       (1 << HF_MPX_IU_SHIFT)
+#define HF_UMIP_MASK         (1 << HF_UMIP_SHIFT)
 
 /* hflags2 */
 
@@ -258,7 +260,7 @@ typedef enum X86Seg {
 (~(target_ulong)(CR4_VME_MASK | CR4_PVI_MASK | CR4_TSD_MASK \
                 | CR4_DE_MASK | CR4_PSE_MASK | CR4_PAE_MASK \
                 | CR4_MCE_MASK | CR4_PGE_MASK | CR4_PCE_MASK \
-                | CR4_OSFXSR_MASK | CR4_OSXMMEXCPT_MASK |CR4_UMIP_MASK \
+                | CR4_OSFXSR_MASK | CR4_OSXMMEXCPT_MASK | CR4_UMIP_MASK \
                 | CR4_LA57_MASK \
                 | CR4_FSGSBASE_MASK | CR4_PCIDE_MASK | CR4_OSXSAVE_MASK \
                 | CR4_SMEP_MASK | CR4_SMAP_MASK | CR4_PKE_MASK | CR4_PKS_MASK))
diff --git a/target/i386/helper.c b/target/i386/helper.c
index 533b29cb91..a4315048c0 100644
--- a/target/i386/helper.c
+++ b/target/i386/helper.c
@@ -174,7 +174,7 @@ void cpu_x86_update_cr4(CPUX86State *env, uint32_t new_cr4)
     }
 
     /* Clear bits we're going to recompute.  */
-    hflags = env->hflags & ~(HF_OSFXSR_MASK | HF_SMAP_MASK);
+    hflags = env->hflags & ~(HF_OSFXSR_MASK | HF_SMAP_MASK | HF_UMIP_MASK);
 
     /* SSE handling */
     if (!(env->features[FEAT_1_EDX] & CPUID_SSE)) {
@@ -190,6 +190,12 @@ void cpu_x86_update_cr4(CPUX86State *env, uint32_t new_cr4)
     if (new_cr4 & CR4_SMAP_MASK) {
         hflags |= HF_SMAP_MASK;
     }
+    if (!(env->features[FEAT_7_0_ECX] & CPUID_7_0_ECX_UMIP)) {
+        new_cr4 &= ~CR4_UMIP_MASK;
+    }
+    if (new_cr4 & CR4_UMIP_MASK) {
+        hflags |= HF_UMIP_MASK;
+    }
 
     if (!(env->features[FEAT_7_0_ECX] & CPUID_7_0_ECX_PKU)) {
         new_cr4 &= ~CR4_PKE_MASK;
diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 77878cd832..2a94d33742 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -7382,6 +7382,9 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
         case 0: /* sldt */
             if (!PE(s) || VM86(s))
                 goto illegal_op;
+            if (s->flags & HF_UMIP_MASK && !check_cpl0(s)) {
+                break;
+            }
             gen_svm_check_intercept(s, SVM_EXIT_LDTR_READ);
             tcg_gen_ld32u_tl(s->T0, cpu_env,
                              offsetof(CPUX86State, ldt.selector));
@@ -7401,6 +7404,9 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
         case 1: /* str */
             if (!PE(s) || VM86(s))
                 goto illegal_op;
+            if (s->flags & HF_UMIP_MASK && !check_cpl0(s)) {
+                break;
+            }
             gen_svm_check_intercept(s, SVM_EXIT_TR_READ);
             tcg_gen_ld32u_tl(s->T0, cpu_env,
                              offsetof(CPUX86State, tr.selector));
@@ -7439,6 +7445,9 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
         modrm = x86_ldub_code(env, s);
         switch (modrm) {
         CASE_MODRM_MEM_OP(0): /* sgdt */
+            if (s->flags & HF_UMIP_MASK && !check_cpl0(s)) {
+                break;
+            }
             gen_svm_check_intercept(s, SVM_EXIT_GDTR_READ);
             gen_lea_modrm(env, s, modrm);
             tcg_gen_ld32u_tl(s->T0,
@@ -7495,6 +7504,9 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
             break;
 
         CASE_MODRM_MEM_OP(1): /* sidt */
+            if (s->flags & HF_UMIP_MASK && !check_cpl0(s)) {
+                break;
+            }
             gen_svm_check_intercept(s, SVM_EXIT_IDTR_READ);
             gen_lea_modrm(env, s, modrm);
             tcg_gen_ld32u_tl(s->T0, cpu_env, offsetof(CPUX86State, idt.limit));
@@ -7670,6 +7682,9 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
             break;
 
         CASE_MODRM_OP(4): /* smsw */
+            if (s->flags & HF_UMIP_MASK && !check_cpl0(s)) {
+                break;
+            }
             gen_svm_check_intercept(s, SVM_EXIT_READ_CR0);
             tcg_gen_ld_tl(s->T0, cpu_env, offsetof(CPUX86State, cr[0]));
             /*
-- 
2.34.1



