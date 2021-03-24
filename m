Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC4F53484E0
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 23:47:45 +0100 (CET)
Received: from localhost ([::1]:51768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPCHw-00071p-Os
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 18:47:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <klaus@linux.vnet.ibm.com>)
 id 1lPCAA-0001wx-02; Wed, 24 Mar 2021 18:39:42 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:51278)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <klaus@linux.vnet.ibm.com>)
 id 1lPCA7-0002qq-Ow; Wed, 24 Mar 2021 18:39:41 -0400
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12OMYLkk024178; Wed, 24 Mar 2021 18:39:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=1J+AX+sAg8gmsWb0OHWC2KKyjWmYKe14LrGev8yWxtM=;
 b=KlQYFcSYumjkrurPpnbLYhFLqX/m9SUBhJKf/65SqmdqnGGNmb+1/4ROJO9uwhzZfzWY
 R0fp9Tznn8B+p+xhBKDRAGEsCGJZKmq1HFzd3566ii9LPnTzJr8ML0V0fii1wuCwhkt0
 To/0gfsbXb5fk/PMYszp4aKYJaQDA1lZJOD9Nap7ii/whBJkLhmxStUMjxeWbtV2F21L
 cToSmsTMMsQyM9ASzwBZf3Tm8GCRMKVroXCJjE7gCwr+CgFZ69NnN9FV5b2h4C4k3sY9
 BLmFmI80mBRrP/UMjsgMJbope/P6pWxx2uhqbxtGnfOcE65jPOoo0uyIta4POkqBSuNc Dg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37ge5f0cv5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 24 Mar 2021 18:39:27 -0400
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 12OMa5vm028473;
 Wed, 24 Mar 2021 18:39:26 -0400
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37ge5f0cux-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 24 Mar 2021 18:39:26 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 12OMarvn022739;
 Wed, 24 Mar 2021 22:39:25 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma02dal.us.ibm.com with ESMTP id 37d9an1dwe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 24 Mar 2021 22:39:25 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 12OMdO8n20578702
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 24 Mar 2021 22:39:24 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2F657C6059;
 Wed, 24 Mar 2021 22:39:24 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 76709C605D;
 Wed, 24 Mar 2021 22:39:21 +0000 (GMT)
Received: from T480-KlausKiwi.localdomain (unknown [9.85.133.239])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 24 Mar 2021 22:39:21 +0000 (GMT)
From: Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
To: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH 3/3] tests: Aspeed HACE Scatter-Gather tests
Date: Wed, 24 Mar 2021 19:38:46 -0300
Message-Id: <20210324223846.17407-4-klaus@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210324223846.17407-1-klaus@linux.vnet.ibm.com>
References: <20210324223846.17407-1-klaus@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-24_13:2021-03-24,
 2021-03-24 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 mlxlogscore=999 clxscore=1015 bulkscore=0 priorityscore=1501 adultscore=0
 impostorscore=0 mlxscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103240161
Received-SPF: none client-ip=148.163.156.1;
 envelope-from=klaus@linux.vnet.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Andrew Jeffery <andrew@aj.id.au>,
 Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Expand current Aspeed HACE testsuite to also include Scatter-Gather of
sha256 and sha512 operations.

Signed-off-by: Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
---
 tests/qtest/aspeed_hace-test.c | 164 ++++++++++++++++++++++++++++++---
 1 file changed, 153 insertions(+), 11 deletions(-)

diff --git a/tests/qtest/aspeed_hace-test.c b/tests/qtest/aspeed_hace-test.c
index 2b624b6b09..ae3f963449 100644
--- a/tests/qtest/aspeed_hace-test.c
+++ b/tests/qtest/aspeed_hace-test.c
@@ -35,6 +35,11 @@
 #define HACE_HASH_DATA_LEN       0x2c
 #define HACE_HASH_CMD            0x30
 
