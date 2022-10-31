Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F77E614053
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 23:03:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opcrE-0005jY-5x; Mon, 31 Oct 2022 18:02:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1opcqc-0005G1-9C
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 18:01:35 -0400
Received: from mail-io1-xd32.google.com ([2607:f8b0:4864:20::d32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1opcqa-00018G-In
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 18:01:34 -0400
Received: by mail-io1-xd32.google.com with SMTP id e189so134257iof.1
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 15:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aw7jRTpy1iP2UJDNtDZiMejQvGcVoKkChHzFJ9QsKgc=;
 b=XjUWdCE1eiVAI3LJlCL0QOnbyXA/Vh4c9nGU3yH/Z5LFyVnfTo7YoOBVATSvMtYuLz
 FgX1TDpE1RQ3CLOAseauFeBM9d8NVOKbUQ/4YdqE9jmlRdPcSSQgbqKhJRDNveES228N
 OYR1/m0eGYGjQuCXs6T22SsXzO6nIXobbuCvZzmaBZOpCyDRAf8RuucoMkyWDk6Dw2JY
 +lCqKMDmkYR+iuYY2M9+iFjIa4qKLNcspbkynRXs8j+WQxpOsqWQqrnn3HaRuDYF2WJV
 nxd9JsmzCXTO3wkUENzYO+xeHPRZA6hjiwLxreP7BYaK2xbY15xQcg4Dj6wc8tq6qE77
 7Udw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aw7jRTpy1iP2UJDNtDZiMejQvGcVoKkChHzFJ9QsKgc=;
 b=FlzqPlHce2286kPeGXNVMIHk6aS54YwFZ1R0kf4DmXIgLEpWnBk6WJF2kRLJ9QPB/5
 Q/mV4uBOlgm/jjdv3vQ5YVzHGHemKwPe1XlEqwpUNrtMtKnqqg1jXn/GTcWTOKfLJ35I
 5CE13yR3TP7MMpjwYe84JWL0NSQIUdD4iGNIoEMaiRXV87cbycownR3QC/0NQmZi+S0I
 bWRbDnm6wDhtCo50a9AvTI1Gc8nwyV9ma0MZbWmqw/FmaGPZp9INdIizsIutin6oBZAD
 Fpr/PvcQk0t7qtuo3nuYBNUeum5aPcjDzE4u6ISll+qKLj+MxDU92wik5zwT03Pz9t8Y
 ZKOA==
X-Gm-Message-State: ACrzQf3QJP2ymxvF6J/Z0pMa4J3sxsMAu+2x62t4sAWv1ToLBe2P9INX
 hCzMjl+66zj8GwIvNmoY0I4k1/2G63TeTA==
X-Google-Smtp-Source: AMsMyM5TTx1T2NOOzBP0xw39LGJQkjpUYUPCeLogFCtYCcI6DiIrg0Mv7BI7t9+eXigDAAKJGHYycw==
X-Received: by 2002:a05:6638:140e:b0:375:17da:5c96 with SMTP id
 k14-20020a056638140e00b0037517da5c96mr9026801jad.178.1667253691370; 
 Mon, 31 Oct 2022 15:01:31 -0700 (PDT)
Received: from stoup.. ([172.58.176.58]) by smtp.gmail.com with ESMTPSA id
 s7-20020a02c507000000b00363ec4dcaacsm3203039jam.22.2022.10.31.15.01.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Oct 2022 15:01:30 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@gmail.com, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL v2 11/13] target/i386: Expand eflags updates inline
Date: Tue,  1 Nov 2022 09:01:11 +1100
Message-Id: <20221031220113.414796-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221031220113.414796-1-richard.henderson@linaro.org>
References: <20221031215723.414467-1-richard.henderson@linaro.org>
 <20221031220113.414796-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::d32;
 envelope-from=richard.henderson@linaro.org; helo=mail-io1-xd32.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

The helpers for reset_rf, cli, sti, clac, stac are
completely trivial; implement them inline.

Drop some nearby #if 0 code.

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/helper.h        |  5 -----
 target/i386/tcg/cc_helper.c | 41 -------------------------------------
 target/i386/tcg/translate.c | 30 ++++++++++++++++++++++-----
 3 files changed, 25 insertions(+), 51 deletions(-)

diff --git a/target/i386/helper.h b/target/i386/helper.h
index 88143b2a24..b7de5429ef 100644
--- a/target/i386/helper.h
+++ b/target/i386/helper.h
@@ -56,13 +56,8 @@ DEF_HELPER_2(syscall, void, env, int)
 DEF_HELPER_2(sysret, void, env, int)
 #endif
 DEF_HELPER_FLAGS_2(pause, TCG_CALL_NO_WG, noreturn, env, int)
-DEF_HELPER_1(reset_rf, void, env)
 DEF_HELPER_FLAGS_3(raise_interrupt, TCG_CALL_NO_WG, noreturn, env, int, int)
 DEF_HELPER_FLAGS_2(raise_exception, TCG_CALL_NO_WG, noreturn, env, int)
-DEF_HELPER_1(cli, void, env)
-DEF_HELPER_1(sti, void, env)
-DEF_HELPER_1(clac, void, env)
-DEF_HELPER_1(stac, void, env)
 DEF_HELPER_3(boundw, void, env, tl, int)
 DEF_HELPER_3(boundl, void, env, tl, int)
 
diff --git a/target/i386/tcg/cc_helper.c b/target/i386/tcg/cc_helper.c
index cc7ea9e8b9..6227dbb30b 100644
--- a/target/i386/tcg/cc_helper.c
+++ b/target/i386/tcg/cc_helper.c
@@ -346,44 +346,3 @@ void helper_clts(CPUX86State *env)
     env->cr[0] &= ~CR0_TS_MASK;
     env->hflags &= ~HF_TS_MASK;
 }
