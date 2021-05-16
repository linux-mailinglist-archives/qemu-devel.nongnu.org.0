Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87F17381EDA
	for <lists+qemu-devel@lfdr.de>; Sun, 16 May 2021 14:46:20 +0200 (CEST)
Received: from localhost ([::1]:53228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liG9z-0001i7-IW
	for lists+qemu-devel@lfdr.de; Sun, 16 May 2021 08:46:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1liFyi-0007E5-6f
 for qemu-devel@nongnu.org; Sun, 16 May 2021 08:34:40 -0400
Received: from mail-qt1-x82a.google.com ([2607:f8b0:4864:20::82a]:38492)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1liFyg-0007hU-1F
 for qemu-devel@nongnu.org; Sun, 16 May 2021 08:34:39 -0400
Received: by mail-qt1-x82a.google.com with SMTP id h21so3018221qtu.5
 for <qemu-devel@nongnu.org>; Sun, 16 May 2021 05:34:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vInOL7n4fh0AFReF/5gQxfmHVQY38UqwnHgnHGBM/24=;
 b=LuHn+Zh/6j8uHB575uNaPMh3bB9898hjP5KEJtRJk7WK9pk3sYfWBSxFoDaxfyHeRA
 i03Sgct0IUDiJdqM3O6Qy4HfVCwNPjuk4MJLl7z4AE/CfvMX+KStChhWogO5DiMXepAy
 A6Ox/GCUng1paWtYfAX/RAwR1Cx1Ecga3rcHjDGWgz/21ip4558tRykOrpOLyjPqZDge
 xUSFSFoEuSH5ss28ybSvfpmTUkDk1Vd0U6aR/75tM+0q63LAuTDiamzIFmXWUougLZc2
 8FoVLaidWtbusw3Fuf7IvBQFz6DBS7T7vpiUxxLnMBjUTIjIja7Ts6ZWdq0LOVEV4emV
 ghgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vInOL7n4fh0AFReF/5gQxfmHVQY38UqwnHgnHGBM/24=;
 b=RNmMnbPk7tgdv4zPsy+bX1qduhc/FQU9hRO2tKoYVn+S9hyzVPjSpR2eagnLmNw1E6
 NWGZC6t4fHifwa85iXcrddak3gfJrXzRqZdJ8Zbgwq028Z3hQZOXA0stTwNOYHKqflB3
 G66TT0YSDc/BHH3fWrimOvP3crcxcHaAC9IuLnhZVN8VJ6IlsvQ5+nDmn5o7+m3aue+a
 Z6Tclki7+q7lzWAhtYGLQ+Yb4oWJI/kxI8YV7SbU8t2joWEOHscEGvCxCUMFFza/XHik
 Lu9xOSVDMZ4hbMR/eGlnerkted7QCADTKd7Pdl/7Wr91Cz/xwNQFzTzUhwtHSsmyP12g
 DcMQ==
X-Gm-Message-State: AOAM533FbOMceZsI9qiuLM5VwKaAlhlHBDaVnP/mpGyhyImIl0lrHIv9
 a2A39IIrblylK5vxQxHfpB1svj0njDYdGpS9JmU=
X-Google-Smtp-Source: ABdhPJzM8ZWhAU3EAawrhvUSOcJn6P1cgP4lgx0Wfuvk55oOUGfcj0jYWmMbvEL2hslxfYVewagaig==
X-Received: by 2002:a05:622a:11cd:: with SMTP id
 n13mr24228803qtk.37.1621168477128; 
 Sun, 16 May 2021 05:34:37 -0700 (PDT)
Received: from localhost.localdomain (163.189-204-200.bestelclientes.com.mx.
 [189.204.200.163])
 by smtp.gmail.com with ESMTPSA id s5sm8500553qkg.88.2021.05.16.05.34.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 May 2021 05:34:36 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 05/46] tests/fp: add quad support to the benchmark utility
Date: Sun, 16 May 2021 07:33:50 -0500
Message-Id: <20210516123431.718318-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210516123431.718318-1-richard.henderson@linaro.org>
References: <20210516123431.718318-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82a;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x82a.google.com
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alex Bennée <alex.bennee@linaro.org>

Currently this only support softfloat calculations because working out
if the hardware supports 128 bit floats needs configure magic. The 3
op muladd operation is currently unimplemented so commented out for
now.

