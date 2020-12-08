Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABEB82D31AE
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 19:05:58 +0100 (CET)
Received: from localhost ([::1]:34952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmhN7-0001UR-MX
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 13:05:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kmhIp-0007TN-HT
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 13:01:32 -0500
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:34252)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kmhIl-0006Kc-KS
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 13:01:30 -0500
Received: by mail-oi1-x244.google.com with SMTP id s75so17233182oih.1
 for <qemu-devel@nongnu.org>; Tue, 08 Dec 2020 10:01:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OIeG0HtO8d8Mwa7eQJ7M8KIfL8fiUCeADCRKHk2MWcU=;
 b=w3NeguE+vuY5Q+0D6kskU9qmGWIEJ5nJHMi9JgVPWnMaKdvmr2FEDVOZUB0jn28pQH
 ab9WdCzsMmgqCY7EIxUJ1+GHZJZr7osqVMqI7gV67xKPvLO4QZBGI/EWyzmjcpz4CRUl
 0oN4NllSXVMgWFZ73dKJ+cD8F0foeiOc543DIkYe5MlyH2NzK4+HbgrjlLjUiElV+LdX
 9y5Dz41zdFu+ZiVhKitYnFF7iDmLSZ9il1itENpbuNNq+jGq/JtLW7uw+dkDxVDJOSBG
 cpQEAE+K6My/MH5CwbMoUpSE3c2DZ9W4Jptt0DQil5X+Fx8FoaINiPoyD9MIcyP2+u0P
 gUlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OIeG0HtO8d8Mwa7eQJ7M8KIfL8fiUCeADCRKHk2MWcU=;
 b=De3iPlVpXRf0XeHG8brYSA/ZnvbDo0JmKZTjywZTCZIpvFENNOFgDshMZWPMOoUcES
 FKZuynZ4y/6M5PaRuGxyU3i9Zt9ai1hkdZpYSwOCNS2Nhf9Knour1UY0qOlx7PSjxOXO
 IoJ5Q+hovJGxnWpzeRKzvGChjERRpMR6ulwh/VT9GcFl3GVIwhOeJ5X9FtoebCZ2g4Up
 lslxArB6l/i3P06iNn4GcaEML9uSNIeRlFZIH5ajaHgwe6QjFV66hX9TBPN/ldmyV5VY
 2v65c7Tj2VTqWekuzjuk+53c6/cnNQCkUWpN08QaPnkAsnrIcanpoB9AX2TE8ORzMqK/
 0ZLA==
X-Gm-Message-State: AOAM532GGAmAXnaYbf7DO9WrCUHaCeAHB0O8Sv1xIacEdwXBeXKNmQLC
 S5I/Dr6ndJMs5CiVkp9zTZ+tE3vyK8yKNH+I
X-Google-Smtp-Source: ABdhPJwuAth5KvGmHgvaMlIHh/KEbYVb1abxt8uzZTNbxM1hx2jQHh0AQEmiEgHgzj2IQx69xrkrPg==
X-Received: by 2002:aca:d4cf:: with SMTP id l198mr3636045oig.170.1607450485203; 
 Tue, 08 Dec 2020 10:01:25 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id k20sm3886805oig.35.2020.12.08.10.01.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Dec 2020 10:01:24 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 03/24] target/arm: Adjust gen_aa32_{ld,
 st}_i32 for align+endianness
Date: Tue,  8 Dec 2020 12:00:57 -0600
Message-Id: <20201208180118.157911-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201208180118.157911-1-richard.henderson@linaro.org>
References: <20201208180118.157911-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::244;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x244.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Create a finalize_memop function that computes alignment and
endianness and returns the final MemOp for the operation.

