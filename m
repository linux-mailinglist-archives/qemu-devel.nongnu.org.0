Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5124362A50
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 23:29:22 +0200 (CEST)
Received: from localhost ([::1]:37746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXW1h-0004i1-TJ
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 17:29:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXVcS-0004e0-Jr
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 17:03:16 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:41937)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXVcN-0001Fu-9F
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 17:03:16 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 z22-20020a17090a0156b029014d4056663fso15283821pje.0
 for <qemu-devel@nongnu.org>; Fri, 16 Apr 2021 14:03:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TYIH46Yz5nuJnlEKWiLaTEG5vm1zqOPy6lL/fTv4hvo=;
 b=q050C6DwyRnv72p744+Uj84/FMfR+HMV20VjFDDmyScZ3TbWS/E9EqK5ksTKOgRjix
 ke0d5vDNGCdXJzVmbfLP7dzy4rVu+so7H7UzeJT0KgE5DWEH3EeMVrjzVOGeUbCvxt/D
 5mu3q/9Emv8YQ0UO/pVd5Unp/GKkn3DVNbV52xtnVreDjFl9wDjq2ynf7DAY1t60zGGW
 xfU2FhdgrNec47/06hw8EMKl4JpnYjqyE9l7ReORobOHFG3nq3Yq74lRJNwVNeo/GYe1
 YUcttvUOU2+UT5yGndnHnn7lAgs8lLEFH87tFMIKnLWav+C+XrePV+/D7fCGLxthIksR
 P2IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TYIH46Yz5nuJnlEKWiLaTEG5vm1zqOPy6lL/fTv4hvo=;
 b=pUER0Ky4hO5oXLhCwwQ15XUvL3BNlHMmFIgkwd/e2UtDox6DhC3pjaCTN9YwDNePWY
 MI1D1bh+Qm5z+dFxoG/AogbVgS9H+AO9t4tW4wlKNevhm2N8YNlsWsei+l/uv/bxAESl
 d2KsFSDRLufTpB2HoE1iPPRbUPYvfTyjnKEzwgETSkhfPjijnaVXdxBlYpChdPcbOKbT
 o533Z811z3SMZwG/1XePlN9qg+I2rMJrJQoc5tN664E9kFpBCQdvAj5wBfWMHrRGyQJp
 DU9tplX1/KB47MLDqluYwih+XI9pUknKuBzqV1hsr4Of9infW1E1OQ5Ro0ykGJPEM1YD
 hZgw==
X-Gm-Message-State: AOAM533wC1hmEG71hL9pTxtho5v1NryHdY2FJE4PpVd832r01tEIxsRQ
 6T+xdWwVgXIE6sQjNHJsvuwsXAsRsK8dXw==
X-Google-Smtp-Source: ABdhPJypdm+NoVarhH3booRYTBjQx8NSV3I32sKUqxXTmFaRLD38OqBpJvAXb7NjjS2SAb6ahktNrw==
X-Received: by 2002:a17:90a:6b84:: with SMTP id
 w4mr11572266pjj.134.1618606990028; 
 Fri, 16 Apr 2021 14:03:10 -0700 (PDT)
