Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2E49576CB1
	for <lists+qemu-devel@lfdr.de>; Sat, 16 Jul 2022 11:03:59 +0200 (CEST)
Received: from localhost ([::1]:45520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oCdiQ-00025m-P3
	for lists+qemu-devel@lfdr.de; Sat, 16 Jul 2022 05:03:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1oCdZV-0005iz-HN
 for qemu-devel@nongnu.org; Sat, 16 Jul 2022 04:54:45 -0400
Received: from mail.loongson.cn ([114.242.206.163]:50210 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1oCdZT-0006fz-Kx
 for qemu-devel@nongnu.org; Sat, 16 Jul 2022 04:54:45 -0400
Received: from localhost.localdomain (unknown [10.2.5.185])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxz9PCfNJijWQiAA--.28082S9; 
 Sat, 16 Jul 2022 16:54:31 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, alex.bennee@linaro.org, f4bug@amsat.org,
 gaosong@loongson.cn, peter.maydell@linaro.org, yangxiaojuan@loongson.cn
Subject: [PATCH 7/8] tests/tcg/loongarch64: Add som comparison instructions
 test
Date: Sat, 16 Jul 2022 16:54:25 +0800
Message-Id: <20220716085426.3098060-8-gaosong@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220716085426.3098060-1-gaosong@loongson.cn>
References: <20220716085426.3098060-1-gaosong@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dxz9PCfNJijWQiAA--.28082S9
X-Coremail-Antispam: 1UD129KBjvJXoWxJrW5XFWUCFWxWw1xAF47Jwb_yoW8AFWfpw
 15ursYkr4xGF1fZr13Jr95WF15tF4fK3W7ZF17Wr10vrsF9Fy7tr15KrZxtFW7t3yFvF1x
 Z3ZagFya9FyUJ3JanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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

Choose some instructions to test:
- FCMP.cond.S
- cond: ceq clt cle cne seq slt sle sne

Signed-off-by: Song Gao <gaosong@loongson.cn>
---
 tests/tcg/loongarch64/Makefile.target |  1 +
 tests/tcg/loongarch64/test_fpcom.c    | 37 +++++++++++++++++++++++++++
 2 files changed, 38 insertions(+)
 create mode 100644 tests/tcg/loongarch64/test_fpcom.c

diff --git a/tests/tcg/loongarch64/Makefile.target b/tests/tcg/loongarch64/Makefile.target
index 59d564725a..b320d9fd9c 100644
--- a/tests/tcg/loongarch64/Makefile.target
+++ b/tests/tcg/loongarch64/Makefile.target
@@ -13,5 +13,6 @@ LDFLAGS+=-lm
 LOONGARCH64_TESTS  = test_bit
 LOONGARCH64_TESTS  += test_div
 LOONGARCH64_TESTS  += test_fclass
+LOONGARCH64_TESTS  += test_fpcom
 
 TESTS += $(LOONGARCH64_TESTS)
diff --git a/tests/tcg/loongarch64/test_fpcom.c b/tests/tcg/loongarch64/test_fpcom.c
new file mode 100644
index 0000000000..9e81f767f9
--- /dev/null
+++ b/tests/tcg/loongarch64/test_fpcom.c
@@ -0,0 +1,37 @@
+#include <assert.h>
+
+#define TEST_COMP(N)                              \
+void test_##N(float fj, float fk)                 \
+{                                                 \
+    int rd = 0;                                   \
+                                                  \
+    asm volatile("fcmp."#N".s $fcc6,%1,%2\n"      \
+                 "movcf2gr %0, $fcc6\n"           \
+                 : "=r"(rd)                       \
+                 : "f"(fj), "f"(fk)               \
+                 : );                             \
+    assert(rd == 1);                              \
+}
+
+TEST_COMP(ceq)
+TEST_COMP(clt)
+TEST_COMP(cle)
+TEST_COMP(cne)
+TEST_COMP(seq)
+TEST_COMP(slt)
+TEST_COMP(sle)
+TEST_COMP(sne)
+
+int main()
+{
+    test_ceq(0xff700102, 0xff700102);
+    test_clt(0x00730007, 0xff730007);
+    test_cle(0xff70130a, 0xff70130b);
+    test_cne(0x1238acde, 0xff71111f);
+    test_seq(0xff766618, 0xff766619);
+    test_slt(0xff78881c, 0xff78901d);
+    test_sle(0xff780b22, 0xff790b22);
+    test_sne(0xff7bcd25, 0xff7a26cf);
+
+    return 0;
+}
-- 
2.31.1


