Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 891E243F636
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 06:39:45 +0200 (CEST)
Received: from localhost ([::1]:54722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgJg7-0003w0-HI
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 00:39:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgJaF-0003bz-JK
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 00:33:39 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:54270)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgJaC-0007t5-JK
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 00:33:39 -0400
Received: by mail-pj1-x1033.google.com with SMTP id v10so5740713pjr.3
 for <qemu-devel@nongnu.org>; Thu, 28 Oct 2021 21:33:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fbM8vP6oZVfBjMkR+F02D0JXw0BXydMmw3R+Qwyc8Wk=;
 b=Tac/Vbr2hMrspQmu4wTVbahRfzkJmWUClNmphXhc/I306RjO5ZUuEw/PCJ3fTVvJcN
 D0zGtUqb5hvGkHuuxsNTIxCIRrzRd+6Wm7L1eKAI2rM4N/Wj641/cj7vIZ18pbK9xAoa
 GZbV3BmFgtffGoeKHjaspA2IVtBhgtBUVTWpx82+ejb5omqAEb5Tgn36+caENpUvfz+D
 Ujp68F5R1CcoYG0MPCR9c6SOZN8+lN28O8D0gqTUcGW/WqhbHjf65EEphoe8rUHkQCuj
 iN53VE+Yl4mkTHBhuY9QfGIKq717IFKt8TSqVvxlWaEiEFQNbn65InMEmiBwItT3WAVP
 +49w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fbM8vP6oZVfBjMkR+F02D0JXw0BXydMmw3R+Qwyc8Wk=;
 b=fMd6JlR29X0OvkdwZn1pfo9ZCqecXU6e+AAyTRvY/Qnhd9hhkFBcb7RW6Y49iCVNSp
 HCKCoozT042uxZleN/SEFG2WApzC0VtyO7Nfi4sJ9295P8zfHCGiUlSo4/7Ke+0STW1c
 T6PmLrvgBmSPNNqkNRSXBwAC/+4Fw/0RopvHzFOS7unZJaCJqjkqH4jhJAlYnSO0v363
 tapv1K3gTYWvp/WfIiKy7aCYwGLT7d+VNlhszz5eE+/3mIFGSH6inlbvu14JWQcsAjOp
 RjU2d8gn14Kvv6+qq1TxJGqkAJUJdlQ0FAxr5lc/39yySpXEVlNb4bWYrr/GqMkewBnF
 ZZRQ==
X-Gm-Message-State: AOAM530J0RPLA/7JbZ7Ntwh4elv1/oew/Mk/ap16TwZq1HTyRdQTD+p0
 iFYkOm/pz0J2EChGWa7UIJn5jL76Yhi2Dg==
X-Google-Smtp-Source: ABdhPJym+QAwnw8mpnWsmMmEaotWjjvOJEc5P2FdcX2QsArCqyJpbYeYKyGy5WBQnuCy6WIGLAO65w==
X-Received: by 2002:a17:90b:1b42:: with SMTP id
 nv2mr9110494pjb.196.1635482015219; 
 Thu, 28 Oct 2021 21:33:35 -0700 (PDT)
