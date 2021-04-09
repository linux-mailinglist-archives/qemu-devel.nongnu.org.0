Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39BE43590C6
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Apr 2021 02:08:38 +0200 (CEST)
Received: from localhost ([::1]:45146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUehR-0003Ic-60
	for lists+qemu-devel@lfdr.de; Thu, 08 Apr 2021 20:08:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1lUecQ-0001Pb-1n; Thu, 08 Apr 2021 20:03:26 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:33649)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1lUecN-0005Id-HJ; Thu, 08 Apr 2021 20:03:25 -0400
Received: by mail-pl1-x62c.google.com with SMTP id p10so1886118pld.0;
 Thu, 08 Apr 2021 17:03:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Hy8sD9k9LOxOI//BykxmyByM9y3NcLptOJw1jLoQzeY=;
 b=dJSD5OgOEh6UeEM9olo7MxU2MabdEWIGTL2eU0539bw3YU6guNsLC4fmuFevSPOpey
 24bOO84iMyeQpVxNn5K8JhOXfPTw9143gFethH4g8gdb/4csP9oKTPc2MJRAqvSHQCMG
 WYKLN/NwUpyGORFJeQtk8jgQoU1dxWmImdkPmvPKP+fdB1ie1+8JFCUeyVN7oafrdyXi
 hGOl4pSxf4jaOp65F4sWu+JA1VsXEkJ9lXnEbDdH9jRtDxWTyh8dL/Tslx3rmUTNprGq
 Ap8Aufu8lmGpl5K3tgjukrPSY+RQLKFD3o5tosR1mX2mq+uRvZUTgiUK7CFlGwtgrlcA
 GGMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Hy8sD9k9LOxOI//BykxmyByM9y3NcLptOJw1jLoQzeY=;
 b=JvC4lPoFjMTzYW3ZMy6GSld8rBlchJc//K13XMPsTSI5gZkS7nbv34gOoD1+g3FjCV
 7fEJrLdJvNWBFkGZHg56wIH9+WDiZP6YyvsssKHJcfQcUStRhC11Ba/Di9V3RIMsvncn
 PBn1Fcp6NARP3D3FPOxZVBHBCg2Ut0IAoiVCIgZ5QFi6jS+jZYJk4XQiEH4Sgg5HEeKW
 9adgjbPcEfrO3+AKqK+Yb+GsIxWSYEbQ2W8b0PXKLM+Ju35juQtJ8UKwGMwygNRNvV1D
 tTphydDKp7s761UqKA+l031sPecvmTLDHCurDYdyBPOrUB3gYmzYofqFRdupKfE4uNIV
 97rQ==
X-Gm-Message-State: AOAM531HS5SoR9kLlGqOCvENehLTC11tniA6oPXDOsqstkegXv+4mpGK
 tWf/hHctQkuRqFI2fsccKwk=
X-Google-Smtp-Source: ABdhPJzQtcik7wZ75TkdTNxDtZmDVh/vpH5aIeXMDFGkX71w9BRvPPlMUGC9Qx2xPjFaPQ/S6xl84w==
X-Received: by 2002:a17:902:8347:b029:e7:4a2d:6589 with SMTP id
 z7-20020a1709028347b02900e74a2d6589mr10464615pln.64.1617926601807; 
 Thu, 08 Apr 2021 17:03:21 -0700 (PDT)
Received: from voyager.lan ([45.124.203.14])
 by smtp.gmail.com with ESMTPSA id f17sm393406pfk.184.2021.04.08.17.03.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Apr 2021 17:03:20 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH v5 3/3] tests/qtest: Add test for Aspeed HACE
Date: Fri,  9 Apr 2021 09:32:53 +0930
Message-Id: <20210409000253.1475587-4-joel@jms.id.au>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210409000253.1475587-1-joel@jms.id.au>
References: <20210409000253.1475587-1-joel@jms.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=joel.stan@gmail.com; helo=mail-pl1-x62c.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Andrew Jeffery <andrew@aj.id.au>, qemu-devel@nongnu.org,
 Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This adds a test for the Aspeed Hash and Crypto (HACE) engine. It tests
the currently implemented behavior of the hash functionality.

The tests are similar, but are cut/pasted instead of broken out into a
common function so the assert machinery produces useful output when a
test fails.

Co-developed-by: Cédric Le Goater <clg@kaod.org>
Co-developed-by: Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Reviewed-by: Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
Acked-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
v3: Write test without libqtest-single.h
v4: Run tests on all aspeed machines
v5: Add scatter gather test
---
 tests/qtest/aspeed_hace-test.c | 469 +++++++++++++++++++++++++++++++++
 MAINTAINERS                    |   1 +
 tests/qtest/meson.build        |   3 +
 3 files changed, 473 insertions(+)
 create mode 100644 tests/qtest/aspeed_hace-test.c

