Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F629362881
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 21:19:19 +0200 (CEST)
Received: from localhost ([::1]:35254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXTzq-0003Yj-GN
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 15:19:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXThj-0003l6-Vg
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 15:00:36 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:46754)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXThP-0004J3-7z
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 15:00:35 -0400
Received: by mail-pf1-x42d.google.com with SMTP id d124so18912010pfa.13
 for <qemu-devel@nongnu.org>; Fri, 16 Apr 2021 12:00:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=k4GoMuhnLHA2vh1yco9VQy1DoNTZgPa1ywK70BmOAqY=;
 b=GnzWIBTWXqAzByjbNPgKQLnXeZu6PbtAWI69mugXofwcu0Wb8joJE3pjSqslecNGaq
 B9Kz5Ianwgf3GcK7gOFbB9WiehrsaZ2YCKK9LWPelUvBZVhxGFnWTbmrpUJxP8zs1y4c
 YBV5UXpQXOgcbXe/7P2xP1jEHZ6ZSeqAFOfkLhJK+GouL664GaEmS5EHyZpXxcBtMxLi
 KcoMnbV0rwczM2r+s4Nbo+6s+uX7jXJ+4o2tfXj3L2+WhwfyRXGF6RUxboHBQUh0K6ny
 AaJH1Thu9hRXCa5pVD+V9c+wGbrMqXSMbg6Eo7u/c/3vt8yVNooeBN5CzsluYxGEjQZM
 F/FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=k4GoMuhnLHA2vh1yco9VQy1DoNTZgPa1ywK70BmOAqY=;
 b=k+E1F+GNH2b5rJJbW/ysgm7AukT8JZvOGhteheJ1vtUcdSgnYz5Hky259cIOySbTuM
 BwC2EV64C8yHuo5bgsHdbYY7JU43LRHkmocZ5nGmNc7JieofF0BiMwgrCuhFZDavGGlE
 CxZtRSTC+1aJwBKEFNuGVRUoePnD9Ung07DwyfubwKDj4eBpxYQNlSlLd4Rlc0kA7o0G
 EdW7bCaQdVmB0TF2UEdJ6DMq2n4EuqXLnTSx6q9PI19WvR/FBKT0cGb/Zeh7p9GicVr1
 0kdHVkE3rgzg7lCU33HGCwhqAxKUt6zwKP+rLeDSMMw0LAdZdJdjod9WKUdRUwlw80pw
 VFTw==
X-Gm-Message-State: AOAM530KXFeWGFGnZ575Of/g9O0yPpIfId93ALzlWUO6Q5HgZGzB6RRl
 Zi0j9CePcnCI4AncMeMF/xDiWkkjbrKSVQ==
X-Google-Smtp-Source: ABdhPJw06fJhOO4yy5yXJmC6CDw3fpJfTVKAu8O++jolQyX4ASvr6fHmweWUCgv3yUN89dmXUh2qzw==
X-Received: by 2002:a62:1409:0:b029:25a:4158:1c9 with SMTP id
 9-20020a6214090000b029025a415801c9mr3457417pfu.61.1618599609920; 
 Fri, 16 Apr 2021 12:00:09 -0700 (PDT)
Received: from localhost.localdomain ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id d7sm1988337pfv.197.2021.04.16.12.00.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 12:00:09 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 10/30] target/arm: Adjust gen_aa32_{ld,
 st}_i32 for align+endianness
Date: Fri, 16 Apr 2021 11:59:39 -0700
Message-Id: <20210416185959.1520974-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210416185959.1520974-1-richard.henderson@linaro.org>
References: <20210416185959.1520974-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Create a finalize_memop function that computes alignment and
endianness and returns the final MemOp for the operation.

Split out gen_aa32_{ld,st}_internal_i32 which bypasses any special
handling of endianness or alignment.  Adjust gen_aa32_{ld,st}_i32
so that s->be_data is not added by the callers.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.h          |  24 ++++++++
 target/arm/translate.c          | 100 +++++++++++++++++---------------
 target/arm/translate-neon.c.inc |   9 +--
 3 files changed, 79 insertions(+), 54 deletions(-)

diff --git a/target/arm/translate.h b/target/arm/translate.h
index b185c14a03..0c60b83b3d 100644
--- a/target/arm/translate.h
+++ b/target/arm/translate.h
@@ -459,4 +459,28 @@ static inline TCGv_ptr fpstatus_ptr(ARMFPStatusFlavour flavour)
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
+ * In the latter case, there are configuration bits that require alignment,
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
index 51897a5113..5e6c40022f 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -908,7 +908,8 @@ static inline void store_reg_from_load(DisasContext *s, int reg, TCGv_i32 var)
 #define IS_USER_ONLY 0
 #endif
 
