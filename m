Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBC8E5696F6
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jul 2022 02:40:12 +0200 (CEST)
Received: from localhost ([::1]:52004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9FYx-0007nq-D1
	for lists+qemu-devel@lfdr.de; Wed, 06 Jul 2022 20:40:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lkujaw@member.fsf.org>)
 id 1o9FWP-0006TB-2j
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 20:37:34 -0400
Received: from mout-u-204.mailbox.org ([80.241.59.204]:43382)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim 4.90_1) (envelope-from <lkujaw@member.fsf.org>)
 id 1o9FWM-00036u-LN
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 20:37:32 -0400
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-u-204.mailbox.org (Postfix) with ESMTPS id 4Ldctd1mByz9sQ9;
 Thu,  7 Jul 2022 02:37:13 +0200 (CEST)
From: Lev Kujawski <lkujaw@member.fsf.org>
To: qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Lev Kujawski <lkujaw@member.fsf.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>
Subject: [PATCH v2 2/2] hw/i386/postcard: New test suite for the ISA POST card
 device
Date: Thu,  7 Jul 2022 00:37:05 +0000
Message-Id: <20220707003705.43894-2-lkujaw@member.fsf.org>
In-Reply-To: <20220707003705.43894-1-lkujaw@member.fsf.org>
References: <20220707003705.43894-1-lkujaw@member.fsf.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=80.241.59.204; envelope-from=lkujaw@member.fsf.org;
 helo=mout-u-204.mailbox.org
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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

Verify that port 0x80 behavior corresponds with i440FX hardware.
Despite the name of the device, said behavior is implemented by the
system board and does not depend upon the actual presence of a POST
card.

In particular:
 a) Writes to port 0x80 are retained and may be read afterwards.
 b) Word and double word reads return a repeated sequence of the
    written octet.

Reference platform:
 TYAN S1686D (i440FX system board)

Signed-off-by: Lev Kujawski <lkujaw@member.fsf.org>
---
 (v2) First revision of test suite.

 MAINTAINERS                 |   1 +
 tests/qtest/meson.build     |   1 +
 tests/qtest/postcard-test.c | 122 ++++++++++++++++++++++++++++++++++++
 3 files changed, 124 insertions(+)
 create mode 100644 tests/qtest/postcard-test.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 33b13583b7..801494d955 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1723,6 +1723,7 @@ ISA POST card
 M: Lev Kujawski <lkujaw@member.fsf.org>
 S: Supported
 F: hw/i386/postcard.c
+F: tests/qtest/postcard-test.c
 
 Xtensa Machines
 ---------------
diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index 31287a9173..0718bdb394 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -47,6 +47,7 @@ qtests_i386 = \
   (config_all_devices.has_key('CONFIG_ISA_IPMI_KCS') ? ['ipmi-kcs-test'] : []) +            \
   (config_host.has_key('CONFIG_LINUX') and                                                  \
    config_all_devices.has_key('CONFIG_ISA_IPMI_BT') ? ['ipmi-bt-test'] : []) +              \
+  (config_all_devices.has_key('CONFIG_POST_CARD') ? ['postcard-test'] : []) +               \
   (config_all_devices.has_key('CONFIG_WDT_IB700') ? ['wdt_ib700-test'] : []) +              \
   (config_all_devices.has_key('CONFIG_PVPANIC_ISA') ? ['pvpanic-test'] : []) +              \
   (config_all_devices.has_key('CONFIG_PVPANIC_PCI') ? ['pvpanic-pci-test'] : []) +          \
diff --git a/tests/qtest/postcard-test.c b/tests/qtest/postcard-test.c
new file mode 100644
index 0000000000..2e04876d4a
--- /dev/null
+++ b/tests/qtest/postcard-test.c
@@ -0,0 +1,122 @@
+/*
+ * Test Suite for the ISA POST Card
+ *
+ * Copyright (c) 2022 Lev Kujawski
+ *
+ *  This program is free software; you can redistribute it and/or
+ *  modify it under the terms of the GNU General Public License as
+ *  published by the Free Software Foundation; either version 2 of the
+ *  License, or (at your option) any later version.
+ *
+ *  This program is distributed in the hope that it will be useful,
+ *  but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
+ *  General Public License for more details.
+ *
+ *  You should have received a copy of the GNU General Public License
+ *  along with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include "qemu/osdep.h"
+#include "libqtest-single.h"
+#include "hw/i386/postcard.h"
+
+
+/* I/O helper functions */
+static void
+post_card_write(uint8_t val)
+{
+    outb(POST_CARD_PORT_DEFAULT, val);
+}
+
+static uint8_t
+post_card_readb(void)
+{
+    return inb(POST_CARD_PORT_DEFAULT);
+}
+
+static uint16_t
+post_card_readw(void)
+{
+    return inw(POST_CARD_PORT_DEFAULT);
+}
+
+static uint32_t
+post_card_readl(void)
+{
+    return inl(POST_CARD_PORT_DEFAULT);
+}
+
+
+/* Testing framework */
+static QTestState *qts;
+
+static void
+test_setup(void)
+{
+    assert(qts == NULL);
+    qts = qtest_start("-machine pc");
+    assert(qts != NULL);
+}
+
+static void
+test_teardown(void)
+{
+    assert(qts != NULL);
+    qtest_quit(qts);
+    qts = NULL;
+}
+
+
+/* Test cases */
+static void
+test_initial_state(void)
+{
+    test_setup();
+    g_assert_cmphex(post_card_readb(), ==, 0x00);
+    test_teardown();
+}
+
+static void
+test_retain_write(void)
+{
+    test_setup();
+    g_assert_cmphex(post_card_readb(), ==, 0x00);
+    post_card_write(0xaa);
+    g_assert_cmphex(post_card_readb(), ==, 0xaa);
+    test_teardown();
+}
+
+static void
+test_read_word(void)
+{
+    test_setup();
+    g_assert_cmphex(post_card_readb(), ==, 0x00);
+    post_card_write(0xa5);
+    g_assert_cmphex(post_card_readw(), ==, 0xa5a5);
+    test_teardown();
+}
+
+static void
+test_read_double_word(void)
+{
+    test_setup();
+    g_assert_cmphex(post_card_readb(), ==, 0x00);
+    post_card_write(0xa5);
+    g_assert_cmphex(post_card_readl(), ==, 0xa5a5a5a5);
+    test_teardown();
+}
+
+
+int
+main(int argc, char **argv)
+{
+    g_test_init(&argc, &argv, NULL);
+
+    qtest_add_func("/postcard/initial_state", test_initial_state);
+    qtest_add_func("/postcard/retain_write", test_retain_write);
+    qtest_add_func("/postcard/read_word", test_read_word);
+    qtest_add_func("/postcard/read_double_word", test_read_double_word);
+
+    return g_test_run();
+}
-- 
2.34.1


