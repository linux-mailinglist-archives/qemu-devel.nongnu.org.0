Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36A07319576
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 22:59:07 +0100 (CET)
Received: from localhost ([::1]:37930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAJzO-0005NY-5s
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 16:59:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ale@rev.ng>) id 1lAJrt-0006WH-1X
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 16:51:21 -0500
Received: from rev.ng ([5.9.113.41]:41643)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ale@rev.ng>) id 1lAJrh-00011C-Lw
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 16:51:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rev.ng;
 s=dkim; h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=iVBL2FQXwoDZ9qHafGZ7cLNEGrYQZCe5ZD70MffczE4=; b=SIhXZrydAkyj788lRGd5LpdUFp
 rv3zqNxZwURmlNAUvYXd3Zy5iIKM8l/M11h8u14fQ7+yNPeedIylnUPer9FjuX7iNALDyI6xjW7aI
 IGu91U5mGB3NNgPztEzEhj82IdXHf0wpkxbRED1W6rDUspmPjH4245ZTrP/N7AI89rz0=;
To: qemu-devel@nongnu.org
Cc: tsimpson@quicinc.com, bcain@quicinc.com, babush@rev.ng, nizzo@rev.ng,
 Alessandro Di Federico <ale@rev.ng>
Subject: [RFC PATCH 04/10] target/hexagon: introduce new helper functions
Date: Thu, 11 Feb 2021 22:50:45 +0100
Message-Id: <20210211215051.2102435-5-ale.qemu@rev.ng>
In-Reply-To: <20210211215051.2102435-1-ale.qemu@rev.ng>
References: <20210211215051.2102435-1-ale.qemu@rev.ng>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=5.9.113.41; envelope-from=ale@rev.ng; helo=rev.ng
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
---
 target/hexagon/genptr.c | 224 ++++++++++++++++++++++++++++++++++++++++
 target/hexagon/genptr.h |  19 ++++
 2 files changed, 243 insertions(+)

diff --git a/target/hexagon/genptr.c b/target/hexagon/genptr.c
index 97de669f38..33446bd713 100644
--- a/target/hexagon/genptr.c
+++ b/target/hexagon/genptr.c
@@ -334,5 +334,229 @@ static inline void gen_store_conditional8(CPUHexagonState *env,
     tcg_gen_movi_tl(hex_llsc_addr, ~0);
 }
 
