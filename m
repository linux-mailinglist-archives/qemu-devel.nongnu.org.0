Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8229390640
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 18:10:26 +0200 (CEST)
Received: from localhost ([::1]:59756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llZdR-00010A-CH
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 12:10:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1llYc3-0004eY-HQ
 for qemu-devel@nongnu.org; Tue, 25 May 2021 11:04:55 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:42634)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1llYbs-0004q5-Eg
 for qemu-devel@nongnu.org; Tue, 25 May 2021 11:04:55 -0400
Received: by mail-wr1-x435.google.com with SMTP id x8so32605071wrq.9
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 08:04:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=zqeWQLhod1KKj7KUyW5KfEHehqM2ir0gb7drCR3LSqE=;
 b=gUwbEBSG24GrIfmpp7/X6PHZclv1MctNVQF9e0MtnMzHnQmbQtabDWqD/maBHOfybz
 z5bYEMmNaxI+4zWnQvpG56t+ocAaBcmM8o4bzZvctNZ6GQDEaJEwfcz5rriXihqpMVGs
 Pi1IoK/4PThsFnX9tfSWmPsd0n7ybUHYsxBkyxCjaxdfwDYe0wSYLD0518CX7WNfBwlQ
 5vM+OtUoM7Ur8M4knsXpsDtE23oVxZqlOq2t38Eea4zmWLQAw0YiBmsy+aF6K3jxUOKN
 Sgp1g22iNAWGtSgoSqig6Uyxj14hwiFUkDc+mt6lQSR4FKj7wM0s780rOdO4jngX3Vi7
 RKWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zqeWQLhod1KKj7KUyW5KfEHehqM2ir0gb7drCR3LSqE=;
 b=e/4uB0G943+lAlgaaQLJvzVN+pApDkAeR/6f/QQnKJJCEeaGKIrRYSYv12jjou5QoB
 8vP/501O/SAN1xvUfIrsSLF7JRELZQP3QWf0LnOuFo/fRZucogW34/KVxyFOsmYMOkJG
 ejp1Xv4qizwnPb7DnDZWTyPgFGc7c5qSWhJTGptULVzPUY+Kmjoiv6/Unk5zCZiZZDyy
 xfnSI4x3Fvf7Sm4Pg/HxiX7qnSNQb6tvy+8Nq/5iFutwlM46uTEaGpsrtDhjMb4OUEpJ
 gSSaF01Xgx9YPqSjsZ33AJN4BacdK+CTMYvHV2tT7cZ5ft4mRVdmtIg7svD3QV1FKZ52
 hdbA==
X-Gm-Message-State: AOAM531dr9PPlBpp041Ga50HIlVfbmsZeZnXptX5VFXYoeIWX7op2Hkx
 HWsxlVg17dTtDKkCQp78wge175LmVEQ1X7Ni
X-Google-Smtp-Source: ABdhPJzywNYTe8nylRckBrsdRu5P9CM4sRuSo5QVFWmtl9Q/XdO8/Igfk1uMiHZ6G2PJPbRafaiEGg==
X-Received: by 2002:a05:6000:22f:: with SMTP id
 l15mr27519558wrz.316.1621955083172; 
 Tue, 25 May 2021 08:04:43 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id q62sm11710284wma.42.2021.05.25.08.04.42
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 08:04:42 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 080/114] target/arm: Implement SVE2 signed saturating doubling
 multiply high
Date: Tue, 25 May 2021 16:02:50 +0100
Message-Id: <20210525150324.32370-81-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210525150324.32370-1-peter.maydell@linaro.org>
References: <20210525150324.32370-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x435.google.com
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
Message-id: 20210525010358.152808-59-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.h        | 10 +++++
 target/arm/sve.decode      |  4 ++
 target/arm/translate-sve.c | 18 ++++++++
 target/arm/vec_helper.c    | 84 ++++++++++++++++++++++++++++++++++++++
 4 files changed, 116 insertions(+)

