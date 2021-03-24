Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE4D934724A
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 08:21:36 +0100 (CET)
Received: from localhost ([::1]:52902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOxpf-0005gF-Lx
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 03:21:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1lOxeu-0002N8-6Z; Wed, 24 Mar 2021 03:10:28 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:38904)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1lOxes-0008Vm-0b; Wed, 24 Mar 2021 03:10:27 -0400
Received: by mail-pf1-x42d.google.com with SMTP id y200so16657339pfb.5;
 Wed, 24 Mar 2021 00:10:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/tw+wVedwKVrJcA5m4uXycPZbOWohRHp8NXeRuRxLBk=;
 b=UmytoXqk/ViduUE7CJHj4yvAS7c6F8gYGX5DhoufDhMg2S7HjezV7uLBf2h1Ll8UuB
 KgJxar3Hvo3DpARZpHg92R3lEWfyO0L0tpBHe57hQZJWAc7LWNkOQiozuF2AW4j7zbw4
 Qa1AK2p9XnXQp6SoyDMrKpBLobAqR5qrGL1WCJ5OYIxE0/wnfWqlzYnEjM0YKAamzsYl
 bo1UBuLBxAxhR3cdpZvG1LZ6s+HejNhJBJ+5KD9i/qRIjn6mwZ/wVYgwFO07weqgUzNT
 pd7LJMWJts4uUNT8tail62S1OtDhm6ZXm1x2S/X+uNw/RWWCnTYa4bR8GXDA6P2FXEa4
 Obew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=/tw+wVedwKVrJcA5m4uXycPZbOWohRHp8NXeRuRxLBk=;
 b=fMvmGM+PmWwtVWSuWn0HMULLv80Xb14f3p5a+jjXZMPthT1MXecUEaZFinNlPCwklO
 LbH0kQieUv/TpBBkWyDlHsjbs7SMaojvmy9keABkbTuvnMURJNS3fO16agtyFcTyX+WM
 GXcmqwMUBBDFIzUrfDtmLDAF3auxk9eum2/Q8ZuI0jrSHCKyhrugYYKvwrn7Oo4poRmX
 0dAFmM2jwEyZRq4LyUQkyaK0eB7p0bO68z5+Di4/7689kWYx+EE3vdkY3jnuh3Ctpwxe
 7zrOg7dqOsAYe+mTt3rCC2FHu8cWcqxruui1cicv00pZ7vnVGBoKe4/UeTHmbt6bXhl7
 g2mw==
X-Gm-Message-State: AOAM530bhnVhXE+KDErPfJ++tmDrmPTDJnkjeQ9Fc0Kz9EWmb3uqwNA4
 Koh5D4ia4C0ztE9F17E2LVY=
X-Google-Smtp-Source: ABdhPJx05H8ymVq2sVpLV+ZSTa6Kdjq0nInj3URf0pjn/H6yuivSxQrV5pprvBlkdwXhvv3wo1J8Ig==
X-Received: by 2002:aa7:93af:0:b029:1ef:1bb9:b1a1 with SMTP id
 x15-20020aa793af0000b02901ef1bb9b1a1mr2011284pff.49.1616569824096; 
 Wed, 24 Mar 2021 00:10:24 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.14])
 by smtp.gmail.com with ESMTPSA id y22sm1297116pfn.32.2021.03.24.00.10.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Mar 2021 00:10:23 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH v4 3/3] tests/qtest: Add test for Aspeed HACE
Date: Wed, 24 Mar 2021 17:39:55 +1030
Message-Id: <20210324070955.125941-4-joel@jms.id.au>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210324070955.125941-1-joel@jms.id.au>
References: <20210324070955.125941-1-joel@jms.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=joel.stan@gmail.com; helo=mail-pf1-x42d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This adds a test for the Aspeed Hash and Crypto (HACE) engine. It tests
the currently implemented behavior of the hash functionality.

The tests are similar, but are cut/pasted instead of broken out into a
common function so the assert machinery produces useful output when a
test fails.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
v3: Write test without libqtest-single.h
v4: Run tests on all aspeed machines
---
 tests/qtest/aspeed_hace-test.c | 313 +++++++++++++++++++++++++++++++++
 MAINTAINERS                    |   1 +
 tests/qtest/meson.build        |   3 +
 3 files changed, 317 insertions(+)
 create mode 100644 tests/qtest/aspeed_hace-test.c