diff --git a/tests/qtest/aspeed_hace-test.c b/tests/qtest/aspeed_hace-test.c
new file mode 100644
index 000000000000..09ee31545e41
--- /dev/null
+++ b/tests/qtest/aspeed_hace-test.c
@@ -0,0 +1,469 @@
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
+/* Scatter-Gather Hash */
+#define SG_LIST_LEN_LAST         BIT(31)
+struct AspeedSgList {
+        uint32_t len;
+        uint32_t addr;
+} __attribute__ ((__packed__));
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
+/*
+ * The Scatter-Gather Test vector is the ascii "abc" "def" "ghi", broken
+ * into blocks of 3 characters as shown
+ *
+ * Expected results were generated using command line utitiles:
+ *
+ *  echo -n -e 'abcdefghijkl' | dd of=/tmp/test
+ *  for hash in sha512sum sha256sum; do $hash /tmp/test; done
+ *
+ */
+static const uint8_t test_vector_sg1[] = {0x61, 0x62, 0x63, 0x64, 0x65, 0x66};
+static const uint8_t test_vector_sg2[] = {0x67, 0x68, 0x69};
+static const uint8_t test_vector_sg3[] = {0x6a, 0x6b, 0x6c};
+
+static const uint8_t test_result_sg_sha512[] = {
+    0x17, 0x80, 0x7c, 0x72, 0x8e, 0xe3, 0xba, 0x35, 0xe7, 0xcf, 0x7a, 0xf8,
+    0x23, 0x11, 0x6d, 0x26, 0xe4, 0x1e, 0x5d, 0x4d, 0x6c, 0x2f, 0xf1, 0xf3,
+    0x72, 0x0d, 0x3d, 0x96, 0xaa, 0xcb, 0x6f, 0x69, 0xde, 0x64, 0x2e, 0x63,
+    0xd5, 0xb7, 0x3f, 0xc3, 0x96, 0xc1, 0x2b, 0xe3, 0x8b, 0x2b, 0xd5, 0xd8,
+    0x84, 0x25, 0x7c, 0x32, 0xc8, 0xf6, 0xd0, 0x85, 0x4a, 0xe6, 0xb5, 0x40,
+    0xf8, 0x6d, 0xda, 0x2e};
+
+static const uint8_t test_result_sg_sha256[] = {
+    0xd6, 0x82, 0xed, 0x4c, 0xa4, 0xd9, 0x89, 0xc1, 0x34, 0xec, 0x94, 0xf1,
+    0x55, 0x1e, 0x1e, 0xc5, 0x80, 0xdd, 0x6d, 0x5a, 0x6e, 0xcd, 0xe9, 0xf3,
+    0xd3, 0x5e, 0x6e, 0x4a, 0x71, 0x7f, 0xbd, 0xe4};
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
+
+    qtest_quit(s);
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
+
+    qtest_quit(s);
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
+
+    qtest_quit(s);
+}
+
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
+    struct AspeedSgList array[] = {
+        {  cpu_to_le32(sizeof(test_vector_sg1)),
+           cpu_to_le32(src_addr_1) },
+        {  cpu_to_le32(sizeof(test_vector_sg2)),
+           cpu_to_le32(src_addr_2) },
+        {  cpu_to_le32(sizeof(test_vector_sg3) | SG_LIST_LEN_LAST),
+           cpu_to_le32(src_addr_3) },
+    };
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
+
+    qtest_quit(s);
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
+    struct AspeedSgList array[] = {
+        {  cpu_to_le32(sizeof(test_vector_sg1)),
+           cpu_to_le32(src_addr_1) },
+        {  cpu_to_le32(sizeof(test_vector_sg2)),
+           cpu_to_le32(src_addr_2) },
+        {  cpu_to_le32(sizeof(test_vector_sg3) | SG_LIST_LEN_LAST),
+           cpu_to_le32(src_addr_3) },
+    };
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
+
+    qtest_quit(s);
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
+
+    qtest_quit(s);
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
+static void test_sha256_sg_ast2600(void)
+{
+    test_sha256_sg("-machine ast2600-evb", 0x1e6d0000, 0x80000000);
+}
+
+static void test_sha512_ast2600(void)
+{
+    test_sha512("-machine ast2600-evb", 0x1e6d0000, 0x80000000);
+}
+
+static void test_sha512_sg_ast2600(void)
+{
+    test_sha512_sg("-machine ast2600-evb", 0x1e6d0000, 0x80000000);
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
+    qtest_add_func("ast2600/hace/sha512_sg", test_sha512_sg_ast2600);
+    qtest_add_func("ast2600/hace/sha256_sg", test_sha256_sg_ast2600);
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
index 58f342108e9e..63c050ddc84a 100644
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


