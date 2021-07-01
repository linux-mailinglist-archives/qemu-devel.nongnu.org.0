Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B35FF3B940C
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Jul 2021 17:37:09 +0200 (CEST)
Received: from localhost ([::1]:39766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyykW-0002Ey-K2
	for lists+qemu-devel@lfdr.de; Thu, 01 Jul 2021 11:37:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyyZq-0004py-OJ
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 11:26:07 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:39528)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyyZZ-0008HT-9n
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 11:26:06 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 in17-20020a17090b4391b0290170ba0ec7fcso6857204pjb.4
 for <qemu-devel@nongnu.org>; Thu, 01 Jul 2021 08:25:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dV3LuCTcwHlXu6bhF819dEgGFeDbEGWqZjzK4w6nRoM=;
 b=CnoWYHuInUARbBQUUBQNLjrP9JLHpoXZRNR+JdA15s6qFNEpwRUAE3JSHIv6i49q2N
 J7VP3nwj1cHQlZsGmUCG5/AqHjEWuaDozwCu8eIKAIpzMhwtUMf17cTGICkz0ujy95eH
 5TyjIs8D5yk39ntRB0iifcQSYSRHw21obXGlF+kr06dycn8cHyCq9MzwsUZqFKtGwmkJ
 V5lNuUQljVELIU8qX+xiZP6bi8WBdIuIaCpWp0SRy5unbAO/CTyaAIaiSaKsdDRiN20q
 ojle6o4+hc3OfUN+JEWg3Bm8faXnWhxb0U2cKIJjelC013CSKCtHra06EIXF7x/iH6eA
 8JCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dV3LuCTcwHlXu6bhF819dEgGFeDbEGWqZjzK4w6nRoM=;
 b=nWUhE1/N+iEPUYIw33uUeXs5U4Y3ILdnMHTC8w2I6yx0OWIm/ohxZy0xY/jSgun/qc
 l7RBh72ymJnJY2sAT39TQT/0laypz8u7cM1O4EpjGX3+i+kN5m32NkA5CGuok86hU6Ya
 0JmfcP7NItvzlq4SBD3Y4yVh7lumf7VR9qvcqA6gXfhLs6fAnMgo9BlSFytygBTuEgR+
 KRI/wa0wgnzsugN++HN+w6Ru4Smw3GPlcQ3Ylz/HjsBqnskBkXQdetg3mlAj84H3hvtx
 46G2pWbPX4xCE/9yHaJzCszAJk91/tzfsEKxNxot2x2cJEpOwIdetRHgE0jepUdTOYW2
 5EcA==
X-Gm-Message-State: AOAM531xJumyhuGfmRA1qDwSDffnExxAMXvgcGd1p7es1u4bXPx/KJJ7
 icuZrhCzOwaIg2Ji4i/xyhmnwHkkRIRM0w==
X-Google-Smtp-Source: ABdhPJxk1pQudPjQYKhxKbe81h356MJHSVzkvE8fc5KaSHPj4bUWTntn9KIpemyAkH5gF6EnAEZXTg==
X-Received: by 2002:a17:90a:d595:: with SMTP id
 v21mr293046pju.50.1625153147124; 
 Thu, 01 Jul 2021 08:25:47 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id j4sm10213197pjv.7.2021.07.01.08.25.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Jul 2021 08:25:46 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 14/17] accel/tcg: Adjust interface of
 TranslatorOps.breakpoint_check
Date: Thu,  1 Jul 2021 08:25:34 -0700
Message-Id: <20210701152537.3330420-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210701152537.3330420-1-richard.henderson@linaro.org>
References: <20210701152537.3330420-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
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
Cc: peter.maydell@linaro.org, mark.cave-ayland@ilande.co.uk,
 alex.bennee@linaro.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We don't need the whole CPUBreakpoint structure in the check,
only the flags.  Return the instruction length to consolidate
the adjustment of db->pc_next.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/translator.h     | 17 +++++++++------
 accel/tcg/translator.c        | 40 ++++++++++++++++++++++++-----------
 target/alpha/translate.c      | 12 +++--------
 target/arm/translate-a64.c    | 14 ++++--------
 target/arm/translate.c        | 20 +++++++-----------
 target/avr/translate.c        |  6 +++---
 target/cris/translate.c       | 14 ++++--------
 target/hexagon/translate.c    | 13 +++---------
 target/hppa/translate.c       |  7 +++---
 target/i386/tcg/translate.c   | 15 ++++---------
 target/m68k/translate.c       | 14 +++---------
 target/microblaze/translate.c | 14 +++---------
 target/mips/tcg/translate.c   | 14 ++++--------
 target/nios2/translate.c      | 13 +++---------
 target/openrisc/translate.c   | 11 +++-------
 target/ppc/translate.c        | 13 +++---------
 target/riscv/translate.c      | 11 +++-------
 target/rx/translate.c         |  8 +++----
 target/s390x/translate.c      | 12 ++++-------
 target/sh4/translate.c        | 12 ++++-------
 target/sparc/translate.c      |  9 ++++----
 target/tricore/translate.c    | 13 +++---------
 target/xtensa/translate.c     | 12 ++++-------
 23 files changed, 115 insertions(+), 199 deletions(-)

