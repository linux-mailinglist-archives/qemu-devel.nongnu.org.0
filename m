Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80FD4576CB4
	for <lists+qemu-devel@lfdr.de>; Sat, 16 Jul 2022 11:06:06 +0200 (CEST)
Received: from localhost ([::1]:49350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oCdkT-0004de-Lr
	for lists+qemu-devel@lfdr.de; Sat, 16 Jul 2022 05:06:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1oCdZO-0005cs-QL
 for qemu-devel@nongnu.org; Sat, 16 Jul 2022 04:54:42 -0400
Received: from mail.loongson.cn ([114.242.206.163]:50122 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1oCdZL-0006eb-P0
 for qemu-devel@nongnu.org; Sat, 16 Jul 2022 04:54:38 -0400
Received: from localhost.localdomain (unknown [10.2.5.185])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxz9PCfNJijWQiAA--.28082S6; 
 Sat, 16 Jul 2022 16:54:30 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, alex.bennee@linaro.org, f4bug@amsat.org,
 gaosong@loongson.cn, peter.maydell@linaro.org, yangxiaojuan@loongson.cn
Subject: [PATCH 4/8] tests/tcg/loongarch64: Add clo related instructions test
Date: Sat, 16 Jul 2022 16:54:22 +0800
Message-Id: <20220716085426.3098060-5-gaosong@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220716085426.3098060-1-gaosong@loongson.cn>
References: <20220716085426.3098060-1-gaosong@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dxz9PCfNJijWQiAA--.28082S6
X-Coremail-Antispam: 1UD129KBjvJXoWxur1UKrWxCw4xWFWDZrW8Zwb_yoW5XFyDpF
 yfCr4rKrs7tFyaqrn3Kr15GF13tan5X3WUuF17Ww10vFZ5ur1kZry8K39rXFWIgF4v9r4f
 Zwnaga1a9FnrXaUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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
- CL{O/Z}.{W/D}
- CT{O/Z}.{W/D}

Signed-off-by: Song Gao <gaosong@loongson.cn>
---
 tests/tcg/loongarch64/Makefile.target | 15 +++++
 tests/tcg/loongarch64/test_bit.c      | 88 +++++++++++++++++++++++++++
 2 files changed, 103 insertions(+)
 create mode 100644 tests/tcg/loongarch64/Makefile.target
 create mode 100644 tests/tcg/loongarch64/test_bit.c

diff --git a/tests/tcg/loongarch64/Makefile.target b/tests/tcg/loongarch64/Makefile.target
new file mode 100644
index 0000000000..c0bd8b9b86
--- /dev/null
+++ b/tests/tcg/loongarch64/Makefile.target
@@ -0,0 +1,15 @@
+# -*- Mode: makefile -*-
+#
+# LoongArch64 specific tweaks
+
+# Loongarch64 doesn't support gdb, so skip the EXTRA_RUNS
+EXTRA_RUNS =
+
+LOONGARCH64_SRC=$(SRC_PATH)/tests/tcg/loongarch64
+VPATH += $(LOONGARCH64_SRC)
+
+LDFLAGS+=-lm
+
+LOONGARCH64_TESTS  = test_bit
+
+TESTS += $(LOONGARCH64_TESTS)
diff --git a/tests/tcg/loongarch64/test_bit.c b/tests/tcg/loongarch64/test_bit.c
new file mode 100644
index 0000000000..a6d9904909
--- /dev/null
+++ b/tests/tcg/loongarch64/test_bit.c
@@ -0,0 +1,88 @@
+#include <assert.h>
+#include <inttypes.h>
+
+#define ARRAY_SIZE(X) (sizeof(X) / sizeof(*(X)))
+#define TEST_CLO(N)                                     \
+static uint64_t test_clo_##N(uint64_t rj)               \
+{                                                       \
+    uint64_t rd = 0;                                    \
+                                                        \
+    asm volatile("clo."#N" %0, %1\n\t"                  \
+                 : "=r"(rd)                             \
+                 : "r"(rj)                              \
+                 : );                                   \
+    return rd;                                          \
+}
+
+#define TEST_CLZ(N)                                     \
+static uint64_t test_clz_##N(uint64_t rj)               \
+{                                                       \
+    uint64_t rd = 0;                                    \
+                                                        \
+    asm volatile("clz."#N" %0, %1\n\t"                  \
+                 : "=r"(rd)                             \
+                 : "r"(rj)                              \
+                 : );                                   \
+    return rd;                                          \
+}
+
+#define TEST_CTO(N)                                     \
+static uint64_t test_cto_##N(uint64_t rj)               \
+{                                                       \
+    uint64_t rd = 0;                                    \
+                                                        \
+    asm volatile("cto."#N" %0, %1\n\t"                  \
+                 : "=r"(rd)                             \
+                 : "r"(rj)                              \
+                 : );                                   \
+    return rd;                                          \
+}
+
+#define TEST_CTZ(N)                                     \
+static uint64_t test_ctz_##N(uint64_t rj)               \
+{                                                       \
+    uint64_t rd = 0;                                    \
+                                                        \
+    asm volatile("ctz."#N" %0, %1\n\t"                  \
+                 : "=r"(rd)                             \
+                 : "r"(rj)                              \
+                 : );                                   \
+    return rd;                                          \
+}
+
+TEST_CLO(w)
+TEST_CLO(d)
+TEST_CLZ(w)
+TEST_CLZ(d)
+TEST_CTO(w)
+TEST_CTO(d)
+TEST_CTZ(w)
+TEST_CTZ(d)
+
+struct vector {
+    uint64_t (*func)(uint64_t);
+    uint64_t u;
+    uint64_t r;
+};
+
+static struct vector vectors[] = {
+    {test_clo_w, 0xfff11fff392476ab, 0},
+    {test_clo_d, 0xabd28a64000000, 0},
+    {test_clz_w, 0xfaffff42392476ab, 2},
+    {test_clz_d, 0xabd28a64000000, 8},
+    {test_cto_w, 0xfff11fff392476ab, 2},
+    {test_cto_d, 0xabd28a64000000, 0},
+    {test_ctz_w, 0xfaffff42392476ab, 0},
+    {test_ctz_d, 0xabd28a64000000, 26},
+};
+
+int main()
+{
+    int i;
+
+    for (i = 0; i < ARRAY_SIZE(vectors); i++) {
+        assert((*vectors[i].func)(vectors[i].u) == vectors[i].r);
+    }
+
+    return 0;
+}
-- 
2.31.1


