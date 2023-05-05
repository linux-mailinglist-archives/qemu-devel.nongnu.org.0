Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB5F96F7B19
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 04:37:30 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pulCa-0006XK-QP; Thu, 04 May 2023 22:29:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1pulCY-0006TG-D1
 for qemu-devel@nongnu.org; Thu, 04 May 2023 22:29:42 -0400
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1pulCU-0000JU-RU
 for qemu-devel@nongnu.org; Thu, 04 May 2023 22:29:42 -0400
Received: from loongson.cn (unknown [10.2.5.185])
 by gateway (Coremail) with SMTP id _____8DxI_AFalRkFfgEAA--.8130S3;
 Fri, 05 May 2023 10:29:25 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.185])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8Bx8a+2aVRkNw9LAA--.7251S45; 
 Fri, 05 May 2023 10:29:24 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org
Subject: [PULL 43/45] target/loongarch: Use {set/get}_gpr replace to cpu_fpr
Date: Fri,  5 May 2023 10:28:04 +0800
Message-Id: <20230505022806.6082-44-gaosong@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230505022806.6082-1-gaosong@loongson.cn>
References: <20230505022806.6082-1-gaosong@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Bx8a+2aVRkNw9LAA--.7251S45
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjvAXoWfJF17uF4xAF4DAr1Dtr18Xwb_yoW8XF18Xo
 Z7X3WUArZ7Jr43uF9akFs7Xay2vFy7Wa1fAws09a4kWa1xur18t3WrKwn8ZayUGF9Igryf
 WFn3tFy7J34xAr1Dn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXasCq-sGcSsGvf
 J3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU0xBIdaVrnRJU
 UUqC1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l8cAvFVAK0II2c7xJM28CjxkF64
 kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVWDJVCq3wA2z4x0Y4vE2Ix0cI8IcVCY
 1x0267AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2js
 IEc7CjxVAFwI0_Gr1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI
 8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VCjz48v1sIEY20_WwAm72CE4I
 kC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2Ij64vIr41l42xK82IY6x8E
 rcxFaVAv8VWrMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2
 IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUXVWUAwCIc40Y0x0EwIxGrwCI
 42IY6xIIjxv20xvE14v26w1j6s0DMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWxJVW8Jr1lIx
 AIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26F4j6r4UJwCI42IY6I8E
 87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvj4RC_MaUUUUU
Received-SPF: pass client-ip=114.242.206.163; envelope-from=gaosong@loongson.cn;
 helo=loongson.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Introduce set_fpr() and get_fpr() and remove cpu_fpr.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Song Gao <gaosong@loongson.cn>
Message-Id: <20230504122810.4094787-44-gaosong@loongson.cn>
---
 .../loongarch/insn_trans/trans_farith.c.inc   | 72 +++++++++++++++----
 target/loongarch/insn_trans/trans_fcmp.c.inc  | 12 ++--
 .../loongarch/insn_trans/trans_fmemory.c.inc  | 37 ++++++----
 target/loongarch/insn_trans/trans_fmov.c.inc  | 31 +++++---
 target/loongarch/translate.c                  | 20 ++++--
 5 files changed, 129 insertions(+), 43 deletions(-)

diff --git a/target/loongarch/insn_trans/trans_farith.c.inc b/target/loongarch/insn_trans/trans_farith.c.inc
index 7081fbb89b..21ea47308b 100644
--- a/target/loongarch/insn_trans/trans_farith.c.inc
+++ b/target/loongarch/insn_trans/trans_farith.c.inc
@@ -17,18 +17,29 @@
 static bool gen_fff(DisasContext *ctx, arg_fff *a,
                     void (*func)(TCGv, TCGv_env, TCGv, TCGv))
 {
+    TCGv dest = get_fpr(ctx, a->fd);
+    TCGv src1 = get_fpr(ctx, a->fj);
+    TCGv src2 = get_fpr(ctx, a->fk);
+
     CHECK_FPE;
 
-    func(cpu_fpr[a->fd], cpu_env, cpu_fpr[a->fj], cpu_fpr[a->fk]);
+    func(dest, cpu_env, src1, src2);
+    set_fpr(a->fd, dest);
+
     return true;
 }
 
 static bool gen_ff(DisasContext *ctx, arg_ff *a,
                    void (*func)(TCGv, TCGv_env, TCGv))
 {
+    TCGv dest = get_fpr(ctx, a->fd);
+    TCGv src = get_fpr(ctx, a->fj);
+
     CHECK_FPE;
 
-    func(cpu_fpr[a->fd], cpu_env, cpu_fpr[a->fj]);
+    func(dest, cpu_env, src);
+    set_fpr(a->fd, dest);
+
     return true;
 }
 
