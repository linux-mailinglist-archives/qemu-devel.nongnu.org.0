Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FA8C3906EC
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 18:51:54 +0200 (CEST)
Received: from localhost ([::1]:38140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llaHX-0008RS-80
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 12:51:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1llYes-0002ab-G5
 for qemu-devel@nongnu.org; Tue, 25 May 2021 11:07:50 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:42663)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1llYeo-00073Q-LB
 for qemu-devel@nongnu.org; Tue, 25 May 2021 11:07:50 -0400
Received: by mail-wr1-x42c.google.com with SMTP id x8so32616461wrq.9
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 08:07:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=HITj41Xhi9005VQKFXr4l5LvYkIOgVesUXHbEPZOruI=;
 b=DHSzFEKvFPxVGysFZrnXsDsU6xd1wAGPdh3dkSp9twEDYpzFBka5q2OJ6T0M+Efdv1
 SqEpEv9hw/g51dHRaK9Gdtm9YMH3x4vIxeASqH8zjwn5UjyaLotgRPK6O4p/CNnh2B6T
 C7dwAVytJ9EUQ0bDksheoHqCNLEJqrf9EqhtnLalkY4GOS7XgE88bW9RHQSEMHAEiTMe
 RE6FGl3VTpZ8bPsmeHg3YoaYzMa+Md+aTQKaRtRzIT4HBhEgfhETuwlY8DTMFC1l7a8H
 3XRHG/4TWFGJF/RrO+DaAEniDUhFyUIC42bUzpxOYb8DJd3EHYuiSB5Et0ahUxY7PsbT
 Xi1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HITj41Xhi9005VQKFXr4l5LvYkIOgVesUXHbEPZOruI=;
 b=PV93F+0AddhtmtQ9J64/qYlMRBzNvn4hwVzJmTQifxIHQtbOD8dsZie9ysqSmEk4yt
 afW8pxdhHtsFnr9wMVvMIA6sEzURapGUaUW+5ctMZBMQuissKMrGHTRxk2d2TKmi3GkL
 nPUty/uqmNVer8F5mlcG9RYrXkcsog57ZqCjME8izLsXXiHxold4gQdfbkXU9dZ2KjhY
 V/k3JGGYFPKHJ2XYdXN/NkjSbMKxBm6SyKIf3C+iDPF8Ivnczqjuehr9WRMEyCjlwRq5
 KaV7KpETT+A1l0ZNqygZtIKtLpUb8SE9syzHmmQyRz1zZXxj5K//Ug8LsXXI1e8AMseq
 1Ogw==
X-Gm-Message-State: AOAM533nF+pXKCw8BTEl+yYt4gBaKNKHud/juQsJ0iAzFd08MzZZIAIq
 mGABj7Q+Cn6Y8EqmRgrRgcxgu9lZ0cYO8Y0b
