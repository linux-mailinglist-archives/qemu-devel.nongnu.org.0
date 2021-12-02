Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F646466B48
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Dec 2021 21:58:36 +0100 (CET)
Received: from localhost ([::1]:33898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mstA3-00023M-MK
	for lists+qemu-devel@lfdr.de; Thu, 02 Dec 2021 15:58:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mst0v-00006Q-BT
 for qemu-devel@nongnu.org; Thu, 02 Dec 2021 15:49:09 -0500
Received: from [2607:f8b0:4864:20::430] (port=33700
 helo=mail-pf1-x430.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mst0t-0005Ta-Mb
 for qemu-devel@nongnu.org; Thu, 02 Dec 2021 15:49:09 -0500
Received: by mail-pf1-x430.google.com with SMTP id x5so775901pfr.0
 for <qemu-devel@nongnu.org>; Thu, 02 Dec 2021 12:49:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QB8xOr28M/WUUK5DvBYDr+mSvzOkIVVCrLOmzfGyBww=;
 b=aTCwxLeSqcOVAFo3a/7nAMYb6UasZzHDOQyBGMbHnkmyIli0tMeZpZ9DptgniqtqgP
 W0ZHoh/o3r8yKvyjJOsKH59tHp6gIxu8LYFo7nBfZ/lZMKRM/Qa8hsuXrkmJcRChbSiQ
 msFjrEp1oBGKw3rHnSJX1UUXqlWWIjZ7E+NO31riHui1iau+x8/rCGHODM+daj5n9dml
 QEnd7jjy4ZXIU2UXGsmVK5tVVXwdxxJdaRyq80zDaUjQ/XEZa6a9vTUpnHf4P4jIAEDL
 9C/B/StV08jN7W0QRSd5GQvUEaGYRMt8Ca80Ju9D3gWUgjeHmqwHNG44NnZLfgj5nC3a
 J1Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QB8xOr28M/WUUK5DvBYDr+mSvzOkIVVCrLOmzfGyBww=;
 b=apNcxl/q0f8EHNnSb1nCMNnIaU8x164NVjHxF+Z084AeLUK/IK9Ve21nB4QuqdXOCl
 mTvga0Gms8c+RgHzexRa1ogFYCF/moi3gFfZ0hejZT7uGwQlE2T4gLlECZ8+D0WZuKJk
 CiOc6Cy760Xeg7xkGkotXv9ey4LvPBFcfCoM93gcZpxGEvTknOLByXTt2uO39WmgLcGX
 y3m+71qRfSQsvC98A/IYkwT2AWLN6f0+oT7a+03t86SdSaxiuTIJFTk9I+BFyjjD2jNV
 IeFC58ECF7M6wNaKipuiJ3Rv5qTK72fXXGVBY17kNUqYdC8lZYMiE2xQzETGcHR9gqgz
 zpDA==
X-Gm-Message-State: AOAM530UGwCz6RyLbNb7EYTYYhZLZdnHgzVxGFWbBIYONmaMOM3AXWPS
 ykW2kFJ6nJNWN1Q5nyLYEN2a3T3Fi8TiBw==
X-Google-Smtp-Source: ABdhPJxhQFQE4SvZpY7+jAkml6ZPp+Z+r2CZqCpjSrREHd7zX2ckDql0QGImtUQooaTYDgYRo2VORQ==
X-Received: by 2002:a63:130c:: with SMTP id i12mr1202675pgl.297.1638478146012; 
 Thu, 02 Dec 2021 12:49:06 -0800 (PST)
Received: from localhost.localdomain (174-21-75-75.tukw.qwest.net.
 [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id pi17sm3721391pjb.34.2021.12.02.12.49.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Dec 2021 12:49:05 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 06/15] target/m68k: Fix address argument for EXCP_CHK
Date: Thu,  2 Dec 2021 12:48:51 -0800
Message-Id: <20211202204900.50973-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211202204900.50973-1-richard.henderson@linaro.org>
References: <20211202204900.50973-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::430
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

According to the M68040 Users Manual, section 8.4.3,
Six word stack frame (format 2), CHK, CHK2 (and others)
are supposed to record the next insn in PC and the
address of the trapping instruction in ADDRESS.

Create a raise_exception_format2 function to centralize recording
of the trapping pc in mmu.ar, plus advancing to the next insn.

Update m68k_interrupt_all to pass mmu.ar to do_stack_frame.
Update cpu_loop to pass mmu.ar to siginfo.si_addr, as the
kernel does in trap_c().

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/m68k/cpu_loop.c |  2 +-
 target/m68k/op_helper.c    | 54 ++++++++++++++++++++------------------
 2 files changed, 30 insertions(+), 26 deletions(-)

diff --git a/linux-user/m68k/cpu_loop.c b/linux-user/m68k/cpu_loop.c
index 0de11fb9bf..82b100aa87 100644
--- a/linux-user/m68k/cpu_loop.c
+++ b/linux-user/m68k/cpu_loop.c
@@ -49,7 +49,7 @@ void cpu_loop(CPUM68KState *env)
             force_sig_fault(TARGET_SIGILL, TARGET_ILL_ILLOPN, env->pc);
             break;
         case EXCP_CHK:
-            force_sig_fault(TARGET_SIGFPE, TARGET_FPE_INTOVF, env->pc);
+            force_sig_fault(TARGET_SIGFPE, TARGET_FPE_INTOVF, env->mmu.ar);
             break;
         case EXCP_DIV0:
             force_sig_fault(TARGET_SIGFPE, TARGET_FPE_INTDIV, env->pc);
diff --git a/target/m68k/op_helper.c b/target/m68k/op_helper.c
index afbbb8b4ca..b549eb077c 100644
--- a/target/m68k/op_helper.c
+++ b/target/m68k/op_helper.c
@@ -396,13 +396,16 @@ static void m68k_interrupt_all(CPUM68KState *env, int is_hw)
 
     case EXCP_ILLEGAL:
     case EXCP_DIV0:
-    case EXCP_CHK:
     case EXCP_TRAPCC:
     case EXCP_TRACE:
         /* FIXME: addr is not only env->pc */
         do_stack_frame(env, &sp, 2, oldsr, env->pc, env->pc);
         break;
 
+    case EXCP_CHK:
+        do_stack_frame(env, &sp, 2, oldsr, env->mmu.ar, env->pc);
+        break;
+
     case EXCP_SPURIOUS ... EXCP_INT_LEVEL_7:
         if (is_hw && oldsr & SR_M) {
             do_stack_frame(env, &sp, 0, oldsr, 0, env->pc);
@@ -544,6 +547,29 @@ void HELPER(raise_exception)(CPUM68KState *env, uint32_t tt)
     raise_exception(env, tt);
 }
 
+static void QEMU_NORETURN
+raise_exception_format2(CPUM68KState *env, int tt, int ilen, uintptr_t raddr)
+{
+    CPUState *cs = env_cpu(env);
+
+    cs->exception_index = tt;
+
+    /* Recover PC and CC_OP for the beginning of the insn.  */
+    cpu_restore_state(cs, raddr, true);
+
+    /* Flags are current in env->cc_*, or are undefined. */
+    env->cc_op = CC_OP_FLAGS;
+
+    /*
+     * Remember original pc in mmu.ar, for the Format 2 stack frame.
+     * Adjust PC to end of the insn.
+     */
+    env->mmu.ar = env->pc;
+    env->pc += ilen;
+
+    cpu_loop_exit(cs);
+}
+
 void HELPER(divuw)(CPUM68KState *env, int destr, uint32_t den)
 {
     uint32_t num = env->dregs[destr];
@@ -1061,18 +1087,7 @@ void HELPER(chk)(CPUM68KState *env, int32_t val, int32_t ub)
     env->cc_c = 0 <= ub ? val < 0 || val > ub : val > ub && val < 0;
 
     if (val < 0 || val > ub) {
-        CPUState *cs = env_cpu(env);
-
-        /* Recover PC and CC_OP for the beginning of the insn.  */
-        cpu_restore_state(cs, GETPC(), true);
-
-        /* flags have been modified by gen_flush_flags() */
-        env->cc_op = CC_OP_FLAGS;
-        /* Adjust PC to end of the insn.  */
-        env->pc += 2;
-
-        cs->exception_index = EXCP_CHK;
-        cpu_loop_exit(cs);
+        raise_exception_format2(env, EXCP_CHK, 2, GETPC());
     }
 }
 
@@ -1093,17 +1108,6 @@ void HELPER(chk2)(CPUM68KState *env, int32_t val, int32_t lb, int32_t ub)
     env->cc_c = lb <= ub ? val < lb || val > ub : val > ub && val < lb;
 
     if (env->cc_c) {
-        CPUState *cs = env_cpu(env);
-
-        /* Recover PC and CC_OP for the beginning of the insn.  */
-        cpu_restore_state(cs, GETPC(), true);
-
-        /* flags have been modified by gen_flush_flags() */
-        env->cc_op = CC_OP_FLAGS;
-        /* Adjust PC to end of the insn.  */
-        env->pc += 4;
-
-        cs->exception_index = EXCP_CHK;
-        cpu_loop_exit(cs);
+        raise_exception_format2(env, EXCP_CHK, 4, GETPC());
     }
 }
-- 
2.25.1


