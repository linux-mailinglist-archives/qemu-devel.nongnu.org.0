Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F26259CC72
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Aug 2022 01:47:49 +0200 (CEST)
Received: from localhost ([::1]:38512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQH92-0007P7-Fd
	for lists+qemu-devel@lfdr.de; Mon, 22 Aug 2022 19:47:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQGv7-0005f3-Gj
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 19:33:26 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:36739)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQGv5-0007ET-Se
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 19:33:25 -0400
Received: by mail-pf1-x436.google.com with SMTP id w29so6277717pfj.3
 for <qemu-devel@nongnu.org>; Mon, 22 Aug 2022 16:33:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc;
 bh=hfnfb8LitWZ0KHDEFtzpnt/n/IbHJVoM5UOy23HOnjo=;
 b=ZSzZd+g+/qoTjARSW5rpLfrzD6cFVORwczyvSTvuLNqkdHZxOjq1HEV36cT9H1aT9e
 WeT+61+SEIAq6TqX/2Vear7Ln78kmkQR9vuv5ddUBGM0uJpsSj9b1HD5QckdROTq7OF9
 McPkKqkX9OYioIkvDMfNWkNNoLxzhoa40RyHZLqN3d1IySdRINPPz4O6OW9zLuzHXbWr
 5ufRyimVaszKTFRJoH9Qv5wRXGvr17yhuhy/PptWgKlavp5UqdmMI2sjzQfdsUJgJaSV
 TGQPaLH5K+UlqGoW0Sf/+I4Aro1uC9DxMMCBayX1bCIH+YUH/Z/teBU8YuJwW9FKhmY0
 DckQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
 bh=hfnfb8LitWZ0KHDEFtzpnt/n/IbHJVoM5UOy23HOnjo=;
 b=UBuY05aQEMb6yO3Jn5dr/v58lYygrvQVAfyHjLwQlIliIKpcjGFIrZh8aln3JOIAiV
 WB2PsnIdC51eu25sNqptWLWGt3iuIyg+/sfLyE8j52lUFTizfqDlcxnGhMFIJbiWS9xY
 R5GSIV9rzTnlR5mV4hzISiPMZTgM49ar7hTA/fRBuvtPzzXfgNaUI/yajnZbOB0LvQ5N
 NyKKk9OftU1ZIQP8zmgqh1laQlmh2z8BXAn+PsBhREBN/g9wAPF8ZCSJLnFdugFxHz26
 IUfo8cLiaw7A5OYrR0WZ3+q2dQ3M1gQ+XjGqmQI5U4W+Ji0PpENPH0e7f+DvGKL8lzSV
 0v2Q==
X-Gm-Message-State: ACgBeo1M6s7g7bZa+SbpDQEyGxf4RmK94qGr31QwkxZUaowZNt3JlJzO
 Ry2dWuEdn3SZwJhW8WDXQ47XYh9cge85yw==
X-Google-Smtp-Source: AA6agR4LcSLcV50Vg/F61lr/tboGJGCLTx657wPMpke9a28ElvKAXEur8ZD+tj65Rm9gZUaKkMvXxQ==
X-Received: by 2002:a63:eb49:0:b0:421:8c9b:4ab1 with SMTP id
 b9-20020a63eb49000000b004218c9b4ab1mr18770608pgk.339.1661211202614; 
 Mon, 22 Aug 2022 16:33:22 -0700 (PDT)
Received: from stoup.. ([2602:47:d49d:ec01:c3f1:b74f:5edd:63af])
 by smtp.gmail.com with ESMTPSA id
 82-20020a621555000000b0053655af14easm5133124pfv.45.2022.08.22.16.33.21
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 16:33:22 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 02/22] target/i386: Remove cur_eip argument to gen_exception
Date: Mon, 22 Aug 2022 16:32:58 -0700
Message-Id: <20220822233318.1728621-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220822233318.1728621-1-richard.henderson@linaro.org>
References: <20220822233318.1728621-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
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

All callers pass s->base.pc_next - s->cs_base, which we can just
as well compute within the function.  Note the special case of
EXCP_VSYSCALL in which s->cs_base didn't have the subtraction,
but cs_base is always zero in 64-bit mode, when vsyscall is used.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/tcg/translate.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 2bdbfc6ddf..f6a861e10c 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -1332,10 +1332,10 @@ static void gen_helper_fp_arith_STN_ST0(int op, int opreg)
     }
 }
 
