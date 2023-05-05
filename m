Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA7F86F7A70
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 03:13:29 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pujvI-0000kl-RJ; Thu, 04 May 2023 21:07:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pujus-000086-QE
 for qemu-devel@nongnu.org; Thu, 04 May 2023 21:07:22 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pujuq-0007yv-S6
 for qemu-devel@nongnu.org; Thu, 04 May 2023 21:07:22 -0400
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-1aaff9c93a5so8151745ad.2
 for <qemu-devel@nongnu.org>; Thu, 04 May 2023 18:07:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683248839; x=1685840839;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Wi+1v00zCXgIbo5ZQUE7RzeAN6+AZmd0gp2h5NJhB9o=;
 b=Oeo5StD34xN8QRsGMRQCMS+5usi756D1yRQU/u11Tf+NjGCCQRbK7dcO3+kVKoLXSM
 ylTjGQjAS4VsgG5ntObAEjYMB2Kz8v9u4v/gt2S5KH+sTyTa+6qkmjHrCh+gI8EQHvdN
 p5Tfok9aWp+PSi7W5uMWvFRhcB/tTv08ZglacewbV9fxdst4BAJQFdsQ2AI8pa2iKjHE
 vm7zhl4VC5kbIxGeFy6BUB45M5dSR2ssww9YK27dRIrDq72HCuLNQRLqghw5duoQvIMZ
 3LpqerrqK4nPM9W0tGEbmgFVa3+mkFIt5dFyLcJ61mDrTPt8E6tGHjBx0avAlZPTz1pU
 THNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683248839; x=1685840839;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Wi+1v00zCXgIbo5ZQUE7RzeAN6+AZmd0gp2h5NJhB9o=;
 b=L4oCb0fLbwU4d+FQEi8KFZT6axRy3Srh2AKwWep5Wx5rc7m4Hgb1t2YnNksLZ+Vnb+
 cAwLlxfMjnycsZNP1SzGUdHRMThBnxHajXMS1TBvylihnf/tMBMNhuBEqbs3k0aLKDDA
 6JwqkCPwpSZ1bPXH2UA3+XnNnJLUbOrTyD4SPRHDdTF6qK/e9N1I6v7GYfCrBSQXg8KM
 Ihj5ruAywJLfxiyY1i2Eop8pEQRwmbGUhPH5ylY9qrCP/hnD2XAmR4f2ld1lVQYo24e3
 SEqHXVAkV7g3BK71tp58beCyppX/SzrIGYINTbGSuWFGlGTYRJHMoJufLvdffRda6Sbd
 hC1w==
X-Gm-Message-State: AC+VfDx9L0LwfTRNJvq74KKRg2G5zO0iZxY1PHExMnnW7PKZZndW9pP2
 nWrV+3s3mm+AoZ5Ko9Y1Z8AB39oZhahlBg==
X-Google-Smtp-Source: ACHHUZ7Mmd8k4NK+P6DFAVH+Si96Rk1jBw7I7a++zIoWbSko729dNY/utY3/TbCWQO94J6E94T4djA==
X-Received: by 2002:a17:902:eccf:b0:1a6:f93a:a135 with SMTP id
 a15-20020a170902eccf00b001a6f93aa135mr6791826plh.61.1683248839389; 
 Thu, 04 May 2023 18:07:19 -0700 (PDT)
Received: from toolbox.alistair23.me
 (2403-580b-97e8-0-321-6fb2-58f1-a1b1.ip6.aussiebb.net.
 [2403:580b:97e8:0:321:6fb2:58f1:a1b1])
 by smtp.gmail.com with ESMTPSA id
 l19-20020a170902d35300b0019309be03e7sm218762plk.66.2023.05.04.18.07.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 May 2023 18:07:18 -0700 (PDT)
From: Alistair Francis <alistair23@gmail.com>
X-Google-Original-From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PULL 70/89] target/riscv: Introduce mmuidx_2stage
Date: Fri,  5 May 2023 11:02:22 +1000
Message-Id: <20230505010241.21812-71-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230505010241.21812-1-alistair.francis@wdc.com>
References: <20230505010241.21812-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=alistair23@gmail.com; helo=mail-pl1-x633.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Richard Henderson <richard.henderson@linaro.org>

Move and rename riscv_cpu_two_stage_lookup, to match
the other mmuidx_* functions.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Tested-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Message-Id: <20230325105429.1142530-15-richard.henderson@linaro.org>
Message-Id: <20230412114333.118895-15-richard.henderson@linaro.org>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.h        |  1 -
 target/riscv/internals.h  |  5 +++++
 target/riscv/cpu_helper.c | 20 ++++++--------------
 3 files changed, 11 insertions(+), 15 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 35cf2e2691..d1f888a790 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -581,7 +581,6 @@ target_ulong riscv_cpu_get_geilen(CPURISCVState *env);
 void riscv_cpu_set_geilen(CPURISCVState *env, target_ulong geilen);
 bool riscv_cpu_vector_enabled(CPURISCVState *env);
 void riscv_cpu_set_virt_enabled(CPURISCVState *env, bool enable);
