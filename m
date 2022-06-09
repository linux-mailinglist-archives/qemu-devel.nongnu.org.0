Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EA195441D1
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 05:16:32 +0200 (CEST)
Received: from localhost ([::1]:36304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nz8et-0004pQ-6C
	for lists+qemu-devel@lfdr.de; Wed, 08 Jun 2022 23:16:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=71593e3617=irischenlj@fb.com>)
 id 1nz8cN-0002mB-AW; Wed, 08 Jun 2022 23:13:55 -0400
Received: from mx0a-00082601.pphosted.com ([67.231.145.42]:30560)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=71593e3617=irischenlj@fb.com>)
 id 1nz8cJ-0004Ny-N3; Wed, 08 Jun 2022 23:13:54 -0400
Received: from pps.filterd (m0148461.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 258NnfJl011299;
 Wed, 8 Jun 2022 20:13:32 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=facebook;
 bh=A1/8YLGWKTY92wfJMtFQwPs1QyEdcR4DSPnCSXRpWLo=;
 b=WGssUZxoqOWPWNNbB8GRYWjBhnU1V2tCLTGR25tE8FA34r96WPN/Ey5ifB6ZUUwiOqHf
 b+3iMB5Z52173vwCE4k5lvaKQh2ai4LMX20lMcgx/y017irDZeJ7XBHHF1+ECMUKtDZ2
 ylgqBccL8koLVqHk0PNBy6xYSX47xAjJMuI= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 3gjhy6yj2j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 08 Jun 2022 20:13:32 -0700
Received: from localhost (2620:10d:c0a8:1b::d) by mail.thefacebook.com
 (2620:10d:c0a8:83::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Wed, 8 Jun
 2022 20:13:31 -0700
From: Iris Chen <irischenlj@fb.com>
To: <irischenlj@fb.com>
CC: <pdel@fb.com>, <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>,
 <clg@kaod.org>, <patrick@stwcx.xyz>, <alistair@alistair23.me>,
 <kwolf@redhat.com>, <hreitz@redhat.com>, <peter.maydell@linaro.org>,
 <andrew@aj.id.au>, <joel@jms.id.au>, <thuth@redhat.com>,
 <lvivier@redhat.com>, <pbonzini@redhat.com>, <qemu-block@nongnu.org>
Subject: [PATCH v2 2/2] hw: m25p80: add tests for write protect
Date: Wed, 8 Jun 2022 20:13:20 -0700
Message-ID: <20220609031320.2212468-2-irischenlj@fb.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220609031320.2212468-1-irischenlj@fb.com>
References: <20220609031320.2212468-1-irischenlj@fb.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [2620:10d:c0a8:1b::d]
X-Proofpoint-GUID: 8sgLw3Q10o3BcDNQuED_n4-OXixaJ9vv
X-Proofpoint-ORIG-GUID: 8sgLw3Q10o3BcDNQuED_n4-OXixaJ9vv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-08_05,2022-06-07_02,2022-02-23_01
Received-SPF: pass client-ip=67.231.145.42;
 envelope-from=prvs=71593e3617=irischenlj@fb.com;
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
Include the tests in a separate patch. Using qtest_set_irq_in() as per review.

 tests/qtest/aspeed_smc-test.c | 60 +++++++++++++++++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/tests/qtest/aspeed_smc-test.c b/tests/qtest/aspeed_smc-test.c
index c5d97d4410..7786addfb8 100644
--- a/tests/qtest/aspeed_smc-test.c
+++ b/tests/qtest/aspeed_smc-test.c
@@ -392,6 +392,64 @@ static void test_read_status_reg(void)
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
@@ -418,6 +476,8 @@ int main(int argc, char **argv)
     qtest_add_func("/ast2400/smc/read_page_mem", test_read_page_mem);
     qtest_add_func("/ast2400/smc/write_page_mem", test_write_page_mem);
     qtest_add_func("/ast2400/smc/read_status_reg", test_read_status_reg);
+    qtest_add_func("/ast2400/smc/status_reg_write_protection",
+                   test_status_reg_write_protection);
 
     ret = g_test_run();
 
-- 
2.30.2


