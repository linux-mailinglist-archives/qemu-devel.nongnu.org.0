Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF6CC518DAD
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 22:02:14 +0200 (CEST)
Received: from localhost ([::1]:43494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlyir-0001jp-Te
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 16:02:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nlyWA-0001aR-8g
 for qemu-devel@nongnu.org; Tue, 03 May 2022 15:49:06 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:38894)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nlyW8-0003ZC-5f
 for qemu-devel@nongnu.org; Tue, 03 May 2022 15:49:05 -0400
Received: by mail-pg1-x533.google.com with SMTP id e5so3713381pgc.5
 for <qemu-devel@nongnu.org>; Tue, 03 May 2022 12:49:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=IzZtboHFK51ahqSRhw7zz5hbdZTb6VGng4tHM8rPvXQ=;
 b=gPs9i22cIau2c/IJ+nxe8oLHO+RT1WPWq2zugch/0nTQTEQaCTpFkbg0OpCxMAK13P
 4YGqVESrxpuD1xyAdeupLRePpOolFZKxQ95EN2ZvSkV96THNb0zNKIE8WhSBbR3cla9X
 7nI/HFzO+eMqJWSdeZmvW1J03s0Gxe1bOgRZrSmLrbStNxu9acc70KT6x8wd1Vmdmc+j
 6DdPyEDgxCeJ/RmGQPRvdtNv0USLXVEkQU6QflTpLwFwOWlecXKsoOaEVKSz3bBwS14l
 EP4QOdwWZvppCzPlsPeNz9rKqpJhAZxi/Aw3n250zWCbJgdRAvf74Jh0+KS4FJu4OjCy
 6DcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IzZtboHFK51ahqSRhw7zz5hbdZTb6VGng4tHM8rPvXQ=;
 b=4r5DBnsGp6keCUiup+BJjBZFTRXlSbRX32NZrxlmgll8cLti4GN5n7l3KwEJUPCqey
 T63GOR09qnBgJPvh4q6QaapBrp6GmpcbvLJnuOjDMt1EyiCCTT9eODH4M+8/lFp/kWrO
 CZ3HH19bAFArKt8MclL77M0FPk1+PgfQuGYIXi82m0QeUDtuQgffizBZAd0doxfeDywK
 iwEOaJM85gIE1f7x78Mgp8rXgJW2s9+jbt/h0aitOST8LWQ0rOFYSLTzC7uE/8APmEZn
 HRyvSjyyMN8yXSZY686kV4A1aU/ndhGlrm2N+toxO7y9+LLmo26OpkIHRBt6WjiMXEE2
 G/qg==
X-Gm-Message-State: AOAM531eUM0mot8Jxq3X7X/OgBZ4gIlCQblEc9NXJI+3KFcYEvpea+Yd
 C44ZKOjK4XE0Yu3djlGOyJJg3UvfwKlRUg==
X-Google-Smtp-Source: ABdhPJzCiR0DFrtSiYTJg0IBj0T23Y8oO+YVQ3ItQNBHBInEs/DH+8NXwSh24R1sYdulKvU7uKQfXw==
X-Received: by 2002:a63:610a:0:b0:3c5:a1f9:c556 with SMTP id
 v10-20020a63610a000000b003c5a1f9c556mr446863pgb.366.1651607342856; 
 Tue, 03 May 2022 12:49:02 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 p11-20020a17090ad30b00b001cd4989fed3sm1712383pju.31.2022.05.03.12.49.02
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 May 2022 12:49:02 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 17/74] semihosting: Split common_semi_flen_buf per target
Date: Tue,  3 May 2022 12:47:46 -0700
Message-Id: <20220503194843.1379101-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220503194843.1379101-1-richard.henderson@linaro.org>
References: <20220503194843.1379101-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x533.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We already have some larger ifdef blocks for ARM and RISCV;
split out common_semi_stack_bottom per target.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 semihosting/arm-compat-semi.c | 44 +++++++++++++++++------------------
 1 file changed, 21 insertions(+), 23 deletions(-)

diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
index 7fc60e223a..b2816e9f66 100644
--- a/semihosting/arm-compat-semi.c
+++ b/semihosting/arm-compat-semi.c
@@ -217,6 +217,13 @@ static inline bool is_64bit_semihosting(CPUArchState *env)
 {
     return is_a64(env);
 }
+
+static inline target_ulong common_semi_stack_bottom(CPUState *cs)
+{
+    ARMCPU *cpu = ARM_CPU(cs);
+    CPUARMState *env = &cpu->env;
+    return is_a64(env) ? env->xregs[31] : env->regs[13];
+}
 #endif /* TARGET_ARM */
 
 #ifdef TARGET_RISCV
@@ -246,6 +253,13 @@ static inline bool is_64bit_semihosting(CPUArchState *env)
 {
     return riscv_cpu_mxl(env) != MXL_RV32;
 }
+
+static inline target_ulong common_semi_stack_bottom(CPUState *cs)
+{
+    RISCVCPU *cpu = RISCV_CPU(cs);
+    CPURISCVState *env = &cpu->env;
+    return env->gpr[xSP];
+}
 #endif
 
 /*
@@ -301,31 +315,15 @@ static void common_semi_cb(CPUState *cs, target_ulong ret, target_ulong err)
     common_semi_set_ret(cs, ret);
 }
 
+/*
+ * Return an address in target memory of 64 bytes where the remote
+ * gdb should write its stat struct. (The format of this structure
+ * is defined by GDB's remote protocol and is not target-specific.)
+ * We put this on the guest's stack just below SP.
+ */
 static target_ulong common_semi_flen_buf(CPUState *cs)
 {
-    target_ulong sp;
-#ifdef TARGET_ARM
-    /* Return an address in target memory of 64 bytes where the remote
-     * gdb should write its stat struct. (The format of this structure
-     * is defined by GDB's remote protocol and is not target-specific.)
-     * We put this on the guest's stack just below SP.
-     */
-    ARMCPU *cpu = ARM_CPU(cs);
-    CPUARMState *env = &cpu->env;
-
-    if (is_a64(env)) {
-        sp = env->xregs[31];
-    } else {
-        sp = env->regs[13];
-    }
-#endif
-#ifdef TARGET_RISCV
-    RISCVCPU *cpu = RISCV_CPU(cs);
-    CPURISCVState *env = &cpu->env;
-
-    sp = env->gpr[xSP];
-#endif
-
+    target_ulong sp = common_semi_stack_bottom(cs);
     return sp - 64;
 }
 
-- 
2.34.1


