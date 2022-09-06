Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFF775AE5BE
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Sep 2022 12:47:40 +0200 (CEST)
Received: from localhost ([::1]:36130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVW7D-0008WJ-0I
	for lists+qemu-devel@lfdr.de; Tue, 06 Sep 2022 06:47:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVVWX-00008u-G7
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 06:09:42 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:42543)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVVWU-0003Yc-D9
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 06:09:41 -0400
Received: by mail-wr1-x433.google.com with SMTP id bp20so14178862wrb.9
 for <qemu-devel@nongnu.org>; Tue, 06 Sep 2022 03:09:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=RhzKSK5t9n+kSLhXSJS3gAkwrU8yfE69BjVDNOiZ1lI=;
 b=LMhHqvzfCgPx3ULqCjwCDd7iW0K3BHyQjTcj8CNi+wwwQSMScB3zeSGHeuxgLZoyzj
 xk1YHO/Sdj0uwYH8Hf7fI6RuNyyIpFwsGVVEcloGxDLVucGYDvInu3n/hBYLuvnNIIh4
 M9fj27ua1Zfbe58hSoiwA1yXTGgKZGD49ke+6NokLQ2CkHBOfPPxn40ZeBuVTFBU9uOi
 vqCIg6+oictIKVaPaPO1O0EsvV95E1jykvcTyp3U/mPLgzStyVPqirKcFkWpHtpOPQfl
 DujqIeOrIngw1JfvXCHIIPH7q5SXs3MgM4L0OMeTy7C1/zmLXSQMAUUEgzJZte+dXIuL
 kydQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=RhzKSK5t9n+kSLhXSJS3gAkwrU8yfE69BjVDNOiZ1lI=;
 b=48l53Gd6mzjt0zoCMV1b4BUD9GWK6bQTQFVFYsaknjAHamtyQezB4RHM5f/Dm8gcya
 64ODvq+jgc+9OICakb7zk/nYtA/sjcayFGBfLZ1Btw9ljp/KiV3L6D7OPGLHdczCiAxY
 csimjDkzTlIs0WUfGaQueCYjokRf2IHciKtLqKJW7WhFurIz8Sa4upyNTimYni+2Zv9z
 TAx3nuCHuByAstDUhAZhOo4z8rPi8HgdmxbldkmZ4maAHFFIkgwCPsESxcS+5Zo1VIYG
 zY4AQvW5FQYm95idcG17/xKCQDDvojty8W/tXJQFwdryxsuhhr5B0d6jisv1pP0TLiL0
 mAaQ==
X-Gm-Message-State: ACgBeo2swbBxF4RRnANxFItyqzTIFRMl1wUDTsXF5tITNUXbsrS4fOfe
 2FhlMB9507f+xTk1rxtjSKKm/UW1fNjxvhNm
X-Google-Smtp-Source: AA6agR5G1FFmYHrvM38XGX4aUoWGcaXh49HGfpzu2Tb5A6OoDabGqQ2eswgaYKd83yn1hf4GYPghpg==
X-Received: by 2002:adf:fb0e:0:b0:21a:34a2:5ca9 with SMTP id
 c14-20020adffb0e000000b0021a34a25ca9mr27446872wrr.472.1662458977099; 
 Tue, 06 Sep 2022 03:09:37 -0700 (PDT)
Received: from localhost.localdomain
 ([2a02:8084:a5c0:5a80:ba98:3a71:8524:e0b1])
 by smtp.gmail.com with ESMTPSA id
 f25-20020a1c6a19000000b003a840690609sm23125014wmc.36.2022.09.06.03.09.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Sep 2022 03:09:36 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com
Subject: [PATCH v2 03/23] target/i386: Remove cur_eip argument to gen_exception
Date: Tue,  6 Sep 2022 11:09:12 +0100
Message-Id: <20220906100932.343523-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220906100932.343523-1-richard.henderson@linaro.org>
References: <20220906100932.343523-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x433.google.com
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
index 46300ffd91..58e74c3162 100644
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
@@ -3240,7 +3240,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b)
     }
     /* simple MMX/SSE operation */
     if (s->flags & HF_TS_MASK) {
-        gen_exception(s, EXCP07_PREX, s->base.pc_next - s->cs_base);
+        gen_exception(s, EXCP07_PREX);
         return;
     }
     if (s->flags & HF_EM_MASK) {
@@ -6042,7 +6042,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
             if (s->flags & (HF_EM_MASK | HF_TS_MASK)) {
                 /* if CR0.EM or CR0.TS are set, generate an FPU exception */
                 /* XXX: what to do if illegal op ? */
-                gen_exception(s, EXCP07_PREX, s->base.pc_next - s->cs_base);
+                gen_exception(s, EXCP07_PREX);
                 break;
             }
             modrm = x86_ldub_code(env, s);
@@ -7267,7 +7267,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
             goto illegal_op;
         val = x86_ldub_code(env, s);
         if (val == 0) {
-            gen_exception(s, EXCP00_DIVZ, s->base.pc_next - s->cs_base);
+            gen_exception(s, EXCP00_DIVZ);
         } else {
             gen_helper_aam(cpu_env, tcg_const_i32(val));
             set_cc_op(s, CC_OP_LOGICB);
@@ -7301,7 +7301,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
     case 0x9b: /* fwait */
         if ((s->flags & (HF_MP_MASK | HF_TS_MASK)) ==
             (HF_MP_MASK | HF_TS_MASK)) {
-            gen_exception(s, EXCP07_PREX, s->base.pc_next - s->cs_base);
+            gen_exception(s, EXCP07_PREX);
         } else {
             gen_helper_fwait(cpu_env);
         }
@@ -8358,7 +8358,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
                 goto illegal_op;
             }
             if ((s->flags & HF_EM_MASK) || (s->flags & HF_TS_MASK)) {
-                gen_exception(s, EXCP07_PREX, s->base.pc_next - s->cs_base);
+                gen_exception(s, EXCP07_PREX);
                 break;
             }
             gen_lea_modrm(env, s, modrm);
@@ -8371,7 +8371,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
                 goto illegal_op;
             }
             if ((s->flags & HF_EM_MASK) || (s->flags & HF_TS_MASK)) {
-                gen_exception(s, EXCP07_PREX, s->base.pc_next - s->cs_base);
+                gen_exception(s, EXCP07_PREX);
                 break;
             }
             gen_lea_modrm(env, s, modrm);
@@ -8383,7 +8383,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
                 goto illegal_op;
             }
             if (s->flags & HF_TS_MASK) {
-                gen_exception(s, EXCP07_PREX, s->base.pc_next - s->cs_base);
+                gen_exception(s, EXCP07_PREX);
                 break;
             }
             gen_lea_modrm(env, s, modrm);
@@ -8396,7 +8396,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
                 goto illegal_op;
             }
             if (s->flags & HF_TS_MASK) {
-                gen_exception(s, EXCP07_PREX, s->base.pc_next - s->cs_base);
+                gen_exception(s, EXCP07_PREX);
                 break;
             }
             gen_helper_update_mxcsr(cpu_env);
@@ -8787,7 +8787,7 @@ static void i386_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
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


