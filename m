Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B832362A05
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 23:16:54 +0200 (CEST)
Received: from localhost ([::1]:55264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXVpc-0005BJ-W1
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 17:16:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXVc9-000496-Ry
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 17:02:58 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:37681)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXVc5-00013X-Lb
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 17:02:57 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 e8-20020a17090a7288b029014e51f5a6baso10050157pjg.2
 for <qemu-devel@nongnu.org>; Fri, 16 Apr 2021 14:02:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nkSSxMkXeoKQp4t8tpIye6M1xfm+ZviLl0PQ26Xf9wU=;
 b=Y0UcVowDlNdXri7y+xydfZi5Hm6ch+5uVmwCNL4k34yX47IpQYPMJpIVDjt3jdV6Fc
 tPvYC/6Vv4xZf+fgp21Rfw7OdKSE5iWfY/kkBVXTVNd9PV+F8hWLhgs63EFta1Iup9f3
 7BOHqqJVw/TGeA2YAZa0R2i8nzFvyP2kdhZhLRekO6WcbrSKJNQiUHjokmrTO4nYwc/M
 DTeA87A68YfSe4ajX75Tg8w27vmUTXdhBLYOSwRVn8IsiQGy1+3GsxlGmUxLda2dmKQM
 p2vtpanhoXW1RSZuNFtGVUqXZ14zH090rRyHTop63hgFqQCut4ftPIvRfEb0g0QhDUUb
 vs1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nkSSxMkXeoKQp4t8tpIye6M1xfm+ZviLl0PQ26Xf9wU=;
 b=HwT/FtspARBC0nAd+xcbrkNpTKeSSZISVG62zscMquS1OTiGNIfiadyMo5s0HeeUuk
 L4rIV226DWi91Aq/fuHzobgj0ANmYnPUh+Ut/Y9Pt7MxlrhY4k/IhMgiiS4thDoi12xM
 illYEx9Cfj2btVhtbnoXM/jIT1M3HAnUcCbfeFU/r8m10MrhENYZjtqb43QwDoGV0s5k
 TMIqutG14iybDe1pS/XIn535P9piYZ4M7Z4IdgkZxgm91d049QC7jSGc0Hc3NhL36OYd
 DGGhZ74CG2J2dCtIvBvSG1jrB0yh4i8GTXT9JMiBb2FZX0Gw3M3XMYbd/hzC5b2yeKVG
 8FUQ==
X-Gm-Message-State: AOAM531m8Jd5PIf/Tbpc7hCPHbHS1SbLaHqAmR3E3c5hQakZvMnGjWIQ
 i0xhrVUlSUFpgX0VASFl2jCWhYxwP/i/Gg==
X-Google-Smtp-Source: ABdhPJwRvguD7uAAovD5cEFBV4tk/IkjgaT0Cew3DJym+9rA+rlLw1deoU8U4V+8eI81PyPs9LR0uw==
X-Received: by 2002:a17:90b:1118:: with SMTP id
 gi24mr11315423pjb.30.1618606972262; 
 Fri, 16 Apr 2021 14:02:52 -0700 (PDT)
Received: from localhost.localdomain ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id m15sm5920640pjz.36.2021.04.16.14.02.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 14:02:51 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 09/81] target/arm: Implement SVE2 saturating add/subtract
 (predicated)
Date: Fri, 16 Apr 2021 14:01:28 -0700
Message-Id: <20210416210240.1591291-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210416210240.1591291-1-richard.henderson@linaro.org>
References: <20210416210240.1591291-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
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
index 7cc559d950..12a2078edb 100644
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
index 2d449c9b57..609d5ae7b7 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -5963,3 +5963,10 @@ DO_SVE2_ZPZZ(SMAXP, smaxp)
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