@@ -37,61 +48,98 @@ static bool gen_muladd(DisasContext *ctx, arg_ffff *a,
                        int flag)
 {
     TCGv_i32 tflag = tcg_constant_i32(flag);
+    TCGv dest = get_fpr(ctx, a->fd);
+    TCGv src1 = get_fpr(ctx, a->fj);
+    TCGv src2 = get_fpr(ctx, a->fk);
+    TCGv src3 = get_fpr(ctx, a->fa);
 
     CHECK_FPE;
 
-    func(cpu_fpr[a->fd], cpu_env, cpu_fpr[a->fj],
-         cpu_fpr[a->fk], cpu_fpr[a->fa], tflag);
+    func(dest, cpu_env, src1, src2, src3, tflag);
+    set_fpr(a->fd, dest);
+
     return true;
 }
 
 static bool trans_fcopysign_s(DisasContext *ctx, arg_fcopysign_s *a)
 {
+    TCGv dest = get_fpr(ctx, a->fd);
+    TCGv src1 = get_fpr(ctx, a->fk);
+    TCGv src2 = get_fpr(ctx, a->fj);
+
     CHECK_FPE;
 
-    tcg_gen_deposit_i64(cpu_fpr[a->fd], cpu_fpr[a->fk], cpu_fpr[a->fj], 0, 31);
+    tcg_gen_deposit_i64(dest, src1, src2, 0, 31);
+    set_fpr(a->fd, dest);
+
     return true;
 }
 
 static bool trans_fcopysign_d(DisasContext *ctx, arg_fcopysign_d *a)
 {
+    TCGv dest = get_fpr(ctx, a->fd);
+    TCGv src1 = get_fpr(ctx, a->fk);
+    TCGv src2 = get_fpr(ctx, a->fj);
+
     CHECK_FPE;
 
-    tcg_gen_deposit_i64(cpu_fpr[a->fd], cpu_fpr[a->fk], cpu_fpr[a->fj], 0, 63);
+    tcg_gen_deposit_i64(dest, src1, src2, 0, 63);
+    set_fpr(a->fd, dest);
+
     return true;
 }
 
 static bool trans_fabs_s(DisasContext *ctx, arg_fabs_s *a)
 {
+    TCGv dest = get_fpr(ctx, a->fd);
+    TCGv src = get_fpr(ctx, a->fj);
+
     CHECK_FPE;
 
-    tcg_gen_andi_i64(cpu_fpr[a->fd], cpu_fpr[a->fj], MAKE_64BIT_MASK(0, 31));
-    gen_nanbox_s(cpu_fpr[a->fd], cpu_fpr[a->fd]);
+    tcg_gen_andi_i64(dest, src, MAKE_64BIT_MASK(0, 31));
+    gen_nanbox_s(dest, dest);
+    set_fpr(a->fd, dest);
+
     return true;
 }
 
 static bool trans_fabs_d(DisasContext *ctx, arg_fabs_d *a)
 {
+    TCGv dest = get_fpr(ctx, a->fd);
+    TCGv src = get_fpr(ctx, a->fj);
+
     CHECK_FPE;
 
-    tcg_gen_andi_i64(cpu_fpr[a->fd], cpu_fpr[a->fj], MAKE_64BIT_MASK(0, 63));
+    tcg_gen_andi_i64(dest, src, MAKE_64BIT_MASK(0, 63));
+    set_fpr(a->fd, dest);
+
     return true;
 }
 
 static bool trans_fneg_s(DisasContext *ctx, arg_fneg_s *a)
 {
+    TCGv dest = get_fpr(ctx, a->fd);
+    TCGv src = get_fpr(ctx, a->fj);
+
     CHECK_FPE;
 
-    tcg_gen_xori_i64(cpu_fpr[a->fd], cpu_fpr[a->fj], 0x80000000);
-    gen_nanbox_s(cpu_fpr[a->fd], cpu_fpr[a->fd]);
+    tcg_gen_xori_i64(dest, src, 0x80000000);
+    gen_nanbox_s(dest, dest);
+    set_fpr(a->fd, dest);
+
     return true;
 }
 
 static bool trans_fneg_d(DisasContext *ctx, arg_fneg_d *a)
 {
+    TCGv dest = get_fpr(ctx, a->fd);
+    TCGv src = get_fpr(ctx, a->fj);
+
     CHECK_FPE;
 
-    tcg_gen_xori_i64(cpu_fpr[a->fd], cpu_fpr[a->fj], 0x8000000000000000LL);
+    tcg_gen_xori_i64(dest, src, 0x8000000000000000LL);
+    set_fpr(a->fd, dest);
+
     return true;
 }
 
