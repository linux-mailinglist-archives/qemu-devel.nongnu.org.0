Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA7A2362AC9
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Apr 2021 00:08:54 +0200 (CEST)
Received: from localhost ([::1]:38144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXWdx-0001mQ-Of
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 18:08:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXVdd-00061T-5a
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 17:04:29 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:45801)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXVdL-0001iS-VK
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 17:04:28 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 nm3-20020a17090b19c3b029014e1bbf6c60so11072990pjb.4
 for <qemu-devel@nongnu.org>; Fri, 16 Apr 2021 14:04:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jTQupde6YzsHjhMQLFeEGZDoiQ5cfoyX6mtthKyHZqc=;
 b=ayW5VLiKWrNIogZTem2WRZsLT9MIYvwUb+rb5jjYyrGJTEPjoLKNTBU0QQ8oXT9Dts
 P4L5XDB9S4rk7/SeIEDXStVHXUGYsBvedqwkBPb9MkbTp4aJoJe4mxJK8ihVIzY+ZtfJ
 HK+CLyWbUY5Cts59XPbRgzNfRpIk1If3qn69BcMw0RbVjbpI2/24QLK/PFWM6YTW+Jl0
 Ir78BfdaD9tNp1/ecUj7HoOIiH6hYCf8VwPapRst4wJeoooMhK5dCXgyrK4O9B2GuLdp
 HZ3M14+h4B+jIrgRuSlfKVTGZyL5c9LNPwoPUM9BHrnjkzJ1QhDKY7DIx7OatEvYFwY6
 F8GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jTQupde6YzsHjhMQLFeEGZDoiQ5cfoyX6mtthKyHZqc=;
 b=ZAe5Q6fx6npzD2yhDkL8qRxCbHZP4a5xTUAkl/PsQfdDTSIUN9wGAV3k5NvihdqWfJ
 KiQap+qeFjHuCO0ZEMKWFPaAigX1uc1YyGSjfkV9xkDch5Q3giwF1HW3F67CitXMHcHW
 CZpw15VJDwd14oPsq2hVcdcYM3b930S14duZwfQkB3KXTVe9i8vKaOs6UQYnKdmYW+5E
 WPuMVMjzHwAzVTDj8bZ/E0h9VvuQGvV/EPL3pvMxSc/g9OtMIQa7m4j2eG1ailBHCEGj
 YY3M5S5hUcpJeP5ap1bp9LqN+pmRmOphO0WKrSmOnDl2beEfONdcoIIhoeVzTNEd+HIb
 6ZxA==
X-Gm-Message-State: AOAM532NWe4u99UEgWZ+4Yy+pi9QNcqckkIAr4hctyZ44kfdh8qhowhS
 n+UWsrgumnNwY4+MLjkDZH9r/mx9qzQOLQ==
X-Google-Smtp-Source: ABdhPJwmV9WqPDyWEzcbo5AF7n3HbxuxfjwIQAF/94TQrM+vpqfYGEFw8AkdD4HGqTqH224fUN95sw==
X-Received: by 2002:a17:90a:fc92:: with SMTP id
 ci18mr11246698pjb.130.1618607046186; 
 Fri, 16 Apr 2021 14:04:06 -0700 (PDT)
Received: from localhost.localdomain ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id m9sm5766734pgt.65.2021.04.16.14.04.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 14:04:05 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 55/81] target/arm: Implement SVE2 saturating multiply-add
 (indexed)