diff --git a/include/exec/translator.h b/include/exec/translator.h
index dd9c06d40d..433b753c5c 100644
--- a/include/exec/translator.h
+++ b/include/exec/translator.h
@@ -92,11 +92,15 @@ typedef struct DisasContextBase {
  * @breakpoint_check:
  *      When called, the breakpoint has already been checked to match the PC,
  *      but the target may decide the breakpoint missed the address
- *      (e.g., due to conditions encoded in their flags).  Return true to
- *      indicate that the breakpoint did hit, in which case no more breakpoints
- *      are checked.  If the breakpoint did hit, emit any code required to
- *      signal the exception, and set db->is_jmp as necessary to terminate
- *      the main loop.
+ *      (e.g., due to conditions encoded in their flags), in which case
+ *      db->is_jmp may be left as DISAS_NEXT or DISAS_TOO_MANY to indicate
+ *      that the insn should be translated.  Anything other than those two
+ *      will be taken to indicate an exception has been raised, but in most
+ *      cases db->is_jmp should be set to DISAS_NORETURN.
+ *
+ *      Return the minimum instruction size that should be applied to the TB.
+ *      The size of any TB cannot be zero, as that breaks the math used to
+ *      invalidate TBs.
  *
  * @translate_insn:
  *      Disassemble one instruction and set db->pc_next for the start
@@ -113,8 +117,7 @@ typedef struct TranslatorOps {
     void (*init_disas_context)(DisasContextBase *db, CPUState *cpu);
     void (*tb_start)(DisasContextBase *db, CPUState *cpu);
     void (*insn_start)(DisasContextBase *db, CPUState *cpu);
-    bool (*breakpoint_check)(DisasContextBase *db, CPUState *cpu,
-                             const CPUBreakpoint *bp);
+    int (*breakpoint_check)(DisasContextBase *db, CPUState *cpu, int flags);
     void (*translate_insn)(DisasContextBase *db, CPUState *cpu);
     void (*tb_stop)(DisasContextBase *db, CPUState *cpu);
     void (*disas_log)(const DisasContextBase *db, CPUState *cpu);
diff --git a/accel/tcg/translator.c b/accel/tcg/translator.c
index a59eb7c11b..1c44d096d8 100644
--- a/accel/tcg/translator.c
+++ b/accel/tcg/translator.c
@@ -50,7 +50,6 @@ bool translator_use_goto_tb(DisasContextBase *db, target_ulong dest)
 void translator_loop(const TranslatorOps *ops, DisasContextBase *db,
                      CPUState *cpu, TranslationBlock *tb, int max_insns)
 {
-    int bp_insn = 0;
     bool plugin_enabled;
 
     /* Initialize DisasContext */
@@ -91,19 +90,35 @@ void translator_loop(const TranslatorOps *ops, DisasContextBase *db,
             CPUBreakpoint *bp;
             QTAILQ_FOREACH(bp, &cpu->breakpoints, entry) {
                 if (bp->pc == db->pc_next) {
-                    if (ops->breakpoint_check(db, cpu, bp)) {
-                        bp_insn = 1;
-                        break;
+                    int len = ops->breakpoint_check(db, cpu, bp->flags);
+
+                    /*
+                     * The breakpoint_check hook may use DISAS_TOO_MANY
+                     * to indicate that only one more instruction is to
+                     * be executed.  Otherwise it should use DISAS_NORETURN
+                     * when generating an exception, but may use a
+                     * DISAS_TARGET_* value for Something Else.
+                     */
+                    if (db->is_jmp > DISAS_TOO_MANY) {
+                        /*
+                         * The address covered by the breakpoint must be
+                         * included in [tb->pc, tb->pc + tb->size) in order
+                         * to for it to be properly cleared.  Thus we
+                         * increment the PC here so that the logic setting
+                         * tb->size below does the right thing.
+                         */
+                        tcg_debug_assert(len > 0);
+                        db->pc_next += len;
+
+                        /*
+                         * The breakpoint definitely hit, so decrement the
+                         * number of instructions completed for icount.
+                         */
+                        db->num_insns--;
+                        goto done;
                     }
                 }
             }
-            /* The breakpoint_check hook may use DISAS_TOO_MANY to indicate
-               that only one more instruction is to be executed.  Otherwise
-               it should use DISAS_NORETURN when generating an exception,
-               but may use a DISAS_TARGET_* value for Something Else.  */
-            if (db->is_jmp > DISAS_TOO_MANY) {
-                break;
-            }
         }
 
         /* Disassemble one instruction.  The translate_insn hook should
@@ -142,9 +157,10 @@ void translator_loop(const TranslatorOps *ops, DisasContextBase *db,
         }
     }
 
+ done:
     /* Emit code to exit the TB, as indicated by db->is_jmp.  */
     ops->tb_stop(db, cpu);
-    gen_tb_end(db->tb, db->num_insns - bp_insn);
+    gen_tb_end(db->tb, db->num_insns);
 
     if (plugin_enabled) {
         plugin_gen_tb_end(cpu);
diff --git a/target/alpha/translate.c b/target/alpha/translate.c
index de769f7633..6521bea7af 100644
--- a/target/alpha/translate.c
+++ b/target/alpha/translate.c
@@ -3013,19 +3013,13 @@ static void alpha_tr_insn_start(DisasContextBase *dcbase, CPUState *cpu)
     tcg_gen_insn_start(dcbase->pc_next);
 }
 
-static bool alpha_tr_breakpoint_check(DisasContextBase *dcbase, CPUState *cpu,
-                                      const CPUBreakpoint *bp)
+static int alpha_tr_breakpoint_check(DisasContextBase *dcbase, CPUState *cpu,
+                                     int bp_flags)
 {
     DisasContext *ctx = container_of(dcbase, DisasContext, base);
 
     ctx->base.is_jmp = gen_excp(ctx, EXCP_DEBUG, 0);
-
-    /* The address covered by the breakpoint must be included in
-       [tb->pc, tb->pc + tb->size) in order to for it to be
-       properly cleared -- thus we increment the PC here so that
-       the logic setting tb->size below does the right thing.  */
-    ctx->base.pc_next += 4;
-    return true;
+    return 4; /* minimum instruction length */
 }
 
 static void alpha_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index eb1907d049..74bbee1360 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -14917,28 +14917,22 @@ static void aarch64_tr_insn_start(DisasContextBase *dcbase, CPUState *cpu)
     dc->insn_start = tcg_last_op();
 }
 
-static bool aarch64_tr_breakpoint_check(DisasContextBase *dcbase, CPUState *cpu,
-                                        const CPUBreakpoint *bp)
+static int aarch64_tr_breakpoint_check(DisasContextBase *dcbase,
+                                       CPUState *cpu, int bp_flags)
 {
     DisasContext *dc = container_of(dcbase, DisasContext, base);
 
-    if (bp->flags & BP_CPU) {
+    if (bp_flags & BP_CPU) {
         gen_a64_set_pc_im(dc->base.pc_next);
         gen_helper_check_breakpoints(cpu_env);
         /* End the TB early; it likely won't be executed */
         dc->base.is_jmp = DISAS_TOO_MANY;
     } else {
         gen_exception_internal_insn(dc, dc->base.pc_next, EXCP_DEBUG);
-        /* The address covered by the breakpoint must be
-           included in [tb->pc, tb->pc + tb->size) in order
-           to for it to be properly cleared -- thus we
-           increment the PC here so that the logic setting
-           tb->size below does the right thing.  */
-        dc->base.pc_next += 4;
         dc->base.is_jmp = DISAS_NORETURN;
     }
 
-    return true;
+    return 4; /* minimum instruction length */
 }
 
 static void aarch64_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 87c3c09df5..452b5a8168 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -9116,12 +9116,12 @@ static void arm_tr_insn_start(DisasContextBase *dcbase, CPUState *cpu)
     dc->insn_start = tcg_last_op();
 }
 
-static bool arm_tr_breakpoint_check(DisasContextBase *dcbase, CPUState *cpu,
-                                    const CPUBreakpoint *bp)
+static int arm_tr_breakpoint_check(DisasContextBase *dcbase, CPUState *cpu,
+                                   int bp_flags)
 {
     DisasContext *dc = container_of(dcbase, DisasContext, base);
 
-    if (bp->flags & BP_CPU) {
+    if (bp_flags & BP_CPU) {
         gen_set_condexec(dc);
         gen_set_pc_im(dc, dc->base.pc_next);
         gen_helper_check_breakpoints(cpu_env);
@@ -9129,18 +9129,14 @@ static bool arm_tr_breakpoint_check(DisasContextBase *dcbase, CPUState *cpu,
         dc->base.is_jmp = DISAS_TOO_MANY;
     } else {
         gen_exception_internal_insn(dc, dc->base.pc_next, EXCP_DEBUG);
-        /* The address covered by the breakpoint must be
-           included in [tb->pc, tb->pc + tb->size) in order
-           to for it to be properly cleared -- thus we
-           increment the PC here so that the logic setting
-           tb->size below does the right thing.  */
-        /* TODO: Advance PC by correct instruction length to
-         * avoid disassembler error messages */
-        dc->base.pc_next += 2;
         dc->base.is_jmp = DISAS_NORETURN;
     }
 
-    return true;
+    /*
+     * TODO: Advance PC by correct instruction length to avoid disassembler
+     * error messages.  In the meantime, minimum instruction length.
+     */
+    return 2;
 }
 
 static bool arm_pre_translate_insn(DisasContext *dc)
diff --git a/target/avr/translate.c b/target/avr/translate.c
index 8237a03c23..73ff467926 100644
--- a/target/avr/translate.c
+++ b/target/avr/translate.c
@@ -2944,13 +2944,13 @@ static void avr_tr_insn_start(DisasContextBase *dcbase, CPUState *cs)
     tcg_gen_insn_start(ctx->npc);
 }
 
-static bool avr_tr_breakpoint_check(DisasContextBase *dcbase, CPUState *cs,
-                                    const CPUBreakpoint *bp)
+static int avr_tr_breakpoint_check(DisasContextBase *dcbase, CPUState *cs,
+                                   int bp_flags)
 {
     DisasContext *ctx = container_of(dcbase, DisasContext, base);
 
     gen_breakpoint(ctx);
-    return true;
+    return 2; /* minimum instruction length */
 }
 
 static void avr_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
diff --git a/target/cris/translate.c b/target/cris/translate.c
index e33a3bb326..97710ef4a6 100644
--- a/target/cris/translate.c
+++ b/target/cris/translate.c
@@ -3119,8 +3119,8 @@ static void cris_tr_insn_start(DisasContextBase *dcbase, CPUState *cpu)
     tcg_gen_insn_start(dc->delayed_branch == 1 ? dc->ppc | 1 : dc->pc);
 }
 
-static bool cris_tr_breakpoint_check(DisasContextBase *dcbase, CPUState *cpu,
-                                     const CPUBreakpoint *bp)
+static int cris_tr_breakpoint_check(DisasContextBase *dcbase, CPUState *cpu,
+                                    int bp_flags)
 {
     DisasContext *dc = container_of(dcbase, DisasContext, base);
 
@@ -3128,14 +3128,8 @@ static bool cris_tr_breakpoint_check(DisasContextBase *dcbase, CPUState *cpu,
     tcg_gen_movi_tl(env_pc, dc->pc);
     t_gen_raise_exception(EXCP_DEBUG);
     dc->base.is_jmp = DISAS_NORETURN;
-    /*
-     * The address covered by the breakpoint must be included in
-     * [tb->pc, tb->pc + tb->size) in order to for it to be
-     * properly cleared -- thus we increment the PC here so that
-     * the logic setting tb->size below does the right thing.
-     */
-    dc->pc += 2;
-    return true;
+
+    return 2; /* minimum instruction length */
 }
 
 static void cris_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
diff --git a/target/hexagon/translate.c b/target/hexagon/translate.c
index 9a37644182..ce3569fa7c 100644
--- a/target/hexagon/translate.c
+++ b/target/hexagon/translate.c
@@ -547,20 +547,13 @@ static void hexagon_tr_insn_start(DisasContextBase *dcbase, CPUState *cpu)
     tcg_gen_insn_start(ctx->base.pc_next);
 }
 
-static bool hexagon_tr_breakpoint_check(DisasContextBase *dcbase, CPUState *cpu,
-                                        const CPUBreakpoint *bp)
+static int hexagon_tr_breakpoint_check(DisasContextBase *dcbase,
+                                       CPUState *cpu, int bp_flags)
 {
     DisasContext *ctx = container_of(dcbase, DisasContext, base);
 
     gen_exception_end_tb(ctx, EXCP_DEBUG);
-    /*
-     * The address covered by the breakpoint must be included in
-     * [tb->pc, tb->pc + tb->size) in order to for it to be
-     * properly cleared -- thus we increment the PC here so that
-     * the logic setting tb->size below does the right thing.
-     */
-    ctx->base.pc_next += 4;
-    return true;
+    return 4; /* minimum packet length */
 }
 
 static bool pkt_crosses_page(CPUHexagonState *env, DisasContext *ctx)
diff --git a/target/hppa/translate.c b/target/hppa/translate.c
index 952cfe09a6..1c7bb2a413 100644
--- a/target/hppa/translate.c
+++ b/target/hppa/translate.c
@@ -4205,14 +4205,13 @@ static void hppa_tr_insn_start(DisasContextBase *dcbase, CPUState *cs)
     tcg_gen_insn_start(ctx->iaoq_f, ctx->iaoq_b);
 }
 
-static bool hppa_tr_breakpoint_check(DisasContextBase *dcbase, CPUState *cs,
-                                      const CPUBreakpoint *bp)
+static int hppa_tr_breakpoint_check(DisasContextBase *dcbase, CPUState *cs,
+                                    int bp_flags)
 {
     DisasContext *ctx = container_of(dcbase, DisasContext, base);
 
     gen_excp(ctx, EXCP_DEBUG);
-    ctx->base.pc_next += 4;
-    return true;
+    return 4; /* minimum instruction length */
 }
 
 static void hppa_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index eb9ee0296f..08fc90518b 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -8583,23 +8583,16 @@ static void i386_tr_insn_start(DisasContextBase *dcbase, CPUState *cpu)
     tcg_gen_insn_start(dc->base.pc_next, dc->cc_op);
 }
 
-static bool i386_tr_breakpoint_check(DisasContextBase *dcbase, CPUState *cpu,
-                                     const CPUBreakpoint *bp)
+static int i386_tr_breakpoint_check(DisasContextBase *dcbase, CPUState *cpu,
+                                    int bp_flags)
 {
     DisasContext *dc = container_of(dcbase, DisasContext, base);
     /* If RF is set, suppress an internally generated breakpoint.  */
     int flags = dc->base.tb->flags & HF_RF_MASK ? BP_GDB : BP_ANY;
-    if (bp->flags & flags) {
+    if (bp_flags & flags) {
         gen_debug(dc);
-        /* The address covered by the breakpoint must be included in
-           [tb->pc, tb->pc + tb->size) in order to for it to be
-           properly cleared -- thus we increment the PC here so that
-           the generic logic setting tb->size later does the right thing.  */
-        dc->base.pc_next += 1;
-        return true;
-    } else {
-        return false;
     }
+    return 1; /* minimum instruction length */
 }
 
 static void i386_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
diff --git a/target/m68k/translate.c b/target/m68k/translate.c
index 05b96fdda7..2c921d4260 100644
--- a/target/m68k/translate.c
+++ b/target/m68k/translate.c
@@ -6209,21 +6209,13 @@ static void m68k_tr_insn_start(DisasContextBase *dcbase, CPUState *cpu)
     tcg_gen_insn_start(dc->base.pc_next, dc->cc_op);
 }
 
-static bool m68k_tr_breakpoint_check(DisasContextBase *dcbase, CPUState *cpu,
-                                     const CPUBreakpoint *bp)
+static int m68k_tr_breakpoint_check(DisasContextBase *dcbase, CPUState *cpu,
+                                    int bp_flags)
 {
     DisasContext *dc = container_of(dcbase, DisasContext, base);
 
     gen_exception(dc, dc->base.pc_next, EXCP_DEBUG);
-    /*
-     * The address covered by the breakpoint must be included in
-     * [tb->pc, tb->pc + tb->size) in order to for it to be
-     * properly cleared -- thus we increment the PC here so that
-     * the logic setting tb->size below does the right thing.
-     */
-    dc->base.pc_next += 2;
-
-    return true;
+    return 2; /* minimum instruction length */
 }
 
 static void m68k_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
diff --git a/target/microblaze/translate.c b/target/microblaze/translate.c
index b753f080e7..b0c355a3eb 100644
--- a/target/microblaze/translate.c
+++ b/target/microblaze/translate.c
@@ -1674,21 +1674,13 @@ static void mb_tr_insn_start(DisasContextBase *dcb, CPUState *cs)
     dc->insn_start = tcg_last_op();
 }
 
