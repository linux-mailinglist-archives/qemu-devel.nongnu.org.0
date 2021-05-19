Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B413E389598
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 20:38:43 +0200 (CEST)
Received: from localhost ([::1]:54332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljR5e-0001HW-PF
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 14:38:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ljQyG-0003SA-GJ
 for qemu-devel@nongnu.org; Wed, 19 May 2021 14:31:04 -0400
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329]:45851)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ljQyB-0005Yv-Tu
 for qemu-devel@nongnu.org; Wed, 19 May 2021 14:31:04 -0400
Received: by mail-ot1-x329.google.com with SMTP id
 t10-20020a05683022eab0290304ed8bc759so12588147otc.12
 for <qemu-devel@nongnu.org>; Wed, 19 May 2021 11:30:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6jPucf3d8QVYiVwYtTgePgn0/KPRZsWR8rPsX9WQDzE=;
 b=GOSFBsBuZlNUtKeJejwholxflAtxW+nS8r/Q0GdbH+cy+zTiVxT1iArr3nlvzaRrLD
 HKLo5W7hO5iXSjNeon3r3rQZ/zHI4qEQQwdOUdobTQy2m/Tv1mjDZViMZp9JG5xPRnLW
 2+Qtf6p4vWb4KL/VIsKQTspf4ftAz2FeTYQzagXmeDqywCwx+4ZuqiiuTLV8t/tVLdOZ
 wwxQ0WXIcFgb1weNSWsYN8LBl+nr8kANW9LXfrZpjZYLYPoX4kQDXUWabsqtqywRhWOd
 HEnXJ0/txceGCiMTosgZ1M6vm077AJppVXPtqmssYimQyBxzoTmuDIG7+LINSyLaBmA4
 sqhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6jPucf3d8QVYiVwYtTgePgn0/KPRZsWR8rPsX9WQDzE=;
 b=Zl+7bFqL9ZBneeIKW9EwKPsY/Hvky5Hu/A7BLD3OKwcaUFmsPsKMHE9dN7Ozip5M61
 Jak3OfXedMkpwdMIMJpFwPkJaH6EdQkZfWCrrQRrN71nCGcxVB5GG/p+9qKoy3hszioH
 pRO3TBP1BySZZjRurnyzTAkVRogTEacyXYTn+Sm3f9AkTx2CFDwC9usXhJc7R8eU/O90
 iNJqUSTNK93AP/5DipwApryU/LukfvwnRkyBXFgrcBOEpEP8zuHT5vbpIOGfxAeu7sRA
 vLNWup76/qb/jGrAtNhmrnoQxpmJ41VkgHRLZ8FLQS28V7tIvIAnQw5ypO6acj7WMw5/
 uZ3A==
X-Gm-Message-State: AOAM533RR+GsdWQlLaugNvdfTDfCRomqWNEtj4XHAinAv5UKLO4H6TGe
 Jsa5GkEwt5+fjtuZEtC0COwdOGBk3awkZR5v
X-Google-Smtp-Source: ABdhPJz9POpJMBcH9Ykn7v700hcVLcK9G24+bxixq1gP1bZRQ28hd9SzuUbQbnAEq1mvmuPLFs3+Yg==
X-Received: by 2002:a05:6830:3497:: with SMTP id
 c23mr689509otu.98.1621449058715; 
 Wed, 19 May 2021 11:30:58 -0700 (PDT)
Received: from localhost.localdomain ([45.235.253.15])
 by smtp.gmail.com with ESMTPSA id l9sm28428oou.43.2021.05.19.11.30.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 May 2021 11:30:58 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 06/50] target/i386: Assert PE is set for user-only
Date: Wed, 19 May 2021 13:30:06 -0500
Message-Id: <20210519183050.875453-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210519183050.875453-1-richard.henderson@linaro.org>
References: <20210519183050.875453-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::329;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x329.google.com
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
Cc: peter.maydell@linaro.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