-/* Abstractions of "generate code to do a guest load/store for
+/*
+ * Abstractions of "generate code to do a guest load/store for
  * AArch32", where a vaddr is always 32 bits (and is zero
  * extended if we're a 64 bit core) and  data is also
  * 32 bits unless specifically doing a 64 bit access.
@@ -916,7 +917,7 @@ static inline void store_reg_from_load(DisasContext *s, int reg, TCGv_i32 var)
  * that the address argument is TCGv_i32 rather than TCGv.
  */
 
-static inline TCGv gen_aa32_addr(DisasContext *s, TCGv_i32 a32, MemOp op)
+static TCGv gen_aa32_addr(DisasContext *s, TCGv_i32 a32, MemOp op)
 {
     TCGv addr = tcg_temp_new();
     tcg_gen_extu_i32_tl(addr, a32);
@@ -928,47 +929,51 @@ static inline TCGv gen_aa32_addr(DisasContext *s, TCGv_i32 a32, MemOp op)
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
@@ -6456,7 +6461,7 @@ static bool op_load_rr(DisasContext *s, arg_ldst_rr *a,
     addr = op_addr_rr_pre(s, a);
 
     tmp = tcg_temp_new_i32();
-    gen_aa32_ld_i32(s, tmp, addr, mem_idx, mop | s->be_data);
+    gen_aa32_ld_i32(s, tmp, addr, mem_idx, mop);
     disas_set_da_iss(s, mop, issinfo);
 
     /*
@@ -6477,7 +6482,7 @@ static bool op_store_rr(DisasContext *s, arg_ldst_rr *a,
     addr = op_addr_rr_pre(s, a);
 
     tmp = load_reg(s, a->rt);
-    gen_aa32_st_i32(s, tmp, addr, mem_idx, mop | s->be_data);
+    gen_aa32_st_i32(s, tmp, addr, mem_idx, mop);
     disas_set_da_iss(s, mop, issinfo);
     tcg_temp_free_i32(tmp);
 
@@ -6500,13 +6505,13 @@ static bool trans_LDRD_rr(DisasContext *s, arg_ldst_rr *a)
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
@@ -6529,13 +6534,13 @@ static bool trans_STRD_rr(DisasContext *s, arg_ldst_rr *a)
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
@@ -6600,7 +6605,7 @@ static bool op_load_ri(DisasContext *s, arg_ldst_ri *a,
     addr = op_addr_ri_pre(s, a);
 
     tmp = tcg_temp_new_i32();
-    gen_aa32_ld_i32(s, tmp, addr, mem_idx, mop | s->be_data);
+    gen_aa32_ld_i32(s, tmp, addr, mem_idx, mop);
     disas_set_da_iss(s, mop, issinfo);
 
     /*
@@ -6621,7 +6626,7 @@ static bool op_store_ri(DisasContext *s, arg_ldst_ri *a,
     addr = op_addr_ri_pre(s, a);
 
     tmp = load_reg(s, a->rt);
-    gen_aa32_st_i32(s, tmp, addr, mem_idx, mop | s->be_data);
+    gen_aa32_st_i32(s, tmp, addr, mem_idx, mop);
     disas_set_da_iss(s, mop, issinfo);
     tcg_temp_free_i32(tmp);
 
@@ -6637,13 +6642,13 @@ static bool op_ldrd_ri(DisasContext *s, arg_ldst_ri *a, int rt2)
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
@@ -6676,13 +6681,13 @@ static bool op_strd_ri(DisasContext *s, arg_ldst_ri *a, int rt2)
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
@@ -6908,7 +6913,7 @@ static bool op_stl(DisasContext *s, arg_STL *a, MemOp mop)
     addr = load_reg(s, a->rn);
     tmp = load_reg(s, a->rt);
     tcg_gen_mb(TCG_MO_ALL | TCG_BAR_STRL);
-    gen_aa32_st_i32(s, tmp, addr, get_mem_index(s), mop | s->be_data);
+    gen_aa32_st_i32(s, tmp, addr, get_mem_index(s), mop);
     disas_set_da_iss(s, mop, a->rt | ISSIsAcqRel | ISSIsWrite);
 
     tcg_temp_free_i32(tmp);
@@ -7064,7 +7069,7 @@ static bool op_lda(DisasContext *s, arg_LDA *a, MemOp mop)
 
     addr = load_reg(s, a->rn);
     tmp = tcg_temp_new_i32();
-    gen_aa32_ld_i32(s, tmp, addr, get_mem_index(s), mop | s->be_data);
+    gen_aa32_ld_i32(s, tmp, addr, get_mem_index(s), mop);
     disas_set_da_iss(s, mop, a->rt | ISSIsAcqRel);
     tcg_temp_free_i32(addr);
 
@@ -8248,8 +8253,7 @@ static bool op_tbranch(DisasContext *s, arg_tbranch *a, bool half)
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