diff --git a/tests/qtest/aspeed_hace-test.c b/tests/qtest/aspeed_hace-test.c
new file mode 100644
index 000000000000..2b624b6b099b
--- /dev/null
+++ b/tests/qtest/aspeed_hace-test.c
@@ -0,0 +1,313 @@
+/*
+ * QTest testcase for the ASPEED Hash and Crypto Engine
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ * Copyright 2021 IBM Corp.
+ */
+
+#include "qemu/osdep.h"
+
+#include "libqos/libqtest.h"
+#include "qemu-common.h"
+#include "qemu/bitops.h"
+
+#define HACE_CMD                 0x10
+#define  HACE_SHA_BE_EN          BIT(3)
+#define  HACE_MD5_LE_EN          BIT(2)
+#define  HACE_ALGO_MD5           0
+#define  HACE_ALGO_SHA1          BIT(5)
+#define  HACE_ALGO_SHA224        BIT(6)
+#define  HACE_ALGO_SHA256        (BIT(4) | BIT(6))
+#define  HACE_ALGO_SHA512        (BIT(5) | BIT(6))
+#define  HACE_ALGO_SHA384        (BIT(5) | BIT(6) | BIT(10))
+#define  HACE_SG_EN              BIT(18)
+
+#define HACE_STS                 0x1c
+#define  HACE_RSA_ISR            BIT(13)
+#define  HACE_CRYPTO_ISR         BIT(12)
+#define  HACE_HASH_ISR           BIT(9)
+#define  HACE_RSA_BUSY           BIT(2)
+#define  HACE_CRYPTO_BUSY        BIT(1)
+#define  HACE_HASH_BUSY          BIT(0)
+#define HACE_HASH_SRC            0x20
+#define HACE_HASH_DIGEST         0x24
+#define HACE_HASH_KEY_BUFF       0x28
+#define HACE_HASH_DATA_LEN       0x2c
+#define HACE_HASH_CMD            0x30
+
+/*
+ * Test vector is the ascii "abc"
+ *
+ * Expected results were generated using command line utitiles:
+ *
+ *  echo -n -e 'abc' | dd of=/tmp/test
+ *  for hash in sha512sum sha256sum md5sum; do $hash /tmp/test; done
+ *
+ */
+static const uint8_t test_vector[] = {0x61, 0x62, 0x63};
+
+static const uint8_t test_result_sha512[] = {
+    0xdd, 0xaf, 0x35, 0xa1, 0x93, 0x61, 0x7a, 0xba, 0xcc, 0x41, 0x73, 0x49,
+    0xae, 0x20, 0x41, 0x31, 0x12, 0xe6, 0xfa, 0x4e, 0x89, 0xa9, 0x7e, 0xa2,
+    0x0a, 0x9e, 0xee, 0xe6, 0x4b, 0x55, 0xd3, 0x9a, 0x21, 0x92, 0x99, 0x2a,
+    0x27, 0x4f, 0xc1, 0xa8, 0x36, 0xba, 0x3c, 0x23, 0xa3, 0xfe, 0xeb, 0xbd,
+    0x45, 0x4d, 0x44, 0x23, 0x64, 0x3c, 0xe8, 0x0e, 0x2a, 0x9a, 0xc9, 0x4f,
+    0xa5, 0x4c, 0xa4, 0x9f};
+
+static const uint8_t test_result_sha256[] = {
+    0xba, 0x78, 0x16, 0xbf, 0x8f, 0x01, 0xcf, 0xea, 0x41, 0x41, 0x40, 0xde,
+    0x5d, 0xae, 0x22, 0x23, 0xb0, 0x03, 0x61, 0xa3, 0x96, 0x17, 0x7a, 0x9c,
+    0xb4, 0x10, 0xff, 0x61, 0xf2, 0x00, 0x15, 0xad};
+
+static const uint8_t test_result_md5[] = {
+    0x90, 0x01, 0x50, 0x98, 0x3c, 0xd2, 0x4f, 0xb0, 0xd6, 0x96, 0x3f, 0x7d,
+    0x28, 0xe1, 0x7f, 0x72};
+
+
+static void write_regs(QTestState *s, uint32_t base, uint32_t src,
+                       uint32_t length, uint32_t out, uint32_t method)
+{
+        qtest_writel(s, base + HACE_HASH_SRC, src);
+        qtest_writel(s, base + HACE_HASH_DIGEST, out);
+        qtest_writel(s, base + HACE_HASH_DATA_LEN, length);
+        qtest_writel(s, base + HACE_HASH_CMD, HACE_SHA_BE_EN | method);
+}
+
+static void test_md5(const char *machine, const uint32_t base,
+                     const uint32_t src_addr)
+
+{
+    QTestState *s = qtest_init(machine);
+
+    uint32_t digest_addr = src_addr + 0x01000000;
+    uint8_t digest[16] = {0};
+
+    /* Check engine is idle, no busy or irq bits set */
+    g_assert_cmphex(qtest_readl(s, base + HACE_STS), ==, 0);
+
+    /* Write test vector into memory */
+    qtest_memwrite(s, src_addr, test_vector, sizeof(test_vector));
+
+    write_regs(s, base, src_addr, sizeof(test_vector), digest_addr, HACE_ALGO_MD5);
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
+                    test_result_md5, sizeof(digest));
+}
+
+static void test_sha256(const char *machine, const uint32_t base,
+                        const uint32_t src_addr)
+{
+    QTestState *s = qtest_init(machine);
+
+    const uint32_t digest_addr = src_addr + 0x1000000;
+    uint8_t digest[32] = {0};
+
+    /* Check engine is idle, no busy or irq bits set */
+    g_assert_cmphex(qtest_readl(s, base + HACE_STS), ==, 0);
+
+    /* Write test vector into memory */
+    qtest_memwrite(s, src_addr, test_vector, sizeof(test_vector));
+
+    write_regs(s, base, src_addr, sizeof(test_vector), digest_addr, HACE_ALGO_SHA256);
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
+                    test_result_sha256, sizeof(digest));
+}
+
+static void test_sha512(const char *machine, const uint32_t base,
+                        const uint32_t src_addr)
+{
+    QTestState *s = qtest_init(machine);
+
+    const uint32_t digest_addr = src_addr + 0x1000000;
+    uint8_t digest[64] = {0};
+
+    /* Check engine is idle, no busy or irq bits set */
+    g_assert_cmphex(qtest_readl(s, base + HACE_STS), ==, 0);
+
+    /* Write test vector into memory */
+    qtest_memwrite(s, src_addr, test_vector, sizeof(test_vector));
+
+    write_regs(s, base, src_addr, sizeof(test_vector), digest_addr, HACE_ALGO_SHA512);
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
+                    test_result_sha512, sizeof(digest));
+}
+
+struct masks {
+    uint32_t src;
+    uint32_t dest;
+    uint32_t len;
+};
+
+static const struct masks ast2600_masks = {
+    .src  = 0x7fffffff,
+    .dest = 0x7ffffff8,
+    .len  = 0x0fffffff,
+};
+
+static const struct masks ast2500_masks = {
+    .src  = 0x3fffffff,
+    .dest = 0x3ffffff8,
+    .len  = 0x0fffffff,
+};
+
+static const struct masks ast2400_masks = {
+    .src  = 0x0fffffff,
+    .dest = 0x0ffffff8,
+    .len  = 0x0fffffff,
+};
+
+static void test_addresses(const char *machine, const uint32_t base,
+                           const struct masks *expected)
+{
+    QTestState *s = qtest_init(machine);
+
+    /*
+     * Check command mode is zero, meaning engine is in direct access mode,
+     * as this affects the masking behavior of the HASH_SRC register.
+     */
+    g_assert_cmphex(qtest_readl(s, base + HACE_CMD), ==, 0);
+    g_assert_cmphex(qtest_readl(s, base + HACE_HASH_SRC), ==, 0);
+    g_assert_cmphex(qtest_readl(s, base + HACE_HASH_DIGEST), ==, 0);
+    g_assert_cmphex(qtest_readl(s, base + HACE_HASH_DATA_LEN), ==, 0);
+
+
+    /* Check that the address masking is correct */
+    qtest_writel(s, base + HACE_HASH_SRC, 0xffffffff);
+    g_assert_cmphex(qtest_readl(s, base + HACE_HASH_SRC), ==, expected->src);
+
+    qtest_writel(s, base + HACE_HASH_DIGEST, 0xffffffff);
+    g_assert_cmphex(qtest_readl(s, base + HACE_HASH_DIGEST), ==, expected->dest);
+
+    qtest_writel(s, base + HACE_HASH_DATA_LEN, 0xffffffff);
+    g_assert_cmphex(qtest_readl(s, base + HACE_HASH_DATA_LEN), ==, expected->len);
+
+    /* Reset to zero */
+    qtest_writel(s, base + HACE_HASH_SRC, 0);
+    qtest_writel(s, base + HACE_HASH_DIGEST, 0);
+    qtest_writel(s, base + HACE_HASH_DATA_LEN, 0);
+
+    /* Check that all bits are now zero */
+    g_assert_cmphex(qtest_readl(s, base + HACE_HASH_SRC), ==, 0);
+    g_assert_cmphex(qtest_readl(s, base + HACE_HASH_DIGEST), ==, 0);
+    g_assert_cmphex(qtest_readl(s, base + HACE_HASH_DATA_LEN), ==, 0);
+}
+
+/* ast2600 */
+static void test_md5_ast2600(void)
+{
+    test_md5("-machine ast2600-evb", 0x1e6d0000, 0x80000000);
+}
+
+static void test_sha256_ast2600(void)
+{
+    test_sha256("-machine ast2600-evb", 0x1e6d0000, 0x80000000);
+}
+
+static void test_sha512_ast2600(void)
+{
+    test_sha512("-machine ast2600-evb", 0x1e6d0000, 0x80000000);
+}
+
+static void test_addresses_ast2600(void)
+{
+    test_addresses("-machine ast2600-evb", 0x1e6d0000, &ast2600_masks);
+}
+
+/* ast2500 */
+static void test_md5_ast2500(void)
+{
+    test_md5("-machine ast2500-evb", 0x1e6e3000, 0x80000000);
+}
+
+static void test_sha256_ast2500(void)
+{
+    test_sha256("-machine ast2500-evb", 0x1e6e3000, 0x80000000);
+}
+
+static void test_sha512_ast2500(void)
+{
+    test_sha512("-machine ast2500-evb", 0x1e6e3000, 0x80000000);
+}
+
+static void test_addresses_ast2500(void)
+{
+    test_addresses("-machine ast2500-evb", 0x1e6e3000, &ast2500_masks);
+}
+
+/* ast2400 */
+static void test_md5_ast2400(void)
+{
+    test_md5("-machine palmetto-bmc", 0x1e6e3000, 0x40000000);
+}
+
+static void test_sha256_ast2400(void)
+{
+    test_sha256("-machine palmetto-bmc", 0x1e6e3000, 0x40000000);
+}
+
+static void test_sha512_ast2400(void)
+{
+    test_sha512("-machine palmetto-bmc", 0x1e6e3000, 0x40000000);
+}
+
+static void test_addresses_ast2400(void)
+{
+    test_addresses("-machine palmetto-bmc", 0x1e6e3000, &ast2400_masks);
+}
+
+int main(int argc, char **argv)
+{
+    g_test_init(&argc, &argv, NULL);
+
+    qtest_add_func("ast2600/hace/addresses", test_addresses_ast2600);
+    qtest_add_func("ast2600/hace/sha512", test_sha512_ast2600);
+    qtest_add_func("ast2600/hace/sha256", test_sha256_ast2600);
+    qtest_add_func("ast2600/hace/md5", test_md5_ast2600);
+
+    qtest_add_func("ast2500/hace/addresses", test_addresses_ast2500);
+    qtest_add_func("ast2500/hace/sha512", test_sha512_ast2500);
+    qtest_add_func("ast2500/hace/sha256", test_sha256_ast2500);
+    qtest_add_func("ast2500/hace/md5", test_md5_ast2500);
+
+    qtest_add_func("ast2400/hace/addresses", test_addresses_ast2400);
+    qtest_add_func("ast2400/hace/sha512", test_sha512_ast2400);
+    qtest_add_func("ast2400/hace/sha256", test_sha256_ast2400);
+    qtest_add_func("ast2400/hace/md5", test_md5_ast2400);
+
+    return g_test_run();
+}
diff --git a/MAINTAINERS b/MAINTAINERS
index 9147e9a429a0..62f44456d809 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1026,6 +1026,7 @@ F: include/hw/misc/pca9552*.h
 F: hw/net/ftgmac100.c
 F: include/hw/net/ftgmac100.h
 F: docs/system/arm/aspeed.rst
