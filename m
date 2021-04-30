Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4DB73702B3
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 23:11:14 +0200 (CEST)
Received: from localhost ([::1]:41326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcaPp-0003Ox-Qq
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 17:11:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcZmE-0004Ib-Iu
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 16:30:18 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:37860)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcZlm-0007k9-2Y
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 16:30:18 -0400
Received: by mail-pf1-x435.google.com with SMTP id b15so5014176pfl.4
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 13:29:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=76u00K3o67SzMGIaSyMgoPwtbQjy3qcI0996M+o1XzQ=;
 b=tByRmDz+5Bu0YH2BsAYc/OtZL/mwa1fr1q/sZ2V0ZaIZ5Hb2bNbSRdFNnrJTtgRY8P
 RweS9E46umLV9tzVdCqxoH7g8H7yhOdQnUXU/pfc98u00IAzlNafys5q6+isBHpo5yuW
 Hh+NA7qJbNA9YgkrzoaJix0vToKk0PpuI0c7IGxJ8fcgyOq8cfABF5VfyFLCJyRWNPaE
 AfLK9vJxlW7S0hDbY3nUiYENjQRSSQdxivLKbGo4SbUWaHrv8yp1+jHGnLIVmPcmR8bT
 S2zymvLMx7sUchPog36aAV2V9vga+Utj3lJtvdJCCG1QDoGmRnb2XzZXP8e8s8VBd9aj
 bW2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=76u00K3o67SzMGIaSyMgoPwtbQjy3qcI0996M+o1XzQ=;
 b=ZbaOeTT9Dkic4vhhavA47fVFEtYIag+SKijqPSrpib+KznOVUwLRHo2tHFZh4M5hXF
 gHQY8KhyLfWslnx1g1fBW251kMkjY3D8eWv0Y9FES4Vwu4lkUjcbu4YZqmY1CeYxBRPe
 4z4Z62Hkgp6KlLrXqXQYcI0wEKwIi7DxDXLbaeqtTTZs0BMLn4fFuR3IkRrLU3fvrVhW
 v9YzYdNs0lenKyKHbmVBX9mrgn6L7DRsc8DtcdAweXoOGSL7kRqX19p2CP/R/XziOgD/
 tbFN7K2K8Gs7GdYhch18+n1Oi+/q/E1Sorn0bHWqMX4bT11GcgIYatXrFwc6MmdD7FnN
 +JMQ==
X-Gm-Message-State: AOAM530Sm/FK1aFV1Walc2U+Hwvd6qFVP0zfsydkIXkCHR3lt4Gzd7h7
 S2icV/0nwddLHW8n+MALMa2c70JzXQSbKw==
X-Google-Smtp-Source: ABdhPJyWsUwSJKtMn+P1nhQb+gLRcJfqErbVp5nPM6bmFqo4Z6gIcuct47ke876HAywsHOPXh/oE0w==
X-Received: by 2002:a05:6a00:138f:b029:272:931d:23bd with SMTP id
 t15-20020a056a00138fb0290272931d23bdmr6649284pfg.40.1619814587619; 
 Fri, 30 Apr 2021 13:29:47 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id q23sm3788781pgt.42.2021.04.30.13.29.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Apr 2021 13:29:47 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 58/82] target/arm: Implement SVE2 saturating multiply high
 (indexed)
Date: Fri, 30 Apr 2021 13:25:46 -0700
Message-Id: <20210430202610.1136687-59-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210430202610.1136687-1-richard.henderson@linaro.org>
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.h        | 14 ++++++
 target/arm/sve.decode      |  8 ++++
 target/arm/translate-sve.c |  8 ++++
 target/arm/vec_helper.c    | 88 ++++++++++++++++++++++++++++++++++++++
 4 files changed, 118 insertions(+)

