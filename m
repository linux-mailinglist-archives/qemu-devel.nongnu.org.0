Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5065C332CAD
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 17:57:48 +0100 (CET)
Received: from localhost ([::1]:41122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJfg3-00055z-AF
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 11:57:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lJf6O-0006xz-Rj
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 11:20:57 -0500
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e]:42013)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lJf6K-0002Pv-BA
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 11:20:56 -0500
Received: by mail-ot1-x32e.google.com with SMTP id e45so13331787ote.9
 for <qemu-devel@nongnu.org>; Tue, 09 Mar 2021 08:20:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tvbQbRXJincws9vxpJQp1b+ub8fQnU0GehgSc3qlp/c=;
 b=i++NZKyTPMraH8mGWhiUQdr2rI7JdzM/08WahnLiXRJi2d7bslqygx/XmB2dsNIu5N
 KPXHrPPyMUILWdpwLnTdVVLQko/rbuGYPEnD2m/DMZB8U9l6gvdeQf/2UGt/5+4dv12z
 fmzAgp3KuXUVS2qRdtA2CUNxCPMJiKcmbLLJK748jiC0HLpBWiwblz+UIMclK3UFSQbK
 BbkdQw3lVP6p5J6JLy+NZ22HlPY66muhLH3jSWN5gXmUJNlhrOu0VIGbv+p6b1e97QrA
 5cnDcPLahEHjvO8Us8elmfuHzHkvRsQVo0T/JBfwmiNReSm/RMUUFOjblH2eQYbyBgre
 FXpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tvbQbRXJincws9vxpJQp1b+ub8fQnU0GehgSc3qlp/c=;
 b=PYBlsSUClLtA1oL++Q1mj6ph8VA/vSE11tki66ap4ozzcG+HWCKfWULxjvAb2ipzL+
 QGF4t3+KHUtKmGN5fO3VFXouXq/bBkeQg2o2rXt3BLyoEfwRz7eQlN443mXqyDvFrHjN
 FVY61J5/d5ZzqcXCsw3yaLFENDBJ7RZYbDG+unqZBS3xgUG+lROc+xHeYlKH8RYkgz5z
 oXuIFMoYO6WcgLljTOBWqX/u+Yv6o2N3nvIKb7TyGiFHB3Zii2JCvDFrCgCcmLs8NWaM
 5DOKWV+HsUw1xZ6K3xSTGYyAEvhnlsphZ/BpHfqE5fvRD3sSZFXDd76JhmB7INPbFyri
 STPw==
X-Gm-Message-State: AOAM530nE4wQfpbBZHUBqIzyo8bo1JSvKDssYP7hBbHqn846lh+7YR7F
 unHED8Kkheq0c1+JMujWoL8yDQeax1cXpvPt
X-Google-Smtp-Source: ABdhPJw7m7WhbxKnCYRNZWvMA45UN4lJHqbT/bj0L+jqKOu5jOPRlwoWdmt7kNq4X1DVauaG1QYlsw==
X-Received: by 2002:a05:6830:1f55:: with SMTP id
 u21mr25823401oth.103.1615306850169; 
 Tue, 09 Mar 2021 08:20:50 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id v23sm2516474ots.63.2021.03.09.08.20.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Mar 2021 08:20:49 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 06/78] target/arm: Implement SVE2 saturating/rounding
 bitwise shift left (predicated)
