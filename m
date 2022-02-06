Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ECE14AB277
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Feb 2022 22:48:53 +0100 (CET)
Received: from localhost ([::1]:37530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nGpOu-0001J3-13
	for lists+qemu-devel@lfdr.de; Sun, 06 Feb 2022 16:48:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>) id 1nGpGD-0007dH-Ka
 for qemu-devel@nongnu.org; Sun, 06 Feb 2022 16:39:53 -0500
Received: from mail-b.sr.ht ([173.195.146.151]:58284)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>) id 1nGpGA-0005lx-Nr
 for qemu-devel@nongnu.org; Sun, 06 Feb 2022 16:39:53 -0500
Authentication-Results: mail-b.sr.ht; dkim=none 
Received: from git.sr.ht (unknown [173.195.146.142])
 by mail-b.sr.ht (Postfix) with ESMTPSA id 7C95711EFBD;
 Sun,  6 Feb 2022 21:39:47 +0000 (UTC)
From: ~hildardorf <hildardorf@git.sr.ht>
Date: Sun, 06 Feb 2022 19:16:59 +0000
Subject: [PATCH qemu] Add TCG support for UMIP
Message-ID: <164418358722.9930.1215378989733447065-0@git.sr.ht>
X-Mailer: git.sr.ht
To: qemu-devel@nongnu.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Received-SPF: pass client-ip=173.195.146.151; envelope-from=outgoing@sr.ht;
 helo=mail-b.sr.ht
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sun, 06 Feb 2022 16:46:18 -0500
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
Reply-To: ~hildardorf <gareth.webb@umbralsoftware.co.uk>
Cc: Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Gareth Webb <gareth.webb@umbralsoftware.co.uk>