A user-mode executable is never in real-mode.  Since we're adding
an accessor macro, pull the value directly out of flags for sysemu.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20210514151342.384376-7-richard.henderson@linaro.org>
---
 target/i386/tcg/translate.c | 69 +++++++++++++++++++------------------
 1 file changed, 36 insertions(+), 33 deletions(-)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 873ed00975..7f3993fccb 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -94,7 +94,6 @@ typedef struct DisasContext {
     target_ulong pc; /* pc = eip + cs_base */
     /* current block context */
     target_ulong cs_base; /* base of CS segment */
-    int pe;     /* protected mode */
     int code32; /* 32 bit code segment */
 #ifdef TARGET_X86_64
     int lma;    /* long mode active */
@@ -146,6 +145,13 @@ typedef struct DisasContext {
     sigjmp_buf jmpbuf;
 } DisasContext;
 
+/* The environment in which user-only runs is constrained. */
+#ifdef CONFIG_USER_ONLY
+#define PE(S)     true
+#else
+#define PE(S)     (((S)->flags & HF_PE_MASK) != 0)
+#endif
+
 static void gen_eob(DisasContext *s);
 static void gen_jr(DisasContext *s, TCGv dest);
 static void gen_jmp(DisasContext *s, target_ulong eip);
@@ -617,7 +623,7 @@ static void gen_check_io(DisasContext *s, MemOp ot, target_ulong cur_eip,
 {
     target_ulong next_eip;
 
-    if (s->pe && (s->cpl > s->iopl || s->vm86)) {
+    if (PE(s) && (s->cpl > s->iopl || s->vm86)) {
         tcg_gen_trunc_tl_i32(s->tmp2_i32, s->T0);
         switch (ot) {
         case MO_8:
@@ -2345,7 +2351,7 @@ static inline void gen_op_movl_seg_T0_vm(DisasContext *s, X86Seg seg_reg)
    call this function with seg_reg == R_CS */
 static void gen_movl_seg_T0(DisasContext *s, X86Seg seg_reg)
 {
-    if (s->pe && !s->vm86) {
+    if (PE(s) && !s->vm86) {
         tcg_gen_trunc_tl_i32(s->tmp2_i32, s->T0);
         gen_helper_load_seg(cpu_env, tcg_const_i32(seg_reg), s->tmp2_i32);
         /* abort translation because the addseg value may change or
@@ -5108,7 +5114,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
             gen_add_A0_im(s, 1 << ot);
             gen_op_ld_v(s, MO_16, s->T0, s->A0);
         do_lcall:
-            if (s->pe && !s->vm86) {
+            if (PE(s) && !s->vm86) {
                 tcg_gen_trunc_tl_i32(s->tmp2_i32, s->T0);
                 gen_helper_lcall_protected(cpu_env, s->tmp2_i32, s->T1,
                                            tcg_const_i32(dflag - 1),
@@ -5138,7 +5144,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
             gen_add_A0_im(s, 1 << ot);
             gen_op_ld_v(s, MO_16, s->T0, s->A0);
         do_ljmp:
-            if (s->pe && !s->vm86) {
+            if (PE(s) && !s->vm86) {
                 tcg_gen_trunc_tl_i32(s->tmp2_i32, s->T0);
                 gen_helper_ljmp_protected(cpu_env, s->tmp2_i32, s->T1,
                                           tcg_const_tl(s->pc - s->cs_base));
@@ -6571,7 +6577,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
     case 0xca: /* lret im */
         val = x86_ldsw_code(env, s);
     do_lret:
-        if (s->pe && !s->vm86) {
+        if (PE(s) && !s->vm86) {
             gen_update_cc_op(s);
             gen_jmp_im(s, pc_start - s->cs_base);
             gen_helper_lret_protected(cpu_env, tcg_const_i32(dflag - 1),
@@ -6597,7 +6603,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
         goto do_lret;
     case 0xcf: /* iret */
         gen_svm_check_intercept(s, pc_start, SVM_EXIT_IRET);
-        if (!s->pe || s->vm86) {
+        if (!PE(s) || s->vm86) {
             /* real mode or vm86 mode */
             if (!check_vm86_iopl(s)) {
                 break;
@@ -7236,7 +7242,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
         /* For Intel SYSENTER is valid on 64-bit */
         if (CODE64(s) && env->cpuid_vendor1 != CPUID_VENDOR_INTEL_1)
             goto illegal_op;
-        if (!s->pe) {
+        if (!PE(s)) {
             gen_exception_gpf(s);
         } else {
             gen_helper_sysenter(cpu_env);
@@ -7247,7 +7253,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
         /* For Intel SYSEXIT is valid on 64-bit */
         if (CODE64(s) && env->cpuid_vendor1 != CPUID_VENDOR_INTEL_1)
             goto illegal_op;
-        if (!s->pe) {
+        if (!PE(s)) {
             gen_exception_gpf(s);
         } else {
             gen_helper_sysexit(cpu_env, tcg_const_i32(dflag - 1));
@@ -7266,7 +7272,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
         gen_eob_worker(s, false, true);
         break;
     case 0x107: /* sysret */
-        if (!s->pe) {
+        if (!PE(s)) {
             gen_exception_gpf(s);
         } else {
             gen_helper_sysret(cpu_env, tcg_const_i32(dflag - 1));
@@ -7301,7 +7307,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
         op = (modrm >> 3) & 7;
         switch(op) {
         case 0: /* sldt */
-            if (!s->pe || s->vm86)
+            if (!PE(s) || s->vm86)
                 goto illegal_op;
             gen_svm_check_intercept(s, pc_start, SVM_EXIT_LDTR_READ);
             tcg_gen_ld32u_tl(s->T0, cpu_env,
@@ -7310,7 +7316,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
             gen_ldst_modrm(env, s, modrm, ot, OR_TMP0, 1);
             break;
         case 2: /* lldt */
-            if (!s->pe || s->vm86)
+            if (!PE(s) || s->vm86)
                 goto illegal_op;
             if (check_cpl0(s)) {
                 gen_svm_check_intercept(s, pc_start, SVM_EXIT_LDTR_WRITE);
@@ -7320,7 +7326,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
             }
             break;
         case 1: /* str */
-            if (!s->pe || s->vm86)
+            if (!PE(s) || s->vm86)
                 goto illegal_op;
             gen_svm_check_intercept(s, pc_start, SVM_EXIT_TR_READ);
             tcg_gen_ld32u_tl(s->T0, cpu_env,
@@ -7329,7 +7335,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
             gen_ldst_modrm(env, s, modrm, ot, OR_TMP0, 1);
             break;
         case 3: /* ltr */
-            if (!s->pe || s->vm86)
+            if (!PE(s) || s->vm86)
                 goto illegal_op;
             if (check_cpl0(s)) {
                 gen_svm_check_intercept(s, pc_start, SVM_EXIT_TR_WRITE);
@@ -7340,7 +7346,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
             break;
         case 4: /* verr */
         case 5: /* verw */
-            if (!s->pe || s->vm86)
+            if (!PE(s) || s->vm86)
                 goto illegal_op;
             gen_ldst_modrm(env, s, modrm, MO_16, OR_TMP0, 0);
             gen_update_cc_op(s);
@@ -7458,7 +7464,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
             break;
 
         case 0xd8: /* VMRUN */
-            if (!(s->flags & HF_SVME_MASK) || !s->pe) {
+            if (!(s->flags & HF_SVME_MASK) || !PE(s)) {
                 goto illegal_op;
             }
             if (!check_cpl0(s)) {
@@ -7482,7 +7488,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
             break;
 
         case 0xda: /* VMLOAD */
-            if (!(s->flags & HF_SVME_MASK) || !s->pe) {
+            if (!(s->flags & HF_SVME_MASK) || !PE(s)) {
                 goto illegal_op;
             }
             if (!check_cpl0(s)) {
@@ -7494,7 +7500,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
             break;
 
         case 0xdb: /* VMSAVE */
-            if (!(s->flags & HF_SVME_MASK) || !s->pe) {
+            if (!(s->flags & HF_SVME_MASK) || !PE(s)) {
                 goto illegal_op;
             }
             if (!check_cpl0(s)) {
@@ -7508,7 +7514,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
         case 0xdc: /* STGI */
             if ((!(s->flags & HF_SVME_MASK)
                    && !(s->cpuid_ext3_features & CPUID_EXT3_SKINIT))
-                || !s->pe) {
+                || !PE(s)) {
                 goto illegal_op;
             }
             if (!check_cpl0(s)) {
@@ -7521,7 +7527,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
             break;
 
         case 0xdd: /* CLGI */
-            if (!(s->flags & HF_SVME_MASK) || !s->pe) {
+            if (!(s->flags & HF_SVME_MASK) || !PE(s)) {
                 goto illegal_op;
             }
             if (!check_cpl0(s)) {
@@ -7535,7 +7541,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
         case 0xde: /* SKINIT */
             if ((!(s->flags & HF_SVME_MASK)
                  && !(s->cpuid_ext3_features & CPUID_EXT3_SKINIT))
-                || !s->pe) {
+                || !PE(s)) {
                 goto illegal_op;
             }
             gen_update_cc_op(s);
@@ -7544,7 +7550,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
             break;
 
         case 0xdf: /* INVLPGA */
-            if (!(s->flags & HF_SVME_MASK) || !s->pe) {
+            if (!(s->flags & HF_SVME_MASK) || !PE(s)) {
                 goto illegal_op;
             }
             if (!check_cpl0(s)) {
@@ -7711,7 +7717,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
             TCGLabel *label1;
             TCGv t0, t1, t2, a0;
 
-            if (!s->pe || s->vm86)
+            if (!PE(s) || s->vm86)
                 goto illegal_op;
             t0 = tcg_temp_local_new();
             t1 = tcg_temp_local_new();
@@ -7759,7 +7765,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
         {
             TCGLabel *label1;
             TCGv t0;
-            if (!s->pe || s->vm86)
+            if (!PE(s) || s->vm86)
                 goto illegal_op;
             ot = dflag != MO_16 ? MO_32 : MO_16;
             modrm = x86_ldub_code(env, s);
@@ -8461,9 +8467,13 @@ static void i386_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cpu)
     DisasContext *dc = container_of(dcbase, DisasContext, base);
     CPUX86State *env = cpu->env_ptr;
     uint32_t flags = dc->base.tb->flags;
-    target_ulong cs_base = dc->base.tb->cs_base;
 
-    dc->pe = (flags >> HF_PE_SHIFT) & 1;
+    dc->cs_base = dc->base.tb->cs_base;
+    dc->flags = flags;
+
+    /* We make some simplifying assumptions; validate they're correct. */
+    g_assert(PE(dc) == ((flags & HF_PE_MASK) != 0));
+
     dc->code32 = (flags >> HF_CS32_SHIFT) & 1;
     dc->ss32 = (flags >> HF_SS32_SHIFT) & 1;
     dc->addseg = (flags >> HF_ADDSEG_SHIFT) & 1;
@@ -8474,7 +8484,6 @@ static void i386_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cpu)
     dc->tf = (flags >> TF_SHIFT) & 1;
     dc->cc_op = CC_OP_DYNAMIC;
     dc->cc_op_dirty = false;
-    dc->cs_base = cs_base;
     dc->popl_esp_hack = 0;
     /* select memory access functions */
     dc->mem_index = 0;
@@ -8491,7 +8500,6 @@ static void i386_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cpu)
     dc->lma = (flags >> HF_LMA_SHIFT) & 1;
     dc->code64 = (flags >> HF_CS64_SHIFT) & 1;
 #endif
-    dc->flags = flags;
     dc->jmp_opt = !(dc->tf || dc->base.singlestep_enabled ||
                     (flags & HF_INHIBIT_IRQ_MASK));
     /* Do not optimize repz jumps at all in icount mode, because
@@ -8505,11 +8513,6 @@ static void i386_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cpu)
        additional step for ecx=0 when icount is enabled.
      */
     dc->repz_opt = !dc->jmp_opt && !(tb_cflags(dc->base.tb) & CF_USE_ICOUNT);
-#if 0
-    /* check addseg logic */
-    if (!dc->addseg && (dc->vm86 || !dc->pe || !dc->code32))
-        printf("ERROR addseg\n");
-#endif
 
     dc->T0 = tcg_temp_new();
     dc->T1 = tcg_temp_new();
-- 
2.25.1


