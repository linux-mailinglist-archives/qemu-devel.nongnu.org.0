Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 571F053B8D7
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Jun 2022 14:14:11 +0200 (CEST)
Received: from localhost ([::1]:45992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwjiM-00044f-EN
	for lists+qemu-devel@lfdr.de; Thu, 02 Jun 2022 08:14:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nwjTT-0000Xl-2Z
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 07:58:47 -0400
Received: from mout.kundenserver.de ([217.72.192.73]:37981)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nwjTR-0001Df-5Y
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 07:58:46 -0400
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue108
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MeD1l-1nPJnZ3nip-00bK23; Thu, 02
 Jun 2022 13:58:43 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 08/19] target/m68k: Fix address argument for EXCP_CHK
Date: Thu,  2 Jun 2022 13:58:26 +0200
Message-Id: <20220602115837.2013918-9-laurent@vivier.eu>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220602115837.2013918-1-laurent@vivier.eu>
References: <20220602115837.2013918-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:WnZLBWQ7LjeNtl2oz0PAPlylRE93UJuVhVrCe/LcWs5UC3SopHt
 jeZH6ADRHay4qmMoXcSHlvhLwGmp+pb9Jhyhslv01ciWT4ZDFKaY5aTeIf13q8tQGUs6Obf
 OZQS30bhcMiLBlXjc7eJoVyAOcovR1Xc3SWUHe1gN61y9pvjpR6kB6bFZsC2ZqNWIJeudIl
 Tq9sYnlNW8JYNeuZEXt/A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:BUwLszaAd1Y=:r4zbB+hGInrflnqv7MC727
 rGQpmOLaiAvQGvULoAd/zlTgT6yots3+Bx2ApOHtz9dk4Fx/y8J89UQliMgNmCaGK4Ors0lUg
 m43tfzS0mYsGsqN6hwqt1r+NiCo59/VsNLHwq5d8s1eDgszLM3vLrqVYyV490d0frTmeo99YB
 hVkVD5DQqKeMZRUXKBV7kbOQ32rzux2UMRdN5Of3lF8eM8Wk+FNaykwSGDQzQTlOd1NbLZdyV
 QvydcL8VCVGkKWEHciZ55REUrOKKh2oReoIzUYC/buGmaeaxtiBRNX8N5rLAWI+9k2RC9/bn3
 f9aJkN6voGRG2NMNfh0ehhvhedY2KdSbMv3u8RKBiXGIvKiyaQANi5yvRWDNEee78YCT38200
 ekJo0WCZ4OyhZ1/cISOgCG/M3Ga1xfeubyeIHn7Kf2iAqRGJC+HNDHmRUvc4GPdvxO7FH76rS
 cNjXfS2fRHdacLByf2ITiABM1Ddm/mgjekDczXW5HFP1KNFFeikToqiwrn+s7wOUSZtlvR2fT
 yfUj4bsDreF1tGnFom3unDRPa9CcaXbYuVbkE1liET2X6Kn0paJepSlm025Yl1CnRx7CGUG9j
 0TPeDTQkCtbeg+qq2ByoBZXihm0zYAyw1bdSfE69ou7B5YNHI40PR3VlPuIcgzAl/GucvsivW
 Q0tzAs49zNMIVnyMyT6r5ZFvFJu0ZKb+sJxRk8Mh1zDQqd5UXVu9olognwtppTn5U2Wi/sMJW
 pCfp0wKXBLzPTKJOYuKhR1IhDnInhvyN5PyvlQ==
Received-SPF: none client-ip=217.72.192.73; envelope-from=laurent@vivier.eu;
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

According to the M68040 Users Manual, section 8.4.3,
Six word stack frame (format 2), CHK, CHK2 (and others)
are supposed to record the next insn in PC and the
address of the trapping instruction in ADDRESS.

Create a raise_exception_format2 function to centralize recording
of the trapping pc in mmu.ar, plus advancing to the next insn.

Update m68k_interrupt_all to pass mmu.ar to do_stack_frame.
Update cpu_loop to pass mmu.ar to siginfo.si_addr, as the
kernel does in trap_c().

Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220602013401.303699-7-richard.henderson@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 target/m68k/cpu.h          |  6 +++++
 linux-user/m68k/cpu_loop.c |  2 +-
 target/m68k/op_helper.c    | 54 ++++++++++++++++++++------------------
 3 files changed, 36 insertions(+), 26 deletions(-)

diff --git a/target/m68k/cpu.h b/target/m68k/cpu.h
index 9b3bf7a44819..558c3c67d607 100644
--- a/target/m68k/cpu.h
+++ b/target/m68k/cpu.h
@@ -122,6 +122,12 @@ typedef struct CPUArchState {
 
     /* MMU status.  */
     struct {
+        /*
+         * Holds the "address" value in between raising an exception
+         * and creation of the exception stack frame.
+         * Used for both Format 7 exceptions (Access, i.e. mmu)
+         * and Format 2 exceptions (chk, div0, trapcc, etc).
+         */
         uint32_t ar;
         uint32_t ssw;
         /* 68040 */
diff --git a/linux-user/m68k/cpu_loop.c b/linux-user/m68k/cpu_loop.c
index 12e5d9cd5363..e24d17e180e3 100644
--- a/linux-user/m68k/cpu_loop.c
+++ b/linux-user/m68k/cpu_loop.c
@@ -47,7 +47,7 @@ void cpu_loop(CPUM68KState *env)
             force_sig_fault(TARGET_SIGILL, TARGET_ILL_ILLOPN, env->pc);
             break;
         case EXCP_CHK:
-            force_sig_fault(TARGET_SIGFPE, TARGET_FPE_INTOVF, env->pc);
+            force_sig_fault(TARGET_SIGFPE, TARGET_FPE_INTOVF, env->mmu.ar);
             break;
         case EXCP_DIV0:
             force_sig_fault(TARGET_SIGFPE, TARGET_FPE_INTDIV, env->pc);
diff --git a/target/m68k/op_helper.c b/target/m68k/op_helper.c
index 777869790b66..750d65576fcf 100644
--- a/target/m68k/op_helper.c
+++ b/target/m68k/op_helper.c
@@ -397,13 +397,16 @@ static void m68k_interrupt_all(CPUM68KState *env, int is_hw)
 
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
         if (is_hw && (oldsr & SR_M)) {
             do_stack_frame(env, &sp, 0, oldsr, 0, env->pc);
@@ -548,6 +551,29 @@ void HELPER(raise_exception)(CPUM68KState *env, uint32_t tt)
     raise_exception(env, tt);
 }
 
+G_NORETURN static void
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
@@ -1065,18 +1091,7 @@ void HELPER(chk)(CPUM68KState *env, int32_t val, int32_t ub)
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
 
@@ -1097,17 +1112,6 @@ void HELPER(chk2)(CPUM68KState *env, int32_t val, int32_t lb, int32_t ub)
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
2.36.1


