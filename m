Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04E294786C8
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Dec 2021 10:11:06 +0100 (CET)
Received: from localhost ([::1]:33054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1my9Gb-0007AM-59
	for lists+qemu-devel@lfdr.de; Fri, 17 Dec 2021 04:11:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>) id 1my97k-0001Mu-0Q
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 04:02:01 -0500
Received: from rev.ng ([5.9.113.41]:37425)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>) id 1my97d-0002Ba-Rl
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 04:01:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rev.ng;
 s=dkim; h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=9YixCNw5uj+PDsfOnMRgLu343GqMnpMYL7ocZJM18NQ=; b=RQO1R49uf996411AzE0h2GGqBe
 otjpqKZPWhnzw8jrDcdZDvp55QQ8lPgwoBUE2FxgFEyYup0Kti4Lbh34+e/ZXXVyhgRz2+cFi82Ty
 1UYi3b115srO/KM7PkkTjzBuDNE0YobB5WvWoOIDt5CSjHQdgjCwX4XMiCZoygHcz1Sc=;
To: qemu-devel@nongnu.org
Cc: ale@rev.ng, tsimpson@quicinc.com, bcain@quicinc.com, babush@rev.ng,
 nizzo@rev.ng, richard.henderson@linaro.org
Subject: [PATCH v7 05/13] target/hexagon: introduce new helper functions
Date: Fri, 17 Dec 2021 10:01:21 +0100
Message-Id: <20211217090129.23242-6-anjo@rev.ng>
In-Reply-To: <20211217090129.23242-1-anjo@rev.ng>
References: <20211217090129.23242-1-anjo@rev.ng>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=5.9.113.41; envelope-from=anjo@rev.ng; helo=rev.ng
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  Anton Johansson <anjo@rev.ng>
From:  Anton Johansson via <qemu-devel@nongnu.org>

From: Niccolò Izzo <nizzo@rev.ng>

These helpers will be employed by the idef-parser generated code.
"Helper" can here mean two things, a helper in the QEMU sense added to
`helper.h` and `op_helper.c`, but also helper functions providing a
manual TCG implementation of a certain features.

Signed-off-by: Alessandro Di Federico <ale@rev.ng>
Signed-off-by: Niccolò Izzo <nizzo@rev.ng>
Signed-off-by: Anton Johansson <anjo@rev.ng>
---
 target/hexagon/genptr.c    | 166 +++++++++++++++++++++++++++++++++++--
 target/hexagon/genptr.h    |  16 +++-
 target/hexagon/helper.h    |   2 +
 target/hexagon/macros.h    |   9 ++
 target/hexagon/op_helper.c |  10 +++
 5 files changed, 195 insertions(+), 8 deletions(-)

diff --git a/target/hexagon/genptr.c b/target/hexagon/genptr.c
index ae798e921e..44a1ec9ccf 100644
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
@@ -643,5 +648,152 @@ static void vec_to_qvec(size_t size, intptr_t dstoff, intptr_t srcoff)
     tcg_temp_free_i64(mask);
 }
 