-static bool mb_tr_breakpoint_check(DisasContextBase *dcb, CPUState *cs,
-                                   const CPUBreakpoint *bp)
+static int mb_tr_breakpoint_check(DisasContextBase *dcb, CPUState *cs,
+                                  int bp_flags)
 {
     DisasContext *dc = container_of(dcb, DisasContext, base);
 
     gen_raise_exception_sync(dc, EXCP_DEBUG);
-
-    /*
-     * The address covered by the breakpoint must be included in
-     * [tb->pc, tb->pc + tb->size) in order to for it to be
-     * properly cleared -- thus we increment the PC here so that
-     * the logic setting tb->size below does the right thing.
-     */
-    dc->base.pc_next += 4;
-    return true;
+    return 4; /* minimum instruction length */
 }
 
 static void mb_tr_translate_insn(DisasContextBase *dcb, CPUState *cs)
diff --git a/target/mips/tcg/translate.c b/target/mips/tcg/translate.c
index 17e79f3de3..441c36fad9 100644
--- a/target/mips/tcg/translate.c
+++ b/target/mips/tcg/translate.c
@@ -25442,22 +25442,16 @@ static void mips_tr_insn_start(DisasContextBase *dcbase, CPUState *cs)
                        ctx->btarget);
 }
 
-static bool mips_tr_breakpoint_check(DisasContextBase *dcbase, CPUState *cs,
-                                     const CPUBreakpoint *bp)
+static int mips_tr_breakpoint_check(DisasContextBase *dcbase, CPUState *cs,
+                                    int bp_flags)
 {
     DisasContext *ctx = container_of(dcbase, DisasContext, base);
 
     save_cpu_state(ctx, 1);
     ctx->base.is_jmp = DISAS_NORETURN;
     gen_helper_raise_exception_debug(cpu_env);
-    /*
-     * The address covered by the breakpoint must be included in
-     * [tb->pc, tb->pc + tb->size) in order to for it to be
-     * properly cleared -- thus we increment the PC here so that
-     * the logic setting tb->size below does the right thing.
-     */
-    ctx->base.pc_next += 4;
-    return true;
+
+    return 2; /* minimum instruction length */
 }
 
 static void mips_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
