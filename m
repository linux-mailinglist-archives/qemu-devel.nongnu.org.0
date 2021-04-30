Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E31A370267
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 22:49:52 +0200 (CEST)
Received: from localhost ([::1]:60436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lca59-0001VL-Fe
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 16:49:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcZig-00006C-9w
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 16:26:39 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:36519)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcZiR-00064o-Ly
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 16:26:38 -0400
Received: by mail-pl1-x62c.google.com with SMTP id a11so6346605plh.3
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 13:26:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xiy3OFu7y9n0lQLi1Ms0ijwf8zujYC8QTzkyT7iwC1M=;
 b=i2fK8TjwP6uYbhNmwc5I6y/pgBRv9UunHbJ/uw6M59HLSl8TA4ueHyB133fvFF8rOl
 pNm1tgr6FOhLg8tgPDXUn3v4I5JgkJS2fXgxgWFo1MWgBY+XFWIwMDMeha7SfndOs1w9
 YaAbXjjvD5v8qANRGwKHMyV5EH5IqFQeec4ez4j0ljGti2ZAlLnvf8tk32g8py4wc6nF
 ybNwR2BZqjkzOA/yLhUEVnTbPjHLJkhC4HsSjhtACmsDtgcg2kwP63+z/FqOJoW0qERm
 wICM0qtsbMg3XY6VOyMuLI1lz01tIwjShxNx0ZZkCNdrwTT1KxEAd1hfbDmMONvy3znw
 ix8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xiy3OFu7y9n0lQLi1Ms0ijwf8zujYC8QTzkyT7iwC1M=;
 b=aenn3oSLkj5WOQSrzqj7Vo7GTDAkdB9NpuEZJgMt5jJrZNcTIqralRdeL+bdOvtNuS
 v+KyzIlTC96+6SBAT5msdz/7kffG0jDO2w7YyvGnn4XWjpC4muGj/D2eBCoBQVWLnKPa
 t6ANIbYcWZ3ROk3tzg8axqVROdrkeEZm+kuxIhqXv59cTLaQ0bnmFDK1myIegEosY97z
 J8yLJGP2cMh1mBcAMefvJhllAi4Neyo4OIPNyYOZS/ZgC8qDB7hSBez++DcEsDGpuwnS
 vezkCQ/e6ql6UTdMcDWJ65sMhB4pzSvfRcD8Z++jTiV9eR+Td6wt7ZXcK2DiSEPdUDHN
 Nf/g==
X-Gm-Message-State: AOAM531Wq8WBTbkni0mXsfvhUIeWqULTsyBIe/mq292P7UO4OgXgmmAw
 mk5pxfcLWZQCDuLUg+Kg/rpIZo4e/AJtwQ==
X-Google-Smtp-Source: ABdhPJxggGkt7rtDxojUTGLpOF2jT5UxexBbsoLXhSQPlMv7BGWJAEfxIGsOMWb6qjLEzDriX5YphA==
X-Received: by 2002:a17:902:ed52:b029:ed:2f0e:eac with SMTP id
 y18-20020a170902ed52b02900ed2f0e0eacmr7107370plb.47.1619814382059; 
 Fri, 30 Apr 2021 13:26:22 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id e6sm2905257pfd.219.2021.04.30.13.26.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Apr 2021 13:26:21 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 18/82] target/arm: Implement SVE2 complex integer add
Date: Fri, 30 Apr 2021 13:25:06 -0700
Message-Id: <20210430202610.1136687-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210430202610.1136687-1-richard.henderson@linaro.org>
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
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
index d692d2fe3d..2e09c3e55b 100644
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
index da2f67fb67..c594c59954 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -6285,3 +6285,34 @@ static bool trans_BGRP(DisasContext *s, arg_rrr_esz *a)
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