Reviewed-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20201020163738.27700-8-alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tests/fp/fp-bench.c | 88 ++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 83 insertions(+), 5 deletions(-)

diff --git a/tests/fp/fp-bench.c b/tests/fp/fp-bench.c
index 4ba5e1d2d4..d319993280 100644
--- a/tests/fp/fp-bench.c
+++ b/tests/fp/fp-bench.c
@@ -14,6 +14,7 @@
 #include <math.h>
 #include <fenv.h>
 #include "qemu/timer.h"
+#include "qemu/int128.h"
 #include "fpu/softfloat.h"
 
 /* amortize the computation of random inputs */
@@ -50,8 +51,10 @@ static const char * const op_names[] = {
 enum precision {
     PREC_SINGLE,
     PREC_DOUBLE,
+    PREC_QUAD,
     PREC_FLOAT32,
     PREC_FLOAT64,
+    PREC_FLOAT128,
     PREC_MAX_NR,
 };
 
@@ -89,6 +92,7 @@ union fp {
     double d;
     float32 f32;
     float64 f64;
+    float128 f128;
     uint64_t u64;
 };
 
@@ -113,6 +117,10 @@ struct op_desc {
 static uint64_t random_ops[MAX_OPERANDS] = {
     SEED_A, SEED_B, SEED_C,
 };
+
+static float128 random_quad_ops[MAX_OPERANDS] = {
+    {SEED_A, SEED_B}, {SEED_B, SEED_C}, {SEED_C, SEED_A},
+};
 static float_status soft_status;
 static enum precision precision;
 static enum op operation;
@@ -141,25 +149,45 @@ static void update_random_ops(int n_ops, enum precision prec)
     int i;
 
     for (i = 0; i < n_ops; i++) {
-        uint64_t r = random_ops[i];
 
         switch (prec) {
         case PREC_SINGLE:
         case PREC_FLOAT32:
+        {
+            uint64_t r = random_ops[i];
             do {
                 r = xorshift64star(r);
             } while (!float32_is_normal(r));
+            random_ops[i] = r;
             break;
+        }
         case PREC_DOUBLE:
         case PREC_FLOAT64:
+        {
+            uint64_t r = random_ops[i];
             do {
                 r = xorshift64star(r);
             } while (!float64_is_normal(r));
+            random_ops[i] = r;
             break;
+        }
+        case PREC_QUAD:
+        case PREC_FLOAT128:
+        {
+            float128 r = random_quad_ops[i];
+            uint64_t hi = r.high;
+            uint64_t lo = r.low;
+            do {
+                hi = xorshift64star(hi);
+                lo = xorshift64star(lo);
+                r = make_float128(hi, lo);
+            } while (!float128_is_normal(r));
+            random_quad_ops[i] = r;
+            break;
+        }
         default:
             g_assert_not_reached();
         }
-        random_ops[i] = r;
     }
 }
 
@@ -184,6 +212,13 @@ static void fill_random(union fp *ops, int n_ops, enum precision prec,
                 ops[i].f64 = float64_chs(ops[i].f64);
             }
             break;
+        case PREC_QUAD:
+        case PREC_FLOAT128:
+            ops[i].f128 = random_quad_ops[i];
+            if (no_neg && float128_is_neg(ops[i].f128)) {
+                ops[i].f128 = float128_chs(ops[i].f128);
+            }
+            break;
         default:
             g_assert_not_reached();
         }
@@ -345,6 +380,41 @@ static void bench(enum precision prec, enum op op, int n_ops, bool no_neg)
                 }
             }
             break;
+        case PREC_FLOAT128:
+            fill_random(ops, n_ops, prec, no_neg);
+            t0 = get_clock();
+            for (i = 0; i < OPS_PER_ITER; i++) {
+                float128 a = ops[0].f128;
+                float128 b = ops[1].f128;
+                /* float128 c = ops[2].f128; */
+
+                switch (op) {
+                case OP_ADD:
+                    res.f128 = float128_add(a, b, &soft_status);
+                    break;
+                case OP_SUB:
+                    res.f128 = float128_sub(a, b, &soft_status);
+                    break;
+                case OP_MUL:
+                    res.f128 = float128_mul(a, b, &soft_status);
+                    break;
+                case OP_DIV:
+                    res.f128 = float128_div(a, b, &soft_status);
+                    break;
+                /* case OP_FMA: */
+                /*     res.f128 = float128_muladd(a, b, c, 0, &soft_status); */
+                /*     break; */
+                case OP_SQRT:
+                    res.f128 = float128_sqrt(a, &soft_status);
+                    break;
+                case OP_CMP:
+                    res.u64 = float128_compare_quiet(a, b, &soft_status);
+                    break;
+                default:
+                    g_assert_not_reached();
+                }
+            }
+            break;
         default:
             g_assert_not_reached();
         }
