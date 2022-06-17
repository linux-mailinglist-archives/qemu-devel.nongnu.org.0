Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4B8B550063
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Jun 2022 01:11:18 +0200 (CEST)
Received: from localhost ([::1]:56162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o2L7V-0003sG-O8
	for lists+qemu-devel@lfdr.de; Fri, 17 Jun 2022 19:11:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=71671d6567=irischenlj@fb.com>)
 id 1o2L5o-0001zK-1x; Fri, 17 Jun 2022 19:09:32 -0400
Received: from mx0a-00082601.pphosted.com ([67.231.145.42]:31314)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=71671d6567=irischenlj@fb.com>)
 id 1o2L5l-0006Yu-Ue; Fri, 17 Jun 2022 19:09:31 -0400
Received: from pps.filterd (m0109333.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25HLhoJc013012;
 Fri, 17 Jun 2022 16:09:15 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=facebook; bh=dGx63IkBb37Dy7y4/eGMSA5zI9E8FLS1pLhhionajpY=;
 b=U38YrZ2YUYthTvykWvXxpyh8uL1+qZyo1q7t7r+0zvDZBsH+afB+UVFlDG+yZUk9eaMz
 37vmGtt00DsQ6yChYOJSlILBOhGv9lcI6IyIIfZHwEJTNfclUZhHp0EJPZlQxBlrgbRq
 Yc6MMoUG4WKzFRzWicVJB60kQkxMEZ2o+Ao= 
Received: from mail.thefacebook.com ([163.114.132.120])
 by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 3gqt6fwp9g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 17 Jun 2022 16:09:15 -0700
Received: from localhost (2620:10d:c085:108::8) by mail.thefacebook.com
 (2620:10d:c085:11d::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Fri, 17 Jun
 2022 16:09:14 -0700
From: Iris Chen <irischenlj@fb.com>
To: 
CC: <irischenlj@fb.com>, <pdel@fb.com>, <qemu-devel@nongnu.org>,
 <qemu-arm@nongnu.org>, <clg@kaod.org>, <patrick@stwcx.xyz>,
 <alistair@alistair23.me>, <kwolf@redhat.com>, <hreitz@redhat.com>,
 <peter.maydell@linaro.org>, <andrew@aj.id.au>, <joel@jms.id.au>,
 <thuth@redhat.com>, <lvivier@redhat.com>, <pbonzini@redhat.com>,
 <qemu-block@nongnu.org>, <dz4list@gmail.com>
Subject: [PATCH 1/1] hw: m25p80: fixing individual test failure when tests are
 running in isolation
Date: Fri, 17 Jun 2022 16:09:03 -0700
Message-ID: <20220617230903.2542638-1-irischenlj@fb.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [2620:10d:c085:108::8]
X-Proofpoint-GUID: aq6Z81dRVVh5bOSZSqND3EGJ-0S41mKd
X-Proofpoint-ORIG-GUID: aq6Z81dRVVh5bOSZSqND3EGJ-0S41mKd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-17_15,2022-06-17_01,2022-02-23_01
Received-SPF: pass client-ip=67.231.145.42;
 envelope-from=prvs=71671d6567=irischenlj@fb.com;
 helo=mx0a-00082601.pphosted.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Signed-off-by: Iris Chen <irischenlj@fb.com>
---
 tests/qtest/aspeed_smc-test.c | 74 +++++++++++++++++++++++++++++------
 1 file changed, 63 insertions(+), 11 deletions(-)

diff --git a/tests/qtest/aspeed_smc-test.c b/tests/qtest/aspeed_smc-test.c
index ec233315e6..b1e682db65 100644
--- a/tests/qtest/aspeed_smc-test.c
+++ b/tests/qtest/aspeed_smc-test.c
@@ -135,6 +135,9 @@ static void flash_reset(void)
     spi_ctrl_start_user();
     writeb(ASPEED_FLASH_BASE, RESET_ENABLE);
     writeb(ASPEED_FLASH_BASE, RESET_MEMORY);
+    writeb(ASPEED_FLASH_BASE, WREN);
+    writeb(ASPEED_FLASH_BASE, BULK_ERASE);
+    writeb(ASPEED_FLASH_BASE, WRDI);
     spi_ctrl_stop_user();
 
     spi_conf_remove(CONF_ENABLE_W0);
@@ -195,21 +198,41 @@ static void test_erase_sector(void)
 
     spi_conf(CONF_ENABLE_W0);
 
+    /*
+     * Previous page should be full of 0xffs after backend is
+     * initialized
+     */
+    read_page(some_page_addr - FLASH_PAGE_SIZE, page);
+    for (i = 0; i < FLASH_PAGE_SIZE / 4; i++) {
+        g_assert_cmphex(page[i], ==, 0xffffffff);
+    }
+
     spi_ctrl_start_user();
-    writeb(ASPEED_FLASH_BASE, WREN);
     writeb(ASPEED_FLASH_BASE, EN_4BYTE_ADDR);
-    writeb(ASPEED_FLASH_BASE, ERASE_SECTOR);
+    writeb(ASPEED_FLASH_BASE, WREN);
+    writeb(ASPEED_FLASH_BASE, PP);
     writel(ASPEED_FLASH_BASE, make_be32(some_page_addr));
+
+    /* Fill the page with its own addresses */
+    for (i = 0; i < FLASH_PAGE_SIZE / 4; i++) {
+        writel(ASPEED_FLASH_BASE, make_be32(some_page_addr + i * 4));
+    }
     spi_ctrl_stop_user();
 
-    /* Previous page should be full of zeroes as backend is not
-     * initialized */
-    read_page(some_page_addr - FLASH_PAGE_SIZE, page);
+    /* Check the page is correctly written */
+    read_page(some_page_addr, page);
     for (i = 0; i < FLASH_PAGE_SIZE / 4; i++) {
-        g_assert_cmphex(page[i], ==, 0x0);
+        g_assert_cmphex(page[i], ==, some_page_addr + i * 4);
     }
 
-    /* But this one was erased */
+    spi_ctrl_start_user();
+    writeb(ASPEED_FLASH_BASE, WREN);
+    writeb(ASPEED_FLASH_BASE, EN_4BYTE_ADDR);
+    writeb(ASPEED_FLASH_BASE, ERASE_SECTOR);
+    writel(ASPEED_FLASH_BASE, make_be32(some_page_addr));
+    spi_ctrl_stop_user();
+
+    /* Check the page is erased */
     read_page(some_page_addr, page);
     for (i = 0; i < FLASH_PAGE_SIZE / 4; i++) {
         g_assert_cmphex(page[i], ==, 0xffffffff);
@@ -226,11 +249,31 @@ static void test_erase_all(void)
 
     spi_conf(CONF_ENABLE_W0);
 
-    /* Check some random page. Should be full of zeroes as backend is
-     * not initialized */
+    /*
+     * Previous page should be full of 0xffs after backend is
+     * initialized
+     */
+    read_page(some_page_addr - FLASH_PAGE_SIZE, page);
+    for (i = 0; i < FLASH_PAGE_SIZE / 4; i++) {
+        g_assert_cmphex(page[i], ==, 0xffffffff);
+    }
+
+    spi_ctrl_start_user();
+    writeb(ASPEED_FLASH_BASE, EN_4BYTE_ADDR);
+    writeb(ASPEED_FLASH_BASE, WREN);
+    writeb(ASPEED_FLASH_BASE, PP);
+    writel(ASPEED_FLASH_BASE, make_be32(some_page_addr));
+
+    /* Fill the page with its own addresses */
+    for (i = 0; i < FLASH_PAGE_SIZE / 4; i++) {
+        writel(ASPEED_FLASH_BASE, make_be32(some_page_addr + i * 4));
+    }
+    spi_ctrl_stop_user();
+
+    /* Check the page is correctly written */
     read_page(some_page_addr, page);
     for (i = 0; i < FLASH_PAGE_SIZE / 4; i++) {
-        g_assert_cmphex(page[i], ==, 0x0);
+        g_assert_cmphex(page[i], ==, some_page_addr + i * 4);
     }
 
     spi_ctrl_start_user();
@@ -238,7 +281,7 @@ static void test_erase_all(void)
     writeb(ASPEED_FLASH_BASE, BULK_ERASE);
     spi_ctrl_stop_user();
 
-    /* Recheck that some random page */
+    /* Check the page is erased */
     read_page(some_page_addr, page);
     for (i = 0; i < FLASH_PAGE_SIZE / 4; i++) {
         g_assert_cmphex(page[i], ==, 0xffffffff);
@@ -299,6 +342,14 @@ static void test_read_page_mem(void)
     spi_conf(CONF_ENABLE_W0);
     spi_ctrl_start_user();
     writeb(ASPEED_FLASH_BASE, EN_4BYTE_ADDR);
+    writeb(ASPEED_FLASH_BASE, WREN);
+    writeb(ASPEED_FLASH_BASE, PP);
+    writel(ASPEED_FLASH_BASE, make_be32(my_page_addr));
+
+    /* Fill the page with its own addresses */
+    for (i = 0; i < FLASH_PAGE_SIZE / 4; i++) {
+        writel(ASPEED_FLASH_BASE, make_be32(my_page_addr + i * 4));
+    }
     spi_ctrl_stop_user();
     spi_conf_remove(CONF_ENABLE_W0);
 
@@ -417,6 +468,7 @@ int main(int argc, char **argv)
     qtest_add_func("/ast2400/smc/write_page_mem", test_write_page_mem);
     qtest_add_func("/ast2400/smc/read_status_reg", test_read_status_reg);
 
+    flash_reset();
     ret = g_test_run();
 
     qtest_quit(global_qtest);
-- 
2.30.2


