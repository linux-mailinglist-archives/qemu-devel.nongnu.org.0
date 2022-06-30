Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC0FA561940
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Jun 2022 13:32:29 +0200 (CEST)
Received: from localhost ([::1]:56976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6sPM-00017A-PP
	for lists+qemu-devel@lfdr.de; Thu, 30 Jun 2022 07:32:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=N4Bw=XF=kaod.org=clg@ozlabs.org>)
 id 1o6sHh-00074K-Ku; Thu, 30 Jun 2022 07:24:33 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:53383)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=N4Bw=XF=kaod.org=clg@ozlabs.org>)
 id 1o6sHf-0001xh-8f; Thu, 30 Jun 2022 07:24:33 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4LYbZc4PSTz4xXD;
 Thu, 30 Jun 2022 21:24:24 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4LYbZZ32jbz4xD5;
 Thu, 30 Jun 2022 21:24:22 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Iris Chen <irischenlj@fb.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PULL 02/27] hw: m25p80: add tests for write protect (WP# and SRWD
 bit)
Date: Thu, 30 Jun 2022 13:23:46 +0200
Message-Id: <20220630112411.1474431-3-clg@kaod.org>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220630112411.1474431-1-clg@kaod.org>
References: <20220630112411.1474431-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=N4Bw=XF=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

From: Iris Chen <irischenlj@fb.com>

Signed-off-by: Iris Chen <irischenlj@fb.com>
Message-Id: <20220624183016.2125264-1-irischenlj@fb.com>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 tests/qtest/aspeed_smc-test.c | 62 +++++++++++++++++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/tests/qtest/aspeed_smc-test.c b/tests/qtest/aspeed_smc-test.c
index b1e682db6545..1258687eacd8 100644
--- a/tests/qtest/aspeed_smc-test.c
+++ b/tests/qtest/aspeed_smc-test.c
@@ -56,7 +56,9 @@ enum {
     BULK_ERASE = 0xc7,
     READ = 0x03,
     PP = 0x02,
+    WRSR = 0x1,
     WREN = 0x6,
+    SRWD = 0x80,
     RESET_ENABLE = 0x66,
     RESET_MEMORY = 0x99,
     EN_4BYTE_ADDR = 0xB7,
@@ -441,6 +443,64 @@ static void test_read_status_reg(void)
     flash_reset();
 }
 
+static void test_status_reg_write_protection(void)
+{
+    uint8_t r;
+
+    spi_conf(CONF_ENABLE_W0);
+
+    /* default case: WP# is high and SRWD is low -> status register writable */
+    spi_ctrl_start_user();
+    writeb(ASPEED_FLASH_BASE, WREN);
+    /* test ability to write SRWD */
+    writeb(ASPEED_FLASH_BASE, WRSR);
+    writeb(ASPEED_FLASH_BASE, SRWD);
+    writeb(ASPEED_FLASH_BASE, RDSR);
+    r = readb(ASPEED_FLASH_BASE);
+    spi_ctrl_stop_user();
+    g_assert_cmphex(r & SRWD, ==, SRWD);
+
+    /* WP# high and SRWD high -> status register writable */
+    spi_ctrl_start_user();
+    writeb(ASPEED_FLASH_BASE, WREN);
+    /* test ability to write SRWD */
+    writeb(ASPEED_FLASH_BASE, WRSR);
+    writeb(ASPEED_FLASH_BASE, 0);
+    writeb(ASPEED_FLASH_BASE, RDSR);
+    r = readb(ASPEED_FLASH_BASE);
+    spi_ctrl_stop_user();
+    g_assert_cmphex(r & SRWD, ==, 0);
+
+    /* WP# low and SRWD low -> status register writable */
+    qtest_set_irq_in(global_qtest,
+                     "/machine/soc/fmc/ssi.0/child[0]", "WP#", 0, 0);
+    spi_ctrl_start_user();
+    writeb(ASPEED_FLASH_BASE, WREN);
+    /* test ability to write SRWD */
+    writeb(ASPEED_FLASH_BASE, WRSR);
+    writeb(ASPEED_FLASH_BASE, SRWD);
+    writeb(ASPEED_FLASH_BASE, RDSR);
+    r = readb(ASPEED_FLASH_BASE);
+    spi_ctrl_stop_user();
+    g_assert_cmphex(r & SRWD, ==, SRWD);
+
+    /* WP# low and SRWD high -> status register NOT writable */
+    spi_ctrl_start_user();
+    writeb(ASPEED_FLASH_BASE, WREN);
+    /* test ability to write SRWD */
+    writeb(ASPEED_FLASH_BASE, WRSR);
+    writeb(ASPEED_FLASH_BASE, 0);
+    writeb(ASPEED_FLASH_BASE, RDSR);
+    r = readb(ASPEED_FLASH_BASE);
+    spi_ctrl_stop_user();
+    /* write is not successful */
+    g_assert_cmphex(r & SRWD, ==, SRWD);
+
+    qtest_set_irq_in(global_qtest,
+                     "/machine/soc/fmc/ssi.0/child[0]", "WP#", 0, 1);
+    flash_reset();
+}
+
 static char tmp_path[] = "/tmp/qtest.m25p80.XXXXXX";
 
 int main(int argc, char **argv)
@@ -467,6 +527,8 @@ int main(int argc, char **argv)
     qtest_add_func("/ast2400/smc/read_page_mem", test_read_page_mem);
     qtest_add_func("/ast2400/smc/write_page_mem", test_write_page_mem);
     qtest_add_func("/ast2400/smc/read_status_reg", test_read_status_reg);
+    qtest_add_func("/ast2400/smc/status_reg_write_protection",
+                   test_status_reg_write_protection);
 
     flash_reset();
     ret = g_test_run();
-- 
2.35.3


