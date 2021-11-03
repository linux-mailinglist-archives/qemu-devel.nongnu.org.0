Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 128CE44435C
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 15:23:17 +0100 (CET)
Received: from localhost ([::1]:41866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miHAa-0001SP-7H
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 10:23:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1miGwo-0002UA-D7
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 10:09:02 -0400
Received: from mail-qt1-x829.google.com ([2607:f8b0:4864:20::829]:39561)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1miGwl-00055k-Pz
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 10:09:02 -0400
Received: by mail-qt1-x829.google.com with SMTP id x10so487037qta.6
 for <qemu-devel@nongnu.org>; Wed, 03 Nov 2021 07:08:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZFpeoDrdt+3ART61xwj3YrRUH5IdU+zLoLX56R9IMco=;
 b=usih3XKJ52KaA+UiJKhSLrUcjLU0fpjF8zUif88z0LGBniOcCa+Ua1ZC7hJsvDlyGY
 Udwf88vFxaUeHJbGEWsX0u0phavUmZO6kEb04sla+vl8DVtOJFPKq94yE9GiXo/vvPSK
 5+ycBa1qbKEEE4Tju0mJdxXFHgx2qf3SAwMzeVzPkASGQD8T2HQ7zoCzr/3vqyhNrwP2
 D+axS12rvFXSl3Q65eChATtA1jmk9xJjUD2lLOChJ8nJjdyeqMyDWQlCAGSh4JjMSd/y
 ghzyl9gye+Ly9NRSrpnQBlh4mwJ+YxHKy7Jzv6SG9qGdUYhVYx5WspLBdYQQ9T2p8ie4
 xmlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZFpeoDrdt+3ART61xwj3YrRUH5IdU+zLoLX56R9IMco=;
 b=vnqYPJtB6PfSb8mjvISQX+5/QDAUtfsKYsEModZ1UGHb0NCCWlMUIpNdhPsgMYsSuz
 aAT4t2R2tGxEQm74VgMQJRnamw/ut4RfQ72cC7L6ZgajlVw1surt/rjCR42jvJ6tdzci
 JhR8rnK2PRDZH3Pt8VnbYoN7hdeHGWVtu9vYOybvxAoq5YR5g7moJ1clAVly67c3EgUv
 4nlrGyq8qudBZaZ9+462TQ7HOdNuz5GMUATNEPHlQa2o4RRg6c6meTfGkD3Bz74QOEi6
 0BY/kdB8cpkpcXDFvTKSgyEtJu+PCnYBvO2897WBEAmQfLndwhcYIGuF3JdaffkbpX51
 cv4g==
X-Gm-Message-State: AOAM531Qnv0yTWoFOTaVut7ZzYMjOz2X2eIuJMFDMAyTHU7+1MIXHDQt
 kjZvuHqg/nP/MZZrHnC9R9aVQKzJrI/QVw==
X-Google-Smtp-Source: ABdhPJzvo5Ge3Q+Uj9n5vATPfIpKtqQDuTCTCHhpENid2moVa//49nLwoq4A/P4tECAtXdTXaElN2w==
X-Received: by 2002:a05:622a:1208:: with SMTP id
 y8mr36762922qtx.214.1635948539006; 
 Wed, 03 Nov 2021 07:08:59 -0700 (PDT)
Received: from localhost.localdomain (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id z5sm1669377qtw.71.2021.11.03.07.08.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Nov 2021 07:08:58 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 15/23] target/mips: Extract break code into env->error_code
Date: Wed,  3 Nov 2021 10:08:39 -0400
Message-Id: <20211103140847.454070-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211103140847.454070-1-richard.henderson@linaro.org>
References: <20211103140847.454070-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::829;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x829.google.com
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

This fixes a bug in that cpu_loop was not handling the
different layout of the R6 version of break16.  This fixes
a bug in that cpu_loop extracted the wrong bits for the
mips16e break16 instruction.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/mips/tcg/translate.h               |  1 +
 linux-user/mips/cpu_loop.c                | 73 +++--------------------
 target/mips/tcg/translate.c               | 12 +++-
 target/mips/tcg/micromips_translate.c.inc |  6 +-
 target/mips/tcg/mips16e_translate.c.inc   |  2 +-
 5 files changed, 25 insertions(+), 69 deletions(-)

diff --git a/target/mips/tcg/translate.h b/target/mips/tcg/translate.h
index 6111493651..ae01515efe 100644
--- a/target/mips/tcg/translate.h
+++ b/target/mips/tcg/translate.h
@@ -129,6 +129,7 @@ enum {
 void generate_exception(DisasContext *ctx, int excp);
 void generate_exception_err(DisasContext *ctx, int excp, int err);
 void generate_exception_end(DisasContext *ctx, int excp);
+void generate_exception_break(DisasContext *ctx, int code);
 void gen_reserved_instruction(DisasContext *ctx);
 
 void check_insn(DisasContext *ctx, uint64_t flags);
diff --git a/linux-user/mips/cpu_loop.c b/linux-user/mips/cpu_loop.c
index 034b31f853..8efb6d2a24 100644
--- a/linux-user/mips/cpu_loop.c
+++ b/linux-user/mips/cpu_loop.c
@@ -65,6 +65,7 @@ void cpu_loop(CPUMIPSState *env)
 {
     CPUState *cs = env_cpu(env);
     int trapnr, si_code;
+    unsigned int code;
     abi_long ret;
 # ifdef TARGET_ABI_MIPSO32
     unsigned int syscall_num;
@@ -185,71 +186,15 @@ done_syscall:
          * handling code in arch/mips/kernel/traps.c.
          */
         case EXCP_BREAK:
-            {
-                abi_ulong trap_instr;
-                unsigned int code;
-
-                /*
-                 * FIXME: It would be better to decode the trap number
-                 * during translate, and store it in error_code while
-                 * raising the exception.  We should not be re-reading
-                 * the opcode here.
-                 */
-
-                if (env->hflags & MIPS_HFLAG_M16) {
-                    if (env->insn_flags & ASE_MICROMIPS) {
-                        /* microMIPS mode */
-                        ret = get_user_u16(trap_instr, env->active_tc.PC);
-                        if (ret != 0) {
-                            goto error;
-                        }
-
-                        if ((trap_instr >> 10) == 0x11) {
-                            /* 16-bit instruction */
-                            code = trap_instr & 0xf;
-                        } else {
-                            /* 32-bit instruction */
-                            abi_ulong instr_lo;
-
-                            ret = get_user_u16(instr_lo,
-                                               env->active_tc.PC + 2);
-                            if (ret != 0) {
-                                goto error;
-                            }
-                            trap_instr = (trap_instr << 16) | instr_lo;
-                            code = ((trap_instr >> 6) & ((1 << 20) - 1));
-                            /* Unfortunately, microMIPS also suffers from
-                               the old assembler bug...  */
-                            if (code >= (1 << 10)) {
-                                code >>= 10;
-                            }
-                        }
-                    } else {
-                        /* MIPS16e mode */
-                        ret = get_user_u16(trap_instr, env->active_tc.PC);
-                        if (ret != 0) {
-                            goto error;
-                        }
-                        code = (trap_instr >> 6) & 0x3f;
-                    }
-                } else {
-                    ret = get_user_u32(trap_instr, env->active_tc.PC);
-                    if (ret != 0) {
-                        goto error;
-                    }
-
-                    /* As described in the original Linux kernel code, the
-                     * below checks on 'code' are to work around an old
-                     * assembly bug.
-                     */
-                    code = ((trap_instr >> 6) & ((1 << 20) - 1));
-                    if (code >= (1 << 10)) {
-                        code >>= 10;
-                    }
-                }
-
-                do_tr_or_bp(env, code, false);
+            /*
+             * As described in the original Linux kernel code, the below
+             * checks on 'code' are to work around an old assembly bug.
+             */
+            code = env->error_code;
+            if (code >= (1 << 10)) {
+                code >>= 10;
             }
+            do_tr_or_bp(env, code, false);
             break;
         case EXCP_TRAP:
             {
diff --git a/target/mips/tcg/translate.c b/target/mips/tcg/translate.c
index 47db35d7dd..a42f507aed 100644
--- a/target/mips/tcg/translate.c
+++ b/target/mips/tcg/translate.c
@@ -1367,6 +1367,16 @@ void generate_exception_end(DisasContext *ctx, int excp)
     generate_exception_err(ctx, excp, 0);
 }
 
+void generate_exception_break(DisasContext *ctx, int code)
+{
+#ifdef CONFIG_USER_ONLY
+    /* Pass the break code along to cpu_loop. */
+    tcg_gen_st_i32(tcg_constant_i32(code), cpu_env,
+                   offsetof(CPUMIPSState, error_code));
+#endif
+    generate_exception_end(ctx, EXCP_BREAK);
+}
+
 void gen_reserved_instruction(DisasContext *ctx)
 {
     generate_exception_end(ctx, EXCP_RI);
@@ -14160,7 +14170,7 @@ static void decode_opc_special(CPUMIPSState *env, DisasContext *ctx)
         generate_exception_end(ctx, EXCP_SYSCALL);
         break;
     case OPC_BREAK:
-        generate_exception_end(ctx, EXCP_BREAK);
+        generate_exception_break(ctx, extract32(ctx->opcode, 6, 20));
         break;
     case OPC_SYNC:
         check_insn(ctx, ISA_MIPS2);
diff --git a/target/mips/tcg/micromips_translate.c.inc b/target/mips/tcg/micromips_translate.c.inc
index 0da4c802a3..f91f7a96cd 100644
--- a/target/mips/tcg/micromips_translate.c.inc
+++ b/target/mips/tcg/micromips_translate.c.inc
@@ -822,7 +822,7 @@ static void gen_pool16c_insn(DisasContext *ctx)
         gen_HILO(ctx, OPC_MFLO, 0, uMIPS_RS5(ctx->opcode));
         break;
     case BREAK16:
-        generate_exception_end(ctx, EXCP_BREAK);
+        generate_exception_break(ctx, extract32(ctx->opcode, 0, 4));
         break;
     case SDBBP16:
         if (is_uhi(extract32(ctx->opcode, 0, 4))) {
@@ -937,7 +937,7 @@ static void gen_pool16c_r6_insn(DisasContext *ctx)
             break;
         case R6_BREAK16:
             /* BREAK16 */
-            generate_exception(ctx, EXCP_BREAK);
+            generate_exception_break(ctx, extract32(ctx->opcode, 6, 4));
             break;
         case R6_SDBBP16:
             /* SDBBP16 */
@@ -1812,7 +1812,7 @@ static void decode_micromips32_opc(CPUMIPSState *env, DisasContext *ctx)
             gen_pool32axf(env, ctx, rt, rs);
             break;
         case BREAK32:
-            generate_exception_end(ctx, EXCP_BREAK);
+            generate_exception_break(ctx, extract32(ctx->opcode, 6, 20));
             break;
         case SIGRIE:
             check_insn(ctx, ISA_MIPS_R6);
diff --git a/target/mips/tcg/mips16e_translate.c.inc b/target/mips/tcg/mips16e_translate.c.inc
index 84d816603a..f57e0a5f2a 100644
--- a/target/mips/tcg/mips16e_translate.c.inc
+++ b/target/mips/tcg/mips16e_translate.c.inc
@@ -969,7 +969,7 @@ static int decode_ase_mips16e(CPUMIPSState *env, DisasContext *ctx)
             gen_slt(ctx, OPC_SLTU, 24, rx, ry);
             break;
         case RR_BREAK:
-            generate_exception_end(ctx, EXCP_BREAK);
+            generate_exception_break(ctx, extract32(ctx->opcode, 5, 6));
             break;
         case RR_SLLV:
             gen_shift(ctx, OPC_SLLV, ry, rx, ry);
-- 
2.25.1


