Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD9DA4E4A4B
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 02:04:48 +0100 (CET)
Received: from localhost ([::1]:49552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWpQd-0005dT-R1
	for lists+qemu-devel@lfdr.de; Tue, 22 Mar 2022 21:04:47 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nWpKr-0007s0-1Z
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 20:58:49 -0400
Received: from [2607:f8b0:4864:20::529] (port=44749
 helo=mail-pg1-x529.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nWpKp-0001Un-Dm
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 20:58:48 -0400
Received: by mail-pg1-x529.google.com with SMTP id c11so13815770pgu.11
 for <qemu-devel@nongnu.org>; Tue, 22 Mar 2022 17:58:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EAopWqbVIHUB/SJc8DJm/9zhocJ0OwWkN+8ZoF29nMQ=;
 b=S5WsksFhqDUPx9yznbOTPTUdj7o8RlAGIgVaR0ZVHUPDJDrnGC3e6kJjwBTt4PYmvt
 AAqeK8cL4n+97CeucCslTMHmgoqWU3whTY77emq+1EOBe9N6NEhQX70Tc/FP7YlmJvFP
 w7dEHIHXaP6xpqD05ac6k+yZbNzTmnoiiCP42+O8T3wpBfKhXcLtHZ3VKWGj3+oFPWmS
 oEdFDNn+5FGPhUOFHqwzlUO+PzK7cR35sCflsnNnINFo4Wqn8iITjFv8PI8YFfL9HLcO
 cFoqft5UwNy4fy18uIoteNPchXvMKSz7jlsZ8c9QirG34S4+0GMXN3xW0gb3t1vurrg1
 znsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EAopWqbVIHUB/SJc8DJm/9zhocJ0OwWkN+8ZoF29nMQ=;
 b=0/WDtdz0iHVJDUl8S/9nFrF5vPR5OB7fhLfAruf1xRmy194muAp8EzOMMd3keypPwY
 dcPlh4g8/GI6rE5vgxPucuqt2hRsUQ4WwI9ldO5EGpft95skXA1pGD89nsbJdkbaorHw
 YQlrAtnjQkBjK/AP4ul4RWQtDBKMtXiL/HVcchc0SB3TG5QFdHuhChsCtmSVylo/s02G
 YbMU1q46wIlw4tP3XIOMPHLOJDYsTcjbi0Vzf65k2xI8pC7xP4NpE+1lZcNvu8MlIZCk
 J039eI7Iw0vw+vlBq0XUxHB58JjwL/vTACHssw82LSxL8Pz2+NciM6rJw4nfWnoIVnNb
 nQcw==
X-Gm-Message-State: AOAM533e62FHfOOYe9CLY1ZtLGIbMg6vYO4xDNtb23bOH16enjrK18t/
 HLn+BKTKCtgtSr6ZMwRuUo+al5ZM8jd/vQ==
X-Google-Smtp-Source: ABdhPJwVl22MbPbjvmbgtSnzYPzr4B9JniU03M4RylK5dsKcg7m7qbljgyvbhktg5Xpl/U1XPzzX6w==
X-Received: by 2002:a63:1459:0:b0:381:7672:e79f with SMTP id
 25-20020a631459000000b003817672e79fmr24116671pgu.214.1647997125799; 
 Tue, 22 Mar 2022 17:58:45 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 g70-20020a636b49000000b003823dd39d41sm11569167pgc.64.2022.03.22.17.58.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Mar 2022 17:58:45 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 3/3] linux-user/arm: Implement __kernel_cmpxchg64 with host
 atomics
Date: Tue, 22 Mar 2022 17:58:39 -0700
Message-Id: <20220323005839.94327-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220323005839.94327-1-richard.henderson@linaro.org>
References: <20220323005839.94327-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::529
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If CONFIG_ATOMIC64, we can use a host cmpxchg and provide
atomicity across processes; otherwise we have no choice but
to continue using start/end_exclusive.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/arm/cpu_loop.c | 79 +++++++++++++++++++--------------------
 1 file changed, 38 insertions(+), 41 deletions(-)

diff --git a/linux-user/arm/cpu_loop.c b/linux-user/arm/cpu_loop.c
index aa2d777bf4..aae375d617 100644
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
+    addr = env->regs[0];
+    if (get_user_u64(oldval, addr)) {
+        goto segv;
+    }
 
-    /* XXX: This only works between threads, not between processes.
-       It's probably possible to implement this with native host
-       operations. However things like ldrex/strex are much harder so
-       there's not much point trying.  */
-    start_exclusive();
-    cpsr = cpsr_read(env);
+    addr = env->regs[1];
+    if (get_user_u64(newval, addr)) {
+        goto segv;
+    }
+
+    mmap_lock();
     addr = env->regs[2];
-
-    if (get_user_u64(oldval, env->regs[0])) {
-        env->exception.vaddress = env->regs[0];
-        goto segv;
-    };
-
-    if (get_user_u64(newval, env->regs[1])) {
-        env->exception.vaddress = env->regs[1];
-        goto segv;
-    };
-
-    if (get_user_u64(val, addr)) {
-        env->exception.vaddress = addr;
-        goto segv;
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
2.25.1