diff --git a/target/arm/helper.h b/target/arm/helper.h
index 72c5bf6acac..eb94b6b1e63 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -957,6 +957,16 @@ DEF_HELPER_FLAGS_5(neon_sqrdmulh_h, TCG_CALL_NO_RWG,
 DEF_HELPER_FLAGS_5(neon_sqrdmulh_s, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
 
+DEF_HELPER_FLAGS_4(sve2_sqdmulh_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_sqdmulh_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_sqdmulh_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_sqdmulh_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(sve2_sqrdmulh_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_sqrdmulh_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_sqrdmulh_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_sqrdmulh_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
 DEF_HELPER_FLAGS_4(gvec_xar_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 
 #ifdef TARGET_AARCH64
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index a3b9fb95f9c..407d3019d1b 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1202,6 +1202,10 @@ SMULH_zzz       00000100 .. 1 ..... 0110 10 ..... .....  @rd_rn_rm
 UMULH_zzz       00000100 .. 1 ..... 0110 11 ..... .....  @rd_rn_rm
 PMUL_zzz        00000100 00 1 ..... 0110 01 ..... .....  @rd_rn_rm_e0
 
+# SVE2 signed saturating doubling multiply high (unpredicated)
+SQDMULH_zzz     00000100 .. 1 ..... 0111 00 ..... .....  @rd_rn_rm
+SQRDMULH_zzz    00000100 .. 1 ..... 0111 01 ..... .....  @rd_rn_rm
+
 ### SVE2 Integer - Predicated
 
 SADALP_zpzz     01000100 .. 000 100 101 ... ..... .....  @rdm_pg_rn
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index c009ec54ff5..001432eccc7 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -6433,6 +6433,24 @@ static bool trans_PMUL_zzz(DisasContext *s, arg_rrr_esz *a)
     return do_sve2_zzz_ool(s, a, gen_helper_gvec_pmul_b);
 }
 
+static bool trans_SQDMULH_zzz(DisasContext *s, arg_rrr_esz *a)
+{
+    static gen_helper_gvec_3 * const fns[4] = {
+        gen_helper_sve2_sqdmulh_b, gen_helper_sve2_sqdmulh_h,
+        gen_helper_sve2_sqdmulh_s, gen_helper_sve2_sqdmulh_d,
+    };
+    return do_sve2_zzz_ool(s, a, fns[a->esz]);
+}
+
+static bool trans_SQRDMULH_zzz(DisasContext *s, arg_rrr_esz *a)
+{
+    static gen_helper_gvec_3 * const fns[4] = {
+        gen_helper_sve2_sqrdmulh_b, gen_helper_sve2_sqrdmulh_h,
+        gen_helper_sve2_sqrdmulh_s, gen_helper_sve2_sqrdmulh_d,
+    };
+    return do_sve2_zzz_ool(s, a, fns[a->esz]);
+}
+
 /*
  * SVE2 Integer - Predicated
  */
diff --git a/target/arm/vec_helper.c b/target/arm/vec_helper.c
index b19877e0d34..25061c15e10 100644
--- a/target/arm/vec_helper.c
+++ b/target/arm/vec_helper.c
@@ -81,6 +81,26 @@ void HELPER(sve2_sqrdmlsh_b)(void *vd, void *vn, void *vm,
     }
 }
 
+void HELPER(sve2_sqdmulh_b)(void *vd, void *vn, void *vm, uint32_t desc)
+{
+    intptr_t i, opr_sz = simd_oprsz(desc);
+    int8_t *d = vd, *n = vn, *m = vm;
+
+    for (i = 0; i < opr_sz; ++i) {
+        d[i] = do_sqrdmlah_b(n[i], m[i], 0, false, false);
+    }
+}
+
+void HELPER(sve2_sqrdmulh_b)(void *vd, void *vn, void *vm, uint32_t desc)
+{
+    intptr_t i, opr_sz = simd_oprsz(desc);
+    int8_t *d = vd, *n = vn, *m = vm;
+
+    for (i = 0; i < opr_sz; ++i) {
+        d[i] = do_sqrdmlah_b(n[i], m[i], 0, false, true);
+    }
+}
+
 /* Signed saturating rounding doubling multiply-accumulate high half, 16-bit */
 int16_t do_sqrdmlah_h(int16_t src1, int16_t src2, int16_t src3,
                       bool neg, bool round, uint32_t *sat)
@@ -198,6 +218,28 @@ void HELPER(sve2_sqrdmlsh_h)(void *vd, void *vn, void *vm,
     }
 }
 
+void HELPER(sve2_sqdmulh_h)(void *vd, void *vn, void *vm, uint32_t desc)
+{
+    intptr_t i, opr_sz = simd_oprsz(desc);
+    int16_t *d = vd, *n = vn, *m = vm;
+    uint32_t discard;
+
+    for (i = 0; i < opr_sz / 2; ++i) {
+        d[i] = do_sqrdmlah_h(n[i], m[i], 0, false, false, &discard);
+    }
+}
+
+void HELPER(sve2_sqrdmulh_h)(void *vd, void *vn, void *vm, uint32_t desc)
+{
+    intptr_t i, opr_sz = simd_oprsz(desc);
+    int16_t *d = vd, *n = vn, *m = vm;
+    uint32_t discard;
+
+    for (i = 0; i < opr_sz / 2; ++i) {
+        d[i] = do_sqrdmlah_h(n[i], m[i], 0, false, true, &discard);
+    }
+}
+
 /* Signed saturating rounding doubling multiply-accumulate high half, 32-bit */
 int32_t do_sqrdmlah_s(int32_t src1, int32_t src2, int32_t src3,
                       bool neg, bool round, uint32_t *sat)
@@ -309,6 +351,28 @@ void HELPER(sve2_sqrdmlsh_s)(void *vd, void *vn, void *vm,
     }
 }
 
+void HELPER(sve2_sqdmulh_s)(void *vd, void *vn, void *vm, uint32_t desc)
+{
+    intptr_t i, opr_sz = simd_oprsz(desc);
+    int32_t *d = vd, *n = vn, *m = vm;
+    uint32_t discard;
+
+    for (i = 0; i < opr_sz / 4; ++i) {
+        d[i] = do_sqrdmlah_s(n[i], m[i], 0, false, false, &discard);
+    }
+}
+
+void HELPER(sve2_sqrdmulh_s)(void *vd, void *vn, void *vm, uint32_t desc)
+{
+    intptr_t i, opr_sz = simd_oprsz(desc);
+    int32_t *d = vd, *n = vn, *m = vm;
+    uint32_t discard;
+
+    for (i = 0; i < opr_sz / 4; ++i) {
+        d[i] = do_sqrdmlah_s(n[i], m[i], 0, false, true, &discard);
+    }
+}
+
 /* Signed saturating rounding doubling multiply-accumulate high half, 64-bit */
 static int64_t do_sat128_d(Int128 r)
 {
@@ -368,6 +432,26 @@ void HELPER(sve2_sqrdmlsh_d)(void *vd, void *vn, void *vm,
     }
 }
 
+void HELPER(sve2_sqdmulh_d)(void *vd, void *vn, void *vm, uint32_t desc)
+{
+    intptr_t i, opr_sz = simd_oprsz(desc);
+    int64_t *d = vd, *n = vn, *m = vm;
+
+    for (i = 0; i < opr_sz / 8; ++i) {
+        d[i] = do_sqrdmlah_d(n[i], m[i], 0, false, false);
+    }
+}
+
+void HELPER(sve2_sqrdmulh_d)(void *vd, void *vn, void *vm, uint32_t desc)
+{
+    intptr_t i, opr_sz = simd_oprsz(desc);
+    int64_t *d = vd, *n = vn, *m = vm;
+
+    for (i = 0; i < opr_sz / 8; ++i) {
+        d[i] = do_sqrdmlah_d(n[i], m[i], 0, false, true);
+    }
+}
+
 /* Integer 8 and 16-bit dot-product.
  *
  * Note that for the loops herein, host endianness does not matter
-- 
2.20.1


