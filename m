Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 670AC361099
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Apr 2021 18:58:28 +0200 (CEST)
Received: from localhost ([::1]:47838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lX5Jz-0005xc-Fg
	for lists+qemu-devel@lfdr.de; Thu, 15 Apr 2021 12:58:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ale@rev.ng>) id 1lX4xZ-0004Gi-T5
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 12:35:17 -0400
Received: from rev.ng ([5.9.113.41]:42829)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ale@rev.ng>) id 1lX4xU-0006fN-Eo
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 12:35:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rev.ng;
 s=dkim; h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=de9d+sgUljmQznIzRM11ZJmmsY24Ut5GL4mk3Ee2im4=; b=Jc+i0r+nNC7W6bz1tZTCtB6ZUB
 UHeDFsBe0ucOqfBpdrlfVtUxXWjCMDgdyfYtDkmgI5dQy/PM3lv4FXlOb5hKVoh6XbjkcELUjKSMh
 pka4lKIJ+7V6fQi+T1Edn2pyLEhOQ9FUKsVMVlH6P+aMiLSSpnHvhCt+BDwNywTsY9QA=;
To: qemu-devel@nongnu.org
Cc: tsimpson@quicinc.com, bcain@quicinc.com, babush@rev.ng, nizzo@rev.ng,
 philmd@redhat.com, richard.henderson@linaro.org,
 Alessandro Di Federico <ale@rev.ng>
Subject: [PATCH v4 06/12] target/hexagon: introduce new helper functions
Date: Thu, 15 Apr 2021 18:34:49 +0200
Message-Id: <20210415163455.3839169-7-ale.qemu@rev.ng>
In-Reply-To: <20210415163455.3839169-1-ale.qemu@rev.ng>
References: <20210415163455.3839169-1-ale.qemu@rev.ng>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=5.9.113.41; envelope-from=ale@rev.ng; helo=rev.ng
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  Alessandro Di Federico <ale.qemu@rev.ng>
From:  Alessandro Di Federico via <qemu-devel@nongnu.org>

From: Niccolò Izzo <nizzo@rev.ng>

These helpers will be employed by the idef-parser generated code.

Signed-off-by: Alessandro Di Federico <ale@rev.ng>
Signed-off-by: Niccolò Izzo <nizzo@rev.ng>
---
 target/hexagon/genptr.c | 188 ++++++++++++++++++++++++++++++++++++++++
 target/hexagon/genptr.h |  22 +++++
 target/hexagon/macros.h |   9 ++
 3 files changed, 219 insertions(+)

diff --git a/target/hexagon/genptr.c b/target/hexagon/genptr.c
index 1ddb4360f1..024419bf39 100644
--- a/target/hexagon/genptr.c
+++ b/target/hexagon/genptr.c
@@ -28,6 +28,12 @@
 #include "gen_tcg.h"
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
@@ -330,5 +336,187 @@ static inline void gen_store_conditional8(CPUHexagonState *env,
     tcg_gen_movi_tl(hex_llsc_addr, ~0);
 }
 
