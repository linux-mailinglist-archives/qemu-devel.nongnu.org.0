Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B34EF38F7D7
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 04:03:41 +0200 (CEST)
Received: from localhost ([::1]:41230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llMQ0-0001JH-Nh
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 22:03:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llLYh-0001L9-N2
 for qemu-devel@nongnu.org; Mon, 24 May 2021 21:08:35 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:34552)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llLXx-0004Bo-Dy
 for qemu-devel@nongnu.org; Mon, 24 May 2021 21:08:35 -0400
Received: by mail-pl1-x634.google.com with SMTP id e15so8884489plh.1
 for <qemu-devel@nongnu.org>; Mon, 24 May 2021 18:07:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KozNqDqPcU6QFCditQjneab5f5CD8ouOg2dylxPkSf4=;
 b=mt3y12RUhpEig/B/zMvKMbIRDawgnWZZLbNhkXCHdo1cOg6qT/xjp0KC+rwkWki3P5
 Bla6EO+Hv/5GV0X4jj6tlHhsCRFucWYDqpUBgTpSUUAl+Luc8fsz+r+886Cl+lliUwPp
 PIzWNFEZVSPlUpgOt/wwVMNptOkjcYB8wfofAUyozL9zFe6nMQPqBQdZtFqAYaxMHBdG
 nFB/ewYqR0LKQ68e4i4ppNwYfuitVW4dUG7pHyimY6o5Zs0yPkB0wbZ7eA3mQQORo2iS
 QgoFz6WqPIkYIXcVmyrvDTYnIaKO9UPf+lyo2xphGSAdqOjaRuGYdcxfHDzKmZ+apbVL
 BExg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KozNqDqPcU6QFCditQjneab5f5CD8ouOg2dylxPkSf4=;
 b=dDwTWDL1HMG+zKUVhkaJ/BUECf/7G9CwPY40XlgJiSiN1P5XVZFazzQ57dkC8a71bg
 MmFAigaappoaZsTdRKPK9Wdh8f5nL+c3g/5hOGNzi+sX/63OFPb2khV4uP5/aRM6n3Lm
 VdDsFlO3T7XUPhljdOLDU4jPhd3n818dthORZJx6a+izOpXLUb0if+9vDpWrAWc0ATJN
 iuW4OqXKfGVbUOBAefoVtdBSgoyG8JXyTqNK/KfEukn4gWDOgEOCP+6RvR45hHKV0knb
 nrIDobxQTrtThPy7kuKvgneTRyyEXxExsO0TOVlOtde9cvX2bH1UoE3QOZSg/v4tPPHV
 JiyQ==
X-Gm-Message-State: AOAM533E31Mo+R0rCI19a8D2QKNgE3E+ff6IbaLn3gRWwmdq4L/TdZ5g
 gDJWphNQTHqNVW4pdy3GyIpaduV2oHi77w==
X-Google-Smtp-Source: ABdhPJzDZqIKAr+AkDTZTgrURGR2JnpKOGGwC97VwKuU6oxax36WD5qvv++uDKI3yYVUZSXBQsgDvA==
X-Received: by 2002:a17:90a:ab0c:: with SMTP id
 m12mr27668536pjq.179.1621904868062; 
 Mon, 24 May 2021 18:07:48 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id b16sm11748176pju.35.2021.05.24.18.07.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 May 2021 18:07:47 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 79/92] target/arm: Implement 128-bit ZIP, UZP, TRN
Date: Mon, 24 May 2021 18:03:45 -0700
Message-Id: <20210525010358.152808-80-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210525010358.152808-1-richard.henderson@linaro.org>
References: <20210525010358.152808-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
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

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-sve.h    |  3 ++
 target/arm/sve.decode      |  8 ++++++
 target/arm/sve_helper.c    | 29 +++++++++++++------
 target/arm/translate-sve.c | 58 ++++++++++++++++++++++++++++++++++++++
 4 files changed, 90 insertions(+), 8 deletions(-)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index 342bb83721..b43ffce23a 100644
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
index 884c5358eb..5469ce0414 100644
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
index a051854984..d088b1f74c 100644
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
index 1dcdbac0af..b2aa9130b6 100644
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
2.25.1