diff --git a/target/arm/helper.h b/target/arm/helper.h
index eb94b6b1e6..e7c463fff5 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -967,6 +967,20 @@ DEF_HELPER_FLAGS_4(sve2_sqrdmulh_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(sve2_sqrdmulh_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(sve2_sqrdmulh_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 
+DEF_HELPER_FLAGS_4(sve2_sqdmulh_idx_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_sqdmulh_idx_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_sqdmulh_idx_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(sve2_sqrdmulh_idx_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_sqrdmulh_idx_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_sqrdmulh_idx_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, i32)
+
 DEF_HELPER_FLAGS_4(gvec_xar_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 
 #ifdef TARGET_AARCH64
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 407d3019d1..35010d755f 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -829,6 +829,14 @@ SQDMULLB_zzx_d  01000100 11 1 ..... 1110.0 ..... .....   @rrx_2a esz=3
 SQDMULLT_zzx_s  01000100 10 1 ..... 1110.1 ..... .....   @rrx_3a esz=2
 SQDMULLT_zzx_d  01000100 11 1 ..... 1110.1 ..... .....   @rrx_2a esz=3
 
+# SVE2 saturating multiply high (indexed)
+SQDMULH_zzx_h   01000100 0. 1 ..... 111100 ..... .....   @rrx_3 esz=1
+SQDMULH_zzx_s   01000100 10 1 ..... 111100 ..... .....   @rrx_2 esz=2
+SQDMULH_zzx_d   01000100 11 1 ..... 111100 ..... .....   @rrx_1 esz=3
+SQRDMULH_zzx_h  01000100 0. 1 ..... 111101 ..... .....   @rrx_3 esz=1
+SQRDMULH_zzx_s  01000100 10 1 ..... 111101 ..... .....   @rrx_2 esz=2
+SQRDMULH_zzx_d  01000100 11 1 ..... 111101 ..... .....   @rrx_1 esz=3
+
 # SVE2 integer multiply (indexed)
 MUL_zzx_h       01000100 0. 1 ..... 111110 ..... .....   @rrx_3 esz=1
 MUL_zzx_s       01000100 10 1 ..... 111110 ..... .....   @rrx_2 esz=2
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index e32094dcdb..c72d1e4bf0 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -3864,6 +3864,14 @@ DO_SVE2_RRX(trans_MUL_zzx_h, gen_helper_gvec_mul_idx_h)
 DO_SVE2_RRX(trans_MUL_zzx_s, gen_helper_gvec_mul_idx_s)
 DO_SVE2_RRX(trans_MUL_zzx_d, gen_helper_gvec_mul_idx_d)
 
+DO_SVE2_RRX(trans_SQDMULH_zzx_h, gen_helper_sve2_sqdmulh_idx_h)
+DO_SVE2_RRX(trans_SQDMULH_zzx_s, gen_helper_sve2_sqdmulh_idx_s)
+DO_SVE2_RRX(trans_SQDMULH_zzx_d, gen_helper_sve2_sqdmulh_idx_d)
+
+DO_SVE2_RRX(trans_SQRDMULH_zzx_h, gen_helper_sve2_sqrdmulh_idx_h)
+DO_SVE2_RRX(trans_SQRDMULH_zzx_s, gen_helper_sve2_sqrdmulh_idx_s)
+DO_SVE2_RRX(trans_SQRDMULH_zzx_d, gen_helper_sve2_sqrdmulh_idx_d)
+
 #undef DO_SVE2_RRX
 
 #define DO_SVE2_RRX_TB(NAME, FUNC, TOP) \
diff --git a/target/arm/vec_helper.c b/target/arm/vec_helper.c
index 25061c15e1..8b7269d8e1 100644
--- a/target/arm/vec_helper.c
+++ b/target/arm/vec_helper.c
@@ -240,6 +240,36 @@ void HELPER(sve2_sqrdmulh_h)(void *vd, void *vn, void *vm, uint32_t desc)
     }
 }
 
+void HELPER(sve2_sqdmulh_idx_h)(void *vd, void *vn, void *vm, uint32_t desc)
+{
+    intptr_t i, j, opr_sz = simd_oprsz(desc);
+    int idx = simd_data(desc);
+    int16_t *d = vd, *n = vn, *m = (int16_t *)vm + H2(idx);
+    uint32_t discard;
+
+    for (i = 0; i < opr_sz / 2; i += 16 / 2) {
+        int16_t mm = m[i];
+        for (j = 0; j < 16 / 2; ++j) {
+            d[i + j] = do_sqrdmlah_h(n[i + j], mm, 0, false, false, &discard);
+        }
+    }
+}
+
+void HELPER(sve2_sqrdmulh_idx_h)(void *vd, void *vn, void *vm, uint32_t desc)
+{
+    intptr_t i, j, opr_sz = simd_oprsz(desc);
+    int idx = simd_data(desc);
+    int16_t *d = vd, *n = vn, *m = (int16_t *)vm + H2(idx);
+    uint32_t discard;
+
+    for (i = 0; i < opr_sz / 2; i += 16 / 2) {
+        int16_t mm = m[i];
+        for (j = 0; j < 16 / 2; ++j) {
+            d[i + j] = do_sqrdmlah_h(n[i + j], mm, 0, false, true, &discard);
+        }
+    }
+}
+
 /* Signed saturating rounding doubling multiply-accumulate high half, 32-bit */
 int32_t do_sqrdmlah_s(int32_t src1, int32_t src2, int32_t src3,
                       bool neg, bool round, uint32_t *sat)
@@ -373,6 +403,36 @@ void HELPER(sve2_sqrdmulh_s)(void *vd, void *vn, void *vm, uint32_t desc)
     }
 }
 
+void HELPER(sve2_sqdmulh_idx_s)(void *vd, void *vn, void *vm, uint32_t desc)
+{
+    intptr_t i, j, opr_sz = simd_oprsz(desc);
+    int idx = simd_data(desc);
+    int32_t *d = vd, *n = vn, *m = (int32_t *)vm + H4(idx);
+    uint32_t discard;
+
+    for (i = 0; i < opr_sz / 4; i += 16 / 4) {
+        int32_t mm = m[i];
+        for (j = 0; j < 16 / 4; ++j) {
+            d[i + j] = do_sqrdmlah_s(n[i + j], mm, 0, false, false, &discard);
+        }
+    }
+}
+
+void HELPER(sve2_sqrdmulh_idx_s)(void *vd, void *vn, void *vm, uint32_t desc)
+{
+    intptr_t i, j, opr_sz = simd_oprsz(desc);
+    int idx = simd_data(desc);
+    int32_t *d = vd, *n = vn, *m = (int32_t *)vm + H4(idx);
+    uint32_t discard;
+
+    for (i = 0; i < opr_sz / 4; i += 16 / 4) {
+        int32_t mm = m[i];
+        for (j = 0; j < 16 / 4; ++j) {
+            d[i + j] = do_sqrdmlah_s(n[i + j], mm, 0, false, true, &discard);
+        }
+    }
+}
+
 /* Signed saturating rounding doubling multiply-accumulate high half, 64-bit */
 static int64_t do_sat128_d(Int128 r)
 {
@@ -452,6 +512,34 @@ void HELPER(sve2_sqrdmulh_d)(void *vd, void *vn, void *vm, uint32_t desc)
     }
 }
 
