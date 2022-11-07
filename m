Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4CD961E9C3
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Nov 2022 04:33:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1orssk-0000N4-Ij; Sun, 06 Nov 2022 22:33:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1orssi-0000MO-A8
 for qemu-devel@nongnu.org; Sun, 06 Nov 2022 22:33:04 -0500
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1orssf-0004X5-MP
 for qemu-devel@nongnu.org; Sun, 06 Nov 2022 22:33:04 -0500
Received: from loongson.cn (unknown [10.2.5.185])
 by gateway (Coremail) with SMTP id _____8CxbbdofGhj2O8EAA--.11401S3;
 Mon, 07 Nov 2022 11:32:56 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.185])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8CxJldifGhjjUMOAA--.21646S3; 
 Mon, 07 Nov 2022 11:32:53 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, stefanha@gmail.com,
 Rui Wang <wangrui@loongson.cn>
Subject: [PULL 1/2] target/loongarch: Separate the hardware flags into MMU
 index and PLV
Date: Mon,  7 Nov 2022 11:32:49 +0800
Message-Id: <20221107033250.4163885-2-gaosong@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20221107033250.4163885-1-gaosong@loongson.cn>
References: <20221107033250.4163885-1-gaosong@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8CxJldifGhjjUMOAA--.21646S3
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjvJXoWxXr4kCrW7tw45Cw13CFy5CFg_yoWrtr45pr
 17CryxKF48GrZ7Aan7X3y3tr1UXr43Kw4IgaySg3sYka13Xr48ZrW8Kr9I9FW5Jayruryj
 qF4kAr4jyF4xXa7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
 qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
 bn8Fc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4
 AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF
 7I0E14v26r4j6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7
 CjxVAFwI0_Gr1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2
 zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VCjz48v1sIEY20_WwAm72CE4IkC6x
 0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2Ij64vIr41l42xK82IY6x8ErcxF
 aVAv8VWrMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxV
 Cjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY
 6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6x
 AIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY
 1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvj4RC_MaUUUUU
Received-SPF: pass client-ip=114.242.206.163; envelope-from=gaosong@loongson.cn;
 helo=loongson.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Rui Wang <wangrui@loongson.cn>

Regarding the patchset v3 has been merged into main line, and not
approved, this patch updates to patchset v4.

Fixes: b4bda200 ("target/loongarch: Adjust the layout of hardware flags bit fields")
Link: https://lists.nongnu.org/archive/html/qemu-devel/2022-11/msg00808.html
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Rui Wang <wangrui@loongson.cn>
Message-Id: <20221107024526.702297-2-wangrui@loongson.cn>
Signed-off-by: Song Gao <gaosong@loongson.cn>
---
 target/loongarch/cpu.h                         | 18 +++++++++---------
 .../insn_trans/trans_privileged.c.inc          |  4 ++--
 target/loongarch/tlb_helper.c                  |  4 ++--
 target/loongarch/translate.c                   |  5 +++--
 target/loongarch/translate.h                   |  3 ++-
 5 files changed, 18 insertions(+), 16 deletions(-)

diff --git a/target/loongarch/cpu.h b/target/loongarch/cpu.h
index 08c1f6baa1..e15c633b0b 100644
--- a/target/loongarch/cpu.h
+++ b/target/loongarch/cpu.h
@@ -374,21 +374,21 @@ struct LoongArchCPUClass {
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
 
diff --git a/target/loongarch/insn_trans/trans_privileged.c.inc b/target/loongarch/insn_trans/trans_privileged.c.inc
index ff3a6d95ae..40f82becb0 100644
--- a/target/loongarch/insn_trans/trans_privileged.c.inc
+++ b/target/loongarch/insn_trans/trans_privileged.c.inc
@@ -159,7 +159,7 @@ static const CSRInfo csr_info[] = {
 
 static bool check_plv(DisasContext *ctx)
 {
-    if (ctx->mem_idx == MMU_USER_IDX) {
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
index 31462b2b61..38ced69803 100644
--- a/target/loongarch/translate.c
+++ b/target/loongarch/translate.c
@@ -75,10 +75,11 @@ static void loongarch_tr_init_disas_context(DisasContextBase *dcbase,
     DisasContext *ctx = container_of(dcbase, DisasContext, base);
 
     ctx->page_start = ctx->base.pc_first & TARGET_PAGE_MASK;
+    ctx->plv = ctx->base.tb->flags & HW_FLAGS_PLV_MASK;
     if (ctx->base.tb->flags & HW_FLAGS_CRMD_PG) {
-        ctx->mem_idx = ctx->base.tb->flags & HW_FLAGS_PLV_MASK;
+        ctx->mem_idx = ctx->plv;
     } else {
-        ctx->mem_idx = MMU_DA_IDX;
+        ctx->mem_idx = MMU_IDX_DA;
     }
 
     /* Bound the number of insns to execute to those left on the page.  */
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
2.31.1


