Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3327431CE4A
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 17:43:55 +0100 (CET)
Received: from localhost ([::1]:38974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lC3S6-0003zk-62
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 11:43:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lC33J-0000I7-MK
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 11:18:17 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:37585)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lC32V-0002Xk-Hv
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 11:18:17 -0500
Received: by mail-wm1-x330.google.com with SMTP id m1so15027022wml.2
 for <qemu-devel@nongnu.org>; Tue, 16 Feb 2021 08:17:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=pMI4eDmB1JYAvkmgbr4DP4EX5TPT7dcwmnzdAUEo+A4=;
 b=w8hoMc9h/R6etYgdIRPfk7jqPCsVoBT6efmjc8X4LuRJsdHrWDSJxoc9y7Yov4Rm/F
 UzzfiCxombl1ROypcgt9Hh6nubwZ32TvfxU4LkclMxuzTLY5MCJwNi3sfZ1N4mXSV4Fh
 meaP/rX5EeTYyDr4LVpmQ3ebRgLDAmVPF9RdFaD1g/RuQwfg/BwrC08LiHXIpGLDuJhM
 yDtFiG+ISd/BTZGRqE8Ra1id/4XDgasBb63wZaPhOkyQJVGnRRyGdPdQmTASjnM5p9TT
 cJAi/2PNqXHhh0o+VM179W7MlVUGqc2oKo0VBtHZHHCATHP7XNmjwypRvlABkB5G7UcF
 QhSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pMI4eDmB1JYAvkmgbr4DP4EX5TPT7dcwmnzdAUEo+A4=;
 b=n4aZI3Ill0UdeVv2oWj4ymEDCziQvno3QfpT/NiLt0QocRHKYQ6tCPgJYM5ynnc9EM
 H92M3ktlCMeX2SbxLh2+3667cj6PUxxMUtneZxfaglzIGx6stk/vzENRQBZSPYHqmd0N
 RQm/xsPVWjPzXOIf/mfgc4Yn503Mdy4FdGncH8TnHlPWh9rlGHp/Gl72B3QDVDiahZMx
 /rThejyKXrSuzvSSSdqq8ZdQB3Lm8Te1S7uAnLd6IMJ3zakUczrE88k06SPTCgonFHSq
 kx9hVMzQS6ijls5dDi90uZU5IeW14OMnYoM8FrfnLguKErqcHOCorN4LMQA0nhytD5AY
 B/aw==
X-Gm-Message-State: AOAM532PFs5k6gMm9i9K48Z7xi4gKAWCbzLW78dG5dLkXSmK2sIxO6B4
 B4hcCWzhj6f+ALZAQuOZQEhLODBNw9E71w==
X-Google-Smtp-Source: ABdhPJzDBh7s2BQbngm6BZSMW0pa0OwdCwt+PBS27jhc2oWqOTRQ0IysLpvizmOQIUj/ETU10U4ufw==
X-Received: by 2002:a05:600c:4894:: with SMTP id
 j20mr4029772wmp.152.1613492245782; 
 Tue, 16 Feb 2021 08:17:25 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id d5sm30630482wrb.14.2021.02.16.08.17.24
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Feb 2021 08:17:25 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 35/40] hw/i2c: Add a QTest for NPCM7XX SMBus Device
Date: Tue, 16 Feb 2021 16:16:53 +0000
Message-Id: <20210216161658.29881-36-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210216161658.29881-1-peter.maydell@linaro.org>
References: <20210216161658.29881-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Hao Wu <wuhaotsh@google.com>

This patch adds a QTest for NPCM7XX SMBus's single byte mode. It sends a
byte to a device in the evaluation board, and verify the retrieved value
is equivalent to the sent value.

Reviewed-by: Doug Evans<dje@google.com>
Reviewed-by: Tyrong Ting<kfting@nuvoton.com>
Signed-off-by: Hao Wu <wuhaotsh@google.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-id: 20210210220426.3577804-5-wuhaotsh@google.com
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 tests/qtest/npcm7xx_smbus-test.c | 352 +++++++++++++++++++++++++++++++
 tests/qtest/meson.build          |   1 +
 2 files changed, 353 insertions(+)
 create mode 100644 tests/qtest/npcm7xx_smbus-test.c

