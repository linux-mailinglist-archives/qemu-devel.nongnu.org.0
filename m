Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE558332D86
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 18:46:10 +0100 (CET)
Received: from localhost ([::1]:51170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJgQr-000709-QD
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 12:46:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lJf6j-0007MO-Em
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 11:21:21 -0500
Received: from mail-oo1-xc30.google.com ([2607:f8b0:4864:20::c30]:39830)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lJf6X-0002Sy-E0
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 11:21:17 -0500
Received: by mail-oo1-xc30.google.com with SMTP id i11so3175307ood.6
 for <qemu-devel@nongnu.org>; Tue, 09 Mar 2021 08:21:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rDEY1GrPbC6zgYAZ0Uc0BKJUrlnah2xC2PMQNWF2rHg=;
 b=fsQlb2ve2NwjOuuXAEO7JyEDSrXnwhH7Wck4bjfEaaSKfyO9LKgFWyhljSkyCbSyR0
 Vlr5xvo7D3p54uctpQksLlcQQe1EAJJfQtc9/DBhzU47quesGnJhmyERrZKDZocmjrCO
 NfKcVdtaOd2KDXiUw5GKAiOAzQC9+v9Da5xh5mGXL2cDbEvis09ITW30mX/RMzPToETn
 ozV6S/cXY2Txd99Q1pNj+0CwfyzNaTShSgZtBVF/x3mxdnlMFOZnlbWd47TdpNHCoMp3
 vuEMP6qwq3oODARRvge9zLarU/MWwHXhUWE4Z/fCYYdAvb5dlnrEzhDQscNWFxT3P89B
 Hv8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rDEY1GrPbC6zgYAZ0Uc0BKJUrlnah2xC2PMQNWF2rHg=;
 b=r4Y7USkYmgVWgi3RXtwSuqIiAj2kiBfXJEupev6uXWhoJ+L1uG0Phq1GVbO3G1s5CA
 Ow5h2hHHnHWArH/xhErMedfxiulx+xSkILYNTlBaeqjCp+tGlpvtWlJpJAr2lGYGSHOq
 dJm6HkBGjAb1+QAJeravxHRDMD374/skIJzg3qZTUnJ+yR6CNzsPntyQ8os+oCFSATQa
 nuIoWPmVJg9mYu4BPtUHYG8K1vIIDhaeeAKfj17i2YLvgJ7ylptmUzmzxkzBRqPOmTrg
 VyULbct1GOBsR0psPj4S5zp5jgPfIfzDkllUzDYK1cwbkRmuSqBwmG9VMGUnZQvuOQlG
 ZQ/A==
X-Gm-Message-State: AOAM5339BbPlEYYKRPKW1hHAmuNnuQ81Ub4qX8ugIrx8qw1SyDBagMKA
 lmudbQTligBIbixmkx2tzqGza05ToWhc7dgM
X-Google-Smtp-Source: ABdhPJzMuv5pq7S2RHMfjRM75EiZyJP/W7W5x2x/7BwQPtjrqCk+ICtRwDc6ZqFumuKQcjJLcgb03g==
X-Received: by 2002:a4a:e2c6:: with SMTP id l6mr22918563oot.31.1615306863209; 
 Tue, 09 Mar 2021 08:21:03 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id v23sm2516474ots.63.2021.03.09.08.21.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Mar 2021 08:21:02 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 18/78] target/arm: Implement SVE2 complex integer add