diff --git a/target/loongarch/insn_trans/trans_fcmp.c.inc b/target/loongarch/insn_trans/trans_fcmp.c.inc
index 3b0da2b9f4..a78868dbc4 100644
--- a/target/loongarch/insn_trans/trans_fcmp.c.inc
+++ b/target/loongarch/insn_trans/trans_fcmp.c.inc
@@ -25,17 +25,19 @@ static uint32_t get_fcmp_flags(int cond)
 
 static bool trans_fcmp_cond_s(DisasContext *ctx, arg_fcmp_cond_s *a)
 {
-    TCGv var;
+    TCGv var, src1, src2;
     uint32_t flags;
     void (*fn)(TCGv, TCGv_env, TCGv, TCGv, TCGv_i32);
 
     CHECK_FPE;
 
     var = tcg_temp_new();
+    src1 = get_fpr(ctx, a->fj);
+    src2 = get_fpr(ctx, a->fk);
     fn = (a->fcond & 1 ? gen_helper_fcmp_s_s : gen_helper_fcmp_c_s);
     flags = get_fcmp_flags(a->fcond >> 1);
 
-    fn(var, cpu_env, cpu_fpr[a->fj], cpu_fpr[a->fk], tcg_constant_i32(flags));
+    fn(var, cpu_env, src1, src2, tcg_constant_i32(flags));
 
     tcg_gen_st8_tl(var, cpu_env, offsetof(CPULoongArchState, cf[a->cd]));
     return true;
@@ -43,17 +45,19 @@ static bool trans_fcmp_cond_s(DisasContext *ctx, arg_fcmp_cond_s *a)
 
 static bool trans_fcmp_cond_d(DisasContext *ctx, arg_fcmp_cond_d *a)
 {
-    TCGv var;
+    TCGv var, src1, src2;
     uint32_t flags;
     void (*fn)(TCGv, TCGv_env, TCGv, TCGv, TCGv_i32);
 
     CHECK_FPE;
 
     var = tcg_temp_new();
+    src1 = get_fpr(ctx, a->fj);
+    src2 = get_fpr(ctx, a->fk);
     fn = (a->fcond & 1 ? gen_helper_fcmp_s_d : gen_helper_fcmp_c_d);
     flags = get_fcmp_flags(a->fcond >> 1);
 
-    fn(var, cpu_env, cpu_fpr[a->fj], cpu_fpr[a->fk], tcg_constant_i32(flags));
+    fn(var, cpu_env, src1, src2, tcg_constant_i32(flags));
 
     tcg_gen_st8_tl(var, cpu_env, offsetof(CPULoongArchState, cf[a->cd]));
     return true;
diff --git a/target/loongarch/insn_trans/trans_fmemory.c.inc b/target/loongarch/insn_trans/trans_fmemory.c.inc
index 0d11843873..91c09fb6d9 100644
--- a/target/loongarch/insn_trans/trans_fmemory.c.inc
+++ b/target/loongarch/insn_trans/trans_fmemory.c.inc
@@ -13,6 +13,7 @@ static void maybe_nanbox_load(TCGv freg, MemOp mop)
 static bool gen_fload_i(DisasContext *ctx, arg_fr_i *a, MemOp mop)
 {
     TCGv addr = gpr_src(ctx, a->rj, EXT_NONE);
+    TCGv dest = get_fpr(ctx, a->fd);
 
     CHECK_FPE;
 
@@ -22,8 +23,9 @@ static bool gen_fload_i(DisasContext *ctx, arg_fr_i *a, MemOp mop)
         addr = temp;
     }
 
-    tcg_gen_qemu_ld_tl(cpu_fpr[a->fd], addr, ctx->mem_idx, mop);
-    maybe_nanbox_load(cpu_fpr[a->fd], mop);
+    tcg_gen_qemu_ld_tl(dest, addr, ctx->mem_idx, mop);
+    maybe_nanbox_load(dest, mop);
+    set_fpr(a->fd, dest);
 
     return true;
 }
@@ -31,6 +33,7 @@ static bool gen_fload_i(DisasContext *ctx, arg_fr_i *a, MemOp mop)
 static bool gen_fstore_i(DisasContext *ctx, arg_fr_i *a, MemOp mop)
 {
     TCGv addr = gpr_src(ctx, a->rj, EXT_NONE);
+    TCGv src = get_fpr(ctx, a->fd);
 
     CHECK_FPE;
 
@@ -40,7 +43,8 @@ static bool gen_fstore_i(DisasContext *ctx, arg_fr_i *a, MemOp mop)
         addr = temp;
     }
 
-    tcg_gen_qemu_st_tl(cpu_fpr[a->fd], addr, ctx->mem_idx, mop);
+    tcg_gen_qemu_st_tl(src, addr, ctx->mem_idx, mop);
+
     return true;
 }
 