+void gen_fbrev(TCGv result, TCGv src)
+{
+    TCGv lo = tcg_temp_new();
+    TCGv tmp1 = tcg_temp_new();
+    TCGv tmp2 = tcg_temp_new();
+
+    /* Bit reversal of low 16 bits */
+    tcg_gen_andi_tl(lo, src, 0xffff);
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
+    tcg_gen_andi_tl(result, src, 0xffff0000);
+    tcg_gen_ori_tl(result, lo, 8);
+
+    tcg_temp_free(lo);
+    tcg_temp_free(tmp1);
+    tcg_temp_free(tmp2);
+}
+
+TCGv gen_set_bit(int i, TCGv result, TCGv src)
+{
+    TCGv mask = tcg_const_tl(~(1 << i));
+    TCGv bit = tcg_temp_new();
+    tcg_gen_shli_tl(bit, src, i);
+    tcg_gen_and_tl(result, result, mask);
+    tcg_gen_or_tl(result, result, bit);
+    tcg_temp_free(mask);
+    tcg_temp_free(bit);
+
+    return result;
+}
+
+void gen_cancel(TCGv slot)
+{
+    TCGv one = tcg_const_tl(1);
+    TCGv mask = tcg_temp_new();
+    tcg_gen_shl_tl(mask, one, slot);
+    tcg_gen_or_tl(hex_slot_cancelled, hex_slot_cancelled, mask);
+    tcg_temp_free(one);
+    tcg_temp_free(mask);
+}
+
+void gen_store32(TCGv vaddr, TCGv src, int width, int slot)
+{
+    tcg_gen_mov_tl(hex_store_addr[slot], vaddr);
+    tcg_gen_movi_tl(hex_store_width[slot], width);
+    tcg_gen_mov_tl(hex_store_val32[slot], src);
+}
+
+void gen_store1(TCGv_env cpu_env, TCGv vaddr, TCGv src, DisasContext *ctx,
+                int slot)
+{
+    gen_store32(vaddr, src, 1, slot);
+    ctx->store_width[slot] = 1;
+}
+
+void gen_store2(TCGv_env cpu_env, TCGv vaddr, TCGv src, DisasContext *ctx,
+                int slot)
+{
+    gen_store32(vaddr, src, 2, slot);
+    ctx->store_width[slot] = 2;
+}
+
+void gen_store4(TCGv_env cpu_env, TCGv vaddr, TCGv src, DisasContext *ctx,
+                int slot)
+{
+    gen_store32(vaddr, src, 4, slot);
+    ctx->store_width[slot] = 4;
+}
+
+
+void gen_store8(TCGv_env cpu_env, TCGv vaddr, TCGv_i64 src, DisasContext *ctx,
+                int slot)
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
+void gen_sat_i32(TCGv dest, TCGv source, int width, bool set_overflow)
+{
+    TCGv max_val = tcg_const_i32((1 << (width - 1)) - 1);
+    TCGv min_val = tcg_const_i32(-(1 << (width - 1)));
+    tcg_gen_movcond_i32(TCG_COND_GT, dest, source, max_val, max_val, source);
+    tcg_gen_movcond_i32(TCG_COND_LT, dest, source, min_val, min_val, dest);
+    /* Set Overflow Bit */
+    if (set_overflow) {
+        TCGv ovf = tcg_temp_new();
+        TCGv one = tcg_const_i32(1);
+        GET_USR_FIELD(USR_OVF, ovf);
+        tcg_gen_movcond_i32(TCG_COND_GT, ovf, source, max_val, one, ovf);
+        tcg_gen_movcond_i32(TCG_COND_LT, ovf, source, min_val, one, ovf);
+        SET_USR_FIELD(USR_OVF, ovf);
+        tcg_temp_free_i32(ovf);
+        tcg_temp_free_i32(one);
+    }
+    tcg_temp_free_i32(max_val);
+    tcg_temp_free_i32(min_val);
+}
+
+void gen_satu_i32(TCGv dest, TCGv source, int width, bool set_overflow)
+{
+    TCGv max_val = tcg_const_i32((1 << width) - 1);
+    tcg_gen_movcond_i32(TCG_COND_GTU, dest, source, max_val, max_val, source);
+    TCGv_i32 zero = tcg_const_i32(0);
+    tcg_gen_movcond_i32(TCG_COND_LT, dest, source, zero, zero, dest);
+    /* Set Overflow Bit */
+    if (set_overflow) {
+        TCGv ovf = tcg_temp_new();
+        TCGv one = tcg_const_i32(1);
+        GET_USR_FIELD(USR_OVF, ovf);
+        tcg_gen_movcond_i32(TCG_COND_GTU, ovf, source, max_val, one, ovf);
+        SET_USR_FIELD(USR_OVF, ovf);
+        tcg_temp_free_i32(ovf);
+        tcg_temp_free_i32(one);
+    }
+    tcg_temp_free_i32(max_val);
+    tcg_temp_free_i32(zero);
+}
+
+void gen_sat_i64(TCGv_i64 dest, TCGv_i64 source, int width, bool set_overflow)
+{
+    TCGv_i64 max_val = tcg_const_i64((1 << (width - 1)) - 1);
+    TCGv_i64 min_val = tcg_const_i64(-(1 << (width - 1)));
+    tcg_gen_movcond_i64(TCG_COND_GT, dest, source, max_val, max_val, source);
+    tcg_gen_movcond_i64(TCG_COND_LT, dest, source, min_val, min_val, dest);
+    /* Set Overflow Bit */
+    if (set_overflow) {
+        TCGv ovf = tcg_temp_new();
+        TCGv_i64 ovf_ext = tcg_temp_new_i64();
+        TCGv_i64 one = tcg_const_i64(1);
+        GET_USR_FIELD(USR_OVF, ovf);
+        tcg_gen_ext_i32_i64(ovf_ext, ovf);
+        tcg_gen_movcond_i64(TCG_COND_GT,
+                            ovf_ext,
+                            source,
+                            max_val,
+                            one,
+                            ovf_ext);
+        tcg_gen_movcond_i64(TCG_COND_LT,
+                            ovf_ext,
+                            source,
+                            min_val,
+                            one,
+                            ovf_ext);
+        tcg_gen_trunc_i64_tl(ovf, ovf_ext);
+        SET_USR_FIELD(USR_OVF, ovf);
+        tcg_temp_free_i32(ovf);
+        tcg_temp_free_i64(ovf_ext);
+        tcg_temp_free_i64(one);
+    }
+    tcg_temp_free_i64(max_val);
+    tcg_temp_free_i64(min_val);
+}
+
+void gen_satu_i64(TCGv_i64 dest, TCGv_i64 source, int width, bool set_overflow)
+{
+    TCGv_i64 max_val = tcg_const_i64((1 << width) - 1);
+    tcg_gen_movcond_i64(TCG_COND_GTU, dest, source, max_val, max_val, source);
+    TCGv_i64 zero = tcg_const_i64(0);
+    tcg_gen_movcond_i64(TCG_COND_LT, dest, source, zero, zero, dest);
+    /* Set Overflow Bit */
+    if (set_overflow) {
+        TCGv ovf = tcg_temp_new();
+        TCGv_i64 ovf_ext = tcg_temp_new_i64();
+        TCGv_i64 one = tcg_const_i64(1);
+        GET_USR_FIELD(USR_OVF, ovf);
+        tcg_gen_ext_i32_i64(ovf_ext, ovf);
+        tcg_gen_movcond_i64(TCG_COND_GTU,
+                            ovf_ext,
+                            source,
+                            max_val,
+                            one,
+                            ovf_ext);
+        tcg_gen_trunc_i64_tl(ovf, ovf_ext);
+        SET_USR_FIELD(USR_OVF, ovf);
+        tcg_temp_free_i32(ovf);
+        tcg_temp_free_i64(ovf_ext);
+        tcg_temp_free_i64(one);
+    }
+    tcg_temp_free_i64(max_val);
+    tcg_temp_free_i64(zero);
+}
+
 #include "tcg_funcs_generated.c.inc"
 #include "tcg_func_table_generated.c.inc"
