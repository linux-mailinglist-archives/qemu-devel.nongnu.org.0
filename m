Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9193444355
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 15:21:24 +0100 (CET)
Received: from localhost ([::1]:35530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miH8l-0005OI-Sw
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 10:21:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1miGwp-0002XG-Bg
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 10:09:03 -0400
Received: from mail-qv1-xf36.google.com ([2607:f8b0:4864:20::f36]:36369)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1miGwm-00055w-Kv
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 10:09:03 -0400
Received: by mail-qv1-xf36.google.com with SMTP id d6so3056272qvb.3
 for <qemu-devel@nongnu.org>; Wed, 03 Nov 2021 07:09:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QZLeLhINJ1okRa8nBmn25FRlqUkKrhOM2xV7yiUsz0k=;
 b=wA+tJ4vvv1zwnZPhT06UoVEJDA3sPeEogV3q+bxr4iySR18D6t87tK9pUI22oIV5l5
 mPnNzTE01fW6qCBDfCl4EDhCt0ZYEkMKTm2+dMHguI5DmxRt+FL9myhDYr0Pl2EL7Sgv
 yc0kKf8mUfB1CXoHCwd+FUASB0f3QHriZdZGd3OBtsTsH/FJz7PoiI5yWX9hrJoKjboA
 /1zfw+eJcDP5++pKaGIxT7PIrivDoNsGS8radeYJ5M7I95nbHpG+svY5py/ZUhP26geS
 Omcwx3XNG/XSH22ee5oH1CsS2M5qXHPCm/J7Z9QoLlwQLFuDNKEd2vQle1YApHNb4GRG
 Y3fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QZLeLhINJ1okRa8nBmn25FRlqUkKrhOM2xV7yiUsz0k=;
 b=v/DU6aoXtyPxQboJdLMY8Uhz4l7aDJMIiRVRjN+YLqLxOIzUDdOSRoLJvTLZ7JxYJN
 xw1MIlW9EUOlCJAZQhaiL4lGEAvHduLxFeB8xHArKx1CW2KUwjy8CMqymtANngbXbIID
 21SQUNGlCZ85drQvvyfxxVL2rhVYKaBHCUFKXJyhxKAg97VtEjtwMnuK8YvS+5F+aOjE
 eIvsFvY1t7qW6MPvqfUZXXpjMF7HQfYhgy59aRTrHTmllYa0DzwBpBNNfFT2vssLtxVI
 gvwiyJ81eCZhucp8feT0WJw6+/m4VfsL/ETpBrQIetj9NrP81r3IDtXEO9u4p/fBx/P9
 Ka+A==
X-Gm-Message-State: AOAM531shSJxBDjxQXBQcn9EF4Fhhc2EZFhsqWN5nBBqizHRaJZhmYEo
 921gBevcGzWL1laBFKtGyK4KZKpclwFSSA==
X-Google-Smtp-Source: ABdhPJwD7jiYu1y1fkB3SWesNR0CeEeje4SSgWIoXcUrZ7fePMfEv6085PBg1NfqPO7RLXeaaF0CmQ==
X-Received: by 2002:a05:6214:1c41:: with SMTP id
 if1mr6927502qvb.0.1635948539737; 
 Wed, 03 Nov 2021 07:08:59 -0700 (PDT)
Received: from localhost.localdomain (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id z5sm1669377qtw.71.2021.11.03.07.08.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Nov 2021 07:08:59 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 16/23] target/mips: Extract trap code into env->error_code
Date: Wed,  3 Nov 2021 10:08:40 -0400
Message-Id: <20211103140847.454070-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211103140847.454070-1-richard.henderson@linaro.org>
References: <20211103140847.454070-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f36;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf36.google.com
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
Cc: peter.maydell@linaro.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Simplify cpu_loop by doing all of the decode in translate.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/mips/cpu_loop.c                | 41 +----------------------
 target/mips/tcg/translate.c               | 24 ++++++++++---
 target/mips/tcg/micromips_translate.c.inc |  4 +--
 target/mips/tcg/nanomips_translate.c.inc  |  4 +--
 4 files changed, 25 insertions(+), 48 deletions(-)

diff --git a/linux-user/mips/cpu_loop.c b/linux-user/mips/cpu_loop.c
index 8efb6d2a24..6079c2d600 100644
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


