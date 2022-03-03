Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 046834CC7A0
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 22:09:06 +0100 (CET)
Received: from localhost ([::1]:48444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPsh6-0004oH-Pf
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 16:09:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nPsYF-0005IH-5A
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 15:59:55 -0500
Received: from [2607:f8b0:4864:20::62a] (port=42628
 helo=mail-pl1-x62a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nPsYD-00042q-Bk
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 15:59:54 -0500
Received: by mail-pl1-x62a.google.com with SMTP id p17so5857222plo.9
 for <qemu-devel@nongnu.org>; Thu, 03 Mar 2022 12:59:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iuN42q8KMvVK0TQs3sogcIuNPw7L/H9YoxKwGCCfuI8=;
 b=Mg3c2blb7qBM2/oiU/UeBS/dbJJaUYzGqLkwCXoVOLnSAR1DdcolxlWx4/2r0oifvD
 bkTmKa3rN+B0f/nVuJ+147jW7eO6RiOHFpdo29jangdgIz4EuaPI2rwNwCL99XbIDg+v
 nJegbDWHhA3FYTMnsCOlgIRm752KISKE7nIN/PxP7Y5pYVq0TMHo6k8R1ftxBsG6GnKv
 bC+/oTeYZrFBLdgZ/5zzkiAYxIG0j/ojQc3d02xEIyRU+hrw8Uzt0L3PaS4CYVSivICz
 fUVIi9KbBmxfvxfMu+ReEcO0Fj2QQoXJU9EjAVo0OIRhiFNhrIvnyQXmwIIjF2QFcTH0
 T4Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iuN42q8KMvVK0TQs3sogcIuNPw7L/H9YoxKwGCCfuI8=;
 b=gSLXsIXECLY4QM7xBUUJh0brf/tH+SGQZBq0X48ca6yZ+01O/dfkJE5LuLFGYh2nsW
 aZFMuPyY0YcN/RNfklSOqcgChu+jvpW7FZQ5KhrWmcRiRU0V/eY18LY2EriXi0AMTtt7
 usTjU3Sc6T/FqWuYIs8odoxI26I0mrnI7Mo1DdkXlJYNlQicpygvxK3THx70ByOcgv43
 gVnICKHKML+nVDZiByp9dkAqx28fU0d5U1zr1XJye0QOaHgwEl4HTXuJnJEZfV5xigQO
 Uyyc65M1CRoe95WvkUY6bqciAP2uEqQ4qnQgHbNalar37pYd1BwAr+BFQmIwu72fNPkD
 6waQ==
X-Gm-Message-State: AOAM531T+aVpbTl+Zw/eg+uUQMEJtkaRqJvkEbkZWTCmHhqzCfIWYWLt
 5N9wLyZPi+cfZOT6TXC0PJN69JWzo6CCJg==
X-Google-Smtp-Source: ABdhPJwaiM9qdWYH+sdLuxU6UYoauaIyO6QNojRvX5ew4En4hcIdLvpTJGM51P0AttJBq/mSs1K9xw==
X-Received: by 2002:a17:90a:2c0b:b0:1be:da5a:b294 with SMTP id
 m11-20020a17090a2c0b00b001beda5ab294mr7232731pjd.9.1646341192059; 
 Thu, 03 Mar 2022 12:59:52 -0800 (PST)
Received: from localhost.localdomain
 (2603-800c-1201-c600-119c-490c-a4ee-08e8.res6.spectrum.com.
 [2603:800c:1201:c600:119c:490c:a4ee:8e8])
 by smtp.gmail.com with ESMTPSA id
 t8-20020a6549c8000000b00372eb3a7fb3sm2729934pgs.92.2022.03.03.12.59.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Mar 2022 12:59:51 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 03/30] tcg: Add opcodes for vector nand, nor, eqv
Date: Thu,  3 Mar 2022 10:59:17 -1000
Message-Id: <20220303205944.469445-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220303205944.469445-1-richard.henderson@linaro.org>
References: <20220303205944.469445-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We've had placeholders for these opcodes for a while,
and should have support on ppc, s390x and avx512 hosts.

Tested-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/tcg/tcg-opc.h    |  3 +++
 include/tcg/tcg.h        |  3 +++
 tcg/aarch64/tcg-target.h |  3 +++
 tcg/arm/tcg-target.h     |  3 +++
 tcg/i386/tcg-target.h    |  3 +++
 tcg/ppc/tcg-target.h     |  3 +++
 tcg/s390x/tcg-target.h   |  3 +++
 tcg/optimize.c           | 12 ++++++------
 tcg/tcg-op-vec.c         | 27 ++++++++++++++++++---------
 tcg/tcg.c                |  6 ++++++
 10 files changed, 51 insertions(+), 15 deletions(-)

diff --git a/include/tcg/tcg-opc.h b/include/tcg/tcg-opc.h
index 675873e200..dd444734d9 100644
--- a/include/tcg/tcg-opc.h
+++ b/include/tcg/tcg-opc.h
@@ -245,6 +245,9 @@ DEF(or_vec, 1, 2, 0, IMPLVEC)
 DEF(xor_vec, 1, 2, 0, IMPLVEC)
 DEF(andc_vec, 1, 2, 0, IMPLVEC | IMPL(TCG_TARGET_HAS_andc_vec))
 DEF(orc_vec, 1, 2, 0, IMPLVEC | IMPL(TCG_TARGET_HAS_orc_vec))
+DEF(nand_vec, 1, 2, 0, IMPLVEC | IMPL(TCG_TARGET_HAS_nand_vec))
+DEF(nor_vec, 1, 2, 0, IMPLVEC | IMPL(TCG_TARGET_HAS_nor_vec))
+DEF(eqv_vec, 1, 2, 0, IMPLVEC | IMPL(TCG_TARGET_HAS_eqv_vec))
 DEF(not_vec, 1, 1, 0, IMPLVEC | IMPL(TCG_TARGET_HAS_not_vec))
 
 DEF(shli_vec, 1, 1, 1, IMPLVEC | IMPL(TCG_TARGET_HAS_shi_vec))
diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
index 939041103e..73869fd9d0 100644
--- a/include/tcg/tcg.h
+++ b/include/tcg/tcg.h
@@ -183,6 +183,9 @@ typedef uint64_t TCGRegSet;
 #define TCG_TARGET_HAS_not_vec          0
 #define TCG_TARGET_HAS_andc_vec         0
 #define TCG_TARGET_HAS_orc_vec          0
+#define TCG_TARGET_HAS_nand_vec         0
+#define TCG_TARGET_HAS_nor_vec          0
+#define TCG_TARGET_HAS_eqv_vec          0
 #define TCG_TARGET_HAS_roti_vec         0
 #define TCG_TARGET_HAS_rots_vec         0
 #define TCG_TARGET_HAS_rotv_vec         0
diff --git a/tcg/aarch64/tcg-target.h b/tcg/aarch64/tcg-target.h
index 876af589ce..485f685bd2 100644
--- a/tcg/aarch64/tcg-target.h
+++ b/tcg/aarch64/tcg-target.h
@@ -131,6 +131,9 @@ typedef enum {
 
 #define TCG_TARGET_HAS_andc_vec         1
 #define TCG_TARGET_HAS_orc_vec          1
+#define TCG_TARGET_HAS_nand_vec         0
+#define TCG_TARGET_HAS_nor_vec          0
+#define TCG_TARGET_HAS_eqv_vec          0
 #define TCG_TARGET_HAS_not_vec          1
 #define TCG_TARGET_HAS_neg_vec          1
 #define TCG_TARGET_HAS_abs_vec          1
diff --git a/tcg/arm/tcg-target.h b/tcg/arm/tcg-target.h
index 27c27a1f14..7e96495392 100644
--- a/tcg/arm/tcg-target.h
+++ b/tcg/arm/tcg-target.h
@@ -130,6 +130,9 @@ extern bool use_neon_instructions;
 
 #define TCG_TARGET_HAS_andc_vec         1
 #define TCG_TARGET_HAS_orc_vec          1
+#define TCG_TARGET_HAS_nand_vec         0
+#define TCG_TARGET_HAS_nor_vec          0
+#define TCG_TARGET_HAS_eqv_vec          0
 #define TCG_TARGET_HAS_not_vec          1
 #define TCG_TARGET_HAS_neg_vec          1
 #define TCG_TARGET_HAS_abs_vec          1
diff --git a/tcg/i386/tcg-target.h b/tcg/i386/tcg-target.h
index 3b2c9437a0..ecd0fa6e05 100644
--- a/tcg/i386/tcg-target.h
+++ b/tcg/i386/tcg-target.h
@@ -185,6 +185,9 @@ extern bool have_movbe;
 
 #define TCG_TARGET_HAS_andc_vec         1
 #define TCG_TARGET_HAS_orc_vec          0
+#define TCG_TARGET_HAS_nand_vec         0
+#define TCG_TARGET_HAS_nor_vec          0
+#define TCG_TARGET_HAS_eqv_vec          0
 #define TCG_TARGET_HAS_not_vec          0
 #define TCG_TARGET_HAS_neg_vec          0
 #define TCG_TARGET_HAS_abs_vec          1
diff --git a/tcg/ppc/tcg-target.h b/tcg/ppc/tcg-target.h
index c775c97b61..3e543161eb 100644
--- a/tcg/ppc/tcg-target.h
+++ b/tcg/ppc/tcg-target.h
@@ -162,6 +162,9 @@ extern bool have_vsx;
 
 #define TCG_TARGET_HAS_andc_vec         1
 #define TCG_TARGET_HAS_orc_vec          have_isa_2_07
+#define TCG_TARGET_HAS_nand_vec         0
+#define TCG_TARGET_HAS_nor_vec          0
+#define TCG_TARGET_HAS_eqv_vec          0
 #define TCG_TARGET_HAS_not_vec          1
 #define TCG_TARGET_HAS_neg_vec          have_isa_3_00
 #define TCG_TARGET_HAS_abs_vec          0
diff --git a/tcg/s390x/tcg-target.h b/tcg/s390x/tcg-target.h
index 69217d995b..94ccb179b8 100644
--- a/tcg/s390x/tcg-target.h
+++ b/tcg/s390x/tcg-target.h
@@ -145,6 +145,9 @@ extern uint64_t s390_facilities[3];
 
 #define TCG_TARGET_HAS_andc_vec       1
 #define TCG_TARGET_HAS_orc_vec        HAVE_FACILITY(VECTOR_ENH1)
+#define TCG_TARGET_HAS_nand_vec       0
+#define TCG_TARGET_HAS_nor_vec        0
+#define TCG_TARGET_HAS_eqv_vec        0
 #define TCG_TARGET_HAS_not_vec        1
 #define TCG_TARGET_HAS_neg_vec        1
 #define TCG_TARGET_HAS_abs_vec        1
diff --git a/tcg/optimize.c b/tcg/optimize.c
index 06213fd434..ae081ab29c 100644
--- a/tcg/optimize.c
+++ b/tcg/optimize.c
@@ -359,13 +359,13 @@ static uint64_t do_constant_folding_2(TCGOpcode op, uint64_t x, uint64_t y)
     CASE_OP_32_64_VEC(orc):
         return x | ~y;
 
-    CASE_OP_32_64(eqv):
+    CASE_OP_32_64_VEC(eqv):
         return ~(x ^ y);
 
-    CASE_OP_32_64(nand):
+    CASE_OP_32_64_VEC(nand):
         return ~(x & y);
 
-    CASE_OP_32_64(nor):
+    CASE_OP_32_64_VEC(nor):
         return ~(x | y);
 
     case INDEX_op_clz_i32:
@@ -2119,7 +2119,7 @@ void tcg_optimize(TCGContext *s)
         case INDEX_op_dup2_vec:
             done = fold_dup2(&ctx, op);
             break;
-        CASE_OP_32_64(eqv):
+        CASE_OP_32_64_VEC(eqv):
             done = fold_eqv(&ctx, op);
             break;
         CASE_OP_32_64(extract):
@@ -2170,13 +2170,13 @@ void tcg_optimize(TCGContext *s)
         CASE_OP_32_64(mulu2):
             done = fold_multiply2(&ctx, op);
             break;
-        CASE_OP_32_64(nand):
+        CASE_OP_32_64_VEC(nand):
             done = fold_nand(&ctx, op);
             break;
         CASE_OP_32_64(neg):
             done = fold_neg(&ctx, op);
             break;
-        CASE_OP_32_64(nor):
+        CASE_OP_32_64_VEC(nor):
             done = fold_nor(&ctx, op);
             break;
         CASE_OP_32_64_VEC(not):
diff --git a/tcg/tcg-op-vec.c b/tcg/tcg-op-vec.c
index faf30f9cdd..463dabf515 100644
--- a/tcg/tcg-op-vec.c
+++ b/tcg/tcg-op-vec.c
@@ -371,23 +371,32 @@ void tcg_gen_orc_vec(unsigned vece, TCGv_vec r, TCGv_vec a, TCGv_vec b)
 
 void tcg_gen_nand_vec(unsigned vece, TCGv_vec r, TCGv_vec a, TCGv_vec b)
 {
-    /* TODO: Add TCG_TARGET_HAS_nand_vec when adding a backend supports it. */
-    tcg_gen_and_vec(0, r, a, b);
-    tcg_gen_not_vec(0, r, r);
+    if (TCG_TARGET_HAS_nand_vec) {
+        vec_gen_op3(INDEX_op_nand_vec, 0, r, a, b);
+    } else {
+        tcg_gen_and_vec(0, r, a, b);
+        tcg_gen_not_vec(0, r, r);
+    }
 }
 
 void tcg_gen_nor_vec(unsigned vece, TCGv_vec r, TCGv_vec a, TCGv_vec b)
 {
-    /* TODO: Add TCG_TARGET_HAS_nor_vec when adding a backend supports it. */
-    tcg_gen_or_vec(0, r, a, b);
-    tcg_gen_not_vec(0, r, r);
+    if (TCG_TARGET_HAS_nor_vec) {
+        vec_gen_op3(INDEX_op_nor_vec, 0, r, a, b);
+    } else {
+        tcg_gen_or_vec(0, r, a, b);
+        tcg_gen_not_vec(0, r, r);
+    }
 }
 
 void tcg_gen_eqv_vec(unsigned vece, TCGv_vec r, TCGv_vec a, TCGv_vec b)
 {
-    /* TODO: Add TCG_TARGET_HAS_eqv_vec when adding a backend supports it. */
-    tcg_gen_xor_vec(0, r, a, b);
-    tcg_gen_not_vec(0, r, r);
+    if (TCG_TARGET_HAS_eqv_vec) {
+        vec_gen_op3(INDEX_op_eqv_vec, 0, r, a, b);
+    } else {
+        tcg_gen_xor_vec(0, r, a, b);
+        tcg_gen_not_vec(0, r, r);
+    }
 }
 
 static bool do_op2(unsigned vece, TCGv_vec r, TCGv_vec a, TCGOpcode opc)
diff --git a/tcg/tcg.c b/tcg/tcg.c
index 528277d1d3..33a97eabdb 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -1407,6 +1407,12 @@ bool tcg_op_supported(TCGOpcode op)
         return have_vec && TCG_TARGET_HAS_andc_vec;
     case INDEX_op_orc_vec:
         return have_vec && TCG_TARGET_HAS_orc_vec;
+    case INDEX_op_nand_vec:
+        return have_vec && TCG_TARGET_HAS_nand_vec;
+    case INDEX_op_nor_vec:
+        return have_vec && TCG_TARGET_HAS_nor_vec;
+    case INDEX_op_eqv_vec:
+        return have_vec && TCG_TARGET_HAS_eqv_vec;
     case INDEX_op_mul_vec:
         return have_vec && TCG_TARGET_HAS_mul_vec;
     case INDEX_op_shli_vec:
-- 
2.25.1


