Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2D6E576CA7
	for <lists+qemu-devel@lfdr.de>; Sat, 16 Jul 2022 10:57:57 +0200 (CEST)
Received: from localhost ([::1]:34220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oCdca-0002mQ-KJ
	for lists+qemu-devel@lfdr.de; Sat, 16 Jul 2022 04:57:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1oCdZW-0005ku-3E
 for qemu-devel@nongnu.org; Sat, 16 Jul 2022 04:54:46 -0400
Received: from mail.loongson.cn ([114.242.206.163]:50212 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1oCdZU-0006g7-5e
 for qemu-devel@nongnu.org; Sat, 16 Jul 2022 04:54:45 -0400
Received: from localhost.localdomain (unknown [10.2.5.185])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxz9PCfNJijWQiAA--.28082S10; 
 Sat, 16 Jul 2022 16:54:31 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, alex.bennee@linaro.org, f4bug@amsat.org,
 gaosong@loongson.cn, peter.maydell@linaro.org, yangxiaojuan@loongson.cn
Subject: [PATCH 8/8] tests/tcg/loongarch64: Add pcadd related instructions test
Date: Sat, 16 Jul 2022 16:54:26 +0800
Message-Id: <20220716085426.3098060-9-gaosong@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220716085426.3098060-1-gaosong@loongson.cn>
References: <20220716085426.3098060-1-gaosong@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dxz9PCfNJijWQiAA--.28082S10
X-Coremail-Antispam: 1UD129KBjvJXoW7WryxuFyxJr48Zry8Xw48Crg_yoW8AryDpr
 1Y9F4Fkws7KFyfur13GFyqgF43ta93C3W2vF17GrnFv39FkFyUtw13KrsrXFW2k3y8WryS
 vwnakF1fua4UX3JanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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
- PCADDI
- PCADDU12I
- PCADDU18I
- PCALAU12I

Signed-off-by: Song Gao <gaosong@loongson.cn>
---
 tests/tcg/loongarch64/Makefile.target |  1 +
 tests/tcg/loongarch64/test_pcadd.c    | 38 +++++++++++++++++++++++++++
 2 files changed, 39 insertions(+)
 create mode 100644 tests/tcg/loongarch64/test_pcadd.c

diff --git a/tests/tcg/loongarch64/Makefile.target b/tests/tcg/loongarch64/Makefile.target
index b320d9fd9c..0115de78ef 100644
--- a/tests/tcg/loongarch64/Makefile.target
+++ b/tests/tcg/loongarch64/Makefile.target
@@ -14,5 +14,6 @@ LOONGARCH64_TESTS  = test_bit
 LOONGARCH64_TESTS  += test_div
 LOONGARCH64_TESTS  += test_fclass
 LOONGARCH64_TESTS  += test_fpcom
+LOONGARCH64_TESTS  += test_pcadd
 
 TESTS += $(LOONGARCH64_TESTS)
diff --git a/tests/tcg/loongarch64/test_pcadd.c b/tests/tcg/loongarch64/test_pcadd.c
new file mode 100644
index 0000000000..da2a64db82
--- /dev/null
+++ b/tests/tcg/loongarch64/test_pcadd.c
@@ -0,0 +1,38 @@
+#include <assert.h>
+#include <inttypes.h>
+#include <string.h>
+
+#define TEST_PCADDU(N)                              \
+void test_##N(int a)                                \
+{                                                   \
+    uint64_t rd1 = 0;                               \
+    uint64_t rd2 = 0;                               \
+    uint64_t rm, rn;                                \
+                                                    \
+    asm volatile(""#N" %0, 0x104\n\t"               \
+                 ""#N" %1, 0x12345\n\t"             \
+                 : "=r"(rd1), "=r"(rd2)             \
+                 : );                               \
+    rm = rd2 - rd1;                                 \
+    if (!strcmp(#N, "pcalau12i")) {                 \
+        rn = ((0x12345UL - 0x104) << a) & ~0xfff;   \
+    } else {                                        \
+        rn = ((0x12345UL - 0x104) << a) + 4;        \
+    }                                               \
+    assert(rm == rn);                               \
+}
+
+TEST_PCADDU(pcaddi)
+TEST_PCADDU(pcaddu12i)
+TEST_PCADDU(pcaddu18i)
+TEST_PCADDU(pcalau12i)
+
+int main()
+{
+    test_pcaddi(2);
+    test_pcaddu12i(12);
+    test_pcaddu18i(18);
+    test_pcalau12i(12);
+
+    return 0;
+}
-- 
2.31.1


