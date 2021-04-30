Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2940137025B
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 22:46:14 +0200 (CEST)
Received: from localhost ([::1]:50322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lca1d-0005k3-5F
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 16:46:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcZil-0000CK-8i
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 16:26:43 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:51117)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcZiS-00065G-3R
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 16:26:42 -0400
Received: by mail-pj1-x1031.google.com with SMTP id md17so9636735pjb.0
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 13:26:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=85QbQRD/kjbvj7H0EZGYuJDct9yXvao73Ho7HNCSiAg=;
 b=SMmdK9fOkuJImFrSh7pN0lLnuPymMMYaIPqlGkj0QxHw6FPjHGgclriG8WvhiYo079
 SgTmmFDdNt7GSEhV3rS2WMBKguDf64Vvp9lHgXbkYinjjmtWQWoVnD6BLwEmmWWhRpAP
 MWl5+0saB8kYu2eVMR790IXvLam6ETqXnOOHMsBfv+WSkUv3kkfL96G3cw0tiogzmFWt
 Cal/QbKifdk7yco2fHhzYYiv4D6+tEzGlwIWJp8jfEDg4gu2++h7tB1KE2uNJamtPN4E
 3HVw/cL2dO0644lrFG+zy4IgbxBiwkAY1LaJf9HF2dTXkPvh7nnvYNZJCy86fubFGVhv
 LXLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=85QbQRD/kjbvj7H0EZGYuJDct9yXvao73Ho7HNCSiAg=;
 b=pFGIZJS74+hMfzATM02tP/Jilrfxy49Qi0olKtzNDYkxzltlUCZeKolghwYhKmmUWw
 qgMbCf7ili/GaYWJaXvGvHVSLfcpJql8uaGlsQIjUGMmCkDPE9Kc8CkySUv+CUk7V2xZ
 vmwbeVgHg0gVXl7Z3zvvdHWBr+mIOWZurWAf64LFRKy4GNoMDRFn7F1iqdKP97YkCYzC
 6erXJYs2gPlcNk850fVVQuModyixCeCNmZ9gJavC2nXBTQnYPfFF2qdZvioyG4ce9ALC
 Y3R+7g5liYhJOIigT0+iZA6OnWsukyL1xQf1vJLP0uRYlcMAUKVM+pcJ+s94L3NUgZVi
 vAVQ==
X-Gm-Message-State: AOAM533EVNy0FN5zC1I5Q0U0GQ+XEzhKZSSySU8VwZFxUHx+omiym9Yt
 rB/dsZQx/YAQYmHm5p9NtAu6Xo40Eysvrw==
X-Google-Smtp-Source: ABdhPJwpXQm12Kh7agzfQO5V+RC0FHqikiweCFBfiKgtAO7sJQz1Zp96wwqhh2IQ7K/mGvgXYfOifQ==
X-Received: by 2002:a17:90b:3884:: with SMTP id
 mu4mr4600727pjb.150.1619814382642; 
 Fri, 30 Apr 2021 13:26:22 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id e6sm2905257pfd.219.2021.04.30.13.26.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Apr 2021 13:26:22 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 19/82] target/arm: Implement SVE2 integer absolute
 difference and accumulate long
