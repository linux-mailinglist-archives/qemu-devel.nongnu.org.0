Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFD4548B88B
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 21:21:28 +0100 (CET)
Received: from localhost ([::1]:54458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7Ne0-0002nc-Vh
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 15:21:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n7NCr-0000OP-F5
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 14:53:21 -0500
Received: from mout.kundenserver.de ([212.227.17.10]:49867)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n7NCb-0008IN-R6
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 14:53:21 -0500
Received: from quad ([82.142.23.158]) by mrelayeu.kundenserver.de (mreue106
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MeC5x-1mXDlY3a8V-00bHY2; Tue, 11
 Jan 2022 20:52:56 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 16/30] target/mips: Extract break code into env->error_code
Date: Tue, 11 Jan 2022 20:52:33 +0100
Message-Id: <20220111195247.1737641-17-laurent@vivier.eu>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220111195247.1737641-1-laurent@vivier.eu>
References: <20220111195247.1737641-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:iefuREYRQN058epDP68h+H3T3Mu6+2a07KVYMIampndCmORcTM3
 CmpAC0rD193YSod830ipVU7yXwqSCFaL5Jedx/AkHMwU+SMLBeS24vxaNtaL0/jKLmfAK9F
 5XMPILg8BfCNRjFq2X9dS2WIPBetw8SvNl0f+2mldKKMTsz/+KP8tJmUAE1KoIDqOdVH9BD
 B8TidPv3MxpqYItdPZskQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:vF4osvwsrx8=:4PuHKM14Ye0XWMJ2ZzLTZe
 TOerhcD8aYXUxy2bcLsZCkxb5OFoFMFQ9FglVmqazQwUw5926KjZ5W89/LtnoeA+L+Wco6C10
 W5Cq2wzn6XXEs6hM0KFZTwXzCii25eO2Cn3zL9jNi+Lw38oSYZL6IveDDGKkXSPO3Rdd8TIIA
 wDwMxTaGSykGZhbf+Zt42NDwEa/0np29enFBqihltkoYwg9qnIrUSoiompxf5b8V7VMKpqoQ6
 5aQ5w7p2wp231vM6DsjhhKtaxa4WSagw1VuIRN2VzkwxfFH/L90b7il0lRcGQKDDfl15NqiK2
 MvDRTagwxs0xfORscykhhYFOnLpTJGGt1apfPu+ivZ3ypEjkG+ixRQbWVR+wLnIJ9p88ToCBt
 DXfQKED1twocUgjJ69oDhR0FPzYpt+EhkbxSyzFfxKLxsfd/D8devBmlIG8m0hvNbxFSHEMSw
 H59R8VuWuXOVTC57vNU1n8MihryEwHxPUPtBz2W7jO1YVqZXMS90vmGRmpsrFKAz7O2VeUmH+
 BYkvRStEGm+HCUYdWrPi+lcUH8WdoEdBY/ycV2Lu+s7Mq+FUAIvOV6rjyZLPzjWs/KJeQtBtA
 BVSmfhOS/uUWvSoKM/QZ18YkmUmOzV3FDPhRFLMcJLJrKquo79qrnEVsJ5U+g5oVQErNm+ATu
 OuCpKA3no+aSck8RDlFoYa5vAU+dv3XSOiSB0I0WgQdPqQy/T8yXBp6omNtz+Alsu0xk=
Received-SPF: none client-ip=212.227.17.10; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

This fixes a bug in that cpu_loop was not handling the
different layout of the R6 version of break16.  This fixes
a bug in that cpu_loop extracted the wrong bits for the
mips16e break16 instruction.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220107213243.212806-17-richard.henderson@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/mips/cpu_loop.c                | 73 +++--------------------
 target/mips/tcg/micromips_translate.c.inc |  6 +-
 target/mips/tcg/mips16e_translate.c.inc   |  2 +-
 target/mips/tcg/translate.c               | 12 +++-
 target/mips/tcg/translate.h               |  1 +
 5 files changed, 25 insertions(+), 69 deletions(-)

diff --git a/linux-user/mips/cpu_loop.c b/linux-user/mips/cpu_loop.c
index 1286fbc2e0d3..9a6ab2dd986a 100644
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
diff --git a/target/mips/tcg/micromips_translate.c.inc b/target/mips/tcg/micromips_translate.c.inc
index 0760941431e1..9013f8403739 100644
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
index 84d816603aa5..f57e0a5f2a95 100644
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
diff --git a/target/mips/tcg/translate.c b/target/mips/tcg/translate.c
index 1c2264417cfd..7f0cc81a9056 100644
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
diff --git a/target/mips/tcg/translate.h b/target/mips/tcg/translate.h
index 6111493651f6..ae01515efe11 100644
--- a/target/mips/tcg/translate.h
+++ b/target/mips/tcg/translate.h
@@ -129,6 +129,7 @@ enum {
 void generate_exception(DisasContext *ctx, int excp);
 void generate_exception_err(DisasContext *ctx, int excp, int err);
 void generate_exception_end(DisasContext *ctx, int excp);
+void generate_exception_break(DisasContext *ctx, int code);
 void gen_reserved_instruction(DisasContext *ctx);
 
 void check_insn(DisasContext *ctx, uint64_t flags);
-- 
2.33.1