-
-void helper_reset_rf(CPUX86State *env)
-{
-    env->eflags &= ~RF_MASK;
-}
-
-void helper_cli(CPUX86State *env)
-{
-    env->eflags &= ~IF_MASK;
-}
-
-void helper_sti(CPUX86State *env)
-{
-    env->eflags |= IF_MASK;
-}
-
-void helper_clac(CPUX86State *env)
-{
-    env->eflags &= ~AC_MASK;
-}
-
-void helper_stac(CPUX86State *env)
-{
-    env->eflags |= AC_MASK;
-}
-
-#if 0
-/* vm86plus instructions */
-void helper_cli_vm(CPUX86State *env)
-{
-    env->eflags &= ~VIF_MASK;
-}
-
-void helper_sti_vm(CPUX86State *env)
-{
-    env->eflags |= VIF_MASK;
-    if (env->eflags & VIP_MASK) {
-        raise_exception_ra(env, EXCP0D_GPF, GETPC());
-    }
-}
-#endif
diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 546c427c23..0ee548ce56 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -2746,6 +2746,26 @@ static void gen_reset_hflag(DisasContext *s, uint32_t mask)
     }
 }
 
+static void gen_set_eflags(DisasContext *s, target_ulong mask)
+{
+    TCGv t = tcg_temp_new();
+
+    tcg_gen_ld_tl(t, cpu_env, offsetof(CPUX86State, eflags));
+    tcg_gen_ori_tl(t, t, mask);
+    tcg_gen_st_tl(t, cpu_env, offsetof(CPUX86State, eflags));
+    tcg_temp_free(t);
+}
+
+static void gen_reset_eflags(DisasContext *s, target_ulong mask)
+{
+    TCGv t = tcg_temp_new();
+
+    tcg_gen_ld_tl(t, cpu_env, offsetof(CPUX86State, eflags));
+    tcg_gen_andi_tl(t, t, ~mask);
+    tcg_gen_st_tl(t, cpu_env, offsetof(CPUX86State, eflags));
+    tcg_temp_free(t);
+}
+
 /* Clear BND registers during legacy branches.  */
 static void gen_bnd_jmp(DisasContext *s)
 {
@@ -2776,7 +2796,7 @@ do_gen_eob_worker(DisasContext *s, bool inhibit, bool recheck_tf, bool jr)
     }
 
     if (s->base.tb->flags & HF_RF_MASK) {
-        gen_helper_reset_rf(cpu_env);
+        gen_reset_eflags(s, RF_MASK);
     }
     if (recheck_tf) {
         gen_helper_rechecking_single_step(cpu_env);
@@ -5502,12 +5522,12 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
 #endif
     case 0xfa: /* cli */
         if (check_iopl(s)) {
-            gen_helper_cli(cpu_env);
+            gen_reset_eflags(s, IF_MASK);
         }
         break;
     case 0xfb: /* sti */
         if (check_iopl(s)) {
-            gen_helper_sti(cpu_env);
+            gen_set_eflags(s, IF_MASK);
             /* interruptions are enabled only the first insn after sti */
             gen_update_eip_next(s);
             gen_eob_inhibit_irq(s, true);
@@ -5789,7 +5809,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
                 || CPL(s) != 0) {
                 goto illegal_op;
             }
-            gen_helper_clac(cpu_env);
+            gen_reset_eflags(s, AC_MASK);
             s->base.is_jmp = DISAS_EOB_NEXT;
             break;
 
@@ -5798,7 +5818,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
                 || CPL(s) != 0) {
                 goto illegal_op;
             }
-            gen_helper_stac(cpu_env);
+            gen_set_eflags(s, AC_MASK);
             s->base.is_jmp = DISAS_EOB_NEXT;
             break;
 
-- 
2.34.1


