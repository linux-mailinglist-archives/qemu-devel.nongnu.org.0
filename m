Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 162D352F6DA
	for <lists+qemu-devel@lfdr.de>; Sat, 21 May 2022 02:37:55 +0200 (CEST)
Received: from localhost ([::1]:40536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nsD7y-0007Ry-6e
	for lists+qemu-devel@lfdr.de; Fri, 20 May 2022 20:37:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nsCbv-0008BY-MS
 for qemu-devel@nongnu.org; Fri, 20 May 2022 20:04:56 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:42780)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nsCbZ-00040P-Td
 for qemu-devel@nongnu.org; Fri, 20 May 2022 20:04:41 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 a23-20020a17090acb9700b001df4e9f4870so9062695pju.1
 for <qemu-devel@nongnu.org>; Fri, 20 May 2022 17:04:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FOXW0QBVRQzvdj2/5WlXeWhliAMlds8KPficEgm5rdo=;
 b=OviK12BRLMDBD+B/+T12TZ6u4AHeAQgmDflErLQUohruXLe9bykv//fazu1on3jUvK
 POkME46q3kW046Bkhy9uZAr+n1ctyphseVEMdojmbJ1jqONfKAyVyeRO84rgcLmKrd08
 yniVdCbY5+A8R/Q0vEXLxA2LumECI2pUrnZ+CgsKK+9DNVmbuLFxdJNPh056Jiv7aTDe
 Fguk1JKRh7H8gIpldM1jaOMCZIeWn8wpFb4wY2xClEDwS0r+Rh6QJy+gdnOmT5pM6T2w
 7m+k41t9P+DfxXNSbviNwdeeZ1yyvzgRIjtubn2rD/Wg7PgA2Lf5kyZL5EtQlpa61F+C
 NCJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FOXW0QBVRQzvdj2/5WlXeWhliAMlds8KPficEgm5rdo=;
 b=HUSSgvLiYE9K+K5bsKslopfldi4WwjVeWSna4OQx9JSIbLyWVF9RRgMaSjsvfQiFQ9
 1S4sXhORGCfp7/qPUaIn2dmm+RyvPvkvgfRi6WV49obwdp5ap3e+Thfp+eHeDcIsHvSC
 aXKixsBDXjItMFi+e5/aWaPn+PtbaNIveyEqFRhnZN28XF0XPcKhtqZK+nMbVns3RTcq
 cWyvKWYqnAi0ciAdDsMy99ju09MGPbKdBXBrTjKn4a9ifpjfc1mRMU9tTA7Rot6dvvij
 TdknDfDaVBnT7aGAjZdfCfp/bYhiJivJJf7+BWLbv+0gO9SIyKcEmpb7OuObDWWPjkeb
 NrNw==
X-Gm-Message-State: AOAM531iAVmPOJQi1KleHvk6LftYDgVdCj3CpQzWrYanHyRmds4Koz87
 5UPexWf0IU6XpvIgRfqYnr0m+ZEn0WiAXQ==
X-Google-Smtp-Source: ABdhPJyF3Bd8mcQNsI3lI/ybaCCX41u1r5ygyMyK1wa2piFexlE11b+GgqjwlDDn3ys3dbMh0Nnngw==
X-Received: by 2002:a17:902:d550:b0:161:fdb8:3d9d with SMTP id
 z16-20020a170902d55000b00161fdb83d9dmr2864151plf.42.1653091464556; 
 Fri, 20 May 2022 17:04:24 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 h8-20020a654808000000b003f9d1c020cbsm306369pgs.51.2022.05.20.17.04.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 May 2022 17:04:24 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, alex.bennee@linaro.org,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v3 19/49] semihosting: Split common_semi_flen_buf per target
Date: Fri, 20 May 2022 17:03:30 -0700
Message-Id: <20220521000400.454525-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220521000400.454525-1-richard.henderson@linaro.org>
References: <20220521000400.454525-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
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

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 semihosting/arm-compat-semi.c | 44 +++++++++++++++++------------------
 1 file changed, 21 insertions(+), 23 deletions(-)

diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
index 99a1809f27..9ea985beee 100644
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


