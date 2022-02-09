Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 427554AF87E
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Feb 2022 18:29:41 +0100 (CET)
Received: from localhost ([::1]:52296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHqmi-0007L0-0g
	for lists+qemu-devel@lfdr.de; Wed, 09 Feb 2022 12:29:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>) id 1nHqNV-00061x-C1
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 12:03:37 -0500
Received: from rev.ng ([5.9.113.41]:49543)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>) id 1nHqNQ-0004Xn-Mq
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 12:03:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rev.ng;
 s=dkim; h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=wyTktXm2tM7yd2DCUJJhEa/B/EwAqKwRTlXlbUxXfkk=; b=kl3GrIBCVAUvIO1dCLzrG7bHBE
 I2iZvLa2kH19msENC9NEDQ4yqofK9eIi/wblTkV3Hr4rRaawsQBqJ3JpVnoJhiSRhj9BmFI7Vp9po
 loKKVMhY8e8fNbJ/vPhhpSk3rM6wJTinGOJkdjOLz3DwkPteTLjdldYV+Ts5dG0gloUs=;
To: qemu-devel@nongnu.org
Cc: ale@rev.ng, tsimpson@quicinc.com, bcain@quicinc.com, mlambert@quicinc.com,
 babush@rev.ng, nizzo@rev.ng, richard.henderson@linaro.org
Subject: [PATCH v8 05/12] target/hexagon: introduce new helper functions
Date: Wed,  9 Feb 2022 18:03:05 +0100
Message-Id: <20220209170312.30662-6-anjo@rev.ng>
In-Reply-To: <20220209170312.30662-1-anjo@rev.ng>
References: <20220209170312.30662-1-anjo@rev.ng>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=5.9.113.41; envelope-from=anjo@rev.ng; helo=rev.ng
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  Anton Johansson <anjo@rev.ng>
From:  Anton Johansson via <qemu-devel@nongnu.org>

From: Niccolò Izzo <nizzo@rev.ng>

These helpers will be employed by the idef-parser generated code, to
correctly implement instruction semantics. "Helper" functions, in the
context of this patch, refers to functions which provide a manual TCG
implementation of certain features.

Signed-off-by: Alessandro Di Federico <ale@rev.ng>
Signed-off-by: Niccolò Izzo <nizzo@rev.ng>
Signed-off-by: Anton Johansson <anjo@rev.ng>
---
 target/hexagon/genptr.c | 167 ++++++++++++++++++++++++++++++++++++++--
 target/hexagon/genptr.h |  16 +++-
 target/hexagon/macros.h |   9 +++
 3 files changed, 184 insertions(+), 8 deletions(-)

diff --git a/target/hexagon/genptr.c b/target/hexagon/genptr.c
index ae798e921e..9d0c1fe2df 100644
--- a/target/hexagon/genptr.c
+++ b/target/hexagon/genptr.c
@@ -31,6 +31,12 @@
 #include "gen_tcg_hvx.h"
 #include "genptr.h"
 
