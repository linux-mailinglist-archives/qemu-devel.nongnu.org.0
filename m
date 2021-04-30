Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E1483702EF
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 23:23:59 +0200 (CEST)
Received: from localhost ([::1]:48908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcacA-0001ZR-CX
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 17:23:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcZmN-0004YM-Dk
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 16:30:27 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:40777)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcZlm-0007jm-Al
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 16:30:27 -0400
Received: by mail-pl1-x62f.google.com with SMTP id 20so33287782pll.7
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 13:29:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1gr+w+D07DwVhmgy58KbkyZwXkW20B50hh9NUpReRmk=;
 b=AFO/XDJ/e7gTveRun3YiV10LF5JCucqDYRTyWNqdAJgyHMGFp2g6HKrkfWcKA9iUA8
 oU6SHUpFsrRoeWd7gCOUPpXpv3Qxcb0wqkOju7F8KTJWbYCCy/AAwSCnc1XUCriIWnhB
 UA+3fwe9JnjCvrnkIWQyvHt/HBITnHWhFVJNQZjONHEFcN2vBnUoxf/rNiIUBpCJBm5c
 /i6fIYj9XcHB8GLNxbFYeiyXivFt7II0+acugPN+wF58MUnjK6v6TsOAnXuuPNPqyvNr
 xUFIYesrHFvEeWUmZttw/pmv6fKqQOa/4oek+4RgXNaehqad1eoHVuJmkywn5UeypVNI
 Uq2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1gr+w+D07DwVhmgy58KbkyZwXkW20B50hh9NUpReRmk=;
 b=llnNqmWzHEYRMxuLg1ztwP+zu8+wkvHXUPKtEjggNM2A/mUaut2Fu9KFRgpiN+81vT
 aPimC2o/hMc4D6/dAK/P7hKpDPMQnxpDnqeJ9vXVt7NhsX51PLl6FEwSh+5QX93E2SmP
 dyb9K4XxutlhWjv8fMlVEb6zlRXV5cVUgJSs/HcTyLY+TE6OTkP0/fvDUnjaksUNnDdj
 kDI9x4oR/WFhIF2Y+Q9msfXC2P8x1fOjNQUUbD5dnht1eHdJuEUXH7UyYREV7lGXHKYB
 w/fcR5dGl4vPPVT3ymAViQMCgVwmWSYTcb1B8uWn0kuzkp4vNvV9rnv8uH9eAtmYUo74
 Zp/g==
X-Gm-Message-State: AOAM531TW5wofVVe17ylYrAB2nc3CBrVDe740nAEKXHAn1rX0Nb618LV
 oRHCx+dIMFztjkBCoBpbQd0fkNNytqzpQQ==
X-Google-Smtp-Source: ABdhPJymQ7MknSQipHK0rX6pj3Y6k+A0lnxD19fk4C8thqH7teF/pygjWL9IRSmJsgUtUQnSSJ2QRQ==
X-Received: by 2002:a17:90a:4748:: with SMTP id
 y8mr6903832pjg.31.1619814585962; 
 Fri, 30 Apr 2021 13:29:45 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id q23sm3788781pgt.42.2021.04.30.13.29.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Apr 2021 13:29:45 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 56/82] target/arm: Implement SVE2 saturating multiply
 (indexed)