@@ -48,14 +52,16 @@ static bool gen_floadx(DisasContext *ctx, arg_frr *a, MemOp mop)
 {
     TCGv src1 = gpr_src(ctx, a->rj, EXT_NONE);
     TCGv src2 = gpr_src(ctx, a->rk, EXT_NONE);
+    TCGv dest = get_fpr(ctx, a->fd);
     TCGv addr;
 
     CHECK_FPE;
 
     addr = tcg_temp_new();
     tcg_gen_add_tl(addr, src1, src2);
-    tcg_gen_qemu_ld_tl(cpu_fpr[a->fd], addr, ctx->mem_idx, mop);
-    maybe_nanbox_load(cpu_fpr[a->fd], mop);
+    tcg_gen_qemu_ld_tl(dest, addr, ctx->mem_idx, mop);
+    maybe_nanbox_load(dest, mop);
+    set_fpr(a->fd, dest);
 
     return true;
 }
@@ -64,13 +70,14 @@ static bool gen_fstorex(DisasContext *ctx, arg_frr *a, MemOp mop)
 {
     TCGv src1 = gpr_src(ctx, a->rj, EXT_NONE);
     TCGv src2 = gpr_src(ctx, a->rk, EXT_NONE);
+    TCGv src3 = get_fpr(ctx, a->fd);
     TCGv addr;
 
     CHECK_FPE;
 
     addr = tcg_temp_new();
     tcg_gen_add_tl(addr, src1, src2);
-    tcg_gen_qemu_st_tl(cpu_fpr[a->fd], addr, ctx->mem_idx, mop);
+    tcg_gen_qemu_st_tl(src3, addr, ctx->mem_idx, mop);
 
     return true;
 }
@@ -79,6 +86,7 @@ static bool gen_fload_gt(DisasContext *ctx, arg_frr *a, MemOp mop)
 {
     TCGv src1 = gpr_src(ctx, a->rj, EXT_NONE);
     TCGv src2 = gpr_src(ctx, a->rk, EXT_NONE);
+    TCGv dest = get_fpr(ctx, a->fd);
     TCGv addr;
 
     CHECK_FPE;
@@ -86,8 +94,9 @@ static bool gen_fload_gt(DisasContext *ctx, arg_frr *a, MemOp mop)
     addr = tcg_temp_new();
     gen_helper_asrtgt_d(cpu_env, src1, src2);
     tcg_gen_add_tl(addr, src1, src2);
-    tcg_gen_qemu_ld_tl(cpu_fpr[a->fd], addr, ctx->mem_idx, mop);
-    maybe_nanbox_load(cpu_fpr[a->fd], mop);
+    tcg_gen_qemu_ld_tl(dest, addr, ctx->mem_idx, mop);
+    maybe_nanbox_load(dest, mop);
+    set_fpr(a->fd, dest);
 
     return true;
 }
@@ -96,6 +105,7 @@ static bool gen_fstore_gt(DisasContext *ctx, arg_frr *a, MemOp mop)
 {
     TCGv src1 = gpr_src(ctx, a->rj, EXT_NONE);
     TCGv src2 = gpr_src(ctx, a->rk, EXT_NONE);
+    TCGv src3 = get_fpr(ctx, a->fd);
     TCGv addr;
 
     CHECK_FPE;
@@ -103,7 +113,7 @@ static bool gen_fstore_gt(DisasContext *ctx, arg_frr *a, MemOp mop)
     addr = tcg_temp_new();
     gen_helper_asrtgt_d(cpu_env, src1, src2);
     tcg_gen_add_tl(addr, src1, src2);
-    tcg_gen_qemu_st_tl(cpu_fpr[a->fd], addr, ctx->mem_idx, mop);
+    tcg_gen_qemu_st_tl(src3, addr, ctx->mem_idx, mop);
 
     return true;
 }
