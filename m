Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC0613F0BDD
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Aug 2021 21:35:36 +0200 (CEST)
Received: from localhost ([::1]:54614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGRLb-00078o-Mr
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 15:35:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGR6D-0000LE-38
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 15:19:41 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e]:44915)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGR6A-0008T1-Rk
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 15:19:40 -0400
Received: by mail-pg1-x52e.google.com with SMTP id s11so3303975pgr.11
 for <qemu-devel@nongnu.org>; Wed, 18 Aug 2021 12:19:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sDqHuydfvja3hUkz7uNegNZUjAODAQ28Kwe+4YIPszs=;
 b=g4QkyF5ZR46YOjO4sDupWc9BZJZuDtomD1DzkhxqMrae6FlQE9smzBBfTII0HW4jOv
 /cRz5yl/oFeg7zkf6W8XZ/Noi+Ub1uqv6XYTeTYldlfPF54GcxPCvnU4Ku1NkKhej2SD
 H7MyIkhHjxoSOspYWjWljA1lzgQYSKNXXNhP1J/9fkNs6mbhSmdpyalZgpDWueQrcenl
 qhzj6rS/qF04LBIgCv8OMiYxPjfV4rvD/CN1sL3yXDBaU0cvAmSs5H77hbioD4lnOqlg
 4xPe/n6nBUBS8//aY96GdrRDDvf/AYyLvhCooWIJVNo19NzPGUzKiYfzTdkc8oZJfDAz
 gq5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sDqHuydfvja3hUkz7uNegNZUjAODAQ28Kwe+4YIPszs=;
 b=bfC2aRSfaiJLjfQ2w040di6qqni1Mwy55QEGvz3X0pvRaniU8v0A85ftpbtBwir95q
 aU+9/tGEjtlXJbCfCFakNgGVrQ1tS60EBPGCC6TooREjDWEkxwanLGS9jjt3zZA6HsN9
 bt3r8+nudBjh4vRk419O1A1aIymL6tfalRer/k51cF28SXCV6ESGnZF/Y7+Yj4iXt1WG
 2BnRmJK/WL1lzVhN3D6u5bUQiox22uhafxGjQIup5FHQI+2YlRhRNd//Ux36rVDpjjiD
 SC3F5caCoDJQ6Nl+rBmhjLlw96g6FK4v987dBb7rRtTyMpoaUfVohiBWiw3eA7dLMtvn
 Chww==
X-Gm-Message-State: AOAM530O8ss0oKU7QGFkomUBv2jY5lrpzdrQ2bM7A2cZR4ZNKBegCWYL
 HLxLwu6vKXxz0mVlcMH8TlNpZZj/NLOsCQ==
X-Google-Smtp-Source: ABdhPJz8pJgv7BLfriuO7yBNdKhQSi+eGZNBN2ig56Ft5Pp1GOIaLM+4aZMsHajdfjA60JeKUq5X2A==
X-Received: by 2002:a62:78d0:0:b029:3dd:8fc1:2797 with SMTP id
 t199-20020a6278d00000b02903dd8fc12797mr10822109pfc.65.1629314377578; 
 Wed, 18 Aug 2021 12:19:37 -0700 (PDT)
Received: from localhost.localdomain ([173.197.107.15])
 by smtp.gmail.com with ESMTPSA id a6sm524108pjs.40.2021.08.18.12.19.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Aug 2021 12:19:37 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 12/66] target/riscv: Implement do_unaligned_access for
 user-only
Date: Wed, 18 Aug 2021 09:18:26 -1000
Message-Id: <20210818191920.390759-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210818191920.390759-1-richard.henderson@linaro.org>
References: <20210818191920.390759-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52e.google.com
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


