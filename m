Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D13804E4A46
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 02:01:37 +0100 (CET)
Received: from localhost ([::1]:43520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWpNY-0001Rx-IR
	for lists+qemu-devel@lfdr.de; Tue, 22 Mar 2022 21:01:36 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nWpKp-0007qY-Je
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 20:58:47 -0400
Received: from [2607:f8b0:4864:20::102c] (port=51172
 helo=mail-pj1-x102c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nWpKn-0001UU-Vb
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 20:58:47 -0400
Received: by mail-pj1-x102c.google.com with SMTP id m22so251805pja.0
 for <qemu-devel@nongnu.org>; Tue, 22 Mar 2022 17:58:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=g4ZAYkN4+Df9Z1kwRtWsg4ayeKzhHtF/+N49oTFuqzw=;
 b=vEsMXAdH7OX0Abv/pUT1w5q2HbmO2o905fuuVq4ndMj05R+xwYrXUSPPXQizWvSP5R
 3DHyPO+NZsC2688/DqkKd4DAIqTiv5kHmHmSIkd2iMTNqnxRPRYLxVviL9wOJ4Chg/VZ
 Omsrvofl1IIaACbsgsMcNRdQYHwgmuwk+FzXxxZqL01cYNKgqR9UzN/mjXKuQYKi0zWV
 adiFOOTEl+tX8SnLPCU22fjVFeDQ1l+Cqwwieo4vTR4oUp73nfvyhWhf4YZoaZNkonp4
 E1XiNW9rHpeFwylU2c6G4llD5U8GVemt/mPM74cNY4xBCBVa3sYCX8PJ7dTEwA6hTPcg
 TjIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=g4ZAYkN4+Df9Z1kwRtWsg4ayeKzhHtF/+N49oTFuqzw=;
 b=6ZRbA2I1t5C6Zveekxa9kCemaM+T/AF9NO8ziTh+l5MDwNwDS/QfBl4RHBt4+ryfcg
 3Gta/ZapF8j/royWYi2+qyMmaz01uWijI69Fk6qDBT0WQEOwRjsYjFZkhY4Dl2TrXLJ0
 kQT1junBA5vpvjhu+IFIeoVLguaH35lWjMTWIPGsKd9humDnPHUI1UsUDYhp8oIBNt/R
 +6HVAfhHkF7EqC/hH+++5R1eg7z7AoJBcpndn8n7b79Ww6rQjmu766zUUijo12I0HDYc
 WflpQVW9C5R4xCpOD04oATdM3JqIyHkto9aRToMxzFizP73bnlT4X2J0iOpmxkwBq6T8
 vWFw==
X-Gm-Message-State: AOAM530TvKQbZy0iiPdrKD4VMdE9i9xFiVU9g/fEsOrDMMHBkBwqfl2G
 feZkGLOxlPusnENeIPAh+CI6i1usKlRzsg==
X-Google-Smtp-Source: ABdhPJydSBRYWpWr3V6SHArNhUScPj/cfs6xXPk6To7xToLwoSgpE9vUX7A+QCN/vQpTCJFt8/5yfg==
X-Received: by 2002:a17:903:3051:b0:154:6fa8:2fa3 with SMTP id
 u17-20020a170903305100b001546fa82fa3mr9850229pla.129.1647997124477; 
 Tue, 22 Mar 2022 17:58:44 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 g70-20020a636b49000000b003823dd39d41sm11569167pgc.64.2022.03.22.17.58.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Mar 2022 17:58:43 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/3] linux-user/arm: Implement __kernel_cmpxchg with host
 atomics
Date: Tue, 22 Mar 2022 17:58:38 -0700
Message-Id: <20220323005839.94327-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220323005839.94327-1-richard.henderson@linaro.org>
References: <20220323005839.94327-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
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

The existing implementation using start/end_exclusive
does not provide atomicity across processes.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/arm/cpu_loop.c | 87 ++++++++++++++++++++++++++++-----------
 1 file changed, 62 insertions(+), 25 deletions(-)

diff --git a/linux-user/arm/cpu_loop.c b/linux-user/arm/cpu_loop.c
index a0e43b261c..aa2d777bf4 100644
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
2.25.1


