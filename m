Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B56BB479C65
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Dec 2021 20:48:22 +0100 (CET)
Received: from localhost ([::1]:52354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1myfgr-00007F-RP
	for lists+qemu-devel@lfdr.de; Sat, 18 Dec 2021 14:48:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1myfbc-0000Rw-9a
 for qemu-devel@nongnu.org; Sat, 18 Dec 2021 14:42:56 -0500
Received: from [2607:f8b0:4864:20::102f] (port=54222
 helo=mail-pj1-x102f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1myfba-0003Rb-Gt
 for qemu-devel@nongnu.org; Sat, 18 Dec 2021 14:42:55 -0500
Received: by mail-pj1-x102f.google.com with SMTP id mj19so5390042pjb.3
 for <qemu-devel@nongnu.org>; Sat, 18 Dec 2021 11:42:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=NfWFyLgL7Qw6I1vhRZH+vjcIAxJG6A3DVHYvj84DYIM=;
 b=mO1kBcDl3pW7wSwiUADKduMHPCLIgswMoku3Ku/HVN3Othc2w4ZIX3DLzPIIZ+rCc2
 +nQXUkSzFWTY6FgdrSXOMsytS6VKyfUcpIpmsm0bPjxltg3gQf6Jzh1l6lKPSnLq0Fby
 ONkICpsrC9BwQgnWxWXn5jz7XxfHZ+GDEb0zPdYy5I0ZYZXah/VXjNg+1cXmtqFvGm1x
 D3J7WXBS0dUiS/93DJC8dy6KDmXNIwi91G65MH/f4Du4hJfIYEgadmJ6THCuHjDXG4Qo
 AQwMZ1POXA2T+Gp7UUbReK4fj/KNbIGtXOj6d/ifHRATH38vlnBWsw11W+OXomsjbTYb
 APcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NfWFyLgL7Qw6I1vhRZH+vjcIAxJG6A3DVHYvj84DYIM=;
 b=7mhNpmDU+hmyr4URb6sSKuULmqD5gKw5c10uyAFHG9RCxxxo8MCJnuBabTHLBFwnE2
 EcZvGYuhoV9U1oL42M1B6OaOtGHelaAWEfmou9oYavHVU6CM9iZomU7tu1kwxDE4Vz8d
 jsi+ya36Ih8b04UwSei5lWeP156Szlmtl5iWJ8jeAy/ZeOKdTeOFaNwO9MfZLHuKN5rN
 5nwjS27eWf1T5kEZbZIbsrd/KCF59gYwiklkjFPhYf8ve2eFNOI/vR1cEzXH+dsx9dco
 RCv2gnwkO+KsgchMnq+xhbCs9BlfnNOmDu9Vxa7CWaQoRZi7QTc/gHsz6rYxmfuAVqfr
 dTCQ==
X-Gm-Message-State: AOAM531eaAQdctOxGGWvf/PUrDUY3820P4hnBWGJLSrAnBINEeYhn7KA
 RYigtVWxJ2PTuT3lGmofSMpxZZNjyrdGzQ==
X-Google-Smtp-Source: ABdhPJxdEDk24Cl+j3+MQjUHHz7JAejjqLxRT2qlLoVUpaBDKyGIHJQS/QqNp8TH9srZF7El/nlICw==
X-Received: by 2002:a17:90a:db0f:: with SMTP id
 g15mr15118009pjv.76.1639856573229; 
 Sat, 18 Dec 2021 11:42:53 -0800 (PST)
Received: from localhost.localdomain (174-21-75-75.tukw.qwest.net.
 [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id g19sm10645919pfc.145.2021.12.18.11.42.52
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Dec 2021 11:42:52 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 02/20] tcg: Add opcodes for vector nand, nor, eqv
Date: Sat, 18 Dec 2021 11:42:32 -0800
Message-Id: <20211218194250.247633-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211218194250.247633-1-richard.henderson@linaro.org>
References: <20211218194250.247633-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We've had placeholders for these opcodes for a while,
and should have support on ppc, s390x and avx512 hosts.

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
index 42f5b500ed..30c8fe2b83 100644
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
index 7a93ac8023..1c669cd806 100644
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
index f41b809554..a9f1b30436 100644
--- a/tcg/arm/tcg-target.h
+++ b/tcg/arm/tcg-target.h
@@ -132,6 +132,9 @@ extern bool use_neon_instructions;
 
 #define TCG_TARGET_HAS_andc_vec         1
 #define TCG_TARGET_HAS_orc_vec          1
+#define TCG_TARGET_HAS_nand_vec         0
+#define TCG_TARGET_HAS_nor_vec          0
+#define TCG_TARGET_HAS_eqv_vec          0
 #define TCG_TARGET_HAS_not_vec          1
 #define TCG_TARGET_HAS_neg_vec          1
 #define TCG_TARGET_HAS_abs_vec          1
diff --git a/tcg/i386/tcg-target.h b/tcg/i386/tcg-target.h
index b00a6da293..64c1013182 100644
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
index 0943192cde..d4fd28c6b0 100644
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
index 527ada0f63..ad29e62b16 100644
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
index e573000951..89a3396c9c 100644
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
index 934aa8510b..fca23858d4 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -1406,6 +1406,12 @@ bool tcg_op_supported(TCGOpcode op)
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


