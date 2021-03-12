Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7B28338F68
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 15:07:37 +0100 (CET)
Received: from localhost ([::1]:55960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKiS0-0005Hg-MQ
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 09:07:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lKiD0-0002vb-La
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 08:52:06 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:34612)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lKiCp-0001y3-W1
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 08:52:06 -0500
Received: by mail-wr1-x42f.google.com with SMTP id j7so1816793wrd.1
 for <qemu-devel@nongnu.org>; Fri, 12 Mar 2021 05:51:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=7YfKL+QT2RIAfcsCmY4W1T45mDb3n37lzR7TWySDUmM=;
 b=zYaff7ejN8izGBM31pRcTn27Vn5nIiFmwN5+LCtGF5c8Kf23mWbam8t3jKhGYGnXDv
 gfeL3yg+Pi4J+tfB1c4E8LuaiqLr1drTLie/5q6Z7h7VvbjFVN4EULY56uPu31QeIMeZ
 bi1/hkaRnGFr45SXUhRvrhRHleJ70epetd7I2NOOIy1nYlZ5KG8P4PHTMrBWRU+agyn7
 urLeQ4YZTd9/utWxPXbhfbj/s6MpOEMsUrZNKDAsiPA7ZSnMTWq/8fiXB2UTR6YmKKw/
 m8vrK/RvQ5PbBrsAQxO37cbA35jMRJEmCJDg2+nGqKWrBdtUf4aQVALvL8evLWE62fiM
 JrcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7YfKL+QT2RIAfcsCmY4W1T45mDb3n37lzR7TWySDUmM=;
 b=HgtmxWm/1LS5mnc3oNxRbSw3/I2OLTUnrIKMdZ1aFhDmHLrYewdK2woeSHd98JhuEX
 i/FqJnPTvIjWqFMF3cwADwL9JjKkmOsgs7xMYZ/2Ut9MX69cYuWSSvkNDOB3oO4NBtgw
 WD1cNV4lqKNU+UclSbPz9AzUeSVnIntYy2EzQ6vMQV8QBJcwkss9GEotmMw2xa0rEYAJ
 wEtlecRnlMUGHbX22PdDP1chgdTfHkb+PD269VPCvI30hxWh13zKpeYxwVHfN8p9rx5G
 9au1eihC2OO1rS1FjelZzfav7YBv3hw0i/QtraGA5HGw17uJ01nftJ+YyEZJXrXZrLR7
 agtA==
X-Gm-Message-State: AOAM530qOIccKVwp82CXFGOpooWQPJI2m8bavfFeFMfleQ4NxwXqGZer
 jyTeWYBaFkjtU20Th8bhiEYdE8zchmefy0X+
X-Google-Smtp-Source: ABdhPJzaX8ddCPTDJH5dsYmBDj37pGu3jD+jJ8VZWxleS8f5g7zEbF36DEEvBrkIwsqeOomsTXEUSQ==
X-Received: by 2002:adf:df10:: with SMTP id y16mr14191448wrl.372.1615557112129; 
 Fri, 12 Mar 2021 05:51:52 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id m6sm7964994wrv.73.2021.03.12.05.51.51
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Mar 2021 05:51:51 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 14/39] target/arm: Update BRKA, BRKB, BRKN for PREDDESC
Date: Fri, 12 Mar 2021 13:51:15 +0000
Message-Id: <20210312135140.1099-15-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210312135140.1099-1-peter.maydell@linaro.org>
References: <20210312135140.1099-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42f.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Since b64ee454a4a0, all predicate operations should be
using these field macros for predicates.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210309155305.11301-6-richard.henderson@linaro.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/sve_helper.c    | 30 ++++++++++++++----------------
 target/arm/translate-sve.c |  4 ++--
 2 files changed, 16 insertions(+), 18 deletions(-)

diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 224c767944c..8e0a5d30a53 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -2710,7 +2710,7 @@ static uint32_t do_zero(ARMPredicateReg *d, intptr_t oprsz)
 void HELPER(sve_brkpa)(void *vd, void *vn, void *vm, void *vg,
                        uint32_t pred_desc)
 {
-    intptr_t oprsz = extract32(pred_desc, 0, SIMD_OPRSZ_BITS) + 2;
+    intptr_t oprsz = FIELD_EX32(pred_desc, PREDDESC, OPRSZ);
     if (last_active_pred(vn, vg, oprsz)) {
         compute_brk_z(vd, vm, vg, oprsz, true);
     } else {
@@ -2721,7 +2721,7 @@ void HELPER(sve_brkpa)(void *vd, void *vn, void *vm, void *vg,
 uint32_t HELPER(sve_brkpas)(void *vd, void *vn, void *vm, void *vg,
                             uint32_t pred_desc)
 {
-    intptr_t oprsz = extract32(pred_desc, 0, SIMD_OPRSZ_BITS) + 2;
+    intptr_t oprsz = FIELD_EX32(pred_desc, PREDDESC, OPRSZ);
     if (last_active_pred(vn, vg, oprsz)) {
         return compute_brks_z(vd, vm, vg, oprsz, true);
     } else {
@@ -2732,7 +2732,7 @@ uint32_t HELPER(sve_brkpas)(void *vd, void *vn, void *vm, void *vg,
 void HELPER(sve_brkpb)(void *vd, void *vn, void *vm, void *vg,
                        uint32_t pred_desc)
 {
-    intptr_t oprsz = extract32(pred_desc, 0, SIMD_OPRSZ_BITS) + 2;
+    intptr_t oprsz = FIELD_EX32(pred_desc, PREDDESC, OPRSZ);
     if (last_active_pred(vn, vg, oprsz)) {
         compute_brk_z(vd, vm, vg, oprsz, false);
     } else {
@@ -2743,7 +2743,7 @@ void HELPER(sve_brkpb)(void *vd, void *vn, void *vm, void *vg,
 uint32_t HELPER(sve_brkpbs)(void *vd, void *vn, void *vm, void *vg,
                             uint32_t pred_desc)
 {
-    intptr_t oprsz = extract32(pred_desc, 0, SIMD_OPRSZ_BITS) + 2;
+    intptr_t oprsz = FIELD_EX32(pred_desc, PREDDESC, OPRSZ);
     if (last_active_pred(vn, vg, oprsz)) {
         return compute_brks_z(vd, vm, vg, oprsz, false);
     } else {
@@ -2753,56 +2753,55 @@ uint32_t HELPER(sve_brkpbs)(void *vd, void *vn, void *vm, void *vg,
 
 void HELPER(sve_brka_z)(void *vd, void *vn, void *vg, uint32_t pred_desc)
 {
-    intptr_t oprsz = extract32(pred_desc, 0, SIMD_OPRSZ_BITS) + 2;
+    intptr_t oprsz = FIELD_EX32(pred_desc, PREDDESC, OPRSZ);
     compute_brk_z(vd, vn, vg, oprsz, true);
 }
 
 uint32_t HELPER(sve_brkas_z)(void *vd, void *vn, void *vg, uint32_t pred_desc)
 {
-    intptr_t oprsz = extract32(pred_desc, 0, SIMD_OPRSZ_BITS) + 2;
+    intptr_t oprsz = FIELD_EX32(pred_desc, PREDDESC, OPRSZ);
     return compute_brks_z(vd, vn, vg, oprsz, true);
 }
 
 void HELPER(sve_brkb_z)(void *vd, void *vn, void *vg, uint32_t pred_desc)
 {
-    intptr_t oprsz = extract32(pred_desc, 0, SIMD_OPRSZ_BITS) + 2;
+    intptr_t oprsz = FIELD_EX32(pred_desc, PREDDESC, OPRSZ);
     compute_brk_z(vd, vn, vg, oprsz, false);
 }
 
 uint32_t HELPER(sve_brkbs_z)(void *vd, void *vn, void *vg, uint32_t pred_desc)
 {
-    intptr_t oprsz = extract32(pred_desc, 0, SIMD_OPRSZ_BITS) + 2;
+    intptr_t oprsz = FIELD_EX32(pred_desc, PREDDESC, OPRSZ);
     return compute_brks_z(vd, vn, vg, oprsz, false);
 }
 
 void HELPER(sve_brka_m)(void *vd, void *vn, void *vg, uint32_t pred_desc)
 {
-    intptr_t oprsz = extract32(pred_desc, 0, SIMD_OPRSZ_BITS) + 2;
+    intptr_t oprsz = FIELD_EX32(pred_desc, PREDDESC, OPRSZ);
     compute_brk_m(vd, vn, vg, oprsz, true);
 }
 
 uint32_t HELPER(sve_brkas_m)(void *vd, void *vn, void *vg, uint32_t pred_desc)
 {
-    intptr_t oprsz = extract32(pred_desc, 0, SIMD_OPRSZ_BITS) + 2;
+    intptr_t oprsz = FIELD_EX32(pred_desc, PREDDESC, OPRSZ);
     return compute_brks_m(vd, vn, vg, oprsz, true);
 }
 
 void HELPER(sve_brkb_m)(void *vd, void *vn, void *vg, uint32_t pred_desc)
 {
-    intptr_t oprsz = extract32(pred_desc, 0, SIMD_OPRSZ_BITS) + 2;
+    intptr_t oprsz = FIELD_EX32(pred_desc, PREDDESC, OPRSZ);
     compute_brk_m(vd, vn, vg, oprsz, false);
 }
 
 uint32_t HELPER(sve_brkbs_m)(void *vd, void *vn, void *vg, uint32_t pred_desc)
 {
-    intptr_t oprsz = extract32(pred_desc, 0, SIMD_OPRSZ_BITS) + 2;
+    intptr_t oprsz = FIELD_EX32(pred_desc, PREDDESC, OPRSZ);
     return compute_brks_m(vd, vn, vg, oprsz, false);
 }
 
 void HELPER(sve_brkn)(void *vd, void *vn, void *vg, uint32_t pred_desc)
 {
-    intptr_t oprsz = extract32(pred_desc, 0, SIMD_OPRSZ_BITS) + 2;
-
+    intptr_t oprsz = FIELD_EX32(pred_desc, PREDDESC, OPRSZ);
     if (!last_active_pred(vn, vg, oprsz)) {
         do_zero(vd, oprsz);
     }
@@ -2827,8 +2826,7 @@ static uint32_t predtest_ones(ARMPredicateReg *d, intptr_t oprsz,
 
 uint32_t HELPER(sve_brkns)(void *vd, void *vn, void *vg, uint32_t pred_desc)
 {
-    intptr_t oprsz = extract32(pred_desc, 0, SIMD_OPRSZ_BITS) + 2;
-
+    intptr_t oprsz = FIELD_EX32(pred_desc, PREDDESC, OPRSZ);
     if (last_active_pred(vn, vg, oprsz)) {
         return predtest_ones(vd, oprsz, -1);
     } else {
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index cac8082156a..c0212e6b08a 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -2850,7 +2850,7 @@ static bool do_brk3(DisasContext *s, arg_rprr_s *a,
     TCGv_ptr n = tcg_temp_new_ptr();
     TCGv_ptr m = tcg_temp_new_ptr();
     TCGv_ptr g = tcg_temp_new_ptr();
-    TCGv_i32 t = tcg_const_i32(vsz - 2);
+    TCGv_i32 t = tcg_const_i32(FIELD_DP32(0, PREDDESC, OPRSZ, vsz));
 
     tcg_gen_addi_ptr(d, cpu_env, pred_full_reg_offset(s, a->rd));
     tcg_gen_addi_ptr(n, cpu_env, pred_full_reg_offset(s, a->rn));
@@ -2884,7 +2884,7 @@ static bool do_brk2(DisasContext *s, arg_rpr_s *a,
     TCGv_ptr d = tcg_temp_new_ptr();
     TCGv_ptr n = tcg_temp_new_ptr();
     TCGv_ptr g = tcg_temp_new_ptr();
-    TCGv_i32 t = tcg_const_i32(vsz - 2);
+    TCGv_i32 t = tcg_const_i32(FIELD_DP32(0, PREDDESC, OPRSZ, vsz));
 
     tcg_gen_addi_ptr(d, cpu_env, pred_full_reg_offset(s, a->rd));
     tcg_gen_addi_ptr(n, cpu_env, pred_full_reg_offset(s, a->rn));
-- 
2.20.1


