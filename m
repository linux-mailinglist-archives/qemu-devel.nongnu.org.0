Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF3E75107D0
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 21:01:06 +0200 (CEST)
Received: from localhost ([::1]:55520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njQQr-0002du-Qk
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 15:01:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njPmf-0002fw-Pa
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 14:19:36 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:43923)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njPmc-0004QZ-Fg
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 14:19:33 -0400
Received: by mail-pf1-x42f.google.com with SMTP id y14so17926064pfe.10
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 11:19:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xcpq8OTysx50Lw5Wv3QQ4NLDXZZZLcnn9tCqlnHYPYo=;
 b=nbSizCFt0dIMav4czkO6tyymHxwOgmhHvnDjepjZY2oYQ0VyUa3sEIGkIMdDYoDGki
 SJrr7PD9m+RenS5xrudEuzRoo0+V1c9lDLJdMiupHqVNgiBkL5WM1Lqtr0Mx9Z6+/xlE
 KgsZGF9ButEGxAqh8LL1N/cfK43ILAEl22BDktGOQmepyWaVUORpZft+bpu3h++clmCG
 WomUtrcwAenhAakt3etSSn878wsHkwNtPhiMYm78rRq3Tgx8qSGvf7SJAZcGipXsSKyi
 fCL51N6yY1iSM/n/SDzss+RoGaFol6q3KNO5Yva1e9BS4bvvAn7iYGjwLMHTTMArd7A7
 zT7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xcpq8OTysx50Lw5Wv3QQ4NLDXZZZLcnn9tCqlnHYPYo=;
 b=h0E+QkOKvuuKdcmOhkmSYorwqWu5pjO3YoSjqnnaMYHloWWxdvIz2wBfk6KGxJPXQ0
 vhYYjggM1N6B4OHDmQ+CqPkLXTi9rKHmOw1D8gzehS3oKmuLpdFhfvu0z8H/cP5AC5tx
 uCvKtI7ftdzPgrUFcym39Pf99HGgS9dyuYl7Qim/y0xnKUhAdEeCygehtbhS4QOJasCx
 utnBQil4T/RTocHmUAQo7XvuO52uTF2GJa846tXR20YZ0FG+wbP7Ca2CX5/sytR2tFJk
 +k65n33fkJSnSD1inVony4l4QwQ+Tsxc2PEM6MaR+o9jYQZ+Z4GBnpl9u9VS9m13uJDP
 2c1w==
X-Gm-Message-State: AOAM531aWs7DXUUX6TFOReEW1XU/iBXnQljLU1z0qyQwv4Y3oB8APXMX
 5mMaal6CVrWFy0sv7QAjVN6Nw10+uCcK7Q==
X-Google-Smtp-Source: ABdhPJxQYhEng8YunEeSPnuYxl9jkbUsHAsEWGTf19fcQDhtC2LQRIIw4l+7eTdBle+Hm1JmCnszDA==
X-Received: by 2002:a05:6a00:14d2:b0:50d:4871:3635 with SMTP id
 w18-20020a056a0014d200b0050d48713635mr8757606pfu.72.1650997168392; 
 Tue, 26 Apr 2022 11:19:28 -0700 (PDT)
Received: from stoup.. (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 j7-20020a056a00130700b004b9f7cd94a4sm16482827pfu.56.2022.04.26.11.19.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 11:19:28 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 22/68] target/nios2: Split control registers away from general
 registers
Date: Tue, 26 Apr 2022 11:18:21 -0700
Message-Id: <20220426181907.103691-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220426181907.103691-1-richard.henderson@linaro.org>
References: <20220426181907.103691-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Place the control registers into their own array, env->ctrl[].

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220421151735.31996-23-richard.henderson@linaro.org>
---
 target/nios2/cpu.h       |  43 ++++++++--------
 target/nios2/cpu.c       |  19 +++----
 target/nios2/helper.c    | 106 +++++++++++++++++++--------------------
 target/nios2/mmu.c       |  26 +++++-----
 target/nios2/op_helper.c |   2 +-
 target/nios2/translate.c |  35 +++++++------
 6 files changed, 118 insertions(+), 113 deletions(-)

