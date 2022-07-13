Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CA39573159
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jul 2022 10:41:26 +0200 (CEST)
Received: from localhost ([::1]:34358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBXvx-0006wu-6X
	for lists+qemu-devel@lfdr.de; Wed, 13 Jul 2022 04:41:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=zHgX=XS=kaod.org=clg@ozlabs.org>)
 id 1oBXBy-0008IT-AN; Wed, 13 Jul 2022 03:53:54 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]:33587
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=zHgX=XS=kaod.org=clg@ozlabs.org>)
 id 1oBXBw-0002d0-Lp; Wed, 13 Jul 2022 03:53:54 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4LjVHf1tNtz4ySl;
 Wed, 13 Jul 2022 17:53:50 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4LjVHc1N1pz4ySW;
 Wed, 13 Jul 2022 17:53:47 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Delevoryas <peter@pjd.dev>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PULL 17/19] qtest/aspeed_gpio: Add input pin modification test
Date: Wed, 13 Jul 2022 09:52:53 +0200
Message-Id: <20220713075255.2248923-18-clg@kaod.org>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220713075255.2248923-1-clg@kaod.org>
References: <20220713075255.2248923-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=zHgX=XS=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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

From: Peter Delevoryas <peter@pjd.dev>

Verify the current behavior, which is that input pins can be modified by
guest OS register writes.

Signed-off-by: Peter Delevoryas <peter@pjd.dev>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Message-Id: <20220712023219.41065-2-peter@pjd.dev>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 tests/qtest/aspeed_gpio-test.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/tests/qtest/aspeed_gpio-test.c b/tests/qtest/aspeed_gpio-test.c
index bac63e8742f4..8f524540998d 100644
--- a/tests/qtest/aspeed_gpio-test.c
+++ b/tests/qtest/aspeed_gpio-test.c
@@ -28,6 +28,11 @@
 #include "qapi/qmp/qdict.h"
 #include "libqtest-single.h"
 
+#define AST2600_GPIO_BASE 0x1E780000
+
+#define GPIO_ABCD_DATA_VALUE 0x000
+#define GPIO_ABCD_DIRECTION  0x004
+
 static void test_set_colocated_pins(const void *data)
 {
     QTestState *s = (QTestState *)data;
@@ -46,6 +51,27 @@ static void test_set_colocated_pins(const void *data)
     g_assert(!qtest_qom_get_bool(s, "/machine/soc/gpio", "gpioV7"));
 }
 
+static void test_set_input_pins(const void *data)
+{
+    QTestState *s = (QTestState *)data;
+    char name[16];
+    uint32_t value;
+
+    qtest_writel(s, AST2600_GPIO_BASE + GPIO_ABCD_DIRECTION, 0x00000000);
+    for (char c = 'A'; c <= 'D'; c++) {
+        for (int i = 0; i < 8; i++) {
+            sprintf(name, "gpio%c%d", c, i);
+            qtest_qom_set_bool(s, "/machine/soc/gpio", name, true);
+        }
+    }
+    value = qtest_readl(s, AST2600_GPIO_BASE + GPIO_ABCD_DATA_VALUE);
+    g_assert_cmphex(value, ==, 0xffffffff);
+
+    qtest_writel(s, AST2600_GPIO_BASE + GPIO_ABCD_DATA_VALUE, 0x00000000);
+    value = qtest_readl(s, AST2600_GPIO_BASE + GPIO_ABCD_DATA_VALUE);
+    g_assert_cmphex(value, ==, 0x00000000);
+}
+
 int main(int argc, char **argv)
 {
     QTestState *s;
@@ -56,6 +82,7 @@ int main(int argc, char **argv)
     s = qtest_init("-machine ast2600-evb");
     qtest_add_data_func("/ast2600/gpio/set_colocated_pins", s,
                         test_set_colocated_pins);
+    qtest_add_data_func("/ast2600/gpio/set_input_pins", s, test_set_input_pins);
     r = g_test_run();
     qtest_quit(s);
 
-- 
2.35.3