+void gen_set_usr_field(int field, TCGv val)
+{
+    tcg_gen_deposit_tl(hex_new_value[HEX_REG_USR], hex_new_value[HEX_REG_USR],
+                       val,
+                       reg_field_info[field].offset,
+                       reg_field_info[field].width);
+}
+
+void gen_set_usr_fieldi(int field, int x)
+{
+    TCGv val = tcg_const_tl(x);
+    gen_set_usr_field(field, val);
+    tcg_temp_free(val);
+}
+
+void gen_write_new_pc(TCGv addr)
+{
+    /* If there are multiple branches in a packet, ignore the second one */
+    TCGv zero = tcg_const_tl(0);
+    tcg_gen_movcond_tl(TCG_COND_NE, hex_next_PC, hex_branch_taken, zero,
+                       hex_next_PC, addr);
+    tcg_gen_movi_tl(hex_branch_taken, 1);
+    tcg_temp_free(zero);
+}
+
+void gen_sat_i32(TCGv dest, TCGv source, int width)
+{
+    TCGv max_val = tcg_const_tl((1 << (width - 1)) - 1);
+    TCGv min_val = tcg_const_tl(-(1 << (width - 1)));
+    tcg_gen_smin_tl(dest, source, max_val);
+    tcg_gen_smax_tl(dest, dest, min_val);
+    tcg_temp_free(max_val);
+    tcg_temp_free(min_val);
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
+    TCGv max_val = tcg_const_tl((1 << width) - 1);
+    tcg_gen_movcond_tl(TCG_COND_GTU, dest, source, max_val, max_val, source);
+    TCGv zero = tcg_const_tl(0);
+    tcg_gen_movcond_tl(TCG_COND_LT, dest, source, zero, zero, dest);
+    tcg_temp_free(max_val);
+    tcg_temp_free(zero);
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
+    TCGv_i64 max_val = tcg_const_i64((1 << (width - 1)) - 1);
+    TCGv_i64 min_val = tcg_const_i64(-(1 << (width - 1)));
+    tcg_gen_smin_i64(dest, source, max_val);
+    tcg_gen_smax_i64(dest, dest, min_val);
+    tcg_temp_free_i64(max_val);
+    tcg_temp_free_i64(min_val);
+}
+
+void gen_sat_i64_ovfl(TCGv ovfl, TCGv_i64 dest, TCGv_i64 source, int width)
+{
+    gen_sat_i64(dest, source, width);
+    TCGv_i64 ovfl_64 = tcg_temp_new_i64();
+    tcg_gen_setcond_i64(TCG_COND_NE, ovfl_64, dest, source);
+    tcg_gen_trunc_i64_tl(ovfl, ovfl_64);
+    tcg_temp_free_i64(ovfl_64);
+}
+
+void gen_satu_i64(TCGv_i64 dest, TCGv_i64 source, int width)
+{
+    TCGv_i64 max_val = tcg_const_i64((1 << width) - 1);
+    tcg_gen_movcond_i64(TCG_COND_GTU, dest, source, max_val, max_val, source);
+    TCGv_i64 zero = tcg_const_i64(0);
+    tcg_gen_movcond_i64(TCG_COND_LT, dest, source, zero, zero, dest);
+    tcg_temp_free_i64(max_val);
+    tcg_temp_free_i64(zero);
+}
+
+void gen_satu_i64_ovfl(TCGv ovfl, TCGv_i64 dest, TCGv_i64 source, int width)
+{
+    gen_sat_i64(dest, source, width);
+    TCGv_i64 ovfl_64 = tcg_temp_new_i64();
+    tcg_gen_setcond_i64(TCG_COND_NE, ovfl_64, dest, source);
+    tcg_gen_trunc_i64_tl(ovfl, ovfl_64);
+    tcg_temp_free_i64(ovfl_64);
+}
+
+/* Implements the fADDSAT64 macro in TCG */
+void gen_add_sat_i64(TCGv_i64 ret, TCGv_i64 a, TCGv_i64 b)
+{
+    TCGv_i64 sum = tcg_temp_local_new_i64();
+    tcg_gen_add_i64(sum, a, b);
+
+    TCGv_i64 xor = tcg_temp_new_i64();
+    tcg_gen_xor_i64(xor, a, b);
+
+    TCGv_i64 mask = tcg_constant_i64(0x8000000000000000ULL);
+
+    TCGv_i64 cond1 = tcg_temp_local_new_i64();
+    tcg_gen_and_i64(cond1, xor, mask);
+    tcg_temp_free_i64(xor);
+
+    TCGv_i64 cond2 = tcg_temp_local_new_i64();
+    tcg_gen_xor_i64(cond2, a, sum);
+    tcg_gen_and_i64(cond2, cond2, mask);
+
+    TCGLabel *no_ovfl_label = gen_new_label();
+    TCGLabel *ovfl_label = gen_new_label();
+    TCGLabel *ret_label = gen_new_label();
+
+    tcg_gen_brcondi_i64(TCG_COND_NE, cond1, 0, no_ovfl_label);
+    tcg_temp_free_i64(cond1);
+    tcg_gen_brcondi_i64(TCG_COND_NE, cond2, 0, ovfl_label);
+    tcg_temp_free_i64(cond2);
+    tcg_gen_br(no_ovfl_label);
+
+    gen_set_label(no_ovfl_label);
+    tcg_gen_mov_i64(ret, sum);
+    tcg_gen_br(ret_label);
+
+    gen_set_label(ovfl_label);
+    TCGv_i64 cond3 = tcg_temp_new_i64();
+    tcg_gen_and_i64(cond3, sum, mask);
+    tcg_temp_free_i64(mask);
+    tcg_temp_free_i64(sum);
+    TCGv_i64 max_pos = tcg_constant_i64(0x7FFFFFFFFFFFFFFFLL);
+    TCGv_i64 max_neg = tcg_constant_i64(0x8000000000000000LL);
+    TCGv_i64 zero = tcg_constant_i64(0);
+    tcg_gen_movcond_i64(TCG_COND_NE, ret, cond3, zero, max_pos, max_neg);
+    tcg_temp_free_i64(max_pos);
+    tcg_temp_free_i64(max_neg);
+    tcg_temp_free_i64(zero);
+    tcg_temp_free_i64(cond3);
+    SET_USR_FIELD(USR_OVF, 1);
+    tcg_gen_br(ret_label);
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
diff --git a/target/hexagon/helper.h b/target/hexagon/helper.h
index c89aa4ed4d..506d4e11c3 100644
--- a/target/hexagon/helper.h
+++ b/target/hexagon/helper.h
@@ -27,6 +27,8 @@ DEF_HELPER_3(gather_store, void, env, i32, int)
 DEF_HELPER_1(commit_hvx_stores, void, env)
 DEF_HELPER_FLAGS_4(fcircadd, TCG_CALL_NO_RWG_SE, s32, s32, s32, s32, s32)
 DEF_HELPER_FLAGS_1(fbrev, TCG_CALL_NO_RWG_SE, i32, i32)
+DEF_HELPER_FLAGS_1(fbrev_32, TCG_CALL_NO_RWG_SE, i32, i32)
+DEF_HELPER_FLAGS_1(fbrev_64, TCG_CALL_NO_RWG_SE, i64, i64)
 DEF_HELPER_3(sfrecipa, i64, env, f32, f32)
 DEF_HELPER_2(sfinvsqrta, i64, env, f32)
 DEF_HELPER_4(vacsh_val, s64, env, s64, s64, s64)
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
 
diff --git a/target/hexagon/op_helper.c b/target/hexagon/op_helper.c
index 722a115007..fc3844c8d1 100644
--- a/target/hexagon/op_helper.c
+++ b/target/hexagon/op_helper.c
@@ -341,6 +341,16 @@ uint32_t HELPER(fbrev)(uint32_t addr)
     return deposit32(addr, 0, 16, revbit16(addr));
 }
 
+uint32_t HELPER(fbrev_32)(uint32_t addr)
+{
+    return revbit32(addr);
+}
+
+uint64_t HELPER(fbrev_64)(uint64_t addr)
+{
+    return revbit64(addr);
+}
+
 static float32 build_float32(uint8_t sign, uint32_t exp, uint32_t mant)
 {
     return make_float32(
-- 
2.33.1


