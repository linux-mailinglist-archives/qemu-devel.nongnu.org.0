Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E37C6205C49
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Jun 2020 21:57:38 +0200 (CEST)
Received: from localhost ([::1]:44924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jnp33-0007wD-Um
	for lists+qemu-devel@lfdr.de; Tue, 23 Jun 2020 15:57:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jnojj-0004Qh-Se
 for qemu-devel@nongnu.org; Tue, 23 Jun 2020 15:37:39 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:36447)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jnojg-0005mn-5t
 for qemu-devel@nongnu.org; Tue, 23 Jun 2020 15:37:39 -0400
Received: by mail-pf1-x433.google.com with SMTP id 136so963076pfv.3
 for <qemu-devel@nongnu.org>; Tue, 23 Jun 2020 12:37:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nL2kyRVH8ygeGDwLvE8wrTxZ759kebOYodYM0UV+KNw=;
 b=aAzfWpsKyzzrBdrHtKmHXhtKqZB7ZqY2RVXulbu+Ni+U4nDLx3ZowUPghysfSe5hbY
 K7j8xy7BwOM7bnl+3yxMIYeW2liL65DKMqsercB2SvJLBLmU/7/nmvYnMvS//7fPnr9r
 +aKoH0HMk3i/12Vm9zYU4pgqjzJTzNvYUA7kTOSxuoD/eI8dxReHY7mqR/wvBxjfLOKm
 IxbgEUlkElMsNLxhM8YJPtjWZ0Q7ttMrfTwqHEN/sSc8re6qH0fLH0YJ74G6hlOxVCQM
 GOdMcCpSYzmZGTIAuWjSCrrf0FuFgb+Jm2yB2OBKDje4KV2bzDi6LRQ5rH6goRVLz4B8
 9liA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nL2kyRVH8ygeGDwLvE8wrTxZ759kebOYodYM0UV+KNw=;
 b=J/htiPkN6Hv2VlfgS7VnsR0yGGpp8YRcfG95hJo0eUqFh+qAlbYUzmAJy+2GzZV6pN
 FsSaM/ExnOAuSCWI0rkUaE0bXpGcW+cSkHKEBYDLo+DP0aT/wwchvyYW7aFAQxQkkHl0
 KIv7N485NqHqGZFmOUoINdDx3nnzgjHnpgpHMGjaoqUVBPyZ1ghDlTbIsLq0swpEwDFC
 WAX3UrldAcLmVwpkGHuTnQpcrt5K62QB6k0YaJvpkiod5akLLpQrg2xEfNR0CNQKNqfR
 sTrRh7/q78a8+fWq6Sn6jiQIEYZBFRpfGBxZGjCyZmdgO+zgY0gwRN7qVpNtLwlvF8+m
 I7Pg==
X-Gm-Message-State: AOAM5314wWCASoPVAR2g7UN8I2VBTBzyY54rm6gG0QtmDistMYaMunrc
 dvzLadu5tothsZa7pZp7GdKsUq8DiWI=
X-Google-Smtp-Source: ABdhPJyyHI/LDUF7LdEEivFDevpFJNjcbK7evWa6WcxT7hXWQqrOptJ6fpzvsggAcwZ0JppPQLStEQ==
X-Received: by 2002:a63:925a:: with SMTP id s26mr18491757pgn.21.1592941054400; 
 Tue, 23 Jun 2020 12:37:34 -0700 (PDT)
