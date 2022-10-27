Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96EEF60F51E
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 12:29:36 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oo06L-00077B-Q2; Thu, 27 Oct 2022 06:27:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oo05m-0002er-Em
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 06:26:30 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oo05h-0008CM-7b
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 06:26:29 -0400
Received: by mail-pf1-x432.google.com with SMTP id m6so1087657pfb.0
 for <qemu-devel@nongnu.org>; Thu, 27 Oct 2022 03:26:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=z7O5nwx9MVdfPPYUrmEF8gDfSezfAGMOxc7S8gIU05o=;
 b=fGb/Rrn7pA7d2uyKABJEFd6UE7jFKC/A5P0JRLexerg0AXXvJ64LEw4u9HalR+mJVI
 6yD77H9JCMalE1iHC1gkBlGc/VEPAPQm73r/9K9hdhzMC63SYB+OIU2Xr4fqklQIPdGt
 JjEIZkNEsSQSX4J7O/XYGTCuhD5KQ6fhUqLbVeoEe5YMWqRXKDuEVwxJ8a41qUFnvf1C
 adQ4H9YpNVyxiqB6mY6D/zFGqWQBSRABk+PCrYuQeGHfE+wFkrtLRq8hGFJnaSfUAmZP
 HkDCFgsaraOI6cQdWzV4Z+CWJwlSJRe4pUm8rM63aEjPVcROnI3meLGlmw/Xzpz2/62a
 740g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=z7O5nwx9MVdfPPYUrmEF8gDfSezfAGMOxc7S8gIU05o=;
 b=qWZiBTfl1WDF8N3LyGZO2gjYYadgj+fYkVPgl+B+o1mBtiigjCPsgmJwKKy0qBhbed
 IywaeRyfk/QNJCd+gdGaXJhYCX1xrB5V5sJKp4kUMrmooTdbiblYLFY+kfMmqgG2ShO+
 Kn4DPkjVTR/EKhdSQcyh+uvfJkThChFdAlLIVHGFac6QU0s/pKp7MCzkg4znsxe5HQWU
 RP9/4i+LvuDZm53l2OHvz/Q876pGL7+LofrGteUxtweqYlj8ieCRZrxhaTLeMI53N/lt
 ltFd3q1Jpwwy11DYneipSKvDICZxzdac8p4KJfjtODdY8SBrVyhav8JG9DWreChpxYiP
 tPaw==
X-Gm-Message-State: ACrzQf0ANDBDTjkCxL403pYg4NVqIH4ac7M9lm5NR6WsFBGoO59+HthV
 YNbSoVZS8JduO0InCKNZf1Tkq96biQgW0M7P
X-Google-Smtp-Source: AMsMyM6+Da78yA5r6TYJHQB00wM0LMXt0PLZJVCA5RIdCqxZ0BTrUyTQCAidfhROVNisCuBRKKZqNg==
X-Received: by 2002:aa7:94b1:0:b0:56c:8da8:4e3 with SMTP id
 a17-20020aa794b1000000b0056c8da804e3mr3569942pfl.62.1666866382869; 
 Thu, 27 Oct 2022 03:26:22 -0700 (PDT)
Received: from localhost.localdomain ([2001:8003:501a:d301:3a91:9408:3918:55a])
 by smtp.gmail.com with ESMTPSA id
 x67-20020a623146000000b0056b932f3280sm884569pfx.103.2022.10.27.03.26.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Oct 2022 03:26:21 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com,
	eduardo@habkost.net
Subject: [PATCH] target/i386: Expand eflags updates inline
Date: Thu, 27 Oct 2022 21:26:15 +1100
Message-Id: <20221027102615.253354-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
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
index e19d5c1c64..dc1fa9f9ed 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -2745,6 +2745,26 @@ static void gen_reset_hflag(DisasContext *s, uint32_t mask)
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
@@ -2775,7 +2795,7 @@ do_gen_eob_worker(DisasContext *s, bool inhibit, bool recheck_tf, bool jr)
     }
 
     if (s->base.tb->flags & HF_RF_MASK) {
-        gen_helper_reset_rf(cpu_env);
+        gen_reset_eflags(s, RF_MASK);
     }
     if (recheck_tf) {
         gen_helper_rechecking_single_step(cpu_env);
@@ -5501,12 +5521,12 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
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
@@ -5788,7 +5808,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
                 || CPL(s) != 0) {
                 goto illegal_op;
             }
-            gen_helper_clac(cpu_env);
+            gen_reset_eflags(s, AC_MASK);
             s->base.is_jmp = DISAS_EOB_NEXT;
             break;
 
@@ -5797,7 +5817,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
                 || CPL(s) != 0) {
                 goto illegal_op;
             }
-            gen_helper_stac(cpu_env);
+            gen_set_eflags(s, AC_MASK);
             s->base.is_jmp = DISAS_EOB_NEXT;
             break;
 
-- 
2.34.1


