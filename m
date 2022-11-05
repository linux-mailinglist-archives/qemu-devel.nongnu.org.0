Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5544761A6D5
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Nov 2022 03:12:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1or8eK-0003c7-Qr; Fri, 04 Nov 2022 22:11:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r@hev.cc>) id 1or8eI-0003bl-U7
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 22:11:06 -0400
Received: from mail-pg1-f170.google.com ([209.85.215.170])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <r@hev.cc>) id 1or8eH-00052V-5i
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 22:11:06 -0400
Received: by mail-pg1-f170.google.com with SMTP id e129so5831664pgc.9
 for <qemu-devel@nongnu.org>; Fri, 04 Nov 2022 19:11:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zAsCSoNFqlfiwspvtN/3cVt2V0uwvF1YPd0T7BCFVy8=;
 b=3zTjgN9tc6/UYyBLd/LFnjAciLb4bNqq4Ok0MR7H1Sz9EVbgqN/Rqzg4xCCiitwlSW
 52SGbcinG4M4FakF7EwomDjyLfjexrFVjaBNvGM+KQoOuNck0cC9EachFTp4aTkgMA3r
 apleQgtxSMMAs4ytb+EHrdtSnl6a6wPVvFQB3nSf51lPrk+YYiuDr/ctt0ZzI54ry1VU
 UWWiIO89ykd6x8CR1QONO6xA9meXn+LezyiyqVkB9h9CgzwcApXDHdlyJgFzxM8uOFpB
 pomhySVugKSSvnkC49Ld4GRHjgcJ82pU2LZ8KkuYqn7aUCJy+5Jpya3RuAYAqavOpqeK
 QE7Q==
X-Gm-Message-State: ACrzQf1MtKu97BLYmqubUzT1Oq5IVJcm6XL/4moX2lPGHX5lKJBCA9p5
 grDQ8yffNzzw3wwdrjMo4SoacQ==
X-Google-Smtp-Source: AMsMyM78vQxeI0CSs1lQuhrLXsT1uNMORjy2mozr8Li3pbl3aOLJ92Knwg9NmmPNpgM6QQacXtXHag==
X-Received: by 2002:a05:6a00:1145:b0:52b:78c:fa26 with SMTP id
 b5-20020a056a00114500b0052b078cfa26mr38337156pfm.27.1667614263205; 
 Fri, 04 Nov 2022 19:11:03 -0700 (PDT)
Received: from localhost.localdomain ([2400:8901:e002:5400::])
 by smtp.gmail.com with ESMTPSA id
 d18-20020a170902aa9200b00186a2274382sm407809plr.76.2022.11.04.19.11.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Nov 2022 19:11:02 -0700 (PDT)
From: Rui Wang <wangrui@loongson.cn>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: Song Gao <gaosong@loongson.cn>, Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 qemu-devel@nongnu.org, hev <qemu@hev.cc>, Rui Wang <wangrui@loongson.cn>
Subject: [PATCH v4 1/2] target/loongarch: Adjust the layout of hardware flags
 bit fields
Date: Sat,  5 Nov 2022 10:10:21 +0800
Message-Id: <20221105021022.558242-2-wangrui@loongson.cn>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221105021022.558242-1-wangrui@loongson.cn>
References: <20221105021022.558242-1-wangrui@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=209.85.215.170; envelope-from=r@hev.cc;
 helo=mail-pg1-f170.google.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Rui Wang <wangrui@loongson.cn>
---
 target/loongarch/cpu.h                        | 27 ++++++++++++-------
 .../insn_trans/trans_privileged.c.inc         |  4 +--
 target/loongarch/tlb_helper.c                 |  4 +--
 target/loongarch/translate.c                  |  7 ++++-
 target/loongarch/translate.h                  |  3 ++-
 5 files changed, 29 insertions(+), 16 deletions(-)

diff --git a/target/loongarch/cpu.h b/target/loongarch/cpu.h
index dbce176564..026cd6bb52 100644
--- a/target/loongarch/cpu.h
+++ b/target/loongarch/cpu.h
@@ -14,6 +14,7 @@
 #include "qemu/timer.h"
 #include "exec/memory.h"
 #include "hw/sysbus.h"
+#include "cpu-csr.h"
 
 #define IOCSRF_TEMP             0
 #define IOCSRF_NODECNT          1
