Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C188487E7B
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 22:49:57 +0100 (CET)
Received: from localhost ([::1]:39804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5x7U-0001a3-Aq
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 16:49:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n5wr5-0005DD-4N
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 16:32:59 -0500
Received: from [2607:f8b0:4864:20::635] (port=37863
 helo=mail-pl1-x635.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n5wr2-0007qa-Mi
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 16:32:58 -0500
Received: by mail-pl1-x635.google.com with SMTP id q14so5839687plx.4
 for <qemu-devel@nongnu.org>; Fri, 07 Jan 2022 13:32:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XqRFdx94jAEiNbtzy76sxqGXtQ4AZmWAEUgwWCxHmkk=;
 b=TIUvJg3m/i5ZkopRO2TgbmGl5HVdp+q06W41qi5PHchKtD7pOcgbgBj7+ec8ihb8kh
 azh/AzX9r8rfjLjyjgVo4CRG2TQogIxN4/zbJXwp8qdtfIFXa+9XdeLmvpZj+rhcsiOQ
 KEatziTfRi6z1FBbwWQg7/qjIG0045vkEyq91adYqOwYNjG9YJYTvPfM1D9reeaPkQ4J
 7oMvezkxGmHxqflJh90XR4zH5APcpCK6zkpc5t3yXXUwNd7Edr84HGYhodi3kg3KW4sy
 Lc/DBH20pkqjOHJHax3ZWKHEiRXamQki7bplYms0SwNjb66xNP0gL1wai90PdGkk/G/5
 ntTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XqRFdx94jAEiNbtzy76sxqGXtQ4AZmWAEUgwWCxHmkk=;
 b=oJ3O9CDjKO1UGEhtMn9wqzWwWKpZXKrY1J6WxinrVNpG0ISGeDeCwflBABnrAcCapr
 4MeYHDNjqF+kN4a5f2mBfm34dD7pYrWO5cUk6ZHzGScVgARprtA+D5qqpK8aWS5FzFND
 4mo3CqAX8QaoIvmHZqd16MoZDswn9q2lEMuIopaEvmxh0ZukZhhfNLPxmljGhlyb/R6c
 99vtekChr75n7+MVzFQHoh3fn+w2DnYjaXqP8ZPXERhHijgjHuMa8tLzBjJakWy0H+4K
 1d4wnO3IAvrqRhnwZAJ87CGnpyBnoZvyH+oT347pFAH2hyy7wb2us/j4dLvpAYfV/gHY
 ruBg==
X-Gm-Message-State: AOAM533CtepK5y9d3tvs7/18MQ14TBbmvKtuefXhxl/CzPM6RufQEnAa
 FfKZoRJ2fBccpUYibaMfUkZ74j4h7MoHTQ==
X-Google-Smtp-Source: ABdhPJy7WoKdmGUaABQcLeRzW26tuebCvkR/e0XKz92H4hcG1aP2I+Cn2GUyiY+jly8+2SepCf08Tw==
X-Received: by 2002:a17:90b:3652:: with SMTP id
 nh18mr15533453pjb.210.1641591174618; 
 Fri, 07 Jan 2022 13:32:54 -0800 (PST)
Received: from localhost.localdomain (174-21-75-75.tukw.qwest.net.
 [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id y11sm6633030pfi.80.2022.01.07.13.32.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 13:32:54 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 17/24] target/mips: Extract trap code into env->error_code
Date: Fri,  7 Jan 2022 13:32:36 -0800
Message-Id: <20220107213243.212806-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220107213243.212806-1-richard.henderson@linaro.org>
References: <20220107213243.212806-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::635
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: laurent@vivier.eu,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Simplify cpu_loop by doing all of the decode in translate.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/mips/cpu_loop.c                | 41 +----------------------
 target/mips/tcg/translate.c               | 24 ++++++++++---
 target/mips/tcg/micromips_translate.c.inc |  4 +--
 target/mips/tcg/nanomips_translate.c.inc  |  4 +--
 4 files changed, 25 insertions(+), 48 deletions(-)

diff --git a/linux-user/mips/cpu_loop.c b/linux-user/mips/cpu_loop.c
index 9a6ab2dd98..9bb12a07ba 100644
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
diff --git a/target/mips/tcg/translate.c b/target/mips/tcg/translate.c
index a42f507aed..98c0f1aab3 100644
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
diff --git a/target/mips/tcg/micromips_translate.c.inc b/target/mips/tcg/micromips_translate.c.inc
index f91f7a96cd..7e7d26a91b 100644
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
index 2c022a49f2..916cece4d2 100644
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
-- 
2.25.1