-bool riscv_cpu_two_stage_lookup(int mmu_idx);
 int riscv_cpu_mmu_index(CPURISCVState *env, bool ifetch);
 G_NORETURN void  riscv_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
                                                MMUAccessType access_type,
diff --git a/target/riscv/internals.h b/target/riscv/internals.h
index 4aa1cb409f..b5f823c7ec 100644
--- a/target/riscv/internals.h
+++ b/target/riscv/internals.h
@@ -51,6 +51,11 @@ static inline bool mmuidx_sum(int mmu_idx)
     return (mmu_idx & 3) == MMUIdx_S_SUM;
 }
 
+static inline bool mmuidx_2stage(int mmu_idx)
+{
+    return mmu_idx & MMU_2STAGE_BIT;
+}
+
 /* share data between vector helpers and decode code */
 FIELD(VDATA, VM, 0, 1)
 FIELD(VDATA, LMUL, 1, 3)
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 57bb19c76e..9dfd1d739b 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -591,11 +591,6 @@ void riscv_cpu_set_virt_enabled(CPURISCVState *env, bool enable)
     }
 }
 
-bool riscv_cpu_two_stage_lookup(int mmu_idx)
-{
-    return mmu_idx & MMU_2STAGE_BIT;
-}
-
 int riscv_cpu_claim_interrupts(RISCVCPU *cpu, uint64_t interrupts)
 {
     CPURISCVState *env = &cpu->env;
@@ -779,7 +774,7 @@ static int get_physical_address(CPURISCVState *env, hwaddr *physical,
      * MPRV does not affect the virtual-machine load/store
      * instructions, HLV, HLVX, and HSV.
      */
-    if (riscv_cpu_two_stage_lookup(mmu_idx)) {
+    if (mmuidx_2stage(mmu_idx)) {
         mode = get_field(env->hstatus, HSTATUS_SPVP);
     }
 
@@ -1175,8 +1170,7 @@ void riscv_cpu_do_transaction_failed(CPUState *cs, hwaddr physaddr,
     }
 
     env->badaddr = addr;
-    env->two_stage_lookup = env->virt_enabled ||
-                            riscv_cpu_two_stage_lookup(mmu_idx);
+    env->two_stage_lookup = env->virt_enabled || mmuidx_2stage(mmu_idx);
     env->two_stage_indirect_lookup = false;
     cpu_loop_exit_restore(cs, retaddr);
 }
@@ -1201,8 +1195,7 @@ void riscv_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
         g_assert_not_reached();
     }
     env->badaddr = addr;
-    env->two_stage_lookup = env->virt_enabled ||
-                            riscv_cpu_two_stage_lookup(mmu_idx);
+    env->two_stage_lookup = env->virt_enabled || mmuidx_2stage(mmu_idx);
     env->two_stage_indirect_lookup = false;
     cpu_loop_exit_restore(cs, retaddr);
 }
@@ -1256,7 +1249,7 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
      * MPRV does not affect the virtual-machine load/store
      * instructions, HLV, HLVX, and HSV.
      */
-    if (riscv_cpu_two_stage_lookup(mmu_idx)) {
+    if (mmuidx_2stage(mmu_idx)) {
         mode = get_field(env->hstatus, HSTATUS_SPVP);
     } else if (mode == PRV_M && access_type != MMU_INST_FETCH &&
                get_field(env->mstatus, MSTATUS_MPRV)) {
@@ -1268,7 +1261,7 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
 
     pmu_tlb_fill_incr_ctr(cpu, access_type);
     if (env->virt_enabled ||
-        ((riscv_cpu_two_stage_lookup(mmu_idx) || two_stage_lookup) &&
+        ((mmuidx_2stage(mmu_idx) || two_stage_lookup) &&
          access_type != MMU_INST_FETCH)) {
         /* Two stage lookup */
         ret = get_physical_address(env, &pa, &prot, address,
@@ -1366,8 +1359,7 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
     } else {
         raise_mmu_exception(env, address, access_type, pmp_violation,
                             first_stage_error,
-                            env->virt_enabled ||
-                                riscv_cpu_two_stage_lookup(mmu_idx),
+                            env->virt_enabled || mmuidx_2stage(mmu_idx),
                             two_stage_indirect_error);
         cpu_loop_exit_restore(cs, retaddr);
     }
-- 
2.40.0