diff --git a/target/nios2/translate.c b/target/nios2/translate.c
index 17742cebc7..1d1c66b88f 100644
--- a/target/nios2/translate.c
+++ b/target/nios2/translate.c
@@ -777,20 +777,13 @@ static void nios2_tr_insn_start(DisasContextBase *dcbase, CPUState *cs)
     tcg_gen_insn_start(dcbase->pc_next);
 }
 
-static bool nios2_tr_breakpoint_check(DisasContextBase *dcbase, CPUState *cs,
-                                      const CPUBreakpoint *bp)
+static int nios2_tr_breakpoint_check(DisasContextBase *dcbase, CPUState *cs,
+                                     int bp_flags)
 {
     DisasContext *dc = container_of(dcbase, DisasContext, base);
 
     gen_exception(dc, EXCP_DEBUG);
-    /*
-     * The address covered by the breakpoint must be included in
-     * [tb->pc, tb->pc + tb->size) in order to for it to be
-     * properly cleared -- thus we increment the PC here so that
-     * the logic setting tb->size below does the right thing.
-     */
-    dc->base.pc_next += 4;
-    return true;
+    return 4; /* minimum instruction length */
 }
 
 static void nios2_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
diff --git a/target/openrisc/translate.c b/target/openrisc/translate.c
index 2d142d8577..1da064edb4 100644
--- a/target/openrisc/translate.c
+++ b/target/openrisc/translate.c
@@ -1640,20 +1640,15 @@ static void openrisc_tr_insn_start(DisasContextBase *dcbase, CPUState *cs)
                        | (dc->base.num_insns > 1 ? 2 : 0));
 }
 
