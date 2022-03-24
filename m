Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 164BB4E604F
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Mar 2022 09:27:25 +0100 (CET)
Received: from localhost ([::1]:37872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXIoW-0003xH-5R
	for lists+qemu-devel@lfdr.de; Thu, 24 Mar 2022 04:27:24 -0400
Received: from eggs.gnu.org ([209.51.188.92]:52246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nXIho-0005yJ-R7
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 04:20:28 -0400
Received: from mout.kundenserver.de ([212.227.126.130]:34009)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nXIhm-0003QQ-Rm
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 04:20:28 -0400
Received: from quad ([82.142.12.150]) by mrelayeu.kundenserver.de (mreue011
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MirX2-1o19oa3STs-00eqz8; Thu, 24
 Mar 2022 09:20:25 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 10/10] linux-user/arm: Implement __kernel_cmpxchg64 with host
 atomics
Date: Thu, 24 Mar 2022 09:20:16 +0100
Message-Id: <20220324082016.3463521-11-laurent@vivier.eu>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220324082016.3463521-1-laurent@vivier.eu>
References: <20220324082016.3463521-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:ua5RvGBo8oB2zsuxbQLVWRtT+OjtQ2Pfk3/fLBQl6+aovURTHLY
 PSrmwUgXtdmZdW42sVoWXWy9eMOj5CCglZj3aD+4YCo+O3OLjaOmsv6n8jhv42v9oI7rMZD
 RD/3uopGPmnJV7TJ2o0pLg5KpZZmvrR4/yJL9jzygi6Xlx0Jnu6IE40iEwWl6tz+Gj845N9
 vNqpecH7qirhwhd599xrw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:nD2La7kckSI=:Y1Bp7ofW8gJmNW8Cw2FF4N
 jWsKOrOefLCgNyymmuA654IY+PdY6Q5q5HcQnwbW/p+YckffIED1LY9lwwVDkjBrNV7/CntTi
 lmNad9i5qbu4g06HLEAzofrLluuvmbaK/t3qvGOWIQt6IhtdcTsNEpkw/o/3kbEStrdZFaaUU
 tDcoCGztxWCmAqaKqBBJ794b2PQbyt1yxDEn3gUPjaUC1zc9dWeOWCr5AOUMVLwhzoQph+Vb0
 AHhUzTIQ5yL78ps6112xtxm0C0uQUkYmpbDA6Wna38FHweqUttpLe7+ymNTXjRY1C4IPPnuME
 ykYrabz10xXw46jRbi7LnfEFnVnbHqpgNwQmrqxni64oGgGMkzD48v0eP43zmytflGn1+hghG
 RGkKecD0H9EvsioCiy7Xe/NOUhfUZMbGfyc1hq6jdvB1vaNIxX7NCY475GwMchTN/8jgHfvSo
 BgmKvE8Qe4z1Q+AKBLo/ksDpFBM/ygKkPelq53aTAe1jE0W3/x+xFibnJrjXhzofxhro7VFNx
 W8yXd9w3P3937Z2VkArvrBJbsLF1qGhtWzsEWGV0jdcP4rmKDgmDbNkNj7V2QY5wMnfEolovM
 /VYl1TsRo9ZlpGxjWQUmVg78XJR30OVp87gYzs/pkKGoylcL6OoGdRHEYJ3/AfhoYwcrgcxlJ
 UE4vjcWar8WQlXmldtYUsp6kRx2Q+PXe3ZgdkAx+gKUPc9PSlRtcjB9SUW1CYvXIvVNo=
Received-SPF: none client-ip=212.227.126.130; envelope-from=laurent@vivier.eu;
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

If CONFIG_ATOMIC64, we can use a host cmpxchg and provide
atomicity across processes; otherwise we have no choice but
to continue using start/end_exclusive.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220323005839.94327-4-richard.henderson@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/arm/cpu_loop.c | 75 +++++++++++++++++++--------------------
 1 file changed, 36 insertions(+), 39 deletions(-)

diff --git a/linux-user/arm/cpu_loop.c b/linux-user/arm/cpu_loop.c
index aa2d777bf449..aae375d61792 100644
--- a/linux-user/arm/cpu_loop.c
+++ b/linux-user/arm/cpu_loop.c
@@ -138,7 +138,7 @@ static void arm_kernel_cmpxchg32_helper(CPUARMState *env)
 }
 
 /*
- * See the Linux kernel's Documentation/arm/kernel_user_helpers.txt
+ * See the Linux kernel's Documentation/arm/kernel_user_helpers.rst
  * Input:
  * r0 = pointer to oldval
  * r1 = pointer to newval
@@ -155,57 +155,54 @@ static void arm_kernel_cmpxchg64_helper(CPUARMState *env)
 {
     uint64_t oldval, newval, val;
     uint32_t addr, cpsr;
+    uint64_t *host_addr;
 
-    /* Based on the 32 bit code in do_kernel_trap */
-
-    /* XXX: This only works between threads, not between processes.
-       It's probably possible to implement this with native host
-       operations. However things like ldrex/strex are much harder so
-       there's not much point trying.  */
-    start_exclusive();
-    cpsr = cpsr_read(env);
-    addr = env->regs[2];
-
-    if (get_user_u64(oldval, env->regs[0])) {
-        env->exception.vaddress = env->regs[0];
+    addr = env->regs[0];
+    if (get_user_u64(oldval, addr)) {
         goto segv;
-    };
+    }
 
-    if (get_user_u64(newval, env->regs[1])) {
-        env->exception.vaddress = env->regs[1];
+    addr = env->regs[1];
+    if (get_user_u64(newval, addr)) {
         goto segv;
-    };
+    }
 
-    if (get_user_u64(val, addr)) {
-        env->exception.vaddress = addr;
-        goto segv;
+    mmap_lock();
+    addr = env->regs[2];
+    host_addr = atomic_mmu_lookup(env, addr, 8);
+    if (!host_addr) {
+        mmap_unlock();
+        return;
     }
 
+#ifdef CONFIG_ATOMIC64
+    val = qatomic_cmpxchg__nocheck(host_addr, oldval, newval);
+    cpsr = (val == oldval) * CPSR_C;
+#else
+    /*
+     * This only works between threads, not between processes, but since
+     * the host has no 64-bit cmpxchg, it is the best that we can do.
+     */
+    start_exclusive();
+    val = *host_addr;
     if (val == oldval) {
-        val = newval;
-
-        if (put_user_u64(val, addr)) {
-            env->exception.vaddress = addr;
-            goto segv;
-        };
-
-        env->regs[0] = 0;
-        cpsr |= CPSR_C;
+        *host_addr = newval;
+        cpsr = CPSR_C;
     } else {
-        env->regs[0] = -1;
-        cpsr &= ~CPSR_C;
+        cpsr = 0;
     }
-    cpsr_write(env, cpsr, CPSR_C, CPSRWriteByInstr);
     end_exclusive();
+#endif
+    mmap_unlock();
+
+    cpsr_write(env, cpsr, CPSR_C, CPSRWriteByInstr);
+    env->regs[0] = cpsr ? 0 : -1;
     return;
 
-segv:
-    end_exclusive();
-    /* We get the PC of the entry address - which is as good as anything,
-       on a real kernel what you get depends on which mode it uses. */
-    /* XXX: check env->error_code */
-    force_sig_fault(TARGET_SIGSEGV, TARGET_SEGV_MAPERR,
-                    env->exception.vaddress);
+ segv:
+    force_sig_fault(TARGET_SIGSEGV,
+                    page_get_flags(addr) & PAGE_VALID ?
+                    TARGET_SEGV_ACCERR : TARGET_SEGV_MAPERR, addr);
 }
 
 /* Handle a jump to the kernel code page.  */
-- 
2.35.1


