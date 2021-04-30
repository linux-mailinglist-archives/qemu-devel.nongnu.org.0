Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B918E3702ED
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 23:23:36 +0200 (CEST)
Received: from localhost ([::1]:47136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcabn-0000qy-QY
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 17:23:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcZme-0004tu-08
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 16:30:44 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:33561)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcZlw-0007nu-QB
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 16:30:43 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 b14-20020a17090a6e0eb0290155c7f6a356so6166566pjk.0
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 13:29:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FKg75aAFmN25FAqgzIOqHHzocUDdmnMr2DmC+4pZfoE=;
 b=ZuYn00yAKRYSGvlpEJ/WH0g1rFI3fec/4AnGo1GDWMCFVmMKiFkM4MuN9u9j9sr8xo
 IGqBDbugYpYIGCwSRoNQpGcTfDzFqdSdqiqu++n0MBRpZam6S9k2Q7jT0jeN3Aaf1pho
 /4P2hw8E/50iU9YTQ8oq0rMs2y2LB8NdSJrJFkuu9WJ35/6vvniwpj3tool8fECCbhvk
 pomhVCcacLlt1Vye75YTUHFooorEo9BZ+8rFn/2tBmA4A+8WIrkVf+hO25GFvBDC3e9B
 Zua9GcvcyJT0mc/J/UCrMEE0bOe1b91FNoeCgW0s2AzNds76YtXEKmuSDHcu8OoWVYnN
 qdxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FKg75aAFmN25FAqgzIOqHHzocUDdmnMr2DmC+4pZfoE=;
 b=Z6YXzOeRT7ghbIA6vNn4UivZU42EAoCeT/fq02rF0UARv5+HF3m5a8yDhH592N9ide
 aDVjAYLL5C0qafV2Rsnh8mnMKzBv0o3L1+houkKlcvNzUt9eWL2Qom3ORHtdB3jEXRmb
 JufzcCAhWVKLvcCCIDH8cYIgokvHmDHFxuOdfL80qQE5aKiE8wCA4q8XEC/vPVL+LoNt
 FWsp2ZJ837EM6DfkSlaoBeRnm0F7eEpggZ1YQrMjUCxZGOY7oMsh9USkrHmjI4aeL1UP
 5NxHt7mDeokJS7NaRbEf1jFSILYRJ3Am4O22fJEJMIEoGYyxrAZQUyUJw1rS0HTgy8an
 qGTQ==
X-Gm-Message-State: AOAM531h7B2ONLvg8TSUda3tZyomKuNxoPgRAvPJJmSWcQSnnZQStp2q
 8fORKnAkT6BEE6H41ehABhwnHqd7vzMTSw==
X-Google-Smtp-Source: ABdhPJzSEawCLHrHV4wVOH0Lo2rKDQ8yTXcDIQPPQRCvu8XyjOnriurXjAuxAY3X/1x8jH2sSQ5vmA==
X-Received: by 2002:a17:902:e353:b029:ed:866b:7624 with SMTP id
 p19-20020a170902e353b02900ed866b7624mr7315170plc.25.1619814595232; 
 Fri, 30 Apr 2021 13:29:55 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id q23sm3788781pgt.42.2021.04.30.13.29.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Apr 2021 13:29:54 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 71/82] target/arm: Implement 128-bit ZIP, UZP, TRN
Date: Fri, 30 Apr 2021 13:25:59 -0700
Message-Id: <20210430202610.1136687-72-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210430202610.1136687-1-richard.henderson@linaro.org>
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
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
 target/arm/helper-sve.h    |  3 ++
 target/arm/sve.decode      |  8 ++++++
 target/arm/sve_helper.c    | 29 +++++++++++++------
 target/arm/translate-sve.c | 58 ++++++++++++++++++++++++++++++++++++++
 4 files changed, 90 insertions(+), 8 deletions(-)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index 96bd200e73..6e9479800d 100644
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
index df870ce23b..32e11301a5 100644
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
index 754301a3a6..d5701cb4e8 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -3338,36 +3338,45 @@ void HELPER(NAME)(void *vd, void *vn, void *vm, uint32_t desc)       \
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
@@ -3381,12 +3390,16 @@ void HELPER(NAME)(void *vd, void *vn, void *vm, uint32_t desc)         \
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
index 8a4eb8542f..cb62ad36f4 100644
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


