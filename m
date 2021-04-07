Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32F3E357321
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Apr 2021 19:26:05 +0200 (CEST)
Received: from localhost ([::1]:45784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUBwK-0001NA-6W
	for lists+qemu-devel@lfdr.de; Wed, 07 Apr 2021 13:26:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1lUBnk-0007bp-4y; Wed, 07 Apr 2021 13:17:12 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:60264)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1lUBnf-0006ix-Nt; Wed, 07 Apr 2021 13:17:11 -0400
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 137H3M5N072188; Wed, 7 Apr 2021 13:16:53 -0400
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37rw6kgn2w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Apr 2021 13:16:53 -0400
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 137HBgUu011584;
 Wed, 7 Apr 2021 17:16:51 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma05fra.de.ibm.com with ESMTP id 37rvbvgg0f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Apr 2021 17:16:51 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 137HGmOx45416762
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 7 Apr 2021 17:16:48 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D2A1A11C052;
 Wed,  7 Apr 2021 17:16:48 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 932F111C054;
 Wed,  7 Apr 2021 17:16:48 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Wed,  7 Apr 2021 17:16:48 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.70.229])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id E9CE52200C7;
 Wed,  7 Apr 2021 19:16:47 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH 10/24] tests: Aspeed HACE Scatter-Gather tests
Date: Wed,  7 Apr 2021 19:16:23 +0200
Message-Id: <20210407171637.777743-11-clg@kaod.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210407171637.777743-1-clg@kaod.org>
References: <20210407171637.777743-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Cb6sxetbaUYPsgvqQ-2KaXmrd1wwXYAD
X-Proofpoint-ORIG-GUID: Cb6sxetbaUYPsgvqQ-2KaXmrd1wwXYAD
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-07_09:2021-04-07,
 2021-04-07 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0
 bulkscore=0 priorityscore=1501 mlxscore=0 suspectscore=0 mlxlogscore=881
 clxscore=1034 phishscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104060000
 definitions=main-2104070116
Received-SPF: softfail client-ip=148.163.156.1; envelope-from=clg@kaod.org;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-devel@nongnu.org,
 Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>

Expand current Aspeed HACE testsuite to also include Scatter-Gather of
sha256 and sha512 operations.

Signed-off-by: Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
[ clg: - dropped whitespace changes
       - endian fixes
       - qtest_quit() fix ]
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
Message-Id: <20210326193745.13558-3-klaus@linux.vnet.ibm.com>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 tests/qtest/aspeed_hace-test.c | 148 +++++++++++++++++++++++++++++++++
 1 file changed, 148 insertions(+)

diff --git a/tests/qtest/aspeed_hace-test.c b/tests/qtest/aspeed_hace-tes=
t.c
index 675774e96eb9..be9f08aa28d4 100644
--- a/tests/qtest/aspeed_hace-test.c
+++ b/tests/qtest/aspeed_hace-test.c
@@ -34,6 +34,12 @@
 #define HACE_HASH_KEY_BUFF       0x28
 #define HACE_HASH_DATA_LEN       0x2c
 #define HACE_HASH_CMD            0x30