+struct aspeed_sg_list {
+        uint32_t len;
+        uint32_t phy_addr;
+} __attribute__ ((__packed__));
+
 /*
  * Test vector is the ascii "abc"
  *
@@ -63,6 +68,33 @@ static const uint8_t test_result_md5[] = {
     0x90, 0x01, 0x50, 0x98, 0x3c, 0xd2, 0x4f, 0xb0, 0xd6, 0x96, 0x3f, 0x7d,
     0x28, 0xe1, 0x7f, 0x72};
 
+/*
+ * The Scatter-Gather Test vector is the ascii "abc" "def" "ghi", broken
+ * into blocks of 3 characters as shown
+ *
+ * Expected results were generated using command line utitiles:
+ *
+ *  echo -n -e 'abcdefghi' | dd of=/tmp/test
+ *  for hash in sha512sum sha256sum; do $hash /tmp/test; done
+ *
+ */
+static const uint8_t test_vector_sg1[] = {0x61, 0x62, 0x63};
+static const uint8_t test_vector_sg2[] = {0x64, 0x65, 0x66};
+static const uint8_t test_vector_sg3[] = {0x67, 0x68, 0x69};
+
+static const uint8_t test_result_sg_sha512[] = {
+    0xf2, 0x2d, 0x51, 0xd2, 0x52, 0x92, 0xca, 0x1d, 0x0f, 0x68, 0xf6, 0x9a,
+    0xed, 0xc7, 0x89, 0x70, 0x19, 0x30, 0x8c, 0xc9, 0xdb, 0x46, 0xef, 0xb7,
+    0x5a, 0x03, 0xdd, 0x49, 0x4f, 0xc7, 0xf1, 0x26, 0xc0, 0x10, 0xe8, 0xad,
+    0xe6, 0xa0, 0x0a, 0x0c, 0x1a, 0x5f, 0x1b, 0x75, 0xd8, 0x1e, 0x0e, 0xd5,
+    0xa9, 0x3c, 0xe9, 0x8d, 0xc9, 0xb8, 0x33, 0xdb, 0x78, 0x39, 0x24, 0x7b,
+    0x1d, 0x9c, 0x24, 0xfe};
+
+static const uint8_t test_result_sg_sha256[] = {
+    0x19, 0xcc, 0x02, 0xf2, 0x6d, 0xf4, 0x3c, 0xc5, 0x71, 0xbc, 0x9e, 0xd7,
+    0xb0, 0xc4, 0xd2, 0x92, 0x24, 0xa3, 0xec, 0x22, 0x95, 0x29, 0x22, 0x17,
+    0x25, 0xef, 0x76, 0xd0, 0x21, 0xc8, 0x32, 0x6f};
+
 
 static void write_regs(QTestState *s, uint32_t base, uint32_t src,
                        uint32_t length, uint32_t out, uint32_t method)
@@ -167,28 +199,124 @@ static void test_sha512(const char *machine, const uint32_t base,
                     test_result_sha512, sizeof(digest));
 }
 
