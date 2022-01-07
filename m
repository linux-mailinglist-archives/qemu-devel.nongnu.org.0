Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A58B487EA5
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 22:56:38 +0100 (CET)
Received: from localhost ([::1]:57128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5xDx-0007Dg-Ma
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 16:56:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n5wr5-0005DA-46
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 16:32:59 -0500
Received: from [2607:f8b0:4864:20::530] (port=36670
 helo=mail-pg1-x530.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n5wr1-0007qI-BH
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 16:32:57 -0500
Received: by mail-pg1-x530.google.com with SMTP id 200so6517709pgg.3
 for <qemu-devel@nongnu.org>; Fri, 07 Jan 2022 13:32:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1ZnKZhX9Hxd8Pfgs4kCYD/L+5/8tI955It7HaTGIro8=;
 b=HR7+hSpfOP0HrrcXGHjRargHraD40jLhqIwqWMwDPio7X1eOKuSpgdtgHti55GhB3n
 9I3eXCUneYqx9TkxpqrENvG1CarC3TI9WzTxHG+HhNEmHk6O1lZSIfvEQlfbUJeo4twr
 rzE9SDWK24JfG/7N2AdsTkGal+vhkfjrHvYbT99FMewS5A8ZUnOBJLkIYenYAJSMv5qw
 HTLvxiAtat93IT2PkQNdVNwKflETxEYF72TmnQm0yT1GTrad46KVCH9kJ+ENELNAvE8G
 3AsbMEQkPinMv78zdMF67TZqGzz2cLzXraHKekTRX9bd9lVtm4AqwwIxuZICkZRj7CLF
 lY1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1ZnKZhX9Hxd8Pfgs4kCYD/L+5/8tI955It7HaTGIro8=;
 b=owtNEim3L6QJEw1GhbJrGXSmuMXNzpV/KG5mXJFGofX0enlg/rap8jz9fIby63Jjlj
 SmkDvJcy84ljtfkJNs1AzvHRh5hQ+ZnHoJf0qWHF9sCFVealpDXgnfnaDpCbcE8WWqiI
 1UdAzyMF23rhgXdj1qDcNhPEcRR1b7zWgeVo5YHcWL/v58zVKB4dA4yb1PQ3yZUBEg8U
 sLKOhY7XIfr6pasT1EfdipPfUfUgS/TKjkOhgt9oWSICN6VfhAu0InIsN9lmVgUYwpil
 w1kbu4I92ctDJN8OLRVVs+gY83DP/hq9xAwPT8CW2XDJYSktgdgR1WSIBmqbSOqfEM0A
 qNIg==
X-Gm-Message-State: AOAM530hxKfeoKcOAhv5C9b/kM8hGy0RYlUHMWvo3KKgzEQYZd45a4uO
 GVPYtSbpgl07ROgoHMw4dJfIyyHRLhk0GA==
X-Google-Smtp-Source: ABdhPJyAX9mmH5trjUsnk3uiou97bBfzsH3v3JCeYrjTzNCkWuB3MrwZsOQ1BjiDUjxeC777s7vTcA==
X-Received: by 2002:a63:fe10:: with SMTP id p16mr57249283pgh.546.1641591174068; 
 Fri, 07 Jan 2022 13:32:54 -0800 (PST)
Received: from localhost.localdomain (174-21-75-75.tukw.qwest.net.
 [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id y11sm6633030pfi.80.2022.01.07.13.32.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 13:32:53 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 16/24] target/mips: Extract break code into env->error_code
Date: Fri,  7 Jan 2022 13:32:35 -0800
Message-Id: <20220107213243.212806-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220107213243.212806-1-richard.henderson@linaro.org>
References: <20220107213243.212806-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::530
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
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

This fixes a bug in that cpu_loop was not handling the
different layout of the R6 version of break16.  This fixes
a bug in that cpu_loop extracted the wrong bits for the
mips16e break16 instruction.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
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
index 1286fbc2e0..9a6ab2dd98 100644
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


