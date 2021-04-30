Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 871EC37021C
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 22:34:30 +0200 (CEST)
Received: from localhost ([::1]:40786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcZqH-0006nb-Hb
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 16:34:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcZiR-0008H0-82
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 16:26:23 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:54024)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcZiL-0005xV-Ie
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 16:26:22 -0400
Received: by mail-pj1-x102d.google.com with SMTP id p17so9146257pjz.3
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 13:26:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/Nra4WlEPuo4eXKLzm+7jMvvLTFMwTtBD/ofu/WPZv8=;
 b=kAOKpz7IqZYgLuYBNmsAKQv0O34OmDTL40kRlsMmQ7Fa1geIWJwKkDO68udOFD7VW4
 +G0H7h8xAHzfM2Uw8gZMx9VnGFxqbvFSWMFYbz8cnPniiOoHrP8ZStdm4mu/vDipBdPr
 7wqHgxREuoSJPMb3sxvdQg5DFDnznrXX9x/OHnYrqtx0ot3SmXH8h2fL3nBP8x5k3Qp4
 eGJAzhnaFLslJfG4a2kb1gXA9qbhA9bPLhHrxFbhc65jQpJYd/uK512kyINWTugY7qQL
 ms7obOxyMhNKrwSlzF8Wssw5AUygQ+rJyTQK1AdQTPPkTWK6gXiOO3DgwRtbqOrxIWbV
 TqDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/Nra4WlEPuo4eXKLzm+7jMvvLTFMwTtBD/ofu/WPZv8=;
 b=Xype+ZN6P14/7JZ1MY5BjQA8yNPukKQIYDYUQdU9+IQ9O/RSaGp6J79xUs17mXutRl
 kA5ybUAVqXWLkcgXti4zwFIsOeI/BpvYowb3nQSZ/2Om3Gk4MHDsEdRmWhNGpPAGHmnk
 ds90s4x5wMQLyFO5IKIw/MzjNahWWN5CkbYDNvLb8byt70azp8tsKPKcHtQ6AXtREh5l
 FYYGia29XbJ9LfJ4+HiFqr6hXckYNBctl001jR1eBCCj/AvF8HRhwTM0cgKgtpelAVZt
 +UO73YS8aRUSFynkOEewdQ0XqCLsPZDaZ65R6WRvH8+OEo/N8AXRC6BQS5ZRyzYuXswU
 Y45A==
X-Gm-Message-State: AOAM530vARIGo2E9moogoQWfe2GihSTjbg2TxSvqFAC0TtATuWrCBbGN
 OHHET52Nu5yDJk9CKN4S1+gmSMTrf8zJGA==
X-Google-Smtp-Source: ABdhPJxBJppRsrGaFR1gj7aFWLBkQormh4zlhMacjMofomyk+r2c50TY/3RxlB0H8659d+ilfmRpeg==
X-Received: by 2002:a17:90b:1bcd:: with SMTP id
 oa13mr15773368pjb.22.1619814376242; 
 Fri, 30 Apr 2021 13:26:16 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id e6sm2905257pfd.219.2021.04.30.13.26.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Apr 2021 13:26:16 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 08/82] target/arm: Implement SVE2 integer pairwise
 arithmetic