+F: tests/qtest/*aspeed*
 
 NRF51
 M: Joel Stanley <joel@jms.id.au>
diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index 902cfef7cb2f..84b3219c15c6 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -163,12 +163,15 @@ qtests_npcm7xx = \
    'npcm7xx_timer-test',
    'npcm7xx_watchdog_timer-test'] + \
    (slirp.found() ? ['npcm7xx_emc-test'] : [])
+qtests_aspeed = \
+  ['aspeed_hace-test']
 qtests_arm = \
   (config_all_devices.has_key('CONFIG_MPS2') ? ['sse-timer-test'] : []) + \
   (config_all_devices.has_key('CONFIG_CMSDK_APB_DUALTIMER') ? ['cmsdk-apb-dualtimer-test'] : []) + \
   (config_all_devices.has_key('CONFIG_CMSDK_APB_TIMER') ? ['cmsdk-apb-timer-test'] : []) + \
   (config_all_devices.has_key('CONFIG_CMSDK_APB_WATCHDOG') ? ['cmsdk-apb-watchdog-test'] : []) + \
   (config_all_devices.has_key('CONFIG_PFLASH_CFI02') ? ['pflash-cfi02-test'] : []) +         \
+  (config_all_devices.has_key('CONFIG_ASPEED_SOC') ? qtests_aspeed : []) + \
   (config_all_devices.has_key('CONFIG_NPCM7XX') ? qtests_npcm7xx : []) + \
   ['arm-cpu-features',
    'microbit-test',
-- 
2.30.2


