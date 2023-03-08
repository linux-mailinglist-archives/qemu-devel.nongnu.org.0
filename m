Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B2886B094A
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 14:34:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZttQ-0004Ii-Rz; Wed, 08 Mar 2023 08:31:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pZtr5-0001ks-Dx
 for qemu-devel@nongnu.org; Wed, 08 Mar 2023 08:29:21 -0500
Received: from mout.kundenserver.de ([212.227.17.24])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pZtr2-000683-OH
 for qemu-devel@nongnu.org; Wed, 08 Mar 2023 08:29:19 -0500
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue107
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MzyAy-1qWgyk2vbC-00x5iS; Wed, 08
 Mar 2023 14:29:12 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 21/28] linux-user/sparc: Handle getcc, setcc, getpsr traps
Date: Wed,  8 Mar 2023 14:28:50 +0100
Message-Id: <20230308132857.161793-22-laurent@vivier.eu>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230308132857.161793-1-laurent@vivier.eu>
References: <20230308132857.161793-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:eHalJmY8rD8wOf1IC4sz+QHbX4m89J/lQVnkR+6/eBXHlq3zCKR
 sub+U5ODxaJBaVRAaOeYHKFzqdYqtjNyCAa/BWcxr2Gg7c3/URN4ewkKJh7cbtEhqrBNnrd
 vd0Kij7922yYycxxOisj/vH+RtNLb+eRQnmkt6qhOfEqV3hJwGzHV6Vfx4YAWxB3AiGuXN/
 qjbEM4lczd1d26+PYOOGQ==
UI-OutboundReport: notjunk:1;M01:P0:nwc34GiXmyw=;HBT6wV9vyfEdwANIOnFm7oCYbKz
 lirTj/z7xtqo+2gPWmnGziF2eMppa5bkKGp1hy4HBdhCGQDjsnOtc+LGCpE40T7AOJHAIApRp
 9dzHhNtqsp7TNzEmHwXHZrcPz3UQ4EkAA5Wtl73eKPGXBD7mSbAhM5+d0DUd762VsRKOlh1HG
 c81+8w6+AxSWsX8sGr2LAenMSKX6Vk9ogwzv42a8CUqUtmggE1kbh38PErw8Jtiiy8Vk5g0xt
 8qtX+6ad38JR3YdFF1lLbZAVOCzhrAVAZaWlOfBYVigZBP47+Pl4idvKQn2diUWxEpxO3TyTz
 WoDRZrCcRcSF2PGC49KDiuSAKgQTsAT0h6htcMNjodRqLbs2xy51KMt0sd+mSHCY59krqupR+
 pFkf8k8WtbARW4A3oJQVsOoYzHzKVH9i5EK2Fj+dI8pjARBpX/OMhF32u2DKsqKT/0xsK2eoe
 iABAxLHcy+lkcpSfhNYlso2OVYsW0GFJe8pPUnA/nIIReMcGAj3/oAEAJ/iz5FCRvUjf2yYcx
 EiXxuPTnEDtf4a4KtwKEtrM+zClf6BKIVm4Qca38tgO3jtvN5BYWh0pZkzf5tYjfZRGwa8KKG
 9m00X99fJ49pl6CZgchBxYmgFgiZl9tsCVFNwuIM4VOGZESToJZKOrsH3e7DsufFA2MfSFPW/
 ANobOTGv+n0/pv6Zzv7Lg22XIvMtOOJtiH2U6FXQAw==
Received-SPF: none client-ip=212.227.17.24; envelope-from=laurent@vivier.eu;
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