Received: from localhost.localdomain (174-21-75-75.tukw.qwest.net.
 [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id i11sm4120257pgp.18.2021.10.28.21.33.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Oct 2021 21:33:34 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL v2 05/60] host-utils: add unit tests for divu128/divs128
Date: Thu, 28 Oct 2021 21:32:34 -0700
Message-Id: <20211029043329.1518029-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211029043329.1518029-1-richard.henderson@linaro.org>
References: <20211029043329.1518029-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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
Cc: Luis Pires <luis.pires@eldorado.org.br>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Luis Pires <luis.pires@eldorado.org.br>

Signed-off-by: Luis Pires <luis.pires@eldorado.org.br>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20211025191154.350831-5-luis.pires@eldorado.org.br>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tests/unit/test-div128.c | 197 +++++++++++++++++++++++++++++++++++++++
 tests/unit/meson.build   |   1 +
 2 files changed, 198 insertions(+)
 create mode 100644 tests/unit/test-div128.c

diff --git a/tests/unit/test-div128.c b/tests/unit/test-div128.c
new file mode 100644
index 0000000000..0bc25fe4a8
--- /dev/null
+++ b/tests/unit/test-div128.c
@@ -0,0 +1,197 @@
+/*
+ * Test 128-bit division functions
+ *
+ * Copyright (c) 2021 Instituto de Pesquisas Eldorado (eldorado.org.br)
+ *
+ * This library is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU Lesser General Public
+ * License as published by the Free Software Foundation; either
+ * version 2.1 of the License, or (at your option) any later version.
+ *
+ * This library is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * Lesser General Public License for more details.
+ *
+ * You should have received a copy of the GNU Lesser General Public
+ * License along with this library; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/host-utils.h"
+
+typedef struct {
+    uint64_t high;
+    uint64_t low;
+    uint64_t rhigh;
+    uint64_t rlow;
+    uint64_t divisor;
+    uint64_t remainder;
+} test_data_unsigned;
+
+typedef struct {
+    int64_t high;
+    uint64_t low;
+    int64_t rhigh;
+    uint64_t rlow;
+    int64_t divisor;
+    int64_t remainder;
+} test_data_signed;
+
+static const test_data_unsigned test_table_unsigned[] = {
+    /* Dividend fits in 64 bits */
+    { 0x0000000000000000ULL, 0x0000000000000000ULL,
+      0x0000000000000000ULL, 0x0000000000000000ULL,
+      0x0000000000000001ULL, 0x0000000000000000ULL},
+    { 0x0000000000000000ULL, 0x0000000000000001ULL,
+      0x0000000000000000ULL, 0x0000000000000001ULL,
+      0x0000000000000001ULL, 0x0000000000000000ULL},
+    { 0x0000000000000000ULL, 0x0000000000000003ULL,
+      0x0000000000000000ULL, 0x0000000000000001ULL,
+      0x0000000000000002ULL, 0x0000000000000001ULL},
+    { 0x0000000000000000ULL, 0x8000000000000000ULL,
+      0x0000000000000000ULL, 0x8000000000000000ULL,
+      0x0000000000000001ULL, 0x0000000000000000ULL},
+    { 0x0000000000000000ULL, 0xa000000000000000ULL,
+      0x0000000000000000ULL, 0x0000000000000002ULL,
+      0x4000000000000000ULL, 0x2000000000000000ULL},
+    { 0x0000000000000000ULL, 0x8000000000000000ULL,
+      0x0000000000000000ULL, 0x0000000000000001ULL,
+      0x8000000000000000ULL, 0x0000000000000000ULL},
+
+    /* Dividend > 64 bits, with MSB 0 */
+    { 0x123456789abcdefeULL, 0xefedcba987654321ULL,
+      0x123456789abcdefeULL, 0xefedcba987654321ULL,
+      0x0000000000000001ULL, 0x0000000000000000ULL},
+    { 0x123456789abcdefeULL, 0xefedcba987654321ULL,
+      0x0000000000000001ULL, 0x000000000000000dULL,
+      0x123456789abcdefeULL, 0x03456789abcdf03bULL},
+    { 0x123456789abcdefeULL, 0xefedcba987654321ULL,
+      0x0123456789abcdefULL, 0xeefedcba98765432ULL,
+      0x0000000000000010ULL, 0x0000000000000001ULL},
+
+    /* Dividend > 64 bits, with MSB 1 */
+    { 0xfeeddccbbaa99887ULL, 0x766554433221100fULL,
+      0xfeeddccbbaa99887ULL, 0x766554433221100fULL,
+      0x0000000000000001ULL, 0x0000000000000000ULL},
+    { 0xfeeddccbbaa99887ULL, 0x766554433221100fULL,
+      0x0000000000000001ULL, 0x0000000000000000ULL,
+      0xfeeddccbbaa99887ULL, 0x766554433221100fULL},
+    { 0xfeeddccbbaa99887ULL, 0x766554433221100fULL,
+      0x0feeddccbbaa9988ULL, 0x7766554433221100ULL,
+      0x0000000000000010ULL, 0x000000000000000fULL},
+    { 0xfeeddccbbaa99887ULL, 0x766554433221100fULL,
+      0x000000000000000eULL, 0x00f0f0f0f0f0f35aULL,
+      0x123456789abcdefeULL, 0x0f8922bc55ef90c3ULL},
+
+    /**
+     * Divisor == 64 bits, with MSB 1
+     * and high 64 bits of dividend >= divisor
+     * (for testing normalization)
+     */
+    { 0xfeeddccbbaa99887ULL, 0x766554433221100fULL,
+      0x0000000000000001ULL, 0x0000000000000000ULL,
+      0xfeeddccbbaa99887ULL, 0x766554433221100fULL},
+    { 0xfeeddccbbaa99887ULL, 0x766554433221100fULL,
+      0x0000000000000001ULL, 0xfddbb9977553310aULL,
+      0x8000000000000001ULL, 0x78899aabbccddf05ULL},
+
+    /* Dividend > 64 bits, divisor almost as big */
+    { 0x0000000000000001ULL, 0x23456789abcdef01ULL,
+      0x0000000000000000ULL, 0x000000000000000fULL,
+      0x123456789abcdefeULL, 0x123456789abcde1fULL},
+};
+
+static const test_data_signed test_table_signed[] = {
+    /* Positive dividend, positive/negative divisors */
+    { 0x0000000000000000LL, 0x0000000000bc614eULL,
+      0x0000000000000000LL, 0x0000000000bc614eULL,
+      0x0000000000000001LL, 0x0000000000000000LL},
+    { 0x0000000000000000LL, 0x0000000000bc614eULL,
+      0xffffffffffffffffLL, 0xffffffffff439eb2ULL,
+      0xffffffffffffffffLL, 0x0000000000000000LL},
+    { 0x0000000000000000LL, 0x0000000000bc614eULL,
+      0x0000000000000000LL, 0x00000000005e30a7ULL,
+      0x0000000000000002LL, 0x0000000000000000LL},
+    { 0x0000000000000000LL, 0x0000000000bc614eULL,
+      0xffffffffffffffffLL, 0xffffffffffa1cf59ULL,
+      0xfffffffffffffffeLL, 0x0000000000000000LL},
+    { 0x0000000000000000LL, 0x0000000000bc614eULL,
+      0x0000000000000000LL, 0x0000000000178c29ULL,
+      0x0000000000000008LL, 0x0000000000000006LL},
+    { 0x0000000000000000LL, 0x0000000000bc614eULL,
+      0xffffffffffffffffLL, 0xffffffffffe873d7ULL,
+      0xfffffffffffffff8LL, 0x0000000000000006LL},
+    { 0x0000000000000000LL, 0x0000000000bc614eULL,
+      0x0000000000000000LL, 0x000000000000550dULL,
+      0x0000000000000237LL, 0x0000000000000183LL},
+    { 0x0000000000000000LL, 0x0000000000bc614eULL,
+      0xffffffffffffffffLL, 0xffffffffffffaaf3ULL,
+      0xfffffffffffffdc9LL, 0x0000000000000183LL},
+
+    /* Negative dividend, positive/negative divisors */
+    { 0xffffffffffffffffLL, 0xffffffffff439eb2ULL,
+      0xffffffffffffffffLL, 0xffffffffff439eb2ULL,
+      0x0000000000000001LL, 0x0000000000000000LL},
+    { 0xffffffffffffffffLL, 0xffffffffff439eb2ULL,
+      0x0000000000000000LL, 0x0000000000bc614eULL,
+      0xffffffffffffffffLL, 0x0000000000000000LL},
+    { 0xffffffffffffffffLL, 0xffffffffff439eb2ULL,
+      0xffffffffffffffffLL, 0xffffffffffa1cf59ULL,
+      0x0000000000000002LL, 0x0000000000000000LL},
+    { 0xffffffffffffffffLL, 0xffffffffff439eb2ULL,
+      0x0000000000000000LL, 0x00000000005e30a7ULL,
+      0xfffffffffffffffeLL, 0x0000000000000000LL},
+    { 0xffffffffffffffffLL, 0xffffffffff439eb2ULL,
+      0xffffffffffffffffLL, 0xffffffffffe873d7ULL,
+      0x0000000000000008LL, 0xfffffffffffffffaLL},
+    { 0xffffffffffffffffLL, 0xffffffffff439eb2ULL,
+      0x0000000000000000LL, 0x0000000000178c29ULL,
+      0xfffffffffffffff8LL, 0xfffffffffffffffaLL},
+    { 0xffffffffffffffffLL, 0xffffffffff439eb2ULL,
+      0xffffffffffffffffLL, 0xffffffffffffaaf3ULL,
+      0x0000000000000237LL, 0xfffffffffffffe7dLL},
+    { 0xffffffffffffffffLL, 0xffffffffff439eb2ULL,
+      0x0000000000000000LL, 0x000000000000550dULL,
+      0xfffffffffffffdc9LL, 0xfffffffffffffe7dLL},
+};
+
+static void test_divu128(void)
+{
+    int i;
+    uint64_t rem;
+    test_data_unsigned tmp;
+
+    for (i = 0; i < ARRAY_SIZE(test_table_unsigned); ++i) {
+        tmp = test_table_unsigned[i];
+
+        rem = divu128(&tmp.low, &tmp.high, tmp.divisor);
+        g_assert_cmpuint(tmp.low, ==, tmp.rlow);
+        g_assert_cmpuint(tmp.high, ==, tmp.rhigh);
+        g_assert_cmpuint(rem, ==, tmp.remainder);
+    }
+}
+
+static void test_divs128(void)
+{
+    int i;
+    int64_t rem;
+    test_data_signed tmp;
+
+    for (i = 0; i < ARRAY_SIZE(test_table_signed); ++i) {
+        tmp = test_table_signed[i];
+
+        rem = divs128(&tmp.low, &tmp.high, tmp.divisor);
+        g_assert_cmpuint(tmp.low, ==, tmp.rlow);
+        g_assert_cmpuint(tmp.high, ==, tmp.rhigh);
+        g_assert_cmpuint(rem, ==, tmp.remainder);
+    }
+}
+
+int main(int argc, char **argv)
+{
+    g_test_init(&argc, &argv, NULL);
+    g_test_add_func("/host-utils/test_divu128", test_divu128);
+    g_test_add_func("/host-utils/test_divs128", test_divs128);
+    return g_test_run();
+}
diff --git a/tests/unit/meson.build b/tests/unit/meson.build
index 7c297d7e5c..5ac2d9e943 100644
--- a/tests/unit/meson.build
+++ b/tests/unit/meson.build
@@ -23,6 +23,7 @@ tests = {
   # all code tested by test-x86-cpuid is inside topology.h
   'test-x86-cpuid': [],
   'test-cutils': [],
+  'test-div128': [],
   'test-shift128': [],
   'test-mul64': [],
   # all code tested by test-int128 is inside int128.h
-- 
2.25.1