X-Google-Smtp-Source: ABdhPJxfnlMBp0OeDzTS1TNSVMmupumdHJ4wEg17WjMPUEjv/2o+cEZyt73uUkuFmNY10hmZZE/i9Q==
X-Received: by 2002:a5d:568c:: with SMTP id f12mr29062223wrv.382.1621955265227; 
 Tue, 25 May 2021 08:07:45 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id a11sm16643357wrr.48.2021.05.25.08.07.44
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 08:07:44 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 101/114] target/arm: Implement 128-bit ZIP, UZP, TRN
Date: Tue, 25 May 2021 16:07:23 +0100
Message-Id: <20210525150736.32695-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210525150736.32695-1-peter.maydell@linaro.org>
References: <20210525150736.32695-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42c.google.com
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
Message-id: 20210525010358.152808-80-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper-sve.h    |  3 ++
 target/arm/sve.decode      |  8 ++++++
 target/arm/sve_helper.c    | 29 +++++++++++++------
 target/arm/translate-sve.c | 58 ++++++++++++++++++++++++++++++++++++++
 4 files changed, 90 insertions(+), 8 deletions(-)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index 342bb837214..b43ffce23ac 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -689,16 +689,19 @@ DEF_HELPER_FLAGS_4(sve_zip_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(sve_zip_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(sve_zip_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(sve_zip_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_zip_q, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 
 DEF_HELPER_FLAGS_4(sve_uzp_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(sve_uzp_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(sve_uzp_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(sve_uzp_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_uzp_q, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 
 DEF_HELPER_FLAGS_4(sve_trn_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(sve_trn_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(sve_trn_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(sve_trn_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_trn_q, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 
 DEF_HELPER_FLAGS_4(sve_compact_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(sve_compact_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 884c5358eb1..5469ce04143 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -590,6 +590,14 @@ UZP2_z          00000101 .. 1 ..... 011 011 ..... .....         @rd_rn_rm
 TRN1_z          00000101 .. 1 ..... 011 100 ..... .....         @rd_rn_rm
 TRN2_z          00000101 .. 1 ..... 011 101 ..... .....         @rd_rn_rm
 
+# SVE2 permute vector segments
+ZIP1_q          00000101 10 1 ..... 000 000 ..... .....         @rd_rn_rm_e0
+ZIP2_q          00000101 10 1 ..... 000 001 ..... .....         @rd_rn_rm_e0
+UZP1_q          00000101 10 1 ..... 000 010 ..... .....         @rd_rn_rm_e0
+UZP2_q          00000101 10 1 ..... 000 011 ..... .....         @rd_rn_rm_e0
+TRN1_q          00000101 10 1 ..... 000 110 ..... .....         @rd_rn_rm_e0
+TRN2_q          00000101 10 1 ..... 000 111 ..... .....         @rd_rn_rm_e0
+
 ### SVE Permute - Predicated Group
 
 # SVE compress active elements
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index a0518549849..d088b1f74ce 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -3492,36 +3492,45 @@ void HELPER(NAME)(void *vd, void *vn, void *vm, uint32_t desc)       \
         *(TYPE *)(vd + H(2 * i + 0)) = *(TYPE *)(vn + H(i));         \
         *(TYPE *)(vd + H(2 * i + sizeof(TYPE))) = *(TYPE *)(vm + H(i)); \
     }                                                                \
+    if (sizeof(TYPE) == 16 && unlikely(oprsz & 16)) {                \
+        memset(vd + oprsz - 16, 0, 16);                              \
+    }                                                                \
 }
 
 DO_ZIP(sve_zip_b, uint8_t, H1)
 DO_ZIP(sve_zip_h, uint16_t, H1_2)
 DO_ZIP(sve_zip_s, uint32_t, H1_4)
 DO_ZIP(sve_zip_d, uint64_t, )
+DO_ZIP(sve2_zip_q, Int128, )
 
 #define DO_UZP(NAME, TYPE, H) \
 void HELPER(NAME)(void *vd, void *vn, void *vm, uint32_t desc)         \
 {                                                                      \
     intptr_t oprsz = simd_oprsz(desc);                                 \
-    intptr_t oprsz_2 = oprsz / 2;                                      \
     intptr_t odd_ofs = simd_data(desc);                                \
-    intptr_t i;                                                        \
+    intptr_t i, p;                                                     \
     ARMVectorReg tmp_m;                                                \
     if (unlikely((vm - vd) < (uintptr_t)oprsz)) {                      \
         vm = memcpy(&tmp_m, vm, oprsz);                                \
     }                                                                  \
-    for (i = 0; i < oprsz_2; i += sizeof(TYPE)) {                      \
-        *(TYPE *)(vd + H(i)) = *(TYPE *)(vn + H(2 * i + odd_ofs));     \
-    }                                                                  \
-    for (i = 0; i < oprsz_2; i += sizeof(TYPE)) {                      \
-        *(TYPE *)(vd + H(oprsz_2 + i)) = *(TYPE *)(vm + H(2 * i + odd_ofs)); \
-    }                                                                  \
+    i = 0, p = odd_ofs;                                                \
+    do {                                                               \
+        *(TYPE *)(vd + H(i)) = *(TYPE *)(vn + H(p));                   \
+        i += sizeof(TYPE), p += 2 * sizeof(TYPE);                      \
+    } while (p < oprsz);                                               \
+    p -= oprsz;                                                        \
+    do {                                                               \
+        *(TYPE *)(vd + H(i)) = *(TYPE *)(vm + H(p));                   \
+        i += sizeof(TYPE), p += 2 * sizeof(TYPE);                      \
+    } while (p < oprsz);                                               \
+    tcg_debug_assert(i == oprsz);                                      \
 }
 
 DO_UZP(sve_uzp_b, uint8_t, H1)
 DO_UZP(sve_uzp_h, uint16_t, H1_2)
 DO_UZP(sve_uzp_s, uint32_t, H1_4)
 DO_UZP(sve_uzp_d, uint64_t, )
+DO_UZP(sve2_uzp_q, Int128, )
 
 #define DO_TRN(NAME, TYPE, H) \
 void HELPER(NAME)(void *vd, void *vn, void *vm, uint32_t desc)         \
@@ -3535,12 +3544,16 @@ void HELPER(NAME)(void *vd, void *vn, void *vm, uint32_t desc)         \
         *(TYPE *)(vd + H(i + 0)) = ae;                                 \
         *(TYPE *)(vd + H(i + sizeof(TYPE))) = be;                      \
     }                                                                  \
+    if (sizeof(TYPE) == 16 && unlikely(oprsz & 16)) {                  \
+        memset(vd + oprsz - 16, 0, 16);                                \
+    }                                                                  \
 }
 
 DO_TRN(sve_trn_b, uint8_t, H1)
 DO_TRN(sve_trn_h, uint16_t, H1_2)
 DO_TRN(sve_trn_s, uint32_t, H1_4)
 DO_TRN(sve_trn_d, uint64_t, )
+DO_TRN(sve2_trn_q, Int128, )
 
 #undef DO_ZIP
 #undef DO_UZP
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 1dcdbac0af0..b2aa9130b64 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -2624,6 +2624,32 @@ static bool trans_ZIP2_z(DisasContext *s, arg_rrr_esz *a)
     return do_zip(s, a, true);
 }
 
+static bool do_zip_q(DisasContext *s, arg_rrr_esz *a, bool high)
+{
+    if (!dc_isar_feature(aa64_sve_f64mm, s)) {
+        return false;
+    }
+    if (sve_access_check(s)) {
+        unsigned vsz = vec_full_reg_size(s);
+        unsigned high_ofs = high ? QEMU_ALIGN_DOWN(vsz, 32) / 2 : 0;
+        tcg_gen_gvec_3_ool(vec_full_reg_offset(s, a->rd),
+                           vec_full_reg_offset(s, a->rn) + high_ofs,
+                           vec_full_reg_offset(s, a->rm) + high_ofs,
+                           vsz, vsz, 0, gen_helper_sve2_zip_q);
+    }
+    return true;
+}
+
+static bool trans_ZIP1_q(DisasContext *s, arg_rrr_esz *a)
+{
+    return do_zip_q(s, a, false);
+}
+
+static bool trans_ZIP2_q(DisasContext *s, arg_rrr_esz *a)
+{
+    return do_zip_q(s, a, true);
+}
+
 static gen_helper_gvec_3 * const uzp_fns[4] = {
     gen_helper_sve_uzp_b, gen_helper_sve_uzp_h,
     gen_helper_sve_uzp_s, gen_helper_sve_uzp_d,
@@ -2639,6 +2665,22 @@ static bool trans_UZP2_z(DisasContext *s, arg_rrr_esz *a)
     return do_zzz_data_ool(s, a, 1 << a->esz, uzp_fns[a->esz]);
 }
 
+static bool trans_UZP1_q(DisasContext *s, arg_rrr_esz *a)
+{
+    if (!dc_isar_feature(aa64_sve_f64mm, s)) {
+        return false;
+    }
+    return do_zzz_data_ool(s, a, 0, gen_helper_sve2_uzp_q);
+}
+
+static bool trans_UZP2_q(DisasContext *s, arg_rrr_esz *a)
+{
+    if (!dc_isar_feature(aa64_sve_f64mm, s)) {
+        return false;
+    }
+    return do_zzz_data_ool(s, a, 16, gen_helper_sve2_uzp_q);
+}
+
 static gen_helper_gvec_3 * const trn_fns[4] = {
     gen_helper_sve_trn_b, gen_helper_sve_trn_h,
     gen_helper_sve_trn_s, gen_helper_sve_trn_d,
@@ -2654,6 +2696,22 @@ static bool trans_TRN2_z(DisasContext *s, arg_rrr_esz *a)
     return do_zzz_data_ool(s, a, 1 << a->esz, trn_fns[a->esz]);
 }
 
+static bool trans_TRN1_q(DisasContext *s, arg_rrr_esz *a)
+{
+    if (!dc_isar_feature(aa64_sve_f64mm, s)) {
+        return false;
+    }
+    return do_zzz_data_ool(s, a, 0, gen_helper_sve2_trn_q);
+}
+
+static bool trans_TRN2_q(DisasContext *s, arg_rrr_esz *a)
+{
+    if (!dc_isar_feature(aa64_sve_f64mm, s)) {
+        return false;
+    }
+    return do_zzz_data_ool(s, a, 16, gen_helper_sve2_trn_q);
+}
+
 /*
  *** SVE Permute Vector - Predicated Group
  */
-- 
2.20.1


