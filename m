Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B647B53B901
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Jun 2022 14:33:11 +0200 (CEST)
Received: from localhost ([::1]:43192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwk0k-0005PU-Rf
	for lists+qemu-devel@lfdr.de; Thu, 02 Jun 2022 08:33:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nwjTV-0000dl-5o
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 07:58:49 -0400
Received: from mout.kundenserver.de ([217.72.192.74]:41035)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nwjTT-0001EP-4R
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 07:58:48 -0400
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue108
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1M4b5s-1nyNdK3TF8-001iEQ; Thu, 02
 Jun 2022 13:58:45 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 12/19] target/m68k: Implement TRAPcc
Date: Thu,  2 Jun 2022 13:58:30 +0200
Message-Id: <20220602115837.2013918-13-laurent@vivier.eu>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220602115837.2013918-1-laurent@vivier.eu>
References: <20220602115837.2013918-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:aM8JKn8e9Sb4Fg8HWR6thAno0SAYgKnGGVoT/kJddwsXSrQD0FO
 S5pWkU3e2I/cHVaMZa2TblJGVGxdEHc+DMHJlnVaVZ5ku+aZIc6KadOU/wqaL7+OiiIq5mC
 5LEqft6DHVDiUwdM9NrfUkJo5NRzXDqYmyT1EnIQ70kKSJevHdW++SpYfZfajq1TA7Vjf4l
 3dhtrW7X8Q6zpYmPCEESA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:wvsiIdWel9U=:aMrvljOazC5+tlcL1NHUvl
 wnzsr50VM8xhkuCWGbwPKb2AY5l4XV3LxNq1cHGFU23wbfcaQsHfyAZU20z9PwRC62eXqui+V
 bM2D6+0+jdDvEb9G1+mjg+uBSwZ4YjmeQnygm8opjNVWgYwiG9RMB0QJqc446IHz5VyqTqsCJ
 I2gToJLgv7mv7FjVoPkLQPca534FXwXqzvNISwEdV55579puDmvIFJ83x0sBDW+z8Gycm6nSt
 N5MGdd65iHdxnmNokkFsm0mIidO3vzNdL/bYy/T3VQ3cJjMmATXGWi2a4hJVmu87ktyd067Rd
 35rCzmioZaPqoTfmpbxVL0nJSDRSonHAZkkLW5u7N5vI67qZevrBZvnO1pSlmXB6KZ/OdVqcl
 l2ulbVDBdqFuHwQzZy3CuVOQZFTpqNFWZwQo/KkRsErhns9ULczxRI5AQof2N2Dki+qgOMm73
 ynI2cPhOJdmFNEPdMd5mEnGY8dHoSVPkmh3nFL3RX36wsQEWpCPKD9AEL1EnKQ6+0CDdhqssI
 3ScEKjia9sO94PzH7GVCSb8JLWdlYL8ET3hbtOFjZSvA3EfmnZsCUGaI0TeqPVPOYB1BhlgLf
 8odSb9hGAWk38w+s2CJDeTqoPJ1W21c+yAkfufRo9Iz3gPMBUbDcl6Y0bRCwsKRpg/qG+pDae
 KBx/PUum8mbRwL8nuqDpb2+xTTLIUDIwMFi64prF41caWfaZrn1URTD6uTzONj3tGaH5Znt8w
 tHlyh2K3/PMpf7gzS0NreEapuOCyfiqAp7739g==
Received-SPF: none client-ip=217.72.192.74; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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

From: Richard Henderson <richard.henderson@linaro.org>

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/754
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220602013401.303699-11-richard.henderson@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 target/m68k/cpu.h          |  2 ++
 linux-user/m68k/cpu_loop.c |  1 +
 target/m68k/cpu.c          |  1 +
 target/m68k/op_helper.c    |  6 +----
 target/m68k/translate.c    | 49 ++++++++++++++++++++++++++++++++++++++
 5 files changed, 54 insertions(+), 5 deletions(-)

diff --git a/target/m68k/cpu.h b/target/m68k/cpu.h
index 558c3c67d607..4d8f48e8c747 100644
--- a/target/m68k/cpu.h
+++ b/target/m68k/cpu.h
@@ -534,6 +534,8 @@ enum m68k_features {
     M68K_FEATURE_MOVEC,
     /* Unaligned data accesses (680[2346]0) */
     M68K_FEATURE_UNALIGNED_DATA,
+    /* TRAPcc insn. (680[2346]0, and CPU32) */
+    M68K_FEATURE_TRAPCC,
 };
 
 static inline int m68k_feature(CPUM68KState *env, int feature)
