Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62A1C38F79C
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 03:39:59 +0200 (CEST)
Received: from localhost ([::1]:45570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llM33-0006tZ-2I
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 21:39:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llLV4-0002BM-DY
 for qemu-devel@nongnu.org; Mon, 24 May 2021 21:04:50 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:38899)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llLUZ-0001rZ-FN
 for qemu-devel@nongnu.org; Mon, 24 May 2021 21:04:50 -0400
Received: by mail-pf1-x435.google.com with SMTP id e17so11668793pfl.5
 for <qemu-devel@nongnu.org>; Mon, 24 May 2021 18:04:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AJkG8XDDClP3dpiPaSjuBLtopyEBlxV6aqwcFZt8nEI=;
 b=AQmvUa9mWoKt/vOvHkLa5Lc94chEyRDRuf3pD4STWYcd+XapEdy4v56FIXjKQHggS9
 rQXspAgYuvSea6QHq0Yx4MDBkhotsaU9nC/+k0QJ3QlHjtSYvH/ce4Ew4s2iwD0mTSYK
 7e/LCwK9cscmgd3JzUKBCr6d42YmZDtIcoY4QD6PSw95mvIqt8LIFrZUIsqEN0OGSDrJ
 W0ejOXWNGRB3JzUYay9/m8PGwMPk2cKrymb7URMBh7JgtIkc2rNCxHLviA/iWAFrSAPg
 4I0Q48CjfegnFaAZ1gURWzg0k8ca+1KUFpPzAU8WURI5GcF+0Cb6HCRbLZQ3xygXyHGS
 Z1Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AJkG8XDDClP3dpiPaSjuBLtopyEBlxV6aqwcFZt8nEI=;
 b=t9HDZnjLG56QtaCu72J6Kz+Y2/Y7WjgMpAHsvgmBLOerPPuxh0sDvVDUNU8z4IFGYU
 RUvVgLCSA+fHuNOLQzlsvFCIzbP6Cc8CpP9AArZlsh/ZggPRbnukEkyiq0ftJMEipReH
 SF/CKjZAAWj5yvEpIo6yvIUTIfjuUAzh1nMwYDVg5PYLhcO3siYpfYuxPTKerkxDmmNI
 MqoI4b0Rwh5q9Lbkdoa3AEPK3LkD6J9I79TFenLGA4U+y+HJz2wViMz4rMWf1R8r2TxL
 oMsWIXOw0oi1kDTyEy63HMe/LrJgxI5rSbX3FpKhBG3gQgUqR+G+BVDPH+30RFv3H8HL
 jj4w==
X-Gm-Message-State: AOAM532KcOQVmnoeRabpgQWNZb2EPJI6h+vd+tKgP6LXdfl2bTOsF+j2
 6QmRrPT7dNikf+hZUQfVSA0O/q4NyG0aiQ==
X-Google-Smtp-Source: ABdhPJxTS6r7gnpW9hUXHftKuMtxjs+xGdlFKfvWk8I/FCe+TiVw9KY0ShAxzRyOXaFf9jVim1gBUg==
X-Received: by 2002:aa7:8bd5:0:b029:2d6:ab78:7770 with SMTP id
 s21-20020aa78bd50000b02902d6ab787770mr27455583pfd.59.1621904657315; 
 Mon, 24 May 2021 18:04:17 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id b1sm13742645pgf.84.2021.05.24.18.04.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 May 2021 18:04:17 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 29/92] target/arm: Implement SVE2 SQSHRN, SQRSHRN