Date: Fri, 30 Apr 2021 13:24:56 -0700
Message-Id: <20210430202610.1136687-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210430202610.1136687-1-richard.henderson@linaro.org>
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
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
v2: Load all inputs before writing any output (laurent desnogues)
---
 target/arm/helper-sve.h    | 45 ++++++++++++++++++++++
 target/arm/sve.decode      |  8 ++++
 target/arm/sve_helper.c    | 76 ++++++++++++++++++++++++++++++++++++++
 target/arm/translate-sve.c |  6 +++
 4 files changed, 135 insertions(+)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index 5fdc0d223a..09bc067dd4 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -326,6 +326,51 @@ DEF_HELPER_FLAGS_5(sve_sel_zpzz_s, TCG_CALL_NO_RWG,
 DEF_HELPER_FLAGS_5(sve_sel_zpzz_d, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
 
+DEF_HELPER_FLAGS_5(sve2_addp_zpzz_b, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_addp_zpzz_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_addp_zpzz_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_addp_zpzz_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_5(sve2_smaxp_zpzz_b, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_smaxp_zpzz_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_smaxp_zpzz_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_smaxp_zpzz_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_5(sve2_umaxp_zpzz_b, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_umaxp_zpzz_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_umaxp_zpzz_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_umaxp_zpzz_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_5(sve2_sminp_zpzz_b, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_sminp_zpzz_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_sminp_zpzz_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_sminp_zpzz_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_5(sve2_uminp_zpzz_b, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_uminp_zpzz_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_uminp_zpzz_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_uminp_zpzz_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+
 DEF_HELPER_FLAGS_5(sve_asr_zpzw_b, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(sve_asr_zpzw_h, TCG_CALL_NO_RWG,
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 58c3f7ede4..61a3321325 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1140,3 +1140,11 @@ SRHADD          01000100 .. 010 100 100 ... ..... .....  @rdn_pg_rm
 URHADD          01000100 .. 010 101 100 ... ..... .....  @rdn_pg_rm
 SHSUB           01000100 .. 010 110 100 ... ..... .....  @rdm_pg_rn # SHSUBR
 UHSUB           01000100 .. 010 111 100 ... ..... .....  @rdm_pg_rn # UHSUBR
+
+### SVE2 integer pairwise arithmetic
+
+ADDP            01000100 .. 010 001 101 ... ..... .....  @rdn_pg_rm
+SMAXP           01000100 .. 010 100 101 ... ..... .....  @rdn_pg_rm
+UMAXP           01000100 .. 010 101 101 ... ..... .....  @rdn_pg_rm
+SMINP           01000100 .. 010 110 101 ... ..... .....  @rdn_pg_rm
+UMINP           01000100 .. 010 111 101 ... ..... .....  @rdn_pg_rm
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 3703b96eb4..7cc559d950 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -681,6 +681,82 @@ DO_ZPZZ_D(sve2_uhsub_zpzz_d, uint64_t, DO_HSUB_D)
 #undef DO_ZPZZ
 #undef DO_ZPZZ_D
 
+/*
+ * Three operand expander, operating on element pairs.
+ * If the slot I is even, the elements from from VN {I, I+1}.
+ * If the slot I is odd, the elements from from VM {I-1, I}.
+ * Load all of the input elements in each pair before overwriting output.
+ */
+#define DO_ZPZZ_PAIR(NAME, TYPE, H, OP) \
+void HELPER(NAME)(void *vd, void *vn, void *vm, void *vg, uint32_t desc) \
+{                                                               \
+    intptr_t i, opr_sz = simd_oprsz(desc);                      \
+    for (i = 0; i < opr_sz; ) {                                 \
+        uint16_t pg = *(uint16_t *)(vg + H1_2(i >> 3));         \
+        do {                                                    \
+            TYPE n0 = *(TYPE *)(vn + H(i));                     \
+            TYPE m0 = *(TYPE *)(vm + H(i));                     \
+            TYPE n1 = *(TYPE *)(vn + H(i + sizeof(TYPE)));      \
+            TYPE m1 = *(TYPE *)(vm + H(i + sizeof(TYPE)));      \
+            if (pg & 1) {                                       \
+                *(TYPE *)(vd + H(i)) = OP(n0, n1);              \
+            }                                                   \
+            i += sizeof(TYPE), pg >>= sizeof(TYPE);             \
+            if (pg & 1) {                                       \
+                *(TYPE *)(vd + H(i)) = OP(m0, m1);              \
+            }                                                   \
+            i += sizeof(TYPE), pg >>= sizeof(TYPE);             \
+        } while (i & 15);                                       \
+    }                                                           \
+}
+
+/* Similarly, specialized for 64-bit operands.  */
+#define DO_ZPZZ_PAIR_D(NAME, TYPE, OP) \
+void HELPER(NAME)(void *vd, void *vn, void *vm, void *vg, uint32_t desc) \
+{                                                               \
+    intptr_t i, opr_sz = simd_oprsz(desc) / 8;                  \
+    TYPE *d = vd, *n = vn, *m = vm;                             \
+    uint8_t *pg = vg;                                           \
+    for (i = 0; i < opr_sz; i += 2) {                           \
+        TYPE n0 = n[i], n1 = n[i + 1];                          \
+        TYPE m0 = m[i], m1 = m[i + 1];                          \
+        if (pg[H1(i)] & 1) {                                    \
+            d[i] = OP(n0, n1);                                  \
+        }                                                       \
+        if (pg[H1(i + 1)] & 1) {                                \
+            d[i + 1] = OP(m0, m1);                              \
+        }                                                       \
+    }                                                           \
+}
+
+DO_ZPZZ_PAIR(sve2_addp_zpzz_b, uint8_t, H1_2, DO_ADD)
+DO_ZPZZ_PAIR(sve2_addp_zpzz_h, uint16_t, H1_2, DO_ADD)
+DO_ZPZZ_PAIR(sve2_addp_zpzz_s, uint32_t, H1_4, DO_ADD)
+DO_ZPZZ_PAIR_D(sve2_addp_zpzz_d, uint64_t, DO_ADD)
+
+DO_ZPZZ_PAIR(sve2_umaxp_zpzz_b, uint8_t, H1_2, DO_MAX)
+DO_ZPZZ_PAIR(sve2_umaxp_zpzz_h, uint16_t, H1_2, DO_MAX)
+DO_ZPZZ_PAIR(sve2_umaxp_zpzz_s, uint32_t, H1_4, DO_MAX)
+DO_ZPZZ_PAIR_D(sve2_umaxp_zpzz_d, uint64_t, DO_MAX)
+
+DO_ZPZZ_PAIR(sve2_uminp_zpzz_b, uint8_t, H1_2, DO_MIN)
+DO_ZPZZ_PAIR(sve2_uminp_zpzz_h, uint16_t, H1_2, DO_MIN)
+DO_ZPZZ_PAIR(sve2_uminp_zpzz_s, uint32_t, H1_4, DO_MIN)
+DO_ZPZZ_PAIR_D(sve2_uminp_zpzz_d, uint64_t, DO_MIN)
+
+DO_ZPZZ_PAIR(sve2_smaxp_zpzz_b, int8_t, H1_2, DO_MAX)
+DO_ZPZZ_PAIR(sve2_smaxp_zpzz_h, int16_t, H1_2, DO_MAX)
+DO_ZPZZ_PAIR(sve2_smaxp_zpzz_s, int32_t, H1_4, DO_MAX)
+DO_ZPZZ_PAIR_D(sve2_smaxp_zpzz_d, int64_t, DO_MAX)
+
+DO_ZPZZ_PAIR(sve2_sminp_zpzz_b, int8_t, H1_2, DO_MIN)
+DO_ZPZZ_PAIR(sve2_sminp_zpzz_h, int16_t, H1_2, DO_MIN)
+DO_ZPZZ_PAIR(sve2_sminp_zpzz_s, int32_t, H1_4, DO_MIN)
+DO_ZPZZ_PAIR_D(sve2_sminp_zpzz_d, int64_t, DO_MIN)
+
+#undef DO_ZPZZ_PAIR
+#undef DO_ZPZZ_PAIR_D
+
 /* Three-operand expander, controlled by a predicate, in which the
  * third operand is "wide".  That is, for D = N op M, the same 64-bit
  * value of M is used with all of the narrower values of N.
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 43690999ab..2d449c9b57 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -5957,3 +5957,9 @@ DO_SVE2_ZPZZ(SHSUB, shsub)
 DO_SVE2_ZPZZ(UHADD, uhadd)
 DO_SVE2_ZPZZ(URHADD, urhadd)
 DO_SVE2_ZPZZ(UHSUB, uhsub)
+
+DO_SVE2_ZPZZ(ADDP, addp)
+DO_SVE2_ZPZZ(SMAXP, smaxp)
+DO_SVE2_ZPZZ(UMAXP, umaxp)
+DO_SVE2_ZPZZ(SMINP, sminp)
+DO_SVE2_ZPZZ(UMINP, uminp)
-- 
2.25.1


