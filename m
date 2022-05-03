Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F37D517EC7
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 09:24:23 +0200 (CEST)
Received: from localhost ([::1]:38102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlmtR-0004zF-M8
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 03:24:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=XF6a=VL=kaod.org=clg@ozlabs.org>)
 id 1nlmVb-0003T3-4R; Tue, 03 May 2022 02:59:51 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:58481)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=XF6a=VL=kaod.org=clg@ozlabs.org>)
 id 1nlmVZ-0007X1-0g; Tue, 03 May 2022 02:59:42 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4KsrRt4d34z4ySt;
 Tue,  3 May 2022 16:59:38 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4KsrRr0h0Hz4yST;
 Tue,  3 May 2022 16:59:35 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <troy_lee@aspeedtech.com>,
 Thomas Huth <thuth@redhat.com>, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PULL 17/19] tests/qtest: Add test for Aspeed HACE accumulative mode
Date: Tue,  3 May 2022 08:58:46 +0200
Message-Id: <20220503065848.125215-18-clg@kaod.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220503065848.125215-1-clg@kaod.org>
References: <20220503065848.125215-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=XF6a=VL=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
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

From: Steven Lee <steven_lee@aspeedtech.com>

This add two addition test cases for accumulative mode under sg enabled.

The input vector was manually craft with "abc" + bit 1 + padding zeros + L.
The padding length depends on algorithm, i.e. SHA512 (1024 bit),
SHA256 (512 bit).

The result was calculated by command line sha512sum/sha256sum utilities
without padding, i.e. only "abc" ascii text.

Signed-off-by: Troy Lee <troy_lee@aspeedtech.com>
Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>
Acked-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Joel Stanley <joel@jms.id.au>
[ clg: checkpatch fixes ]
Message-Id: <20220426021120.28255-4-steven_lee@aspeedtech.com>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 tests/qtest/aspeed_hace-test.c | 147 +++++++++++++++++++++++++++++++++
 1 file changed, 147 insertions(+)

diff --git a/tests/qtest/aspeed_hace-test.c b/tests/qtest/aspeed_hace-test.c
index 58aa22014d04..935a27671b8a 100644
--- a/tests/qtest/aspeed_hace-test.c
+++ b/tests/qtest/aspeed_hace-test.c
@@ -20,6 +20,7 @@
 #define  HACE_ALGO_SHA512        (BIT(5) | BIT(6))
 #define  HACE_ALGO_SHA384        (BIT(5) | BIT(6) | BIT(10))
 #define  HACE_SG_EN              BIT(18)
+#define  HACE_ACCUM_EN           BIT(8)
 
 #define HACE_STS                 0x1c
 #define  HACE_RSA_ISR            BIT(13)
@@ -95,6 +96,57 @@ static const uint8_t test_result_sg_sha256[] = {
     0x55, 0x1e, 0x1e, 0xc5, 0x80, 0xdd, 0x6d, 0x5a, 0x6e, 0xcd, 0xe9, 0xf3,
     0xd3, 0x5e, 0x6e, 0x4a, 0x71, 0x7f, 0xbd, 0xe4};
 
+/*
+ * The accumulative mode requires firmware to provide internal initial state
+ * and message padding (including length L at the end of padding).
+ *
+ * This test vector is a ascii text "abc" with padding message.
+ *
+ * Expected results were generated using command line utitiles:
+ *
+ *  echo -n -e 'abc' | dd of=/tmp/test
+ *  for hash in sha512sum sha256sum; do $hash /tmp/test; done
+ */
+static const uint8_t test_vector_accum_512[] = {
+    0x61, 0x62, 0x63, 0x80, 0x00, 0x00, 0x00, 0x00,
+    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x18};
+
+static const uint8_t test_vector_accum_256[] = {
+    0x61, 0x62, 0x63, 0x80, 0x00, 0x00, 0x00, 0x00,
+    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x18};
+
+static const uint8_t test_result_accum_sha512[] = {
+    0xdd, 0xaf, 0x35, 0xa1, 0x93, 0x61, 0x7a, 0xba, 0xcc, 0x41, 0x73, 0x49,
+    0xae, 0x20, 0x41, 0x31, 0x12, 0xe6, 0xfa, 0x4e, 0x89, 0xa9, 0x7e, 0xa2,
+    0x0a, 0x9e, 0xee, 0xe6, 0x4b, 0x55, 0xd3, 0x9a, 0x21, 0x92, 0x99, 0x2a,
+    0x27, 0x4f, 0xc1, 0xa8, 0x36, 0xba, 0x3c, 0x23, 0xa3, 0xfe, 0xeb, 0xbd,
+    0x45, 0x4d, 0x44, 0x23, 0x64, 0x3c, 0xe8, 0x0e, 0x2a, 0x9a, 0xc9, 0x4f,
+    0xa5, 0x4c, 0xa4, 0x9f};
+
+static const uint8_t test_result_accum_sha256[] = {
+    0xba, 0x78, 0x16, 0xbf, 0x8f, 0x01, 0xcf, 0xea, 0x41, 0x41, 0x40, 0xde,
+    0x5d, 0xae, 0x22, 0x23, 0xb0, 0x03, 0x61, 0xa3, 0x96, 0x17, 0x7a, 0x9c,
+    0xb4, 0x10, 0xff, 0x61, 0xf2, 0x00, 0x15, 0xad};
 
 static void write_regs(QTestState *s, uint32_t base, uint32_t src,
                        uint32_t length, uint32_t out, uint32_t method)