@@ -112,6 +122,7 @@ static bool gen_fload_le(DisasContext *ctx, arg_frr *a, MemOp mop)
 {
     TCGv src1 = gpr_src(ctx, a->rj, EXT_NONE);
     TCGv src2 = gpr_src(ctx, a->rk, EXT_NONE);
+    TCGv dest = get_fpr(ctx, a->fd);
     TCGv addr;
 
     CHECK_FPE;
@@ -119,8 +130,9 @@ static bool gen_fload_le(DisasContext *ctx, arg_frr *a, MemOp mop)
     addr = tcg_temp_new();
     gen_helper_asrtle_d(cpu_env, src1, src2);
     tcg_gen_add_tl(addr, src1, src2);
-    tcg_gen_qemu_ld_tl(cpu_fpr[a->fd], addr, ctx->mem_idx, mop);
-    maybe_nanbox_load(cpu_fpr[a->fd], mop);
+    tcg_gen_qemu_ld_tl(dest, addr, ctx->mem_idx, mop);
+    maybe_nanbox_load(dest, mop);
+    set_fpr(a->fd, dest);
 
     return true;
 }
@@ -129,6 +141,7 @@ static bool gen_fstore_le(DisasContext *ctx, arg_frr *a, MemOp mop)
 {
     TCGv src1 = gpr_src(ctx, a->rj, EXT_NONE);
     TCGv src2 = gpr_src(ctx, a->rk, EXT_NONE);
+    TCGv src3 = get_fpr(ctx, a->fd);
     TCGv addr;
 
     CHECK_FPE;
@@ -136,7 +149,7 @@ static bool gen_fstore_le(DisasContext *ctx, arg_frr *a, MemOp mop)
     addr = tcg_temp_new();
     gen_helper_asrtle_d(cpu_env, src1, src2);
     tcg_gen_add_tl(addr, src1, src2);
-    tcg_gen_qemu_st_tl(cpu_fpr[a->fd], addr, ctx->mem_idx, mop);
+    tcg_gen_qemu_st_tl(src3, addr, ctx->mem_idx, mop);
 
     return true;
 }
