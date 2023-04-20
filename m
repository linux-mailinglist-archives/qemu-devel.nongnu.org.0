Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F1D56E8FC4
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 12:15:16 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppRHs-00017M-P2; Thu, 20 Apr 2023 06:13:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ppRHb-0000si-Lm
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 06:12:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ppRHY-00083R-HP
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 06:12:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681985569;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=j3kpsHYfGta/9/H6PgZ5mmFBpH+K44CiyReq8J5QXb0=;
 b=N1oYw4yRYvdbo7q2/AUw6Km8nQO4ySxGB5r1f18YS31EFbkJ2JILGiOPVI93CHsp1r1Hvv
 nnuQ7X87W6bMpNMOzmXVLOkT3xZAptn06OK9Bmh6kN7j8GrnjIf4/mBIOKZJSedHl+XoSr
 XEBuVWv8/VTlz7V5XaiEBVtAU0qFKCo=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-7-1j5F5VIuNHqc-MK2CTxrGw-1; Thu, 20 Apr 2023 06:12:46 -0400
X-MC-Unique: 1j5F5VIuNHqc-MK2CTxrGw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 823732823811;
 Thu, 20 Apr 2023 10:12:45 +0000 (UTC)
Received: from thuth.com (unknown [10.39.194.14])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5B40B440BC;
 Thu, 20 Apr 2023 10:12:44 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stefan Berger <stefanb@linux.ibm.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Ninad Palsule <ninad@linux.ibm.com>
Subject: [PULL 20/23] qtest: Add functions for accessing devices on Aspeed I2C
 controller
Date: Thu, 20 Apr 2023 12:12:13 +0200
Message-Id: <20230420101216.786304-21-thuth@redhat.com>
In-Reply-To: <20230420101216.786304-1-thuth@redhat.com>
References: <20230420101216.786304-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Stefan Berger <stefanb@linux.ibm.com>

Add read and write functions for accessing registers of I2C devices
connected to the Aspeed I2C controller.

Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Reviewed-by: Ninad Palsule <ninad@linux.ibm.com>
Message-Id: <20230331173051.3857801-2-stefanb@linux.ibm.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 include/hw/i2c/aspeed_i2c.h |   7 +++
 tests/qtest/qtest_aspeed.h  |  41 +++++++++++++
 tests/qtest/qtest_aspeed.c  | 117 ++++++++++++++++++++++++++++++++++++
 3 files changed, 165 insertions(+)
 create mode 100644 tests/qtest/qtest_aspeed.h
 create mode 100644 tests/qtest/qtest_aspeed.c

diff --git a/include/hw/i2c/aspeed_i2c.h b/include/hw/i2c/aspeed_i2c.h
index adc904d6c1..51c944efea 100644
--- a/include/hw/i2c/aspeed_i2c.h
+++ b/include/hw/i2c/aspeed_i2c.h
@@ -38,6 +38,13 @@ OBJECT_DECLARE_TYPE(AspeedI2CState, AspeedI2CClass, ASPEED_I2C)
 #define ASPEED_I2C_OLD_NUM_REG 11
 #define ASPEED_I2C_NEW_NUM_REG 22
 
+#define A_I2CD_M_STOP_CMD       BIT(5)
+#define A_I2CD_M_RX_CMD         BIT(3)
+#define A_I2CD_M_TX_CMD         BIT(1)
+#define A_I2CD_M_START_CMD      BIT(0)
+
+#define A_I2CD_MASTER_EN        BIT(0)
+
 /* Tx State Machine */
 #define   I2CD_TX_STATE_MASK                  0xf
 #define     I2CD_IDLE                         0x0