+void gen_store32(TCGv vaddr, TCGv src, tcg_target_long width, unsigned slot)
+{
+    tcg_gen_mov_tl(hex_store_addr[slot], vaddr);
+    tcg_gen_movi_tl(hex_store_width[slot], width);
+    tcg_gen_mov_tl(hex_store_val32[slot], src);
+}
+
+void gen_store1(TCGv_env cpu_env, TCGv vaddr, TCGv src, DisasContext *ctx,
+                unsigned slot)
+{
+    gen_store32(vaddr, src, 1, slot);
+    ctx->store_width[slot] = 1;
+}
+
+void gen_store2(TCGv_env cpu_env, TCGv vaddr, TCGv src, DisasContext *ctx,
+                unsigned slot)
+{
+    gen_store32(vaddr, src, 2, slot);
+    ctx->store_width[slot] = 2;
+}
+
+void gen_store4(TCGv_env cpu_env, TCGv vaddr, TCGv src, DisasContext *ctx,
+                unsigned slot)
+{
+    gen_store32(vaddr, src, 4, slot);
+    ctx->store_width[slot] = 4;
+}
+
+
+void gen_store8(TCGv_env cpu_env, TCGv vaddr, TCGv_i64 src, DisasContext *ctx,
+                unsigned slot)
+{
+    tcg_gen_mov_tl(hex_store_addr[slot], vaddr);
+    tcg_gen_movi_tl(hex_store_width[slot], 8);
+    tcg_gen_mov_i64(hex_store_val64[slot], src);
+    ctx->store_width[slot] = 8;
+}
+
+void gen_set_usr_field(int field, TCGv val)
+{
+    tcg_gen_deposit_tl(hex_gpr[HEX_REG_USR], hex_gpr[HEX_REG_USR], val,
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
+    TCGv max_val = tcg_const_i32((1 << (width - 1)) - 1);
+    TCGv min_val = tcg_const_i32(-(1 << (width - 1)));
+    tcg_gen_smin_tl(dest, source, max_val);
+    tcg_gen_smax_tl(dest, dest, min_val);
+    tcg_temp_free_i32(max_val);
+    tcg_temp_free_i32(min_val);
+}
+
+void gen_sat_i32_ext(TCGv ovfl, TCGv dest, TCGv source, int width)
+{
+    gen_sat_i32(dest, source, width);
+    TCGv zero = tcg_const_i32(0);
+    TCGv one = tcg_const_i32(1);
+    tcg_gen_movcond_i32(TCG_COND_NE, ovfl, source, dest, one, zero);
+    tcg_temp_free_i32(zero);
+    tcg_temp_free_i32(one);
+}
+
+void gen_satu_i32(TCGv dest, TCGv source, int width)
+{
+    TCGv max_val = tcg_const_i32((1 << width) - 1);
+    tcg_gen_movcond_i32(TCG_COND_GTU, dest, source, max_val, max_val, source);
+    TCGv_i32 zero = tcg_const_i32(0);
+    tcg_gen_movcond_i32(TCG_COND_LT, dest, source, zero, zero, dest);
+    tcg_temp_free_i32(max_val);
+    tcg_temp_free_i32(zero);
+}
+
+void gen_satu_i32_ext(TCGv ovfl, TCGv dest, TCGv source, int width)
+{
+    gen_satu_i32(dest, source, width);
+    TCGv zero = tcg_const_i32(0);
+    TCGv one = tcg_const_i32(1);
+    tcg_gen_movcond_i32(TCG_COND_NE, ovfl, dest, source, one, zero);
+    tcg_temp_free_i32(zero);
+    tcg_temp_free_i32(one);
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
+void gen_sat_i64_ext(TCGv ovfl, TCGv_i64 dest, TCGv_i64 source, int width)
+{
+    gen_sat_i64(dest, source, width);
+    TCGv_i64 ovfl_64 = tcg_temp_new_i64();
+    TCGv_i64 zero = tcg_const_i64(0);
+    TCGv_i64 one = tcg_const_i64(1);
+    tcg_gen_movcond_i64(TCG_COND_NE, ovfl_64, dest, source, one, zero);
+    tcg_gen_trunc_i64_tl(ovfl, ovfl_64);
+    tcg_temp_free_i64(ovfl_64);
+    tcg_temp_free_i64(zero);
+    tcg_temp_free_i64(one);
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
+void gen_satu_i64_ext(TCGv ovfl, TCGv_i64 dest, TCGv_i64 source, int width)
+{
+    gen_sat_i64(dest, source, width);
+    TCGv_i64 ovfl_64 = tcg_temp_new_i64();
+    TCGv_i64 zero = tcg_const_i64(0);
+    TCGv_i64 one = tcg_const_i64(1);
+    tcg_gen_movcond_i64(TCG_COND_NE, ovfl_64, dest, source, one, zero);
+    tcg_gen_trunc_i64_tl(ovfl, ovfl_64);
+    tcg_temp_free_i64(ovfl_64);
+    tcg_temp_free_i64(zero);
+    tcg_temp_free_i64(one);
+}
+
+void gen_fbrev(TCGv result, TCGv src)
+{
+    TCGv lo = tcg_temp_new();
+    TCGv tmp1 = tcg_temp_new();
+    TCGv tmp2 = tcg_temp_new();
+
+    /* Bit reversal of low 16 bits */
+    tcg_gen_extract_tl(lo, src, 0, 16);
+    tcg_gen_andi_tl(tmp1, lo, 0xaaaa);
+    tcg_gen_shri_tl(tmp1, tmp1, 1);
+    tcg_gen_andi_tl(tmp2, lo, 0x5555);
+    tcg_gen_shli_tl(tmp2, tmp2, 1);
+    tcg_gen_or_tl(lo, tmp1, tmp2);
+    tcg_gen_andi_tl(tmp1, lo, 0xcccc);
+    tcg_gen_shri_tl(tmp1, tmp1, 2);
+    tcg_gen_andi_tl(tmp2, lo, 0x3333);
+    tcg_gen_shli_tl(tmp2, tmp2, 2);
+    tcg_gen_or_tl(lo, tmp1, tmp2);
+    tcg_gen_andi_tl(tmp1, lo, 0xf0f0);
+    tcg_gen_shri_tl(tmp1, tmp1, 4);
+    tcg_gen_andi_tl(tmp2, lo, 0x0f0f);
+    tcg_gen_shli_tl(tmp2, tmp2, 4);
+    tcg_gen_or_tl(lo, tmp1, tmp2);
+    tcg_gen_bswap16_tl(lo, lo);
+
+    /* Final tweaks */
+    tcg_gen_deposit_tl(result, src, lo, 0, 16);
+    tcg_gen_or_tl(result, result, lo);
+
+    tcg_temp_free(lo);
+    tcg_temp_free(tmp1);
+    tcg_temp_free(tmp2);
+}
+
 #include "tcg_funcs_generated.c.inc"
 #include "tcg_func_table_generated.c.inc"
diff --git a/target/hexagon/genptr.h b/target/hexagon/genptr.h
index e1dcd24b0e..8ff74a4aa8 100644
--- a/target/hexagon/genptr.h
+++ b/target/hexagon/genptr.h
@@ -24,8 +24,30 @@
 
 extern const SemanticInsn opcode_genptr[];
 
+TCGv gen_read_reg(TCGv result, int num);
 TCGv gen_read_preg(TCGv pred, uint8_t num);
 void gen_log_reg_write(int rnum, TCGv val);
 void gen_log_pred_write(int pnum, TCGv val);
+void gen_store32(TCGv vaddr, TCGv src, tcg_target_long width, unsigned slot);
+void gen_store1(TCGv_env cpu_env, TCGv vaddr, TCGv src, DisasContext *ctx,
+                unsigned slot);
+void gen_store2(TCGv_env cpu_env, TCGv vaddr, TCGv src, DisasContext *ctx,
+                unsigned slot);
+void gen_store4(TCGv_env cpu_env, TCGv vaddr, TCGv src, DisasContext *ctx,
+                unsigned slot);
+void gen_store8(TCGv_env cpu_env, TCGv vaddr, TCGv_i64 src, DisasContext *ctx,
+                unsigned slot);
+void gen_write_new_pc(TCGv addr);
+void gen_set_usr_field(int field, TCGv val);
+void gen_set_usr_fieldi(int field, int x);
+void gen_sat_i32(TCGv dest, TCGv source, int width);
+void gen_sat_i32_ext(TCGv ovfl, TCGv dest, TCGv source, int width);
+void gen_satu_i32(TCGv dest, TCGv source, int width);
+void gen_satu_i32_ext(TCGv ovfl, TCGv dest, TCGv source, int width);
+void gen_sat_i64(TCGv_i64 dest, TCGv_i64 source, int width);
+void gen_sat_i64_ext(TCGv ovfl, TCGv_i64 dest, TCGv_i64 source, int width);
+void gen_satu_i64(TCGv_i64 dest, TCGv_i64 source, int width);
+void gen_satu_i64_ext(TCGv ovfl, TCGv_i64 dest, TCGv_i64 source, int width);
+void gen_fbrev(TCGv result, TCGv src);
 
 #endif
diff --git a/target/hexagon/macros.h b/target/hexagon/macros.h
index d9473c8823..94357c3e42 100644
--- a/target/hexagon/macros.h
+++ b/target/hexagon/macros.h
@@ -149,7 +149,16 @@
 #define MEM_STORE8(VA, DATA, SLOT) log_store64(env, VA, DATA, 8, SLOT)
 #endif
 
+#ifdef QEMU_GENERATE
+static inline void gen_cancel(unsigned slot)
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
2.31.1