diff --git a/tests/qtest/npcm7xx_smbus-test.c b/tests/qtest/npcm7xx_smbus-test.c
new file mode 100644
index 00000000000..4594b107df1
--- /dev/null
+++ b/tests/qtest/npcm7xx_smbus-test.c
@@ -0,0 +1,352 @@
+/*
+ * QTests for Nuvoton NPCM7xx SMBus Modules.
+ *
+ * Copyright 2020 Google LLC
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms of the GNU General Public License as published by the
+ * Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
+ * for more details.
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/bitops.h"
+#include "libqos/i2c.h"
+#include "libqos/libqtest.h"
+#include "hw/misc/tmp105_regs.h"
+
+#define NR_SMBUS_DEVICES    16
+#define SMBUS_ADDR(x)       (0xf0080000 + 0x1000 * (x))
+#define SMBUS_IRQ(x)        (64 + (x))
+
+#define EVB_DEVICE_ADDR     0x48
+#define INVALID_DEVICE_ADDR 0x01
+
+const int evb_bus_list[] = {0, 1, 2, 6};
+
+/* Offsets */
+enum CommonRegister {
+    OFFSET_SDA     = 0x0,
+    OFFSET_ST      = 0x2,
+    OFFSET_CST     = 0x4,
+    OFFSET_CTL1    = 0x6,
+    OFFSET_ADDR1   = 0x8,
+    OFFSET_CTL2    = 0xa,
+    OFFSET_ADDR2   = 0xc,
+    OFFSET_CTL3    = 0xe,
+    OFFSET_CST2    = 0x18,
+    OFFSET_CST3    = 0x19,
+};
+
+enum NPCM7xxSMBusBank0Register {
+    OFFSET_ADDR3   = 0x10,
+    OFFSET_ADDR7   = 0x11,
+    OFFSET_ADDR4   = 0x12,
+    OFFSET_ADDR8   = 0x13,
+    OFFSET_ADDR5   = 0x14,
+    OFFSET_ADDR9   = 0x15,
+    OFFSET_ADDR6   = 0x16,
+    OFFSET_ADDR10  = 0x17,
+    OFFSET_CTL4    = 0x1a,
+    OFFSET_CTL5    = 0x1b,
+    OFFSET_SCLLT   = 0x1c,
+    OFFSET_FIF_CTL = 0x1d,
+    OFFSET_SCLHT   = 0x1e,
+};
+
+enum NPCM7xxSMBusBank1Register {
+    OFFSET_FIF_CTS  = 0x10,
+    OFFSET_FAIR_PER = 0x11,
+    OFFSET_TXF_CTL  = 0x12,
+    OFFSET_T_OUT    = 0x14,
+    OFFSET_TXF_STS  = 0x1a,
+    OFFSET_RXF_STS  = 0x1c,
+    OFFSET_RXF_CTL  = 0x1e,
+};
+
+/* ST fields */
+#define ST_STP              BIT(7)
+#define ST_SDAST            BIT(6)
+#define ST_BER              BIT(5)
+#define ST_NEGACK           BIT(4)
+#define ST_STASTR           BIT(3)
+#define ST_NMATCH           BIT(2)
+#define ST_MODE             BIT(1)
+#define ST_XMIT             BIT(0)
+
+/* CST fields */
+#define CST_ARPMATCH        BIT(7)
+#define CST_MATCHAF         BIT(6)
+#define CST_TGSCL           BIT(5)
+#define CST_TSDA            BIT(4)
+#define CST_GCMATCH         BIT(3)
+#define CST_MATCH           BIT(2)
+#define CST_BB              BIT(1)
+#define CST_BUSY            BIT(0)
+
+/* CST2 fields */
+#define CST2_INSTTS         BIT(7)
+#define CST2_MATCH7F        BIT(6)
+#define CST2_MATCH6F        BIT(5)
+#define CST2_MATCH5F        BIT(4)
+#define CST2_MATCH4F        BIT(3)
+#define CST2_MATCH3F        BIT(2)
+#define CST2_MATCH2F        BIT(1)
+#define CST2_MATCH1F        BIT(0)
+
+/* CST3 fields */
+#define CST3_EO_BUSY        BIT(7)
+#define CST3_MATCH10F       BIT(2)
+#define CST3_MATCH9F        BIT(1)
+#define CST3_MATCH8F        BIT(0)
+
+/* CTL1 fields */
+#define CTL1_STASTRE        BIT(7)
+#define CTL1_NMINTE         BIT(6)
+#define CTL1_GCMEN          BIT(5)
+#define CTL1_ACK            BIT(4)
+#define CTL1_EOBINTE        BIT(3)
+#define CTL1_INTEN          BIT(2)
+#define CTL1_STOP           BIT(1)
+#define CTL1_START          BIT(0)
+
+/* CTL2 fields */
+#define CTL2_SCLFRQ(rv)     extract8((rv), 1, 6)
+#define CTL2_ENABLE         BIT(0)
+
+/* CTL3 fields */
+#define CTL3_SCL_LVL        BIT(7)
+#define CTL3_SDA_LVL        BIT(6)
+#define CTL3_BNK_SEL        BIT(5)
+#define CTL3_400K_MODE      BIT(4)
+#define CTL3_IDL_START      BIT(3)
+#define CTL3_ARPMEN         BIT(2)
+#define CTL3_SCLFRQ(rv)     extract8((rv), 0, 2)
+
+/* ADDR fields */
+#define ADDR_EN             BIT(7)
+#define ADDR_A(rv)          extract8((rv), 0, 6)
+
+
+static void check_running(QTestState *qts, uint64_t base_addr)
+{
+    g_assert_true(qtest_readb(qts, base_addr + OFFSET_CST) & CST_BUSY);
+    g_assert_true(qtest_readb(qts, base_addr + OFFSET_CST) & CST_BB);
+}
+
+static void check_stopped(QTestState *qts, uint64_t base_addr)
+{
+    uint8_t cst3;
+
+    g_assert_cmphex(qtest_readb(qts, base_addr + OFFSET_ST), ==, 0);
+    g_assert_false(qtest_readb(qts, base_addr + OFFSET_CST) & CST_BUSY);
+    g_assert_false(qtest_readb(qts, base_addr + OFFSET_CST) & CST_BB);
+
+    cst3 = qtest_readb(qts, base_addr + OFFSET_CST3);
+    g_assert_true(cst3 & CST3_EO_BUSY);
+    qtest_writeb(qts, base_addr + OFFSET_CST3, cst3);
+    cst3 = qtest_readb(qts, base_addr + OFFSET_CST3);
+    g_assert_false(cst3 & CST3_EO_BUSY);
+}
+
+static void enable_bus(QTestState *qts, uint64_t base_addr)
+{
+    uint8_t ctl2 = qtest_readb(qts, base_addr + OFFSET_CTL2);
+
+    ctl2 |= CTL2_ENABLE;
+    qtest_writeb(qts, base_addr + OFFSET_CTL2, ctl2);
+    g_assert_true(qtest_readb(qts, base_addr + OFFSET_CTL2) & CTL2_ENABLE);
+}
+
+static void disable_bus(QTestState *qts, uint64_t base_addr)
+{
+    uint8_t ctl2 = qtest_readb(qts, base_addr + OFFSET_CTL2);
+
+    ctl2 &= ~CTL2_ENABLE;
+    qtest_writeb(qts, base_addr + OFFSET_CTL2, ctl2);
+    g_assert_false(qtest_readb(qts, base_addr + OFFSET_CTL2) & CTL2_ENABLE);
+}
+
+static void start_transfer(QTestState *qts, uint64_t base_addr)
+{
+    uint8_t ctl1;
+
+    ctl1 = CTL1_START | CTL1_INTEN | CTL1_STASTRE;
+    qtest_writeb(qts, base_addr + OFFSET_CTL1, ctl1);
+    g_assert_cmphex(qtest_readb(qts, base_addr + OFFSET_CTL1), ==,
+                    CTL1_INTEN | CTL1_STASTRE | CTL1_INTEN);
+    g_assert_cmphex(qtest_readb(qts, base_addr + OFFSET_ST), ==,
+                    ST_MODE | ST_XMIT | ST_SDAST);
+    check_running(qts, base_addr);
+}
+
+static void stop_transfer(QTestState *qts, uint64_t base_addr)
+{
+    uint8_t ctl1 = qtest_readb(qts, base_addr + OFFSET_CTL1);
+
+    ctl1 &= ~(CTL1_START | CTL1_ACK);
+    ctl1 |= CTL1_STOP | CTL1_INTEN | CTL1_EOBINTE;
+    qtest_writeb(qts, base_addr + OFFSET_CTL1, ctl1);
+    ctl1 = qtest_readb(qts, base_addr + OFFSET_CTL1);
+    g_assert_false(ctl1 & CTL1_STOP);
+}
+
+static void send_byte(QTestState *qts, uint64_t base_addr, uint8_t byte)
+{
+    g_assert_cmphex(qtest_readb(qts, base_addr + OFFSET_ST), ==,
+                    ST_MODE | ST_XMIT | ST_SDAST);
+    qtest_writeb(qts, base_addr + OFFSET_SDA, byte);
+}
+
+static uint8_t recv_byte(QTestState *qts, uint64_t base_addr)
+{
+    g_assert_cmphex(qtest_readb(qts, base_addr + OFFSET_ST), ==,
+                    ST_MODE | ST_SDAST);
+    return qtest_readb(qts, base_addr + OFFSET_SDA);
+}
+
+static void send_address(QTestState *qts, uint64_t base_addr, uint8_t addr,
+                         bool recv, bool valid)
+{
+    uint8_t encoded_addr = (addr << 1) | (recv ? 1 : 0);
+    uint8_t st;
+
+    qtest_writeb(qts, base_addr + OFFSET_SDA, encoded_addr);
+    st = qtest_readb(qts, base_addr + OFFSET_ST);
+
+    if (valid) {
+        if (recv) {
+            g_assert_cmphex(st, ==, ST_MODE | ST_SDAST | ST_STASTR);
+        } else {
+            g_assert_cmphex(st, ==, ST_MODE | ST_XMIT | ST_SDAST | ST_STASTR);
+        }
+
+        qtest_writeb(qts, base_addr + OFFSET_ST, ST_STASTR);
+        st = qtest_readb(qts, base_addr + OFFSET_ST);
+        if (recv) {
+            g_assert_cmphex(st, ==, ST_MODE | ST_SDAST);
+        } else {
+            g_assert_cmphex(st, ==, ST_MODE | ST_XMIT | ST_SDAST);
+        }
+    } else {
+        if (recv) {
+            g_assert_cmphex(st, ==, ST_MODE | ST_NEGACK);
+        } else {
+            g_assert_cmphex(st, ==, ST_MODE | ST_XMIT | ST_NEGACK);
+        }
+    }
+}
+
+static void send_nack(QTestState *qts, uint64_t base_addr)
+{
+    uint8_t ctl1 = qtest_readb(qts, base_addr + OFFSET_CTL1);
+
+    ctl1 &= ~(CTL1_START | CTL1_STOP);
+    ctl1 |= CTL1_ACK | CTL1_INTEN;
+    qtest_writeb(qts, base_addr + OFFSET_CTL1, ctl1);
+}
+
+/* Check the SMBus's status is set correctly when disabled. */
+static void test_disable_bus(gconstpointer data)
+{
+    intptr_t index = (intptr_t)data;
+    uint64_t base_addr = SMBUS_ADDR(index);
+    QTestState *qts = qtest_init("-machine npcm750-evb");
+
+    disable_bus(qts, base_addr);
+    g_assert_cmphex(qtest_readb(qts, base_addr + OFFSET_CTL1), ==, 0);
+    g_assert_cmphex(qtest_readb(qts, base_addr + OFFSET_ST), ==, 0);
+    g_assert_false(qtest_readb(qts, base_addr + OFFSET_CST3) & CST3_EO_BUSY);
+    g_assert_cmphex(qtest_readb(qts, base_addr + OFFSET_CST), ==, 0);
+    qtest_quit(qts);
+}
+
+/* Check the SMBus returns a NACK for an invalid address. */
+static void test_invalid_addr(gconstpointer data)
+{
+    intptr_t index = (intptr_t)data;
+    uint64_t base_addr = SMBUS_ADDR(index);
+    int irq = SMBUS_IRQ(index);
+    QTestState *qts = qtest_init("-machine npcm750-evb");
+
+    qtest_irq_intercept_in(qts, "/machine/soc/a9mpcore/gic");
+    enable_bus(qts, base_addr);
+    g_assert_false(qtest_get_irq(qts, irq));
+    start_transfer(qts, base_addr);
+    send_address(qts, base_addr, INVALID_DEVICE_ADDR, false, false);
+    g_assert_true(qtest_get_irq(qts, irq));
+    stop_transfer(qts, base_addr);
+    check_running(qts, base_addr);
+    qtest_writeb(qts, base_addr + OFFSET_ST, ST_NEGACK);
+    g_assert_false(qtest_readb(qts, base_addr + OFFSET_ST) & ST_NEGACK);
+    check_stopped(qts, base_addr);
+    qtest_quit(qts);
+}
+
+/* Check the SMBus can send and receive bytes to a device in single mode. */
+static void test_single_mode(gconstpointer data)
+{
+    intptr_t index = (intptr_t)data;
+    uint64_t base_addr = SMBUS_ADDR(index);
+    int irq = SMBUS_IRQ(index);
+    uint8_t value = 0x60;
+    QTestState *qts = qtest_init("-machine npcm750-evb");
+
+    qtest_irq_intercept_in(qts, "/machine/soc/a9mpcore/gic");
+    enable_bus(qts, base_addr);
+
+    /* Sending */
+    g_assert_false(qtest_get_irq(qts, irq));
+    start_transfer(qts, base_addr);
+    g_assert_true(qtest_get_irq(qts, irq));
+    send_address(qts, base_addr, EVB_DEVICE_ADDR, false, true);
+    send_byte(qts, base_addr, TMP105_REG_CONFIG);
+    send_byte(qts, base_addr, value);
+    stop_transfer(qts, base_addr);
+    check_stopped(qts, base_addr);
+
+    /* Receiving */
+    start_transfer(qts, base_addr);
+    send_address(qts, base_addr, EVB_DEVICE_ADDR, false, true);
+    send_byte(qts, base_addr, TMP105_REG_CONFIG);
+    start_transfer(qts, base_addr);
+    send_address(qts, base_addr, EVB_DEVICE_ADDR, true, true);
+    send_nack(qts, base_addr);
+    stop_transfer(qts, base_addr);
+    check_running(qts, base_addr);
+    g_assert_cmphex(recv_byte(qts, base_addr), ==, value);
+    check_stopped(qts, base_addr);
+    qtest_quit(qts);
+}
+
+static void smbus_add_test(const char *name, int index, GTestDataFunc fn)
+{
+    g_autofree char *full_name = g_strdup_printf(
+            "npcm7xx_smbus[%d]/%s", index, name);
+    qtest_add_data_func(full_name, (void *)(intptr_t)index, fn);
+}
+#define add_test(name, td) smbus_add_test(#name, td, test_##name)
+
+int main(int argc, char **argv)
+{
+    int i;
+
+    g_test_init(&argc, &argv, NULL);
+    g_test_set_nonfatal_assertions();
+
+    for (i = 0; i < NR_SMBUS_DEVICES; ++i) {
+        add_test(disable_bus, i);
+        add_test(invalid_addr, i);
+    }
+
+    for (i = 0; i < ARRAY_SIZE(evb_bus_list); ++i) {
+        add_test(single_mode, evb_bus_list[i]);
+    }
+
+    return g_test_run();
+}
diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index c83bc211b6a..ba6ecaed325 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -139,6 +139,7 @@ qtests_npcm7xx = \
    'npcm7xx_gpio-test',
    'npcm7xx_pwm-test',
    'npcm7xx_rng-test',
+   'npcm7xx_smbus-test',
    'npcm7xx_timer-test',
    'npcm7xx_watchdog_timer-test']
 qtests_arm = \
-- 
2.20.1


