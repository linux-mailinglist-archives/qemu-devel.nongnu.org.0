Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8D1F5F1CC2
	for <lists+qemu-devel@lfdr.de>; Sat,  1 Oct 2022 16:28:49 +0200 (CEST)
Received: from localhost ([::1]:33950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oedU0-0000Dh-Ke
	for lists+qemu-devel@lfdr.de; Sat, 01 Oct 2022 10:28:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oedBv-0002fI-SR
 for qemu-devel@nongnu.org; Sat, 01 Oct 2022 10:10:07 -0400
Received: from mail-qt1-x836.google.com ([2607:f8b0:4864:20::836]:44642)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oedBr-0003zf-Ca
 for qemu-devel@nongnu.org; Sat, 01 Oct 2022 10:10:07 -0400
Received: by mail-qt1-x836.google.com with SMTP id f26so4211574qto.11
 for <qemu-devel@nongnu.org>; Sat, 01 Oct 2022 07:09:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=NrUKbcDhmBpMlwr+FVKuuBtVYvHM6w48zL/u4bFoObI=;
 b=SP6K3++VA0yrfLTaFUQUwwndCik9xpjecER/Xcvv+yEt3q009+eunODccUU+eVPW83
 FIsjNoxZKhOZBcZGVtz+4xXp6xVIp+CVLe7ygyhqEqigkhNQ3lZEOxHqDWJT8BgiYTXj
 /qO67GdvQ/DyKgzG7/H7F7x85gna/8XbOfPObJDZrHjWiikBaDIRwjvfcSkggA8wxJR2
 ZHADKCTGRybaTXpPh2l4yawlWSRPrfRYG8PfOLXOQrBFl6T2mwuLuZS6x3YMoHcJ4HXf
 CiCLf8HFeHkgNIS7Tr14CxrO84bHzXwc0v5TjFrJgvm9vgPWkdcIbtLCZdglszr3Ax7x
 2mzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=NrUKbcDhmBpMlwr+FVKuuBtVYvHM6w48zL/u4bFoObI=;
 b=ST5zKTTgr7+Axhm7HhcBae3FXOPhDEBTW1F3pv9YG8FIsgbZm4k7hCNmNjAyFMfpQp
 7YORp8ffRPzHEnCGbpSV4jhrkd6Fko/hsgdUKeQKMhFtXrTh2gpsZZj7zpv6O6H3tcBd
 zJL9KI5nYLE40jRul7xV5pUl8YuqaSDz2bQhRAv+trMJK9C/OuaqeFPfm6m9yLCLCe2+
 /GSV0O7T73xaseg8tPemTleTIoBtT1XiduOXWxuzzdbzRefdYrtPQ3x/Wji1jcyKZF8S
 /AWmdOojDm7tZaOmFlyNnMld9/A5A8h2tRl89dGOId3worYNFLuVE9vpiKqKhxq1yT3F
 dhtw==
X-Gm-Message-State: ACrzQf3S4Dfoql3ordsEIHl3dIIuTql2ixOTKuytqX+zWuIwIzx8cg+s
 f71YigAtWjb0EZnns063BqXKtiiJ5PtX1da1
X-Google-Smtp-Source: AMsMyM6/g0c2P15rJ03FBjgGEK0GGdwXMB5GUpbkK4qd6bI0vLIw4B6WkYA4lZ/RP7d/gjnLFimCmw==
X-Received: by 2002:a05:622a:20a:b0:35c:f6db:722f with SMTP id
 b10-20020a05622a020a00b0035cf6db722fmr10911848qtx.389.1664633387261; 
 Sat, 01 Oct 2022 07:09:47 -0700 (PDT)
Received: from stoup.. ([2605:ef80:8080:8162:afc7:8362:2616:ac15])
 by smtp.gmail.com with ESMTPSA id
 j16-20020a05620a289000b006b615cd8c13sm6075914qkp.106.2022.10.01.07.09.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Oct 2022 07:09:46 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v3 03/26] target/i386: Remove cur_eip argument to gen_exception
Date: Sat,  1 Oct 2022 07:09:12 -0700
Message-Id: <20221001140935.465607-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221001140935.465607-1-richard.henderson@linaro.org>
References: <20221001140935.465607-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::836;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x836.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
EXCP_VSYSCALL in which s->cs_base wasn't subtracted, but cs_base
is always zero in 64-bit mode, when vsyscall is used.

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/tcg/translate.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 3f3e79c096..617832fcb0 100644
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
@@ -3267,7 +3267,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b)
     }
     /* simple MMX/SSE operation */
     if (s->flags & HF_TS_MASK) {
-        gen_exception(s, EXCP07_PREX, s->base.pc_next - s->cs_base);
+        gen_exception(s, EXCP07_PREX);
         return;
     }
     if (s->flags & HF_EM_MASK) {
@@ -6077,7 +6077,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
             if (s->flags & (HF_EM_MASK | HF_TS_MASK)) {
                 /* if CR0.EM or CR0.TS are set, generate an FPU exception */
                 /* XXX: what to do if illegal op ? */
-                gen_exception(s, EXCP07_PREX, s->base.pc_next - s->cs_base);
+                gen_exception(s, EXCP07_PREX);
                 break;
             }
             modrm = x86_ldub_code(env, s);
@@ -7302,7 +7302,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
             goto illegal_op;
         val = x86_ldub_code(env, s);
         if (val == 0) {
-            gen_exception(s, EXCP00_DIVZ, s->base.pc_next - s->cs_base);
+            gen_exception(s, EXCP00_DIVZ);
         } else {
             gen_helper_aam(cpu_env, tcg_const_i32(val));
             set_cc_op(s, CC_OP_LOGICB);
@@ -7336,7 +7336,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
     case 0x9b: /* fwait */
         if ((s->flags & (HF_MP_MASK | HF_TS_MASK)) ==
             (HF_MP_MASK | HF_TS_MASK)) {
-            gen_exception(s, EXCP07_PREX, s->base.pc_next - s->cs_base);
+            gen_exception(s, EXCP07_PREX);
         } else {
             gen_helper_fwait(cpu_env);
         }
@@ -8393,7 +8393,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
                 goto illegal_op;
             }
             if ((s->flags & HF_EM_MASK) || (s->flags & HF_TS_MASK)) {
-                gen_exception(s, EXCP07_PREX, s->base.pc_next - s->cs_base);
+                gen_exception(s, EXCP07_PREX);
                 break;
             }
             gen_lea_modrm(env, s, modrm);
@@ -8406,7 +8406,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
                 goto illegal_op;
             }
             if ((s->flags & HF_EM_MASK) || (s->flags & HF_TS_MASK)) {
-                gen_exception(s, EXCP07_PREX, s->base.pc_next - s->cs_base);
+                gen_exception(s, EXCP07_PREX);
                 break;
             }
             gen_lea_modrm(env, s, modrm);
@@ -8418,7 +8418,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
                 goto illegal_op;
             }
             if (s->flags & HF_TS_MASK) {
-                gen_exception(s, EXCP07_PREX, s->base.pc_next - s->cs_base);
+                gen_exception(s, EXCP07_PREX);
                 break;
             }
             gen_lea_modrm(env, s, modrm);
@@ -8431,7 +8431,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
                 goto illegal_op;
             }
             if (s->flags & HF_TS_MASK) {
-                gen_exception(s, EXCP07_PREX, s->base.pc_next - s->cs_base);
+                gen_exception(s, EXCP07_PREX);
                 break;
             }
             gen_helper_update_mxcsr(cpu_env);
@@ -8822,7 +8822,7 @@ static void i386_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
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


