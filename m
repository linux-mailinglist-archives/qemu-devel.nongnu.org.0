Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C6BF3895F4
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 20:58:53 +0200 (CEST)
Received: from localhost ([::1]:38016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljRPA-0005CE-4k
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 14:58:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ljQyk-0004Em-MZ
 for qemu-devel@nongnu.org; Wed, 19 May 2021 14:31:34 -0400
Received: from mail-oi1-x230.google.com ([2607:f8b0:4864:20::230]:33469)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ljQyX-0005kp-AJ
 for qemu-devel@nongnu.org; Wed, 19 May 2021 14:31:34 -0400
Received: by mail-oi1-x230.google.com with SMTP id b25so14061177oic.0
 for <qemu-devel@nongnu.org>; Wed, 19 May 2021 11:31:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ppegi43nBBiUhTlh14mXrYNLMdDVV4yeu967Ro8CEyE=;
 b=ChABmZJzZ07FBQMY2bT1o4YjK4a0kjdT9w6RZkx3gsBGSnFngaeC7oGikOXGUqYguP
 8WsyzVvFgxk7HwB2+bRZW9rHvXDQviog4xMu+9z11/s5S8jvO9nl7KsfGPZPLaXDH/N2
 7qPWxFZ0AtQWExh94mLO8YS5KD5R6H+94xpmUnPBrXBktCZObS0vKlvamgpDjnY30C5n
 xO30VGopal4QpY+2Vty9j/iufTrnOKaoOeP74Y88oIH4pETEDIrSDoAIY9liqp8b1kLm
 WCyXOMMaQHPRvd8exbNL9fEuMMpvA8FxGCtz3PE31HfAvwOEj4zAcTcNUFyOnhmaoELf
 9yjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ppegi43nBBiUhTlh14mXrYNLMdDVV4yeu967Ro8CEyE=;
 b=RfKdm8oFes2PtGnY7Oqrtojql7T4PPowfo7uqe3Lkhwcnjm/Nu9p2jI/5z1divneu2
 cJbXqsUy4X4u1HCa5mzehwwXze2yakp5KK1xyLpNHw/aUJ2OU11b5AuV//7DsXD5iXkc
 Hu344eDgxS7/5VeEgthohvyPSeQolBFkThirFiFl/N9yYKqZOwVYyJU77ESJLOK0G8fP
 gQxxho6CbtGhkMYEZmS00xwmhBh/YAMCBp38+PRsu5Aj1vdgZpsm8LS827wGLuBAKKbM
 LWMVdklfSdUoIyvNsAidfUJoFza4xzaY5ZaR97FqfDGw4HMG/ki+mLqwH4W9WOsjjAWR
 Fjyw==
X-Gm-Message-State: AOAM5324Se0RDlhIyS+ALx/oE3LOOJ7v4UmnA8fFkwrv/8lo455EopCU
 iYXRTz13eRHtb0JZyhi0VwwIFZHxEXP2hfKq
X-Google-Smtp-Source: ABdhPJyNosnelrgQB4+aAWE86bNJup6o10dxuCnmhVbXI9a6pMkHjWlcAE+/Pkw294HCRNTpAk7hhw==
X-Received: by 2002:a05:6808:d:: with SMTP id u13mr378932oic.103.1621449077251; 
 Wed, 19 May 2021 11:31:17 -0700 (PDT)
Received: from localhost.localdomain ([45.235.253.15])
 by smtp.gmail.com with ESMTPSA id l9sm28428oou.43.2021.05.19.11.31.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 May 2021 11:31:16 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 25/50] target/i386: Leave TF in DisasContext.flags
Date: Wed, 19 May 2021 13:30:25 -0500
Message-Id: <20210519183050.875453-26-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210519183050.875453-1-richard.henderson@linaro.org>
References: <20210519183050.875453-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::230;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x230.google.com
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

It's just as easy to clear the flag with AND than assignment.
In two cases the test for the bit can be folded together with
the test for HF_INHIBIT_IRQ_MASK.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20210514151342.384376-26-richard.henderson@linaro.org>
---
 target/i386/tcg/translate.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 847502046f..3f6214c624 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -101,7 +101,6 @@ typedef struct DisasContext {
     uint8_t vex_v;  /* vex vvvv register, without 1's complement.  */
     CCOp cc_op;  /* current CC operation */
     bool cc_op_dirty;
-    int tf;     /* TF cpu flag */
     int jmp_opt; /* use direct block chaining for direct jumps */
     int repz_opt; /* optimize jumps within repz instructions */
     int mem_index; /* select memory access functions */
@@ -2656,7 +2655,7 @@ do_gen_eob_worker(DisasContext *s, bool inhibit, bool recheck_tf, bool jr)
     } else if (recheck_tf) {
         gen_helper_rechecking_single_step(cpu_env);
         tcg_gen_exit_tb(NULL, 0);
-    } else if (s->tf) {
+    } else if (s->flags & HF_TF_MASK) {
         gen_helper_single_step(cpu_env);
     } else if (jr) {
         tcg_gen_lookup_and_goto_ptr();
@@ -5540,7 +5539,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
         if (s->base.is_jmp) {
             gen_jmp_im(s, s->pc - s->cs_base);
             if (reg == R_SS) {
-                s->tf = 0;
+                s->flags &= ~HF_TF_MASK;
                 gen_eob_inhibit_irq(s, true);
             } else {
                 gen_eob(s);
@@ -5606,7 +5605,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
         if (s->base.is_jmp) {
             gen_jmp_im(s, s->pc - s->cs_base);
             if (reg == R_SS) {
-                s->tf = 0;
+                s->flags &= ~HF_TF_MASK;
                 gen_eob_inhibit_irq(s, true);
             } else {
                 gen_eob(s);
@@ -8506,7 +8505,6 @@ static void i386_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cpu)
     g_assert(LMA(dc) == ((flags & HF_LMA_MASK) != 0));
     g_assert(ADDSEG(dc) == ((flags & HF_ADDSEG_MASK) != 0));
 
-    dc->tf = (flags >> TF_SHIFT) & 1;
     dc->cc_op = CC_OP_DYNAMIC;
     dc->cc_op_dirty = false;
     dc->popl_esp_hack = 0;
@@ -8521,8 +8519,8 @@ static void i386_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cpu)
     dc->cpuid_ext3_features = env->features[FEAT_8000_0001_ECX];
     dc->cpuid_7_0_ebx_features = env->features[FEAT_7_0_EBX];
     dc->cpuid_xsave_features = env->features[FEAT_XSAVE];
-    dc->jmp_opt = !(dc->tf || dc->base.singlestep_enabled ||
-                    (flags & HF_INHIBIT_IRQ_MASK));
+    dc->jmp_opt = !(dc->base.singlestep_enabled ||
+                    (flags & (HF_TF_MASK | HF_INHIBIT_IRQ_MASK)));
     /* Do not optimize repz jumps at all in icount mode, because
        rep movsS instructions are execured with different paths
        in !repz_opt and repz_opt modes. The first one was used
@@ -8597,7 +8595,7 @@ static void i386_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
 
     pc_next = disas_insn(dc, cpu);
 
-    if (dc->tf || (dc->base.tb->flags & HF_INHIBIT_IRQ_MASK)) {
+    if (dc->flags & (HF_TF_MASK | HF_INHIBIT_IRQ_MASK)) {
         /* if single step mode, we generate only one instruction and
            generate an exception */
         /* if irq were inhibited with HF_INHIBIT_IRQ_MASK, we clear
-- 
2.25.1


