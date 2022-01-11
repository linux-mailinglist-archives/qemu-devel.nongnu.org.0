Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0B2C48B7C4
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 21:02:40 +0100 (CET)
Received: from localhost ([::1]:39180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7NLr-0006QG-1Q
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 15:02:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n7NCY-0007vx-8m
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 14:53:02 -0500
Received: from mout.kundenserver.de ([212.227.17.13]:56411)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n7NCW-0008Ge-9a
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 14:53:01 -0500
Received: from quad ([82.142.23.158]) by mrelayeu.kundenserver.de (mreue106
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MCs9W-1nG8ds1WRU-008qxZ; Tue, 11
 Jan 2022 20:52:56 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 17/30] target/mips: Extract trap code into env->error_code
Date: Tue, 11 Jan 2022 20:52:34 +0100
Message-Id: <20220111195247.1737641-18-laurent@vivier.eu>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220111195247.1737641-1-laurent@vivier.eu>
References: <20220111195247.1737641-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:QYcqv4F/TPusorgg7BEIt288HOODmoPU+0QzU0NLJk1d1POXmSt
 FVZ3zr1NHM/YY55Feqy0eWzdd5D9wucM8NC5c5zDUOe0XsYvPFpd0CXKzweMQ7novdLi3HF
 Q9YYOWJ4FTwqfTyAawTaKoESUI7zdR6moIvKhLsPz5JBfTB7XpMLwe5iBM41OEW/9XIrf/t
 YYZdtU8I/SMAdsnhL05Aw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:6TMvSs48rEk=:9GQFxFZ3e2hFR03KOfsSHV
 zh4PhmUjMZpSP+7oeqJBrXNXv/u/eIuSGTnORtzzGtxV/M4mq4g2Q6FTv0U5JHnl/+Rft3Sl6
 pXSmmjwOqxu0v/cKu6XrInX1BX7u0JW9cNucNqpJQABU7qMJZbo57RpAKPSss3eBQFp//VnKm
 3asF5Zbisjw2mxu1fJsiUECuNdwR1TORe0xKlxOw7KquCxeGyPyCZ1osPbbPwvJ3ljIH1cgwW
 7x79nmq8Ktp85+3RPuKBaASXnPsbNerLJG/vYYiQEEiAUpuWoQK4swsxEiPTeQvxZBGD1PoBm
 cmUaEGTU+NG2t1SSXw7FsuuRrrOGVYipL/2gQocAdFg8FOkJz0m1fRNqYq2EkRUGP2dt2iZrc
 i52i32wEsibI/MVRpHMLmopMgEfxYAB5mUxwfevEzWU2v3OodBd2sLiJ71x5X6uyWgsGnlqs2
 Xpe4RcYdqx6TVUe93fs8qOtBSDNfRuZ7QWzQn78FRhyc079RuLggNL8RLdDw53W/trvpXAK+4
 AtgMoGdxnHl1e1VIcMdl9wnHgU57t8PJypLTvDib69utuTNWfrBvgRwCepCpvA6mfgwreCI8P
 jpxDSTJEHe+U0Ei1jyqh3WNGnnjy96mthHpa0qdZWBVLTixheLPSJX2LqEB4kMaIX4Kxud4YG
 yeNAN3WGoqz8kMmny2JDYrXzSfnPWcgyicFqwy+oG2YQpzuuInTlwoFbI3txjMyu1OUg=
Received-SPF: none client-ip=212.227.17.13; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Simplify cpu_loop by doing all of the decode in translate.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220107213243.212806-18-richard.henderson@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/mips/cpu_loop.c                | 41 +----------------------
 target/mips/tcg/micromips_translate.c.inc |  4 +--
 target/mips/tcg/nanomips_translate.c.inc  |  4 +--
 target/mips/tcg/translate.c               | 24 ++++++++++---
 4 files changed, 25 insertions(+), 48 deletions(-)

diff --git a/linux-user/mips/cpu_loop.c b/linux-user/mips/cpu_loop.c
index 9a6ab2dd986a..9bb12a07ba08 100644
--- a/linux-user/mips/cpu_loop.c
+++ b/linux-user/mips/cpu_loop.c
@@ -197,51 +197,12 @@ done_syscall:
             do_tr_or_bp(env, code, false);
             break;
         case EXCP_TRAP:
-            {
-                abi_ulong trap_instr;
-                unsigned int code = 0;
-
-                /*
-                 * FIXME: It would be better to decode the trap number
-                 * during translate, and store it in error_code while
-                 * raising the exception.  We should not be re-reading
-                 * the opcode here.
-                 */
-
-                if (env->hflags & MIPS_HFLAG_M16) {
-                    /* microMIPS mode */
-                    abi_ulong instr[2];
-
-                    ret = get_user_u16(instr[0], env->active_tc.PC) ||
-                          get_user_u16(instr[1], env->active_tc.PC + 2);
-
-                    trap_instr = (instr[0] << 16) | instr[1];
-                } else {
-                    ret = get_user_u32(trap_instr, env->active_tc.PC);
-                }
-
-                if (ret != 0) {
-                    goto error;
-                }
-
-                /* The immediate versions don't provide a code.  */
-                if (!(trap_instr & 0xFC000000)) {
-                    if (env->hflags & MIPS_HFLAG_M16) {
-                        /* microMIPS mode */
-                        code = ((trap_instr >> 12) & ((1 << 4) - 1));
-                    } else {
-                        code = ((trap_instr >> 6) & ((1 << 10) - 1));
-                    }
-                }
-
-                do_tr_or_bp(env, code, true);
-            }
+            do_tr_or_bp(env, env->error_code, true);
             break;
         case EXCP_ATOMIC:
             cpu_exec_step_atomic(cs);
             break;
         default:
-error:
             EXCP_DUMP(env, "qemu: unhandled CPU exception 0x%x - aborting\n", trapnr);
             abort();
         }