Date: Mon, 24 May 2021 18:02:55 -0700
Message-Id: <20210525010358.152808-30-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210525010358.152808-1-richard.henderson@linaro.org>
References: <20210525010358.152808-1-richard.henderson@linaro.org>
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This completes the section "SVE2 bitwise shift right narrow".

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-sve.h    |  16 ++++++
 target/arm/sve.decode      |   4 ++
 target/arm/sve_helper.c    |  24 +++++++++
 target/arm/translate-sve.c | 105 +++++++++++++++++++++++++++++++++++++
 4 files changed, 149 insertions(+)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index ba6a24fc8b..1c7fe8e417 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -2476,6 +2476,22 @@ DEF_HELPER_FLAGS_3(sve2_sqrshrunt_h, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
 DEF_HELPER_FLAGS_3(sve2_sqrshrunt_s, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
 DEF_HELPER_FLAGS_3(sve2_sqrshrunt_d, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
 
+DEF_HELPER_FLAGS_3(sve2_sqshrnb_h, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(sve2_sqshrnb_s, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(sve2_sqshrnb_d, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_3(sve2_sqshrnt_h, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(sve2_sqshrnt_s, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(sve2_sqshrnt_d, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_3(sve2_sqrshrnb_h, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(sve2_sqrshrnb_s, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(sve2_sqrshrnb_d, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_3(sve2_sqrshrnt_h, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(sve2_sqrshrnt_s, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(sve2_sqrshrnt_d, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+
 DEF_HELPER_FLAGS_3(sve2_uqshrnb_h, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
 DEF_HELPER_FLAGS_3(sve2_uqshrnb_s, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
 DEF_HELPER_FLAGS_3(sve2_uqshrnb_d, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 13b5da0856..0674464695 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1296,6 +1296,10 @@ SHRNB           01000101 .. 1 ..... 00 0100 ..... .....  @rd_rn_tszimm_shr
 SHRNT           01000101 .. 1 ..... 00 0101 ..... .....  @rd_rn_tszimm_shr
 RSHRNB          01000101 .. 1 ..... 00 0110 ..... .....  @rd_rn_tszimm_shr
 RSHRNT          01000101 .. 1 ..... 00 0111 ..... .....  @rd_rn_tszimm_shr
+SQSHRNB         01000101 .. 1 ..... 00 1000 ..... .....  @rd_rn_tszimm_shr
+SQSHRNT         01000101 .. 1 ..... 00 1001 ..... .....  @rd_rn_tszimm_shr
+SQRSHRNB        01000101 .. 1 ..... 00 1010 ..... .....  @rd_rn_tszimm_shr
+SQRSHRNT        01000101 .. 1 ..... 00 1011 ..... .....  @rd_rn_tszimm_shr
 UQSHRNB         01000101 .. 1 ..... 00 1100 ..... .....  @rd_rn_tszimm_shr
 UQSHRNT         01000101 .. 1 ..... 00 1101 ..... .....  @rd_rn_tszimm_shr
 UQRSHRNB        01000101 .. 1 ..... 00 1110 ..... .....  @rd_rn_tszimm_shr
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 89262149f9..0ea4ae28db 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -1976,6 +1976,30 @@ DO_SHRNT(sve2_sqrshrunt_h, int16_t, uint8_t, H1_2, H1, DO_SQRSHRUN_H)
 DO_SHRNT(sve2_sqrshrunt_s, int32_t, uint16_t, H1_4, H1_2, DO_SQRSHRUN_S)
 DO_SHRNT(sve2_sqrshrunt_d, int64_t, uint32_t,     , H1_4, DO_SQRSHRUN_D)
 
+#define DO_SQSHRN_H(x, sh) do_sat_bhs(x >> sh, INT8_MIN, INT8_MAX)
+#define DO_SQSHRN_S(x, sh) do_sat_bhs(x >> sh, INT16_MIN, INT16_MAX)
+#define DO_SQSHRN_D(x, sh) do_sat_bhs(x >> sh, INT32_MIN, INT32_MAX)
+
+DO_SHRNB(sve2_sqshrnb_h, int16_t, uint8_t, DO_SQSHRN_H)
+DO_SHRNB(sve2_sqshrnb_s, int32_t, uint16_t, DO_SQSHRN_S)
+DO_SHRNB(sve2_sqshrnb_d, int64_t, uint32_t, DO_SQSHRN_D)
+
+DO_SHRNT(sve2_sqshrnt_h, int16_t, uint8_t, H1_2, H1, DO_SQSHRN_H)
+DO_SHRNT(sve2_sqshrnt_s, int32_t, uint16_t, H1_4, H1_2, DO_SQSHRN_S)
+DO_SHRNT(sve2_sqshrnt_d, int64_t, uint32_t,     , H1_4, DO_SQSHRN_D)
+
+#define DO_SQRSHRN_H(x, sh) do_sat_bhs(do_srshr(x, sh), INT8_MIN, INT8_MAX)
+#define DO_SQRSHRN_S(x, sh) do_sat_bhs(do_srshr(x, sh), INT16_MIN, INT16_MAX)
+#define DO_SQRSHRN_D(x, sh) do_sat_bhs(do_srshr(x, sh), INT32_MIN, INT32_MAX)
+
+DO_SHRNB(sve2_sqrshrnb_h, int16_t, uint8_t, DO_SQRSHRN_H)
+DO_SHRNB(sve2_sqrshrnb_s, int32_t, uint16_t, DO_SQRSHRN_S)
+DO_SHRNB(sve2_sqrshrnb_d, int64_t, uint32_t, DO_SQRSHRN_D)
+
+DO_SHRNT(sve2_sqrshrnt_h, int16_t, uint8_t, H1_2, H1, DO_SQRSHRN_H)
+DO_SHRNT(sve2_sqrshrnt_s, int32_t, uint16_t, H1_4, H1_2, DO_SQRSHRN_S)
+DO_SHRNT(sve2_sqrshrnt_d, int64_t, uint32_t,     , H1_4, DO_SQRSHRN_D)
+
 #define DO_UQSHRN_H(x, sh) MIN(x >> sh, UINT8_MAX)
 #define DO_UQSHRN_S(x, sh) MIN(x >> sh, UINT16_MAX)
 #define DO_UQSHRN_D(x, sh) MIN(x >> sh, UINT32_MAX)
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index e5c71005c8..4141d76311 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -6956,6 +6956,111 @@ static bool trans_SQRSHRUNT(DisasContext *s, arg_rri_esz *a)
     return do_sve2_shr_narrow(s, a, ops);
 }
 
+static void gen_sqshrnb_vec(unsigned vece, TCGv_vec d,
+                            TCGv_vec n, int64_t shr)
+{
+    TCGv_vec t = tcg_temp_new_vec_matching(d);
+    int halfbits = 4 << vece;
+    int64_t max = MAKE_64BIT_MASK(0, halfbits - 1);
+    int64_t min = -max - 1;
+
+    tcg_gen_sari_vec(vece, n, n, shr);
+    tcg_gen_dupi_vec(vece, t, min);
+    tcg_gen_smax_vec(vece, n, n, t);
+    tcg_gen_dupi_vec(vece, t, max);
+    tcg_gen_smin_vec(vece, n, n, t);
+    tcg_gen_dupi_vec(vece, t, MAKE_64BIT_MASK(0, halfbits));
+    tcg_gen_and_vec(vece, d, n, t);
+    tcg_temp_free_vec(t);
+}
+
+static bool trans_SQSHRNB(DisasContext *s, arg_rri_esz *a)
+{
+    static const TCGOpcode vec_list[] = {
+        INDEX_op_sari_vec, INDEX_op_smax_vec, INDEX_op_smin_vec, 0
+    };
+    static const GVecGen2i ops[3] = {
+        { .fniv = gen_sqshrnb_vec,
+          .opt_opc = vec_list,
+          .fno = gen_helper_sve2_sqshrnb_h,
+          .vece = MO_16 },
+        { .fniv = gen_sqshrnb_vec,
+          .opt_opc = vec_list,
+          .fno = gen_helper_sve2_sqshrnb_s,
+          .vece = MO_32 },
+        { .fniv = gen_sqshrnb_vec,
+          .opt_opc = vec_list,
+          .fno = gen_helper_sve2_sqshrnb_d,
+          .vece = MO_64 },
+    };
+    return do_sve2_shr_narrow(s, a, ops);
+}
+
+static void gen_sqshrnt_vec(unsigned vece, TCGv_vec d,
+                             TCGv_vec n, int64_t shr)
+{
+    TCGv_vec t = tcg_temp_new_vec_matching(d);
+    int halfbits = 4 << vece;
+    int64_t max = MAKE_64BIT_MASK(0, halfbits - 1);
+    int64_t min = -max - 1;
+
+    tcg_gen_sari_vec(vece, n, n, shr);
+    tcg_gen_dupi_vec(vece, t, min);
+    tcg_gen_smax_vec(vece, n, n, t);
+    tcg_gen_dupi_vec(vece, t, max);
+    tcg_gen_smin_vec(vece, n, n, t);
+    tcg_gen_shli_vec(vece, n, n, halfbits);
+    tcg_gen_dupi_vec(vece, t, MAKE_64BIT_MASK(0, halfbits));
+    tcg_gen_bitsel_vec(vece, d, t, d, n);
+    tcg_temp_free_vec(t);
+}
+
+static bool trans_SQSHRNT(DisasContext *s, arg_rri_esz *a)
+{
+    static const TCGOpcode vec_list[] = {
+        INDEX_op_shli_vec, INDEX_op_sari_vec,
+        INDEX_op_smax_vec, INDEX_op_smin_vec, 0
+    };
+    static const GVecGen2i ops[3] = {
+        { .fniv = gen_sqshrnt_vec,
+          .opt_opc = vec_list,
+          .load_dest = true,
+          .fno = gen_helper_sve2_sqshrnt_h,
+          .vece = MO_16 },
+        { .fniv = gen_sqshrnt_vec,
+          .opt_opc = vec_list,
+          .load_dest = true,
+          .fno = gen_helper_sve2_sqshrnt_s,
+          .vece = MO_32 },
+        { .fniv = gen_sqshrnt_vec,
+          .opt_opc = vec_list,
+          .load_dest = true,
+          .fno = gen_helper_sve2_sqshrnt_d,
+          .vece = MO_64 },
+    };
+    return do_sve2_shr_narrow(s, a, ops);
+}
+
+static bool trans_SQRSHRNB(DisasContext *s, arg_rri_esz *a)
+{
+    static const GVecGen2i ops[3] = {
+        { .fno = gen_helper_sve2_sqrshrnb_h },
+        { .fno = gen_helper_sve2_sqrshrnb_s },
+        { .fno = gen_helper_sve2_sqrshrnb_d },
+    };
+    return do_sve2_shr_narrow(s, a, ops);
+}
+
+static bool trans_SQRSHRNT(DisasContext *s, arg_rri_esz *a)
+{
+    static const GVecGen2i ops[3] = {
+        { .fno = gen_helper_sve2_sqrshrnt_h },
+        { .fno = gen_helper_sve2_sqrshrnt_s },
+        { .fno = gen_helper_sve2_sqrshrnt_d },
+    };
+    return do_sve2_shr_narrow(s, a, ops);
+}
+
 static void gen_uqshrnb_vec(unsigned vece, TCGv_vec d,
                             TCGv_vec n, int64_t shr)
 {
-- 
2.25.1


