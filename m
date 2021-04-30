Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DACC37025D
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 22:46:55 +0200 (CEST)
Received: from localhost ([::1]:51808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lca2I-0006Me-0b
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 16:46:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcZif-00005U-Ti
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 16:26:37 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e]:40629)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcZiO-00060l-Fw
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 16:26:37 -0400
Received: by mail-pg1-x52e.google.com with SMTP id y30so5010000pgl.7
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 13:26:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9m49cTBF+uBd2parMcxDIMwzzkCg+x47RKDDIpkpN1g=;
 b=bTQ4Ck02Aw/OMBO5R8SyMjU/NpjP6dsW7h9DcK/IzMVSegdn0V7u0h30oa4IuRuYF1
 WDyxUOhVBjrLK1ynXU2dZDS3LzEaRcF5tJPK/xReR5cFrBmk0+quTWVGIy4UdwOqSwkd
 pUBVpFrVHsxtB3z+GgPW1IDJJuE3wIheB5TD5xI1sUDCUjMCnDZhRW1gOC2Tn5w1mZYp
 kbbojrsAVGdWuf7di76a6EpoW237xqu972Yd6QoT7dOQ2PHqqR4TjnJJ08TGXhMFikrP
 aktyDM49hHSHof8d+g5j12GCDcXzq83Kr+MqJIm9NlmP/eQY4zpakScgLkLFlKSCzMGZ
 K15w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9m49cTBF+uBd2parMcxDIMwzzkCg+x47RKDDIpkpN1g=;
 b=Wvh+k+xF1MWYAlpkoeAO6lGm8J8fMSfzapWyv/7HxpESAeqoO399UInpLzF9vdzDzp
 zo1LYWSQwkIkFw/pQ333LcwI+FxaIDTFJVHv0OizQuVFQJi5y3yKJQuMXCc/aeK4MB6J
 QI2qovq1UGK6BvHO2hUQMK6fgThu5PYc5ufVUaxOaT4Ljj82gFHgPReR3Lv0nLEp+G3I
 zsY8umSj6f23pGhIfEhmRDcWMpa34FJRBZPCIVTAFF4IsPcqztk/h4KVk7sTBTmUQTon
 ToQM7LwB5B0F0S79zkLfXlyFDJX6hquZT0DHT8Uf50VRyvTS82/p/uKfyRCwMT7vdNFv
 iqvg==
X-Gm-Message-State: AOAM533woDq5DCe/wwPlNvs6QdbLmlFTcjZAq1rjtbMumCc7igjOB8IX
 QMxaiJhVetmlZll5QTwGV6nLwSs056Nu7g==
X-Google-Smtp-Source: ABdhPJz6AOETPafBEkQ3Pd0nduvGcLsIeULh0UnXKwWXdlfN1QREkR2FMwCwbDbshIN+k60clwMGPg==
X-Received: by 2002:a65:4985:: with SMTP id r5mr6205596pgs.65.1619814379125;
 Fri, 30 Apr 2021 13:26:19 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id e6sm2905257pfd.219.2021.04.30.13.26.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Apr 2021 13:26:18 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 13/82] target/arm: Implement SVE2 integer multiply long
Date: Fri, 30 Apr 2021 13:25:01 -0700
Message-Id: <20210430202610.1136687-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210430202610.1136687-1-richard.henderson@linaro.org>
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52e.google.com
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