diff --git a/linux-user/m68k/cpu_loop.c b/linux-user/m68k/cpu_loop.c
index fcf92205529e..3d3033155f69 100644
--- a/linux-user/m68k/cpu_loop.c
+++ b/linux-user/m68k/cpu_loop.c
@@ -47,6 +47,7 @@ void cpu_loop(CPUM68KState *env)
             force_sig_fault(TARGET_SIGILL, TARGET_ILL_ILLOPN, env->pc);
             break;
         case EXCP_CHK:
+        case EXCP_TRAPCC:
             force_sig_fault(TARGET_SIGFPE, TARGET_FPE_INTOVF, env->mmu.ar);
             break;
         case EXCP_DIV0:
diff --git a/target/m68k/cpu.c b/target/m68k/cpu.c
index 567106792377..5bbefda5752d 100644
--- a/target/m68k/cpu.c
+++ b/target/m68k/cpu.c
@@ -158,6 +158,7 @@ static void m68020_cpu_initfn(Object *obj)
     m68k_set_feature(env, M68K_FEATURE_CHK2);
     m68k_set_feature(env, M68K_FEATURE_MSP);
     m68k_set_feature(env, M68K_FEATURE_UNALIGNED_DATA);
+    m68k_set_feature(env, M68K_FEATURE_TRAPCC);
 }
 
 /*
diff --git a/target/m68k/op_helper.c b/target/m68k/op_helper.c
index aa62158eb97b..61948d92bb25 100644
--- a/target/m68k/op_helper.c
+++ b/target/m68k/op_helper.c
@@ -399,14 +399,10 @@ static void m68k_interrupt_all(CPUM68KState *env, int is_hw)
         do_stack_frame(env, &sp, 2, oldsr, 0, env->pc);
         break;
 
-    case EXCP_TRAPCC:
-        /* FIXME: addr is not only env->pc */
-        do_stack_frame(env, &sp, 2, oldsr, env->pc, env->pc);
-        break;
-
     case EXCP_CHK:
     case EXCP_DIV0:
     case EXCP_TRACE:
+    case EXCP_TRAPCC:
         do_stack_frame(env, &sp, 2, oldsr, env->mmu.ar, env->pc);
         break;
 
diff --git a/target/m68k/translate.c b/target/m68k/translate.c
index 38b72d282aa6..e9aa96d7684b 100644
--- a/target/m68k/translate.c
+++ b/target/m68k/translate.c
@@ -4879,6 +4879,53 @@ DISAS_INSN(trap)
     gen_exception(s, s->pc, EXCP_TRAP0 + (insn & 0xf));
 }
 
+static void do_trapcc(DisasContext *s, DisasCompare *c)
+{
+    if (c->tcond != TCG_COND_NEVER) {
+        TCGLabel *over = NULL;
+
+        update_cc_op(s);
+
+        if (c->tcond != TCG_COND_ALWAYS) {
+            /* Jump over if !c. */
+            over = gen_new_label();
+            tcg_gen_brcond_i32(tcg_invert_cond(c->tcond), c->v1, c->v2, over);
+        }
+
+        tcg_gen_movi_i32(QREG_PC, s->pc);
+        gen_raise_exception_format2(s, EXCP_TRAPCC, s->base.pc_next);
+
+        if (over != NULL) {
+            gen_set_label(over);
+            s->base.is_jmp = DISAS_NEXT;
+        }
+    }
+    free_cond(c);
+}
+
+DISAS_INSN(trapcc)
+{
+    DisasCompare c;
+
+    /* Consume and discard the immediate operand. */
+    switch (extract32(insn, 0, 3)) {
+    case 2: /* trapcc.w */
+        (void)read_im16(env, s);
+        break;
+    case 3: /* trapcc.l */
+        (void)read_im32(env, s);
+        break;
+    case 4: /* trapcc (no operand) */
+        break;
+    default:
+        /* trapcc registered with only valid opmodes */
+        g_assert_not_reached();
+    }
+
+    gen_cc_cond(&c, s, extract32(insn, 8, 4));
+    do_trapcc(s, &c);
+}
+
 static void gen_load_fcr(DisasContext *s, TCGv res, int reg)
 {
     switch (reg) {
@@ -6051,6 +6098,8 @@ void register_m68k_insns (CPUM68KState *env)
     INSN(scc,       50c0, f0f8, CF_ISA_A); /* Scc.B Dx   */
     INSN(scc,       50c0, f0c0, M68000);   /* Scc.B <EA> */
     INSN(dbcc,      50c8, f0f8, M68000);
+    INSN(trapcc,    50fa, f0fe, TRAPCC);   /* opmode 010, 011 */
+    INSN(trapcc,    50fc, f0ff, TRAPCC);   /* opmode 100 */
     INSN(tpf,       51f8, fff8, CF_ISA_A);
 
     /* Branch instructions.  */
-- 
2.36.1