-static bool openrisc_tr_breakpoint_check(DisasContextBase *dcbase, CPUState *cs,
-                                         const CPUBreakpoint *bp)
+static int openrisc_tr_breakpoint_check(DisasContextBase *dcbase,
+                                        CPUState *cs, int bp_flags)
 {
     DisasContext *dc = container_of(dcbase, DisasContext, base);
 
     tcg_gen_movi_tl(cpu_pc, dc->base.pc_next);
     gen_exception(dc, EXCP_DEBUG);
     dc->base.is_jmp = DISAS_NORETURN;
-    /* The address covered by the breakpoint must be included in
-       [tb->pc, tb->pc + tb->size) in order to for it to be
-       properly cleared -- thus we increment the PC here so that
-       the logic setting tb->size below does the right thing.  */
-    dc->base.pc_next += 4;
-    return true;
+    return 4; /* minimum instruction length */
 }
 
 static void openrisc_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index 0fb09f2301..ffefb5e78b 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -8561,21 +8561,14 @@ static void ppc_tr_insn_start(DisasContextBase *dcbase, CPUState *cs)
     tcg_gen_insn_start(dcbase->pc_next);
 }
 
-static bool ppc_tr_breakpoint_check(DisasContextBase *dcbase, CPUState *cs,
-                                    const CPUBreakpoint *bp)
+static int ppc_tr_breakpoint_check(DisasContextBase *dcbase, CPUState *cs,
+                                   int bp_flags)
 {
     DisasContext *ctx = container_of(dcbase, DisasContext, base);
 
     gen_update_nip(ctx, ctx->base.pc_next);
     gen_debug_exception(ctx);
-    /*
-     * The address covered by the breakpoint must be included in
-     * [tb->pc, tb->pc + tb->size) in order to for it to be properly
-     * cleared -- thus we increment the PC here so that the logic
-     * setting tb->size below does the right thing.
-     */
-    ctx->base.pc_next += 4;
-    return true;
+    return 4; /* minimum instruction length */
 }
 
 static bool is_prefix_insn(DisasContext *ctx, uint32_t insn)
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index deda0c8a44..8a6bc58572 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -961,20 +961,15 @@ static void riscv_tr_insn_start(DisasContextBase *dcbase, CPUState *cpu)
     tcg_gen_insn_start(ctx->base.pc_next);
 }
 
