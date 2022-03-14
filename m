Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5B874D79FA
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Mar 2022 05:48:25 +0100 (CET)
Received: from localhost ([::1]:51332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nTcd6-0001wL-Vy
	for lists+qemu-devel@lfdr.de; Mon, 14 Mar 2022 00:48:25 -0400
Received: from eggs.gnu.org ([209.51.188.92]:50062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nTcY4-0003DD-6f
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 00:43:13 -0400
Received: from [2607:f8b0:4864:20::434] (port=37483
 helo=mail-pf1-x434.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nTcY2-0004Oo-Je
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 00:43:11 -0400
Received: by mail-pf1-x434.google.com with SMTP id t5so13230149pfg.4
 for <qemu-devel@nongnu.org>; Sun, 13 Mar 2022 21:43:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lXfB6B+XqNR5xcS/TG/PElhQ8wbvELzxHwZ/ZITikII=;
 b=VweupA+xP8WZZ+y5fvL1xPzWUC67e1jgCvXMDCoPxnp1WSvTk/hwLDTOTyCvTVWspE
 uVbj+CO1pjH5QxxpTHm2dZcUhKflHeu77kVBW68OBrpC4tNde5a8xjdyPRPOnQellKpQ
 OJnMhkw64CPe808MN6ehDYWxVF7naV4zhbiadCEjjgjEKHma3QWOdGK9C9bqaQi76ne2
 qCGfNXP9aGtOgFjAoStPBKdZe1THCrIgtotk57Ok3wlvIdd7ys8flqfY6jf6oF536c7Z
 i1C1N5p/K2SU175mM5RI6/Jn6fptxX8Wjbr3eyZqOVr8O0y3DJQ784k6/FPLizTDKLeG
 nwtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lXfB6B+XqNR5xcS/TG/PElhQ8wbvELzxHwZ/ZITikII=;
 b=wvqARGwOuOPT6sWY4u62nXbO5NAJpTQoRL5MeZgn0W9Ti+qdibpTEo6tbMjz2A193G
 9xkyLDQ4y/yNRIPuQB/XxBUlH6zoy3x5CCzep42rfs8yTJoC4nMrwW9gM8lilpAnpZ3w
 OvwZ3MrOvTz59DnWpFyzIzO0n+uR71Syui6f8a12pSTT/Z65MbDiiZPr6mE5iJeY2fg2
 5xce1P4QAbUWk6lRnYPGhg2hq9j1lrB6GfskW3u0nq1nQicQNeTDZneS+aE8R1kaImtM
 AShiviVtjf87+QpCEJKo8JC+ciQgjhGg/TFRKsEcki+AFywZxVXyPirsbrrf+OfPhZfz
 +9SA==
X-Gm-Message-State: AOAM531RxmkAb6fWTgcT5PpD1ucCV9naaN9CzCH/7stGdAvrWrwNHBg6
 5tr7TrYouJHy/VoouMgWbSHWHUL5X0HEfA==
X-Google-Smtp-Source: ABdhPJyumgCTgSWjLQbvtZzPIGtW/M/vxdlqYjNcSL5ZlnvfpWn9QPS5uYzwX4Iy/ix+++i1hPc9qg==
X-Received: by 2002:a63:2a0e:0:b0:380:aeb3:d46c with SMTP id
 q14-20020a632a0e000000b00380aeb3d46cmr18441023pgq.404.1647232988795; 
 Sun, 13 Mar 2022 21:43:08 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 l18-20020a056a00141200b004f75395b2cesm18258153pfu.150.2022.03.13.21.43.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Mar 2022 21:43:08 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/3] linux-user/arm: Implement __kernel_cmpxchg with host
 atomics
Date: Sun, 13 Mar 2022 21:43:04 -0700
Message-Id: <20220314044305.138794-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220314044305.138794-1-richard.henderson@linaro.org>
References: <20220314044305.138794-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::434
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
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
Cc: qemu-arm@nongnu.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The existing implementation using start/end_exclusive
does not provide atomicity across processes.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/arm/cpu_loop.c | 85 +++++++++++++++++++++++++++------------
 1 file changed, 60 insertions(+), 25 deletions(-)

diff --git a/linux-user/arm/cpu_loop.c b/linux-user/arm/cpu_loop.c
index a0e43b261c..0122bb34f7 100644
--- a/linux-user/arm/cpu_loop.c
+++ b/linux-user/arm/cpu_loop.c
@@ -75,7 +75,65 @@
         put_user_u16(__x, (gaddr));                     \
     })
 
-/* Commpage handling -- there is no commpage for AArch64 */
+/*
+ * Similar to code in accel/tcg/user-exec.c, but outside the execution loop.
+ * Must be called with mmap_lock.
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
+    host_addr = atomic_mmu_lookup(env, addr, 8);
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
@@ -153,36 +211,13 @@ static int
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