Date: Tue,  9 Mar 2021 08:19:29 -0800
Message-Id: <20210309162041.23124-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210309162041.23124-1-richard.henderson@linaro.org>
References: <20210309162041.23124-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32e;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32e.google.com
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v2: Shift values are always signed (laurent desnogues).
---
 target/arm/helper-sve.h    | 54 ++++++++++++++++++++++++++
 target/arm/sve.decode      | 17 +++++++++
 target/arm/sve_helper.c    | 78 ++++++++++++++++++++++++++++++++++++++
 target/arm/translate-sve.c | 18 +++++++++
 4 files changed, 167 insertions(+)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index 9992e93e2b..62106c74be 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -172,6 +172,60 @@ DEF_HELPER_FLAGS_5(sve2_uadalp_zpzz_s, TCG_CALL_NO_RWG,
 DEF_HELPER_FLAGS_5(sve2_uadalp_zpzz_d, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
 
+DEF_HELPER_FLAGS_5(sve2_srshl_zpzz_b, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_srshl_zpzz_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_srshl_zpzz_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_srshl_zpzz_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_5(sve2_urshl_zpzz_b, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_urshl_zpzz_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_urshl_zpzz_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_urshl_zpzz_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_5(sve2_sqshl_zpzz_b, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_sqshl_zpzz_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_sqshl_zpzz_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_sqshl_zpzz_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_5(sve2_uqshl_zpzz_b, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_uqshl_zpzz_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_uqshl_zpzz_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_uqshl_zpzz_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_5(sve2_sqrshl_zpzz_b, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_sqrshl_zpzz_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_sqrshl_zpzz_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_sqrshl_zpzz_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_5(sve2_uqrshl_zpzz_b, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_uqrshl_zpzz_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_uqrshl_zpzz_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_uqrshl_zpzz_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+
 DEF_HELPER_FLAGS_5(sve_sdiv_zpzz_s, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(sve_sdiv_zpzz_d, TCG_CALL_NO_RWG,
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 5ba542969b..93f2479693 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1112,3 +1112,20 @@ URECPE          01000100 .. 000 000 101 ... ..... .....  @rd_pg_rn
 URSQRTE         01000100 .. 000 001 101 ... ..... .....  @rd_pg_rn
 SQABS           01000100 .. 001 000 101 ... ..... .....  @rd_pg_rn
 SQNEG           01000100 .. 001 001 101 ... ..... .....  @rd_pg_rn
+
+### SVE2 saturating/rounding bitwise shift left (predicated)
+
+SRSHL           01000100 .. 000 010 100 ... ..... .....  @rdn_pg_rm
+URSHL           01000100 .. 000 011 100 ... ..... .....  @rdn_pg_rm
+SRSHL           01000100 .. 000 110 100 ... ..... .....  @rdm_pg_rn # SRSHLR
+URSHL           01000100 .. 000 111 100 ... ..... .....  @rdm_pg_rn # URSHLR
+
+SQSHL           01000100 .. 001 000 100 ... ..... .....  @rdn_pg_rm
+UQSHL           01000100 .. 001 001 100 ... ..... .....  @rdn_pg_rm
+SQSHL           01000100 .. 001 100 100 ... ..... .....  @rdm_pg_rn # SQSHLR
+UQSHL           01000100 .. 001 101 100 ... ..... .....  @rdm_pg_rn # UQSHLR
+
+SQRSHL          01000100 .. 001 010 100 ... ..... .....  @rdn_pg_rm
+UQRSHL          01000100 .. 001 011 100 ... ..... .....  @rdn_pg_rm
+SQRSHL          01000100 .. 001 110 100 ... ..... .....  @rdm_pg_rn # SQRSHLR
+UQRSHL          01000100 .. 001 111 100 ... ..... .....  @rdm_pg_rn # UQRSHLR
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 5dcdd26db0..5c911963ec 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -26,6 +26,7 @@
 #include "tcg/tcg-gvec-desc.h"
 #include "fpu/softfloat.h"
 #include "tcg/tcg.h"
+#include "vec_internal.h"
 
 
 /* Note that vector data is stored in host-endian 64-bit chunks,
@@ -561,6 +562,83 @@ DO_ZPZZ(sve2_uadalp_zpzz_h, uint16_t, H1_2, do_uadalp_h)
 DO_ZPZZ(sve2_uadalp_zpzz_s, uint32_t, H1_4, do_uadalp_s)
 DO_ZPZZ_D(sve2_uadalp_zpzz_d, uint64_t, do_uadalp_d)
 
+#define do_srshl_b(n, m)  do_sqrshl_bhs(n, m, 8, true, NULL)
+#define do_srshl_h(n, m)  do_sqrshl_bhs(n, m, 16, true, NULL)
+#define do_srshl_s(n, m)  do_sqrshl_bhs(n, m, 32, true, NULL)
+#define do_srshl_d(n, m)  do_sqrshl_d(n, m, true, NULL)
+
+DO_ZPZZ(sve2_srshl_zpzz_b, int8_t, H1_2, do_srshl_b)
+DO_ZPZZ(sve2_srshl_zpzz_h, int16_t, H1_2, do_srshl_h)
+DO_ZPZZ(sve2_srshl_zpzz_s, int32_t, H1_4, do_srshl_s)
+DO_ZPZZ_D(sve2_srshl_zpzz_d, int64_t, do_srshl_d)
+
+#define do_urshl_b(n, m)  do_uqrshl_bhs(n, (int8_t)m, 8, true, NULL)
+#define do_urshl_h(n, m)  do_uqrshl_bhs(n, (int16_t)m, 16, true, NULL)
+#define do_urshl_s(n, m)  do_uqrshl_bhs(n, m, 32, true, NULL)
+#define do_urshl_d(n, m)  do_uqrshl_d(n, m, true, NULL)
+
+DO_ZPZZ(sve2_urshl_zpzz_b, uint8_t, H1_2, do_urshl_b)
+DO_ZPZZ(sve2_urshl_zpzz_h, uint16_t, H1_2, do_urshl_h)
+DO_ZPZZ(sve2_urshl_zpzz_s, uint32_t, H1_4, do_urshl_s)
+DO_ZPZZ_D(sve2_urshl_zpzz_d, uint64_t, do_urshl_d)
+
+/* Unlike the NEON and AdvSIMD versions, there is no QC bit to set. */
+#define do_sqshl_b(n, m) \
+   ({ uint32_t discard; do_sqrshl_bhs(n, m, 8, false, &discard); })
+#define do_sqshl_h(n, m) \
+   ({ uint32_t discard; do_sqrshl_bhs(n, m, 16, false, &discard); })
+#define do_sqshl_s(n, m) \
+   ({ uint32_t discard; do_sqrshl_bhs(n, m, 32, false, &discard); })
+#define do_sqshl_d(n, m) \
+   ({ uint32_t discard; do_sqrshl_d(n, m, false, &discard); })
+
+DO_ZPZZ(sve2_sqshl_zpzz_b, int8_t, H1_2, do_sqshl_b)
+DO_ZPZZ(sve2_sqshl_zpzz_h, int16_t, H1_2, do_sqshl_h)
+DO_ZPZZ(sve2_sqshl_zpzz_s, int32_t, H1_4, do_sqshl_s)
+DO_ZPZZ_D(sve2_sqshl_zpzz_d, int64_t, do_sqshl_d)
+
+#define do_uqshl_b(n, m) \
+   ({ uint32_t discard; do_uqrshl_bhs(n, (int8_t)m, 8, false, &discard); })
+#define do_uqshl_h(n, m) \
+   ({ uint32_t discard; do_uqrshl_bhs(n, (int16_t)m, 16, false, &discard); })
+#define do_uqshl_s(n, m) \
+   ({ uint32_t discard; do_uqrshl_bhs(n, m, 32, false, &discard); })
+#define do_uqshl_d(n, m) \
+   ({ uint32_t discard; do_uqrshl_d(n, m, false, &discard); })
+
+DO_ZPZZ(sve2_uqshl_zpzz_b, uint8_t, H1_2, do_uqshl_b)
+DO_ZPZZ(sve2_uqshl_zpzz_h, uint16_t, H1_2, do_uqshl_h)
+DO_ZPZZ(sve2_uqshl_zpzz_s, uint32_t, H1_4, do_uqshl_s)
+DO_ZPZZ_D(sve2_uqshl_zpzz_d, uint64_t, do_uqshl_d)
+
+#define do_sqrshl_b(n, m) \
+   ({ uint32_t discard; do_sqrshl_bhs(n, m, 8, true, &discard); })
+#define do_sqrshl_h(n, m) \
+   ({ uint32_t discard; do_sqrshl_bhs(n, m, 16, true, &discard); })
+#define do_sqrshl_s(n, m) \
+   ({ uint32_t discard; do_sqrshl_bhs(n, m, 32, true, &discard); })
+#define do_sqrshl_d(n, m) \
+   ({ uint32_t discard; do_sqrshl_d(n, m, true, &discard); })
+
+DO_ZPZZ(sve2_sqrshl_zpzz_b, int8_t, H1_2, do_sqrshl_b)
+DO_ZPZZ(sve2_sqrshl_zpzz_h, int16_t, H1_2, do_sqrshl_h)
+DO_ZPZZ(sve2_sqrshl_zpzz_s, int32_t, H1_4, do_sqrshl_s)
+DO_ZPZZ_D(sve2_sqrshl_zpzz_d, int64_t, do_sqrshl_d)
+
+#define do_uqrshl_b(n, m) \
+   ({ uint32_t discard; do_uqrshl_bhs(n, (int8_t)m, 8, true, &discard); })
+#define do_uqrshl_h(n, m) \
+   ({ uint32_t discard; do_uqrshl_bhs(n, (int16_t)m, 16, true, &discard); })
+#define do_uqrshl_s(n, m) \
+   ({ uint32_t discard; do_uqrshl_bhs(n, m, 32, true, &discard); })
+#define do_uqrshl_d(n, m) \
+   ({ uint32_t discard; do_uqrshl_d(n, m, true, &discard); })
+
+DO_ZPZZ(sve2_uqrshl_zpzz_b, uint8_t, H1_2, do_uqrshl_b)
+DO_ZPZZ(sve2_uqrshl_zpzz_h, uint16_t, H1_2, do_uqrshl_h)
+DO_ZPZZ(sve2_uqrshl_zpzz_s, uint32_t, H1_4, do_uqrshl_s)
+DO_ZPZZ_D(sve2_uqrshl_zpzz_d, uint64_t, do_uqrshl_d)
+
 #undef DO_ZPZZ
 #undef DO_ZPZZ_D
 
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 2d8b9d2e70..0950c32c09 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -5932,3 +5932,21 @@ static bool trans_SQNEG(DisasContext *s, arg_rpr_esz *a)
     };
     return do_sve2_zpz_ool(s, a, fns[a->esz]);
 }
+
+#define DO_SVE2_ZPZZ(NAME, name) \
+static bool trans_##NAME(DisasContext *s, arg_rprr_esz *a)                \
+{                                                                         \
+    static gen_helper_gvec_4 * const fns[4] = {                           \
+        gen_helper_sve2_##name##_zpzz_b, gen_helper_sve2_##name##_zpzz_h, \
+        gen_helper_sve2_##name##_zpzz_s, gen_helper_sve2_##name##_zpzz_d, \
+    };                                                                    \
+    return do_sve2_zpzz_ool(s, a, fns[a->esz]);                           \
+}
+
+DO_SVE2_ZPZZ(SQSHL, sqshl)
+DO_SVE2_ZPZZ(SQRSHL, sqrshl)
+DO_SVE2_ZPZZ(SRSHL, srshl)
+
+DO_SVE2_ZPZZ(UQSHL, uqshl)
+DO_SVE2_ZPZZ(UQRSHL, uqrshl)
+DO_SVE2_ZPZZ(URSHL, urshl)
-- 
2.25.1