diff --git a/target/hexagon/genptr.h b/target/hexagon/genptr.h
index 0bfa99b463..e7f8f2c469 100644
--- a/target/hexagon/genptr.h
+++ b/target/hexagon/genptr.h
@@ -28,5 +28,24 @@ TCGv gen_read_reg(TCGv result, int num);
 TCGv gen_read_preg(TCGv pred, uint8_t num);
 void gen_log_reg_write(int rnum, TCGv val);
 void gen_log_pred_write(int pnum, TCGv val);
+void gen_fbrev(TCGv result, TCGv src);
+void gen_cancel(TCGv slot);
+TCGv gen_set_bit(int i, TCGv result, TCGv src);
+void gen_store32(TCGv vaddr, TCGv src, int width, int slot);
+void gen_store1(TCGv_env cpu_env, TCGv vaddr, TCGv src, DisasContext *ctx,
+                int slot);
+void gen_store2(TCGv_env cpu_env, TCGv vaddr, TCGv src, DisasContext *ctx,
+                int slot);
+void gen_store4(TCGv_env cpu_env, TCGv vaddr, TCGv src, DisasContext *ctx,
+                int slot);
+void gen_store8(TCGv_env cpu_env, TCGv vaddr, TCGv_i64 src, DisasContext *ctx,
+                int slot);
+void gen_set_usr_field(int field, TCGv val);
+void gen_set_usr_fieldi(int field, int x);
+void gen_write_new_pc(TCGv addr);
+void gen_sat_i32(TCGv dest, TCGv source, int width, bool set_overflow);
+void gen_satu_i32(TCGv dest, TCGv source, int width, bool set_overflow);
+void gen_sat_i64(TCGv_i64 dest, TCGv_i64 source, int width, bool set_overflow);
+void gen_satu_i64(TCGv_i64 dest, TCGv_i64 source, int width, bool set_overflow);
 
 #endif
-- 
2.30.0