Received: from localhost.localdomain (174-21-143-238.tukw.qwest.net.
 [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id p12sm17927642pfq.69.2020.06.23.12.37.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jun 2020 12:37:33 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 24/45] target/arm: Add gen_mte_checkN
Date: Tue, 23 Jun 2020 12:36:37 -0700
Message-Id: <20200623193658.623279-25-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200623193658.623279-1-richard.henderson@linaro.org>
References: <20200623193658.623279-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, david.spickett@linaro.org,
 steplong@quicinc.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Replace existing uses of check_data_tbi in translate-a64.c that
perform multiple logical memory access.  Leave the helper blank
for now to reduce the patch size.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-a64.h    |  1 +
 target/arm/translate-a64.h |  2 ++
 target/arm/mte_helper.c    |  8 +++++
 target/arm/translate-a64.c | 71 +++++++++++++++++++++++++++++---------
 4 files changed, 66 insertions(+), 16 deletions(-)

diff --git a/target/arm/helper-a64.h b/target/arm/helper-a64.h
index 2faa49d0a3..005af678c7 100644
--- a/target/arm/helper-a64.h
+++ b/target/arm/helper-a64.h
@@ -105,6 +105,7 @@ DEF_HELPER_FLAGS_2(xpaci, TCG_CALL_NO_RWG_SE, i64, env, i64)
 DEF_HELPER_FLAGS_2(xpacd, TCG_CALL_NO_RWG_SE, i64, env, i64)
 
 DEF_HELPER_FLAGS_3(mte_check1, TCG_CALL_NO_WG, i64, env, i32, i64)
+DEF_HELPER_FLAGS_3(mte_checkN, TCG_CALL_NO_WG, i64, env, i32, i64)
 DEF_HELPER_FLAGS_3(irg, TCG_CALL_NO_RWG, i64, env, i64, i64)
 DEF_HELPER_FLAGS_4(addsubg, TCG_CALL_NO_RWG_SE, i64, env, i64, s32, i32)
 DEF_HELPER_FLAGS_3(ldg, TCG_CALL_NO_WG, i64, env, i64, i64)
diff --git a/target/arm/translate-a64.h b/target/arm/translate-a64.h
index daab6a9666..781c441399 100644
--- a/target/arm/translate-a64.h
+++ b/target/arm/translate-a64.h
@@ -42,6 +42,8 @@ bool logic_imm_decode_wmask(uint64_t *result, unsigned int immn,
 bool sve_access_check(DisasContext *s);
 TCGv_i64 gen_mte_check1(DisasContext *s, TCGv_i64 addr, bool is_write,
                         bool tag_checked, int log2_size);
+TCGv_i64 gen_mte_checkN(DisasContext *s, TCGv_i64 addr, bool is_write,
+                        bool tag_checked, int count, int log2_esize);
 
 /* We should have at some point before trying to access an FP register
  * done the necessary access check, so assert that
diff --git a/target/arm/mte_helper.c b/target/arm/mte_helper.c
index ec12768dfc..907a12b366 100644
--- a/target/arm/mte_helper.c
+++ b/target/arm/mte_helper.c
@@ -366,3 +366,11 @@ uint64_t HELPER(mte_check1)(CPUARMState *env, uint32_t desc, uint64_t ptr)
 {
     return ptr;
 }
+
+/*
+ * Perform an MTE checked access for multiple logical accesses.
+ */
+uint64_t HELPER(mte_checkN)(CPUARMState *env, uint32_t desc, uint64_t ptr)
+{
+    return ptr;
+}
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 0720c39e89..5d62aff5d6 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -284,6 +284,34 @@ TCGv_i64 gen_mte_check1(DisasContext *s, TCGv_i64 addr, bool is_write,
                                  false, get_mem_index(s));
 }
 
+/*
+ * For MTE, check multiple logical sequential accesses.
+ */
+TCGv_i64 gen_mte_checkN(DisasContext *s, TCGv_i64 addr, bool is_write,
+                        bool tag_checked, int log2_esize, int total_size)
+{
+    if (tag_checked && s->mte_active[0] && total_size != (1 << log2_esize)) {
+        TCGv_i32 tcg_desc;
+        TCGv_i64 ret;
+        int desc = 0;
+
+        desc = FIELD_DP32(desc, MTEDESC, MIDX, get_mem_index(s));
+        desc = FIELD_DP32(desc, MTEDESC, TBI, s->tbid);
+        desc = FIELD_DP32(desc, MTEDESC, TCMA, s->tcma);
+        desc = FIELD_DP32(desc, MTEDESC, WRITE, is_write);
+        desc = FIELD_DP32(desc, MTEDESC, ESIZE, 1 << log2_esize);
+        desc = FIELD_DP32(desc, MTEDESC, TSIZE, total_size);
+        tcg_desc = tcg_const_i32(desc);
+
+        ret = new_tmp_a64(s);
+        gen_helper_mte_checkN(ret, cpu_env, tcg_desc, addr);
+        tcg_temp_free_i32(tcg_desc);
+
+        return ret;
+    }
+    return gen_mte_check1(s, addr, is_write, tag_checked, log2_esize);
+}
+
 typedef struct DisasCompare64 {
     TCGCond cond;
     TCGv_i64 value;
@@ -2848,7 +2876,10 @@ static void disas_ldst_pair(DisasContext *s, uint32_t insn)
         }
     }
 