Received: from localhost.localdomain ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id m15sm5920640pjz.36.2021.04.16.14.03.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 14:03:09 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 28/81] target/arm: Implement SVE2 UQSHRN, UQRSHRN
Date: Fri, 16 Apr 2021 14:01:47 -0700
Message-Id: <20210416210240.1591291-29-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210416210240.1591291-1-richard.henderson@linaro.org>
References: <20210416210240.1591291-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
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
 target/arm/helper-sve.h    | 16 +++++++
 target/arm/sve.decode      |  4 ++
 target/arm/sve_helper.c    | 24 ++++++++++
 target/arm/translate-sve.c | 93 ++++++++++++++++++++++++++++++++++++++
 4 files changed, 137 insertions(+)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index 2e80d9d27b..ba6a24fc8b 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -2476,6 +2476,22 @@ DEF_HELPER_FLAGS_3(sve2_sqrshrunt_h, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
 DEF_HELPER_FLAGS_3(sve2_sqrshrunt_s, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
 DEF_HELPER_FLAGS_3(sve2_sqrshrunt_d, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
 
+DEF_HELPER_FLAGS_3(sve2_uqshrnb_h, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(sve2_uqshrnb_s, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(sve2_uqshrnb_d, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_3(sve2_uqshrnt_h, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(sve2_uqshrnt_s, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(sve2_uqshrnt_d, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_3(sve2_uqrshrnb_h, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(sve2_uqrshrnb_s, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(sve2_uqrshrnb_d, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_3(sve2_uqrshrnt_h, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(sve2_uqrshrnt_s, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(sve2_uqrshrnt_d, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+
 DEF_HELPER_FLAGS_6(sve2_faddp_zpzz_h, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_6(sve2_faddp_zpzz_s, TCG_CALL_NO_RWG,
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 18faa900ca..13b5da0856 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1296,6 +1296,10 @@ SHRNB           01000101 .. 1 ..... 00 0100 ..... .....  @rd_rn_tszimm_shr
 SHRNT           01000101 .. 1 ..... 00 0101 ..... .....  @rd_rn_tszimm_shr
 RSHRNB          01000101 .. 1 ..... 00 0110 ..... .....  @rd_rn_tszimm_shr
 RSHRNT          01000101 .. 1 ..... 00 0111 ..... .....  @rd_rn_tszimm_shr
+UQSHRNB         01000101 .. 1 ..... 00 1100 ..... .....  @rd_rn_tszimm_shr
+UQSHRNT         01000101 .. 1 ..... 00 1101 ..... .....  @rd_rn_tszimm_shr
+UQRSHRNB        01000101 .. 1 ..... 00 1110 ..... .....  @rd_rn_tszimm_shr
+UQRSHRNT        01000101 .. 1 ..... 00 1111 ..... .....  @rd_rn_tszimm_shr
 
 ## SVE2 floating-point pairwise operations
 
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index d6b6293ab0..175f3de08f 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -1971,6 +1971,30 @@ DO_SHRNT(sve2_sqrshrunt_h, int16_t, uint8_t, H1_2, H1, DO_SQRSHRUN_H)
 DO_SHRNT(sve2_sqrshrunt_s, int32_t, uint16_t, H1_4, H1_2, DO_SQRSHRUN_S)
 DO_SHRNT(sve2_sqrshrunt_d, int64_t, uint32_t,     , H1_4, DO_SQRSHRUN_D)
 
+#define DO_UQSHRN_H(x, sh) MIN(x >> sh, UINT8_MAX)
+#define DO_UQSHRN_S(x, sh) MIN(x >> sh, UINT16_MAX)
+#define DO_UQSHRN_D(x, sh) MIN(x >> sh, UINT32_MAX)
+
+DO_SHRNB(sve2_uqshrnb_h, uint16_t, uint8_t, DO_UQSHRN_H)
+DO_SHRNB(sve2_uqshrnb_s, uint32_t, uint16_t, DO_UQSHRN_S)
+DO_SHRNB(sve2_uqshrnb_d, uint64_t, uint32_t, DO_UQSHRN_D)
+
+DO_SHRNT(sve2_uqshrnt_h, uint16_t, uint8_t, H1_2, H1, DO_UQSHRN_H)
+DO_SHRNT(sve2_uqshrnt_s, uint32_t, uint16_t, H1_4, H1_2, DO_UQSHRN_S)
+DO_SHRNT(sve2_uqshrnt_d, uint64_t, uint32_t,     , H1_4, DO_UQSHRN_D)
+
+#define DO_UQRSHRN_H(x, sh) MIN(do_urshr(x, sh), UINT8_MAX)
+#define DO_UQRSHRN_S(x, sh) MIN(do_urshr(x, sh), UINT16_MAX)
+#define DO_UQRSHRN_D(x, sh) MIN(do_urshr(x, sh), UINT32_MAX)
+
+DO_SHRNB(sve2_uqrshrnb_h, uint16_t, uint8_t, DO_UQRSHRN_H)
+DO_SHRNB(sve2_uqrshrnb_s, uint32_t, uint16_t, DO_UQRSHRN_S)
+DO_SHRNB(sve2_uqrshrnb_d, uint64_t, uint32_t, DO_UQRSHRN_D)
+
+DO_SHRNT(sve2_uqrshrnt_h, uint16_t, uint8_t, H1_2, H1, DO_UQRSHRN_H)
+DO_SHRNT(sve2_uqrshrnt_s, uint32_t, uint16_t, H1_4, H1_2, DO_UQRSHRN_S)
+DO_SHRNT(sve2_uqrshrnt_d, uint64_t, uint32_t,     , H1_4, DO_UQRSHRN_D)
+
 #undef DO_SHRNB
 #undef DO_SHRNT
 
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 5ff6b8ffb6..12733d9b4f 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -6956,6 +6956,99 @@ static bool trans_SQRSHRUNT(DisasContext *s, arg_rri_esz *a)
     return do_sve2_shr_narrow(s, a, ops);
 }
 
+static void gen_uqshrnb_vec(unsigned vece, TCGv_vec d,
+                            TCGv_vec n, int64_t shr)
+{
+    TCGv_vec t = tcg_temp_new_vec_matching(d);
+    int halfbits = 4 << vece;
+
+    tcg_gen_shri_vec(vece, n, n, shr);
+    tcg_gen_dupi_vec(vece, t, MAKE_64BIT_MASK(0, halfbits));
+    tcg_gen_umin_vec(vece, d, n, t);
+    tcg_temp_free_vec(t);
+}
+
+static bool trans_UQSHRNB(DisasContext *s, arg_rri_esz *a)
+{
+    static const TCGOpcode vec_list[] = {
+        INDEX_op_shri_vec, INDEX_op_umin_vec, 0
+    };
+    static const GVecGen2i ops[3] = {
+        { .fniv = gen_uqshrnb_vec,
+          .opt_opc = vec_list,
+          .fno = gen_helper_sve2_uqshrnb_h,
+          .vece = MO_16 },
+        { .fniv = gen_uqshrnb_vec,
+          .opt_opc = vec_list,
+          .fno = gen_helper_sve2_uqshrnb_s,
+          .vece = MO_32 },
+        { .fniv = gen_uqshrnb_vec,
+          .opt_opc = vec_list,
+          .fno = gen_helper_sve2_uqshrnb_d,
+          .vece = MO_64 },
+    };
+    return do_sve2_shr_narrow(s, a, ops);
+}
+
+static void gen_uqshrnt_vec(unsigned vece, TCGv_vec d,
+                            TCGv_vec n, int64_t shr)
+{
+    TCGv_vec t = tcg_temp_new_vec_matching(d);
+    int halfbits = 4 << vece;
+
+    tcg_gen_shri_vec(vece, n, n, shr);
+    tcg_gen_dupi_vec(vece, t, MAKE_64BIT_MASK(0, halfbits));
+    tcg_gen_umin_vec(vece, n, n, t);
+    tcg_gen_shli_vec(vece, n, n, halfbits);
+    tcg_gen_bitsel_vec(vece, d, t, d, n);
+    tcg_temp_free_vec(t);
+}
+
+static bool trans_UQSHRNT(DisasContext *s, arg_rri_esz *a)
+{
+    static const TCGOpcode vec_list[] = {
+        INDEX_op_shli_vec, INDEX_op_shri_vec, INDEX_op_umin_vec, 0
+    };
+    static const GVecGen2i ops[3] = {
+        { .fniv = gen_uqshrnt_vec,
+          .opt_opc = vec_list,
+          .load_dest = true,
+          .fno = gen_helper_sve2_uqshrnt_h,
+          .vece = MO_16 },
+        { .fniv = gen_uqshrnt_vec,
+          .opt_opc = vec_list,
+          .load_dest = true,
+          .fno = gen_helper_sve2_uqshrnt_s,
+          .vece = MO_32 },
+        { .fniv = gen_uqshrnt_vec,
+          .opt_opc = vec_list,
+          .load_dest = true,
+          .fno = gen_helper_sve2_uqshrnt_d,
+          .vece = MO_64 },
+    };
+    return do_sve2_shr_narrow(s, a, ops);
+}
+
+static bool trans_UQRSHRNB(DisasContext *s, arg_rri_esz *a)
+{
+    static const GVecGen2i ops[3] = {
+        { .fno = gen_helper_sve2_uqrshrnb_h },
+        { .fno = gen_helper_sve2_uqrshrnb_s },
+        { .fno = gen_helper_sve2_uqrshrnb_d },
+    };
+    return do_sve2_shr_narrow(s, a, ops);
+}
+
+static bool trans_UQRSHRNT(DisasContext *s, arg_rri_esz *a)
+{
+    static const GVecGen2i ops[3] = {
+        { .fno = gen_helper_sve2_uqrshrnt_h },
+        { .fno = gen_helper_sve2_uqrshrnt_s },
+        { .fno = gen_helper_sve2_uqrshrnt_d },
+    };
+    return do_sve2_shr_narrow(s, a, ops);
+}
+
 static bool do_sve2_zpzz_fp(DisasContext *s, arg_rprr_esz *a,
                             gen_helper_gvec_4_ptr *fn)
 {
-- 
2.25.1


