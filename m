Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 450DA332C6C
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 17:43:06 +0100 (CET)
Received: from localhost ([::1]:44164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJfRp-0001JC-1y
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 11:43:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lJefd-0004tp-SZ
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 10:53:17 -0500
Received: from mail-ot1-x32b.google.com ([2607:f8b0:4864:20::32b]:34495)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lJefa-0001Fl-M0
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 10:53:17 -0500
Received: by mail-ot1-x32b.google.com with SMTP id n23so7630556otq.1
 for <qemu-devel@nongnu.org>; Tue, 09 Mar 2021 07:53:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IUswOVHmPjwO24MveU3hkPJismX650bXSG+gRkRnCa0=;
 b=OyUjvzFU9zJ6OB/wTdFdcfACo8xGqg7O8WqTG1x4O/06XPlKKRShU0jqpmfk7TAz+S
 LwNqUgAm8mO+9xz6eAQyOCvxwjZX6xlX4jFBqR3WK78RV+S5Mez5xahEsQ+ch2BVb5Tj
 JxEBqqHxH+vA+50vzFFuPEgBb+A4Qu8cbKW+GB7iOeSJxhRv3S6Ib6qiN7rSZEmLsmrB
 PAUD80yJNM9g4+LEGpCADx9f37q8A/w0Yzb4GP5JVT6tjhBT05jr2YmbZ+5Bj9qBV/dp
 WHTkcjRlmMuYp+GQZsyBgfyB47zcGzXY/rk40+t634SCBepKolSJOFWnRIg8/tOI3/Qn
 co0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IUswOVHmPjwO24MveU3hkPJismX650bXSG+gRkRnCa0=;
 b=Bk/0qqPas/QArm96KeILH25QtLHUyhCZHovSOrdlEYUcP1YHN1OzkCGXKvynhjLiLk
 boNtZBxy51Q806EhLM8bg5/VMCzVyzBYkeFhwdMgHgGc0/14BgFLfp/kSWf7RE71PTne
 H5XJgwpXBwem7KiUWpsnOdm2Huxf14UhI31W1PH/inzZipfIfzaOXJpxJjgUc8tdCJYM
 4Mgb+u8cVGhhVS27qpz2PuTHj0qwxvCs2zdfwhiSEjTLfrNTKKHdBRv8FMyWc/JNrMzN
 xtE1I5SUughy/KUqRgD1SpdYFk4upb3vSXNWw+Lr/LG4Byg4kke6AsKVQT9GaxnyAJb1
 /TEQ==
X-Gm-Message-State: AOAM532kD+bGjwRhrALHzfKg7sEkUmiDB/soEZxJfAtHwv1oBCQAetIl
 Px11WDYNj4X+UVdXg8vVqPpl4PaRBttv3E6E
X-Google-Smtp-Source: ABdhPJzfpNLT72v1CjaUU870e9bAN7x8QTC/HjaUr+sBNn6kG7ma8/ikOd+70FWhWk8hFLWt9mHv4w==
X-Received: by 2002:a05:6830:4109:: with SMTP id
 w9mr24786851ott.176.1615305193475; 
 Tue, 09 Mar 2021 07:53:13 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id b14sm2952539ooj.26.2021.03.09.07.53.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Mar 2021 07:53:13 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 5/8] target/arm: Update BRKA, BRKB, BRKN for PREDDESC
Date: Tue,  9 Mar 2021 07:53:02 -0800
Message-Id: <20210309155305.11301-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210309155305.11301-1-richard.henderson@linaro.org>
References: <20210309155305.11301-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32b;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32b.google.com
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since b64ee454a4a0, all predicate operations should be
using these field macros for predicates.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/sve_helper.c    | 30 ++++++++++++++----------------
 target/arm/translate-sve.c |  4 ++--
 2 files changed, 16 insertions(+), 18 deletions(-)

diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 224c767944..8e0a5d30a5 100644
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
index cac8082156..c0212e6b08 100644
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
2.25.1


