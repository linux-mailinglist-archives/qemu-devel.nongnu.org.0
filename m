Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A569D6F7A6F
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 03:13:29 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pujuv-0000AP-HN; Thu, 04 May 2023 21:07:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pujuZ-0008Fa-Np
 for qemu-devel@nongnu.org; Thu, 04 May 2023 21:07:05 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pujuV-0007vW-Vq
 for qemu-devel@nongnu.org; Thu, 04 May 2023 21:07:01 -0400
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-1aaef97652fso8106825ad.0
 for <qemu-devel@nongnu.org>; Thu, 04 May 2023 18:06:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683248818; x=1685840818;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JbBMk9JLIxgutGnQaDrHlYakr8/72eeE7gqabzbXCvE=;
 b=ZvWqvLt+b49zjU5wt2Vj6sJlfWw7s1Bi7Vki0HGrV2Pi9Q2tdHkt0/UyTODwXOp3jr
 CTlCp+jiYjnome/nYSVAawnYn3ha+e9Q+hAWYErciYfbqzdzUH2lHFDmmApVo4ZyU7gG
 jAk95bP3QJrphK6VINqOoErawRnYPXFaUgI/4m72o9KplI6eyNKtqPLGotf8y/A7Mx4i
 xB4CWZ1XMPGXmAJymPsFVA8B1uMN2mbeEA1rW3S8EHpZntnNN9Rf+rcNi0y1Vhe3VAvP
 z7EG5eGYm3z0xFXFFlxrsIweorMFXaUIjlvhQJCStO8pMsTzGvhSocX4c9zXWyeskRkv
 IG1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683248818; x=1685840818;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JbBMk9JLIxgutGnQaDrHlYakr8/72eeE7gqabzbXCvE=;
 b=Mnf7k2CjBUFbBPk2zp9UklTI9YmqiYRknYemSsMXTqDbq2hzropojs2pwllJyWxMzI
 DWlu9g5zrVkt5vyHsBbuigeu1enktWWQ2R1+0UtMFpGgtE6q/QSA6bmdzpiObIRGxlci
 Lg2PRYKBzu6R6q5xbO5ZeNQSEwdj0vK0apw5lRhJKBnHXpKQrq+qO8ZO5bTPgbzzOvqY
 xA9fFSp9nka6HmRNBFu5IEEms293Rs0KPFyx3krGVENCpm7X6swCGRn5kBD2WfzfAyhT
 2fxY8XXDUqzSKWNl7bG/FE66bXE9KyQloy+yU20o7ir0Y7c4gTDz6DHZlFKQuznH8fhR
 n24Q==
X-Gm-Message-State: AC+VfDy4GouPWsVa82lc7BJy15Rllz/NcbbcI46PchcDnMlC3qYpImxG
 zshevipb7y/PMOeVsUIfZmuH6a5nSbUfPQ==
X-Google-Smtp-Source: ACHHUZ7ohM+hxpEvIm4j7Nf3NygOFZU8wrBfQ7U3saZf7EGxBSgid2iJqc3seCjSr1Svd1o4YYW9LQ==
X-Received: by 2002:a17:902:e808:b0:1a9:8d57:6d6c with SMTP id
 u8-20020a170902e80800b001a98d576d6cmr6810542plg.24.1683248818432; 
 Thu, 04 May 2023 18:06:58 -0700 (PDT)
Received: from toolbox.alistair23.me
 (2403-580b-97e8-0-321-6fb2-58f1-a1b1.ip6.aussiebb.net.
 [2403:580b:97e8:0:321:6fb2:58f1:a1b1])
 by smtp.gmail.com with ESMTPSA id
 l19-20020a170902d35300b0019309be03e7sm218762plk.66.2023.05.04.18.06.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 May 2023 18:06:57 -0700 (PDT)
From: Alistair Francis <alistair23@gmail.com>
X-Google-Original-From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Fei Wu <fei2.wu@intel.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 LIU Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PULL 64/89] target/riscv: Reduce overhead of MSTATUS_SUM change
Date: Fri,  5 May 2023 11:02:16 +1000
Message-Id: <20230505010241.21812-65-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230505010241.21812-1-alistair.francis@wdc.com>
References: <20230505010241.21812-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=alistair23@gmail.com; helo=mail-pl1-x62b.google.com
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