-static bool riscv_tr_breakpoint_check(DisasContextBase *dcbase, CPUState *cpu,
-                                      const CPUBreakpoint *bp)
+static int riscv_tr_breakpoint_check(DisasContextBase *dcbase, CPUState *cpu,
+                                     int bp_flags)
 {
     DisasContext *ctx = container_of(dcbase, DisasContext, base);
 
     tcg_gen_movi_tl(cpu_pc, ctx->base.pc_next);
     ctx->base.is_jmp = DISAS_NORETURN;
     gen_exception_debug();
-    /* The address covered by the breakpoint must be included in
-       [tb->pc, tb->pc + tb->size) in order to for it to be
-       properly cleared -- thus we increment the PC here so that
-       the logic setting tb->size below does the right thing.  */
-    ctx->base.pc_next += 4;
-    return true;
+    return 2; /* minimum instruction length */
 }
 
 static void riscv_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
diff --git a/target/rx/translate.c b/target/rx/translate.c
index 2443406de5..b0cd517e0b 100644
--- a/target/rx/translate.c
+++ b/target/rx/translate.c
@@ -2310,8 +2310,8 @@ static void rx_tr_insn_start(DisasContextBase *dcbase, CPUState *cs)
     tcg_gen_insn_start(ctx->base.pc_next);
 }
 