+/* Scatter-Gather Hash */
+#define SG_LIST_LEN_LAST         BIT(31)
+struct AspeedSgList {
+        uint32_t len;
+        uint32_t addr;
+} __attribute__ ((__packed__));
=20
 /*
  * Test vector is the ascii "abc"
@@ -63,6 +69,33 @@ static const uint8_t test_result_md5[] =3D {
     0x90, 0x01, 0x50, 0x98, 0x3c, 0xd2, 0x4f, 0xb0, 0xd6, 0x96, 0x3f, 0x=
7d,
     0x28, 0xe1, 0x7f, 0x72};
=20
+/*
+ * The Scatter-Gather Test vector is the ascii "abc" "def" "ghi", broken
+ * into blocks of 3 characters as shown
+ *
+ * Expected results were generated using command line utitiles:
+ *
+ *  echo -n -e 'abcdefghi' | dd of=3D/tmp/test
+ *  for hash in sha512sum sha256sum; do $hash /tmp/test; done
+ *
+ */
+static const uint8_t test_vector_sg1[] =3D {0x61, 0x62, 0x63};
+static const uint8_t test_vector_sg2[] =3D {0x64, 0x65, 0x66};
+static const uint8_t test_vector_sg3[] =3D {0x67, 0x68, 0x69};
+
+static const uint8_t test_result_sg_sha512[] =3D {
+    0xf2, 0x2d, 0x51, 0xd2, 0x52, 0x92, 0xca, 0x1d, 0x0f, 0x68, 0xf6, 0x=
9a,
+    0xed, 0xc7, 0x89, 0x70, 0x19, 0x30, 0x8c, 0xc9, 0xdb, 0x46, 0xef, 0x=
b7,
+    0x5a, 0x03, 0xdd, 0x49, 0x4f, 0xc7, 0xf1, 0x26, 0xc0, 0x10, 0xe8, 0x=
ad,
+    0xe6, 0xa0, 0x0a, 0x0c, 0x1a, 0x5f, 0x1b, 0x75, 0xd8, 0x1e, 0x0e, 0x=
d5,
+    0xa9, 0x3c, 0xe9, 0x8d, 0xc9, 0xb8, 0x33, 0xdb, 0x78, 0x39, 0x24, 0x=
7b,
+    0x1d, 0x9c, 0x24, 0xfe};
+
+static const uint8_t test_result_sg_sha256[] =3D {
+    0x19, 0xcc, 0x02, 0xf2, 0x6d, 0xf4, 0x3c, 0xc5, 0x71, 0xbc, 0x9e, 0x=
d7,
+    0xb0, 0xc4, 0xd2, 0x92, 0x24, 0xa3, 0xec, 0x22, 0x95, 0x29, 0x22, 0x=
17,
+    0x25, 0xef, 0x76, 0xd0, 0x21, 0xc8, 0x32, 0x6f};
+
=20
 static void write_regs(QTestState *s, uint32_t base, uint32_t src,
                        uint32_t length, uint32_t out, uint32_t method)
@@ -173,6 +206,108 @@ static void test_sha512(const char *machine, const =
uint32_t base,
     qtest_quit(s);
 }
