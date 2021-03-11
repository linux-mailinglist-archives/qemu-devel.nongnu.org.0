Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 501F13381F4
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 00:55:16 +0100 (CET)
Received: from localhost ([::1]:40032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKV99-0006IN-9g
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 18:55:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1lKV25-0007i3-Ij; Thu, 11 Mar 2021 18:47:59 -0500
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:37377)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1lKV23-0004yg-42; Thu, 11 Mar 2021 18:47:56 -0500
Received: by mail-pj1-x1030.google.com with SMTP id
 x7-20020a17090a2b07b02900c0ea793940so9873532pjc.2; 
 Thu, 11 Mar 2021 15:47:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DmiSmSTOcKJi33SCR15NFLIR3awSI25ZKFUxj7RWFO8=;
 b=uH3OeKPQQasT4MdzndD5LXVXsB9j8BoeJ/kf8uFU9GlP9RPbYWYgvvh8Lw5+WWpNav
 3Zw7/mbab117eVnwOqvQ+PY0hhCaHTQo7KbUArUi7GvcdycXRgHLX3q9z84inVqmBgei
 w9SefMwpWlMk4XGcUYCUNvLLQh+2y6R8uoXgqnU+4W7CzoEWFdgZfKULzZXn12OE7vvJ
 /AaoFtNYGFX0P2gVLFEtPYEQvjvw6CmhzuuF+lNQcECel7/uXU0zlUF4YG08AJtGHI1y
 Fn5wKVBW7FBO1RABLegS2kO4vIYbmMSs3V/A8+3Jz2uELiumKcyd36XY71IeeRPob29T
 m7Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=DmiSmSTOcKJi33SCR15NFLIR3awSI25ZKFUxj7RWFO8=;
 b=gQggVoYQIvUnoTc7KS7Um4Gu38qKQAzz/ot71/C51od3UgRmu0j2zprPAY7erlHMAT
 z++YT+XIYoFvW5prIP6jjuyUS5qjariZwp56/Raow9w3pIDJ/N+y5rOShmsxipy+1Uz0
 w6cumYEd5bGnBa+ZfdgxlMdBByavD7FNCsFf0c3h7rZEmzCrg0inJAHILeBTnkjbbPmf
 L8TH1/JJlRwObv8XiOzsoxJIiA9JREwKaL9xvP2ng5fdogEujyvzottsPzSxfvmxlFZV
 uzRFlb+5p2ltGnVwjZuK3dz5XEo+jvOIKQs9P0oHWH4YJxrGxuTIZtxJz1N+H3oZZBmn
 pNfA==
X-Gm-Message-State: AOAM531EwRDcyHNdpSCja2Q4eJDIe6W0QAKrKclzdtUBucSPXEIcSQ/7
 kaYwwZq21ausp3/PVYy04OM=
X-Google-Smtp-Source: ABdhPJyaj8s082xMPCrr8rJamB574cQf2kv5dF40A0B5nbewi5sxhnnQmEqMa6oXcqB5+siXvzTwxw==
X-Received: by 2002:a17:90a:e642:: with SMTP id
 ep2mr11177142pjb.62.1615506473538; 
 Thu, 11 Mar 2021 15:47:53 -0800 (PST)
Received: from localhost.localdomain ([45.124.203.14])
 by smtp.gmail.com with ESMTPSA id a204sm3357005pfd.106.2021.03.11.15.47.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Mar 2021 15:47:52 -0800 (PST)
From: Joel Stanley <joel@jms.id.au>
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>
Subject: [PATCH v2 3/3] tests/qtest: Add test for Aspeed HACE
Date: Fri, 12 Mar 2021 10:17:26 +1030
Message-Id: <20210311234726.437676-4-joel@jms.id.au>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210311234726.437676-1-joel@jms.id.au>
References: <20210311234726.437676-1-joel@jms.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=joel.stan@gmail.com; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This adds a test for the Aspeed Hash and Crypto (HACE) engine. It tests
the currently implemented behavior of the hash functionality.

The tests are similar, but are cut/pasted instead of broken out into a
common function so the assert machinery produces useful output when a
test fails.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 tests/qtest/aspeed_hace-test.c | 215 +++++++++++++++++++++++++++++++++
 MAINTAINERS                    |   1 +
 tests/qtest/meson.build        |   3 +
 3 files changed, 219 insertions(+)
 create mode 100644 tests/qtest/aspeed_hace-test.c