@@ -369,7 +439,8 @@ static void bench(enum precision prec, enum op op, int n_ops, bool no_neg)
     GEN_BENCH(bench_ ## opname ## _float, float, PREC_SINGLE, op, n_ops) \
     GEN_BENCH(bench_ ## opname ## _double, double, PREC_DOUBLE, op, n_ops) \
     GEN_BENCH(bench_ ## opname ## _float32, float32, PREC_FLOAT32, op, n_ops) \
-    GEN_BENCH(bench_ ## opname ## _float64, float64, PREC_FLOAT64, op, n_ops)
+    GEN_BENCH(bench_ ## opname ## _float64, float64, PREC_FLOAT64, op, n_ops) \
+    GEN_BENCH(bench_ ## opname ## _float128, float128, PREC_FLOAT128, op, n_ops)
 
 GEN_BENCH_ALL_TYPES(add, OP_ADD, 2)
 GEN_BENCH_ALL_TYPES(sub, OP_SUB, 2)
@@ -383,7 +454,8 @@ GEN_BENCH_ALL_TYPES(cmp, OP_CMP, 2)
     GEN_BENCH_NO_NEG(bench_ ## name ## _float, float, PREC_SINGLE, op, n) \
     GEN_BENCH_NO_NEG(bench_ ## name ## _double, double, PREC_DOUBLE, op, n) \
     GEN_BENCH_NO_NEG(bench_ ## name ## _float32, float32, PREC_FLOAT32, op, n) \
-    GEN_BENCH_NO_NEG(bench_ ## name ## _float64, float64, PREC_FLOAT64, op, n)
+    GEN_BENCH_NO_NEG(bench_ ## name ## _float64, float64, PREC_FLOAT64, op, n) \
+    GEN_BENCH_NO_NEG(bench_ ## name ## _float128, float128, PREC_FLOAT128, op, n)
 
 GEN_BENCH_ALL_TYPES_NO_NEG(sqrt, OP_SQRT, 1)
 #undef GEN_BENCH_ALL_TYPES_NO_NEG
@@ -397,6 +469,7 @@ GEN_BENCH_ALL_TYPES_NO_NEG(sqrt, OP_SQRT, 1)
         [PREC_DOUBLE]    = bench_ ## opname ## _double,         \
         [PREC_FLOAT32]   = bench_ ## opname ## _float32,        \
         [PREC_FLOAT64]   = bench_ ## opname ## _float64,        \
+        [PREC_FLOAT128]   = bench_ ## opname ## _float128,      \
     }
 
 static const bench_func_t bench_funcs[OP_MAX_NR][PREC_MAX_NR] = {
@@ -445,7 +518,7 @@ static void usage_complete(int argc, char *argv[])
     fprintf(stderr, " -h = show this help message.\n");
     fprintf(stderr, " -o = floating point operation (%s). Default: %s\n",
             op_list, op_names[0]);
-    fprintf(stderr, " -p = floating point precision (single, double). "
+    fprintf(stderr, " -p = floating point precision (single, double, quad[soft only]). "
             "Default: single\n");
     fprintf(stderr, " -r = rounding mode (even, zero, down, up, tieaway). "
             "Default: even\n");
@@ -565,6 +638,8 @@ static void parse_args(int argc, char *argv[])
                 precision = PREC_SINGLE;
             } else if (!strcmp(optarg, "double")) {
                 precision = PREC_DOUBLE;
+            } else if (!strcmp(optarg, "quad")) {
+                precision = PREC_QUAD;
             } else {
                 fprintf(stderr, "Unsupported precision '%s'\n", optarg);
                 exit(EXIT_FAILURE);
@@ -608,6 +683,9 @@ static void parse_args(int argc, char *argv[])
         case PREC_DOUBLE:
             precision = PREC_FLOAT64;
             break;
+        case PREC_QUAD:
+            precision = PREC_FLOAT128;
+            break;
         default:
             g_assert_not_reached();
         }
-- 
2.25.1


