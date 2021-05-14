Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77472380D79
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 17:41:13 +0200 (CEST)
Received: from localhost ([::1]:33680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhZw8-0006ni-B7
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 11:41:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lhZW6-00061v-Qh
 for qemu-devel@nongnu.org; Fri, 14 May 2021 11:14:19 -0400
Received: from mail-qt1-x82f.google.com ([2607:f8b0:4864:20::82f]:41575)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lhZVw-00074S-0a
 for qemu-devel@nongnu.org; Fri, 14 May 2021 11:14:18 -0400
Received: by mail-qt1-x82f.google.com with SMTP id t20so18136588qtx.8
 for <qemu-devel@nongnu.org>; Fri, 14 May 2021 08:14:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Bxl+9qjjZbgjgK+fQm8+agBUc1OXev/3KIHRw6W9R20=;
 b=O1NjLAsHc69mXBV3dS/a4nRTedEbzYLrfcfoQ0EFXtOM9tyO2ucHHrAo9HkAFjGc64
 a4GQbWsT1BfjqVeREtShDU2eF2IkX3hCYApwWLA2s6XoBQfm+A+LmF7iqal+/oIEotUM
 W60ktdTGxC1SuD+RxeM5Lx4QQYtycrFFzMjTHXtyA1sVoBL2eJeuZsI7CpZpQItm71Eo
 Iush6QYXyDvhJ/Mg69nsH1TDvea/BEHKElju82D8F1gVq9DchAWatym33wBUM1Z5OI41
 RbZSmvHR9mp5mq3NhLfPhl4VLmkdMZAlNEv9fL/qe0qN0rP/E5aJY3gWs9x96VCb84MA
 rQAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Bxl+9qjjZbgjgK+fQm8+agBUc1OXev/3KIHRw6W9R20=;
 b=Ppqgaa131TOzsaVWBgZRltnFlFUuUnEZln/FTUOhwsB7uDYOAAWZF8JAV56Isebb4r
 XhB36Q5vouI9vH0aB1W/mR0gbZJywE9NUh4kmFviFk/gTOSD3KLj++NxOeIk10cTwcF8
 lxRKAc0/oS95J0PnknTKzWvobs/IQrtFwnJA7XCNfGivecLJG3S8gmkq1dXmiA3wVLNl
 Ayof8fM+iV+nmvnS0nusV5BpJGQ6iZWJxihbp5whQzfzNogKr16V1ZNkFrlDpcnVtW05
 QyHjEEg/g7+Hss7zxL9Vf/0+3j15Cs8FDV+wIWXTvWnpzG+qk4KQcXInQSeXreGA0nSB
 Ihqw==
X-Gm-Message-State: AOAM533B1Y0Vk8xDqbPFJuFCLsSE1LpjbugCaBXIX67t2n3jSZ3WPhuC
 dVab8wYpDDxTxxi8egLClHlCfU887xQGkI2uDmI=
X-Google-Smtp-Source: ABdhPJxFI7gJL9mhEh9Rl2+5X8ld2afj8wV4YGTHYh2atEaMcECOygNo6PwvxWbjvLHibPeJY0VsMA==
X-Received: by 2002:aed:3169:: with SMTP id 96mr27569640qtg.164.1621005247227; 
 Fri, 14 May 2021 08:14:07 -0700 (PDT)
Received: from localhost.localdomain (163.189-204-200.bestelclientes.com.mx.
 [189.204.200.163])
 by smtp.gmail.com with ESMTPSA id u6sm4778966qkj.117.2021.05.14.08.14.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 May 2021 08:14:07 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 25/50] target/i386: Leave TF in DisasContext.flags
Date: Fri, 14 May 2021 10:13:17 -0500
Message-Id: <20210514151342.384376-26-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210514151342.384376-1-richard.henderson@linaro.org>
References: <20210514151342.384376-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82f;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x82f.google.com
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

It's just as easy to clear the flag with AND than assignment.
In two cases the test for the bit can be folded together with
the test for HF_INHIBIT_IRQ_MASK.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
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


