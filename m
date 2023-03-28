Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 363146CB371
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Mar 2023 03:56:25 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pgyY6-0007Hn-HX; Mon, 27 Mar 2023 21:54:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1pgyY3-0007Ha-V8
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 21:54:55 -0400
Received: from out30-131.freemail.mail.aliyun.com ([115.124.30.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1pgyXz-0000Au-T6
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 21:54:55 -0400
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R161e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018045176;
 MF=zhiwei_liu@linux.alibaba.com; NM=1; PH=DS; RN=2; SR=0;
 TI=SMTPD_---0VeqyxV8_1679968481; 
Received: from 30.221.98.176(mailfrom:zhiwei_liu@linux.alibaba.com
 fp:SMTPD_---0VeqyxV8_1679968481) by smtp.aliyun-inc.com;
 Tue, 28 Mar 2023 09:54:41 +0800
Message-ID: <61c3d6d1-e242-f256-7d68-51a2155dc62a@linux.alibaba.com>
Date: Tue, 28 Mar 2023 09:54:39 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v6 13/25] target/riscv: Introduce mmuidx_priv
Content-Language: en-US
From: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20230325105429.1142530-1-richard.henderson@linaro.org>
 <20230325105429.1142530-14-richard.henderson@linaro.org>
 <a4e87eab-aace-a17b-fef5-5c5b1118a561@linux.alibaba.com>
 <6b21f385-96fd-78f4-bdba-ed552bf2464a@linaro.org>
 <075a0bde-0d28-75e1-097f-f5218403b23d@linux.alibaba.com>
In-Reply-To: <075a0bde-0d28-75e1-097f-f5218403b23d@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=115.124.30.131;
 envelope-from=zhiwei_liu@linux.alibaba.com;
 helo=out30-131.freemail.mail.aliyun.com
X-Spam_score_int: -98
X-Spam_score: -9.9
X-Spam_bar: ---------
X-Spam_report: (-9.9 / 5.0 requ) BAYES_00=-1.9, ENV_AND_HDR_SPF_MATCH=-0.5,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, UNPARSEABLE_RELAY=0.001,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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


On 2023/3/28 9:33, LIU Zhiwei wrote:
>
> On 2023/3/28 0:29, Richard Henderson wrote:
>> On 3/26/23 19:07, LIU Zhiwei wrote:
>>>> +static inline int mmuidx_priv(int mmu_idx)
>>>> +{
>>>> +    int ret = mmu_idx & 3;
>>>> +    if (ret == MMUIdx_S_SUM) {
>>>> +        ret = PRV_S;
>>>> +    }
>>>> +    return ret;
>>>> +}
>>>> +
>>>
>>> Can we remove the PRIV from the tb flags after we have this function?
>>
>> No, because this is the priv of the memory operation as modified by 
>> e.g. MPRV, not the true cpu priv.
>
> For this implementation, we explicitly use the tb flags for mmu index. 
> I think it is the reason why we have to maintain the redundant 
> privilege in tb flags.
> It may be better to only store machine states into tb flags. Can we 
> just pass everything that we need, for example, the priv and sum, and 
> then implicitly
> calculate the ctx->mem_idx in disas_init_fn?
>
> I remember that you give the similar suggestion in the comment process
>
> https://mail.gnu.org/archive/html/qemu-riscv/2023-03/msg00566.html
>
> Best Regards,
> Zhiwei
>
To make this comment clear, I paste a simple implementatioin here. But 
it is just for discussing, not a normal patch for merging.

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 623288e6f9..d4506be5be 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -632,12 +632,10 @@ G_NORETURN void 
riscv_raise_exception(CPURISCVState *env,
  target_ulong riscv_cpu_get_fflags(CPURISCVState *env);
  void riscv_cpu_set_fflags(CPURISCVState *env, target_ulong);

-#define TB_FLAGS_PRIV_MMU_MASK                3
-#define TB_FLAGS_PRIV_HYP_ACCESS_MASK   (1 << 2)
-
  #include "exec/cpu-all.h"

-FIELD(TB_FLAGS, MEM_IDX, 0, 3)
+FIELD(TB_FLAGS, PRIV, 0, 2)
+FIELD(TB_FLAGS, SUM, 2, 1)
  FIELD(TB_FLAGS, FS, 3, 2)
  /* Vector flags */
  FIELD(TB_FLAGS, VS, 5, 2)
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index f80d069884..b11f583643 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -30,6 +30,7 @@
  #include "sysemu/cpu-timers.h"
  #include "cpu_bits.h"
  #include "debug.h"
+#include "internals.h"

  int riscv_cpu_mmu_index(CPURISCVState *env, bool ifetch)
  {
@@ -40,6 +41,20 @@ int riscv_cpu_mmu_index(CPURISCVState *env, bool ifetch)
  #endif
  }

+#ifndef CONFIG_USER_ONLY
+static bool riscv_cpu_sum_enabled(CPURISCVState *env)
+{
+    int mode = env->priv;
+    if (mode == PRV_M && get_field(env->mstatus, MSTATUS_MPRV)) {
+        mode = get_field(env->mstatus, MSTATUS_MPP);
+    }
+    if (mode == PRV_S && get_field(env->mstatus, MSTATUS_SUM)) {
+        return true;
+    }
+    return false;
+}
+#endif
+
  void cpu_get_tb_cpu_state(CPURISCVState *env, target_ulong *pc,
                            target_ulong *cs_base, uint32_t *pflags)
  {
@@ -80,10 +95,11 @@ void cpu_get_tb_cpu_state(CPURISCVState *env, 
target_ulong *pc,
      }

  #ifdef CONFIG_USER_ONLY
     flags =  FIELD_DP32(flags, TB_FLAGS, FS, EXT_STATUS_DIRTY);
     flags =  FIELD_DP32(flags, TB_FLAGS, VS, EXT_STATUS_DIRTY);
  #else
-    flags |= cpu_mmu_index(env, 0);
+    flags = FIELD_DP32(flags, TB_FLAGS, PRIV, env->priv);
+    flags = FIELD_DP32(flags, TB_FLAGS, SUM, riscv_cpu_sum_enabled(env));
      if (riscv_cpu_fp_enabled(env)) {
          flags =  FIELD_DP32(flags, TB_FLAGS, FS,
                              get_field(env->mstatus, MSTATUS_FS));
@@ -600,7 +616,7 @@ void riscv_cpu_set_virt_enabled(CPURISCVState *env, 
bool enable)

  bool riscv_cpu_two_stage_lookup(int mmu_idx)
  {
-    return mmu_idx & TB_FLAGS_PRIV_HYP_ACCESS_MASK;
+    return mmu_idx & MMU_HYP_ACCESS_BIT;
  }

  int riscv_cpu_claim_interrupts(RISCVCPU *cpu, uint64_t interrupts)
@@ -766,7 +782,7 @@ static int get_physical_address(CPURISCVState *env, 
hwaddr *physical,
       * (riscv_cpu_do_interrupt) is correct */
      MemTxResult res;
      MemTxAttrs attrs = MEMTXATTRS_UNSPECIFIED;
-    int mode = mmu_idx & TB_FLAGS_PRIV_MMU_MASK;
+    int mode = mmu_idx;
      bool use_background = false;
      hwaddr ppn;
      RISCVCPU *cpu = env_archcpu(env);
@@ -788,10 +804,8 @@ static int get_physical_address(CPURISCVState *env, 
hwaddr *physical,
         instructions, HLV, HLVX, and HSV. */
      if (riscv_cpu_two_stage_lookup(mmu_idx)) {
          mode = get_field(env->hstatus, HSTATUS_SPVP);
-    } else if (mode == PRV_M && access_type != MMU_INST_FETCH) {
-        if (get_field(env->mstatus, MSTATUS_MPRV)) {
-            mode = get_field(env->mstatus, MSTATUS_MPP);
-        }
+    } else if (mmu_idx == MMUIdx_S_SUM) {
+        mode = PRV_S;
      }
      if (first_stage == false) {
@@ -847,7 +861,7 @@ static int get_physical_address(CPURISCVState *env, 
hwaddr *physical,
          widened = 2;
      }
      /* status.SUM will be ignored if execute on background */
-    sum = get_field(env->mstatus, MSTATUS_SUM) || use_background || 
is_debug;
+    sum = (mmu_idx == MMUIdx_S_SUM) || use_background || is_debug;
      switch (vm) {
      case VM_1_10_SV32:
        levels = 2; ptidxbits = 10; ptesize = 4; break;
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index abea7b749e..dd5f774b2f 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -1247,7 +1247,7 @@ static RISCVException write_mstatus(CPURISCVState 
*env, int csrno,

      /* flush tlb on mstatus fields that affect VM */
      if ((val ^ mstatus) & (MSTATUS_MXR | MSTATUS_MPP | MSTATUS_MPV |
-            MSTATUS_MPRV | MSTATUS_SUM)) {
+            MSTATUS_MPRV)) {
          tlb_flush(env_cpu(env));
      }
      mask = MSTATUS_SIE | MSTATUS_SPIE | MSTATUS_MIE | MSTATUS_MPIE |
diff --git a/target/riscv/insn_trans/trans_privileged.c.inc 
b/target/riscv/insn_trans/trans_privileged.c.inc
index 59501b2780..9305b18299 100644
--- a/target/riscv/insn_trans/trans_privileged.c.inc
+++ b/target/riscv/insn_trans/trans_privileged.c.inc
@@ -52,7 +52,7 @@ static bool trans_ebreak(DisasContext *ctx, arg_ebreak *a)
       * that no exception will be raised when fetching them.
       */

-    if (semihosting_enabled(ctx->mem_idx < PRV_S) &&
+    if (semihosting_enabled(ctx->priv < PRV_S) &&
          (pre_addr & TARGET_PAGE_MASK) == (post_addr & TARGET_PAGE_MASK)) {
          pre    = opcode_at(&ctx->base, pre_addr);
          ebreak = opcode_at(&ctx->base, ebreak_addr);
diff --git a/target/riscv/insn_trans/trans_rvh.c.inc 
b/target/riscv/insn_trans/trans_rvh.c.inc
index 9248b48c36..15842f4282 100644
--- a/target/riscv/insn_trans/trans_rvh.c.inc
+++ b/target/riscv/insn_trans/trans_rvh.c.inc
@@ -40,7 +40,7 @@ static bool do_hlv(DisasContext *ctx, arg_r2 *a, MemOp 
mop)
      if (check_access(ctx)) {
          TCGv dest = dest_gpr(ctx, a->rd);
          TCGv addr = get_gpr(ctx, a->rs1, EXT_NONE);
-        int mem_idx = ctx->mem_idx | TB_FLAGS_PRIV_HYP_ACCESS_MASK;
+        int mem_idx = ctx->mem_idx | MMU_HYP_ACCESS_BIT;
          tcg_gen_qemu_ld_tl(dest, addr, mem_idx, mop);
          gen_set_gpr(ctx, a->rd, dest);
      }
@@ -87,7 +87,7 @@ static bool do_hsv(DisasContext *ctx, arg_r2_s *a, 
MemOp mop)
      if (check_access(ctx)) {
          TCGv addr = get_gpr(ctx, a->rs1, EXT_NONE);
          TCGv data = get_gpr(ctx, a->rs2, EXT_NONE);
-        int mem_idx = ctx->mem_idx | TB_FLAGS_PRIV_HYP_ACCESS_MASK;
+        int mem_idx = ctx->mem_idx | MMU_HYP_ACCESS_BIT;
          tcg_gen_qemu_st_tl(data, addr, mem_idx, mop);
      }
      return true;
diff --git a/target/riscv/insn_trans/trans_xthead.c.inc 
b/target/riscv/insn_trans/trans_xthead.c.inc
index df504c3f2c..a6d823b382 100644
--- a/target/riscv/insn_trans/trans_xthead.c.inc
+++ b/target/riscv/insn_trans/trans_xthead.c.inc
@@ -263,23 +263,13 @@ static bool trans_th_tst(DisasContext *ctx, 
arg_th_tst *a)

  /* XTheadCmo */

-static inline int priv_level(DisasContext *ctx)
-{
-#ifdef CONFIG_USER_ONLY
-    return PRV_U;
-#else
-     /* Priv level is part of mem_idx. */
-    return ctx->mem_idx & TB_FLAGS_PRIV_MMU_MASK;
-#endif
-}
-
  /* Test if priv level is M, S, or U (cannot fail). */
  #define REQUIRE_PRIV_MSU(ctx)

  /* Test if priv level is M or S. */
  #define REQUIRE_PRIV_MS(ctx)                                    \
  do {                                                            \
-    int priv = priv_level(ctx);                                 \
+    int priv = ctx->priv;                                       \
      if (!(priv == PRV_M ||                                      \
            priv == PRV_S)) {                                     \
          return false;                                           \
diff --git a/target/riscv/internals.h b/target/riscv/internals.h
index 5620fbffb6..b55152a7dc 100644
--- a/target/riscv/internals.h
+++ b/target/riscv/internals.h
@@ -21,6 +21,20 @@

  #include "hw/registerfields.h"

+/*
+ * The current MMU Modes are:
+ *  - U                 0b000
+ *  - S                 0b001
+ *  - S+SUM             0b010
+ *  - M                 0b011
+ *  - HLV/HLVX/HSV adds 0b100
+ */
+#define MMUIdx_U            0
+#define MMUIdx_S            1
+#define MMUIdx_S_SUM        2
+#define MMUIdx_M            3
+#define MMU_HYP_ACCESS_BIT  (1 << 2)
+
  /* share data between vector helpers and decode code */
  FIELD(VDATA, VM, 0, 1)
  FIELD(VDATA, LMUL, 1, 3)
diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
index 84ee018f7d..8a0ddb91b5 100644
--- a/target/riscv/op_helper.c
+++ b/target/riscv/op_helper.c
@@ -23,6 +23,7 @@
  #include "qemu/main-loop.h"
  #include "exec/exec-all.h"
  #include "exec/helper-proto.h"
+#include "internals.h"

  /* Exceptions processing helpers */
  G_NORETURN void riscv_raise_exception(CPURISCVState *env,
@@ -428,14 +429,14 @@ void helper_hyp_gvma_tlb_flush(CPURISCVState *env)

  target_ulong helper_hyp_hlvx_hu(CPURISCVState *env, target_ulong address)
  {
-    int mmu_idx = cpu_mmu_index(env, true) | TB_FLAGS_PRIV_HYP_ACCESS_MASK;
+    int mmu_idx = cpu_mmu_index(env, true) | MMU_HYP_ACCESS_BIT;

      return cpu_lduw_mmuidx_ra(env, address, mmu_idx, GETPC());
  }

  target_ulong helper_hyp_hlvx_wu(CPURISCVState *env, target_ulong address)
  {
-    int mmu_idx = cpu_mmu_index(env, true) | TB_FLAGS_PRIV_HYP_ACCESS_MASK;
+    int mmu_idx = cpu_mmu_index(env, true) | MMU_HYP_ACCESS_BIT;

      return cpu_ldl_mmuidx_ra(env, address, mmu_idx, GETPC());
  }
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index e8bac1b470..f32cd7143a 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -69,6 +69,7 @@ typedef struct DisasContext {
      uint32_t mstatus_hs_fs;
      uint32_t mstatus_hs_vs;
      uint32_t mem_idx;
+    uint32_t priv;
      /* Remember the rounding mode encoded in the previous fp instruction,
         which we have already installed into env->fp_status. Or -1 for
         no previous fp instruction.  Note that we exit the TB when writing
@@ -1152,7 +1153,12 @@ static void 
riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
      uint32_t tb_flags = ctx->base.tb->flags;

      ctx->pc_succ_insn = ctx->base.pc_first;
-    ctx->mem_idx = FIELD_EX32(tb_flags, TB_FLAGS, MEM_IDX);
+    ctx->priv = FIELD_EX32(tb_flags, TB_FLAGS, PRIV);
+    if (FIELD_EX32(tb_flags, TB_FLAGS, SUM)) {
+        ctx->mem_idx = MMUIdx_S_SUM;
+    } else {
+        ctx->mem_idx = ctx->priv;
+    }
      ctx->mstatus_fs = FIELD_EX32(tb_flags, TB_FLAGS, FS);
      ctx->mstatus_vs = FIELD_EX32(tb_flags, TB_FLAGS, VS);
      ctx->priv_ver = env->priv_ver;

Best Regards,
Zhiwei

>>
>>
>> r~

