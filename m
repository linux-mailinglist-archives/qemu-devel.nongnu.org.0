Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92C266B53E9
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Mar 2023 23:11:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pakvr-0008I9-LD; Fri, 10 Mar 2023 17:09:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pakvn-0008FR-QF
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 17:09:43 -0500
Received: from mout.kundenserver.de ([212.227.126.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pakvl-00033M-Ja
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 17:09:43 -0500
Received: from quad ([82.64.211.94]) by mrelayeu.kundenserver.de (mreue011
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1N3KkM-1qZhEf117q-010L9g; Fri, 10
 Mar 2023 23:09:39 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 21/28] linux-user/sparc: Handle getcc, setcc, getpsr traps
Date: Fri, 10 Mar 2023 23:09:20 +0100
Message-Id: <20230310220927.326606-22-laurent@vivier.eu>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230310220927.326606-1-laurent@vivier.eu>
References: <20230310220927.326606-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:VHzsuxxPPKWyfOtCIGXTKlpnoif4oOTx6r8dnvKBJsoUhW/Xib1
 iUBCnfxLEAB5zq2fxl8UrwrwRrHTsHO/eboCQ0wg/X5/MeHKYRPjqcDVfuqmGWFpw/95Hpa
 jVEFKrsGWnTh1KRRE2xItM2STRJb6pfzwBao/7pw8Selb7Twc3BUGKLk1MqaqKif3sdg3Zz
 qBbHwPoTUQ7oEgbECz8lw==
UI-OutboundReport: notjunk:1;M01:P0:iP4dggLz/Ho=;RqsK83/RCo/DQMua3FTulhXvx0E
 IBDNR4R3l9x/iVB9CB5guzZzBjspHrNWvj0QgeimnHUekrpJDBGS15lbDrZ61PCobGP6qrXTN
 bDoM/lbVhzEho9DNgnZGc4bAZe1aqFQ1z/u/fxPEyL9gwOBHxNGJC+md6wdwoaQf4A+KuIaKU
 xzyqsl4Lc4JuEOOo+o4mxdvwgBpMkbVSmkLMfYA1LZxbHof4e/seUEEC09Hb0JXoaaO9CULfO
 bM+OPHsQBe6XfmH68plLb/55kzPAjRLDEeEBVZuKQip5U4/Kj7OTobazLtz6r2Nmx7mwx1BE5
 Y0MrJQUI59OnRbekWerdPnW5SMkz3PlWRl3bzb64fU/W9fxzOBYq7Vp5XpeVaI2h583lxTSbl
 cqfH5mv0SkiYAS2LsZG2nzsL1qyShCHTYsP13UNXtOJR1nrXjcFCOfcNPRIaeo9UEdAWSFYp2
 /4eRw2NnamAkkouV8PX+Zta7OSqENXI/VH4ZDBhmrD1i+hLeDZ//55UnEKTY1QWbjbxgfiVjk
 ee0tPBCjt5x35b8Ca2DsYJIxdOPkEznHH4XQu0MJXfipPlJ4C6PyGT7EdTGm0iCNbSw/t60UR
 qdwQuytc7iUuumNnFCqX6TZuoxVq7IqSm/gATRQ30YXMpmyoNYd+IfrQM8o/HwSoeEW0A0NC5
 iLSBvUvuez1lCWaR9RsGaGWoflWG53Uj6NNOw6fjzA==
Received-SPF: none client-ip=212.227.126.131; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Richard Henderson <richard.henderson@linaro.org>

These are really only meaningful for sparc32, but they're
still present for backward compatibility for sparc64.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20230216054516.1267305-10-richard.henderson@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/sparc/cpu_loop.c | 62 +++++++++++++++++++++++++++++++++++--
 1 file changed, 59 insertions(+), 3 deletions(-)

diff --git a/linux-user/sparc/cpu_loop.c b/linux-user/sparc/cpu_loop.c
index e04c84286769..a3edb353f6fd 100644
--- a/linux-user/sparc/cpu_loop.c
+++ b/linux-user/sparc/cpu_loop.c
@@ -149,6 +149,51 @@ static void flush_windows(CPUSPARCState *env)
 #endif
 }
 
+static void next_instruction(CPUSPARCState *env)
+{
+    env->pc = env->npc;
+    env->npc = env->npc + 4;
+}
+
+static uint32_t do_getcc(CPUSPARCState *env)
+{
+#ifdef TARGET_SPARC64
+    return cpu_get_ccr(env) & 0xf;
+#else
+    return extract32(cpu_get_psr(env), 20, 4);
+#endif
+}
+
+static void do_setcc(CPUSPARCState *env, uint32_t icc)
+{
+#ifdef TARGET_SPARC64
+    cpu_put_ccr(env, (cpu_get_ccr(env) & 0xf0) | (icc & 0xf));
+#else
+    cpu_put_psr(env, deposit32(cpu_get_psr(env), 20, 4, icc));
+#endif
+}
+
+static uint32_t do_getpsr(CPUSPARCState *env)
+{
+#ifdef TARGET_SPARC64
+    const uint64_t TSTATE_CWP = 0x1f;
+    const uint64_t TSTATE_ICC = 0xfull << 32;
+    const uint64_t TSTATE_XCC = 0xfull << 36;
+    const uint32_t PSR_S      = 0x00000080u;
+    const uint32_t PSR_V8PLUS = 0xff000000u;
+    uint64_t tstate = sparc64_tstate(env);
+
+    /* See <asm/psrcompat.h>, tstate_to_psr. */
+    return ((tstate & TSTATE_CWP)                   |
+            PSR_S                                   |
+            ((tstate & TSTATE_ICC) >> 12)           |
+            ((tstate & TSTATE_XCC) >> 20)           |
+            PSR_V8PLUS);
+#else
+    return (cpu_get_psr(env) & (PSR_ICC | PSR_CWP)) | PSR_S;
+#endif
+}
+
 /* Avoid ifdefs below for the abi32 and abi64 paths. */
 #ifdef TARGET_ABI32
 #define TARGET_TT_SYSCALL  (TT_TRAP + 0x10) /* t_linux */
@@ -218,9 +263,20 @@ void cpu_loop (CPUSPARCState *env)
 
         case TT_TRAP + 0x03: /* flush windows */
             flush_windows(env);
-            /* next instruction */
-            env->pc = env->npc;
-            env->npc = env->npc + 4;
+            next_instruction(env);
+            break;
+
+        case TT_TRAP + 0x20: /* getcc */
+            env->gregs[1] = do_getcc(env);
+            next_instruction(env);
+            break;
+        case TT_TRAP + 0x21: /* setcc */
+            do_setcc(env, env->gregs[1]);
+            next_instruction(env);
+            break;
+        case TT_TRAP + 0x22: /* getpsr */
+            env->gregs[1] = do_getpsr(env);
+            next_instruction(env);
             break;
 
 #ifdef TARGET_SPARC64
-- 
2.39.2


