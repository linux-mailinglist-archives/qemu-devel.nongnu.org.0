Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 445E0255CE4
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Aug 2020 16:44:49 +0200 (CEST)
Received: from localhost ([::1]:58000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kBfcW-0007pj-Aw
	for lists+qemu-devel@lfdr.de; Fri, 28 Aug 2020 10:44:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kBfFG-0001kw-Lz
 for qemu-devel@nongnu.org; Fri, 28 Aug 2020 10:20:46 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:43802)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kBfFE-0005M0-G5
 for qemu-devel@nongnu.org; Fri, 28 Aug 2020 10:20:46 -0400
Received: by mail-pg1-x530.google.com with SMTP id d19so517472pgl.10
 for <qemu-devel@nongnu.org>; Fri, 28 Aug 2020 07:20:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3LLfQYgaXzGwswhNrhZmalAI0pGPTZAeATntMFf9mBA=;
 b=p8ZolXJMtqbWdxp2TgJ/MnsPREszLC/33VQrSwh/b8ogsPMlQ8KcP5tzn9J8AbN0dQ
 yxYJKhALzwWMqQ1MMXPrCpq9fGc0lkgoOmAezD/Oqd2OV0Y5lqn41yo59kr0gYtNCSYE
 RwsSZRwTTC4I+RQckRdhdxkrXLYmDK307bVykHhddYdxE1hTT34lw3bkLVsFF8TixdFP
 vIol+jvuMURUOvRX1W5z5M++mL5B40xj7t2HvI2yylFrziA9dB4V56FHOV3lFqbWAGYI
 UChJYzlQP/111ERmIebkgxtp9Yv2rlEIvUFYG8bnypLhLlhwOMTZeMNBeu7fmtl7LNZ6
 Kt8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3LLfQYgaXzGwswhNrhZmalAI0pGPTZAeATntMFf9mBA=;
 b=ptCRVC8lUCoFuQk6LWtM8o/dAhTruLoXQOVyiTkhcNOlA9z2HqAxM7jH12FOU7z0XZ
 odpcCnsLRt8gmQqtBdyhh81MGlCVPU4l5UaU9dmk0khoRASxeY4sNeU9vRY/vk7NmSpd
 6E1VbgiwJr0eXmT1COtg1AX/y7pDqhtUkvsoKi5jJoiezz0ZlEjgTKNYMVz3CdnXuhAu
 QX4dbXF3WvlQNKd12pYcA8txTZVWVWO7Sw3d+vV8uH7ip9pZ1WW10zC8Mw0x4CloKqqG
 zC9oswAv8wPYpzZiPlBq5e13gQiZLMtEGPPOg05XpXQWnLY8jqyJOEtdxy0dqraN7rmc
 kXVA==
X-Gm-Message-State: AOAM5314ldZZ3VbqL3AnvTMk9ncJ/NTEvZLndngs+HtggtmdsBeoQ+eu
 GP8m02rBh4yqoErIGWgUZoVbo5/ZsV2WKg==
X-Google-Smtp-Source: ABdhPJwsVEky0fu16E3PpltYrPj8dOZ5WhkrOJVX63zvXyuIZ5V44rukcfVjAosyX365dBnAPR3R+Q==
X-Received: by 2002:a65:64d9:: with SMTP id t25mr1496544pgv.70.1598624442623; 
 Fri, 28 Aug 2020 07:20:42 -0700 (PDT)
Received: from localhost.localdomain ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id j3sm1403080pjw.23.2020.08.28.07.20.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Aug 2020 07:20:41 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 56/76] target/microblaze: Fix no-op
 mb_cpu_transaction_failed
Date: Fri, 28 Aug 2020 07:19:09 -0700
Message-Id: <20200828141929.77854-57-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200828141929.77854-1-richard.henderson@linaro.org>
References: <20200828141929.77854-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: edgar.iglesias@xilinx.com, "Edgar E . Iglesias" <edgar.iglesias@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Do not call cpu_restore_state when no exception will be
delivered.  This can lead to inconsistent cpu state.

Reported-by: Edgar E. Iglesias <edgar.iglesias@gmail.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/microblaze/op_helper.c | 25 +++++++++++++------------
 1 file changed, 13 insertions(+), 12 deletions(-)

diff --git a/target/microblaze/op_helper.c b/target/microblaze/op_helper.c
index a99c467364..e6dcc79243 100644
--- a/target/microblaze/op_helper.c
+++ b/target/microblaze/op_helper.c
@@ -419,32 +419,33 @@ void mb_cpu_transaction_failed(CPUState *cs, hwaddr physaddr, vaddr addr,
                                int mmu_idx, MemTxAttrs attrs,
                                MemTxResult response, uintptr_t retaddr)
 {
-    MicroBlazeCPU *cpu;
-    CPUMBState *env;
+    MicroBlazeCPU *cpu = MICROBLAZE_CPU(cs);
+    CPUMBState *env = &cpu->env;
+
     qemu_log_mask(CPU_LOG_INT, "Transaction failed: vaddr 0x%" VADDR_PRIx
                   " physaddr 0x" TARGET_FMT_plx " size %d access type %s\n",
                   addr, physaddr, size,
                   access_type == MMU_INST_FETCH ? "INST_FETCH" :
                   (access_type == MMU_DATA_LOAD ? "DATA_LOAD" : "DATA_STORE"));
-    cpu = MICROBLAZE_CPU(cs);
-    env = &cpu->env;
 
-    cpu_restore_state(cs, retaddr, true);
     if (!(env->msr & MSR_EE)) {
         return;
     }
 
-    env->ear = addr;
     if (access_type == MMU_INST_FETCH) {
-        if ((env->pvr.regs[2] & PVR2_IOPB_BUS_EXC_MASK)) {
-            env->esr = ESR_EC_INSN_BUS;
-            helper_raise_exception(env, EXCP_HW_EXCP);
+        if (!cpu->cfg.iopb_bus_exception) {
+            return;
         }
+        env->esr = ESR_EC_INSN_BUS;
     } else {
-        if ((env->pvr.regs[2] & PVR2_DOPB_BUS_EXC_MASK)) {
-            env->esr = ESR_EC_DATA_BUS;
-            helper_raise_exception(env, EXCP_HW_EXCP);
+        if (!cpu->cfg.dopb_bus_exception) {
+            return;
         }
+        env->esr = ESR_EC_DATA_BUS;
     }
+
+    env->ear = addr;
+    cs->exception_index = EXCP_HW_EXCP;
+    cpu_loop_exit_restore(cs, retaddr);
 }
 #endif
-- 
2.25.1