diff --git a/target/nios2/cpu.h b/target/nios2/cpu.h
index 6bd8367eb8..68ff8033b6 100644
--- a/target/nios2/cpu.h
+++ b/target/nios2/cpu.h
@@ -59,9 +59,6 @@ struct Nios2CPUClass {
 #define NUM_GP_REGS 32
 #define NUM_CR_REGS 32
 
-/* GP regs + CR regs */
-#define NUM_CORE_REGS (NUM_GP_REGS + NUM_CR_REGS)
-
 /* General purpose register aliases */
 #define R_ZERO   0
 #define R_AT     1
@@ -81,8 +78,7 @@ struct Nios2CPUClass {
 #define R_RA     31
 
 /* Control register aliases */
-#define CR_BASE  NUM_GP_REGS
-#define CR_STATUS    (CR_BASE + 0)
+#define CR_STATUS        0
 #define   CR_STATUS_PIE  (1 << 0)
 #define   CR_STATUS_U    (1 << 1)
 #define   CR_STATUS_EH   (1 << 2)
@@ -92,19 +88,19 @@ struct Nios2CPUClass {
 #define   CR_STATUS_PRS  (63 << 16)
 #define   CR_STATUS_NMI  (1 << 22)
 #define   CR_STATUS_RSIE (1 << 23)
-#define CR_ESTATUS   (CR_BASE + 1)
-#define CR_BSTATUS   (CR_BASE + 2)
-#define CR_IENABLE   (CR_BASE + 3)
-#define CR_IPENDING  (CR_BASE + 4)
-#define CR_CPUID     (CR_BASE + 5)
-#define CR_CTL6      (CR_BASE + 6)
-#define CR_EXCEPTION (CR_BASE + 7)
-#define CR_PTEADDR   (CR_BASE + 8)
+#define CR_ESTATUS       1
+#define CR_BSTATUS       2
+#define CR_IENABLE       3
+#define CR_IPENDING      4
+#define CR_CPUID         5
+#define CR_CTL6          6
+#define CR_EXCEPTION     7
+#define CR_PTEADDR       8
 #define   CR_PTEADDR_PTBASE_SHIFT 22
 #define   CR_PTEADDR_PTBASE_MASK  (0x3FF << CR_PTEADDR_PTBASE_SHIFT)
 #define   CR_PTEADDR_VPN_SHIFT    2
 #define   CR_PTEADDR_VPN_MASK     (0xFFFFF << CR_PTEADDR_VPN_SHIFT)
-#define CR_TLBACC    (CR_BASE + 9)
+#define CR_TLBACC        9
 #define   CR_TLBACC_IGN_SHIFT 25
 #define   CR_TLBACC_IGN_MASK  (0x7F << CR_TLBACC_IGN_SHIFT)
 #define   CR_TLBACC_C         (1 << 24)
@@ -113,7 +109,7 @@ struct Nios2CPUClass {
 #define   CR_TLBACC_X         (1 << 21)
 #define   CR_TLBACC_G         (1 << 20)
 #define   CR_TLBACC_PFN_MASK  0x000FFFFF
-#define CR_TLBMISC   (CR_BASE + 10)
+#define CR_TLBMISC       10
 #define   CR_TLBMISC_WAY_SHIFT 20
 #define   CR_TLBMISC_WAY_MASK  (0xF << CR_TLBMISC_WAY_SHIFT)
 #define   CR_TLBMISC_RD        (1 << 19)
@@ -124,11 +120,11 @@ struct Nios2CPUClass {
 #define   CR_TLBMISC_BAD       (1 << 2)
 #define   CR_TLBMISC_PERM      (1 << 1)
 #define   CR_TLBMISC_D         (1 << 0)
-#define CR_ENCINJ    (CR_BASE + 11)
-#define CR_BADADDR   (CR_BASE + 12)
-#define CR_CONFIG    (CR_BASE + 13)
-#define CR_MPUBASE   (CR_BASE + 14)
-#define CR_MPUACC    (CR_BASE + 15)
+#define CR_ENCINJ        11
+#define CR_BADADDR       12
+#define CR_CONFIG        13
+#define CR_MPUBASE       14
+#define CR_MPUACC        15
 
 /* Exceptions */
 #define EXCP_BREAK    0x1000
@@ -154,7 +150,8 @@ struct Nios2CPUClass {
 #define CPU_INTERRUPT_NMI       CPU_INTERRUPT_TGT_EXT_3
 
 struct CPUArchState {
-    uint32_t regs[NUM_CORE_REGS];
+    uint32_t regs[NUM_GP_REGS];
+    uint32_t ctrl[NUM_CR_REGS];
     uint32_t pc;
 
 #if !defined(CONFIG_USER_ONLY)
@@ -212,7 +209,7 @@ void do_nios2_semihosting(CPUNios2State *env);
 
 static inline int cpu_mmu_index(CPUNios2State *env, bool ifetch)
 {
-    return (env->regs[CR_STATUS] & CR_STATUS_U) ? MMU_USER_IDX :
+    return (env->ctrl[CR_STATUS] & CR_STATUS_U) ? MMU_USER_IDX :
                                                   MMU_SUPERVISOR_IDX;
 }
 
@@ -232,7 +229,7 @@ static inline void cpu_get_tb_cpu_state(CPUNios2State *env, target_ulong *pc,
 {
     *pc = env->pc;
     *cs_base = 0;
-    *flags = (env->regs[CR_STATUS] & (CR_STATUS_EH | CR_STATUS_U));
+    *flags = env->ctrl[CR_STATUS] & (CR_STATUS_EH | CR_STATUS_U);
 }
 
 #endif /* NIOS2_CPU_H */
diff --git a/target/nios2/cpu.c b/target/nios2/cpu.c
index dc1551241e..fce16a2e77 100644
--- a/target/nios2/cpu.c
+++ b/target/nios2/cpu.c
@@ -48,14 +48,15 @@ static void nios2_cpu_reset(DeviceState *dev)
 
     ncc->parent_reset(dev);
 
-    memset(env->regs, 0, sizeof(uint32_t) * NUM_CORE_REGS);
+    memset(env->regs, 0, sizeof(env->regs));
+    memset(env->ctrl, 0, sizeof(env->ctrl));
     env->pc = cpu->reset_addr;
 
 #if defined(CONFIG_USER_ONLY)
     /* Start in user mode with interrupts enabled. */
-    env->regs[CR_STATUS] = CR_STATUS_U | CR_STATUS_PIE;
+    env->ctrl[CR_STATUS] = CR_STATUS_U | CR_STATUS_PIE;
 #else
-    env->regs[CR_STATUS] = 0;
+    env->ctrl[CR_STATUS] = 0;
 #endif
 }
 
@@ -66,9 +67,9 @@ static void nios2_cpu_set_irq(void *opaque, int irq, int level)
     CPUNios2State *env = &cpu->env;
     CPUState *cs = CPU(cpu);
 
-    env->regs[CR_IPENDING] = deposit32(env->regs[CR_IPENDING], irq, 1, !!level);
+    env->ctrl[CR_IPENDING] = deposit32(env->ctrl[CR_IPENDING], irq, 1, !!level);
 
-    if (env->regs[CR_IPENDING]) {
+    if (env->ctrl[CR_IPENDING]) {
         cpu_interrupt(cs, CPU_INTERRUPT_HARD);
     } else {
         cpu_reset_interrupt(cs, CPU_INTERRUPT_HARD);
@@ -126,8 +127,8 @@ static bool nios2_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
     CPUNios2State *env = &cpu->env;
 
     if ((interrupt_request & CPU_INTERRUPT_HARD) &&
-        (env->regs[CR_STATUS] & CR_STATUS_PIE) &&
-        (env->regs[CR_IPENDING] & env->regs[CR_IENABLE])) {
+        (env->ctrl[CR_STATUS] & CR_STATUS_PIE) &&
+        (env->ctrl[CR_IPENDING] & env->ctrl[CR_IENABLE])) {
         cs->exception_index = EXCP_IRQ;
         nios2_cpu_do_interrupt(cs);
         return true;
@@ -158,7 +159,7 @@ static int nios2_cpu_gdb_read_register(CPUState *cs, GByteArray *mem_buf, int n)
     } else if (n == 32) {    /* PC */
         return gdb_get_reg32(mem_buf, env->pc);
     } else if (n < 49) {     /* Status regs */
-        return gdb_get_reg32(mem_buf, env->regs[n - 1]);
+        return gdb_get_reg32(mem_buf, env->ctrl[n - 33]);
     }
 
     /* Invalid regs */
@@ -180,7 +181,7 @@ static int nios2_cpu_gdb_write_register(CPUState *cs, uint8_t *mem_buf, int n)
     } else if (n == 32) {    /* PC */
         env->pc = ldl_p(mem_buf);
     } else if (n < 49) {     /* Status regs */
-        env->regs[n - 1] = ldl_p(mem_buf);
+        env->ctrl[n - 33] = ldl_p(mem_buf);
     }
 
     return 4;
diff --git a/target/nios2/helper.c b/target/nios2/helper.c
index 34b3e18e37..2e5f5b8b54 100644
--- a/target/nios2/helper.c
+++ b/target/nios2/helper.c
@@ -36,38 +36,38 @@ void nios2_cpu_do_interrupt(CPUState *cs)
 
     switch (cs->exception_index) {
     case EXCP_IRQ:
-        assert(env->regs[CR_STATUS] & CR_STATUS_PIE);
+        assert(env->ctrl[CR_STATUS] & CR_STATUS_PIE);
 
         qemu_log_mask(CPU_LOG_INT, "interrupt at pc=%x\n", env->pc);
 
-        env->regs[CR_ESTATUS] = env->regs[CR_STATUS];
-        env->regs[CR_STATUS] |= CR_STATUS_IH;
-        env->regs[CR_STATUS] &= ~(CR_STATUS_PIE | CR_STATUS_U);
+        env->ctrl[CR_ESTATUS] = env->ctrl[CR_STATUS];
+        env->ctrl[CR_STATUS] |= CR_STATUS_IH;
+        env->ctrl[CR_STATUS] &= ~(CR_STATUS_PIE | CR_STATUS_U);
 
-        env->regs[CR_EXCEPTION] &= ~(0x1F << 2);
-        env->regs[CR_EXCEPTION] |= (cs->exception_index & 0x1F) << 2;
+        env->ctrl[CR_EXCEPTION] &= ~(0x1F << 2);
+        env->ctrl[CR_EXCEPTION] |= (cs->exception_index & 0x1F) << 2;
 
         env->regs[R_EA] = env->pc + 4;
         env->pc = cpu->exception_addr;
         break;
 
     case EXCP_TLBD:
-        if ((env->regs[CR_STATUS] & CR_STATUS_EH) == 0) {
+        if ((env->ctrl[CR_STATUS] & CR_STATUS_EH) == 0) {
             qemu_log_mask(CPU_LOG_INT, "TLB MISS (fast) at pc=%x\n", env->pc);
 
             /* Fast TLB miss */
             /* Variation from the spec. Table 3-35 of the cpu reference shows
              * estatus not being changed for TLB miss but this appears to
              * be incorrect. */
-            env->regs[CR_ESTATUS] = env->regs[CR_STATUS];
-            env->regs[CR_STATUS] |= CR_STATUS_EH;
-            env->regs[CR_STATUS] &= ~(CR_STATUS_PIE | CR_STATUS_U);
+            env->ctrl[CR_ESTATUS] = env->ctrl[CR_STATUS];
+            env->ctrl[CR_STATUS] |= CR_STATUS_EH;
+            env->ctrl[CR_STATUS] &= ~(CR_STATUS_PIE | CR_STATUS_U);
 
-            env->regs[CR_EXCEPTION] &= ~(0x1F << 2);
-            env->regs[CR_EXCEPTION] |= (cs->exception_index & 0x1F) << 2;
+            env->ctrl[CR_EXCEPTION] &= ~(0x1F << 2);
+            env->ctrl[CR_EXCEPTION] |= (cs->exception_index & 0x1F) << 2;
 
-            env->regs[CR_TLBMISC] &= ~CR_TLBMISC_DBL;
-            env->regs[CR_TLBMISC] |= CR_TLBMISC_WR;
+            env->ctrl[CR_TLBMISC] &= ~CR_TLBMISC_DBL;
+            env->ctrl[CR_TLBMISC] |= CR_TLBMISC_WR;
 
             env->regs[R_EA] = env->pc + 4;
             env->pc = cpu->fast_tlb_miss_addr;
@@ -75,13 +75,13 @@ void nios2_cpu_do_interrupt(CPUState *cs)
             qemu_log_mask(CPU_LOG_INT, "TLB MISS (double) at pc=%x\n", env->pc);
 
             /* Double TLB miss */
-            env->regs[CR_STATUS] |= CR_STATUS_EH;
-            env->regs[CR_STATUS] &= ~(CR_STATUS_PIE | CR_STATUS_U);
+            env->ctrl[CR_STATUS] |= CR_STATUS_EH;
+            env->ctrl[CR_STATUS] &= ~(CR_STATUS_PIE | CR_STATUS_U);
 
-            env->regs[CR_EXCEPTION] &= ~(0x1F << 2);
-            env->regs[CR_EXCEPTION] |= (cs->exception_index & 0x1F) << 2;
+            env->ctrl[CR_EXCEPTION] &= ~(0x1F << 2);
+            env->ctrl[CR_EXCEPTION] |= (cs->exception_index & 0x1F) << 2;
 
-            env->regs[CR_TLBMISC] |= CR_TLBMISC_DBL;
+            env->ctrl[CR_TLBMISC] |= CR_TLBMISC_DBL;
 
             env->pc = cpu->exception_addr;
         }
@@ -92,15 +92,15 @@ void nios2_cpu_do_interrupt(CPUState *cs)
     case EXCP_TLBX:
         qemu_log_mask(CPU_LOG_INT, "TLB PERM at pc=%x\n", env->pc);
 
-        env->regs[CR_ESTATUS] = env->regs[CR_STATUS];
-        env->regs[CR_STATUS] |= CR_STATUS_EH;
-        env->regs[CR_STATUS] &= ~(CR_STATUS_PIE | CR_STATUS_U);
+        env->ctrl[CR_ESTATUS] = env->ctrl[CR_STATUS];
+        env->ctrl[CR_STATUS] |= CR_STATUS_EH;
+        env->ctrl[CR_STATUS] &= ~(CR_STATUS_PIE | CR_STATUS_U);
 
-        env->regs[CR_EXCEPTION] &= ~(0x1F << 2);
-        env->regs[CR_EXCEPTION] |= (cs->exception_index & 0x1F) << 2;
+        env->ctrl[CR_EXCEPTION] &= ~(0x1F << 2);
+        env->ctrl[CR_EXCEPTION] |= (cs->exception_index & 0x1F) << 2;
 
-        if ((env->regs[CR_STATUS] & CR_STATUS_EH) == 0) {
-            env->regs[CR_TLBMISC] |= CR_TLBMISC_WR;
+        if ((env->ctrl[CR_STATUS] & CR_STATUS_EH) == 0) {
+            env->ctrl[CR_TLBMISC] |= CR_TLBMISC_WR;
         }
 
         env->regs[R_EA] = env->pc + 4;
@@ -112,16 +112,16 @@ void nios2_cpu_do_interrupt(CPUState *cs)
     case EXCP_SUPERD:
         qemu_log_mask(CPU_LOG_INT, "SUPERVISOR exception at pc=%x\n", env->pc);
 
-        if ((env->regs[CR_STATUS] & CR_STATUS_EH) == 0) {
-            env->regs[CR_ESTATUS] = env->regs[CR_STATUS];
+        if ((env->ctrl[CR_STATUS] & CR_STATUS_EH) == 0) {
+            env->ctrl[CR_ESTATUS] = env->ctrl[CR_STATUS];
             env->regs[R_EA] = env->pc + 4;
         }
 
-        env->regs[CR_STATUS] |= CR_STATUS_EH;
-        env->regs[CR_STATUS] &= ~(CR_STATUS_PIE | CR_STATUS_U);
+        env->ctrl[CR_STATUS] |= CR_STATUS_EH;
+        env->ctrl[CR_STATUS] &= ~(CR_STATUS_PIE | CR_STATUS_U);
 
-        env->regs[CR_EXCEPTION] &= ~(0x1F << 2);
-        env->regs[CR_EXCEPTION] |= (cs->exception_index & 0x1F) << 2;
+        env->ctrl[CR_EXCEPTION] &= ~(0x1F << 2);
+        env->ctrl[CR_EXCEPTION] |= (cs->exception_index & 0x1F) << 2;
 
         env->pc = cpu->exception_addr;
         break;
@@ -130,16 +130,16 @@ void nios2_cpu_do_interrupt(CPUState *cs)
     case EXCP_TRAP:
         qemu_log_mask(CPU_LOG_INT, "TRAP exception at pc=%x\n", env->pc);
 
-        if ((env->regs[CR_STATUS] & CR_STATUS_EH) == 0) {
-            env->regs[CR_ESTATUS] = env->regs[CR_STATUS];
+        if ((env->ctrl[CR_STATUS] & CR_STATUS_EH) == 0) {
+            env->ctrl[CR_ESTATUS] = env->ctrl[CR_STATUS];
             env->regs[R_EA] = env->pc + 4;
         }
 
-        env->regs[CR_STATUS] |= CR_STATUS_EH;
-        env->regs[CR_STATUS] &= ~(CR_STATUS_PIE | CR_STATUS_U);
+        env->ctrl[CR_STATUS] |= CR_STATUS_EH;
+        env->ctrl[CR_STATUS] &= ~(CR_STATUS_PIE | CR_STATUS_U);
 
-        env->regs[CR_EXCEPTION] &= ~(0x1F << 2);
-        env->regs[CR_EXCEPTION] |= (cs->exception_index & 0x1F) << 2;
+        env->ctrl[CR_EXCEPTION] &= ~(0x1F << 2);
+        env->ctrl[CR_EXCEPTION] |= (cs->exception_index & 0x1F) << 2;
 
         env->pc = cpu->exception_addr;
         break;
@@ -155,16 +155,16 @@ void nios2_cpu_do_interrupt(CPUState *cs)
             break;
         }
 
-        if ((env->regs[CR_STATUS] & CR_STATUS_EH) == 0) {
-            env->regs[CR_BSTATUS] = env->regs[CR_STATUS];
+        if ((env->ctrl[CR_STATUS] & CR_STATUS_EH) == 0) {
+            env->ctrl[CR_BSTATUS] = env->ctrl[CR_STATUS];
             env->regs[R_BA] = env->pc + 4;
         }
 
-        env->regs[CR_STATUS] |= CR_STATUS_EH;
-        env->regs[CR_STATUS] &= ~(CR_STATUS_PIE | CR_STATUS_U);
+        env->ctrl[CR_STATUS] |= CR_STATUS_EH;
+        env->ctrl[CR_STATUS] &= ~(CR_STATUS_PIE | CR_STATUS_U);
 
-        env->regs[CR_EXCEPTION] &= ~(0x1F << 2);
-        env->regs[CR_EXCEPTION] |= (cs->exception_index & 0x1F) << 2;
+        env->ctrl[CR_EXCEPTION] &= ~(0x1F << 2);
+        env->ctrl[CR_EXCEPTION] |= (cs->exception_index & 0x1F) << 2;
 
         env->pc = cpu->exception_addr;
         break;
@@ -207,8 +207,8 @@ void nios2_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
     Nios2CPU *cpu = NIOS2_CPU(cs);
     CPUNios2State *env = &cpu->env;
 
-    env->regs[CR_BADADDR] = addr;
-    env->regs[CR_EXCEPTION] = EXCP_UNALIGN << 2;
+    env->ctrl[CR_BADADDR] = addr;
+    env->ctrl[CR_EXCEPTION] = EXCP_UNALIGN << 2;
     helper_raise_exception(env, EXCP_UNALIGN);
 }
 
@@ -246,7 +246,7 @@ bool nios2_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
                 return false;
             }
             cs->exception_index = EXCP_SUPERA;
-            env->regs[CR_BADADDR] = address;
+            env->ctrl[CR_BADADDR] = address;
             cpu_loop_exit_restore(cs, retaddr);
         }
     }
@@ -275,15 +275,15 @@ bool nios2_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
     }
 
     if (access_type == MMU_INST_FETCH) {
-        env->regs[CR_TLBMISC] &= ~CR_TLBMISC_D;
+        env->ctrl[CR_TLBMISC] &= ~CR_TLBMISC_D;
     } else {
-        env->regs[CR_TLBMISC] |= CR_TLBMISC_D;
+        env->ctrl[CR_TLBMISC] |= CR_TLBMISC_D;
     }
-    env->regs[CR_PTEADDR] &= CR_PTEADDR_PTBASE_MASK;
-    env->regs[CR_PTEADDR] |= (address >> 10) & CR_PTEADDR_VPN_MASK;
-    env->mmu.pteaddr_wr = env->regs[CR_PTEADDR];
+    env->ctrl[CR_PTEADDR] &= CR_PTEADDR_PTBASE_MASK;
+    env->ctrl[CR_PTEADDR] |= (address >> 10) & CR_PTEADDR_VPN_MASK;
+    env->mmu.pteaddr_wr = env->ctrl[CR_PTEADDR];
 
     cs->exception_index = excp;
-    env->regs[CR_BADADDR] = address;
+    env->ctrl[CR_BADADDR] = address;
     cpu_loop_exit_restore(cs, retaddr);
 }
diff --git a/target/nios2/mmu.c b/target/nios2/mmu.c
index 4daab2a7ab..95900724e8 100644
--- a/target/nios2/mmu.c
+++ b/target/nios2/mmu.c
@@ -95,8 +95,8 @@ void helper_mmu_write_tlbacc(CPUNios2State *env, uint32_t v)
                                  v & CR_TLBACC_PFN_MASK);
 
     /* if tlbmisc.WE == 1 then trigger a TLB write on writes to TLBACC */
-    if (env->regs[CR_TLBMISC] & CR_TLBMISC_WR) {
-        int way = (env->regs[CR_TLBMISC] >> CR_TLBMISC_WAY_SHIFT);
+    if (env->ctrl[CR_TLBMISC] & CR_TLBMISC_WR) {
+        int way = (env->ctrl[CR_TLBMISC] >> CR_TLBMISC_WAY_SHIFT);
         int vpn = (env->mmu.pteaddr_wr & CR_PTEADDR_VPN_MASK) >> 2;
         int pid = (env->mmu.tlbmisc_wr & CR_TLBMISC_PID_MASK) >> 4;
         int g = (v & CR_TLBACC_G) ? 1 : 0;
@@ -117,8 +117,8 @@ void helper_mmu_write_tlbacc(CPUNios2State *env, uint32_t v)
             entry->data = newData;
         }
         /* Auto-increment tlbmisc.WAY */
-        env->regs[CR_TLBMISC] =
-            (env->regs[CR_TLBMISC] & ~CR_TLBMISC_WAY_MASK) |
+        env->ctrl[CR_TLBMISC] =
+            (env->ctrl[CR_TLBMISC] & ~CR_TLBMISC_WAY_MASK) |
             (((way + 1) & (cpu->tlb_num_ways - 1)) <<
              CR_TLBMISC_WAY_SHIFT);
     }
@@ -153,17 +153,17 @@ void helper_mmu_write_tlbmisc(CPUNios2State *env, uint32_t v)
             &env->mmu.tlb[(way * cpu->tlb_num_ways) +
                           (vpn & env->mmu.tlb_entry_mask)];
 
-        env->regs[CR_TLBACC] &= CR_TLBACC_IGN_MASK;
-        env->regs[CR_TLBACC] |= entry->data;
-        env->regs[CR_TLBACC] |= (entry->tag & (1 << 11)) ? CR_TLBACC_G : 0;
-        env->regs[CR_TLBMISC] =
+        env->ctrl[CR_TLBACC] &= CR_TLBACC_IGN_MASK;
+        env->ctrl[CR_TLBACC] |= entry->data;
+        env->ctrl[CR_TLBACC] |= (entry->tag & (1 << 11)) ? CR_TLBACC_G : 0;
+        env->ctrl[CR_TLBMISC] =
             (v & ~CR_TLBMISC_PID_MASK) |
             ((entry->tag & ((1 << cpu->pid_num_bits) - 1)) <<
              CR_TLBMISC_PID_SHIFT);
-        env->regs[CR_PTEADDR] &= ~CR_PTEADDR_VPN_MASK;
-        env->regs[CR_PTEADDR] |= (entry->tag >> 12) << CR_PTEADDR_VPN_SHIFT;
+        env->ctrl[CR_PTEADDR] &= ~CR_PTEADDR_VPN_MASK;
+        env->ctrl[CR_PTEADDR] |= (entry->tag >> 12) << CR_PTEADDR_VPN_SHIFT;
     } else {
-        env->regs[CR_TLBMISC] = v;
+        env->ctrl[CR_TLBMISC] = v;
     }
 
     env->mmu.tlbmisc_wr = v;
@@ -175,8 +175,8 @@ void helper_mmu_write_pteaddr(CPUNios2State *env, uint32_t v)
                                   (v & CR_PTEADDR_VPN_MASK) >> CR_PTEADDR_VPN_SHIFT);
 
     /* Writes to PTEADDR don't change the read-back VPN value */
-    env->regs[CR_PTEADDR] = (v & ~CR_PTEADDR_VPN_MASK) |
-                            (env->regs[CR_PTEADDR] & CR_PTEADDR_VPN_MASK);
+    env->ctrl[CR_PTEADDR] = ((v & ~CR_PTEADDR_VPN_MASK) |
+                             (env->ctrl[CR_PTEADDR] & CR_PTEADDR_VPN_MASK));
     env->mmu.pteaddr_wr = v;
 }
 
diff --git a/target/nios2/op_helper.c b/target/nios2/op_helper.c
index ee5ad8b23f..08ed3b4598 100644
--- a/target/nios2/op_helper.c
+++ b/target/nios2/op_helper.c
@@ -34,7 +34,7 @@ void helper_raise_exception(CPUNios2State *env, uint32_t index)
 #ifndef CONFIG_USER_ONLY
 void helper_eret(CPUNios2State *env, uint32_t new_status, uint32_t new_pc)
 {
-    env->regs[CR_STATUS] = new_status;
+    env->ctrl[CR_STATUS] = new_status;
     env->pc = new_pc;
     cpu_loop_exit(env_cpu(env));
 }
diff --git a/target/nios2/translate.c b/target/nios2/translate.c
index 6c739bfa5e..308da8057c 100644
--- a/target/nios2/translate.c
+++ b/target/nios2/translate.c
@@ -395,7 +395,7 @@ static void eret(DisasContext *dc, uint32_t code, uint32_t flags)
     g_assert_not_reached();
 #else
     TCGv tmp = tcg_temp_new();
-    tcg_gen_ld_tl(tmp, cpu_env, offsetof(CPUNios2State, regs[CR_ESTATUS]));
+    tcg_gen_ld_tl(tmp, cpu_env, offsetof(CPUNios2State, ctrl[CR_ESTATUS]));
     gen_helper_eret(cpu_env, tmp, cpu_R[R_EA]);
     tcg_temp_free(tmp);
 
@@ -425,7 +425,7 @@ static void bret(DisasContext *dc, uint32_t code, uint32_t flags)
     g_assert_not_reached();
 #else
     TCGv tmp = tcg_temp_new();
-    tcg_gen_ld_tl(tmp, cpu_env, offsetof(CPUNios2State, regs[CR_BSTATUS]));
+    tcg_gen_ld_tl(tmp, cpu_env, offsetof(CPUNios2State, ctrl[CR_BSTATUS]));
     gen_helper_eret(cpu_env, tmp, cpu_R[R_BA]);
     tcg_temp_free(tmp);
 
@@ -481,7 +481,7 @@ static void rdctl(DisasContext *dc, uint32_t code, uint32_t flags)
         return;
     }
 
-    switch (instr.imm5 + CR_BASE) {
+    switch (instr.imm5) {
     case CR_IPENDING:
         /*
          * The value of the ipending register is synthetic.
@@ -493,17 +493,15 @@ static void rdctl(DisasContext *dc, uint32_t code, uint32_t flags)
          */
         t1 = tcg_temp_new();
         t2 = tcg_temp_new();
-        tcg_gen_ld_tl(t1, cpu_env,
-                      offsetof(CPUNios2State, regs[CR_IPENDING]));
-        tcg_gen_ld_tl(t2, cpu_env,
-                      offsetof(CPUNios2State, regs[CR_IENABLE]));
+        tcg_gen_ld_tl(t1, cpu_env, offsetof(CPUNios2State, ctrl[CR_IPENDING]));
+        tcg_gen_ld_tl(t2, cpu_env, offsetof(CPUNios2State, ctrl[CR_IENABLE]));
         tcg_gen_and_tl(cpu_R[instr.c], t1, t2);
         tcg_temp_free(t1);
         tcg_temp_free(t2);
         break;
     default:
         tcg_gen_ld_tl(cpu_R[instr.c], cpu_env,
-                      offsetof(CPUNios2State, regs[instr.imm5 + CR_BASE]));
+                      offsetof(CPUNios2State, ctrl[instr.imm5]));
         break;
     }
 }
@@ -521,7 +519,7 @@ static void wrctl(DisasContext *dc, uint32_t code, uint32_t flags)
     R_TYPE(instr, code);
     TCGv v = load_gpr(dc, instr.a);
 
-    switch (instr.imm5 + CR_BASE) {
+    switch (instr.imm5) {
     case CR_PTEADDR:
         gen_helper_mmu_write_pteaddr(cpu_env, v);
         break;
@@ -541,7 +539,7 @@ static void wrctl(DisasContext *dc, uint32_t code, uint32_t flags)
         /* fall through */
     default:
         tcg_gen_st_tl(v, cpu_env,
-                      offsetof(CPUNios2State, regs[instr.imm5 + CR_BASE]));
+                      offsetof(CPUNios2State, ctrl[instr.imm5]));
         break;
     }
 #endif
@@ -774,7 +772,7 @@ illegal_op:
     t_gen_helper_raise_exception(dc, EXCP_ILLEGAL);
 }
 