diff --git a/target/mips/tcg/micromips_translate.c.inc b/target/mips/tcg/micromips_translate.c.inc
index 9013f8403739..fc6ede75b804 100644
--- a/target/mips/tcg/micromips_translate.c.inc
+++ b/target/mips/tcg/micromips_translate.c.inc
@@ -1047,7 +1047,7 @@ static void gen_pool32axf(CPUMIPSState *env, DisasContext *ctx, int rt, int rs)
     case TNE:
         mips32_op = OPC_TNE;
     do_trap:
-        gen_trap(ctx, mips32_op, rs, rt, -1);
+        gen_trap(ctx, mips32_op, rs, rt, -1, extract32(ctx->opcode, 12, 4));
         break;
 #ifndef CONFIG_USER_ONLY
     case MFC0:
@@ -2439,7 +2439,7 @@ static void decode_micromips32_opc(CPUMIPSState *env, DisasContext *ctx)
             check_insn_opc_removed(ctx, ISA_MIPS_R6);
             mips32_op = OPC_TEQI;
         do_trapi:
-            gen_trap(ctx, mips32_op, rs, -1, imm);
+            gen_trap(ctx, mips32_op, rs, -1, imm, 0);
             break;
 
         case BNEZC:
diff --git a/target/mips/tcg/nanomips_translate.c.inc b/target/mips/tcg/nanomips_translate.c.inc
index 2c022a49f244..916cece4d27e 100644
--- a/target/mips/tcg/nanomips_translate.c.inc
+++ b/target/mips/tcg/nanomips_translate.c.inc
@@ -1268,11 +1268,11 @@ static void gen_pool32a0_nanomips_insn(CPUMIPSState *env, DisasContext *ctx)
         switch (extract32(ctx->opcode, 10, 1)) {
         case NM_TEQ:
             check_nms(ctx);
-            gen_trap(ctx, OPC_TEQ, rs, rt, -1);
+            gen_trap(ctx, OPC_TEQ, rs, rt, -1, rd);
             break;
         case NM_TNE:
             check_nms(ctx);
-            gen_trap(ctx, OPC_TNE, rs, rt, -1);
+            gen_trap(ctx, OPC_TNE, rs, rt, -1, rd);
             break;
         }
         break;
diff --git a/target/mips/tcg/translate.c b/target/mips/tcg/translate.c
index 7f0cc81a9056..b82a7ec6ad50 100644
--- a/target/mips/tcg/translate.c
+++ b/target/mips/tcg/translate.c
@@ -4733,7 +4733,7 @@ static void gen_loongson_lsdc2(DisasContext *ctx, int rt,
 
 /* Traps */
 static void gen_trap(DisasContext *ctx, uint32_t opc,
-                     int rs, int rt, int16_t imm)
+                     int rs, int rt, int16_t imm, int code)
 {
     int cond;
     TCGv t0 = tcg_temp_new();
@@ -4778,6 +4778,11 @@ static void gen_trap(DisasContext *ctx, uint32_t opc,
         case OPC_TGEU:  /* rs >= rs unsigned */
         case OPC_TGEIU: /* r0 >= 0  unsigned */
             /* Always trap */
+#ifdef CONFIG_USER_ONLY
+            /* Pass the break code along to cpu_loop. */
+            tcg_gen_st_i32(tcg_constant_i32(code), cpu_env,
+                           offsetof(CPUMIPSState, error_code));
+#endif
             generate_exception_end(ctx, EXCP_TRAP);
             break;
         case OPC_TLT:   /* rs < rs           */
@@ -4818,6 +4823,18 @@ static void gen_trap(DisasContext *ctx, uint32_t opc,
             tcg_gen_brcond_tl(TCG_COND_EQ, t0, t1, l1);
             break;
         }
+#ifdef CONFIG_USER_ONLY
+        /* Pass the break code along to cpu_loop. */
+        tcg_gen_st_i32(tcg_constant_i32(code), cpu_env,
+                       offsetof(CPUMIPSState, error_code));
+#endif
+        /* Like save_cpu_state, only don't update saved values. */
+        if (ctx->base.pc_next != ctx->saved_pc) {
+            gen_save_pc(ctx->base.pc_next);
+        }
+        if (ctx->hflags != ctx->saved_hflags) {
+            tcg_gen_movi_i32(hflags, ctx->hflags);
+        }
         generate_exception(ctx, EXCP_TRAP);
         gen_set_label(l1);
     }
@@ -14155,7 +14172,7 @@ static void decode_opc_special(CPUMIPSState *env, DisasContext *ctx)
     case OPC_TEQ:
     case OPC_TNE:
         check_insn(ctx, ISA_MIPS2);
-        gen_trap(ctx, op1, rs, rt, -1);
+        gen_trap(ctx, op1, rs, rt, -1, extract32(ctx->opcode, 6, 10));
         break;
     case OPC_PMON:
         /* Pmon entry point, also R4010 selsl */
@@ -15289,11 +15306,10 @@ static bool decode_opc_legacy(CPUMIPSState *env, DisasContext *ctx)
         case OPC_TLTI:
         case OPC_TLTIU:
         case OPC_TEQI:
-
         case OPC_TNEI:
             check_insn(ctx, ISA_MIPS2);
             check_insn_opc_removed(ctx, ISA_MIPS_R6);
-            gen_trap(ctx, op1, rs, -1, imm);
+            gen_trap(ctx, op1, rs, -1, imm, 0);
             break;
         case OPC_SIGRIE:
             check_insn(ctx, ISA_MIPS_R6);
-- 
2.33.1


