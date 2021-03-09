Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 897FD332CEC
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 18:11:43 +0100 (CET)
Received: from localhost ([::1]:41024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJftW-0001iu-HI
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 12:11:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lJf6Y-00077R-Av
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 11:21:07 -0500
Received: from mail-oi1-x232.google.com ([2607:f8b0:4864:20::232]:37259)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lJf6M-0002Qj-OH
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 11:21:06 -0500
Received: by mail-oi1-x232.google.com with SMTP id u198so10576577oia.4
 for <qemu-devel@nongnu.org>; Tue, 09 Mar 2021 08:20:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gB6zuzZoOjocfFDpiWWgFoXH2tOq/6UVbrgzv+51ugs=;
 b=y9ZfojB76qCbWjQKLtK+nTRbWBPSBOPiVteUu+D2yCyGSpBOSTQ/XPkIM+TnepbAwA
 K5eyrCt74FCBLnOrVnhxfH416/moytrP0PVJZ31ZqerEWi7ZxPBTKL0bac1nFu0eBDSd
 ZJvicWgLMAUCIk1ZOmPa5rtLWZ7gumPj+DQAKLpGZBlzSj49jf8ZAyk8B2I3AQjhDMfM
 yyRiT1QzvAb9ZCpo4x3his80XP8KocqVle34g1BcfLZ+fS5BfL8hMpX7ssMsEm6tC1+b
 pbVZs3/Y7/Jz17XvGC3oSZWw/bRmHRrrYQGfHB4SxRglkbmQ35QWiBLPzbLhSiMYVL6e
 6Dww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gB6zuzZoOjocfFDpiWWgFoXH2tOq/6UVbrgzv+51ugs=;
 b=RFHu75/5QJWBEYWdV0OX/xop6g6HB0/72aAJ55vX02J8wQq9bdJYQekuB7IkTmkdfh
 1lrx+ZGfM+kSykEYDXZExo0VEa0Kf3yN1gdcmK+Tss24sngR01p/sIlY4Vjk6OkLwe7A
 b66/dDBzv80DRtTEXvQMRRjMweGAvcV0Q5BLssegTcaBzJiuKvdQDmWquKZtPRkY+Au5
 8RDE+cKwd+fV8XPfPsPlNNaJBjfO1C+7oB43jvcN5K4di1DPMPwjHfzt/6ucxZGh+T6O
 sI9rRuMw735NTnTFCPB9t70Omoeq3T4MesfXe6U6jXsPTpDiTZxzzMsUawnSHWo8K7hn
 z9TA==
X-Gm-Message-State: AOAM530EnNmF5zxOQg0lD6S0HACVivSu4sKOLRI3rLaQTYKBiRBYfxeS
 Sg7ZoU3gs1ti82+UXICmgNo9IrLsjN/Sq+X6
X-Google-Smtp-Source: ABdhPJyf/WgBf60gf1xwI2fey8j9c9rzCHrRnjW0a7mTD0CH+BgRvJ+Er2N20TPM3IFagTwS6AjeaQ==
X-Received: by 2002:aca:d6d3:: with SMTP id n202mr3547619oig.175.1615306853699; 
 Tue, 09 Mar 2021 08:20:53 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id v23sm2516474ots.63.2021.03.09.08.20.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Mar 2021 08:20:53 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 09/78] target/arm: Implement SVE2 saturating add/subtract
 (predicated)
