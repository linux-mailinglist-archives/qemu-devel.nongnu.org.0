Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68C74380CD1
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 17:24:01 +0200 (CEST)
Received: from localhost ([::1]:45940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhZfU-0000zR-GK
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 11:24:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lhZVj-0005Ph-JZ
 for qemu-devel@nongnu.org; Fri, 14 May 2021 11:13:55 -0400
Received: from mail-qv1-xf2a.google.com ([2607:f8b0:4864:20::f2a]:34445)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lhZVh-0006xC-HY
 for qemu-devel@nongnu.org; Fri, 14 May 2021 11:13:55 -0400
Received: by mail-qv1-xf2a.google.com with SMTP id o59so2379314qva.1
 for <qemu-devel@nongnu.org>; Fri, 14 May 2021 08:13:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hozQ21JGwazA2KWTCImKAxUJeNyoRNCUBYOeexjeG7w=;
 b=D0Zx9XcPhRoDFJLgvyYdNSOwODtgLic/U9cG8fDoboct/KruPQ/pLYg2sNSG6Bn/cm
 tBverP577vc0o0s1nzjCKuAaq2RVhbXEV6UxWC5Ck6YNO3ivwHXFjDq0hrCg3tCNTPXV
 5eOaG4DreNRvfh3NEPl7wKoySJEGQ0C9XhJ1Nk6NjTC8rL4Vl+JSuFcJSiKsJhpPgLqb
 /eRe7uWpohGaZfbyvy/oN5MeaYzys85F6TMUzwLzbKOmo93dmjPq4Nf4RZStIYMGowgC
 7nREQqNULshvNAZv0+UrLh1eHJgKOV/oJn+2oF1Vgzk33vPriD2EwVuzApPZaf6aCE9o
 86nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hozQ21JGwazA2KWTCImKAxUJeNyoRNCUBYOeexjeG7w=;
 b=k47jabNbQM/VGpOsiVY3Zt1dA1gHIgjyEATRdLjW2BJmhqn2a7rqrv3cFa02F4Jxt+
 MUhmOnLX9LKm34ILj/gqJgKznhv/grBb3REswJWLz+u/MnIvlE41PNc/Rhbfh7TNlo/V
 fn4j9bJhk+Mc5p1e8AiEx42dngIC53g+Odu/XkdZVONB99geEqs8YwiLv18NLUmpxArb
 aVcpbj/jsT3fw6rHeT4QhB1tMKJz8AWnMcIeqbjh8Vm5ZaU5tYQRvOISqWOWo2Po6IbP
 7OuBXlDE1ZgZNgydkMu0vnocrgS0VTfFa+feBF5X3qAqshR4gYw0BLrZB5bN7/C0X8nX
 Asaw==
X-Gm-Message-State: AOAM533yFI32WyySpo1QsEMasyXbL/bvOloA27CcHIxCCIHiwjWFVyX7
 oiytMBjAvTmLc1xIaeSwe6bVLlBcab0Op89JhfE=
X-Google-Smtp-Source: ABdhPJy+vqS3td/GRx6k9JEQF2RXFfzJjAUV0NtycQZpgket4ZfI6nz9bNRHVjDGpdvk2G5n9zOtfg==
X-Received: by 2002:a0c:ef53:: with SMTP id t19mr47382859qvs.48.1621005232679; 
 Fri, 14 May 2021 08:13:52 -0700 (PDT)
Received: from localhost.localdomain (163.189-204-200.bestelclientes.com.mx.
 [189.204.200.163])
 by smtp.gmail.com with ESMTPSA id u6sm4778966qkj.117.2021.05.14.08.13.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 May 2021 08:13:52 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 09/50] target/i386: Assert !VM86 for x86_64 user-only
Date: Fri, 14 May 2021 10:13:01 -0500
Message-Id: <20210514151342.384376-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210514151342.384376-1-richard.henderson@linaro.org>
References: <20210514151342.384376-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2a;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf2a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: pbonzini@redhat.com, f4bug@amsat.org, ehabkost@redhat.com, cfontana@suse.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For i386-linux-user, we can enter vm86 mode via the vm86(2) syscall.
That syscall explicitly returns to 32-bit mode, and the syscall does
not exist for a 64-bit x86_64 executable.