From: Fei Wu <fei2.wu@intel.com>

Kernel needs to access user mode memory e.g. during syscalls, the window
is usually opened up for a very limited time through MSTATUS.SUM, the
overhead is too much if tlb_flush() gets called for every SUM change.

This patch creates a separate MMU index for S+SUM, so that it's not
necessary to flush tlb anymore when SUM changes. This is similar to how
ARM handles Privileged Access Never (PAN).

Result of 'pipe 10' from unixbench boosts from 223656 to 1705006. Many
other syscalls benefit a lot from this too.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Fei Wu <fei2.wu@intel.com>
Message-Id: <20230324054154.414846-3-fei2.wu@intel.com>
Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Tested-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Message-Id: <20230325105429.1142530-8-richard.henderson@linaro.org>
Message-Id: <20230412114333.118895-8-richard.henderson@linaro.org>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.h                      |  2 --
 target/riscv/internals.h                | 14 ++++++++++++++
 target/riscv/cpu_helper.c               | 17 +++++++++++++++--
 target/riscv/csr.c                      |  3 +--
 target/riscv/op_helper.c                |  5 +++--
 target/riscv/insn_trans/trans_rvh.c.inc |  4 ++--
 6 files changed, 35 insertions(+), 10 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 9b971ee1b0..6239c99f4c 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -629,8 +629,6 @@ G_NORETURN void riscv_raise_exception(CPURISCVState *env,
 target_ulong riscv_cpu_get_fflags(CPURISCVState *env);
 void riscv_cpu_set_fflags(CPURISCVState *env, target_ulong);
 
-#define TB_FLAGS_PRIV_HYP_ACCESS_MASK   (1 << 2)
-
 #include "exec/cpu-all.h"
 
 FIELD(TB_FLAGS, MEM_IDX, 0, 3)
diff --git a/target/riscv/internals.h b/target/riscv/internals.h
index 5620fbffb6..b55152a7dc 100644
--- a/target/riscv/internals.h
+++ b/target/riscv/internals.h
@@ -21,6 +21,20 @@
 
 #include "hw/registerfields.h"
 
+/*
+ * The current MMU Modes are:
+ *  - U                 0b000
+ *  - S                 0b001
+ *  - S+SUM             0b010
+ *  - M                 0b011
+ *  - HLV/HLVX/HSV adds 0b100
+ */
+#define MMUIdx_U            0
+#define MMUIdx_S            1
+#define MMUIdx_S_SUM        2
+#define MMUIdx_M            3
+#define MMU_HYP_ACCESS_BIT  (1 << 2)
+
 /* share data between vector helpers and decode code */
 FIELD(VDATA, VM, 0, 1)
 FIELD(VDATA, LMUL, 1, 3)
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 36d6e422d7..174a77706b 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -21,6 +21,7 @@
 #include "qemu/log.h"
 #include "qemu/main-loop.h"
 #include "cpu.h"
+#include "internals.h"
 #include "pmu.h"
 #include "exec/exec-all.h"
 #include "instmap.h"
@@ -36,7 +37,19 @@ int riscv_cpu_mmu_index(CPURISCVState *env, bool ifetch)
 #ifdef CONFIG_USER_ONLY
     return 0;
 #else
-    return env->priv;
+    if (ifetch) {
+        return env->priv;
+    }
+
+    /* All priv -> mmu_idx mapping are here */
+    int mode = env->priv;
+    if (mode == PRV_M && get_field(env->mstatus, MSTATUS_MPRV)) {
+        mode = get_field(env->mstatus, MSTATUS_MPP);
+    }
+    if (mode == PRV_S && get_field(env->mstatus, MSTATUS_SUM)) {
+        return MMUIdx_S_SUM;
+    }
+    return mode;
 #endif
 }
 