---
 target/i386/cpu.c           |  2 +-
 target/i386/cpu.h           |  4 +++-
 target/i386/helper.c        |  8 +++++++-
 target/i386/tcg/translate.c | 12 ++++++++++++
 4 files changed, 23 insertions(+), 3 deletions(-)

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
index 9911d7c871..f5cf46e53c 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -167,6 +167,7 @@ typedef enum X86Seg {
 #define HF_IOBPT_SHIFT      24 /* an io breakpoint enabled */
 #define HF_MPX_EN_SHIFT     25 /* MPX Enabled (CR4+XCR0+BNDCFGx) */
 #define HF_MPX_IU_SHIFT     26 /* BND registers in-use */
+#define HF_UMIP_SHIFT       27 /* CR4.UMIP registers in-use */
=20
 #define HF_CPL_MASK          (3 << HF_CPL_SHIFT)
 #define HF_INHIBIT_IRQ_MASK  (1 << HF_INHIBIT_IRQ_SHIFT)
@@ -192,6 +193,7 @@ typedef enum X86Seg {
 #define HF_IOBPT_MASK        (1 << HF_IOBPT_SHIFT)
 #define HF_MPX_EN_MASK       (1 << HF_MPX_EN_SHIFT)
 #define HF_MPX_IU_MASK       (1 << HF_MPX_IU_SHIFT)
+#define HF_UMIP_MASK         (1 << HF_UMIP_SHIFT)
=20
 /* hflags2 */
=20
@@ -258,7 +260,7 @@ typedef enum X86Seg {
 (~(target_ulong)(CR4_VME_MASK | CR4_PVI_MASK | CR4_TSD_MASK \
                 | CR4_DE_MASK | CR4_PSE_MASK | CR4_PAE_MASK \
                 | CR4_MCE_MASK | CR4_PGE_MASK | CR4_PCE_MASK \
-                | CR4_OSFXSR_MASK | CR4_OSXMMEXCPT_MASK |CR4_UMIP_MASK \
+                | CR4_OSFXSR_MASK | CR4_OSXMMEXCPT_MASK | CR4_UMIP_MASK \
                 | CR4_LA57_MASK \
                 | CR4_FSGSBASE_MASK | CR4_PCIDE_MASK | CR4_OSXSAVE_MASK \
                 | CR4_SMEP_MASK | CR4_SMAP_MASK | CR4_PKE_MASK | CR4_PKS_MAS=
K))
diff --git a/target/i386/helper.c b/target/i386/helper.c
index 533b29cb91..a4315048c0 100644
--- a/target/i386/helper.c
+++ b/target/i386/helper.c
@@ -174,7 +174,7 @@ void cpu_x86_update_cr4(CPUX86State *env, uint32_t new_cr=
4)
     }
=20
     /* Clear bits we're going to recompute.  */
-    hflags =3D env->hflags & ~(HF_OSFXSR_MASK | HF_SMAP_MASK);
+    hflags =3D env->hflags & ~(HF_OSFXSR_MASK | HF_SMAP_MASK | HF_UMIP_MASK);
=20
     /* SSE handling */
     if (!(env->features[FEAT_1_EDX] & CPUID_SSE)) {
@@ -190,6 +190,12 @@ void cpu_x86_update_cr4(CPUX86State *env, uint32_t new_c=
r4)
     if (new_cr4 & CR4_SMAP_MASK) {
         hflags |=3D HF_SMAP_MASK;
     }
+    if (!(env->features[FEAT_7_0_ECX] & CPUID_7_0_ECX_UMIP)) {
+        new_cr4 &=3D ~CR4_UMIP_MASK;
+    }
+    if (new_cr4 & CR4_UMIP_MASK) {
+        hflags |=3D HF_UMIP_MASK;
+    }
=20
     if (!(env->features[FEAT_7_0_ECX] & CPUID_7_0_ECX_PKU)) {
         new_cr4 &=3D ~CR4_PKE_MASK;
diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 77878cd832..69a8f8af2f 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -112,6 +112,7 @@ typedef struct DisasContext {
     int cpuid_ext2_features;
     int cpuid_ext3_features;
     int cpuid_7_0_ebx_features;
+    int cpuid_7_0_ecx_features;
     int cpuid_xsave_features;
=20
     /* TCG local temps */
@@ -7382,6 +7383,8 @@ static target_ulong disas_insn(DisasContext *s, CPUStat=
e *cpu)
         case 0: /* sldt */
             if (!PE(s) || VM86(s))
                 goto illegal_op;
+            if ((PE(s) || LMA(s)) && s->cpuid_7_0_ecx_features & CPUID_7_0_E=
CX_UMIP && s->flags & HF_UMIP_MASK)
+                gen_exception_gpf(s);
             gen_svm_check_intercept(s, SVM_EXIT_LDTR_READ);
             tcg_gen_ld32u_tl(s->T0, cpu_env,
                              offsetof(CPUX86State, ldt.selector));
@@ -7401,6 +7404,8 @@ static target_ulong disas_insn(DisasContext *s, CPUStat=
e *cpu)
         case 1: /* str */
             if (!PE(s) || VM86(s))
                 goto illegal_op;
+            if ((PE(s) || LMA(s)) && s->cpuid_7_0_ecx_features & CPUID_7_0_E=
CX_UMIP && s->flags & HF_UMIP_MASK)
+                gen_exception_gpf(s);
             gen_svm_check_intercept(s, SVM_EXIT_TR_READ);
             tcg_gen_ld32u_tl(s->T0, cpu_env,
                              offsetof(CPUX86State, tr.selector));
@@ -7439,6 +7444,8 @@ static target_ulong disas_insn(DisasContext *s, CPUStat=
e *cpu)
         modrm =3D x86_ldub_code(env, s);
         switch (modrm) {
         CASE_MODRM_MEM_OP(0): /* sgdt */
+            if ((PE(s) || LMA(s)) && s->cpuid_7_0_ecx_features & CPUID_7_0_E=
CX_UMIP && s->flags & HF_UMIP_MASK)
+                gen_exception_gpf(s);
             gen_svm_check_intercept(s, SVM_EXIT_GDTR_READ);
             gen_lea_modrm(env, s, modrm);
             tcg_gen_ld32u_tl(s->T0,
@@ -7495,6 +7502,8 @@ static target_ulong disas_insn(DisasContext *s, CPUStat=
e *cpu)
             break;
=20
         CASE_MODRM_MEM_OP(1): /* sidt */
+            if ((PE(s) || LMA(s)) && s->cpuid_7_0_ecx_features & CPUID_7_0_E=
CX_UMIP && s->flags & HF_UMIP_MASK)
+                gen_exception_gpf(s);
             gen_svm_check_intercept(s, SVM_EXIT_IDTR_READ);
             gen_lea_modrm(env, s, modrm);
             tcg_gen_ld32u_tl(s->T0, cpu_env, offsetof(CPUX86State, idt.limit=
));
@@ -7670,6 +7679,8 @@ static target_ulong disas_insn(DisasContext *s, CPUStat=
e *cpu)
             break;
=20
         CASE_MODRM_OP(4): /* smsw */
+            if ((PE(s) || LMA(s)) && s->cpuid_7_0_ecx_features & CPUID_7_0_E=
CX_UMIP && s->flags & HF_UMIP_MASK)
+                gen_exception_gpf(s);
             gen_svm_check_intercept(s, SVM_EXIT_READ_CR0);
             tcg_gen_ld_tl(s->T0, cpu_env, offsetof(CPUX86State, cr[0]));
             /*
@@ -8585,6 +8596,7 @@ static void i386_tr_init_disas_context(DisasContextBase=
 *dcbase, CPUState *cpu)
     dc->cpuid_ext2_features =3D env->features[FEAT_8000_0001_EDX];
     dc->cpuid_ext3_features =3D env->features[FEAT_8000_0001_ECX];
     dc->cpuid_7_0_ebx_features =3D env->features[FEAT_7_0_EBX];
+    dc->cpuid_7_0_ecx_features =3D env->features[FEAT_7_0_ECX];
     dc->cpuid_xsave_features =3D env->features[FEAT_XSAVE];
     dc->jmp_opt =3D !((cflags & CF_NO_GOTO_TB) ||
                     (flags & (HF_TF_MASK | HF_INHIBIT_IRQ_MASK)));
--=20
2.32.0

