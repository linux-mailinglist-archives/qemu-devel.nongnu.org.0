Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F98D59EEF0
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Aug 2022 00:21:42 +0200 (CEST)
Received: from localhost ([::1]:34314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQcHF-00011o-6T
	for lists+qemu-devel@lfdr.de; Tue, 23 Aug 2022 18:21:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQc2E-0000U4-Nn
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 18:06:10 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:40755)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQc2C-0001Pj-I9
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 18:06:10 -0400
Received: by mail-pl1-x62e.google.com with SMTP id x23so14022255pll.7
 for <qemu-devel@nongnu.org>; Tue, 23 Aug 2022 15:06:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=iNTo0+IlWQn4fz57YkEX/KBwpUkmvnYdUksL6z9QAHA=;
 b=YvJni5qbHSL23L1617rU533wi/B01NE87QEfJ3g+6lHKv73cmpBpmtm9ko7DF/v+Lv
 toZpFBh0pt8u5FleZD8KLuJD5ZLLyfPVi0uge/RP6nWYtLwLhJecOM/Jb5S7VdMESdd1
 +ZxB/lClinAAIAA+XkqbwzbAp1hK+L9ghePdEz8N1FBwAqX702spSTTS0S0alNEOz83U
 cjfjj5uFd12kmo5JrgGwasvBIUxvGR51Qfddsj8SD+Ck9zI3jhsK/5wb1/pnHI9JWEix
 Q97mD3wuROv4vZ1iED1WSkmxoD4YRM/XHFAuiAdFaJZJfiIWiwtE9jngFKjAWd4KHKlz
 MrjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=iNTo0+IlWQn4fz57YkEX/KBwpUkmvnYdUksL6z9QAHA=;
 b=T3+AJIjvXZBoMUK08MMbIlqEImKyqkEz1waYRqCFsuccereA6DBY14YW5DtOq3/WPR
 lVoacee1FE2yq/RbrqooCSCgp9cAIp3m48bAnm9DyYFxJ4iUubxvUapv//AQA33/JcKu
 qByXUWTk+IR3v1CTZfj8rGdys7+xIVBuHhbzRWzcG6QJg2vUExJDi09jFR6Sy2hsW8wr
 XhPv2RG4Je53c/b2GJ/uJoj3wz1NTjtmWh3V14yzF6CAYnMTWy2IM/WamtG1uiGCNcvO
 GBnacf9QSRXkCrtofb3Mw93zKMg9V+6ogaDj+sIesDbXQxyS9z33+xsmHmvqwYzF2rCA
 gugQ==
X-Gm-Message-State: ACgBeo1L2bjypjZlGoKyO/S8wQmA+d8CeYMJYpeYTXo/aK7urEbQpbIV
 y096pV5frZD8ZNRs6Jp3FBM0YmOCZSelrw==
X-Google-Smtp-Source: AA6agR6XGa23lbUptANmzDryGledqAa3sCDisYzkNJSt3Q1/VUoWQM2vBQBrc6GU2S4vzsDc1hdKIQ==
X-Received: by 2002:a17:902:8b86:b0:170:d739:9a35 with SMTP id
 ay6-20020a1709028b8600b00170d7399a35mr26404774plb.35.1661292367185; 
 Tue, 23 Aug 2022 15:06:07 -0700 (PDT)
Received: from stoup.. ([2602:47:d49d:ec01:46f9:77b4:ec0a:c2d9])
 by smtp.gmail.com with ESMTPSA id
 n12-20020a170902f60c00b0017292073839sm11020974plg.178.2022.08.23.15.06.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Aug 2022 15:06:06 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: iii@linux.ibm.com,
	laurent@vivier.eu,
	alex.bennee@linaro.org
Subject: [PATCH v7 18/20] target/i386: Make translator stop before the end of
 a page
Date: Tue, 23 Aug 2022 15:05:40 -0700
Message-Id: <20220823220542.1993395-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220823220542.1993395-1-richard.henderson@linaro.org>
References: <20220823220542.1993395-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Ilya Leoshkevich <iii@linux.ibm.com>

Right now translator stops right *after* the end of a page, which
breaks reporting of fault locations when the last instruction of a
multi-insn translation block crosses a page boundary.

An implementation, like the one arm and s390x have, would require an
i386 length disassembler, which is burdensome to maintain. Another
alternative would be to single-step at the end of a guest page, but
this may come with a performance impact.