@@ -588,7 +601,7 @@ void riscv_cpu_set_virt_enabled(CPURISCVState *env, bool enable)
 
 bool riscv_cpu_two_stage_lookup(int mmu_idx)
 {
-    return mmu_idx & TB_FLAGS_PRIV_HYP_ACCESS_MASK;
+    return mmu_idx & MMU_HYP_ACCESS_BIT;
 }
 
 int riscv_cpu_claim_interrupts(RISCVCPU *cpu, uint64_t interrupts)
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 92ad54411b..4a4d852bd1 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -1294,8 +1294,7 @@ static RISCVException write_mstatus(CPURISCVState *env, int csrno,
     val = legalize_mpp(env, get_field(mstatus, MSTATUS_MPP), val);
 
     /* flush tlb on mstatus fields that affect VM */
-    if ((val ^ mstatus) & (MSTATUS_MXR | MSTATUS_MPP | MSTATUS_MPV |
-            MSTATUS_MPRV | MSTATUS_SUM)) {
+    if ((val ^ mstatus) & (MSTATUS_MXR | MSTATUS_MPV)) {
         tlb_flush(env_cpu(env));
     }
     mask = MSTATUS_SIE | MSTATUS_SPIE | MSTATUS_MIE | MSTATUS_MPIE |
diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
index 0c10dd7a78..0adfd1ca9a 100644
--- a/target/riscv/op_helper.c
+++ b/target/riscv/op_helper.c
@@ -20,6 +20,7 @@
 
 #include "qemu/osdep.h"
 #include "cpu.h"
+#include "internals.h"
 #include "qemu/main-loop.h"
 #include "exec/exec-all.h"
 #include "exec/helper-proto.h"
@@ -428,14 +429,14 @@ void helper_hyp_gvma_tlb_flush(CPURISCVState *env)
 
 target_ulong helper_hyp_hlvx_hu(CPURISCVState *env, target_ulong address)
 {
-    int mmu_idx = cpu_mmu_index(env, true) | TB_FLAGS_PRIV_HYP_ACCESS_MASK;
+    int mmu_idx = cpu_mmu_index(env, true) | MMU_HYP_ACCESS_BIT;
 
     return cpu_lduw_mmuidx_ra(env, address, mmu_idx, GETPC());
 }
 
 target_ulong helper_hyp_hlvx_wu(CPURISCVState *env, target_ulong address)
 {
-    int mmu_idx = cpu_mmu_index(env, true) | TB_FLAGS_PRIV_HYP_ACCESS_MASK;
+    int mmu_idx = cpu_mmu_index(env, true) | MMU_HYP_ACCESS_BIT;
 
     return cpu_ldl_mmuidx_ra(env, address, mmu_idx, GETPC());
 }
diff --git a/target/riscv/insn_trans/trans_rvh.c.inc b/target/riscv/insn_trans/trans_rvh.c.inc
index 4b730cd492..ae98b45e5e 100644
--- a/target/riscv/insn_trans/trans_rvh.c.inc
+++ b/target/riscv/insn_trans/trans_rvh.c.inc
@@ -42,7 +42,7 @@ static bool do_hlv(DisasContext *ctx, arg_r2 *a, MemOp mop)
     if (check_access(ctx)) {
         TCGv dest = dest_gpr(ctx, a->rd);
         TCGv addr = get_gpr(ctx, a->rs1, EXT_NONE);
-        int mem_idx = ctx->mem_idx | TB_FLAGS_PRIV_HYP_ACCESS_MASK;
+        int mem_idx = ctx->mem_idx | MMU_HYP_ACCESS_BIT;
         tcg_gen_qemu_ld_tl(dest, addr, mem_idx, mop);
         gen_set_gpr(ctx, a->rd, dest);
     }
@@ -89,7 +89,7 @@ static bool do_hsv(DisasContext *ctx, arg_r2_s *a, MemOp mop)
     if (check_access(ctx)) {
         TCGv addr = get_gpr(ctx, a->rs1, EXT_NONE);
         TCGv data = get_gpr(ctx, a->rs2, EXT_NONE);
-        int mem_idx = ctx->mem_idx | TB_FLAGS_PRIV_HYP_ACCESS_MASK;
+        int mem_idx = ctx->mem_idx | MMU_HYP_ACCESS_BIT;
         tcg_gen_qemu_st_tl(data, addr, mem_idx, mop);
     }
     return true;
-- 
2.40.0


