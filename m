Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0B4D3905C9
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 17:44:38 +0200 (CEST)
Received: from localhost ([::1]:37098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llZET-0005Oh-MN
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 11:44:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1llYbW-0003VJ-RT
 for qemu-devel@nongnu.org; Tue, 25 May 2021 11:04:26 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:40602)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1llYbN-0004Rh-S5
 for qemu-devel@nongnu.org; Tue, 25 May 2021 11:04:22 -0400
Received: by mail-wr1-x42e.google.com with SMTP id z17so32608695wrq.7
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 08:04:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=hKsaxSW7rRax8zsH7T5+PCEmsre7FEyy9+HqpiGZR98=;
 b=r3NDAWc7Zx949yGUEVAGwSLkl11Jty/fjKZJnlHbe/Qxk0slJdGNBnWpCslYHUR4bR
 RiZIfdi3OvEiEO/tgoIG9f9SSqTXDW1jm7wQ98tNv41tx7JmEx+UXRG6X5UK4prwaIKY
 Ss9k0yWrKBqpCZujaNH/4N9QIWxKkp/xyIYmtsmzxhrLHMo11qZqpcHs3BbCakGNUyXg
 MWEohBe509dgizbY8QrP9tL07Lh4Q4d8VUDW6BwmID3ou9PQL3bkhD+OQytiGxynQWpY
 IWHwumKGfYsBUHFAxzAxj5h3JXXmf52OMBALqlZY09PgM1X+F3/CwzUhN/ZN/3JVWO6x
 YcZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hKsaxSW7rRax8zsH7T5+PCEmsre7FEyy9+HqpiGZR98=;
 b=VCj7OakNAwalsXGshjmOezEj6Y3lp3l5Ry60HM7JGBmQuy2re6HWvarf/gVgEjXpRR
 E+67tChmwwCRJintdA8jazwsYyt4cw9lYpUmbRf97RdXbDRaTfSOgohYV0r5ZFoWf/JO
 AOxrMzldtmjdGk6Yw/fcutfc1gyroLmeZjoFqsdmQbpNj5L4hHcPY2bw4pIc9lxb981L
 ht5FZRpfmYUHX3nmX2I0O7ky6lM7MJLlcrSGqmtUPq+TLvFLFW7Q1pP9m2fDZ6Z+92xK
 N8VzPvKbpa/+lfStw3nECIs+QHo7fn9mYI4oMSp3mqx5lh8Yjcjxx+DAciLSJ/abkNfk
 pPfQ==
X-Gm-Message-State: AOAM531pI6lJactFJtgtPX+MAOgbNsbz+elNY5IAetxKO6WTZF+ZJ5wM
 JTIzcMzA1JkmozJWKkpv4xBjxYfYEYNl2KMo
X-Google-Smtp-Source: ABdhPJxKsaRheUc9TXt9Jl8Qk2ryw9Q3AQUcqJ0AQDcuxFYuSqs2rSdGhMjcPgKVbzYX78auD9AP4A==
X-Received: by 2002:a5d:5257:: with SMTP id k23mr27717727wrc.328.1621955052468; 
 Tue, 25 May 2021 08:04:12 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id q62sm11710284wma.42.2021.05.25.08.04.11
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 08:04:12 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 051/114] target/arm: Implement SVE2 SQSHRN, SQRSHRN
Date: Tue, 25 May 2021 16:02:21 +0100
Message-Id: <20210525150324.32370-52-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210525150324.32370-1-peter.maydell@linaro.org>
References: <20210525150324.32370-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42e.google.com
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

This completes the section "SVE2 bitwise shift right narrow".

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210525010358.152808-30-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper-sve.h    |  16 ++++++
 target/arm/sve.decode      |   4 ++
 target/arm/sve_helper.c    |  24 +++++++++
 target/arm/translate-sve.c | 105 +++++++++++++++++++++++++++++++++++++
 4 files changed, 149 insertions(+)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index ba6a24fc8b5..1c7fe8e417a 100644
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
index 13b5da08561..0674464695e 100644
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
index 89262149f9b..0ea4ae28db9 100644
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
index e5c71005c82..4141d763111 100644
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
2.20.1


