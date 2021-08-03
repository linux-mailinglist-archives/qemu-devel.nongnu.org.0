Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C98903DE504
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 06:22:16 +0200 (CEST)
Received: from localhost ([::1]:46490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAlwV-0006YV-ST
	for lists+qemu-devel@lfdr.de; Tue, 03 Aug 2021 00:22:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mAlpV-0002st-QJ
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 00:15:01 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:40539)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mAlpT-00027y-Rq
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 00:15:01 -0400
Received: by mail-pl1-x62b.google.com with SMTP id c16so22133160plh.7
 for <qemu-devel@nongnu.org>; Mon, 02 Aug 2021 21:14:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sDqHuydfvja3hUkz7uNegNZUjAODAQ28Kwe+4YIPszs=;
 b=fJ1uwkzbfCtHO4ZhobT+1nmlzDafpZNjUPwd70YbEjIPzHw2faFlI0vj7TFWbkcAjO
 R6Jcq2Tg0oZTZl4bWOZO9+LpfJYhGWAjxoMn1RPHTmheLfqdpgvh96h++NjsEyTZywTo
 KaSPwilaj79YAtEm1hfyPPEYrpEEZTxupy3qVLA9tUytNZA9gnWL903/zUdVRMgXx1YD
 tQrgM4jFSX6hpqz5gdtrrvGW0fC5VzTTktpcbTkOQbAEnoYFBF9+cqksHHD06xh+whyK
 TJbbW4rQLTBOHzm98JTCEvP0MsCfapxeWto0laE0vjTfzpaIC9AmTy2yzIBoL383CjG2
 5zog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sDqHuydfvja3hUkz7uNegNZUjAODAQ28Kwe+4YIPszs=;
 b=BZAe6UwCroI0KNYHbKP3/AT73DA+jjGpPskWqbB1rvLFnpe1Iu0tppDd8g45uSkXVH
 BTHXH129TEE9srLP5g1qG7OolezG7noLS7zwqMV1QrOPyf8z3OD2JZR+DLZN25aoCcRL
 s6sGP/qUmdE17rcIra7WK7225TKtfTWrtUJdaPe1YD4YYVk7enW4wb1Du2WXiN9R6OfN
 /wu19iw3GR8YUMiXNluM9+zNSuoUrmEAWOivYwyVfL6FVFlzyj/gnLZPAE19xSj3GUX4
 fOLDbOc2ZdfwtChcTGhov2r1jy2cVj2NPXR1dGd+jtlnD0+cWgddK2G7UKcWu4bPSJBl
 Uw+g==
X-Gm-Message-State: AOAM533S/S3B3ZOutnd04UmIu1OuhFWtK8dbV3VXRagniXDQNlnc2I0P
 9DLAEEa4+j72MB4C03X4IbwRjQu5DMPp3A==
X-Google-Smtp-Source: ABdhPJzK31angAA7dNYar9k00Oye3doS5X7m8rZhleSKLYopX1CsCNrY1M66nFtTD5CbLMqtRIdsdA==
X-Received: by 2002:a65:680d:: with SMTP id l13mr1419169pgt.307.1627964098753; 
 Mon, 02 Aug 2021 21:14:58 -0700 (PDT)
Received: from localhost.localdomain (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id c23sm13718532pfn.140.2021.08.02.21.14.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Aug 2021 21:14:58 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 11/55] target/riscv: Implement do_unaligned_access for
 user-only
Date: Mon,  2 Aug 2021 18:13:59 -1000
Message-Id: <20210803041443.55452-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210803041443.55452-1-richard.henderson@linaro.org>
References: <20210803041443.55452-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
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
Cc: Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/riscv/cpu_loop.c | 7 +++++++
 target/riscv/cpu.c          | 2 +-
 target/riscv/cpu_helper.c   | 8 +++++++-
 3 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/linux-user/riscv/cpu_loop.c b/linux-user/riscv/cpu_loop.c
index 74a9628dc9..0428140d86 100644
--- a/linux-user/riscv/cpu_loop.c
+++ b/linux-user/riscv/cpu_loop.c
@@ -92,6 +92,13 @@ void cpu_loop(CPURISCVState *env)
             sigcode = TARGET_SEGV_MAPERR;
             sigaddr = env->badaddr;
             break;
+        case RISCV_EXCP_INST_ADDR_MIS:
+        case RISCV_EXCP_LOAD_ADDR_MIS:
+        case RISCV_EXCP_STORE_AMO_ADDR_MIS:
+            signum = TARGET_SIGBUS;
+            sigcode = TARGET_BUS_ADRALN;
+            sigaddr = env->badaddr;
+            break;
         case RISCV_EXCP_SEMIHOST:
             env->gpr[xA0] = do_common_semihosting(cs);
             env->pc += 4;
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 991a6bb760..591d17e62d 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -644,11 +644,11 @@ static const struct TCGCPUOps riscv_tcg_ops = {
     .synchronize_from_tb = riscv_cpu_synchronize_from_tb,
     .cpu_exec_interrupt = riscv_cpu_exec_interrupt,
     .tlb_fill = riscv_cpu_tlb_fill,
+    .do_unaligned_access = riscv_cpu_do_unaligned_access,
 
 #ifndef CONFIG_USER_ONLY
     .do_interrupt = riscv_cpu_do_interrupt,
     .do_transaction_failed = riscv_cpu_do_transaction_failed,
-    .do_unaligned_access = riscv_cpu_do_unaligned_access,
 #endif /* !CONFIG_USER_ONLY */
 };
 
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 968cb8046f..a440b2834f 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -727,6 +727,7 @@ void riscv_cpu_do_transaction_failed(CPUState *cs, hwaddr physaddr,
                             riscv_cpu_two_stage_lookup(mmu_idx);
     riscv_raise_exception(&cpu->env, cs->exception_index, retaddr);
 }
+#endif /* !CONFIG_USER_ONLY */
 
 void riscv_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
                                    MMUAccessType access_type, int mmu_idx,
@@ -734,6 +735,7 @@ void riscv_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
 {
     RISCVCPU *cpu = RISCV_CPU(cs);
     CPURISCVState *env = &cpu->env;
+
     switch (access_type) {
     case MMU_INST_FETCH:
         cs->exception_index = RISCV_EXCP_INST_ADDR_MIS;
@@ -748,11 +750,15 @@ void riscv_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
         g_assert_not_reached();
     }
     env->badaddr = addr;
+
+#ifdef CONFIG_USER_ONLY
+    cpu_loop_exit_restore(cs, retaddr);
+#else
     env->two_stage_lookup = riscv_cpu_virt_enabled(env) ||
                             riscv_cpu_two_stage_lookup(mmu_idx);
     riscv_raise_exception(env, cs->exception_index, retaddr);
+#endif
 }
-#endif /* !CONFIG_USER_ONLY */
 
 bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
                         MMUAccessType access_type, int mmu_idx,
-- 
2.25.1


