Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64793390629
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 18:05:35 +0200 (CEST)
Received: from localhost ([::1]:42982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llZYk-0005wQ-FN
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 12:05:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1llYby-0004MM-S9
 for qemu-devel@nongnu.org; Tue, 25 May 2021 11:04:50 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:37761)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1llYbr-0004pA-Qw
 for qemu-devel@nongnu.org; Tue, 25 May 2021 11:04:50 -0400
Received: by mail-wr1-x429.google.com with SMTP id q5so32591195wrs.4
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 08:04:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=3ZDKRTLg9UNU+Yj2j/vAZ+I+R8CLV+ecG7Ch4+DbKPg=;
 b=Q7GnHR16pZ2dPgIheouJHVzbeNTq1tt4T4h164Mpe6ooOAlfpW0RJUVaz0RXMJcGXI
 Pgyu6T02MRaDfitPBy+Rwut+I42vUCxI1UHTCZTk9IF6GkDy1L0NpXBtZ7nM+dZCSoxD
 tOmab8VOTDTpIP5YFXXwDcIklaEuSaJ0fAQetRms5alDNZrbcQSV74PazREref8XyuBS
 apsI2u5yw8HQGhSzp8JL2M3aoKukppIiC5wEsDSY4AbCduGPoB9MJWHlff3/3bX1POPF
 WGeNsvomjFwUhR9zvziHeGu3449aix3FmpAn2KUkMA4guYX4EqY/+iXGtMHYvGOJUKj2
 ZSYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3ZDKRTLg9UNU+Yj2j/vAZ+I+R8CLV+ecG7Ch4+DbKPg=;
 b=WlCmWHq+6J3YeRc13yVuBI9AEZVyEruIMO7kskCqnjIDuC6njEGQnCkPXokw3q5Svf
 Z9DvtDJaKwIMNuT0DNfsn9YyX9Hi36LjERpt6nI37sYlsnus61G2RmK+kQT6U4gslAey
 Sa509fUP5nQmK6OJI/TjfXrPvQsPLw1WkwGktSDoLFu6142tomhLOCtF1qZZMjUWcHt5
 5ERjbx0qHe8/qKkp0A0X3R1kCxFwZvfxWCrKWu3SVzFZymOylMDTUei7+531wRAHIzGN
 NzpcQVUiFQDmIFy6b/q0LGGn15MYECqtkTGKgpUsDU9rwO4vDxKqOa1GDQk8dgbp5HPO
 /gkA==
X-Gm-Message-State: AOAM530/kIbE9djxGlVRBmYMvwQGAW1y1SZQmGs9Kez3p2rQFCqHz9Zh
 xQNp8gOAE3/j5FxD0LxqTaSeiEGbcynDVpQ1
X-Google-Smtp-Source: ABdhPJxJX0QpBg2T8y3fVurq7vGtW/JQNWU3O2mlNNaOmTrFbf7GJIrtjzQArxeF6/+KGFRj5sIRzQ==
X-Received: by 2002:adf:e109:: with SMTP id t9mr2953212wrz.372.1621955082377; 
 Tue, 25 May 2021 08:04:42 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id q62sm11710284wma.42.2021.05.25.08.04.41
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 08:04:42 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 079/114] target/arm: Implement SVE2 saturating multiply
 (indexed)
Date: Tue, 25 May 2021 16:02:49 +0100
Message-Id: <20210525150324.32370-80-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210525150324.32370-1-peter.maydell@linaro.org>
References: <20210525150324.32370-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x429.google.com
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

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210525010358.152808-58-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper-sve.h    |  5 +++++
 target/arm/sve.decode      | 12 ++++++++++++
 target/arm/sve_helper.c    | 20 ++++++++++++++++++++
 target/arm/translate-sve.c | 14 ++++++++++++++
 4 files changed, 51 insertions(+)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index 08398800bd7..0be0d90bee7 100644
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
index 8d2709d3cc0..a3b9fb95f9c 100644
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
index b80bd15085b..3953e2f502a 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -1565,6 +1565,26 @@ DO_ZZXW(sve2_sqdmlsl_idx_d, int64_t, int32_t,     , H1_4, DO_SQDMLSL_D)
 
 #undef DO_ZZXW
 
+#define DO_ZZX(NAME, TYPEW, TYPEN, HW, HN, OP) \
+void HELPER(NAME)(void *vd, void *vn, void *vm, uint32_t desc)            \
+{                                                                         \
+    intptr_t i, j, oprsz = simd_oprsz(desc);                              \
+    intptr_t sel = extract32(desc, SIMD_DATA_SHIFT, 1) * sizeof(TYPEN);   \
+    intptr_t idx = extract32(desc, SIMD_DATA_SHIFT + 1, 3) * sizeof(TYPEN); \
+    for (i = 0; i < oprsz; i += 16) {                                     \
+        TYPEW mm = *(TYPEN *)(vm + HN(i + idx));                          \
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
index 3e7f310d595..c009ec54ff5 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -3866,6 +3866,20 @@ DO_SVE2_RRX(trans_MUL_zzx_d, gen_helper_gvec_mul_idx_d)
 
 #undef DO_SVE2_RRX
 
+#define DO_SVE2_RRX_TB(NAME, FUNC, TOP) \
+    static bool NAME(DisasContext *s, arg_rrx_esz *a)           \
+    {                                                           \
+        return do_sve2_zzz_data(s, a->rd, a->rn, a->rm,         \
+                                (a->index << 1) | TOP, FUNC);   \
+    }
+
+DO_SVE2_RRX_TB(trans_SQDMULLB_zzx_s, gen_helper_sve2_sqdmull_idx_s, false)
+DO_SVE2_RRX_TB(trans_SQDMULLB_zzx_d, gen_helper_sve2_sqdmull_idx_d, false)
+DO_SVE2_RRX_TB(trans_SQDMULLT_zzx_s, gen_helper_sve2_sqdmull_idx_s, true)
+DO_SVE2_RRX_TB(trans_SQDMULLT_zzx_d, gen_helper_sve2_sqdmull_idx_d, true)
+
+#undef DO_SVE2_RRX_TB
+
 static bool do_sve2_zzzz_data(DisasContext *s, int rd, int rn, int rm, int ra,
                               int data, gen_helper_gvec_4 *fn)
 {
-- 
2.20.1