Date: Fri, 30 Apr 2021 13:25:07 -0700
Message-Id: <20210430202610.1136687-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210430202610.1136687-1-richard.henderson@linaro.org>
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v2: Fix select offsetting and argument order (laurent desnogues).
---
 target/arm/helper-sve.h    | 14 ++++++++++
 target/arm/sve.decode      | 12 +++++++++
 target/arm/sve_helper.c    | 23 ++++++++++++++++
 target/arm/translate-sve.c | 55 ++++++++++++++++++++++++++++++++++++++
 4 files changed, 104 insertions(+)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index c2155cc544..229fb396b2 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -2402,3 +2402,17 @@ DEF_HELPER_FLAGS_4(sve2_sqcadd_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(sve2_sqcadd_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(sve2_sqcadd_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(sve2_sqcadd_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_5(sve2_sabal_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_sabal_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_sabal_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_5(sve2_uabal_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_uabal_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_uabal_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 7508b901d0..56b7353bfa 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -70,6 +70,7 @@
 &rpr_s          rd pg rn s
 &rprr_s         rd pg rn rm s
 &rprr_esz       rd pg rn rm esz
+&rrrr_esz       rd ra rn rm esz
 &rprrr_esz      rd pg rn rm ra esz
 &rpri_esz       rd pg rn imm esz
 &ptrue          rd esz pat s
@@ -119,6 +120,10 @@
 @rdn_i8s        ........ esz:2 ...... ... imm:s8 rd:5 \
                 &rri_esz rn=%reg_movprfx
 
+# Four operand, vector element size
+@rda_rn_rm      ........ esz:2 . rm:5 ... ... rn:5 rd:5 \
+                &rrrr_esz ra=%reg_movprfx
+
 # Three operand with "memory" size, aka immediate left shift
 @rd_rn_msz_rm   ........ ... rm:5 .... imm:2 rn:5 rd:5          &rrri
 
@@ -1235,3 +1240,10 @@ CADD_rot90      01000101 .. 00000 0 11011 0 ..... .....  @rdn_rm
 CADD_rot270     01000101 .. 00000 0 11011 1 ..... .....  @rdn_rm
 SQCADD_rot90    01000101 .. 00000 1 11011 0 ..... .....  @rdn_rm
 SQCADD_rot270   01000101 .. 00000 1 11011 1 ..... .....  @rdn_rm
+
+## SVE2 integer absolute difference and accumulate long
+
+SABALB          01000101 .. 0 ..... 1100 00 ..... .....  @rda_rn_rm
+SABALT          01000101 .. 0 ..... 1100 01 ..... .....  @rda_rn_rm
+UABALB          01000101 .. 0 ..... 1100 10 ..... .....  @rda_rn_rm
+UABALT          01000101 .. 0 ..... 1100 11 ..... .....  @rda_rn_rm
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 2e09c3e55b..4871e90d9b 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -1241,6 +1241,29 @@ DO_ZZZ_NTB(sve2_eoril_d, uint64_t,     , DO_EOR)
 
 #undef DO_ZZZ_NTB
 
+#define DO_ZZZW_ACC(NAME, TYPEW, TYPEN, HW, HN, OP) \
+void HELPER(NAME)(void *vd, void *vn, void *vm, void *va, uint32_t desc) \
+{                                                               \
+    intptr_t i, opr_sz = simd_oprsz(desc);                      \
+    intptr_t sel1 = simd_data(desc) * sizeof(TYPEN);            \
+    for (i = 0; i < opr_sz; i += sizeof(TYPEW)) {               \
+        TYPEW nn = *(TYPEN *)(vn + HN(i + sel1));               \
+        TYPEW mm = *(TYPEN *)(vm + HN(i + sel1));               \
+        TYPEW aa = *(TYPEW *)(va + HW(i));                      \
+        *(TYPEW *)(vd + HW(i)) = OP(nn, mm) + aa;               \
+    }                                                           \
+}
+
+DO_ZZZW_ACC(sve2_sabal_h, int16_t, int8_t, H1_2, H1, DO_ABD)
+DO_ZZZW_ACC(sve2_sabal_s, int32_t, int16_t, H1_4, H1_2, DO_ABD)
+DO_ZZZW_ACC(sve2_sabal_d, int64_t, int32_t,     , H1_4, DO_ABD)
+
+DO_ZZZW_ACC(sve2_uabal_h, uint16_t, uint8_t, H1_2, H1, DO_ABD)
+DO_ZZZW_ACC(sve2_uabal_s, uint32_t, uint16_t, H1_4, H1_2, DO_ABD)
+DO_ZZZW_ACC(sve2_uabal_d, uint64_t, uint32_t,     , H1_4, DO_ABD)
+
+#undef DO_ZZZW_ACC
+
 #define DO_BITPERM(NAME, TYPE, OP) \
 void HELPER(NAME)(void *vd, void *vn, void *vm, uint32_t desc) \
 {                                                              \
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index c594c59954..6ac50fd61f 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -163,6 +163,18 @@ static void gen_gvec_ool_zzz(DisasContext *s, gen_helper_gvec_3 *fn,
                        vsz, vsz, data, fn);
 }
 
+/* Invoke an out-of-line helper on 4 Zregs. */
+static void gen_gvec_ool_zzzz(DisasContext *s, gen_helper_gvec_4 *fn,
+                              int rd, int rn, int rm, int ra, int data)
+{
+    unsigned vsz = vec_full_reg_size(s);
+    tcg_gen_gvec_4_ool(vec_full_reg_offset(s, rd),
+                       vec_full_reg_offset(s, rn),
+                       vec_full_reg_offset(s, rm),
+                       vec_full_reg_offset(s, ra),
+                       vsz, vsz, data, fn);
+}
+
 /* Invoke an out-of-line helper on 2 Zregs and a predicate. */
 static void gen_gvec_ool_zzp(DisasContext *s, gen_helper_gvec_3 *fn,
                              int rd, int rn, int pg, int data)
@@ -6316,3 +6328,46 @@ static bool trans_SQCADD_rot270(DisasContext *s, arg_rrr_esz *a)
 {
     return do_cadd(s, a, true, true);
 }
+
+static bool do_sve2_zzzz_ool(DisasContext *s, arg_rrrr_esz *a,
+                             gen_helper_gvec_4 *fn, int data)
+{
+    if (fn == NULL || !dc_isar_feature(aa64_sve2, s)) {
+        return false;
+    }
+    if (sve_access_check(s)) {
+        gen_gvec_ool_zzzz(s, fn, a->rd, a->rn, a->rm, a->ra, data);
+    }
+    return true;
+}
+
+static bool do_abal(DisasContext *s, arg_rrrr_esz *a, bool uns, bool sel)
+{
+    static gen_helper_gvec_4 * const fns[2][4] = {
+        { NULL,                    gen_helper_sve2_sabal_h,
+          gen_helper_sve2_sabal_s, gen_helper_sve2_sabal_d },
+        { NULL,                    gen_helper_sve2_uabal_h,
+          gen_helper_sve2_uabal_s, gen_helper_sve2_uabal_d },
+    };
+    return do_sve2_zzzz_ool(s, a, fns[uns][a->esz], sel);
+}
+
+static bool trans_SABALB(DisasContext *s, arg_rrrr_esz *a)
+{
+    return do_abal(s, a, false, false);
+}
+
+static bool trans_SABALT(DisasContext *s, arg_rrrr_esz *a)
+{
+    return do_abal(s, a, false, true);
+}
+
+static bool trans_UABALB(DisasContext *s, arg_rrrr_esz *a)
+{
+    return do_abal(s, a, true, false);
+}
+
+static bool trans_UABALT(DisasContext *s, arg_rrrr_esz *a)
+{
+    return do_abal(s, a, true, true);
+}
-- 
2.25.1


