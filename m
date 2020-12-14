Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ABEC2D997F
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 15:12:51 +0100 (CET)
Received: from localhost ([::1]:34616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kooao-00023k-Gc
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 09:12:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kooRr-0001c8-TU
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 09:03:38 -0500
Received: from mail-oi1-x230.google.com ([2607:f8b0:4864:20::230]:38454)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kooRm-0003v7-1c
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 09:03:33 -0500
Received: by mail-oi1-x230.google.com with SMTP id x13so10199887oic.5
 for <qemu-devel@nongnu.org>; Mon, 14 Dec 2020 06:03:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=Caod8Myfn6UMAwpFdXVp68OknFB2PbyNlugc5dGMlp0=;
 b=dFl8rFP7/E7tj3pcsbeco9RnoOO0l61lu+nqPf8zVmz8Ey8QjTMuJp+KpEDfUw6wRa
 JljfO1gvQTSGlLaLmvNqil1DJqAg86UtS2Me0AEdfGJwnL9LLe9j5drpFz2Z/xWsK9Tr
 F5i273ykombSV1kdQzTKq5QPacEUnhpuWQMAsi8tEr1eb/cOC1EumcHHpEyC1GrKLH5R
 RgoJtLlR3GAY0U4Wn05tpxFUaUzJ+EQzKUTjfyTkeFxjW0AUiMI2ssvp/7TZPdKOrXf0
 64w2U2UhSnLEoT7UkLrxjyTRLGoLPa1PhHQFhpmM2cKYV0uWpq+6jglWel8vKc0vvZ0D
 QHgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Caod8Myfn6UMAwpFdXVp68OknFB2PbyNlugc5dGMlp0=;
 b=PZEsPEmCzt6ROL3XFwpg5AW0m8ovLkeutodCiplWIaCqqUGPP7tvapkz9DeiryADiI
 KAveToN+WTlshS0pKzOXals7g5eqscGqxOftjw7dc2QeWVoElkx50br3uDQtGYyKCIIV
 NHzvKeYK9A2cRlMPdUX3lHD8lzUQ/C5D36ou09lWfQv3loSCGkFtOTubWGbC54xY/YsA
 JzeC+mEoYmiqBv48/qDGDwYhPguUxkTIx97JQp1Amg/WmOMefH7VXnuqgJv9j3UxVYy6
 2FFpQXHXkaE2BKbBUO9OuVLWigWigX5oftwjzoUEDz5nU9gqJfCaxjjPxfFDEN8u8EFf
 MbVA==
X-Gm-Message-State: AOAM533GWfVVp2RZSu5CyBDdUCz94RB4qrHw2fe/caFKCILQpSGkFffl
 zDqKhgOuT0rVFaJ0vnYw0LpMTtbNXcsNv78v
X-Google-Smtp-Source: ABdhPJzz+H6EuR5j/xjgsNYJ5cYAqcF/Qpas37fO9NTT77Ov6ndow7dCo4h+LVkxz46gkzFzE/di6w==
X-Received: by 2002:aca:504e:: with SMTP id e75mr18774915oib.170.1607954607056; 
 Mon, 14 Dec 2020 06:03:27 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id t24sm3940146oou.4.2020.12.14.06.03.25
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Dec 2020 06:03:26 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 06/43] tcg: Move tcg epilogue pointer out of TCGContext
Date: Mon, 14 Dec 2020 08:02:37 -0600
Message-Id: <20201214140314.18544-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201214140314.18544-1-richard.henderson@linaro.org>
References: <20201214140314.18544-1-richard.henderson@linaro.org>
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
index 67065c2ede..588686617d 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -161,6 +161,7 @@ static int tcg_out_ldst_finalize(TCGContext *s);
 static TCGContext **tcg_ctxs;
 static unsigned int n_tcg_ctxs;
 TCGv_env cpu_env = 0;
+void *tcg_code_gen_epilogue;
 
 #ifndef CONFIG_TCG_INTERPRETER
 tcg_prologue_fn *tcg_qemu_tb_exec;
@@ -1133,7 +1134,7 @@ void tcg_prologue_init(TCGContext *s)
 
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
index b756281042..15d5c78798 100644
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