-static bool rx_tr_breakpoint_check(DisasContextBase *dcbase, CPUState *cs,
-                                    const CPUBreakpoint *bp)
+static int rx_tr_breakpoint_check(DisasContextBase *dcbase, CPUState *cs,
+                                  int bp_flags)
 {
     DisasContext *ctx = container_of(dcbase, DisasContext, base);
 
@@ -2319,8 +2319,8 @@ static bool rx_tr_breakpoint_check(DisasContextBase *dcbase, CPUState *cs,
     tcg_gen_movi_i32(cpu_pc, ctx->base.pc_next);
     gen_helper_debug(cpu_env);
     ctx->base.is_jmp = DISAS_NORETURN;
-    ctx->base.pc_next += 1;
-    return true;
+
+    return 1; /* minimum instruction length */
 }
 
 static void rx_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
diff --git a/target/s390x/translate.c b/target/s390x/translate.c
index 4742f59ca9..4634bb79e6 100644
--- a/target/s390x/translate.c
+++ b/target/s390x/translate.c
@@ -6566,8 +6566,8 @@ static void s390x_tr_insn_start(DisasContextBase *dcbase, CPUState *cs)
 {
 }
 
-static bool s390x_tr_breakpoint_check(DisasContextBase *dcbase, CPUState *cs,
-                                      const CPUBreakpoint *bp)
+static int s390x_tr_breakpoint_check(DisasContextBase *dcbase, CPUState *cs,
+                                     int bp_flags)
 {
     DisasContext *dc = container_of(dcbase, DisasContext, base);
 
@@ -6581,12 +6581,8 @@ static bool s390x_tr_breakpoint_check(DisasContextBase *dcbase, CPUState *cs,
 
     dc->base.is_jmp = DISAS_PC_STALE;
     dc->do_debug = true;
-    /* The address covered by the breakpoint must be included in
-       [tb->pc, tb->pc + tb->size) in order to for it to be
-       properly cleared -- thus we increment the PC here so that
-       the logic setting tb->size does the right thing.  */
-    dc->base.pc_next += 2;
-    return true;
+
+    return 2; /* minimum instruction length */
 }
 
 static void s390x_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
diff --git a/target/sh4/translate.c b/target/sh4/translate.c
index db09a0bce3..3672802785 100644
--- a/target/sh4/translate.c
+++ b/target/sh4/translate.c
@@ -2290,8 +2290,8 @@ static void sh4_tr_insn_start(DisasContextBase *dcbase, CPUState *cs)
     tcg_gen_insn_start(ctx->base.pc_next, ctx->envflags);
 }
 
-static bool sh4_tr_breakpoint_check(DisasContextBase *dcbase, CPUState *cs,
-                                    const CPUBreakpoint *bp)
+static int sh4_tr_breakpoint_check(DisasContextBase *dcbase, CPUState *cs,
+                                   int bp_flags)
 {
     DisasContext *ctx = container_of(dcbase, DisasContext, base);
 
@@ -2299,12 +2299,8 @@ static bool sh4_tr_breakpoint_check(DisasContextBase *dcbase, CPUState *cs,
     gen_save_cpu_state(ctx, true);
     gen_helper_debug(cpu_env);
     ctx->base.is_jmp = DISAS_NORETURN;
-    /* The address covered by the breakpoint must be included in
-       [tb->pc, tb->pc + tb->size) in order to for it to be
-       properly cleared -- thus we increment the PC here so that
-       the logic setting tb->size below does the right thing.  */
-    ctx->base.pc_next += 2;
-    return true;
+
+    return 2; /* minimum instruction length */
 }
 
 static void sh4_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
diff --git a/target/sparc/translate.c b/target/sparc/translate.c
index fb0c242606..fbc77b693d 100644
--- a/target/sparc/translate.c
+++ b/target/sparc/translate.c
@@ -5855,8 +5855,8 @@ static void sparc_tr_insn_start(DisasContextBase *dcbase, CPUState *cs)
     }
 }
 
