Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 924CA2A8D8D
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Nov 2020 04:34:15 +0100 (CET)
Received: from localhost ([::1]:58248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kasVy-0001Mx-Ki
	for lists+qemu-devel@lfdr.de; Thu, 05 Nov 2020 22:34:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kasRP-0004NV-Lm
 for qemu-devel@nongnu.org; Thu, 05 Nov 2020 22:29:31 -0500
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:33485)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kasRN-0006u7-4F
 for qemu-devel@nongnu.org; Thu, 05 Nov 2020 22:29:31 -0500
Received: by mail-pf1-x42d.google.com with SMTP id q10so66073pfn.0
 for <qemu-devel@nongnu.org>; Thu, 05 Nov 2020 19:29:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KBY1J8V9NyIcuXYQ6Nx22ITs65VLGTs78EJG+4pWzHM=;
 b=oankWoEtin6BmM0CshLpdxxvliPpKUs5HN52MI3C5nF1Em9tPwKYQ+m8AuHhBz3dHw
 8oQzItmK1E77IBJHTZcSia6osTP8hm9Qcjk2LphWgfhlekErYs2vLYGJ8kA4OW/IaF36
 Jklz69YqksP28fnZ+rmEsu8psX6qAdc0Yb1yjdzaVi45EeESKT72l4GRxOQRxn5GmJCc
 BB8m6Igi4UsVM+zsJqnk96TKo+65BwQMmlshIc9QwxnL5pW8V4F8JThaP4xYgkWcHW3b
 jpQb05nKSzxkrecb8mTXHQirmwQ+6ibVITF8mKERoONtXhAQmXpw9eAccN5w0CT7Z97S
 OXrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KBY1J8V9NyIcuXYQ6Nx22ITs65VLGTs78EJG+4pWzHM=;
 b=baKIxhCHeQASxRCNEZ/1BIpPB9mURCSMIQO5ZlQWWuHsvSWxZ22S55iBOhHl/gxyTH
 6bsCLHaGMoeTKu8eePn41sS2vUG0JJ9BxWKrp6bDODhsevuo9q4u5a+10xhT7j1iJ3lg
 NxRT+UZ48pqnKOEAeLLNjNh2Ur9djFKhIkhzKbQM99ecOetvXxcgQUH3OortOZSW7Ql2
 vdbwlS5EJhyNBbU5XQAXZ3z/5hEtkxT7bqrD0fjCD/3Y99qBrWJ4c+t4/ixoOTl65KmU
 EtXwnR77u4GF4DfLhvtow3708vNQFflzOu/LqNeawhwsy5pO/7yq4JuwIamqYiM0EUrL
 /R3g==
X-Gm-Message-State: AOAM532+GYdQQO0oBXx++O1qyZv6XhlgWe+VtusurXEg0IlX7YIcnzka
 bGqD4fdP30oyKJ9tre7g6QXyZV1mIVivMQ==
X-Google-Smtp-Source: ABdhPJxBa7Yd/roJv8P+zK/6wARP8IA4ieuqBUt0AB35xi/IRpRB7d/ehxWmvQ1/yH8YYVX2OxAcpQ==
X-Received: by 2002:a63:5650:: with SMTP id g16mr2510789pgm.353.1604633367297; 
 Thu, 05 Nov 2020 19:29:27 -0800 (PST)
Received: from localhost.localdomain (76-14-210-194.or.wavecable.com.
 [76.14.210.194])
 by smtp.gmail.com with ESMTPSA id i10sm40773pfd.60.2020.11.05.19.29.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Nov 2020 19:29:26 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 03/41] tcg: Move tcg epilogue pointer out of TCGContext
Date: Thu,  5 Nov 2020 19:28:43 -0800
Message-Id: <20201106032921.600200-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201106032921.600200-1-richard.henderson@linaro.org>
References: <20201106032921.600200-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: j@getutm.app
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This value is constant across all thread-local copies of TCGContext,
so we might as well move it out of thread-local storage.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/tcg/tcg.h            | 2 +-
 accel/tcg/tcg-runtime.c      | 2 +-
 tcg/tcg.c                    | 3 ++-
 tcg/aarch64/tcg-target.c.inc | 4 ++--
 tcg/arm/tcg-target.c.inc     | 2 +-
 tcg/i386/tcg-target.c.inc    | 4 ++--
 tcg/mips/tcg-target.c.inc    | 2 +-
 tcg/ppc/tcg-target.c.inc     | 2 +-
 tcg/riscv/tcg-target.c.inc   | 4 ++--
 tcg/s390/tcg-target.c.inc    | 4 ++--
 tcg/sparc/tcg-target.c.inc   | 2 +-
 11 files changed, 16 insertions(+), 15 deletions(-)

diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
index 9cc412f90c..bb1e97b13b 100644
--- a/include/tcg/tcg.h
+++ b/include/tcg/tcg.h
@@ -621,7 +621,6 @@ struct TCGContext {
        here, because there's too much arithmetic throughout that relies
        on addition and subtraction working on bytes.  Rely on the GCC
        extension that allows arithmetic on void*.  */
-    void *code_gen_epilogue;
     void *code_gen_buffer;
     size_t code_gen_buffer_size;
     void *code_gen_ptr;
@@ -678,6 +677,7 @@ struct TCGContext {
 
 extern TCGContext tcg_init_ctx;
 extern __thread TCGContext *tcg_ctx;
+extern void *tcg_code_gen_epilogue;
 extern TCGv_env cpu_env;
 
 static inline size_t temp_idx(TCGTemp *ts)
diff --git a/accel/tcg/tcg-runtime.c b/accel/tcg/tcg-runtime.c
index 446465a09a..f85dfefeab 100644
--- a/accel/tcg/tcg-runtime.c
+++ b/accel/tcg/tcg-runtime.c
@@ -154,7 +154,7 @@ void *HELPER(lookup_tb_ptr)(CPUArchState *env)
 
     tb = tb_lookup__cpu_state(cpu, &pc, &cs_base, &flags, curr_cflags());
     if (tb == NULL) {
-        return tcg_ctx->code_gen_epilogue;
+        return tcg_code_gen_epilogue;
     }
     qemu_log_mask_and_addr(CPU_LOG_EXEC, pc,
                            "Chain %d: %p ["
diff --git a/tcg/tcg.c b/tcg/tcg.c
index a6f47b033c..1e83eed83f 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -160,6 +160,7 @@ static int tcg_out_ldst_finalize(TCGContext *s);
 static TCGContext **tcg_ctxs;
 static unsigned int n_tcg_ctxs;
 TCGv_env cpu_env = 0;
+void *tcg_code_gen_epilogue;
 
 #ifndef CONFIG_TCG_INTERPRETER
 tcg_prologue_fn *tcg_qemu_tb_exec;
@@ -1130,7 +1131,7 @@ void tcg_prologue_init(TCGContext *s)
 
     /* Assert that goto_ptr is implemented completely.  */
     if (TCG_TARGET_HAS_goto_ptr) {
-        tcg_debug_assert(s->code_gen_epilogue != NULL);
+        tcg_debug_assert(tcg_code_gen_epilogue != NULL);
     }
 }
 
diff --git a/tcg/aarch64/tcg-target.c.inc b/tcg/aarch64/tcg-target.c.inc
index 83af3108a4..76f8ae48ad 100644
--- a/tcg/aarch64/tcg-target.c.inc
+++ b/tcg/aarch64/tcg-target.c.inc
@@ -1873,7 +1873,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_exit_tb:
         /* Reuse the zeroing that exists for goto_ptr.  */
         if (a0 == 0) {
-            tcg_out_goto_long(s, s->code_gen_epilogue);
+            tcg_out_goto_long(s, tcg_code_gen_epilogue);
         } else {
             tcg_out_movi(s, TCG_TYPE_I64, TCG_REG_X0, a0);
             tcg_out_goto_long(s, tb_ret_addr);
@@ -2894,7 +2894,7 @@ static void tcg_target_qemu_prologue(TCGContext *s)
      * Return path for goto_ptr. Set return value to 0, a-la exit_tb,
      * and fall through to the rest of the epilogue.
      */
-    s->code_gen_epilogue = s->code_ptr;
+    tcg_code_gen_epilogue = s->code_ptr;
     tcg_out_movi(s, TCG_TYPE_REG, TCG_REG_X0, 0);
 
     /* TB epilogue */
diff --git a/tcg/arm/tcg-target.c.inc b/tcg/arm/tcg-target.c.inc
index 62c37a954b..1e32bf42b8 100644
--- a/tcg/arm/tcg-target.c.inc
+++ b/tcg/arm/tcg-target.c.inc
@@ -2297,7 +2297,7 @@ static void tcg_target_qemu_prologue(TCGContext *s)
      * Return path for goto_ptr. Set return value to 0, a-la exit_tb,
      * and fall through to the rest of the epilogue.
      */
-    s->code_gen_epilogue = s->code_ptr;
+    tcg_code_gen_epilogue = s->code_ptr;
     tcg_out_movi(s, TCG_TYPE_PTR, TCG_REG_R0, 0);
     tcg_out_epilogue(s);
 }
diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index d8797ed398..424dd1cdcf 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -2267,7 +2267,7 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_exit_tb:
         /* Reuse the zeroing that exists for goto_ptr.  */
         if (a0 == 0) {
-            tcg_out_jmp(s, s->code_gen_epilogue);
+            tcg_out_jmp(s, tcg_code_gen_epilogue);
         } else {
             tcg_out_movi(s, TCG_TYPE_PTR, TCG_REG_EAX, a0);
             tcg_out_jmp(s, tb_ret_addr);
@@ -3825,7 +3825,7 @@ static void tcg_target_qemu_prologue(TCGContext *s)
      * Return path for goto_ptr. Set return value to 0, a-la exit_tb,
      * and fall through to the rest of the epilogue.
      */
-    s->code_gen_epilogue = s->code_ptr;
+    tcg_code_gen_epilogue = s->code_ptr;
     tcg_out_movi(s, TCG_TYPE_REG, TCG_REG_EAX, 0);
 
     /* TB epilogue */
diff --git a/tcg/mips/tcg-target.c.inc b/tcg/mips/tcg-target.c.inc
index c255ecb444..f641105f9a 100644
--- a/tcg/mips/tcg-target.c.inc
+++ b/tcg/mips/tcg-target.c.inc
@@ -2483,7 +2483,7 @@ static void tcg_target_qemu_prologue(TCGContext *s)
      * Return path for goto_ptr. Set return value to 0, a-la exit_tb,
      * and fall through to the rest of the epilogue.
      */
-    s->code_gen_epilogue = s->code_ptr;
+    tcg_code_gen_epilogue = s->code_ptr;
     tcg_out_mov(s, TCG_TYPE_REG, TCG_REG_V0, TCG_REG_ZERO);
 
     /* TB epilogue */
diff --git a/tcg/ppc/tcg-target.c.inc b/tcg/ppc/tcg-target.c.inc
index a848e98383..be116c6164 100644
--- a/tcg/ppc/tcg-target.c.inc
+++ b/tcg/ppc/tcg-target.c.inc
@@ -2341,7 +2341,7 @@ static void tcg_target_qemu_prologue(TCGContext *s)
     tcg_out32(s, BCCTR | BO_ALWAYS);
 
     /* Epilogue */
-    s->code_gen_epilogue = tb_ret_addr = s->code_ptr;
+    tcg_code_gen_epilogue = tb_ret_addr = s->code_ptr;
 
     tcg_out_ld(s, TCG_TYPE_PTR, TCG_REG_R0, TCG_REG_R1, FRAME_SIZE+LR_OFFSET);
     for (i = 0; i < ARRAY_SIZE(tcg_target_callee_save_regs); ++i) {
diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
index d536f3ccc1..ab08af7457 100644
--- a/tcg/riscv/tcg-target.c.inc
+++ b/tcg/riscv/tcg-target.c.inc
@@ -1288,7 +1288,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_exit_tb:
         /* Reuse the zeroing that exists for goto_ptr.  */
         if (a0 == 0) {
-            tcg_out_call_int(s, s->code_gen_epilogue, true);
+            tcg_out_call_int(s, tcg_code_gen_epilogue, true);
         } else {
             tcg_out_movi(s, TCG_TYPE_PTR, TCG_REG_A0, a0);
             tcg_out_call_int(s, tb_ret_addr, true);
@@ -1822,7 +1822,7 @@ static void tcg_target_qemu_prologue(TCGContext *s)
     tcg_out_opc_imm(s, OPC_JALR, TCG_REG_ZERO, tcg_target_call_iarg_regs[1], 0);
 
     /* Return path for goto_ptr. Set return value to 0 */
-    s->code_gen_epilogue = s->code_ptr;
+    tcg_code_gen_epilogue = s->code_ptr;
     tcg_out_mov(s, TCG_TYPE_REG, TCG_REG_A0, TCG_REG_ZERO);
 
     /* TB epilogue */
diff --git a/tcg/s390/tcg-target.c.inc b/tcg/s390/tcg-target.c.inc
index c5e096449b..ac99ccea73 100644
--- a/tcg/s390/tcg-target.c.inc
+++ b/tcg/s390/tcg-target.c.inc
@@ -1756,7 +1756,7 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
         /* Reuse the zeroing that exists for goto_ptr.  */
         a0 = args[0];
         if (a0 == 0) {
-            tgen_gotoi(s, S390_CC_ALWAYS, s->code_gen_epilogue);
+            tgen_gotoi(s, S390_CC_ALWAYS, tcg_code_gen_epilogue);
         } else {
             tcg_out_movi(s, TCG_TYPE_PTR, TCG_REG_R2, a0);
             tgen_gotoi(s, S390_CC_ALWAYS, tb_ret_addr);
@@ -2561,7 +2561,7 @@ static void tcg_target_qemu_prologue(TCGContext *s)
      * Return path for goto_ptr. Set return value to 0, a-la exit_tb,
      * and fall through to the rest of the epilogue.
      */
-    s->code_gen_epilogue = s->code_ptr;
+    tcg_code_gen_epilogue = s->code_ptr;
     tcg_out_movi(s, TCG_TYPE_PTR, TCG_REG_R2, 0);
 
     /* TB epilogue */
diff --git a/tcg/sparc/tcg-target.c.inc b/tcg/sparc/tcg-target.c.inc
index 6e2d755f6a..5b3bc91b05 100644
--- a/tcg/sparc/tcg-target.c.inc
+++ b/tcg/sparc/tcg-target.c.inc
@@ -1038,7 +1038,7 @@ static void tcg_target_qemu_prologue(TCGContext *s)
     tcg_out_nop(s);
 
     /* Epilogue for goto_ptr.  */
-    s->code_gen_epilogue = s->code_ptr;
+    tcg_code_gen_epilogue = s->code_ptr;
     tcg_out_arithi(s, TCG_REG_G0, TCG_REG_I7, 8, RETURN);
     /* delay slot */
     tcg_out_movi_imm13(s, TCG_REG_O0, 0);
-- 
2.25.1