-static const char * const regnames[NUM_CORE_REGS] = {
+static const char * const gr_regnames[NUM_GP_REGS] = {
     "zero",       "at",         "r2",         "r3",
     "r4",         "r5",         "r6",         "r7",
     "r8",         "r9",         "r10",        "r11",
@@ -783,6 +781,9 @@ static const char * const regnames[NUM_CORE_REGS] = {
     "r20",        "r21",        "r22",        "r23",
     "et",         "bt",         "gp",         "sp",
     "fp",         "ea",         "ba",         "ra",
+};
+
+static const char * const cr_regnames[NUM_CR_REGS] = {
     "status",     "estatus",    "bstatus",    "ienable",
     "ipending",   "cpuid",      "reserved0",  "exception",
     "pteaddr",    "tlbacc",     "tlbmisc",    "reserved1",
@@ -910,8 +911,14 @@ void nios2_cpu_dump_state(CPUState *cs, FILE *f, int flags)
 
     qemu_fprintf(f, "IN: PC=%x %s\n", env->pc, lookup_symbol(env->pc));
 
-    for (i = 0; i < NUM_CORE_REGS; i++) {
-        qemu_fprintf(f, "%9s=%8.8x ", regnames[i], env->regs[i]);
+    for (i = 0; i < NUM_GP_REGS; i++) {
+        qemu_fprintf(f, "%9s=%8.8x ", gr_regnames[i], env->regs[i]);
+        if ((i + 1) % 4 == 0) {
+            qemu_fprintf(f, "\n");
+        }
+    }
+    for (i = 0; i < NUM_CR_REGS; i++) {
+        qemu_fprintf(f, "%9s=%8.8x ", cr_regnames[i], env->ctrl[i]);
         if ((i + 1) % 4 == 0) {
             qemu_fprintf(f, "\n");
         }
@@ -932,7 +939,7 @@ void nios2_tcg_init(void)
     for (i = 0; i < NUM_GP_REGS; i++) {
         cpu_R[i] = tcg_global_mem_new(cpu_env,
                                       offsetof(CPUNios2State, regs[i]),
-                                      regnames[i]);
+                                      gr_regnames[i]);
     }
     cpu_pc = tcg_global_mem_new(cpu_env,
                                 offsetof(CPUNios2State, pc), "pc");
-- 
2.34.1