Date: Tue,  9 Mar 2021 08:19:32 -0800
Message-Id: <20210309162041.23124-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210309162041.23124-1-richard.henderson@linaro.org>
References: <20210309162041.23124-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::232;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x232.google.com
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
 target/arm/helper-sve.h    |  54 +++++++++++
 target/arm/sve.decode      |  11 +++
 target/arm/sve_helper.c    | 194 ++++++++++++++++++++++++++-----------
 target/arm/translate-sve.c |   7 ++
 4 files changed, 210 insertions(+), 56 deletions(-)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index 09bc067dd4..37461c9927 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -371,6 +371,60 @@ DEF_HELPER_FLAGS_5(sve2_uminp_zpzz_s, TCG_CALL_NO_RWG,
 DEF_HELPER_FLAGS_5(sve2_uminp_zpzz_d, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
 
+DEF_HELPER_FLAGS_5(sve2_sqadd_zpzz_b, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_sqadd_zpzz_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_sqadd_zpzz_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_sqadd_zpzz_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_5(sve2_uqadd_zpzz_b, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_uqadd_zpzz_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_uqadd_zpzz_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_uqadd_zpzz_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_5(sve2_sqsub_zpzz_b, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_sqsub_zpzz_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_sqsub_zpzz_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_sqsub_zpzz_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_5(sve2_uqsub_zpzz_b, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_uqsub_zpzz_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_uqsub_zpzz_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_uqsub_zpzz_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_5(sve2_suqadd_zpzz_b, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_suqadd_zpzz_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_suqadd_zpzz_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_suqadd_zpzz_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_5(sve2_usqadd_zpzz_b, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_usqadd_zpzz_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_usqadd_zpzz_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_usqadd_zpzz_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+
 DEF_HELPER_FLAGS_5(sve_asr_zpzw_b, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(sve_asr_zpzw_h, TCG_CALL_NO_RWG,
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 61a3321325..cd4f73265f 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1148,3 +1148,14 @@ SMAXP           01000100 .. 010 100 101 ... ..... .....  @rdn_pg_rm
 UMAXP           01000100 .. 010 101 101 ... ..... .....  @rdn_pg_rm
 SMINP           01000100 .. 010 110 101 ... ..... .....  @rdn_pg_rm
 UMINP           01000100 .. 010 111 101 ... ..... .....  @rdn_pg_rm
+
+### SVE2 saturating add/subtract (predicated)
+
+SQADD_zpzz      01000100 .. 011 000 100 ... ..... .....  @rdn_pg_rm
+UQADD_zpzz      01000100 .. 011 001 100 ... ..... .....  @rdn_pg_rm
+SQSUB_zpzz      01000100 .. 011 010 100 ... ..... .....  @rdn_pg_rm
+UQSUB_zpzz      01000100 .. 011 011 100 ... ..... .....  @rdn_pg_rm
+SUQADD          01000100 .. 011 100 100 ... ..... .....  @rdn_pg_rm
+USQADD          01000100 .. 011 101 100 ... ..... .....  @rdn_pg_rm
+SQSUB_zpzz      01000100 .. 011 110 100 ... ..... .....  @rdm_pg_rn # SQSUBR
+UQSUB_zpzz      01000100 .. 011 111 100 ... ..... .....  @rdm_pg_rn # UQSUBR
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 19ae7722f0..009d49e81d 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -678,6 +678,135 @@ DO_ZPZZ(sve2_uhsub_zpzz_h, uint16_t, H1_2, DO_HSUB_BHS)
 DO_ZPZZ(sve2_uhsub_zpzz_s, uint32_t, H1_4, DO_HSUB_BHS)
 DO_ZPZZ_D(sve2_uhsub_zpzz_d, uint64_t, DO_HSUB_D)
 
+static inline int32_t do_sat_bhs(int64_t val, int64_t min, int64_t max)
+{
+    return val >= max ? max : val <= min ? min : val;
+}
+
+#define DO_SQADD_B(n, m) do_sat_bhs((int64_t)n + m, INT8_MIN, INT8_MAX)
+#define DO_SQADD_H(n, m) do_sat_bhs((int64_t)n + m, INT16_MIN, INT16_MAX)
+#define DO_SQADD_S(n, m) do_sat_bhs((int64_t)n + m, INT32_MIN, INT32_MAX)
+
+static inline int64_t do_sqadd_d(int64_t n, int64_t m)
+{
+    int64_t r = n + m;
+    if (((r ^ n) & ~(n ^ m)) < 0) {
+        /* Signed overflow.  */
+        return r < 0 ? INT64_MAX : INT64_MIN;
+    }
+    return r;
+}
+
+DO_ZPZZ(sve2_sqadd_zpzz_b, int8_t, H1_2, DO_SQADD_B)
+DO_ZPZZ(sve2_sqadd_zpzz_h, int16_t, H1_2, DO_SQADD_H)
+DO_ZPZZ(sve2_sqadd_zpzz_s, int32_t, H1_4, DO_SQADD_S)
+DO_ZPZZ_D(sve2_sqadd_zpzz_d, int64_t, do_sqadd_d)
+
+#define DO_UQADD_B(n, m) do_sat_bhs((int64_t)n + m, 0, UINT8_MAX)
+#define DO_UQADD_H(n, m) do_sat_bhs((int64_t)n + m, 0, UINT16_MAX)
+#define DO_UQADD_S(n, m) do_sat_bhs((int64_t)n + m, 0, UINT32_MAX)
+
+static inline uint64_t do_uqadd_d(uint64_t n, uint64_t m)
+{
+    uint64_t r = n + m;
+    return r < n ? UINT64_MAX : r;
+}
+
+DO_ZPZZ(sve2_uqadd_zpzz_b, uint8_t, H1_2, DO_UQADD_B)
+DO_ZPZZ(sve2_uqadd_zpzz_h, uint16_t, H1_2, DO_UQADD_H)
+DO_ZPZZ(sve2_uqadd_zpzz_s, uint32_t, H1_4, DO_UQADD_S)
+DO_ZPZZ_D(sve2_uqadd_zpzz_d, uint64_t, do_uqadd_d)
+
+#define DO_SQSUB_B(n, m) do_sat_bhs((int64_t)n - m, INT8_MIN, INT8_MAX)
+#define DO_SQSUB_H(n, m) do_sat_bhs((int64_t)n - m, INT16_MIN, INT16_MAX)
+#define DO_SQSUB_S(n, m) do_sat_bhs((int64_t)n - m, INT32_MIN, INT32_MAX)
+
+static inline int64_t do_sqsub_d(int64_t n, int64_t m)
+{
+    int64_t r = n - m;
+    if (((r ^ n) & (n ^ m)) < 0) {
+        /* Signed overflow.  */
+        return r < 0 ? INT64_MAX : INT64_MIN;
+    }
+    return r;
+}
+
+DO_ZPZZ(sve2_sqsub_zpzz_b, int8_t, H1_2, DO_SQSUB_B)
+DO_ZPZZ(sve2_sqsub_zpzz_h, int16_t, H1_2, DO_SQSUB_H)
+DO_ZPZZ(sve2_sqsub_zpzz_s, int32_t, H1_4, DO_SQSUB_S)
+DO_ZPZZ_D(sve2_sqsub_zpzz_d, int64_t, do_sqsub_d)
+
+#define DO_UQSUB_B(n, m) do_sat_bhs((int64_t)n - m, 0, UINT8_MAX)
+#define DO_UQSUB_H(n, m) do_sat_bhs((int64_t)n - m, 0, UINT16_MAX)
+#define DO_UQSUB_S(n, m) do_sat_bhs((int64_t)n - m, 0, UINT32_MAX)
+
+static inline uint64_t do_uqsub_d(uint64_t n, uint64_t m)
+{
+    return n > m ? n - m : 0;
+}
+
+DO_ZPZZ(sve2_uqsub_zpzz_b, uint8_t, H1_2, DO_UQSUB_B)
+DO_ZPZZ(sve2_uqsub_zpzz_h, uint16_t, H1_2, DO_UQSUB_H)
+DO_ZPZZ(sve2_uqsub_zpzz_s, uint32_t, H1_4, DO_UQSUB_S)
+DO_ZPZZ_D(sve2_uqsub_zpzz_d, uint64_t, do_uqsub_d)
+
+#define DO_SUQADD_B(n, m) \
+    do_sat_bhs((int64_t)(int8_t)n + m, INT8_MIN, INT8_MAX)
+#define DO_SUQADD_H(n, m) \
+    do_sat_bhs((int64_t)(int16_t)n + m, INT16_MIN, INT16_MAX)
+#define DO_SUQADD_S(n, m) \
+    do_sat_bhs((int64_t)(int32_t)n + m, INT32_MIN, INT32_MAX)
+
+static inline int64_t do_suqadd_d(int64_t n, uint64_t m)
+{
+    uint64_t r = n + m;
+
+    if (n < 0) {
+        /* Note that m - abs(n) cannot underflow. */
+        if (r > INT64_MAX) {
+            /* Result is either very large positive or negative. */
+            if (m > -n) {
+                /* m > abs(n), so r is a very large positive. */
+                return INT64_MAX;
+            }
+            /* Result is negative. */
+        }
+    } else {
+        /* Both inputs are positive: check for overflow.  */
+        if (r < m || r > INT64_MAX) {
+            return INT64_MAX;
+        }
+    }
+    return r;
+}
+
+DO_ZPZZ(sve2_suqadd_zpzz_b, uint8_t, H1_2, DO_SUQADD_B)
+DO_ZPZZ(sve2_suqadd_zpzz_h, uint16_t, H1_2, DO_SUQADD_H)
+DO_ZPZZ(sve2_suqadd_zpzz_s, uint32_t, H1_4, DO_SUQADD_S)
+DO_ZPZZ_D(sve2_suqadd_zpzz_d, uint64_t, do_suqadd_d)
+
+#define DO_USQADD_B(n, m) \
+    do_sat_bhs((int64_t)n + (int8_t)m, 0, UINT8_MAX)
+#define DO_USQADD_H(n, m) \
+    do_sat_bhs((int64_t)n + (int16_t)m, 0, UINT16_MAX)
+#define DO_USQADD_S(n, m) \
+    do_sat_bhs((int64_t)n + (int32_t)m, 0, UINT32_MAX)
+
+static inline uint64_t do_usqadd_d(uint64_t n, int64_t m)
+{
+    uint64_t r = n + m;
+
+    if (m < 0) {
+        return n < -m ? 0 : r;
+    }
+    return r < n ? UINT64_MAX : r;
+}
+
+DO_ZPZZ(sve2_usqadd_zpzz_b, uint8_t, H1_2, DO_USQADD_B)
+DO_ZPZZ(sve2_usqadd_zpzz_h, uint16_t, H1_2, DO_USQADD_H)
+DO_ZPZZ(sve2_usqadd_zpzz_s, uint32_t, H1_4, DO_USQADD_S)
+DO_ZPZZ_D(sve2_usqadd_zpzz_d, uint64_t, do_usqadd_d)
+
 #undef DO_ZPZZ
 #undef DO_ZPZZ_D
 
@@ -1614,13 +1743,7 @@ void HELPER(sve_sqaddi_b)(void *d, void *a, int32_t b, uint32_t desc)
     intptr_t i, oprsz = simd_oprsz(desc);
 
     for (i = 0; i < oprsz; i += sizeof(int8_t)) {
-        int r = *(int8_t *)(a + i) + b;
-        if (r > INT8_MAX) {
-            r = INT8_MAX;
-        } else if (r < INT8_MIN) {
-            r = INT8_MIN;
-        }
-        *(int8_t *)(d + i) = r;
+        *(int8_t *)(d + i) = DO_SQADD_B(b, *(int8_t *)(a + i));
     }
 }
 
@@ -1629,13 +1752,7 @@ void HELPER(sve_sqaddi_h)(void *d, void *a, int32_t b, uint32_t desc)
     intptr_t i, oprsz = simd_oprsz(desc);
 
     for (i = 0; i < oprsz; i += sizeof(int16_t)) {
-        int r = *(int16_t *)(a + i) + b;
-        if (r > INT16_MAX) {
-            r = INT16_MAX;
-        } else if (r < INT16_MIN) {
-            r = INT16_MIN;
-        }
-        *(int16_t *)(d + i) = r;
+        *(int16_t *)(d + i) = DO_SQADD_H(b, *(int16_t *)(a + i));
     }
 }
 
@@ -1644,13 +1761,7 @@ void HELPER(sve_sqaddi_s)(void *d, void *a, int64_t b, uint32_t desc)
     intptr_t i, oprsz = simd_oprsz(desc);
 
     for (i = 0; i < oprsz; i += sizeof(int32_t)) {
-        int64_t r = *(int32_t *)(a + i) + b;
-        if (r > INT32_MAX) {
-            r = INT32_MAX;
-        } else if (r < INT32_MIN) {
-            r = INT32_MIN;
-        }
-        *(int32_t *)(d + i) = r;
+        *(int32_t *)(d + i) = DO_SQADD_S(b, *(int32_t *)(a + i));
     }
 }
 
@@ -1659,13 +1770,7 @@ void HELPER(sve_sqaddi_d)(void *d, void *a, int64_t b, uint32_t desc)
     intptr_t i, oprsz = simd_oprsz(desc);
 
     for (i = 0; i < oprsz; i += sizeof(int64_t)) {
-        int64_t ai = *(int64_t *)(a + i);
-        int64_t r = ai + b;
-        if (((r ^ ai) & ~(ai ^ b)) < 0) {
-            /* Signed overflow.  */
-            r = (r < 0 ? INT64_MAX : INT64_MIN);
-        }
-        *(int64_t *)(d + i) = r;
+        *(int64_t *)(d + i) = do_sqadd_d(b, *(int64_t *)(a + i));
     }
 }
 
@@ -1678,13 +1783,7 @@ void HELPER(sve_uqaddi_b)(void *d, void *a, int32_t b, uint32_t desc)
     intptr_t i, oprsz = simd_oprsz(desc);
 
     for (i = 0; i < oprsz; i += sizeof(uint8_t)) {
-        int r = *(uint8_t *)(a + i) + b;
-        if (r > UINT8_MAX) {
-            r = UINT8_MAX;
-        } else if (r < 0) {
-            r = 0;
-        }
-        *(uint8_t *)(d + i) = r;
+        *(uint8_t *)(d + i) = DO_UQADD_B(b, *(uint8_t *)(a + i));
     }
 }
 
@@ -1693,13 +1792,7 @@ void HELPER(sve_uqaddi_h)(void *d, void *a, int32_t b, uint32_t desc)
     intptr_t i, oprsz = simd_oprsz(desc);
 
     for (i = 0; i < oprsz; i += sizeof(uint16_t)) {
-        int r = *(uint16_t *)(a + i) + b;
-        if (r > UINT16_MAX) {
-            r = UINT16_MAX;
-        } else if (r < 0) {
-            r = 0;
-        }
-        *(uint16_t *)(d + i) = r;
+        *(uint16_t *)(d + i) = DO_UQADD_H(b, *(uint16_t *)(a + i));
     }
 }
 
@@ -1708,13 +1801,7 @@ void HELPER(sve_uqaddi_s)(void *d, void *a, int64_t b, uint32_t desc)
     intptr_t i, oprsz = simd_oprsz(desc);
 
     for (i = 0; i < oprsz; i += sizeof(uint32_t)) {
-        int64_t r = *(uint32_t *)(a + i) + b;
-        if (r > UINT32_MAX) {
-            r = UINT32_MAX;
-        } else if (r < 0) {
-            r = 0;
-        }
-        *(uint32_t *)(d + i) = r;
+        *(uint32_t *)(d + i) = DO_UQADD_S(b, *(uint32_t *)(a + i));
     }
 }
 
@@ -1723,11 +1810,7 @@ void HELPER(sve_uqaddi_d)(void *d, void *a, uint64_t b, uint32_t desc)
     intptr_t i, oprsz = simd_oprsz(desc);
 
     for (i = 0; i < oprsz; i += sizeof(uint64_t)) {
-        uint64_t r = *(uint64_t *)(a + i) + b;
-        if (r < b) {
-            r = UINT64_MAX;
-        }
-        *(uint64_t *)(d + i) = r;
+        *(uint64_t *)(d + i) = do_uqadd_d(b, *(uint64_t *)(a + i));
     }
 }
 
@@ -1736,8 +1819,7 @@ void HELPER(sve_uqsubi_d)(void *d, void *a, uint64_t b, uint32_t desc)
     intptr_t i, oprsz = simd_oprsz(desc);
 
     for (i = 0; i < oprsz; i += sizeof(uint64_t)) {
-        uint64_t ai = *(uint64_t *)(a + i);
-        *(uint64_t *)(d + i) = (ai < b ? 0 : ai - b);
+        *(uint64_t *)(d + i) = do_uqsub_d(*(uint64_t *)(a + i), b);
     }
 }
 
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 0675abf1d8..fc8e2a84f2 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -5964,3 +5964,10 @@ DO_SVE2_ZPZZ(SMAXP, smaxp)
 DO_SVE2_ZPZZ(UMAXP, umaxp)
 DO_SVE2_ZPZZ(SMINP, sminp)
 DO_SVE2_ZPZZ(UMINP, uminp)
+
+DO_SVE2_ZPZZ(SQADD_zpzz, sqadd)
+DO_SVE2_ZPZZ(UQADD_zpzz, uqadd)
+DO_SVE2_ZPZZ(SQSUB_zpzz, sqsub)
+DO_SVE2_ZPZZ(UQSUB_zpzz, uqsub)
+DO_SVE2_ZPZZ(SUQADD, suqadd)
+DO_SVE2_ZPZZ(USQADD, usqadd)
-- 
2.25.1