Date: Tue,  9 Mar 2021 08:19:41 -0800
Message-Id: <20210309162041.23124-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210309162041.23124-1-richard.henderson@linaro.org>
References: <20210309162041.23124-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c30;
 envelope-from=richard.henderson@linaro.org; helo=mail-oo1-xc30.google.com
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v2: Fix subtraction ordering (laurent desnogues).
---
 target/arm/helper-sve.h    | 10 +++++++++
 target/arm/sve.decode      |  9 ++++++++
 target/arm/sve_helper.c    | 42 ++++++++++++++++++++++++++++++++++++++
 target/arm/translate-sve.c | 31 ++++++++++++++++++++++++++++
 4 files changed, 92 insertions(+)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index 4861481fe0..c2155cc544 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -2392,3 +2392,13 @@ DEF_HELPER_FLAGS_4(sve2_bgrp_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(sve2_bgrp_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(sve2_bgrp_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(sve2_bgrp_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(sve2_cadd_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_cadd_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_cadd_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_cadd_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(sve2_sqcadd_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_sqcadd_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_sqcadd_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_sqcadd_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 7cb89a0d47..7508b901d0 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1226,3 +1226,12 @@ EORTB           01000101 .. 0 ..... 10010 1 ..... .....  @rd_rn_rm
 BEXT            01000101 .. 0 ..... 1011 00 ..... .....  @rd_rn_rm
 BDEP            01000101 .. 0 ..... 1011 01 ..... .....  @rd_rn_rm
 BGRP            01000101 .. 0 ..... 1011 10 ..... .....  @rd_rn_rm
+
+#### SVE2 Accumulate
+
+## SVE2 complex integer add
+
+CADD_rot90      01000101 .. 00000 0 11011 0 ..... .....  @rdn_rm
+CADD_rot270     01000101 .. 00000 0 11011 1 ..... .....  @rdn_rm
+SQCADD_rot90    01000101 .. 00000 1 11011 0 ..... .....  @rdn_rm
+SQCADD_rot270   01000101 .. 00000 1 11011 1 ..... .....  @rdn_rm
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index ef9d40591a..6d70d10701 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -1314,6 +1314,48 @@ DO_BITPERM(sve2_bgrp_d, uint64_t, bitgroup)
 
 #undef DO_BITPERM
 
+#define DO_CADD(NAME, TYPE, H, ADD_OP, SUB_OP)                  \
+void HELPER(NAME)(void *vd, void *vn, void *vm, uint32_t desc)  \
+{                                                               \
+    intptr_t i, opr_sz = simd_oprsz(desc);                      \
+    int sub_r = simd_data(desc);                                \
+    if (sub_r) {                                                \
+        for (i = 0; i < opr_sz; i += 2 * sizeof(TYPE)) {        \
+            TYPE acc_r = *(TYPE *)(vn + H(i));                  \
+            TYPE acc_i = *(TYPE *)(vn + H(i + sizeof(TYPE)));   \
+            TYPE el2_r = *(TYPE *)(vm + H(i));                  \
+            TYPE el2_i = *(TYPE *)(vm + H(i + sizeof(TYPE)));   \
+            acc_r = ADD_OP(acc_r, el2_i);                       \
+            acc_i = SUB_OP(acc_i, el2_r);                       \
+            *(TYPE *)(vd + H(i)) = acc_r;                       \
+            *(TYPE *)(vd + H(i + sizeof(TYPE))) = acc_i;        \
+        }                                                       \
+    } else {                                                    \
+        for (i = 0; i < opr_sz; i += 2 * sizeof(TYPE)) {        \
+            TYPE acc_r = *(TYPE *)(vn + H(i));                  \
+            TYPE acc_i = *(TYPE *)(vn + H(i + sizeof(TYPE)));   \
+            TYPE el2_r = *(TYPE *)(vm + H(i));                  \
+            TYPE el2_i = *(TYPE *)(vm + H(i + sizeof(TYPE)));   \
+            acc_r = SUB_OP(acc_r, el2_i);                       \
+            acc_i = ADD_OP(acc_i, el2_r);                       \
+            *(TYPE *)(vd + H(i)) = acc_r;                       \
+            *(TYPE *)(vd + H(i + sizeof(TYPE))) = acc_i;        \
+        }                                                       \
+    }                                                           \
+}
+
+DO_CADD(sve2_cadd_b, int8_t, H1, DO_ADD, DO_SUB)
+DO_CADD(sve2_cadd_h, int16_t, H1_2, DO_ADD, DO_SUB)
+DO_CADD(sve2_cadd_s, int32_t, H1_4, DO_ADD, DO_SUB)
+DO_CADD(sve2_cadd_d, int64_t,     , DO_ADD, DO_SUB)
+
+DO_CADD(sve2_sqcadd_b, int8_t, H1, DO_SQADD_B, DO_SQSUB_B)
+DO_CADD(sve2_sqcadd_h, int16_t, H1_2, DO_SQADD_H, DO_SQSUB_H)
+DO_CADD(sve2_sqcadd_s, int32_t, H1_4, DO_SQADD_S, DO_SQSUB_S)
+DO_CADD(sve2_sqcadd_d, int64_t,     , do_sqadd_d, do_sqsub_d)
+
+#undef DO_CADD
+
 #define DO_ZZI_SHLL(NAME, TYPEW, TYPEN, HW, HN) \
 void HELPER(NAME)(void *vd, void *vn, uint32_t desc)           \
 {                                                              \
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 06812405f2..e4eca9f16d 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -6286,3 +6286,34 @@ static bool trans_BGRP(DisasContext *s, arg_rrr_esz *a)
     }
     return do_sve2_zzw_ool(s, a, fns[a->esz], 0);
 }
+
+static bool do_cadd(DisasContext *s, arg_rrr_esz *a, bool sq, bool rot)
+{
+    static gen_helper_gvec_3 * const fns[2][4] = {
+        { gen_helper_sve2_cadd_b, gen_helper_sve2_cadd_h,
+          gen_helper_sve2_cadd_s, gen_helper_sve2_cadd_d },
+        { gen_helper_sve2_sqcadd_b, gen_helper_sve2_sqcadd_h,
+          gen_helper_sve2_sqcadd_s, gen_helper_sve2_sqcadd_d },
+    };
+    return do_sve2_zzw_ool(s, a, fns[sq][a->esz], rot);
+}
+
+static bool trans_CADD_rot90(DisasContext *s, arg_rrr_esz *a)
+{
+    return do_cadd(s, a, false, false);
+}
+
+static bool trans_CADD_rot270(DisasContext *s, arg_rrr_esz *a)
+{
+    return do_cadd(s, a, false, true);
+}
+
+static bool trans_SQCADD_rot90(DisasContext *s, arg_rrr_esz *a)
+{
+    return do_cadd(s, a, true, false);
+}
+
+static bool trans_SQCADD_rot270(DisasContext *s, arg_rrr_esz *a)
+{
+    return do_cadd(s, a, true, true);
+}
-- 
2.25.1