-static void gen_exception(DisasContext *s, int trapno, target_ulong cur_eip)
+static void gen_exception(DisasContext *s, int trapno)
 {
     gen_update_cc_op(s);
-    gen_jmp_im(s, cur_eip);
+    gen_jmp_im(s, s->base.pc_next - s->cs_base);
     gen_helper_raise_exception(cpu_env, tcg_const_i32(trapno));
     s->base.is_jmp = DISAS_NORETURN;
 }
@@ -1344,13 +1344,13 @@ static void gen_exception(DisasContext *s, int trapno, target_ulong cur_eip)
    the instruction is known, but it isn't allowed in the current cpu mode.  */
 static void gen_illegal_opcode(DisasContext *s)
 {
-    gen_exception(s, EXCP06_ILLOP, s->base.pc_next - s->cs_base);
+    gen_exception(s, EXCP06_ILLOP);
 }
 
 /* Generate #GP for the current instruction. */
 static void gen_exception_gpf(DisasContext *s)
 {
-    gen_exception(s, EXCP0D_GPF, s->base.pc_next - s->cs_base);
+    gen_exception(s, EXCP0D_GPF);
 }
 
 /* Check for cpl == 0; if not, raise #GP and return false. */
@@ -3148,7 +3148,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b)
     }
     /* simple MMX/SSE operation */
     if (s->flags & HF_TS_MASK) {
-        gen_exception(s, EXCP07_PREX, s->base.pc_next - s->cs_base);
+        gen_exception(s, EXCP07_PREX);
         return;
     }
     if (s->flags & HF_EM_MASK) {
@@ -5929,7 +5929,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
             if (s->flags & (HF_EM_MASK | HF_TS_MASK)) {
                 /* if CR0.EM or CR0.TS are set, generate an FPU exception */
                 /* XXX: what to do if illegal op ? */
-                gen_exception(s, EXCP07_PREX, s->base.pc_next - s->cs_base);
+                gen_exception(s, EXCP07_PREX);
                 break;
             }
             modrm = x86_ldub_code(env, s);
@@ -7154,7 +7154,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
             goto illegal_op;
         val = x86_ldub_code(env, s);
         if (val == 0) {
-            gen_exception(s, EXCP00_DIVZ, s->base.pc_next - s->cs_base);
+            gen_exception(s, EXCP00_DIVZ);
         } else {
             gen_helper_aam(cpu_env, tcg_const_i32(val));
             set_cc_op(s, CC_OP_LOGICB);
@@ -7188,7 +7188,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
     case 0x9b: /* fwait */
         if ((s->flags & (HF_MP_MASK | HF_TS_MASK)) ==
             (HF_MP_MASK | HF_TS_MASK)) {
-            gen_exception(s, EXCP07_PREX, s->base.pc_next - s->cs_base);
+            gen_exception(s, EXCP07_PREX);
         } else {
             gen_helper_fwait(cpu_env);
         }
@@ -8245,7 +8245,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
                 goto illegal_op;
             }
             if ((s->flags & HF_EM_MASK) || (s->flags & HF_TS_MASK)) {
-                gen_exception(s, EXCP07_PREX, s->base.pc_next - s->cs_base);
+                gen_exception(s, EXCP07_PREX);
                 break;
             }
             gen_lea_modrm(env, s, modrm);
@@ -8258,7 +8258,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
                 goto illegal_op;
             }
             if ((s->flags & HF_EM_MASK) || (s->flags & HF_TS_MASK)) {
-                gen_exception(s, EXCP07_PREX, s->base.pc_next - s->cs_base);
+                gen_exception(s, EXCP07_PREX);
                 break;
             }
             gen_lea_modrm(env, s, modrm);
@@ -8270,7 +8270,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
                 goto illegal_op;
             }
             if (s->flags & HF_TS_MASK) {
-                gen_exception(s, EXCP07_PREX, s->base.pc_next - s->cs_base);
+                gen_exception(s, EXCP07_PREX);
                 break;
             }
             gen_lea_modrm(env, s, modrm);
@@ -8283,7 +8283,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
                 goto illegal_op;
             }
             if (s->flags & HF_TS_MASK) {
-                gen_exception(s, EXCP07_PREX, s->base.pc_next - s->cs_base);
+                gen_exception(s, EXCP07_PREX);
                 break;
             }
             gen_helper_update_mxcsr(cpu_env);
@@ -8674,7 +8674,7 @@ static void i386_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
      * Detect entry into the vsyscall page and invoke the syscall.
      */
     if ((dc->base.pc_next & TARGET_PAGE_MASK) == TARGET_VSYSCALL_PAGE) {
-        gen_exception(dc, EXCP_VSYSCALL, dc->base.pc_next);
+        gen_exception(dc, EXCP_VSYSCALL);
         dc->base.pc_next = dc->pc + 1;
         return;
     }
-- 
2.34.1