=20
+static void test_sha256_sg(const char *machine, const uint32_t base,
+                        const uint32_t src_addr)
+{
+    QTestState *s =3D qtest_init(machine);
+
+    const uint32_t src_addr_1 =3D src_addr + 0x1000000;
+    const uint32_t src_addr_2 =3D src_addr + 0x2000000;
+    const uint32_t src_addr_3 =3D src_addr + 0x3000000;
+    const uint32_t digest_addr =3D src_addr + 0x4000000;
+    uint8_t digest[32] =3D {0};
+    struct AspeedSgList array[] =3D {
+        {  cpu_to_le32(sizeof(test_vector_sg1)),
+           cpu_to_le32(src_addr_1) },
+        {  cpu_to_le32(sizeof(test_vector_sg2)),
+           cpu_to_le32(src_addr_2) },
+        {  cpu_to_le32(sizeof(test_vector_sg3) | SG_LIST_LEN_LAST),
+           cpu_to_le32(src_addr_3) },
+    };
+
+    /* Check engine is idle, no busy or irq bits set */
+    g_assert_cmphex(qtest_readl(s, base + HACE_STS), =3D=3D, 0);
+
+    /* Write test vector into memory */
+    qtest_memwrite(s, src_addr_1, test_vector_sg1, sizeof(test_vector_sg=
1));
+    qtest_memwrite(s, src_addr_2, test_vector_sg2, sizeof(test_vector_sg=
2));
+    qtest_memwrite(s, src_addr_3, test_vector_sg3, sizeof(test_vector_sg=
3));
+    qtest_memwrite(s, src_addr, array, sizeof(array));
+
+    write_regs(s, base, src_addr,
+               (sizeof(test_vector_sg1)
+                + sizeof(test_vector_sg2)
+                + sizeof(test_vector_sg3)),
+               digest_addr, HACE_ALGO_SHA256 | HACE_SG_EN);
+
+    /* Check hash IRQ status is asserted */
+    g_assert_cmphex(qtest_readl(s, base + HACE_STS), =3D=3D, 0x00000200)=
;
+
+    /* Clear IRQ status and check status is deasserted */
+    qtest_writel(s, base + HACE_STS, 0x00000200);
+    g_assert_cmphex(qtest_readl(s, base + HACE_STS), =3D=3D, 0);
+
+    /* Read computed digest from memory */
+    qtest_memread(s, digest_addr, digest, sizeof(digest));
+
+    /* Check result of computation */
+    g_assert_cmpmem(digest, sizeof(digest),
+                    test_result_sg_sha256, sizeof(digest));
+
+    qtest_quit(s);
+}
+
+static void test_sha512_sg(const char *machine, const uint32_t base,
+                        const uint32_t src_addr)
+{
+    QTestState *s =3D qtest_init(machine);
+
+    const uint32_t src_addr_1 =3D src_addr + 0x1000000;
+    const uint32_t src_addr_2 =3D src_addr + 0x2000000;
+    const uint32_t src_addr_3 =3D src_addr + 0x3000000;
+    const uint32_t digest_addr =3D src_addr + 0x4000000;
+    uint8_t digest[64] =3D {0};
+    struct AspeedSgList array[] =3D {
+        {  cpu_to_le32(sizeof(test_vector_sg1)),
+           cpu_to_le32(src_addr_1) },
+        {  cpu_to_le32(sizeof(test_vector_sg2)),
+           cpu_to_le32(src_addr_2) },
+        {  cpu_to_le32(sizeof(test_vector_sg3) | SG_LIST_LEN_LAST),
+           cpu_to_le32(src_addr_3) },
+    };
+
+    /* Check engine is idle, no busy or irq bits set */
+    g_assert_cmphex(qtest_readl(s, base + HACE_STS), =3D=3D, 0);
+
+    /* Write test vector into memory */
+    qtest_memwrite(s, src_addr_1, test_vector_sg1, sizeof(test_vector_sg=
1));
+    qtest_memwrite(s, src_addr_2, test_vector_sg2, sizeof(test_vector_sg=
2));
+    qtest_memwrite(s, src_addr_3, test_vector_sg3, sizeof(test_vector_sg=
3));
+    qtest_memwrite(s, src_addr, array, sizeof(array));
+
+    write_regs(s, base, src_addr,
+               (sizeof(test_vector_sg1)
+                + sizeof(test_vector_sg2)
+                + sizeof(test_vector_sg3)),
+               digest_addr, HACE_ALGO_SHA512 | HACE_SG_EN);
+
+    /* Check hash IRQ status is asserted */
+    g_assert_cmphex(qtest_readl(s, base + HACE_STS), =3D=3D, 0x00000200)=
;
+
+    /* Clear IRQ status and check status is deasserted */
+    qtest_writel(s, base + HACE_STS, 0x00000200);
+    g_assert_cmphex(qtest_readl(s, base + HACE_STS), =3D=3D, 0);
+
+    /* Read computed digest from memory */
+    qtest_memread(s, digest_addr, digest, sizeof(digest));
+
+    /* Check result of computation */
+    g_assert_cmpmem(digest, sizeof(digest),
+                    test_result_sg_sha512, sizeof(digest));
+
+    qtest_quit(s);
+}
+
 struct masks {
     uint32_t src;
     uint32_t dest;
@@ -246,11 +381,21 @@ static void test_sha256_ast2600(void)
     test_sha256("-machine ast2600-evb", 0x1e6d0000, 0x80000000);
 }
=20
+static void test_sha256_sg_ast2600(void)
+{
+    test_sha256_sg("-machine ast2600-evb", 0x1e6d0000, 0x80000000);
+}
+
 static void test_sha512_ast2600(void)
 {
     test_sha512("-machine ast2600-evb", 0x1e6d0000, 0x80000000);
 }
=20
+static void test_sha512_sg_ast2600(void)
+{
+    test_sha512_sg("-machine ast2600-evb", 0x1e6d0000, 0x80000000);
+}
+
 static void test_addresses_ast2600(void)
 {
     test_addresses("-machine ast2600-evb", 0x1e6d0000, &ast2600_masks);
@@ -307,6 +452,9 @@ int main(int argc, char **argv)
     qtest_add_func("ast2600/hace/sha256", test_sha256_ast2600);
     qtest_add_func("ast2600/hace/md5", test_md5_ast2600);
=20
+    qtest_add_func("ast2600/hace/sha512_sg", test_sha512_sg_ast2600);
+    qtest_add_func("ast2600/hace/sha256_sg", test_sha256_sg_ast2600);
+
     qtest_add_func("ast2500/hace/addresses", test_addresses_ast2500);
     qtest_add_func("ast2500/hace/sha512", test_sha512_ast2500);
     qtest_add_func("ast2500/hace/sha256", test_sha256_ast2500);
--=20
2.26.3


