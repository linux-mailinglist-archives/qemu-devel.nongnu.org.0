Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFCF9576CA5
	for <lists+qemu-devel@lfdr.de>; Sat, 16 Jul 2022 10:57:54 +0200 (CEST)
Received: from localhost ([::1]:33954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oCdcX-0002ba-Db
	for lists+qemu-devel@lfdr.de; Sat, 16 Jul 2022 04:57:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1oCdZN-0005co-Er
 for qemu-devel@nongnu.org; Sat, 16 Jul 2022 04:54:37 -0400
Received: from mail.loongson.cn ([114.242.206.163]:50158 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1oCdZK-0006ew-Da
 for qemu-devel@nongnu.org; Sat, 16 Jul 2022 04:54:37 -0400
Received: from localhost.localdomain (unknown [10.2.5.185])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxz9PCfNJijWQiAA--.28082S8; 
 Sat, 16 Jul 2022 16:54:31 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, alex.bennee@linaro.org, f4bug@amsat.org,
 gaosong@loongson.cn, peter.maydell@linaro.org, yangxiaojuan@loongson.cn
Subject: [PATCH 6/8] tests/tcg/loongarch64: Add fclass test
Date: Sat, 16 Jul 2022 16:54:24 +0800
Message-Id: <20220716085426.3098060-7-gaosong@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220716085426.3098060-1-gaosong@loongson.cn>
References: <20220716085426.3098060-1-gaosong@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dxz9PCfNJijWQiAA--.28082S8
X-Coremail-Antispam: 1UD129KBjvJXoWxtF48Jw4rtFy7GrW3ZFyrJFb_yoW7GFyfpF
 10vrWrKrWfJa98XFy7Jr9xKF1UJF4093WUuFnxGrn3Zrn0qr1jgrs7Gr17Jr1xGr4UuF4a
 ya45JFy7K3WUGaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnUUvcSsGvfC2KfnxnUUI43ZEXa7xR_UUUUUUUUU==
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163; envelope-from=gaosong@loongson.cn;
 helo=loongson.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

This includes:
- FCLASS.{S/D}

Signed-off-by: Song Gao <gaosong@loongson.cn>
---
 tests/tcg/loongarch64/Makefile.target |   1 +
 tests/tcg/loongarch64/test_fclass.c   | 130 ++++++++++++++++++++++++++
 2 files changed, 131 insertions(+)
 create mode 100644 tests/tcg/loongarch64/test_fclass.c

diff --git a/tests/tcg/loongarch64/Makefile.target b/tests/tcg/loongarch64/Makefile.target
index 24d6bb11e9..59d564725a 100644
--- a/tests/tcg/loongarch64/Makefile.target
+++ b/tests/tcg/loongarch64/Makefile.target
@@ -12,5 +12,6 @@ LDFLAGS+=-lm
 
 LOONGARCH64_TESTS  = test_bit
 LOONGARCH64_TESTS  += test_div
+LOONGARCH64_TESTS  += test_fclass
 
 TESTS += $(LOONGARCH64_TESTS)
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
-- 
2.31.1


