Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C931362A13
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 23:20:05 +0200 (CEST)
Received: from localhost ([::1]:36718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXVsi-00010i-Iu
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 17:20:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXVcT-0004hM-U1
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 17:03:17 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:34737)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXVcO-0001HJ-CR
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 17:03:17 -0400
Received: by mail-pl1-x630.google.com with SMTP id t22so14309599ply.1
 for <qemu-devel@nongnu.org>; Fri, 16 Apr 2021 14:03:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=feb7AjyBXXqqzvqsPRxefar5HpBH8rI+phXQIUCl9Ao=;
 b=NQNd7eXzmQVt5EOEoPB5tRaIVLZZfzUjWBwdSf19+AT07omOIiHeUWBMh/iTGgSNaE
 598qqqGgx4dhdQd4KXNZBOmiNeFLM3vIAmYUIX9UQOkmcEQDJKZSoJjP2A7Z0Q/rbGx4
 beFbTHPEXoLDTgeVNoQJBDx+3XFLMv/61QMQIHMYyDZB7p2WjWKBSQpQceicN2SA9V2/
 T1GH3g6MkAyDFkRnaxJWP6JSPGlMHMVXnq9tHrm+fg6sI88Ztrh8Xv/RaHiQJdFTHK6S
 AQXdYSJbB9LF+l8oMY5flJ5L7gq6I9O3opaYaq5/B+A5HbjpL2WgJwW6WTIfcvtKAvuv
 3/Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=feb7AjyBXXqqzvqsPRxefar5HpBH8rI+phXQIUCl9Ao=;
 b=qJB3+31LrJF/IKBCioAY/oiXeWjOr0hpWnzG9nPyBpqOTEjPVVTU+R7gT112sJVKB2
 qCCi+GjtdKHhSesRpEeONg+RoqYssRSf4Hd9tD7ItwP+bWu+lijE2SryJlkkPwKwh/6X
 5Ar12YjIFID29FUsmVPHqyUAOTi/bkfjufVhrt8FrC8JKg48ZyOjUXhOKTWn47uBfbHn
 pfXmCO3CeGdeh/dKzhsaISetTCCQl3mY4gweUSdG0J4l1e450kp2bA2+U1oDvlENm0g6
 oMMxy0FzHqmsl6ZXGf8gD3XVLMrD67T2I19a4YyX+B43iK/nhh7W5Y3v6RjUg4pPamtW
 ZhhQ==
X-Gm-Message-State: AOAM531OLgo+rLCBZBf1qE+0i2QGHK+v0cfzuyOxmPMXZJrTBsIfBFTa
 ng8s8uPcKDDF2tvdR0MLaVESH7Qcei89Xw==
X-Google-Smtp-Source: ABdhPJzdr1JRdfPYoy80zaEUr8YDmhRa4anv3nn6uMDDIiXVT6HeUEtac11WxGL9VIhvJhXNGbST0A==
X-Received: by 2002:a17:90a:420d:: with SMTP id
 o13mr11782384pjg.61.1618606991103; 
 Fri, 16 Apr 2021 14:03:11 -0700 (PDT)
Received: from localhost.localdomain ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id m15sm5920640pjz.36.2021.04.16.14.03.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 14:03:10 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 29/81] target/arm: Implement SVE2 SQSHRN, SQRSHRN
Date: Fri, 16 Apr 2021 14:01:48 -0700
Message-Id: <20210416210240.1591291-30-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210416210240.1591291-1-richard.henderson@linaro.org>
References: <20210416210240.1591291-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
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

This completes the section "SVE2 bitwise shift right narrow".

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
index 175f3de08f..02e87c535d 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -1971,6 +1971,30 @@ DO_SHRNT(sve2_sqrshrunt_h, int16_t, uint8_t, H1_2, H1, DO_SQRSHRUN_H)
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
index 12733d9b4f..218f1ca5ce 100644
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