+static void test_sha256_sg(const char *machine, const uint32_t base,
+                        const uint32_t src_addr)
+{
+    QTestState *s = qtest_init(machine);
+
+    const uint32_t src_addr_1 = src_addr + 0x1000000;
+    const uint32_t src_addr_2 = src_addr + 0x2000000;
+    const uint32_t src_addr_3 = src_addr + 0x3000000;
+    const uint32_t digest_addr = src_addr + 0x4000000;
+    uint8_t digest[32] = {0};
+    struct aspeed_sg_list array[] = {
+            { sizeof(test_vector_sg1),              src_addr_1},
+            { sizeof(test_vector_sg2),              src_addr_2},
+            { sizeof(test_vector_sg3) | 1u << 31,   src_addr_3},
+        };
+
+    /* Check engine is idle, no busy or irq bits set */
+    g_assert_cmphex(qtest_readl(s, base + HACE_STS), ==, 0);
+
+    /* Write test vector into memory */
+    qtest_memwrite(s, src_addr_1, test_vector_sg1, sizeof(test_vector_sg1));
+    qtest_memwrite(s, src_addr_2, test_vector_sg2, sizeof(test_vector_sg2));
+    qtest_memwrite(s, src_addr_3, test_vector_sg3, sizeof(test_vector_sg3));
+    qtest_memwrite(s, src_addr, array, sizeof(array));
+
+    write_regs(s, base, src_addr,
+               (sizeof(test_vector_sg1)
+                + sizeof(test_vector_sg2)
+                + sizeof(test_vector_sg3)),
+               digest_addr, HACE_ALGO_SHA256 | HACE_SG_EN);
+
+    /* Check hash IRQ status is asserted */
+    g_assert_cmphex(qtest_readl(s, base + HACE_STS), ==, 0x00000200);
+
+    /* Clear IRQ status and check status is deasserted */
+    qtest_writel(s, base + HACE_STS, 0x00000200);
+    g_assert_cmphex(qtest_readl(s, base + HACE_STS), ==, 0);
+
+    /* Read computed digest from memory */
+    qtest_memread(s, digest_addr, digest, sizeof(digest));
+
+    /* Check result of computation */
+    g_assert_cmpmem(digest, sizeof(digest),
+                    test_result_sg_sha256, sizeof(digest));
+}
+
+static void test_sha512_sg(const char *machine, const uint32_t base,
+                        const uint32_t src_addr)
+{
+    QTestState *s = qtest_init(machine);
+
+    const uint32_t src_addr_1 = src_addr + 0x1000000;
+    const uint32_t src_addr_2 = src_addr + 0x2000000;
+    const uint32_t src_addr_3 = src_addr + 0x3000000;
+    const uint32_t digest_addr = src_addr + 0x4000000;
+    uint8_t digest[64] = {0};
+    struct aspeed_sg_list array[] = {
+            { sizeof(test_vector_sg1),              src_addr_1},
+            { sizeof(test_vector_sg2),              src_addr_2},
+            { sizeof(test_vector_sg3) | 1u << 31,   src_addr_3},
+        };
+
+    /* Check engine is idle, no busy or irq bits set */
+    g_assert_cmphex(qtest_readl(s, base + HACE_STS), ==, 0);
+
+    /* Write test vector into memory */
+    qtest_memwrite(s, src_addr_1, test_vector_sg1, sizeof(test_vector_sg1));
+    qtest_memwrite(s, src_addr_2, test_vector_sg2, sizeof(test_vector_sg2));
+    qtest_memwrite(s, src_addr_3, test_vector_sg3, sizeof(test_vector_sg3));
+    qtest_memwrite(s, src_addr, array, sizeof(array));
+
+    write_regs(s, base, src_addr,
+               (sizeof(test_vector_sg1)
+                + sizeof(test_vector_sg2)
+                + sizeof(test_vector_sg3)),
+               digest_addr, HACE_ALGO_SHA512 | HACE_SG_EN);
+
+    /* Check hash IRQ status is asserted */
+    g_assert_cmphex(qtest_readl(s, base + HACE_STS), ==, 0x00000200);
+
+    /* Clear IRQ status and check status is deasserted */
+    qtest_writel(s, base + HACE_STS, 0x00000200);
+    g_assert_cmphex(qtest_readl(s, base + HACE_STS), ==, 0);
+
+    /* Read computed digest from memory */
+    qtest_memread(s, digest_addr, digest, sizeof(digest));
+
+    /* Check result of computation */
+    g_assert_cmpmem(digest, sizeof(digest),
+                    test_result_sg_sha512, sizeof(digest));
+}
+
 struct masks {
-    uint32_t src;
+    uint32_t src_direct;
+    uint32_t src_sg;
     uint32_t dest;
     uint32_t len;
 };
 
 static const struct masks ast2600_masks = {
-    .src  = 0x7fffffff,
-    .dest = 0x7ffffff8,
-    .len  = 0x0fffffff,
+    .src_direct  = 0x7fffffff,
+    .src_sg      = 0x7ffffff8,
+    .dest        = 0x7ffffff8,
+    .len         = 0x0fffffff,
 };
 
 static const struct masks ast2500_masks = {
-    .src  = 0x3fffffff,
-    .dest = 0x3ffffff8,
-    .len  = 0x0fffffff,
+    .src_direct  = 0x3fffffff,
+    .src_sg      = 0x0,         /* SG mode not supported */
+    .dest        = 0x3ffffff8,
+    .len         = 0x0fffffff,
 };
 
 static const struct masks ast2400_masks = {
-    .src  = 0x0fffffff,
-    .dest = 0x0ffffff8,
-    .len  = 0x0fffffff,
+    .src_direct  = 0x0fffffff,
+    .src_sg      = 0x0,         /* SG mode not supported */
+    .dest        = 0x0ffffff8,
+    .len         = 0x0fffffff,
 };
 
 static void test_addresses(const char *machine, const uint32_t base,
@@ -208,7 +336,8 @@ static void test_addresses(const char *machine, const uint32_t base,
 
     /* Check that the address masking is correct */
     qtest_writel(s, base + HACE_HASH_SRC, 0xffffffff);
-    g_assert_cmphex(qtest_readl(s, base + HACE_HASH_SRC), ==, expected->src);
+    g_assert_cmphex(qtest_readl(s, base + HACE_HASH_SRC), ==,
+                    expected->src_direct);
 
     qtest_writel(s, base + HACE_HASH_DIGEST, 0xffffffff);
     g_assert_cmphex(qtest_readl(s, base + HACE_HASH_DIGEST), ==, expected->dest);
@@ -238,11 +367,21 @@ static void test_sha256_ast2600(void)
     test_sha256("-machine ast2600-evb", 0x1e6d0000, 0x80000000);
 }
 
+static void test_sha256_sg_ast2600(void)
+{
+    test_sha256_sg("-machine ast2600-evb", 0x1e6d0000, 0x80000000);
+}
+
 static void test_sha512_ast2600(void)
 {
     test_sha512("-machine ast2600-evb", 0x1e6d0000, 0x80000000);
 }
 
+static void test_sha512_sg_ast2600(void)
+{
+    test_sha512_sg("-machine ast2600-evb", 0x1e6d0000, 0x80000000);
+}
+
 static void test_addresses_ast2600(void)
 {
     test_addresses("-machine ast2600-evb", 0x1e6d0000, &ast2600_masks);
@@ -299,6 +438,9 @@ int main(int argc, char **argv)
     qtest_add_func("ast2600/hace/sha256", test_sha256_ast2600);
     qtest_add_func("ast2600/hace/md5", test_md5_ast2600);
 
+    qtest_add_func("ast2600/hace/sha512_sg", test_sha512_sg_ast2600);
+    qtest_add_func("ast2600/hace/sha256_sg", test_sha256_sg_ast2600);
+
     qtest_add_func("ast2500/hace/addresses", test_addresses_ast2500);
     qtest_add_func("ast2500/hace/sha512", test_sha512_ast2500);
     qtest_add_func("ast2500/hace/sha256", test_sha256_ast2500);
-- 
2.25.1