@@ -307,6 +359,88 @@ static void test_sha512_sg(const char *machine, const uint32_t base,
     qtest_quit(s);
 }
 
+static void test_sha256_accum(const char *machine, const uint32_t base,
+                        const uint32_t src_addr)
+{
+    QTestState *s = qtest_init(machine);
+
+    const uint32_t buffer_addr = src_addr + 0x1000000;
+    const uint32_t digest_addr = src_addr + 0x4000000;
+    uint8_t digest[32] = {0};
+    struct AspeedSgList array[] = {
+        {  cpu_to_le32(sizeof(test_vector_accum_256) | SG_LIST_LEN_LAST),
+           cpu_to_le32(buffer_addr) },
+    };
+
+    /* Check engine is idle, no busy or irq bits set */
+    g_assert_cmphex(qtest_readl(s, base + HACE_STS), ==, 0);
+
+    /* Write test vector into memory */
+    qtest_memwrite(s, buffer_addr, test_vector_accum_256,
+                   sizeof(test_vector_accum_256));
+    qtest_memwrite(s, src_addr, array, sizeof(array));
+
+    write_regs(s, base, src_addr, sizeof(test_vector_accum_256),
+               digest_addr, HACE_ALGO_SHA256 | HACE_SG_EN | HACE_ACCUM_EN);
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
+                    test_result_accum_sha256, sizeof(digest));
+
+    qtest_quit(s);
+}
+
+static void test_sha512_accum(const char *machine, const uint32_t base,
+                        const uint32_t src_addr)
+{
+    QTestState *s = qtest_init(machine);
+
+    const uint32_t buffer_addr = src_addr + 0x1000000;
+    const uint32_t digest_addr = src_addr + 0x4000000;
+    uint8_t digest[64] = {0};
+    struct AspeedSgList array[] = {
+        {  cpu_to_le32(sizeof(test_vector_accum_512) | SG_LIST_LEN_LAST),
+           cpu_to_le32(buffer_addr) },
+    };
+
+    /* Check engine is idle, no busy or irq bits set */
+    g_assert_cmphex(qtest_readl(s, base + HACE_STS), ==, 0);
+
+    /* Write test vector into memory */
+    qtest_memwrite(s, buffer_addr, test_vector_accum_512,
+                   sizeof(test_vector_accum_512));
+    qtest_memwrite(s, src_addr, array, sizeof(array));
+
+    write_regs(s, base, src_addr, sizeof(test_vector_accum_512),
+               digest_addr, HACE_ALGO_SHA512 | HACE_SG_EN | HACE_ACCUM_EN);
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
+                    test_result_accum_sha512, sizeof(digest));
+
+    qtest_quit(s);
+}
+
 struct masks {
     uint32_t src;
     uint32_t dest;
@@ -395,6 +529,16 @@ static void test_sha512_sg_ast2600(void)
     test_sha512_sg("-machine ast2600-evb", 0x1e6d0000, 0x80000000);
 }
 
+static void test_sha256_accum_ast2600(void)
+{
+    test_sha256_accum("-machine ast2600-evb", 0x1e6d0000, 0x80000000);
+}
+
+static void test_sha512_accum_ast2600(void)
+{
+    test_sha512_accum("-machine ast2600-evb", 0x1e6d0000, 0x80000000);
+}
+
 static void test_addresses_ast2600(void)
 {
     test_addresses("-machine ast2600-evb", 0x1e6d0000, &ast2600_masks);
@@ -454,6 +598,9 @@ int main(int argc, char **argv)
     qtest_add_func("ast2600/hace/sha512_sg", test_sha512_sg_ast2600);
     qtest_add_func("ast2600/hace/sha256_sg", test_sha256_sg_ast2600);
 
+    qtest_add_func("ast2600/hace/sha512_accum", test_sha512_accum_ast2600);
+    qtest_add_func("ast2600/hace/sha256_accum", test_sha256_accum_ast2600);
+
     qtest_add_func("ast2500/hace/addresses", test_addresses_ast2500);
     qtest_add_func("ast2500/hace/sha512", test_sha512_ast2500);
     qtest_add_func("ast2500/hace/sha256", test_sha256_ast2500);
-- 
2.35.1