Date: Fri, 30 Apr 2021 13:25:44 -0700
Message-Id: <20210430202610.1136687-57-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210430202610.1136687-1-richard.henderson@linaro.org>
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
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
 target/arm/helper-sve.h    |  5 +++++
 target/arm/sve.decode      | 12 ++++++++++++
 target/arm/sve_helper.c    | 20 ++++++++++++++++++++
 target/arm/translate-sve.c | 19 +++++++++++++++----
 4 files changed, 52 insertions(+), 4 deletions(-)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index 08398800bd..0be0d90bee 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -2688,3 +2688,8 @@ DEF_HELPER_FLAGS_5(sve2_sqdmlsl_idx_s, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(sve2_sqdmlsl_idx_d, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(sve2_sqdmull_idx_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_sqdmull_idx_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, i32)
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 8d2709d3cc..a3b9fb95f9 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -255,6 +255,12 @@
 @rrx_2          ........ .. . index:2 rm:3 ...... rn:5 rd:5  &rrx_esz
 @rrx_1          ........ .. . index:1 rm:4 ...... rn:5 rd:5  &rrx_esz
 
+# Two registers and a scalar by N-bit index, alternate
+@rrx_3a         ........ .. . .. rm:3 ...... rn:5 rd:5 \
+                &rrx_esz index=%index3_19_11
+@rrx_2a         ........ .. . .  rm:4 ...... rn:5 rd:5 \
+                &rrx_esz index=%index2_20_11
+
 # Three registers and a scalar by N-bit index
 @rrxr_3         ........ .. . ..      rm:3 ...... rn:5 rd:5 \
                 &rrxr_esz ra=%reg_movprfx index=%index3_22_19
@@ -817,6 +823,12 @@ SQDMLSLB_zzxw_d 01000100 11 1 ..... 0011.0 ..... .....   @rrxr_2a esz=3
 SQDMLSLT_zzxw_s 01000100 10 1 ..... 0011.1 ..... .....   @rrxr_3a esz=2
 SQDMLSLT_zzxw_d 01000100 11 1 ..... 0011.1 ..... .....   @rrxr_2a esz=3
 
+# SVE2 saturating multiply (indexed)
+SQDMULLB_zzx_s  01000100 10 1 ..... 1110.0 ..... .....   @rrx_3a esz=2
+SQDMULLB_zzx_d  01000100 11 1 ..... 1110.0 ..... .....   @rrx_2a esz=3
+SQDMULLT_zzx_s  01000100 10 1 ..... 1110.1 ..... .....   @rrx_3a esz=2
+SQDMULLT_zzx_d  01000100 11 1 ..... 1110.1 ..... .....   @rrx_2a esz=3
+
 # SVE2 integer multiply (indexed)
 MUL_zzx_h       01000100 0. 1 ..... 111110 ..... .....   @rrx_3 esz=1
 MUL_zzx_s       01000100 10 1 ..... 111110 ..... .....   @rrx_2 esz=2
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index c43c38044b..e8a8425522 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -1560,6 +1560,26 @@ DO_ZZXW(sve2_sqdmlsl_idx_d, int64_t, int32_t,     , H1_4, DO_SQDMLSL_D)
 
 #undef DO_ZZXW
 
+#define DO_ZZX(NAME, TYPEW, TYPEN, HW, HN, OP) \
+void HELPER(NAME)(void *vd, void *vn, void *vm, uint32_t desc)            \
+{                                                                         \
+    intptr_t i, j, oprsz = simd_oprsz(desc);                              \
+    intptr_t sel = extract32(desc, SIMD_DATA_SHIFT, 1) * sizeof(TYPEN);   \
+    intptr_t idx = extract32(desc, SIMD_DATA_SHIFT + 1, 3) * sizeof(TYPEN); \
+    for (i = 0; i < oprsz; i += 16) {                                     \
+        TYPEW mm = *(TYPEN *)(vm + i + idx);                              \
+        for (j = 0; j < 16; j += sizeof(TYPEW)) {                         \
+            TYPEW nn = *(TYPEN *)(vn + HN(i + j + sel));                  \
+            *(TYPEW *)(vd + HW(i + j)) = OP(nn, mm);                      \
+        }                                                                 \
+    }                                                                     \
+}
+
+DO_ZZX(sve2_sqdmull_idx_s, int32_t, int16_t, H1_4, H1_2, do_sqdmull_s)
+DO_ZZX(sve2_sqdmull_idx_d, int64_t, int32_t,     , H1_4, do_sqdmull_d)
+
+#undef DO_ZZX
+
 #define DO_BITPERM(NAME, TYPE, OP) \
 void HELPER(NAME)(void *vd, void *vn, void *vm, uint32_t desc) \
 {                                                              \
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 1915f68af6..acf16c4c43 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -3840,8 +3840,8 @@ DO_RRXR(trans_UDOT_zzxw_d, gen_helper_gvec_udot_idx_h)
 
 #undef DO_RRXR
 
-static bool do_sve2_zzx_ool(DisasContext *s, arg_rrx_esz *a,
-                            gen_helper_gvec_3 *fn)
+static bool do_sve2_zzx_data(DisasContext *s, arg_rrx_esz *a,
+                             gen_helper_gvec_3 *fn, int data)
 {
     if (fn == NULL || !dc_isar_feature(aa64_sve2, s)) {
         return false;
@@ -3851,14 +3851,14 @@ static bool do_sve2_zzx_ool(DisasContext *s, arg_rrx_esz *a,
         tcg_gen_gvec_3_ool(vec_full_reg_offset(s, a->rd),
                            vec_full_reg_offset(s, a->rn),
                            vec_full_reg_offset(s, a->rm),
-                           vsz, vsz, a->index, fn);
+                           vsz, vsz, data, fn);
     }
     return true;
 }
 
 #define DO_SVE2_RRX(NAME, FUNC) \
     static bool NAME(DisasContext *s, arg_rrx_esz *a)  \
-    { return do_sve2_zzx_ool(s, a, FUNC); }
+    { return do_sve2_zzx_data(s, a, FUNC, a->index); }
 
 DO_SVE2_RRX(trans_MUL_zzx_h, gen_helper_gvec_mul_idx_h)
 DO_SVE2_RRX(trans_MUL_zzx_s, gen_helper_gvec_mul_idx_s)
@@ -3866,6 +3866,17 @@ DO_SVE2_RRX(trans_MUL_zzx_d, gen_helper_gvec_mul_idx_d)
 
 #undef DO_SVE2_RRX
 
+#define DO_SVE2_RRX_TB(NAME, FUNC, TOP) \
+    static bool NAME(DisasContext *s, arg_rrx_esz *a)  \
+    { return do_sve2_zzx_data(s, a, FUNC, (a->index << 1) | TOP); }
+
+DO_SVE2_RRX_TB(trans_SQDMULLB_zzx_s, gen_helper_sve2_sqdmull_idx_s, false)
+DO_SVE2_RRX_TB(trans_SQDMULLB_zzx_d, gen_helper_sve2_sqdmull_idx_d, false)
+DO_SVE2_RRX_TB(trans_SQDMULLT_zzx_s, gen_helper_sve2_sqdmull_idx_s, true)
+DO_SVE2_RRX_TB(trans_SQDMULLT_zzx_d, gen_helper_sve2_sqdmull_idx_d, true)
+
+#undef DO_SVE2_RRX_TB
+
 static bool do_sve2_zzxz_data(DisasContext *s, arg_rrxr_esz *a,
                               gen_helper_gvec_4 *fn, int data)
 {
-- 
2.25.1