diff --git a/tests/qtest/aspeed_hace-test.c b/tests/qtest/aspeed_hace-test.c
new file mode 100644
index 000000000000..52501ee37afb
--- /dev/null
+++ b/tests/qtest/aspeed_hace-test.c
@@ -0,0 +1,215 @@
+/*
+ * QTest testcase for the ASPEED Hash and Crypto Engine
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ * Copyright 2021 IBM Corp.
+ */
+
+#include "qemu/osdep.h"
+
+#include "libqtest-single.h"
+#include "qemu-common.h"
+#include "qemu/bitops.h"
+
+#define HACE_BASE                0x1e6d0000
+
+#define HACE_CMD                 0x10
+#define  HACE_SHA_BE_EN                 BIT(3)
+#define  HACE_MD5_LE_EN                 BIT(2)
+#define  HACE_ALGO_MD5                  0
+#define  HACE_ALGO_SHA1                 BIT(5)
+#define  HACE_ALGO_SHA224               BIT(6)
+#define  HACE_ALGO_SHA256               (BIT(4) | BIT(6))
+#define  HACE_ALGO_SHA512               (BIT(5) | BIT(6))
+#define  HACE_ALGO_SHA384               (BIT(5) | BIT(6) | BIT(10))
+#define  HACE_SG_EN                     BIT(18)
+
+#define HACE_STS                 (HACE_BASE + 0x1c)
+#define  HACE_RSA_ISR                   BIT(13)
+#define  HACE_CRYPTO_ISR                BIT(12)
+#define  HACE_HASH_ISR                  BIT(9)
+#define  HACE_RSA_BUSY                  BIT(2)
+#define  HACE_CRYPTO_BUSY               BIT(1)
+#define  HACE_HASH_BUSY                 BIT(0)
+#define HACE_HASH_SRC            (HACE_BASE + 0x20)
+#define HACE_HASH_DIGEST    (HACE_BASE + 0x24)
+#define HACE_HASH_KEY_BUFF       (HACE_BASE + 0x28)
+#define HACE_HASH_DATA_LEN       (HACE_BASE + 0x2c)
+#define HACE_HASH_CMD            (HACE_BASE + 0x30)
+
+QTestState *qts;
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
+static void write_regs(uint64_t src, uint64_t length, uint64_t out,
+                       uint32_t method)
+{
+        writel(HACE_HASH_SRC, src);
+        writel(HACE_HASH_DIGEST, out);
+        writel(HACE_HASH_DATA_LEN, length);
+        writel(HACE_HASH_CMD, HACE_SHA_BE_EN | method);
+}
+
+static void test_md5(void)
+{
+    uint64_t src_addr = 0x80000000;
+    uint64_t digest_addr = 0x81000000;
+    uint8_t digest[16] = {0};
+
+    /* Check engine is idle, no busy or irq bits set */
+    g_assert_cmphex(readl(HACE_STS), ==, 0);
+
+    /* Write test vector into memory */
+    qtest_memwrite(qts, src_addr, test_vector, sizeof(test_vector));
+
+    write_regs(src_addr, sizeof(test_vector), digest_addr, HACE_ALGO_MD5);
+
+    /* Check hash IRQ status is asserted */
+    g_assert_cmphex(readl(HACE_STS), ==, 0x00000200);
+
+    /* Clear IRQ status and check status is deasserted */
+    writel(HACE_STS, 0x00000200);
+    g_assert_cmphex(readl(HACE_STS), ==, 0);
+
+    /* Read computed digest from memory */
+    qtest_memread(qts, digest_addr, digest, sizeof(digest));
+
+    /* Check result of computation */
+    g_assert_cmpmem(digest, sizeof(digest),
+                    test_result_md5, sizeof(digest));
+}
+
+static void test_sha256(void)
+{
+    uint64_t src_addr = 0x80000000;
+    uint64_t digest_addr = 0x81000000;
+    uint8_t digest[32] = {0};
+
+    /* Check engine is idle, no busy or irq bits set */
+    g_assert_cmphex(readl(HACE_STS), ==, 0);
+
+    /* Write test vector into memory */
+    qtest_memwrite(qts, src_addr, test_vector, sizeof(test_vector));
+
+    write_regs(src_addr, sizeof(test_vector), digest_addr, HACE_ALGO_SHA256);
+
+    /* Check hash IRQ status is asserted */
+    g_assert_cmphex(readl(HACE_STS), ==, 0x00000200);
+
+    /* Clear IRQ status and check status is deasserted */
+    writel(HACE_STS, 0x00000200);
+    g_assert_cmphex(readl(HACE_STS), ==, 0);
+
+    /* Read computed digest from memory */
+    qtest_memread(qts, digest_addr, digest, sizeof(digest));
+
+    /* Check result of computation */
+    g_assert_cmpmem(digest, sizeof(digest),
+                    test_result_sha256, sizeof(digest));
+}
+
+static void test_sha512(void)
+{
+    uint64_t src_addr = 0x80000000;
+    uint64_t digest_addr = 0x81000000;
+    uint8_t digest[64] = {0};
+
+    /* Check engine is idle, no busy or irq bits set */
+    g_assert_cmphex(readl(HACE_STS), ==, 0);
+
+    /* Write test vector into memory */
+    qtest_memwrite(qts, src_addr, test_vector, sizeof(test_vector));
+
+    write_regs(src_addr, sizeof(test_vector), digest_addr, HACE_ALGO_SHA512);
+
+    /* Check hash IRQ status is asserted */
+    g_assert_cmphex(readl(HACE_STS), ==, 0x00000200);
+
+    /* Clear IRQ status and check status is deasserted */
+    writel(HACE_STS, 0x00000200);
+    g_assert_cmphex(readl(HACE_STS), ==, 0);
+
+    /* Read computed digest from memory */
+    qtest_memread(qts, digest_addr, digest, sizeof(digest));
+
+    /* Check result of computation */
+    g_assert_cmpmem(digest, sizeof(digest),
+                    test_result_sha512, sizeof(digest));
+}
+
+static void test_addresses(void)
+{
+    /*
+     * Check command mode is zero, meaning engine is in direct access mode,
+     * as this affects the masking behavior of the HASH_SRC register.
+     */
+    g_assert_cmphex(readl(HACE_CMD), ==, 0);
+    g_assert_cmphex(readl(HACE_HASH_SRC), ==, 0);
+    g_assert_cmphex(readl(HACE_HASH_DIGEST), ==, 0);
+    g_assert_cmphex(readl(HACE_HASH_DATA_LEN), ==, 0);
+
+    /* Check that the address masking is correct */
+    writel(HACE_HASH_SRC, 0xffffffff);
+    g_assert_cmphex(readl(HACE_HASH_SRC), ==, 0x7fffffff);
+
+    writel(HACE_HASH_DIGEST, 0xffffffff);
+    g_assert_cmphex(readl(HACE_HASH_DIGEST), ==, 0x7ffffff8);
+
+    writel(HACE_HASH_DATA_LEN, 0xffffffff);
+    g_assert_cmphex(readl(HACE_HASH_DATA_LEN), ==, 0x0fffffff);
+
+    /* Reset to zero */
+    writel(HACE_HASH_SRC, 0);
+    writel(HACE_HASH_DIGEST, 0);
+    writel(HACE_HASH_DATA_LEN, 0);
+
+    /* Check that all bits are now zero */
+    g_assert_cmphex(readl(HACE_HASH_SRC), ==, 0);
+    g_assert_cmphex(readl(HACE_HASH_DIGEST), ==, 0);
+    g_assert_cmphex(readl(HACE_HASH_DATA_LEN), ==, 0);
+}
+
+int main(int argc, char **argv)
+{
+    int ret;
+
+    g_test_init(&argc, &argv, NULL);
+    g_test_set_nonfatal_assertions();
+
+    qtest_add_func("aspeed_hace_addresses", test_addresses);
+    qtest_add_func("aspeed_hace_sha512", test_sha512);
+    qtest_add_func("aspeed_hace_sha256", test_sha256);
+    qtest_add_func("aspeed_hace_md5", test_md5);
+
+    qts = qtest_start("-machine ast2600-evb");
+    ret = g_test_run();
+    qtest_end();
+
+    return ret;
+}
diff --git a/MAINTAINERS b/MAINTAINERS
index e04ae21a2f04..353aa479a720 100644
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
index 2688e1bfad7f..2eec06b10094 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -156,12 +156,15 @@ qtests_npcm7xx = \
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
2.30.1