Date: Fri, 16 Apr 2021 14:02:14 -0700
Message-Id: <20210416210240.1591291-56-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210416210240.1591291-1-richard.henderson@linaro.org>
References: <20210416210240.1591291-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-sve.h    |  9 +++++++++
 target/arm/sve.decode      | 18 ++++++++++++++++++
 target/arm/sve_helper.c    | 30 ++++++++++++++++++++++++++++++
 target/arm/translate-sve.c | 32 ++++++++++++++++++++++++--------
 4 files changed, 81 insertions(+), 8 deletions(-)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index fe67574741..08398800bd 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -2679,3 +2679,12 @@ DEF_HELPER_FLAGS_5(sve2_sqrdmlsh_idx_s, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(sve2_sqrdmlsh_idx_d, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_5(sve2_sqdmlal_idx_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_sqdmlal_idx_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_sqdmlsl_idx_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_sqdmlsl_idx_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 1956d96ad5..8d2709d3cc 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -30,6 +30,8 @@
 %size_23        23:2
 %dtype_23_13    23:2 13:2
 %index3_22_19   22:1 19:2
+%index3_19_11   19:2 11:1
+%index2_20_11   20:1 11:1
 
 # A combination of tsz:imm3 -- extract esize.
 %tszimm_esz     22:2 5:5 !function=tszimm_esz
@@ -261,6 +263,12 @@
 @rrxr_1         ........ .. . index:1 rm:4 ...... rn:5 rd:5 \
                 &rrxr_esz ra=%reg_movprfx
 
+# Three registers and a scalar by N-bit index, alternate
+@rrxr_3a        ........ .. ... rm:3 ...... rn:5 rd:5 \
+                &rrxr_esz ra=%reg_movprfx index=%index3_19_11
+@rrxr_2a        ........ .. ..  rm:4 ...... rn:5 rd:5 \
+                &rrxr_esz ra=%reg_movprfx index=%index2_20_11
+
 ###########################################################################
 # Instruction patterns.  Grouped according to the SVE encodingindex.xhtml.
 
@@ -799,6 +807,16 @@ SQRDMLSH_zzxz_h 01000100 0. 1 ..... 000101 ..... .....   @rrxr_3 esz=1
 SQRDMLSH_zzxz_s 01000100 10 1 ..... 000101 ..... .....   @rrxr_2 esz=2
 SQRDMLSH_zzxz_d 01000100 11 1 ..... 000101 ..... .....   @rrxr_1 esz=3
 
+# SVE2 saturating multiply-add (indexed)
+SQDMLALB_zzxw_s 01000100 10 1 ..... 0010.0 ..... .....   @rrxr_3a esz=2
+SQDMLALB_zzxw_d 01000100 11 1 ..... 0010.0 ..... .....   @rrxr_2a esz=3
+SQDMLALT_zzxw_s 01000100 10 1 ..... 0010.1 ..... .....   @rrxr_3a esz=2
+SQDMLALT_zzxw_d 01000100 11 1 ..... 0010.1 ..... .....   @rrxr_2a esz=3
+SQDMLSLB_zzxw_s 01000100 10 1 ..... 0011.0 ..... .....   @rrxr_3a esz=2
+SQDMLSLB_zzxw_d 01000100 11 1 ..... 0011.0 ..... .....   @rrxr_2a esz=3
+SQDMLSLT_zzxw_s 01000100 10 1 ..... 0011.1 ..... .....   @rrxr_3a esz=2
+SQDMLSLT_zzxw_d 01000100 11 1 ..... 0011.1 ..... .....   @rrxr_2a esz=3
+
 # SVE2 integer multiply (indexed)
 MUL_zzx_h       01000100 0. 1 ..... 111110 ..... .....   @rrx_3 esz=1
 MUL_zzx_s       01000100 10 1 ..... 111110 ..... .....   @rrx_2 esz=2
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index fc4a943029..c43c38044b 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -1530,6 +1530,36 @@ DO_ZZXZ(sve2_sqrdmlsh_idx_d, int64_t,   , DO_SQRDMLSH_D)
 
 #undef DO_ZZXZ
 
+#define DO_ZZXW(NAME, TYPEW, TYPEN, HW, HN, OP) \
+void HELPER(NAME)(void *vd, void *vn, void *vm, void *va, uint32_t desc)  \
+{                                                                         \
+    intptr_t i, j, oprsz = simd_oprsz(desc);                              \
+    intptr_t sel = extract32(desc, SIMD_DATA_SHIFT, 1) * sizeof(TYPEN);   \
+    intptr_t idx = extract32(desc, SIMD_DATA_SHIFT + 1, 3) * sizeof(TYPEN); \
+    for (i = 0; i < oprsz; i += 16) {                                     \
+        TYPEW mm = *(TYPEN *)(vm + i + idx);                              \
+        for (j = 0; j < 16; j += sizeof(TYPEW)) {                         \
+            TYPEW nn = *(TYPEN *)(vn + HN(i + j + sel));                  \
+            TYPEW aa = *(TYPEW *)(va + HW(i + j));                        \
+            *(TYPEW *)(vd + HW(i + j)) = OP(nn, mm, aa);                  \
+        }                                                                 \
+    }                                                                     \
+}
+
+#define DO_SQDMLAL_S(N, M, A)  DO_SQADD_S(A, do_sqdmull_s(N, M))
+#define DO_SQDMLAL_D(N, M, A)  do_sqadd_d(A, do_sqdmull_d(N, M))
+
+DO_ZZXW(sve2_sqdmlal_idx_s, int32_t, int16_t, H1_4, H1_2, DO_SQDMLAL_S)
+DO_ZZXW(sve2_sqdmlal_idx_d, int64_t, int32_t,     , H1_4, DO_SQDMLAL_D)
+
+#define DO_SQDMLSL_S(N, M, A)  DO_SQSUB_S(A, do_sqdmull_s(N, M))
+#define DO_SQDMLSL_D(N, M, A)  do_sqsub_d(A, do_sqdmull_d(N, M))
+
+DO_ZZXW(sve2_sqdmlsl_idx_s, int32_t, int16_t, H1_4, H1_2, DO_SQDMLSL_S)
+DO_ZZXW(sve2_sqdmlsl_idx_d, int64_t, int32_t,     , H1_4, DO_SQDMLSL_D)
+
+#undef DO_ZZXW
+
 #define DO_BITPERM(NAME, TYPE, OP) \
 void HELPER(NAME)(void *vd, void *vn, void *vm, uint32_t desc) \
 {                                                              \
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 42d8582707..4c304c0124 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -3817,21 +3817,21 @@ static bool trans_DOT_zzzz(DisasContext *s, arg_DOT_zzzz *a)
  * SVE Multiply - Indexed
  */
 
-static bool do_zzxz_ool(DisasContext *s, arg_rrxr_esz *a,
-                        gen_helper_gvec_4 *fn)
+static bool do_zzxz_data(DisasContext *s, arg_rrxr_esz *a,
+                         gen_helper_gvec_4 *fn, int data)
 {
     if (fn == NULL) {
         return false;
     }
     if (sve_access_check(s)) {
-        gen_gvec_ool_zzzz(s, fn, a->rd, a->rn, a->rm, a->ra, a->index);
+        gen_gvec_ool_zzzz(s, fn, a->rd, a->rn, a->rm, a->ra, data);
     }
     return true;
 }
 
 #define DO_RRXR(NAME, FUNC) \
     static bool NAME(DisasContext *s, arg_rrxr_esz *a)  \
-    { return do_zzxz_ool(s, a, FUNC); }
+    { return do_zzxz_data(s, a, FUNC, a->index); }
 
 DO_RRXR(trans_SDOT_zzxw_s, gen_helper_gvec_sdot_idx_b)
 DO_RRXR(trans_SDOT_zzxw_d, gen_helper_gvec_sdot_idx_h)
@@ -3866,18 +3866,18 @@ DO_SVE2_RRX(trans_MUL_zzx_d, gen_helper_gvec_mul_idx_d)
 
 #undef DO_SVE2_RRX
 
-static bool do_sve2_zzxz_ool(DisasContext *s, arg_rrxr_esz *a,
-                             gen_helper_gvec_4 *fn)
+static bool do_sve2_zzxz_data(DisasContext *s, arg_rrxr_esz *a,
+                              gen_helper_gvec_4 *fn, int data)
 {
     if (!dc_isar_feature(aa64_sve2, s)) {
         return false;
     }
-    return do_zzxz_ool(s, a, fn);
+    return do_zzxz_data(s, a, fn, data);
 }
 
 #define DO_SVE2_RRXR(NAME, FUNC) \
     static bool NAME(DisasContext *s, arg_rrxr_esz *a)  \
-    { return do_sve2_zzxz_ool(s, a, FUNC); }
+    { return do_sve2_zzxz_data(s, a, FUNC, a->index); }
 
 DO_SVE2_RRXR(trans_MLA_zzxz_h, gen_helper_gvec_mla_idx_h)
 DO_SVE2_RRXR(trans_MLA_zzxz_s, gen_helper_gvec_mla_idx_s)
@@ -3897,6 +3897,22 @@ DO_SVE2_RRXR(trans_SQRDMLSH_zzxz_d, gen_helper_sve2_sqrdmlsh_idx_d)
 
 #undef DO_SVE2_RRXR
 
+#define DO_SVE2_RRXR_TB(NAME, FUNC, TOP) \
+    static bool NAME(DisasContext *s, arg_rrxr_esz *a)  \
+    { return do_sve2_zzxz_data(s, a, FUNC, (a->index << 1) | TOP); }
+
+DO_SVE2_RRXR_TB(trans_SQDMLALB_zzxw_s, gen_helper_sve2_sqdmlal_idx_s, false)
+DO_SVE2_RRXR_TB(trans_SQDMLALB_zzxw_d, gen_helper_sve2_sqdmlal_idx_d, false)
+DO_SVE2_RRXR_TB(trans_SQDMLALT_zzxw_s, gen_helper_sve2_sqdmlal_idx_s, true)
+DO_SVE2_RRXR_TB(trans_SQDMLALT_zzxw_d, gen_helper_sve2_sqdmlal_idx_d, true)
+
+DO_SVE2_RRXR_TB(trans_SQDMLSLB_zzxw_s, gen_helper_sve2_sqdmlsl_idx_s, false)
+DO_SVE2_RRXR_TB(trans_SQDMLSLB_zzxw_d, gen_helper_sve2_sqdmlsl_idx_d, false)
+DO_SVE2_RRXR_TB(trans_SQDMLSLT_zzxw_s, gen_helper_sve2_sqdmlsl_idx_s, true)
+DO_SVE2_RRXR_TB(trans_SQDMLSLT_zzxw_d, gen_helper_sve2_sqdmlsl_idx_d, true)
+
+#undef DO_SVE2_RRXR_TB
+
 /*
  *** SVE Floating Point Multiply-Add Indexed Group
  */
-- 
2.25.1