+TCGv gen_read_reg(TCGv result, int num)
+{
+    tcg_gen_mov_tl(result, hex_gpr[num]);
+    return result;
+}
+
 TCGv gen_read_preg(TCGv pred, uint8_t num)
 {
     tcg_gen_mov_tl(pred, hex_pred[num]);
@@ -399,18 +405,19 @@ static inline void gen_store_conditional8(DisasContext *ctx,
     tcg_gen_movi_tl(hex_llsc_addr, ~0);
 }
 
-void gen_store32(TCGv vaddr, TCGv src, int width, uint32_t slot)
+void gen_store32(DisasContext *ctx, TCGv vaddr, TCGv src, tcg_target_long width,
+                 uint32_t slot)
 {
     tcg_gen_mov_tl(hex_store_addr[slot], vaddr);
     tcg_gen_movi_tl(hex_store_width[slot], width);
     tcg_gen_mov_tl(hex_store_val32[slot], src);
+    ctx->store_width[slot] = width;
 }
 
 void gen_store1(TCGv_env cpu_env, TCGv vaddr, TCGv src, DisasContext *ctx,
                 uint32_t slot)
 {
-    gen_store32(vaddr, src, 1, slot);
-    ctx->store_width[slot] = 1;
+    gen_store32(ctx, vaddr, src, 1, slot);
 }
 
 void gen_store1i(TCGv_env cpu_env, TCGv vaddr, int32_t src, DisasContext *ctx,
@@ -423,8 +430,7 @@ void gen_store1i(TCGv_env cpu_env, TCGv vaddr, int32_t src, DisasContext *ctx,
 void gen_store2(TCGv_env cpu_env, TCGv vaddr, TCGv src, DisasContext *ctx,
                 uint32_t slot)
 {
-    gen_store32(vaddr, src, 2, slot);
-    ctx->store_width[slot] = 2;
+    gen_store32(ctx, vaddr, src, 2, slot);
 }
 
 void gen_store2i(TCGv_env cpu_env, TCGv vaddr, int32_t src, DisasContext *ctx,
@@ -437,8 +443,7 @@ void gen_store2i(TCGv_env cpu_env, TCGv vaddr, int32_t src, DisasContext *ctx,
 void gen_store4(TCGv_env cpu_env, TCGv vaddr, TCGv src, DisasContext *ctx,
                 uint32_t slot)
 {
-    gen_store32(vaddr, src, 4, slot);
-    ctx->store_width[slot] = 4;
+    gen_store32(ctx, vaddr, src, 4, slot);
 }
 
 void gen_store4i(TCGv_env cpu_env, TCGv vaddr, int32_t src, DisasContext *ctx,
@@ -643,5 +648,153 @@ static void vec_to_qvec(size_t size, intptr_t dstoff, intptr_t srcoff)
     tcg_temp_free_i64(mask);
 }
 
+void gen_set_usr_field(int field, TCGv val)
+{
+    /*
+     * Apparently tcg_gen_deposit_i32/64 doesn't OR the input value
+     * with the previously present one, as deposit32/64 in bitops.h
+     * does. We therefore copy the old value to `old_usr` to later
+     * OR with it to replicate this behavior.
+     */
+    TCGv_i32 old_usr = tcg_temp_new_i32();
+    tcg_gen_mov_i32(old_usr, hex_new_value[HEX_REG_USR]);
+    tcg_gen_deposit_tl(hex_new_value[HEX_REG_USR], hex_new_value[HEX_REG_USR],
+                       val,
+                       reg_field_info[field].offset,
+                       reg_field_info[field].width);
+    tcg_gen_or_i32(hex_new_value[HEX_REG_USR],
+                   old_usr,
+                   hex_new_value[HEX_REG_USR]);
+    tcg_temp_free(old_usr);
+}
+
+void gen_set_usr_fieldi(int field, int x)
+{
+    TCGv val = tcg_constant_tl(x);
+    gen_set_usr_field(field, val);
+}
+
+void gen_write_new_pc(TCGv addr)
+{
+    /* If there are multiple branches in a packet, ignore the second one */
+    TCGv zero = tcg_constant_tl(0);
+    tcg_gen_movcond_tl(TCG_COND_NE, hex_next_PC, hex_branch_taken, zero,
+                       hex_next_PC, addr);
+    tcg_gen_movi_tl(hex_branch_taken, 1);
+}
+
+void gen_sat_i32(TCGv dest, TCGv source, int width)
+{
+    TCGv max_val = tcg_constant_tl((1 << (width - 1)) - 1);
+    TCGv min_val = tcg_constant_tl(-(1 << (width - 1)));
+    tcg_gen_smin_tl(dest, source, max_val);
+    tcg_gen_smax_tl(dest, dest, min_val);
+}
+
+void gen_sat_i32_ovfl(TCGv ovfl, TCGv dest, TCGv source, int width)
+{
+    gen_sat_i32(dest, source, width);
+    tcg_gen_setcond_tl(TCG_COND_NE, ovfl, source, dest);
+}
+
+void gen_satu_i32(TCGv dest, TCGv source, int width)
+{
+    TCGv max_val = tcg_constant_tl((1 << width) - 1);
+    TCGv zero = tcg_constant_tl(0);
+    tcg_gen_movcond_tl(TCG_COND_GTU, dest, source, max_val, max_val, source);
+    tcg_gen_movcond_tl(TCG_COND_LT, dest, source, zero, zero, dest);
+}
+
+void gen_satu_i32_ovfl(TCGv ovfl, TCGv dest, TCGv source, int width)
+{
+    gen_satu_i32(dest, source, width);
+    tcg_gen_setcond_tl(TCG_COND_NE, ovfl, source, dest);
+}
+
+void gen_sat_i64(TCGv_i64 dest, TCGv_i64 source, int width)
+{
+    TCGv_i64 max_val = tcg_constant_i64((1LL << (width - 1)) - 1LL);
+    TCGv_i64 min_val = tcg_constant_i64(-(1LL << (width - 1)));
+    tcg_gen_smin_i64(dest, source, max_val);
+    tcg_gen_smax_i64(dest, dest, min_val);
+}
+
+void gen_sat_i64_ovfl(TCGv ovfl, TCGv_i64 dest, TCGv_i64 source, int width)
+{
+    TCGv_i64 ovfl_64;
+    gen_sat_i64(dest, source, width);
+    ovfl_64 = tcg_temp_new_i64();
+    tcg_gen_setcond_i64(TCG_COND_NE, ovfl_64, dest, source);
+    tcg_gen_trunc_i64_tl(ovfl, ovfl_64);
+    tcg_temp_free_i64(ovfl_64);
+}
+
+void gen_satu_i64(TCGv_i64 dest, TCGv_i64 source, int width)
+{
+    TCGv_i64 max_val = tcg_constant_i64((1LL << width) - 1LL);
+    TCGv_i64 zero = tcg_constant_i64(0);
+    tcg_gen_movcond_i64(TCG_COND_GTU, dest, source, max_val, max_val, source);
+    tcg_gen_movcond_i64(TCG_COND_LT, dest, source, zero, zero, dest);
+}
+
+void gen_satu_i64_ovfl(TCGv ovfl, TCGv_i64 dest, TCGv_i64 source, int width)
+{
+    TCGv_i64 ovfl_64;
+    gen_satu_i64(dest, source, width);
+    ovfl_64 = tcg_temp_new_i64();
+    tcg_gen_setcond_i64(TCG_COND_NE, ovfl_64, dest, source);
+    tcg_gen_trunc_i64_tl(ovfl, ovfl_64);
+    tcg_temp_free_i64(ovfl_64);
+}
+
+/* Implements the fADDSAT64 macro in TCG */
+void gen_add_sat_i64(TCGv_i64 ret, TCGv_i64 a, TCGv_i64 b)
+{
+    TCGv_i64 sum = tcg_temp_local_new_i64();
+    TCGv_i64 xor = tcg_temp_new_i64();
+    TCGv_i64 cond1 = tcg_temp_new_i64();
+    TCGv_i64 cond2 = tcg_temp_local_new_i64();
+    TCGv_i64 cond3 = tcg_temp_new_i64();
+    TCGv_i64 mask = tcg_constant_i64(0x8000000000000000ULL);
+    TCGv_i64 max_pos = tcg_constant_i64(0x7FFFFFFFFFFFFFFFLL);
+    TCGv_i64 max_neg = tcg_constant_i64(0x8000000000000000LL);
+    TCGv_i64 zero = tcg_constant_i64(0);
+    TCGLabel *no_ovfl_label = gen_new_label();
+    TCGLabel *ovfl_label = gen_new_label();
+    TCGLabel *ret_label = gen_new_label();
+
+    tcg_gen_add_i64(sum, a, b);
+    tcg_gen_xor_i64(xor, a, b);
+
+    /* if (xor & mask) */
+    tcg_gen_and_i64(cond1, xor, mask);
+    tcg_temp_free_i64(xor);
+    tcg_gen_brcondi_i64(TCG_COND_NE, cond1, 0, no_ovfl_label);
+    tcg_temp_free_i64(cond1);
+
+    /* else if ((a ^ sum) & mask) */
+    tcg_gen_xor_i64(cond2, a, sum);
+    tcg_gen_and_i64(cond2, cond2, mask);
+    tcg_gen_brcondi_i64(TCG_COND_NE, cond2, 0, ovfl_label);
+    tcg_temp_free_i64(cond2);
+    /* fallthrough to no_ovfl_label branch */
+
+    /* if branch */
+    gen_set_label(no_ovfl_label);
+    tcg_gen_mov_i64(ret, sum);
+    tcg_gen_br(ret_label);
+
+    /* else if branch */
+    gen_set_label(ovfl_label);
+    tcg_gen_and_i64(cond3, sum, mask);
+    tcg_temp_free_i64(mask);
+    tcg_temp_free_i64(sum);
+    tcg_gen_movcond_i64(TCG_COND_NE, ret, cond3, zero, max_pos, max_neg);
+    tcg_temp_free_i64(cond3);
+    SET_USR_FIELD(USR_OVF, 1);
+
+    gen_set_label(ret_label);
+}
+
 #include "tcg_funcs_generated.c.inc"
 #include "tcg_func_table_generated.c.inc"
diff --git a/target/hexagon/genptr.h b/target/hexagon/genptr.h
index d71dd7e1ce..e4e248d6f4 100644
--- a/target/hexagon/genptr.h
+++ b/target/hexagon/genptr.h
@@ -24,7 +24,8 @@
 
 extern const SemanticInsn opcode_genptr[];
 
-void gen_store32(TCGv vaddr, TCGv src, int width, uint32_t slot);
+void gen_store32(DisasContext *ctx, TCGv vaddr, TCGv src, tcg_target_long width,
+                 uint32_t slot);
 void gen_store1(TCGv_env cpu_env, TCGv vaddr, TCGv src, DisasContext *ctx,
                 uint32_t slot);
 void gen_store2(TCGv_env cpu_env, TCGv vaddr, TCGv src, DisasContext *ctx,
@@ -44,6 +45,18 @@ void gen_store8i(TCGv_env cpu_env, TCGv vaddr, int64_t src, DisasContext *ctx,
 TCGv gen_read_preg(TCGv pred, uint8_t num);
 void gen_log_reg_write(int rnum, TCGv val);
 void gen_log_pred_write(DisasContext *ctx, int pnum, TCGv val);
+void gen_write_new_pc(TCGv addr);
+void gen_set_usr_field(int field, TCGv val);
+void gen_set_usr_fieldi(int field, int x);
+void gen_sat_i32(TCGv dest, TCGv source, int width);
+void gen_sat_i32_ovfl(TCGv ovfl, TCGv dest, TCGv source, int width);
+void gen_satu_i32(TCGv dest, TCGv source, int width);
+void gen_satu_i32_ovfl(TCGv ovfl, TCGv dest, TCGv source, int width);
+void gen_sat_i64(TCGv_i64 dest, TCGv_i64 source, int width);
+void gen_sat_i64_ovfl(TCGv ovfl, TCGv_i64 dest, TCGv_i64 source, int width);
+void gen_satu_i64(TCGv_i64 dest, TCGv_i64 source, int width);
+void gen_satu_i64_ovfl(TCGv ovfl, TCGv_i64 dest, TCGv_i64 source, int width);
+void gen_add_sat_i64(TCGv_i64 ret, TCGv_i64 a, TCGv_i64 b);
 TCGv gen_8bitsof(TCGv result, TCGv value);
 void gen_set_byte_i64(int N, TCGv_i64 result, TCGv src);
 TCGv gen_get_byte(TCGv result, int N, TCGv src, bool sign);
@@ -51,5 +64,6 @@ TCGv gen_get_byte_i64(TCGv result, int N, TCGv_i64 src, bool sign);
 TCGv gen_get_half(TCGv result, int N, TCGv src, bool sign);
 void gen_set_half(int N, TCGv result, TCGv src);
 void gen_set_half_i64(int N, TCGv_i64 result, TCGv src);
+TCGv gen_read_reg(TCGv result, int num);
 
 #endif
diff --git a/target/hexagon/macros.h b/target/hexagon/macros.h
index 3a64357090..2e2764ddc8 100644
--- a/target/hexagon/macros.h
+++ b/target/hexagon/macros.h
@@ -180,7 +180,16 @@
 #define MEM_STORE8(VA, DATA, SLOT) log_store64(env, VA, DATA, 8, SLOT)
 #endif
 
+#ifdef QEMU_GENERATE
+static inline void gen_cancel(uint32_t slot)
+{
+    tcg_gen_ori_tl(hex_slot_cancelled, hex_slot_cancelled, 1 << slot);
+}
+
+#define CANCEL gen_cancel(slot);
+#else
 #define CANCEL cancel_slot(env, slot)
+#endif
 
 #define LOAD_CANCEL(EA) do { CANCEL; } while (0)
 
-- 
2.34.1