Fix by snapshotting disassembly state and restoring it after we figure
out we crossed a page boundary. This includes rolling back cc_op
updates and emitted ops.

Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1143
Message-Id: <20220817150506.592862-4-iii@linux.ibm.com>
[rth: Simplify end-of-insn cross-page checks.]
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/tcg/translate.c      | 64 ++++++++++++++++-----------
 tests/tcg/x86_64/noexec.c        | 75 ++++++++++++++++++++++++++++++++
 tests/tcg/x86_64/Makefile.target |  3 +-
 3 files changed, 116 insertions(+), 26 deletions(-)
 create mode 100644 tests/tcg/x86_64/noexec.c

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 4836c889e0..b184fe33b8 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -130,6 +130,7 @@ typedef struct DisasContext {
     TCGv_i64 tmp1_i64;
 
     sigjmp_buf jmpbuf;
+    TCGOp *prev_insn_end;
 } DisasContext;
 
 /* The environment in which user-only runs is constrained. */
@@ -2008,6 +2009,12 @@ static uint64_t advance_pc(CPUX86State *env, DisasContext *s, int num_bytes)
 {
     uint64_t pc = s->pc;
 
+    /* This is a subsequent insn that crosses a page boundary.  */
+    if (s->base.num_insns > 1 &&
+        !is_same_page(&s->base, s->pc + num_bytes - 1)) {
+        siglongjmp(s->jmpbuf, 2);
+    }
+
     s->pc += num_bytes;
     if (unlikely(s->pc - s->pc_start > X86_MAX_INSN_LENGTH)) {
         /* If the instruction's 16th byte is on a different page than the 1st, a
@@ -4556,6 +4563,8 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
     int modrm, reg, rm, mod, op, opreg, val;
     target_ulong next_eip, tval;
     target_ulong pc_start = s->base.pc_next;
+    bool orig_cc_op_dirty = s->cc_op_dirty;
+    CCOp orig_cc_op = s->cc_op;
 
     s->pc_start = s->pc = pc_start;
     s->override = -1;
@@ -4568,9 +4577,22 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
     s->rip_offset = 0; /* for relative ip address */
     s->vex_l = 0;
     s->vex_v = 0;
-    if (sigsetjmp(s->jmpbuf, 0) != 0) {
+    switch (sigsetjmp(s->jmpbuf, 0)) {
+    case 0:
+        break;
+    case 1:
         gen_exception_gpf(s);
         return s->pc;
+    case 2:
+        /* Restore state that may affect the next instruction. */
+        s->cc_op_dirty = orig_cc_op_dirty;
+        s->cc_op = orig_cc_op;
+        s->base.num_insns--;
+        tcg_remove_ops_after(s->prev_insn_end);
+        s->base.is_jmp = DISAS_TOO_MANY;
+        return pc_start;
+    default:
+        g_assert_not_reached();
     }
 
     prefixes = 0;
@@ -8632,6 +8654,7 @@ static void i386_tr_insn_start(DisasContextBase *dcbase, CPUState *cpu)
 {
     DisasContext *dc = container_of(dcbase, DisasContext, base);
 
+    dc->prev_insn_end = tcg_last_op();
     tcg_gen_insn_start(dc->base.pc_next, dc->cc_op);
 }
 
@@ -8652,31 +8675,22 @@ static void i386_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
 #endif
 
     pc_next = disas_insn(dc, cpu);
-
-    if (dc->flags & (HF_TF_MASK | HF_INHIBIT_IRQ_MASK)) {
-        /* if single step mode, we generate only one instruction and
-           generate an exception */
-        /* if irq were inhibited with HF_INHIBIT_IRQ_MASK, we clear
-           the flag and abort the translation to give the irqs a
-           chance to happen */
-        dc->base.is_jmp = DISAS_TOO_MANY;
-    } else if ((tb_cflags(dc->base.tb) & CF_USE_ICOUNT)
-               && ((pc_next & TARGET_PAGE_MASK)
-                   != ((pc_next + TARGET_MAX_INSN_SIZE - 1)
-                       & TARGET_PAGE_MASK)
-                   || (pc_next & ~TARGET_PAGE_MASK) == 0)) {
-        /* Do not cross the boundary of the pages in icount mode,
-           it can cause an exception. Do it only when boundary is
-           crossed by the first instruction in the block.
-           If current instruction already crossed the bound - it's ok,
-           because an exception hasn't stopped this code.
-         */
-        dc->base.is_jmp = DISAS_TOO_MANY;
-    } else if ((pc_next - dc->base.pc_first) >= (TARGET_PAGE_SIZE - 32)) {
-        dc->base.is_jmp = DISAS_TOO_MANY;
-    }
-
     dc->base.pc_next = pc_next;
+
+    if (dc->base.is_jmp == DISAS_NEXT) {
+        if (dc->flags & (HF_TF_MASK | HF_INHIBIT_IRQ_MASK)) {
+            /*
+             * If single step mode, we generate only one instruction and
+             * generate an exception.
+             * If irq were inhibited with HF_INHIBIT_IRQ_MASK, we clear
+             * the flag and abort the translation to give the irqs a
+             * chance to happen.
+             */
+            dc->base.is_jmp = DISAS_TOO_MANY;
+        } else if (!is_same_page(&dc->base, pc_next)) {
+            dc->base.is_jmp = DISAS_TOO_MANY;
+        }
+    }
 }
 
 static void i386_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
diff --git a/tests/tcg/x86_64/noexec.c b/tests/tcg/x86_64/noexec.c
new file mode 100644
index 0000000000..9b124901be
--- /dev/null
+++ b/tests/tcg/x86_64/noexec.c
@@ -0,0 +1,75 @@
+#include "../multiarch/noexec.c.inc"
+
+static void *arch_mcontext_pc(const mcontext_t *ctx)
+{
+    return (void *)ctx->gregs[REG_RIP];
+}
+
+int arch_mcontext_arg(const mcontext_t *ctx)
+{
+    return ctx->gregs[REG_RDI];
+}
+
+static void arch_flush(void *p, int len)
+{
+}
+
+extern char noexec_1[];
+extern char noexec_2[];
+extern char noexec_end[];
+
+asm("noexec_1:\n"
+    "    movq $1,%rdi\n"    /* %rdi is 0 on entry, set 1. */
+    "noexec_2:\n"
+    "    movq $2,%rdi\n"    /* %rdi is 0/1; set 2. */
+    "    ret\n"
+    "noexec_end:");
+
+int main(void)
+{
+    struct noexec_test noexec_tests[] = {
+        {
+            .name = "fallthrough",
+            .test_code = noexec_1,
+            .test_len = noexec_end - noexec_1,
+            .page_ofs = noexec_1 - noexec_2,
+            .entry_ofs = noexec_1 - noexec_2,
+            .expected_si_ofs = 0,
+            .expected_pc_ofs = 0,
+            .expected_arg = 1,
+        },
+        {
+            .name = "jump",
+            .test_code = noexec_1,
+            .test_len = noexec_end - noexec_1,
+            .page_ofs = noexec_1 - noexec_2,
+            .entry_ofs = 0,
+            .expected_si_ofs = 0,
+            .expected_pc_ofs = 0,
+            .expected_arg = 0,
+        },
+        {
+            .name = "fallthrough [cross]",
+            .test_code = noexec_1,
+            .test_len = noexec_end - noexec_1,
+            .page_ofs = noexec_1 - noexec_2 - 2,
+            .entry_ofs = noexec_1 - noexec_2 - 2,
+            .expected_si_ofs = 0,
+            .expected_pc_ofs = -2,
+            .expected_arg = 1,
+        },
+        {
+            .name = "jump [cross]",
+            .test_code = noexec_1,
+            .test_len = noexec_end - noexec_1,
+            .page_ofs = noexec_1 - noexec_2 - 2,
+            .entry_ofs = -2,
+            .expected_si_ofs = 0,
+            .expected_pc_ofs = -2,
+            .expected_arg = 0,
+        },
+    };
+
+    return test_noexec(noexec_tests,
+                       sizeof(noexec_tests) / sizeof(noexec_tests[0]));
+}
diff --git a/tests/tcg/x86_64/Makefile.target b/tests/tcg/x86_64/Makefile.target
index b71a6bcd5e..c0e7e5b005 100644
--- a/tests/tcg/x86_64/Makefile.target
+++ b/tests/tcg/x86_64/Makefile.target
@@ -10,6 +10,7 @@ include $(SRC_PATH)/tests/tcg/i386/Makefile.target
 
 ifeq ($(filter %-linux-user, $(TARGET)),$(TARGET))
 X86_64_TESTS += vsyscall
+X86_64_TESTS += noexec
 TESTS=$(MULTIARCH_TESTS) $(X86_64_TESTS) test-x86_64
 else
 TESTS=$(MULTIARCH_TESTS)
@@ -20,5 +21,5 @@ test-x86_64: LDFLAGS+=-lm -lc
 test-x86_64: test-i386.c test-i386.h test-i386-shift.h test-i386-muldiv.h
 	$(CC) $(CFLAGS) $< -o $@ $(LDFLAGS)
 
-vsyscall: $(SRC_PATH)/tests/tcg/x86_64/vsyscall.c
+%: $(SRC_PATH)/tests/tcg/x86_64/%.c
 	$(CC) $(CFLAGS) $< -o $@ $(LDFLAGS)
-- 
2.34.1