+void HELPER(sve2_sqdmulh_idx_d)(void *vd, void *vn, void *vm, uint32_t desc)
+{
+    intptr_t i, j, opr_sz = simd_oprsz(desc);
+    int idx = simd_data(desc);
+    int64_t *d = vd, *n = vn, *m = (int64_t *)vm + idx;
+
+    for (i = 0; i < opr_sz / 8; i += 16 / 8) {
+        int64_t mm = m[i];
+        for (j = 0; j < 16 / 8; ++j) {
+            d[i + j] = do_sqrdmlah_d(n[i + j], mm, 0, false, false);
+        }
+    }
+}
+
+void HELPER(sve2_sqrdmulh_idx_d)(void *vd, void *vn, void *vm, uint32_t desc)
+{
+    intptr_t i, j, opr_sz = simd_oprsz(desc);
+    int idx = simd_data(desc);
+    int64_t *d = vd, *n = vn, *m = (int64_t *)vm + idx;
+
+    for (i = 0; i < opr_sz / 8; i += 16 / 8) {
+        int64_t mm = m[i];
+        for (j = 0; j < 16 / 8; ++j) {
+            d[i + j] = do_sqrdmlah_d(n[i + j], mm, 0, false, true);
+        }
+    }
+}
+
 /* Integer 8 and 16-bit dot-product.
  *
  * Note that for the loops herein, host endianness does not matter
-- 
2.25.1