Exclude PMULL from this category for the moment.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-sve.h    | 15 +++++++++++++++
 target/arm/sve.decode      |  9 +++++++++
 target/arm/sve_helper.c    | 31 +++++++++++++++++++++++++++++++
 target/arm/translate-sve.c |  9 +++++++++
 4 files changed, 64 insertions(+)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index 3286a9c205..ad8121eec6 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -2347,4 +2347,19 @@ DEF_HELPER_FLAGS_6(sve_stdd_le_zd_mte, TCG_CALL_NO_WG,
 DEF_HELPER_FLAGS_6(sve_stdd_be_zd_mte, TCG_CALL_NO_WG,
                    void, env, ptr, ptr, ptr, tl, i32)
 
+DEF_HELPER_FLAGS_4(sve2_sqdmull_zzz_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_sqdmull_zzz_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_sqdmull_zzz_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(sve2_smull_zzz_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_smull_zzz_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_smull_zzz_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(sve2_umull_zzz_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_umull_zzz_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_umull_zzz_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
 DEF_HELPER_FLAGS_4(sve2_pmull_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index f6f21426ef..d9a72b7661 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1196,3 +1196,12 @@ SSUBWB          01000101 .. 0 ..... 010 100 ..... .....  @rd_rn_rm
 SSUBWT          01000101 .. 0 ..... 010 101 ..... .....  @rd_rn_rm
 USUBWB          01000101 .. 0 ..... 010 110 ..... .....  @rd_rn_rm
 USUBWT          01000101 .. 0 ..... 010 111 ..... .....  @rd_rn_rm
+
+## SVE2 integer multiply long
+
+SQDMULLB_zzz    01000101 .. 0 ..... 011 000 ..... .....  @rd_rn_rm
+SQDMULLT_zzz    01000101 .. 0 ..... 011 001 ..... .....  @rd_rn_rm
+SMULLB_zzz      01000101 .. 0 ..... 011 100 ..... .....  @rd_rn_rm
+SMULLT_zzz      01000101 .. 0 ..... 011 101 ..... .....  @rd_rn_rm
+UMULLB_zzz      01000101 .. 0 ..... 011 110 ..... .....  @rd_rn_rm
+UMULLT_zzz      01000101 .. 0 ..... 011 111 ..... .....  @rd_rn_rm
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index cf0dbb3987..f30f3722af 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -1154,6 +1154,37 @@ DO_ZZZ_TB(sve2_uabdl_h, uint16_t, uint8_t, H1_2, H1, DO_ABD)
 DO_ZZZ_TB(sve2_uabdl_s, uint32_t, uint16_t, H1_4, H1_2, DO_ABD)
 DO_ZZZ_TB(sve2_uabdl_d, uint64_t, uint32_t,     , H1_4, DO_ABD)
 
+DO_ZZZ_TB(sve2_smull_zzz_h, int16_t, int8_t, H1_2, H1, DO_MUL)
+DO_ZZZ_TB(sve2_smull_zzz_s, int32_t, int16_t, H1_4, H1_2, DO_MUL)
+DO_ZZZ_TB(sve2_smull_zzz_d, int64_t, int32_t,     , H1_4, DO_MUL)
+
+DO_ZZZ_TB(sve2_umull_zzz_h, uint16_t, uint8_t, H1_2, H1, DO_MUL)
+DO_ZZZ_TB(sve2_umull_zzz_s, uint32_t, uint16_t, H1_4, H1_2, DO_MUL)
+DO_ZZZ_TB(sve2_umull_zzz_d, uint64_t, uint32_t,     , H1_4, DO_MUL)
+
+/* Note that the multiply cannot overflow, but the doubling can. */
+static inline int16_t do_sqdmull_h(int16_t n, int16_t m)
+{
+    int16_t val = n * m;
+    return DO_SQADD_H(val, val);
+}
+
+static inline int32_t do_sqdmull_s(int32_t n, int32_t m)
+{
+    int32_t val = n * m;
+    return DO_SQADD_S(val, val);
+}
+
+static inline int64_t do_sqdmull_d(int64_t n, int64_t m)
+{
+    int64_t val = n * m;
+    return do_sqadd_d(val, val);
+}
+
+DO_ZZZ_TB(sve2_sqdmull_zzz_h, int16_t, int8_t, H1_2, H1, do_sqdmull_h)
+DO_ZZZ_TB(sve2_sqdmull_zzz_s, int32_t, int16_t, H1_4, H1_2, do_sqdmull_s)
+DO_ZZZ_TB(sve2_sqdmull_zzz_d, int64_t, int32_t,     , H1_4, do_sqdmull_d)
+
 #undef DO_ZZZ_TB
 
 #define DO_ZZZ_WTB(NAME, TYPEW, TYPEN, HW, HN, OP) \
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 70900c122f..19a1f289d8 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -6021,6 +6021,15 @@ DO_SVE2_ZZZ_TB(SADDLBT, saddl, false, true)
 DO_SVE2_ZZZ_TB(SSUBLBT, ssubl, false, true)
 DO_SVE2_ZZZ_TB(SSUBLTB, ssubl, true, false)
 
+DO_SVE2_ZZZ_TB(SQDMULLB_zzz, sqdmull_zzz, false, false)
+DO_SVE2_ZZZ_TB(SQDMULLT_zzz, sqdmull_zzz, true, true)
+
+DO_SVE2_ZZZ_TB(SMULLB_zzz, smull_zzz, false, false)
+DO_SVE2_ZZZ_TB(SMULLT_zzz, smull_zzz, true, true)
+
+DO_SVE2_ZZZ_TB(UMULLB_zzz, umull_zzz, false, false)
+DO_SVE2_ZZZ_TB(UMULLT_zzz, umull_zzz, true, true)
+
 #define DO_SVE2_ZZZ_WTB(NAME, name, SEL2) \
 static bool trans_##NAME(DisasContext *s, arg_rrr_esz *a)       \
 {                                                               \
-- 
2.25.1


