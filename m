Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BB2D576CA6
	for <lists+qemu-devel@lfdr.de>; Sat, 16 Jul 2022 10:57:56 +0200 (CEST)
Received: from localhost ([::1]:34126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oCdcZ-0002ir-NH
	for lists+qemu-devel@lfdr.de; Sat, 16 Jul 2022 04:57:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1oCdZO-0005cr-Nu
 for qemu-devel@nongnu.org; Sat, 16 Jul 2022 04:54:42 -0400
Received: from mail.loongson.cn ([114.242.206.163]:50142 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1oCdZL-0006eg-PD
 for qemu-devel@nongnu.org; Sat, 16 Jul 2022 04:54:38 -0400
Received: from localhost.localdomain (unknown [10.2.5.185])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxz9PCfNJijWQiAA--.28082S7; 
 Sat, 16 Jul 2022 16:54:31 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, alex.bennee@linaro.org, f4bug@amsat.org,
 gaosong@loongson.cn, peter.maydell@linaro.org, yangxiaojuan@loongson.cn
Subject: [PATCH 5/8] tests/tcg/loongarch64: Add div and mod related
 instructions test
Date: Sat, 16 Jul 2022 16:54:23 +0800
Message-Id: <20220716085426.3098060-6-gaosong@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220716085426.3098060-1-gaosong@loongson.cn>
References: <20220716085426.3098060-1-gaosong@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dxz9PCfNJijWQiAA--.28082S7
X-Coremail-Antispam: 1UD129KBjvJXoW7Cw1fCF1rJFyxXw4rZFyxXwb_yoW8tF1rpr
 1UCF1rKrWxGFWS9r1fJry5WF1ftan3ua4UZa47Gw12v397uryxZw1UKrnrXFW7Ka18Wr42
 v3s5ZrWag3WUtaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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
- DIV.{W[U]/D[U]}
- MOD.{W[U]/D[U]}

Signed-off-by: Song Gao <gaosong@loongson.cn>
---
 tests/tcg/loongarch64/Makefile.target |  1 +
 tests/tcg/loongarch64/test_div.c      | 54 +++++++++++++++++++++++++++
 2 files changed, 55 insertions(+)
 create mode 100644 tests/tcg/loongarch64/test_div.c

diff --git a/tests/tcg/loongarch64/Makefile.target b/tests/tcg/loongarch64/Makefile.target
index c0bd8b9b86..24d6bb11e9 100644
--- a/tests/tcg/loongarch64/Makefile.target
+++ b/tests/tcg/loongarch64/Makefile.target
@@ -11,5 +11,6 @@ VPATH += $(LOONGARCH64_SRC)
 LDFLAGS+=-lm
 
 LOONGARCH64_TESTS  = test_bit
+LOONGARCH64_TESTS  += test_div
 
 TESTS += $(LOONGARCH64_TESTS)
diff --git a/tests/tcg/loongarch64/test_div.c b/tests/tcg/loongarch64/test_div.c
new file mode 100644
index 0000000000..6c31fe97ae
--- /dev/null
+++ b/tests/tcg/loongarch64/test_div.c
@@ -0,0 +1,54 @@
+#include <assert.h>
+#include <inttypes.h>
+#include <stdio.h>
+
+#define TEST_DIV(N, M)                               \
+static void test_div_ ##N(uint ## M ## _t rj,        \
+                          uint ## M ## _t rk,        \
+                          uint64_t rm)               \
+{                                                    \
+    uint64_t rd = 0;                                 \
+                                                     \
+    asm volatile("div."#N" %0,%1,%2\n\t"             \
+                 : "=r"(rd)                          \
+                 : "r"(rj), "r"(rk)                  \
+                 : );                                \
+    assert(rd == rm);                                \
+}
+
+#define TEST_MOD(N, M)                               \
+static void test_mod_ ##N(uint ## M ## _t rj,        \
+                          uint ## M ## _t rk,        \
+                          uint64_t rm)               \
+{                                                    \
+    uint64_t rd = 0;                                 \
+                                                     \
+    asm volatile("mod."#N" %0,%1,%2\n\t"             \
+                 : "=r"(rd)                          \
+                 : "r"(rj), "r"(rk)                  \
+                 : );                                \
+    assert(rd == rm);                                \
+}
+
+TEST_DIV(w, 32)
+TEST_DIV(wu, 32)
+TEST_DIV(d, 64)
+TEST_DIV(du, 64)
+TEST_MOD(w, 32)
+TEST_MOD(wu, 32)
+TEST_MOD(d, 64)
+TEST_MOD(du, 64)
+
+int main(void)
+{
+    test_div_w(0xffaced97, 0xc36abcde, 0x0);
+    test_div_wu(0xffaced97, 0xc36abcde, 0x1);
+    test_div_d(0xffaced973582005f, 0xef56832a358b, 0xffffffffffffffa8);
+    test_div_du(0xffaced973582005f, 0xef56832a358b, 0x11179);
+    test_mod_w(0x7cf18c32, 0xa04da650, 0x1d3f3282);
+    test_mod_wu(0x7cf18c32, 0xc04da650, 0x7cf18c32);
+    test_mod_d(0x7cf18c3200000000, 0xa04da65000000000, 0x1d3f328200000000);
+    test_mod_du(0x7cf18c3200000000, 0xc04da65000000000, 0x7cf18c3200000000);
+
+    return 0;
+}
-- 
2.31.1


