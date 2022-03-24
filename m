Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2835D4E6056
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Mar 2022 09:29:01 +0100 (CET)
Received: from localhost ([::1]:41222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXIq4-0006CI-7i
	for lists+qemu-devel@lfdr.de; Thu, 24 Mar 2022 04:29:00 -0400
Received: from eggs.gnu.org ([209.51.188.92]:52248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nXIhp-0005yo-6I
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 04:20:29 -0400
Received: from mout.kundenserver.de ([212.227.126.133]:33031)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nXIhn-0003Qp-DU
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 04:20:28 -0400
Received: from quad ([82.142.12.150]) by mrelayeu.kundenserver.de (mreue011
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MYedH-1ncZtT1JD9-00VkSn; Thu, 24
 Mar 2022 09:20:24 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 09/10] linux-user/arm: Implement __kernel_cmpxchg with host
 atomics
Date: Thu, 24 Mar 2022 09:20:15 +0100
Message-Id: <20220324082016.3463521-10-laurent@vivier.eu>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220324082016.3463521-1-laurent@vivier.eu>
References: <20220324082016.3463521-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:PM1c+FKR++/Uae2Fa016VcrHdR7QtG0yRnAg9ZqGXtdGzepLS1i
 n8wsx7TAczq1BQXTqCbFGZWSnYxXpdOl90/+53ZhjD5eJAzX4q/LCEHYaBu7oj6BvuRK0lz
 Q8y4c0bAWFOBQJtGronPa1o1Tt75OETsHvsvxc6UyAyulwWhEX+5QCc13lqGhO883YgcYnB
 KRKKuFiiGN1zmH5HU/fjg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:lxw+9ObZsSc=:AWvURXGJUxCERWDAHhBQKz
 nI1NOWYymFxiWWVYZFrnV2Lq+6FXcdrbiEXlMroQY2KRLi2uYfit3Vp19+x+ZtzVLdee194OZ
 HR5WwetbKKyLNm4drU++j2DIKu9oP5yDFwQHQiGLwSaZxbCJDK1J60q/4UJxwcWLp5+spX4h6
 8EmCFWm2PAfzIyzYwa8KEdqfGIeq0LdocXxfc9Ki6sMpBFykazxtpuvBU79RfEB7tgsI0Ed6N
 ohc043DULcgr9+HbkqaVvbIjkvfV4Qd6HVBc/TkKrZKw+q9dAAjrv6Vk5PW5NJdJSSx1ybLPz
 KLr73E8X9TWm2hZbEiP/UD4m+CefYqaOEqZX+R+F+SS6DtXZaLlGeHcYKQMdEkWi/4e8jFj1E
 XfRwUB9il431aO3fS+ObxgBXIDFDvJktZ/IFI5/YSOxegDg8c5yaXjp1NuKp9K0PQRxEVEx7x
 vtVWan/fn7qgZW0HM+8KemsJmq3eQf4=
Received-SPF: none client-ip=212.227.126.133; envelope-from=laurent@vivier.eu;
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

The existing implementation using start/end_exclusive
does not provide atomicity across processes.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220323005839.94327-3-richard.henderson@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/arm/cpu_loop.c | 87 ++++++++++++++++++++++++++++-----------
 1 file changed, 62 insertions(+), 25 deletions(-)

diff --git a/linux-user/arm/cpu_loop.c b/linux-user/arm/cpu_loop.c
index a0e43b261c7b..aa2d777bf449 100644
--- a/linux-user/arm/cpu_loop.c
+++ b/linux-user/arm/cpu_loop.c
@@ -75,7 +75,67 @@
         put_user_u16(__x, (gaddr));                     \
     })
 
-/* Commpage handling -- there is no commpage for AArch64 */
+/*
+ * Similar to code in accel/tcg/user-exec.c, but outside the execution loop.
+ * Must be called with mmap_lock.
+ * We get the PC of the entry address - which is as good as anything,
+ * on a real kernel what you get depends on which mode it uses.
+ */
+static void *atomic_mmu_lookup(CPUArchState *env, uint32_t addr, int size)
+{
+    int need_flags = PAGE_READ | PAGE_WRITE_ORG | PAGE_VALID;
+    int page_flags;
+
+    /* Enforce guest required alignment.  */
+    if (unlikely(addr & (size - 1))) {
+        force_sig_fault(TARGET_SIGBUS, TARGET_BUS_ADRALN, addr);
+        return NULL;
+    }
+
+    page_flags = page_get_flags(addr);
+    if (unlikely((page_flags & need_flags) != need_flags)) {
+        force_sig_fault(TARGET_SIGSEGV,
+                        page_flags & PAGE_VALID ?
+                        TARGET_SEGV_ACCERR : TARGET_SEGV_MAPERR, addr);
+        return NULL;
+    }
+
+    return g2h(env_cpu(env), addr);
+}
+
+/*
+ * See the Linux kernel's Documentation/arm/kernel_user_helpers.rst
+ * Input:
+ * r0 = oldval
+ * r1 = newval
+ * r2 = pointer to target value
+ *
+ * Output:
+ * r0 = 0 if *ptr was changed, non-0 if no exchange happened
+ * C set if *ptr was changed, clear if no exchange happened
+ */
+static void arm_kernel_cmpxchg32_helper(CPUARMState *env)
+{
+    uint32_t oldval, newval, val, addr, cpsr, *host_addr;
+
+    oldval = env->regs[0];
+    newval = env->regs[1];
+    addr = env->regs[2];
+
+    mmap_lock();
+    host_addr = atomic_mmu_lookup(env, addr, 4);
+    if (!host_addr) {
+        mmap_unlock();
+        return;
+    }
+
+    val = qatomic_cmpxchg__nocheck(host_addr, oldval, newval);
+    mmap_unlock();
+
+    cpsr = (val == oldval) * CPSR_C;
+    cpsr_write(env, cpsr, CPSR_C, CPSRWriteByInstr);
+    env->regs[0] = cpsr ? 0 : -1;
+}
 
 /*
  * See the Linux kernel's Documentation/arm/kernel_user_helpers.txt
@@ -153,36 +213,13 @@ static int
 do_kernel_trap(CPUARMState *env)
 {
     uint32_t addr;
-    uint32_t cpsr;
-    uint32_t val;
 
     switch (env->regs[15]) {
     case 0xffff0fa0: /* __kernel_memory_barrier */
         smp_mb();
         break;
     case 0xffff0fc0: /* __kernel_cmpxchg */
-         /* XXX: This only works between threads, not between processes.
-            It's probably possible to implement this with native host
-            operations. However things like ldrex/strex are much harder so
-            there's not much point trying.  */
-        start_exclusive();
-        cpsr = cpsr_read(env);
-        addr = env->regs[2];
-        /* FIXME: This should SEGV if the access fails.  */
-        if (get_user_u32(val, addr))
-            val = ~env->regs[0];
-        if (val == env->regs[0]) {
-            val = env->regs[1];
-            /* FIXME: Check for segfaults.  */
-            put_user_u32(val, addr);
-            env->regs[0] = 0;
-            cpsr |= CPSR_C;
-        } else {
-            env->regs[0] = -1;
-            cpsr &= ~CPSR_C;
-        }
-        cpsr_write(env, cpsr, CPSR_C, CPSRWriteByInstr);
-        end_exclusive();
+        arm_kernel_cmpxchg32_helper(env);
         break;
     case 0xffff0fe0: /* __kernel_get_tls */
         env->regs[0] = cpu_get_tls(env);
-- 
2.35.1