Split out gen_aa32_{ld,st}_internal_i32 which bypasses any special
handling of endianness or alignment.  Adjust gen_aa32_{ld,st}_i32
so that s->be_data is not added by the callers.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.h          |  24 ++++++++
 target/arm/translate.c          | 100 +++++++++++++++++---------------
 target/arm/translate-neon.c.inc |   9 +--
 3 files changed, 79 insertions(+), 54 deletions(-)

diff --git a/target/arm/translate.h b/target/arm/translate.h
index fb66b4d8a0..22a4b15d45 100644
--- a/target/arm/translate.h
+++ b/target/arm/translate.h
@@ -448,4 +448,28 @@ static inline TCGv_ptr fpstatus_ptr(ARMFPStatusFlavour flavour)
     return statusptr;
 }
 
+/**
+ * finalize_memop:
+ * @s: DisasContext
+ * @opc: size+sign+align of the memory operation
+ *
+ * Build the complete MemOp for a memory operation, including alignment
+ * and endianness.
+ *
+ * If (op & MO_AMASK) then the operation already contains the required
+ * alignment, e.g. for AccType_ATOMIC.  Otherwise, this an optionally
+ * unaligned operation, e.g. for AccType_NORMAL.
+ *
+ * In the later case, there are configuration bits that require alignment,
+ * and this is applied here.  Note that there is no way to indicate that
+ * no alignment should ever be enforced; this must be handled manually.
+ */
+static inline MemOp finalize_memop(DisasContext *s, MemOp opc)
+{
+    if (s->align_mem && !(opc & MO_AMASK)) {
+        opc |= MO_ALIGN;
+    }
+    return opc | s->be_data;
+}
+
 #endif /* TARGET_ARM_TRANSLATE_H */
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 4bd93e66c8..7b3ebf44ae 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -875,7 +875,8 @@ static inline void store_reg_from_load(DisasContext *s, int reg, TCGv_i32 var)
 #define IS_USER_ONLY 0
 #endif
 
-/* Abstractions of "generate code to do a guest load/store for
+/*
+ * Abstractions of "generate code to do a guest load/store for
  * AArch32", where a vaddr is always 32 bits (and is zero
  * extended if we're a 64 bit core) and  data is also
  * 32 bits unless specifically doing a 64 bit access.
@@ -883,7 +884,7 @@ static inline void store_reg_from_load(DisasContext *s, int reg, TCGv_i32 var)
  * that the address argument is TCGv_i32 rather than TCGv.
  */
 
-static inline TCGv gen_aa32_addr(DisasContext *s, TCGv_i32 a32, MemOp op)
+static TCGv gen_aa32_addr(DisasContext *s, TCGv_i32 a32, MemOp op)
 {
     TCGv addr = tcg_temp_new();
     tcg_gen_extu_i32_tl(addr, a32);
@@ -895,47 +896,51 @@ static inline TCGv gen_aa32_addr(DisasContext *s, TCGv_i32 a32, MemOp op)
     return addr;
 }
 
+/*
+ * Internal routines are used for NEON cases where the endianness
+ * and/or alignment has already been taken into account and manipulated.
+ */
+static void gen_aa32_ld_internal_i32(DisasContext *s, TCGv_i32 val,
+                                     TCGv_i32 a32, int index, MemOp opc)
+{
+    TCGv addr = gen_aa32_addr(s, a32, opc);
+    tcg_gen_qemu_ld_i32(val, addr, index, opc);
+    tcg_temp_free(addr);
+}
+
+static void gen_aa32_st_internal_i32(DisasContext *s, TCGv_i32 val,
+                                     TCGv_i32 a32, int index, MemOp opc)
+{
+    TCGv addr = gen_aa32_addr(s, a32, opc);
+    tcg_gen_qemu_st_i32(val, addr, index, opc);
+    tcg_temp_free(addr);
+}
+
 static void gen_aa32_ld_i32(DisasContext *s, TCGv_i32 val, TCGv_i32 a32,
                             int index, MemOp opc)
 {
-    TCGv addr;
-
-    if (s->align_mem) {
-        opc |= MO_ALIGN;
-    }
-
-    addr = gen_aa32_addr(s, a32, opc);
-    tcg_gen_qemu_ld_i32(val, addr, index, opc);
-    tcg_temp_free(addr);
+    gen_aa32_ld_internal_i32(s, val, a32, index, finalize_memop(s, opc));
 }
 
 static void gen_aa32_st_i32(DisasContext *s, TCGv_i32 val, TCGv_i32 a32,
                             int index, MemOp opc)
 {
-    TCGv addr;
+    gen_aa32_st_internal_i32(s, val, a32, index, finalize_memop(s, opc));
+}
 