Since we're adding an accessor macro, pull the value directly out of
flags otherwise.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/tcg/translate.c | 40 ++++++++++++++++++++-----------------
 1 file changed, 22 insertions(+), 18 deletions(-)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index b8cb7163ee..27806f35f9 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -116,7 +116,6 @@ typedef struct DisasContext {
 #endif
     int addseg; /* non zero if either DS/ES/SS have a non zero base */
     int f_st;   /* currently unused */
-    int vm86;   /* vm86 mode */
     int tf;     /* TF cpu flag */
     int jmp_opt; /* use direct block chaining for direct jumps */
     int repz_opt; /* optimize jumps within repz instructions */
@@ -159,6 +158,11 @@ typedef struct DisasContext {
 #define CPL(S)    ((S)->cpl)
 #define IOPL(S)   ((S)->iopl)
 #endif
+#if defined(CONFIG_USER_ONLY) && defined(TARGET_X86_64)
+#define VM86(S)   false
+#else
+#define VM86(S)   (((S)->flags & HF_VM_MASK) != 0)
+#endif
 
 static void gen_eob(DisasContext *s);
 static void gen_jr(DisasContext *s, TCGv dest);
@@ -631,7 +635,7 @@ static void gen_check_io(DisasContext *s, MemOp ot, target_ulong cur_eip,
 {
     target_ulong next_eip;
 
-    if (PE(s) && (CPL(s) > IOPL(s) || s->vm86)) {
+    if (PE(s) && (CPL(s) > IOPL(s) || VM86(s))) {
         tcg_gen_trunc_tl_i32(s->tmp2_i32, s->T0);
         switch (ot) {
         case MO_8:
@@ -1309,7 +1313,7 @@ static bool check_cpl0(DisasContext *s)
 /* If vm86, check for iopl == 3; if not, raise #GP and return false. */
 static bool check_vm86_iopl(DisasContext *s)
 {
-    if (!s->vm86 || IOPL(s) == 3) {
+    if (!VM86(s) || IOPL(s) == 3) {
         return true;
     }
     gen_exception_gpf(s);
@@ -1319,7 +1323,7 @@ static bool check_vm86_iopl(DisasContext *s)
 /* Check for iopl allowing access; if not, raise #GP and return false. */
 static bool check_iopl(DisasContext *s)
 {
-    if (s->vm86 ? IOPL(s) == 3 : CPL(s) <= IOPL(s)) {
+    if (VM86(s) ? IOPL(s) == 3 : CPL(s) <= IOPL(s)) {
         return true;
     }
     gen_exception_gpf(s);
@@ -2359,7 +2363,7 @@ static inline void gen_op_movl_seg_T0_vm(DisasContext *s, X86Seg seg_reg)
    call this function with seg_reg == R_CS */
 static void gen_movl_seg_T0(DisasContext *s, X86Seg seg_reg)
 {
-    if (PE(s) && !s->vm86) {
+    if (PE(s) && !VM86(s)) {
         tcg_gen_trunc_tl_i32(s->tmp2_i32, s->T0);
         gen_helper_load_seg(cpu_env, tcg_const_i32(seg_reg), s->tmp2_i32);
         /* abort translation because the addseg value may change or
@@ -4615,7 +4619,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
     case 0xc4: /* 3-byte VEX */
         /* VEX prefixes cannot be used except in 32-bit mode.
            Otherwise the instruction is LES or LDS.  */
-        if (s->code32 && !s->vm86) {
+        if (s->code32 && !VM86(s)) {
             static const int pp_prefix[4] = {
                 0, PREFIX_DATA, PREFIX_REPZ, PREFIX_REPNZ
             };
@@ -5122,7 +5126,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
             gen_add_A0_im(s, 1 << ot);
             gen_op_ld_v(s, MO_16, s->T0, s->A0);
         do_lcall:
-            if (PE(s) && !s->vm86) {
+            if (PE(s) && !VM86(s)) {
                 tcg_gen_trunc_tl_i32(s->tmp2_i32, s->T0);
                 gen_helper_lcall_protected(cpu_env, s->tmp2_i32, s->T1,
                                            tcg_const_i32(dflag - 1),
@@ -5152,7 +5156,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
             gen_add_A0_im(s, 1 << ot);
             gen_op_ld_v(s, MO_16, s->T0, s->A0);
         do_ljmp:
-            if (PE(s) && !s->vm86) {
+            if (PE(s) && !VM86(s)) {
                 tcg_gen_trunc_tl_i32(s->tmp2_i32, s->T0);
                 gen_helper_ljmp_protected(cpu_env, s->tmp2_i32, s->T1,
                                           tcg_const_tl(s->pc - s->cs_base));
@@ -6585,7 +6589,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
     case 0xca: /* lret im */
         val = x86_ldsw_code(env, s);
     do_lret:
-        if (PE(s) && !s->vm86) {
+        if (PE(s) && !VM86(s)) {
             gen_update_cc_op(s);
             gen_jmp_im(s, pc_start - s->cs_base);
             gen_helper_lret_protected(cpu_env, tcg_const_i32(dflag - 1),
@@ -6611,7 +6615,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
         goto do_lret;
     case 0xcf: /* iret */
         gen_svm_check_intercept(s, pc_start, SVM_EXIT_IRET);
-        if (!PE(s) || s->vm86) {
+        if (!PE(s) || VM86(s)) {
             /* real mode or vm86 mode */
             if (!check_vm86_iopl(s)) {
                 break;
@@ -7315,7 +7319,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
         op = (modrm >> 3) & 7;
         switch(op) {
         case 0: /* sldt */
-            if (!PE(s) || s->vm86)
+            if (!PE(s) || VM86(s))
                 goto illegal_op;
             gen_svm_check_intercept(s, pc_start, SVM_EXIT_LDTR_READ);
             tcg_gen_ld32u_tl(s->T0, cpu_env,
@@ -7324,7 +7328,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
             gen_ldst_modrm(env, s, modrm, ot, OR_TMP0, 1);
             break;
         case 2: /* lldt */
-            if (!PE(s) || s->vm86)
+            if (!PE(s) || VM86(s))
                 goto illegal_op;
             if (check_cpl0(s)) {
                 gen_svm_check_intercept(s, pc_start, SVM_EXIT_LDTR_WRITE);
@@ -7334,7 +7338,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
             }
             break;
         case 1: /* str */
-            if (!PE(s) || s->vm86)
+            if (!PE(s) || VM86(s))
                 goto illegal_op;
             gen_svm_check_intercept(s, pc_start, SVM_EXIT_TR_READ);
             tcg_gen_ld32u_tl(s->T0, cpu_env,
@@ -7343,7 +7347,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
             gen_ldst_modrm(env, s, modrm, ot, OR_TMP0, 1);
             break;
         case 3: /* ltr */
-            if (!PE(s) || s->vm86)
+            if (!PE(s) || VM86(s))
                 goto illegal_op;
             if (check_cpl0(s)) {
                 gen_svm_check_intercept(s, pc_start, SVM_EXIT_TR_WRITE);
@@ -7354,7 +7358,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
             break;
         case 4: /* verr */
         case 5: /* verw */
-            if (!PE(s) || s->vm86)
+            if (!PE(s) || VM86(s))
                 goto illegal_op;
             gen_ldst_modrm(env, s, modrm, MO_16, OR_TMP0, 0);
             gen_update_cc_op(s);
@@ -7725,7 +7729,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
             TCGLabel *label1;
             TCGv t0, t1, t2, a0;
 
-            if (!PE(s) || s->vm86)
+            if (!PE(s) || VM86(s))
                 goto illegal_op;
             t0 = tcg_temp_local_new();
             t1 = tcg_temp_local_new();
@@ -7773,7 +7777,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
         {
             TCGLabel *label1;
             TCGv t0;
-            if (!PE(s) || s->vm86)
+            if (!PE(s) || VM86(s))
                 goto illegal_op;
             ot = dflag != MO_16 ? MO_32 : MO_16;
             modrm = x86_ldub_code(env, s);
@@ -8489,12 +8493,12 @@ static void i386_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cpu)
     g_assert(PE(dc) == ((flags & HF_PE_MASK) != 0));
     g_assert(CPL(dc) == cpl);
     g_assert(IOPL(dc) == iopl);
+    g_assert(VM86(dc) == ((flags & HF_VM_MASK) != 0));
 
     dc->code32 = (flags >> HF_CS32_SHIFT) & 1;
     dc->ss32 = (flags >> HF_SS32_SHIFT) & 1;
     dc->addseg = (flags >> HF_ADDSEG_SHIFT) & 1;
     dc->f_st = 0;
-    dc->vm86 = (flags >> VM_SHIFT) & 1;
     dc->tf = (flags >> TF_SHIFT) & 1;
     dc->cc_op = CC_OP_DYNAMIC;
     dc->cc_op_dirty = false;
-- 
2.25.1


