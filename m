Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EAB6612FE9
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 06:42:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opNXf-0001wz-Iq; Mon, 31 Oct 2022 01:40:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1opNXZ-0001ri-N0
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 01:40:54 -0400
Received: from mail-oi1-x22e.google.com ([2607:f8b0:4864:20::22e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1opNXY-00048a-0f
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 01:40:53 -0400
Received: by mail-oi1-x22e.google.com with SMTP id v81so3208415oie.5
 for <qemu-devel@nongnu.org>; Sun, 30 Oct 2022 22:40:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aw7jRTpy1iP2UJDNtDZiMejQvGcVoKkChHzFJ9QsKgc=;
 b=Un+AIRQPZN56Lav+uorxyAsutVxiJEdIXGcK+09Ren2aEYrLqyt23BK+5KxV5E7pLu
 E97QIM/l/2vI5k01FISxjjr2fm/EbRi8cEVYsg6u7DoiCN4kcnXuoNoyrNeK7LmY0bZa
 sC+c2M45a8JpOC7nrdQhfLATT+JdyEacVcYFDJrPvQ5skWZP5gtbVqT8b84WPj0Z4UIk
 2b+1nkIZO3S7VjOMUPza+KuA+2DU7hqSXyacBhCbaHK8CDb3J9YxCubWCSovBg+SSA+m
 BKB9Q5YDpD1sefVP5absnfdVpgaFsfno8Hiq1yM3qGFFbkzd9fK5Ql2GCmMzcj95llNQ
 C0jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aw7jRTpy1iP2UJDNtDZiMejQvGcVoKkChHzFJ9QsKgc=;
 b=M9kIRpDRm02chY+bzS5hxmbQYaBx7wgJ5afjfLjF8zmAKVCGGceFxZSOQQKjRDjxz7
 A7+o36tRFHrBfD/63cpLVf0kaDmFuWDOiUaBCSDK0rffizNXzVxAU4QDLShtM2env659
 rKE1rolNpRTSejrwHJOeOMq6OCf4ZCS749Z4NCOTz2Zu6sPsfHpnuCwrvgFjlIWQz5Sj
 JVi82qCWNkIWTH4pN+f6sBnAroyF9f/DzdERDV9M2eB+MibGckIFR107VOEH7nILqjt1
 apY39Xnds1KWTe1ihmq5Ud6AGEUQDRP0kzFLXINCr4XyDW9vKcdnPO9RRLYaolyf+UCv
 qNHg==
X-Gm-Message-State: ACrzQf0yvTh3Z9Mjw+z1PnrS+bYqINxHPFGtN/iT/FVvQb+9wHu8lD8k
 BHz0GxeQdG148CWKl4US0h9hG1Hom9qIIQ==
X-Google-Smtp-Source: AMsMyM4eG1Ra0CczidvMGuOyMGgccTl14UBwDd+CyS66g2zujwW9mhNT/xcQXNFCi0EDbF/HnG5DWw==
X-Received: by 2002:a05:6808:2082:b0:359:f4e9:8f13 with SMTP id
 s2-20020a056808208200b00359f4e98f13mr3746976oiw.170.1667194850888; 
 Sun, 30 Oct 2022 22:40:50 -0700 (PDT)
Received: from stoup.. ([172.58.176.235]) by smtp.gmail.com with ESMTPSA id
 u8-20020a9d4d88000000b006618586b850sm2473857otk.46.2022.10.30.22.40.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Oct 2022 22:40:50 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 11/11] target/i386: Expand eflags updates inline
Date: Mon, 31 Oct 2022 16:39:48 +1100
Message-Id: <20221031053948.3408-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221031053948.3408-1-richard.henderson@linaro.org>
References: <20221031053948.3408-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22e;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22e.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

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