-    if (s->align_mem) {
-        opc |= MO_ALIGN;
+#define DO_GEN_LD(SUFF, OPC)                                            \
+    static inline void gen_aa32_ld##SUFF(DisasContext *s, TCGv_i32 val, \
+                                         TCGv_i32 a32, int index)       \
+    {                                                                   \
+        gen_aa32_ld_i32(s, val, a32, index, OPC);                       \
     }
 
-    addr = gen_aa32_addr(s, a32, opc);
-    tcg_gen_qemu_st_i32(val, addr, index, opc);
-    tcg_temp_free(addr);
-}
-
-#define DO_GEN_LD(SUFF, OPC)                                             \
-static inline void gen_aa32_ld##SUFF(DisasContext *s, TCGv_i32 val,      \
-                                     TCGv_i32 a32, int index)            \
-{                                                                        \
-    gen_aa32_ld_i32(s, val, a32, index, OPC | s->be_data);               \
-}
-
-#define DO_GEN_ST(SUFF, OPC)                                             \
-static inline void gen_aa32_st##SUFF(DisasContext *s, TCGv_i32 val,      \
-                                     TCGv_i32 a32, int index)            \
-{                                                                        \
-    gen_aa32_st_i32(s, val, a32, index, OPC | s->be_data);               \
-}
+#define DO_GEN_ST(SUFF, OPC)                                            \
+    static inline void gen_aa32_st##SUFF(DisasContext *s, TCGv_i32 val, \
+                                         TCGv_i32 a32, int index)       \
+    {                                                                   \
+        gen_aa32_st_i32(s, val, a32, index, OPC);                       \
+    }
 
 static inline void gen_aa32_frob64(DisasContext *s, TCGv_i64 val)
 {
@@ -6412,7 +6417,7 @@ static bool op_load_rr(DisasContext *s, arg_ldst_rr *a,
     addr = op_addr_rr_pre(s, a);
 
     tmp = tcg_temp_new_i32();
-    gen_aa32_ld_i32(s, tmp, addr, mem_idx, mop | s->be_data);
+    gen_aa32_ld_i32(s, tmp, addr, mem_idx, mop);
     disas_set_da_iss(s, mop, issinfo);
 
     /*
@@ -6433,7 +6438,7 @@ static bool op_store_rr(DisasContext *s, arg_ldst_rr *a,
     addr = op_addr_rr_pre(s, a);
 
     tmp = load_reg(s, a->rt);
-    gen_aa32_st_i32(s, tmp, addr, mem_idx, mop | s->be_data);
+    gen_aa32_st_i32(s, tmp, addr, mem_idx, mop);
     disas_set_da_iss(s, mop, issinfo);
     tcg_temp_free_i32(tmp);
 
@@ -6456,13 +6461,13 @@ static bool trans_LDRD_rr(DisasContext *s, arg_ldst_rr *a)
     addr = op_addr_rr_pre(s, a);
 
     tmp = tcg_temp_new_i32();
-    gen_aa32_ld_i32(s, tmp, addr, mem_idx, MO_UL | s->be_data);
+    gen_aa32_ld_i32(s, tmp, addr, mem_idx, MO_UL);
     store_reg(s, a->rt, tmp);
 
     tcg_gen_addi_i32(addr, addr, 4);
 
     tmp = tcg_temp_new_i32();
-    gen_aa32_ld_i32(s, tmp, addr, mem_idx, MO_UL | s->be_data);
+    gen_aa32_ld_i32(s, tmp, addr, mem_idx, MO_UL);
     store_reg(s, a->rt + 1, tmp);
 
     /* LDRD w/ base writeback is undefined if the registers overlap.  */
@@ -6485,13 +6490,13 @@ static bool trans_STRD_rr(DisasContext *s, arg_ldst_rr *a)
     addr = op_addr_rr_pre(s, a);
 
     tmp = load_reg(s, a->rt);
-    gen_aa32_st_i32(s, tmp, addr, mem_idx, MO_UL | s->be_data);
+    gen_aa32_st_i32(s, tmp, addr, mem_idx, MO_UL);
     tcg_temp_free_i32(tmp);
 
     tcg_gen_addi_i32(addr, addr, 4);
 
     tmp = load_reg(s, a->rt + 1);
-    gen_aa32_st_i32(s, tmp, addr, mem_idx, MO_UL | s->be_data);
+    gen_aa32_st_i32(s, tmp, addr, mem_idx, MO_UL);
     tcg_temp_free_i32(tmp);
 
     op_addr_rr_post(s, a, addr, -4);
@@ -6556,7 +6561,7 @@ static bool op_load_ri(DisasContext *s, arg_ldst_ri *a,
     addr = op_addr_ri_pre(s, a);
 
     tmp = tcg_temp_new_i32();
-    gen_aa32_ld_i32(s, tmp, addr, mem_idx, mop | s->be_data);
+    gen_aa32_ld_i32(s, tmp, addr, mem_idx, mop);
     disas_set_da_iss(s, mop, issinfo);
 
     /*
@@ -6577,7 +6582,7 @@ static bool op_store_ri(DisasContext *s, arg_ldst_ri *a,
     addr = op_addr_ri_pre(s, a);
 
     tmp = load_reg(s, a->rt);
-    gen_aa32_st_i32(s, tmp, addr, mem_idx, mop | s->be_data);
+    gen_aa32_st_i32(s, tmp, addr, mem_idx, mop);
     disas_set_da_iss(s, mop, issinfo);
     tcg_temp_free_i32(tmp);
 
@@ -6593,13 +6598,13 @@ static bool op_ldrd_ri(DisasContext *s, arg_ldst_ri *a, int rt2)
     addr = op_addr_ri_pre(s, a);
 
     tmp = tcg_temp_new_i32();
-    gen_aa32_ld_i32(s, tmp, addr, mem_idx, MO_UL | s->be_data);
+    gen_aa32_ld_i32(s, tmp, addr, mem_idx, MO_UL);
     store_reg(s, a->rt, tmp);
 
     tcg_gen_addi_i32(addr, addr, 4);
 
     tmp = tcg_temp_new_i32();
-    gen_aa32_ld_i32(s, tmp, addr, mem_idx, MO_UL | s->be_data);
+    gen_aa32_ld_i32(s, tmp, addr, mem_idx, MO_UL);
     store_reg(s, rt2, tmp);
 
     /* LDRD w/ base writeback is undefined if the registers overlap.  */
@@ -6632,13 +6637,13 @@ static bool op_strd_ri(DisasContext *s, arg_ldst_ri *a, int rt2)
     addr = op_addr_ri_pre(s, a);
 
     tmp = load_reg(s, a->rt);
-    gen_aa32_st_i32(s, tmp, addr, mem_idx, MO_UL | s->be_data);
+    gen_aa32_st_i32(s, tmp, addr, mem_idx, MO_UL);
     tcg_temp_free_i32(tmp);
 
     tcg_gen_addi_i32(addr, addr, 4);
 
     tmp = load_reg(s, rt2);
-    gen_aa32_st_i32(s, tmp, addr, mem_idx, MO_UL | s->be_data);
+    gen_aa32_st_i32(s, tmp, addr, mem_idx, MO_UL);
     tcg_temp_free_i32(tmp);
 
     op_addr_ri_post(s, a, addr, -4);
@@ -6864,7 +6869,7 @@ static bool op_stl(DisasContext *s, arg_STL *a, MemOp mop)
     addr = load_reg(s, a->rn);
     tmp = load_reg(s, a->rt);
     tcg_gen_mb(TCG_MO_ALL | TCG_BAR_STRL);
-    gen_aa32_st_i32(s, tmp, addr, get_mem_index(s), mop | s->be_data);
+    gen_aa32_st_i32(s, tmp, addr, get_mem_index(s), mop);
     disas_set_da_iss(s, mop, a->rt | ISSIsAcqRel | ISSIsWrite);
 
     tcg_temp_free_i32(tmp);
@@ -7020,7 +7025,7 @@ static bool op_lda(DisasContext *s, arg_LDA *a, MemOp mop)
 
     addr = load_reg(s, a->rn);
     tmp = tcg_temp_new_i32();
-    gen_aa32_ld_i32(s, tmp, addr, get_mem_index(s), mop | s->be_data);
+    gen_aa32_ld_i32(s, tmp, addr, get_mem_index(s), mop);
     disas_set_da_iss(s, mop, a->rt | ISSIsAcqRel);
     tcg_temp_free_i32(addr);
 
@@ -8166,8 +8171,7 @@ static bool op_tbranch(DisasContext *s, arg_tbranch *a, bool half)
     addr = load_reg(s, a->rn);
     tcg_gen_add_i32(addr, addr, tmp);
 
-    gen_aa32_ld_i32(s, tmp, addr, get_mem_index(s),
-                    half ? MO_UW | s->be_data : MO_UB);
+    gen_aa32_ld_i32(s, tmp, addr, get_mem_index(s), half ? MO_UW : MO_UB);
     tcg_temp_free_i32(addr);
 
     tcg_gen_add_i32(tmp, tmp, tmp);
diff --git a/target/arm/translate-neon.c.inc b/target/arm/translate-neon.c.inc
index 0e5828744b..c82aa1412e 100644
--- a/target/arm/translate-neon.c.inc
+++ b/target/arm/translate-neon.c.inc
@@ -559,8 +559,7 @@ static bool trans_VLD_all_lanes(DisasContext *s, arg_VLD_all_lanes *a)
     addr = tcg_temp_new_i32();
     load_reg_var(s, addr, a->rn);
     for (reg = 0; reg < nregs; reg++) {
-        gen_aa32_ld_i32(s, tmp, addr, get_mem_index(s),
-                        s->be_data | size);
+        gen_aa32_ld_i32(s, tmp, addr, get_mem_index(s), size);
         if ((vd & 1) && vec_size == 16) {
             /*
              * We cannot write 16 bytes at once because the
@@ -650,13 +649,11 @@ static bool trans_VLDST_single(DisasContext *s, arg_VLDST_single *a)
      */
     for (reg = 0; reg < nregs; reg++) {
         if (a->l) {
-            gen_aa32_ld_i32(s, tmp, addr, get_mem_index(s),
-                            s->be_data | a->size);
+            gen_aa32_ld_i32(s, tmp, addr, get_mem_index(s), a->size);
             neon_store_element(vd, a->reg_idx, a->size, tmp);
         } else { /* Store */
             neon_load_element(tmp, vd, a->reg_idx, a->size);
-            gen_aa32_st_i32(s, tmp, addr, get_mem_index(s),
-                            s->be_data | a->size);
+            gen_aa32_st_i32(s, tmp, addr, get_mem_index(s), a->size);
         }
         vd += a->stride;
         tcg_gen_addi_i32(addr, addr, 1 << a->size);
-- 
2.25.1


