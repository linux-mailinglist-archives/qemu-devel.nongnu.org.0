Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F77857A664
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jul 2022 20:22:14 +0200 (CEST)
Received: from localhost ([::1]:48204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDrrI-0002Rp-Pk
	for lists+qemu-devel@lfdr.de; Tue, 19 Jul 2022 14:22:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oDrWs-00070x-U3
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 14:01:07 -0400
Received: from mail-oi1-x22c.google.com ([2607:f8b0:4864:20::22c]:37550)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oDrWr-0006GE-3p
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 14:01:06 -0400
Received: by mail-oi1-x22c.google.com with SMTP id i126so7814279oih.4
 for <qemu-devel@nongnu.org>; Tue, 19 Jul 2022 11:01:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rJlDNiQu4UmoEjy4nR7l638brDltqE0DUa/l4asKijY=;
 b=HQzlsMLmqxobcGKtlPbLLg/DlixH9rulXmr474EN0xhcdoO9GKOq5z2iPZ5hBcnKa1
 pEePqXyJF5LuIRP4lYr+E6hKBRTmzup0qFx4HdaEjQXd6JTWokDErAVBv8XQ8ArBG7/D
 ewXDpS+30+gwg80V0wRcUySzlA1JiLjBL9WB5uKrMbxHYAHKSnNica6VOS+f3kZEK6WA
 jyVHl+DYMxcieJEOeJXeVJBmnlRKQk1hKwrM/zxRaHUu4JrH4ThGFYi+SlTvE/a3rr3P
 6o7ttAWvqFVagbi+qTgzn7Tn9NEqzto2TDpvIN4KRw3PkVA6EKPVAbYp83J/ujrHX/yK
 y+Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rJlDNiQu4UmoEjy4nR7l638brDltqE0DUa/l4asKijY=;
 b=m5Nl82JhVzJ/mwyNiNHuxGCd7EWwN+kuiV7GYi512is6UXwd1CzPU/mZv9DkH1AW62
 wPXoK21wVqoLHnz6n1rzO1IFS+nemb6EqhOpo8UEd3onepFJDnj5Yq80k4PtRey6DZfi
 cE1e1rT/UalF7Ew8FLu3+Q86ID2nG9a9fKsFpH+GDaEKPCgtaGEYQ7donT+EUWsXjjH7
 +SmGtECwrFhCS3+kwaDRfvt2p6SKL1TMDrm6P+uWRkqji1awoQzTB1gF2dlmjJmsuQfT
 mFWW/RH/E5N+XRlmNhaC8Nd37G6GUOX7MdBIyoC2BgBZokpY0KOIDWfogbi8sud/rm80
 tAoA==
X-Gm-Message-State: AJIora/c1jd6hzZs3JKFoRCgpvw8kKyYg6TMAuVGheg/D7/lVpT/+O/S
 EE4fifRE8uoe2GD7NbwOxS11GB+fLM1KPvWC
X-Google-Smtp-Source: AGRyM1tVfmkKaermYD7Qfj/L13a5JSRNgq2t0yekPXOySEFdSdfIOMw/nGoPFGfCaHhQ4wWAGi6S1A==
X-Received: by 2002:a05:6808:bd1:b0:337:ac77:d398 with SMTP id
 o17-20020a0568080bd100b00337ac77d398mr322109oik.38.1658253663958; 
 Tue, 19 Jul 2022 11:01:03 -0700 (PDT)
Received: from stoup.. ([172.58.110.182]) by smtp.gmail.com with ESMTPSA id
 c25-20020a4ae259000000b0035eb4e5a6cesm6286747oot.36.2022.07.19.11.01.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jul 2022 11:01:02 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Song Gao <gaosong@loongson.cn>
Subject: [PULL 13/21] tests/tcg/loongarch64: Add fclass test
Date: Tue, 19 Jul 2022 23:29:52 +0530
Message-Id: <20220719180000.378186-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220719180000.378186-1-richard.henderson@linaro.org>
References: <20220719180000.378186-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22c;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Song Gao <gaosong@loongson.cn>

This includes:
- FCLASS.{S/D}

Signed-off-by: Song Gao <gaosong@loongson.cn>
Message-Id: <20220716085426.3098060-7-gaosong@loongson.cn>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tests/tcg/loongarch64/test_fclass.c   | 130 ++++++++++++++++++++++++++
 tests/tcg/loongarch64/Makefile.target |   1 +
 2 files changed, 131 insertions(+)
 create mode 100644 tests/tcg/loongarch64/test_fclass.c

diff --git a/tests/tcg/loongarch64/test_fclass.c b/tests/tcg/loongarch64/test_fclass.c
new file mode 100644
index 0000000000..7ba1d2c151
--- /dev/null
+++ b/tests/tcg/loongarch64/test_fclass.c
@@ -0,0 +1,130 @@
+#include <stdio.h>
+
+/* float class */
+#define FLOAT_CLASS_SIGNALING_NAN      0x001
+#define FLOAT_CLASS_QUIET_NAN          0x002
+#define FLOAT_CLASS_NEGATIVE_INFINITY  0x004
+#define FLOAT_CLASS_NEGATIVE_NORMAL    0x008
+#define FLOAT_CLASS_NEGATIVE_SUBNORMAL 0x010
+#define FLOAT_CLASS_NEGATIVE_ZERO      0x020
+#define FLOAT_CLASS_POSITIVE_INFINITY  0x040
+#define FLOAT_CLASS_POSITIVE_NORMAL    0x080
+#define FLOAT_CLASS_POSITIVE_SUBNORMAL 0x100
+#define FLOAT_CLASS_POSITIVE_ZERO      0x200
+
+#define TEST_FCLASS(N)                            \
+void test_fclass_##N(long s)                      \
+{                                                 \
+    double fd;                                    \
+    long rd;                                      \
+                                                  \
+    asm volatile("fclass."#N" %0, %2\n\t"         \
+                 "movfr2gr."#N" %1, %2\n\t"       \
+                    : "=f"(fd), "=r"(rd)          \
+                    : "f"(s)                      \
+                    : );                          \
+    switch (rd) {                                 \
+    case FLOAT_CLASS_SIGNALING_NAN:               \
+    case FLOAT_CLASS_QUIET_NAN:                   \
+    case FLOAT_CLASS_NEGATIVE_INFINITY:           \
+    case FLOAT_CLASS_NEGATIVE_NORMAL:             \
+    case FLOAT_CLASS_NEGATIVE_SUBNORMAL:          \
+    case FLOAT_CLASS_NEGATIVE_ZERO:               \
+    case FLOAT_CLASS_POSITIVE_INFINITY:           \
+    case FLOAT_CLASS_POSITIVE_NORMAL:             \
+    case FLOAT_CLASS_POSITIVE_SUBNORMAL:          \
+    case FLOAT_CLASS_POSITIVE_ZERO:               \
+        break;                                    \
+    default:                                      \
+        printf("fclass."#N" test failed.\n");     \
+        break;                                    \
+    }                                             \
+}
+
+/*
+ *  float format
+ *  type     |    S  | Exponent  |  Fraction    |  example value
+ *                31 | 30 --23   | 22  | 21 --0 |
+ *                               | bit |
+ *  SNAN         0/1 |   0xFF    | 0   |  !=0   |  0x7FBFFFFF
+ *  QNAN         0/1 |   0xFF    | 1   |        |  0x7FCFFFFF
+ *  -infinity     1  |   0xFF    |     0        |  0xFF800000
+ *  -normal       1  | [1, 0xFE] | [0, 0x7FFFFF]|  0xFF7FFFFF
+ *  -subnormal    1  |    0      |    !=0       |  0x807FFFFF
+ *  -0            1  |    0      |     0        |  0x80000000
+ *  +infinity     0  |   0xFF    |     0        |  0x7F800000
+ *  +normal       0  | [1, 0xFE] | [0, 0x7FFFFF]|  0x7F7FFFFF
+ *  +subnormal    0  |    0      |    !=0       |  0x007FFFFF
+ *  +0            0  |    0      |     0        |  0x00000000
+ */
+
+long float_snan = 0x7FBFFFFF;
+long float_qnan = 0x7FCFFFFF;
+long float_neg_infinity = 0xFF800000;
+long float_neg_normal = 0xFF7FFFFF;
+long float_neg_subnormal = 0x807FFFFF;
+long float_neg_zero = 0x80000000;
+long float_post_infinity = 0x7F800000;
+long float_post_normal = 0x7F7FFFFF;
+long float_post_subnormal = 0x007FFFFF;
+long float_post_zero = 0x00000000;
+
+/*
+ * double format
+ *  type     |    S  | Exponent  |  Fraction     |  example value
+ *                63 | 62  -- 52 | 51  | 50 -- 0 |
+ *                               | bit |
+ *  SNAN         0/1 |  0x7FF    | 0   |  !=0    | 0x7FF7FFFFFFFFFFFF
+ *  QNAN         0/1 |  0x7FF    | 1   |         | 0x7FFFFFFFFFFFFFFF
+ * -infinity      1  |  0x7FF    |    0          | 0xFFF0000000000000
+ * -normal        1  |[1, 0x7FE] |               | 0xFFEFFFFFFFFFFFFF
+ * -subnormal     1  |   0       |   !=0         | 0x8007FFFFFFFFFFFF
+ * -0             1  |   0       |    0          | 0x8000000000000000
+ * +infinity      0  |  0x7FF    |    0          | 0x7FF0000000000000
+ * +normal        0  |[1, 0x7FE] |               | 0x7FEFFFFFFFFFFFFF
+ * +subnormal     0  |  0        |   !=0         | 0x000FFFFFFFFFFFFF
+ * +0             0  |  0        |   0           | 0x0000000000000000
+ */
+
+long double_snan = 0x7FF7FFFFFFFFFFFF;
+long double_qnan = 0x7FFFFFFFFFFFFFFF;
+long double_neg_infinity = 0xFFF0000000000000;
+long double_neg_normal = 0xFFEFFFFFFFFFFFFF;
+long double_neg_subnormal = 0x8007FFFFFFFFFFFF;
+long double_neg_zero = 0x8000000000000000;
+long double_post_infinity = 0x7FF0000000000000;
+long double_post_normal = 0x7FEFFFFFFFFFFFFF;
+long double_post_subnormal = 0x000FFFFFFFFFFFFF;
+long double_post_zero = 0x0000000000000000;
+
+TEST_FCLASS(s)
+TEST_FCLASS(d)
+
+int main()
+{
+    /* fclass.s */
+    test_fclass_s(float_snan);
+    test_fclass_s(float_qnan);
+    test_fclass_s(float_neg_infinity);
+    test_fclass_s(float_neg_normal);
+    test_fclass_s(float_neg_subnormal);
+    test_fclass_s(float_neg_zero);
+    test_fclass_s(float_post_infinity);
+    test_fclass_s(float_post_normal);
+    test_fclass_s(float_post_subnormal);
+    test_fclass_s(float_post_zero);
+
+    /* fclass.d */
+    test_fclass_d(double_snan);
+    test_fclass_d(double_qnan);
+    test_fclass_d(double_neg_infinity);
+    test_fclass_d(double_neg_normal);
+    test_fclass_d(double_neg_subnormal);
+    test_fclass_d(double_neg_zero);
+    test_fclass_d(double_post_infinity);
+    test_fclass_d(double_post_normal);
+    test_fclass_d(double_post_subnormal);
+    test_fclass_d(double_post_zero);
+
+    return 0;
+}
diff --git a/tests/tcg/loongarch64/Makefile.target b/tests/tcg/loongarch64/Makefile.target
index 24d6bb11e9..59d564725a 100644
--- a/tests/tcg/loongarch64/Makefile.target
+++ b/tests/tcg/loongarch64/Makefile.target
@@ -12,5 +12,6 @@ LDFLAGS+=-lm
 
 LOONGARCH64_TESTS  = test_bit
 LOONGARCH64_TESTS  += test_div
+LOONGARCH64_TESTS  += test_fclass
 
 TESTS += $(LOONGARCH64_TESTS)
-- 
2.34.1