diff --git a/target/loongarch/insn_trans/trans_fmov.c.inc b/target/loongarch/insn_trans/trans_fmov.c.inc
index 069c941665..5af0dd1b66 100644
--- a/target/loongarch/insn_trans/trans_fmov.c.inc
+++ b/target/loongarch/insn_trans/trans_fmov.c.inc
@@ -10,14 +10,17 @@ static const uint32_t fcsr_mask[4] = {
 static bool trans_fsel(DisasContext *ctx, arg_fsel *a)
 {
     TCGv zero = tcg_constant_tl(0);
+    TCGv dest = get_fpr(ctx, a->fd);
+    TCGv src1 = get_fpr(ctx, a->fj);
+    TCGv src2 = get_fpr(ctx, a->fk);
     TCGv cond;
 
     CHECK_FPE;
 
     cond = tcg_temp_new();
     tcg_gen_ld8u_tl(cond, cpu_env, offsetof(CPULoongArchState, cf[a->ca]));
-    tcg_gen_movcond_tl(TCG_COND_EQ, cpu_fpr[a->fd], cond, zero,
-                       cpu_fpr[a->fj], cpu_fpr[a->fk]);
+    tcg_gen_movcond_tl(TCG_COND_EQ, dest, cond, zero, src1, src2);
+    set_fpr(a->fd, dest);
 
     return true;
 }
@@ -25,15 +28,16 @@ static bool trans_fsel(DisasContext *ctx, arg_fsel *a)
 static bool gen_f2f(DisasContext *ctx, arg_ff *a,
                     void (*func)(TCGv, TCGv), bool nanbox)
 {
-    TCGv dest = cpu_fpr[a->fd];
-    TCGv src = cpu_fpr[a->fj];
+    TCGv dest = get_fpr(ctx, a->fd);
+    TCGv src = get_fpr(ctx, a->fj);
 
     CHECK_FPE;
 
     func(dest, src);
     if (nanbox) {
-        gen_nanbox_s(cpu_fpr[a->fd], cpu_fpr[a->fd]);
+        gen_nanbox_s(dest, dest);
     }
+    set_fpr(a->fd, dest);
 
     return true;
 }
@@ -42,10 +46,13 @@ static bool gen_r2f(DisasContext *ctx, arg_fr *a,
                     void (*func)(TCGv, TCGv))
 {
     TCGv src = gpr_src(ctx, a->rj, EXT_NONE);
+    TCGv dest = get_fpr(ctx, a->fd);
 
     CHECK_FPE;
 
-    func(cpu_fpr[a->fd], src);
+    func(dest, src);
+    set_fpr(a->fd, dest);
+
     return true;
 }
 
@@ -53,10 +60,11 @@ static bool gen_f2r(DisasContext *ctx, arg_rf *a,
                     void (*func)(TCGv, TCGv))
 {
     TCGv dest = gpr_dst(ctx, a->rd, EXT_NONE);
+    TCGv src = get_fpr(ctx, a->fj);
 
     CHECK_FPE;
 
-    func(dest, cpu_fpr[a->fj]);
+    func(dest, src);
     gen_set_gpr(a->rd, dest, EXT_NONE);
 
     return true;
@@ -124,11 +132,12 @@ static void gen_movfrh2gr_s(TCGv dest, TCGv src)
 static bool trans_movfr2cf(DisasContext *ctx, arg_movfr2cf *a)
 {
     TCGv t0;
+    TCGv src = get_fpr(ctx, a->fj);
 
     CHECK_FPE;
 
     t0 = tcg_temp_new();
-    tcg_gen_andi_tl(t0, cpu_fpr[a->fj], 0x1);
+    tcg_gen_andi_tl(t0, src, 0x1);
     tcg_gen_st8_tl(t0, cpu_env, offsetof(CPULoongArchState, cf[a->cd & 0x7]));
 
     return true;
@@ -136,10 +145,14 @@ static bool trans_movfr2cf(DisasContext *ctx, arg_movfr2cf *a)
 
 static bool trans_movcf2fr(DisasContext *ctx, arg_movcf2fr *a)
 {
+    TCGv dest = get_fpr(ctx, a->fd);
+
     CHECK_FPE;
 
-    tcg_gen_ld8u_tl(cpu_fpr[a->fd], cpu_env,
+    tcg_gen_ld8u_tl(dest, cpu_env,
                     offsetof(CPULoongArchState, cf[a->cj & 0x7]));
+    set_fpr(a->fd, dest);
+
     return true;
 }
 
diff --git a/target/loongarch/translate.c b/target/loongarch/translate.c
index c04ed7592b..ae53f5ee9d 100644
--- a/target/loongarch/translate.c
+++ b/target/loongarch/translate.c
@@ -23,7 +23,6 @@
 /* Global register indices */
 TCGv cpu_gpr[32], cpu_pc;
 static TCGv cpu_lladdr, cpu_llval;
-TCGv_i64 cpu_fpr[32];
 
 #include "exec/gen-icount.h"
 
@@ -191,6 +190,20 @@ static void gen_set_gpr(int reg_num, TCGv t, DisasExtend dst_ext)
     }
 }
 
+static TCGv get_fpr(DisasContext *ctx, int reg_num)
+{
+    TCGv t = tcg_temp_new();
+    tcg_gen_ld_i64(t, cpu_env,
+                   offsetof(CPULoongArchState, fpr[reg_num].vreg.D(0)));
+    return  t;
+}
+
+static void set_fpr(int reg_num, TCGv val)
+{
+    tcg_gen_st_i64(val, cpu_env,
+                   offsetof(CPULoongArchState, fpr[reg_num].vreg.D(0)));
+}
+
 #include "decode-insns.c.inc"
 #include "insn_trans/trans_arith.c.inc"
 #include "insn_trans/trans_shift.c.inc"
@@ -285,11 +298,6 @@ void loongarch_translate_init(void)
                                         regnames[i]);
     }
 
-    for (i = 0; i < 32; i++) {
-        int off = offsetof(CPULoongArchState, fpr[i]);
-        cpu_fpr[i] = tcg_global_mem_new_i64(cpu_env, off, fregnames[i]);
-    }
-
     cpu_pc = tcg_global_mem_new(cpu_env, offsetof(CPULoongArchState, pc), "pc");
     cpu_lladdr = tcg_global_mem_new(cpu_env,
                     offsetof(CPULoongArchState, lladdr), "lladdr");
-- 
2.31.1


