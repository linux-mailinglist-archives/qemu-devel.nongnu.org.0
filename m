Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 400AF575266
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jul 2022 18:05:27 +0200 (CEST)
Received: from localhost ([::1]:43352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oC1LB-0001wI-J0
	for lists+qemu-devel@lfdr.de; Thu, 14 Jul 2022 12:05:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=QWOl=XT=kaod.org=clg@ozlabs.org>)
 id 1oC12D-0005RS-Ec; Thu, 14 Jul 2022 11:45:55 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]:57821
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=QWOl=XT=kaod.org=clg@ozlabs.org>)
 id 1oC129-0000tl-3H; Thu, 14 Jul 2022 11:45:47 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4LkJjd1dCKz4xvN;
 Fri, 15 Jul 2022 01:45:41 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4LkJjb3Nhsz4xRC;
 Fri, 15 Jul 2022 01:45:39 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Iris Chen <irischenlj@fb.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PULL 16/19] hw: m25p80: add tests for BP and TB bit write protect
Date: Thu, 14 Jul 2022 17:44:53 +0200
Message-Id: <20220714154456.2565189-17-clg@kaod.org>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220714154456.2565189-1-clg@kaod.org>
References: <20220714154456.2565189-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=QWOl=XT=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
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

From: Iris Chen <irischenlj@fb.com>

Signed-off-by: Iris Chen <irischenlj@fb.com>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Message-Id: <20220627185234.1911337-3-irischenlj@fb.com>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 tests/qtest/aspeed_smc-test.c | 111 ++++++++++++++++++++++++++++++++++
 1 file changed, 111 insertions(+)

diff --git a/tests/qtest/aspeed_smc-test.c b/tests/qtest/aspeed_smc-test.c
index 1258687eacd8..05ce941566e6 100644
--- a/tests/qtest/aspeed_smc-test.c
+++ b/tests/qtest/aspeed_smc-test.c
@@ -192,6 +192,24 @@ static void read_page_mem(uint32_t addr, uint32_t *page)
     }
 }
 
+static void write_page_mem(uint32_t addr, uint32_t write_value)
+{
+    spi_ctrl_setmode(CTRL_WRITEMODE, PP);
+
+    for (int i = 0; i < FLASH_PAGE_SIZE / 4; i++) {
+        writel(ASPEED_FLASH_BASE + addr + i * 4, write_value);
+    }
+}
+
+static void assert_page_mem(uint32_t addr, uint32_t expected_value)
+{
+    uint32_t page[FLASH_PAGE_SIZE / 4];
+    read_page_mem(addr, page);
+    for (int i = 0; i < FLASH_PAGE_SIZE / 4; i++) {
+        g_assert_cmphex(page[i], ==, expected_value);
+    }
+}
+
 static void test_erase_sector(void)
 {
     uint32_t some_page_addr = 0x600 * FLASH_PAGE_SIZE;
@@ -501,6 +519,95 @@ static void test_status_reg_write_protection(void)
     flash_reset();
 }
 
+static void test_write_block_protect(void)
+{
+    uint32_t sector_size = 65536;
+    uint32_t n_sectors = 512;
+
+    spi_ce_ctrl(1 << CRTL_EXTENDED0);
+    spi_conf(CONF_ENABLE_W0);
+
+    uint32_t bp_bits = 0b0;
+
+    for (int i = 0; i < 16; i++) {
+        bp_bits = ((i & 0b1000) << 3) | ((i & 0b0111) << 2);
+
+        spi_ctrl_start_user();
+        writeb(ASPEED_FLASH_BASE, WREN);
+        writeb(ASPEED_FLASH_BASE, BULK_ERASE);
+        writeb(ASPEED_FLASH_BASE, WREN);
+        writeb(ASPEED_FLASH_BASE, WRSR);
+        writeb(ASPEED_FLASH_BASE, bp_bits);
+        writeb(ASPEED_FLASH_BASE, EN_4BYTE_ADDR);
+        writeb(ASPEED_FLASH_BASE, WREN);
+        spi_ctrl_stop_user();
+
+        uint32_t num_protected_sectors = i ? MIN(1 << (i - 1), n_sectors) : 0;
+        uint32_t protection_start = n_sectors - num_protected_sectors;
+        uint32_t protection_end = n_sectors;
+
+        for (int sector = 0; sector < n_sectors; sector++) {
+            uint32_t addr = sector * sector_size;
+
+            assert_page_mem(addr, 0xffffffff);
+            write_page_mem(addr, make_be32(0xabcdef12));
+
+            uint32_t expected_value = protection_start <= sector
+                                      && sector < protection_end
+                                      ? 0xffffffff : 0xabcdef12;
+
+            assert_page_mem(addr, expected_value);
+        }
+    }
+
+    flash_reset();
+}
+
+static void test_write_block_protect_bottom_bit(void)
+{
+    uint32_t sector_size = 65536;
+    uint32_t n_sectors = 512;
+
+    spi_ce_ctrl(1 << CRTL_EXTENDED0);
+    spi_conf(CONF_ENABLE_W0);
+
+    /* top bottom bit is enabled */
+    uint32_t bp_bits = 0b00100 << 3;
+
+    for (int i = 0; i < 16; i++) {
+        bp_bits = (((i & 0b1000) | 0b0100) << 3) | ((i & 0b0111) << 2);
+
+        spi_ctrl_start_user();
+        writeb(ASPEED_FLASH_BASE, WREN);
+        writeb(ASPEED_FLASH_BASE, BULK_ERASE);
+        writeb(ASPEED_FLASH_BASE, WREN);
+        writeb(ASPEED_FLASH_BASE, WRSR);
+        writeb(ASPEED_FLASH_BASE, bp_bits);
+        writeb(ASPEED_FLASH_BASE, EN_4BYTE_ADDR);
+        writeb(ASPEED_FLASH_BASE, WREN);
+        spi_ctrl_stop_user();
+
+        uint32_t num_protected_sectors = i ? MIN(1 << (i - 1), n_sectors) : 0;
+        uint32_t protection_start = 0;
+        uint32_t protection_end = num_protected_sectors;
+
+        for (int sector = 0; sector < n_sectors; sector++) {
+            uint32_t addr = sector * sector_size;
+
+            assert_page_mem(addr, 0xffffffff);
+            write_page_mem(addr, make_be32(0xabcdef12));
+
+            uint32_t expected_value = protection_start <= sector
+                                      && sector < protection_end
+                                      ? 0xffffffff : 0xabcdef12;
+
+            assert_page_mem(addr, expected_value);
+        }
+    }
+
+    flash_reset();
+}
+
 static char tmp_path[] = "/tmp/qtest.m25p80.XXXXXX";
 
 int main(int argc, char **argv)
@@ -529,6 +636,10 @@ int main(int argc, char **argv)
     qtest_add_func("/ast2400/smc/read_status_reg", test_read_status_reg);
     qtest_add_func("/ast2400/smc/status_reg_write_protection",
                    test_status_reg_write_protection);
+    qtest_add_func("/ast2400/smc/write_block_protect",
+                   test_write_block_protect);
+    qtest_add_func("/ast2400/smc/write_block_protect_bottom_bit",
+                   test_write_block_protect_bottom_bit);
 
     flash_reset();
     ret = g_test_run();
-- 
2.35.3