-    clean_addr = clean_data_tbi(s, dirty_addr);
+    clean_addr = gen_mte_checkN(s, dirty_addr, !is_load,
+                                (wback || rn != 31) && !set_tag,
+                                size, 2 << size);
+
     if (is_vector) {
         if (is_load) {
             do_fp_ld(s, rt, clean_addr, size);
@@ -3514,7 +3545,7 @@ static void disas_ldst_multiple_struct(DisasContext *s, uint32_t insn)
     TCGv_i64 clean_addr, tcg_rn, tcg_ebytes;
     MemOp endian = s->be_data;
 
-    int ebytes;   /* bytes per element */
+    int total;    /* total bytes */
     int elements; /* elements per vector */
     int rpt;    /* num iterations */
     int selem;  /* structure elements */
@@ -3584,19 +3615,26 @@ static void disas_ldst_multiple_struct(DisasContext *s, uint32_t insn)
         endian = MO_LE;
     }
 
-    /* Consecutive little-endian elements from a single register
+    total = rpt * selem * (is_q ? 16 : 8);
+    tcg_rn = cpu_reg_sp(s, rn);
+
+    /*
+     * Issue the MTE check vs the logical repeat count, before we
+     * promote consecutive little-endian elements below.
+     */
+    clean_addr = gen_mte_checkN(s, tcg_rn, is_store, is_postidx || rn != 31,
+                                size, total);
+
+    /*
+     * Consecutive little-endian elements from a single register
      * can be promoted to a larger little-endian operation.
      */
     if (selem == 1 && endian == MO_LE) {
         size = 3;
     }
-    ebytes = 1 << size;
-    elements = (is_q ? 16 : 8) / ebytes;
-
-    tcg_rn = cpu_reg_sp(s, rn);
-    clean_addr = clean_data_tbi(s, tcg_rn);
-    tcg_ebytes = tcg_const_i64(ebytes);
+    elements = (is_q ? 16 : 8) >> size;
 
+    tcg_ebytes = tcg_const_i64(1 << size);
     for (r = 0; r < rpt; r++) {
         int e;
         for (e = 0; e < elements; e++) {
@@ -3630,7 +3668,7 @@ static void disas_ldst_multiple_struct(DisasContext *s, uint32_t insn)
 
     if (is_postidx) {
         if (rm == 31) {
-            tcg_gen_addi_i64(tcg_rn, tcg_rn, rpt * elements * selem * ebytes);
+            tcg_gen_addi_i64(tcg_rn, tcg_rn, total);
         } else {
             tcg_gen_add_i64(tcg_rn, tcg_rn, cpu_reg(s, rm));
         }
@@ -3676,7 +3714,7 @@ static void disas_ldst_single_struct(DisasContext *s, uint32_t insn)
     int selem = (extract32(opc, 0, 1) << 1 | R) + 1;
     bool replicate = false;
     int index = is_q << 3 | S << 2 | size;
-    int ebytes, xs;
+    int xs, total;
     TCGv_i64 clean_addr, tcg_rn, tcg_ebytes;
 
     if (extract32(insn, 31, 1)) {
@@ -3730,16 +3768,17 @@ static void disas_ldst_single_struct(DisasContext *s, uint32_t insn)
         return;
     }
 
-    ebytes = 1 << scale;
-
     if (rn == 31) {
         gen_check_sp_alignment(s);
     }
 
+    total = selem << scale;
     tcg_rn = cpu_reg_sp(s, rn);
-    clean_addr = clean_data_tbi(s, tcg_rn);
-    tcg_ebytes = tcg_const_i64(ebytes);
 
+    clean_addr = gen_mte_checkN(s, tcg_rn, !is_load, is_postidx || rn != 31,
+                                scale, total);
+
+    tcg_ebytes = tcg_const_i64(1 << scale);
     for (xs = 0; xs < selem; xs++) {
         if (replicate) {
             /* Load and replicate to all elements */
@@ -3766,7 +3805,7 @@ static void disas_ldst_single_struct(DisasContext *s, uint32_t insn)
 
     if (is_postidx) {
         if (rm == 31) {
-            tcg_gen_addi_i64(tcg_rn, tcg_rn, selem * ebytes);
+            tcg_gen_addi_i64(tcg_rn, tcg_rn, total);
         } else {
             tcg_gen_add_i64(tcg_rn, tcg_rn, cpu_reg(s, rm));
         }
-- 
2.25.1