diff --git a/tests/qtest/qtest_aspeed.h b/tests/qtest/qtest_aspeed.h
new file mode 100644
index 0000000000..235dfaa186
--- /dev/null
+++ b/tests/qtest/qtest_aspeed.h
@@ -0,0 +1,41 @@
+/*
+ * Aspeed i2c bus interface to reading and writing to i2c device registers
+ *
+ * Copyright (c) 2023 IBM Corporation
+ *
+ * Authors:
+ *   Stefan Berger <stefanb@linux.ibm.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+#ifndef QTEST_ASPEED_H
+#define QTEST_ASPEED_H
+
+#include <stdint.h>
+
+#include "libqtest.h"
+
+#define AST2600_ASPEED_I2C_BASE_ADDR 0x1e78a000
+
+/* Implements only AST2600 I2C controller */
+
+static inline uint32_t ast2600_i2c_calc_bus_addr(uint8_t bus_num)
+{
+    return AST2600_ASPEED_I2C_BASE_ADDR + 0x80 + bus_num * 0x80;
+}
+
+uint8_t aspeed_i2c_readb(QTestState *s,
+                         uint32_t baseaddr, uint8_t slave_addr, uint8_t reg);
+uint16_t aspeed_i2c_readw(QTestState *s,
+                          uint32_t baseaddr, uint8_t slave_addr, uint8_t reg);
+uint32_t aspeed_i2c_readl(QTestState *s,
+                          uint32_t baseaddr, uint8_t slave_addr, uint8_t reg);
+void aspeed_i2c_writeb(QTestState *s, uint32_t baseaddr, uint8_t slave_addr,
+                       uint8_t reg, uint8_t v);
+void aspeed_i2c_writew(QTestState *s, uint32_t baseaddr, uint8_t slave_addr,
+                       uint8_t reg, uint16_t v);
+void aspeed_i2c_writel(QTestState *s, uint32_t baseaddr, uint8_t slave_addr,
+                       uint8_t reg, uint32_t v);
+
+#endif
diff --git a/tests/qtest/qtest_aspeed.c b/tests/qtest/qtest_aspeed.c
new file mode 100644
index 0000000000..f6da9adea9
--- /dev/null
+++ b/tests/qtest/qtest_aspeed.c
@@ -0,0 +1,117 @@
+/*
+ * Aspeed i2c bus interface for reading from and writing to i2c device registers
+ *
+ * Copyright (c) 2023 IBM Corporation
+ *
+ * Authors:
+ *   Stefan Berger <stefanb@linux.ibm.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+
+#include "qtest_aspeed.h"
+#include "hw/i2c/aspeed_i2c.h"
+
+static void aspeed_i2c_startup(QTestState *s, uint32_t baseaddr,
+                               uint8_t slave_addr, uint8_t reg)
+{
+    uint32_t v;
+    static int once;
+
+    if (!once) {
+        /* one time: enable master */
+       qtest_writel(s, baseaddr + A_I2CC_FUN_CTRL, 0);
+       v = qtest_readl(s, baseaddr + A_I2CC_FUN_CTRL) | A_I2CD_MASTER_EN;
+       qtest_writel(s, baseaddr + A_I2CC_FUN_CTRL, v);
+       once = 1;
+    }
+
+    /* select device */
+    qtest_writel(s, baseaddr + A_I2CD_BYTE_BUF, slave_addr << 1);
+    qtest_writel(s, baseaddr + A_I2CD_CMD,
+                 A_I2CD_M_START_CMD | A_I2CD_M_RX_CMD);
+
+    /* select the register to write to */
+    qtest_writel(s, baseaddr + A_I2CD_BYTE_BUF, reg);
+    qtest_writel(s, baseaddr + A_I2CD_CMD, A_I2CD_M_TX_CMD);
+}
+
+static uint32_t aspeed_i2c_read_n(QTestState *s,
+                                  uint32_t baseaddr, uint8_t slave_addr,
+                                  uint8_t reg, size_t nbytes)
+{
+    uint32_t res = 0;
+    uint32_t v;
+    size_t i;
+
+    aspeed_i2c_startup(s, baseaddr, slave_addr, reg);
+
+    for (i = 0; i < nbytes; i++) {
+        qtest_writel(s, baseaddr + A_I2CD_CMD, A_I2CD_M_RX_CMD);
+        v = qtest_readl(s, baseaddr + A_I2CD_BYTE_BUF) >> 8;
+        res |= (v & 0xff) << (i * 8);
+    }
+
+    qtest_writel(s, baseaddr + A_I2CD_CMD, A_I2CD_M_STOP_CMD);
+
+    return res;
+}
+
+uint32_t aspeed_i2c_readl(QTestState *s,
+                          uint32_t baseaddr, uint8_t slave_addr, uint8_t reg)
+{
+    return aspeed_i2c_read_n(s, baseaddr, slave_addr, reg, sizeof(uint32_t));
+}
+
+uint16_t aspeed_i2c_readw(QTestState *s,
+                          uint32_t baseaddr, uint8_t slave_addr, uint8_t reg)
+{
+    return aspeed_i2c_read_n(s, baseaddr, slave_addr, reg, sizeof(uint16_t));
+}
+
+uint8_t aspeed_i2c_readb(QTestState *s,
+                         uint32_t baseaddr, uint8_t slave_addr, uint8_t reg)
+{
+    return aspeed_i2c_read_n(s, baseaddr, slave_addr, reg, sizeof(uint8_t));
+}
+
+static void aspeed_i2c_write_n(QTestState *s,
+                               uint32_t baseaddr, uint8_t slave_addr,
+                               uint8_t reg, uint32_t v, size_t nbytes)
+{
+    size_t i;
+
+    aspeed_i2c_startup(s, baseaddr, slave_addr, reg);
+
+    for (i = 0; i < nbytes; i++) {
+        qtest_writel(s, baseaddr + A_I2CD_BYTE_BUF, v & 0xff);
+        v >>= 8;
+        qtest_writel(s, baseaddr + A_I2CD_CMD, A_I2CD_M_TX_CMD);
+    }
+
+    qtest_writel(s, baseaddr + A_I2CD_CMD, A_I2CD_M_STOP_CMD);
+}
+
+void aspeed_i2c_writel(QTestState *s,
+                       uint32_t baseaddr, uint8_t slave_addr,
+                       uint8_t reg, uint32_t v)
+{
+    aspeed_i2c_write_n(s, baseaddr, slave_addr, reg, v, sizeof(v));
+}
+
+void aspeed_i2c_writew(QTestState *s,
+                       uint32_t baseaddr, uint8_t slave_addr,
+                       uint8_t reg, uint16_t v)
+{
+    aspeed_i2c_write_n(s, baseaddr, slave_addr, reg, v, sizeof(v));
+}
+
+void aspeed_i2c_writeb(QTestState *s,
+                       uint32_t baseaddr, uint8_t slave_addr,
+                       uint8_t reg, uint8_t v)
+{
+    aspeed_i2c_write_n(s, baseaddr, slave_addr, reg, v, sizeof(v));
+}
-- 
2.31.1