@@ -373,24 +374,30 @@ struct LoongArchCPUClass {
  * 0 for kernel mode, 3 for user mode.
  * Define an extra index for DA(direct addressing) mode.
  */
-#define MMU_KERNEL_IDX   0
-#define MMU_USER_IDX     3
-#define MMU_DA_IDX       4
+#define MMU_PLV_KERNEL   0
+#define MMU_PLV_USER     3
+#define MMU_IDX_KERNEL   MMU_PLV_KERNEL
+#define MMU_IDX_USER     MMU_PLV_USER
+#define MMU_IDX_DA       4
 
 static inline int cpu_mmu_index(CPULoongArchState *env, bool ifetch)
 {
 #ifdef CONFIG_USER_ONLY
-    return MMU_USER_IDX;
+    return MMU_IDX_USER;
 #else
-    uint8_t pg = FIELD_EX64(env->CSR_CRMD, CSR_CRMD, PG);
-
-    if (!pg) {
-        return MMU_DA_IDX;
+    if (FIELD_EX64(env->CSR_CRMD, CSR_CRMD, PG)) {
+        return FIELD_EX64(env->CSR_CRMD, CSR_CRMD, PLV);
     }
-    return FIELD_EX64(env->CSR_CRMD, CSR_CRMD, PLV);
+    return MMU_IDX_DA;
 #endif
 }
 
+/*
+ * LoongArch CPUs hardware flags.
+ */
+#define HW_FLAGS_PLV_MASK   R_CSR_CRMD_PLV_MASK  /* 0x03 */
+#define HW_FLAGS_CRMD_PG    R_CSR_CRMD_PG_MASK   /* 0x10 */
+
 static inline void cpu_get_tb_cpu_state(CPULoongArchState *env,
                                         target_ulong *pc,
                                         target_ulong *cs_base,
@@ -398,7 +405,7 @@ static inline void cpu_get_tb_cpu_state(CPULoongArchState *env,
 {
     *pc = env->pc;
     *cs_base = 0;
-    *flags = cpu_mmu_index(env, false);
+    *flags = env->CSR_CRMD & (R_CSR_CRMD_PLV_MASK | R_CSR_CRMD_PG_MASK);
 }
 
 void loongarch_cpu_list(void);
diff --git a/target/loongarch/insn_trans/trans_privileged.c.inc b/target/loongarch/insn_trans/trans_privileged.c.inc
index 9c4dcbfcfb..40f82becb0 100644
--- a/target/loongarch/insn_trans/trans_privileged.c.inc
+++ b/target/loongarch/insn_trans/trans_privileged.c.inc
@@ -159,7 +159,7 @@ static const CSRInfo csr_info[] = {
 
 static bool check_plv(DisasContext *ctx)
 {
-    if (ctx->base.tb->flags == MMU_USER_IDX) {
+    if (ctx->plv == MMU_PLV_USER) {
         generate_exception(ctx, EXCCODE_IPE);
         return true;
     }
@@ -335,7 +335,7 @@ TRANS(iocsrwr_d, gen_iocsrwr, gen_helper_iocsrwr_d)
 
 static void check_mmu_idx(DisasContext *ctx)
 {
-    if (ctx->mem_idx != MMU_DA_IDX) {
+    if (ctx->mem_idx != MMU_IDX_DA) {
         tcg_gen_movi_tl(cpu_pc, ctx->base.pc_next + 4);
         ctx->base.is_jmp = DISAS_EXIT;
     }
diff --git a/target/loongarch/tlb_helper.c b/target/loongarch/tlb_helper.c
index d2f8fb0c60..c6d1de50fe 100644
--- a/target/loongarch/tlb_helper.c
+++ b/target/loongarch/tlb_helper.c
@@ -170,8 +170,8 @@ static int get_physical_address(CPULoongArchState *env, hwaddr *physical,
                                 int *prot, target_ulong address,
                                 MMUAccessType access_type, int mmu_idx)
 {
-    int user_mode = mmu_idx == MMU_USER_IDX;
-    int kernel_mode = mmu_idx == MMU_KERNEL_IDX;
+    int user_mode = mmu_idx == MMU_IDX_USER;
+    int kernel_mode = mmu_idx == MMU_IDX_KERNEL;
     uint32_t plv, base_c, base_v;
     int64_t addr_high;
     uint8_t da = FIELD_EX64(env->CSR_CRMD, CSR_CRMD, DA);
diff --git a/target/loongarch/translate.c b/target/loongarch/translate.c
index 6091772349..38ced69803 100644
--- a/target/loongarch/translate.c
+++ b/target/loongarch/translate.c
@@ -75,7 +75,12 @@ static void loongarch_tr_init_disas_context(DisasContextBase *dcbase,
     DisasContext *ctx = container_of(dcbase, DisasContext, base);
 
     ctx->page_start = ctx->base.pc_first & TARGET_PAGE_MASK;
-    ctx->mem_idx = ctx->base.tb->flags;
+    ctx->plv = ctx->base.tb->flags & HW_FLAGS_PLV_MASK;
+    if (ctx->base.tb->flags & HW_FLAGS_CRMD_PG) {
+        ctx->mem_idx = ctx->plv;
+    } else {
+        ctx->mem_idx = MMU_IDX_DA;
+    }
 
     /* Bound the number of insns to execute to those left on the page.  */
     bound = -(ctx->base.pc_first | TARGET_PAGE_MASK) / 4;
diff --git a/target/loongarch/translate.h b/target/loongarch/translate.h
index 9cc12512d1..6d2e382e8b 100644
--- a/target/loongarch/translate.h
+++ b/target/loongarch/translate.h
@@ -29,7 +29,8 @@ typedef struct DisasContext {
     DisasContextBase base;
     target_ulong page_start;
     uint32_t opcode;
-    int mem_idx;
+    uint16_t mem_idx;
+    uint16_t plv;
     TCGv zero;
     /* Space for 3 operands plus 1 extra for address computation. */
     TCGv temp[4];
-- 
2.38.1