-static bool sparc_tr_breakpoint_check(DisasContextBase *dcbase, CPUState *cs,
-                                      const CPUBreakpoint *bp)
+static int sparc_tr_breakpoint_check(DisasContextBase *dcbase, CPUState *cs,
+                                     int bp_flags)
 {
     DisasContext *dc = container_of(dcbase, DisasContext, base);
 
@@ -5866,9 +5866,8 @@ static bool sparc_tr_breakpoint_check(DisasContextBase *dcbase, CPUState *cs,
     gen_helper_debug(cpu_env);
     tcg_gen_exit_tb(NULL, 0);
     dc->base.is_jmp = DISAS_NORETURN;
-    /* update pc_next so that the current instruction is included in tb->size */
-    dc->base.pc_next += 4;
-    return true;
+
+    return 4; /* minimum instruction length */
 }
 
 static void sparc_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
diff --git a/target/tricore/translate.c b/target/tricore/translate.c
index 865020754d..8c39134d52 100644
--- a/target/tricore/translate.c
+++ b/target/tricore/translate.c
@@ -8810,19 +8810,12 @@ static void tricore_tr_insn_start(DisasContextBase *dcbase, CPUState *cpu)
     tcg_gen_insn_start(ctx->base.pc_next);
 }
 
-static bool tricore_tr_breakpoint_check(DisasContextBase *dcbase, CPUState *cpu,
-                                      const CPUBreakpoint *bp)
+static int tricore_tr_breakpoint_check(DisasContextBase *dcbase,
+                                       CPUState *cpu, int bp_flags)
 {
     DisasContext *ctx = container_of(dcbase, DisasContext, base);
     generate_qemu_excp(ctx, EXCP_DEBUG);
-    /*
-     * The address covered by the breakpoint must be included in
-     * [tb->pc, tb->pc + tb->size) in order to for it to be
-     * properly cleared -- thus we increment the PC here so that
-     * the logic setting tb->size below does the right thing.
-     */
-    ctx->base.pc_next += 4;
-    return true;
+    return 4; /* minimum instruction length */
 }
 
 static bool insn_crosses_page(CPUTriCoreState *env, DisasContext *ctx)
diff --git a/target/xtensa/translate.c b/target/xtensa/translate.c
index ac42f5efdc..347187d588 100644
--- a/target/xtensa/translate.c
+++ b/target/xtensa/translate.c
@@ -1233,20 +1233,16 @@ static void xtensa_tr_insn_start(DisasContextBase *dcbase, CPUState *cpu)
     tcg_gen_insn_start(dcbase->pc_next);
 }
 
-static bool xtensa_tr_breakpoint_check(DisasContextBase *dcbase, CPUState *cpu,
-                                       const CPUBreakpoint *bp)
+static int xtensa_tr_breakpoint_check(DisasContextBase *dcbase, CPUState *cpu,
+                                      int bp_flags)
 {
     DisasContext *dc = container_of(dcbase, DisasContext, base);
 
     tcg_gen_movi_i32(cpu_pc, dc->base.pc_next);
     gen_exception(dc, EXCP_DEBUG);
     dc->base.is_jmp = DISAS_NORETURN;
-    /* The address covered by the breakpoint must be included in
-       [tb->pc, tb->pc + tb->size) in order to for it to be
-       properly cleared -- thus we increment the PC here so that
-       the logic setting tb->size below does the right thing.  */
-    dc->base.pc_next += 2;
-    return true;
+
+    return 2; /* minimum instruction length */
 }
 
 static void xtensa_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
-- 
2.25.1


