Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13F6A2F36AA
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 18:08:51 +0100 (CET)
Received: from localhost ([::1]:52614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzNA2-000347-1s
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 12:08:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kzMzw-00020m-T1
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 11:58:25 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:55968)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kzMzq-00073d-M7
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 11:58:24 -0500
Received: by mail-wm1-x331.google.com with SMTP id c124so2505842wma.5
 for <qemu-devel@nongnu.org>; Tue, 12 Jan 2021 08:58:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=FYSx5C1RllXjCPZSgL2+iGMXVBbHtGDyiRvXwgE4uRQ=;
 b=H1UW5eSXP5XjfS/5haE8pHMUur5ng/zP0zyeVknn0JodmmngLpFbjfdU8SbAvdl4D9
 x1UI8ksEDmeZ6DL14+NvLYJ9uEy9cZhg6xmFPkY8+sZgPAFPDcnTPOQ24/q7hnyCGDn0
 VX1bWNBDvpA9MVxWscii1g4mKGU9DhMBh7vLFtmFst3dOk0nlddMvcn/mUouw+LVtFvQ
 9qlGffrF8GgrJqlKxs19U+43Y1qi/9Dj1ZF9O4coPqg+24G/4eBUK2CWUymMqm0IbLcN
 ReBnIfL7UgFRsDt9vJ57AW/ARujMnkz/gwEAtynd2j1VToJEKgSSuKReFy+Q+Y5Zx/gL
 KWLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FYSx5C1RllXjCPZSgL2+iGMXVBbHtGDyiRvXwgE4uRQ=;
 b=Sf8yN8bwhd06Zkr9kQbhjRvtM0V5cxapOuCyGN6qg3Xh1YngJAs8U0WrchI8/RkF9N
 nhdLMEdWpXb+PONFxHqH0P7tAB2ufFR/zRUn2zkDWLD7r5AKnOpjHAFdhnmRdaYVa4Hu
 OHyWVLWhmQ8s94k5iHAEIxxDPienNpBq99FV/q6BMNhzu1m6LcFD1C7vr96X9qDJEtjc
 Ct7FmrZl2UronWz/kMXID6SdcErX9tooeZznZLI2Ec3Pu8tnBNBojuXgWbSBWJIxEkpD
 XlupZs5NFZIPMa41OHcJuvJFsKlDWLANZ/qzYHYJa1QMJROLWFSVVD/iHfTkOTEc+sc7
 3ZCg==
X-Gm-Message-State: AOAM533SwrlgkkC6L3B6mG+u6BlJr7V4kEO9Jeja1OdaukjMtnZTpQOx
 bQonkA9PoXNZqUqIVHL08MdLia3Rq16UWA==
X-Google-Smtp-Source: ABdhPJy4Fk22iD5mpDcxaqPIHxodA93XssUbyYsWKEHliS+i7c1CthvEXKAMwAoVAkpvsaQQTkbWIw==
X-Received: by 2002:a7b:c182:: with SMTP id y2mr173741wmi.57.1610470696946;
 Tue, 12 Jan 2021 08:58:16 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id i18sm6210083wrp.74.2021.01.12.08.58.15
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 08:58:15 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 19/21] hw/misc: Add QTest for NPCM7XX PWM Module
Date: Tue, 12 Jan 2021 16:57:48 +0000
Message-Id: <20210112165750.30475-20-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210112165750.30475-1-peter.maydell@linaro.org>
References: <20210112165750.30475-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x331.google.com
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

We add a qtest for the PWM in the previous patch. It proves it works as
expected.

Reviewed-by: Havard Skinnemoen <hskinnemoen@google.com>
Reviewed-by: Tyrone Ting <kfting@nuvoton.com>
Signed-off-by: Hao Wu <wuhaotsh@google.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-id: 20210108190945.949196-6-wuhaotsh@google.com
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 tests/qtest/npcm7xx_pwm-test.c | 490 +++++++++++++++++++++++++++++++++
 tests/qtest/meson.build        |   1 +
 2 files changed, 491 insertions(+)
 create mode 100644 tests/qtest/npcm7xx_pwm-test.c

diff --git a/tests/qtest/npcm7xx_pwm-test.c b/tests/qtest/npcm7xx_pwm-test.c
new file mode 100644
index 00000000000..33fbdf5f545
--- /dev/null
+++ b/tests/qtest/npcm7xx_pwm-test.c
@@ -0,0 +1,490 @@
+/*
+ * QTests for Nuvoton NPCM7xx PWM Modules.
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
+#include "libqos/libqtest.h"
+#include "qapi/qmp/qdict.h"
+#include "qapi/qmp/qnum.h"
+
+#define REF_HZ          25000000
+
+/* Register field definitions. */
+#define CH_EN           BIT(0)
+#define CH_INV          BIT(2)
+#define CH_MOD          BIT(3)
+
+/* Registers shared between all PWMs in a module */
+#define PPR             0x00
+#define CSR             0x04
+#define PCR             0x08
+#define PIER            0x3c
+#define PIIR            0x40
+
+/* CLK module related */
+#define CLK_BA          0xf0801000
+#define CLKSEL          0x04
+#define CLKDIV1         0x08
+#define CLKDIV2         0x2c
+#define PLLCON0         0x0c
+#define PLLCON1         0x10
+#define PLL_INDV(rv)    extract32((rv), 0, 6)
+#define PLL_FBDV(rv)    extract32((rv), 16, 12)
+#define PLL_OTDV1(rv)   extract32((rv), 8, 3)
+#define PLL_OTDV2(rv)   extract32((rv), 13, 3)
+#define APB3CKDIV(rv)   extract32((rv), 28, 2)
+#define CLK2CKDIV(rv)   extract32((rv), 0, 1)
+#define CLK4CKDIV(rv)   extract32((rv), 26, 2)
+#define CPUCKSEL(rv)    extract32((rv), 0, 2)
+
+#define MAX_DUTY        1000000
+
+typedef struct PWMModule {
+    int irq;
+    uint64_t base_addr;
+} PWMModule;
+
+typedef struct PWM {
+    uint32_t cnr_offset;
+    uint32_t cmr_offset;
+    uint32_t pdr_offset;
+    uint32_t pwdr_offset;
+} PWM;
+
+typedef struct TestData {
+    const PWMModule *module;
+    const PWM *pwm;
+} TestData;
+
+static const PWMModule pwm_module_list[] = {
+    {
+        .irq        = 93,
+        .base_addr  = 0xf0103000
+    },
+    {
+        .irq        = 94,
+        .base_addr  = 0xf0104000
+    }
+};
+
+static const PWM pwm_list[] = {
+    {
+        .cnr_offset     = 0x0c,
+        .cmr_offset     = 0x10,
+        .pdr_offset     = 0x14,
+        .pwdr_offset    = 0x44,
+    },
+    {
+        .cnr_offset     = 0x18,
+        .cmr_offset     = 0x1c,
+        .pdr_offset     = 0x20,
+        .pwdr_offset    = 0x48,
+    },
+    {
+        .cnr_offset     = 0x24,
+        .cmr_offset     = 0x28,
+        .pdr_offset     = 0x2c,
+        .pwdr_offset    = 0x4c,
+    },
+    {
+        .cnr_offset     = 0x30,
+        .cmr_offset     = 0x34,
+        .pdr_offset     = 0x38,
+        .pwdr_offset    = 0x50,
+    },
+};
+
+static const int ppr_base[] = { 0, 0, 8, 8 };
+static const int csr_base[] = { 0, 4, 8, 12 };
+static const int pcr_base[] = { 0, 8, 12, 16 };
+
+static const uint32_t ppr_list[] = {
+    0,
+    1,
+    10,
+    100,
+    255, /* Max possible value. */
+};
+
+static const uint32_t csr_list[] = {
+    0,
+    1,
+    2,
+    3,
+    4, /* Max possible value. */
+};
+
+static const uint32_t cnr_list[] = {
+    0,
+    1,
+    50,
+    100,
+    150,
+    200,
+    1000,
+    10000,
+    65535, /* Max possible value. */
+};
+
+static const uint32_t cmr_list[] = {
+    0,
+    1,
+    10,
+    50,
+    100,
+    150,
+    200,
+    1000,
+    10000,
+    65535, /* Max possible value. */
+};
+
+/* Returns the index of the PWM module. */
+static int pwm_module_index(const PWMModule *module)
+{
+    ptrdiff_t diff = module - pwm_module_list;
+
+    g_assert_true(diff >= 0 && diff < ARRAY_SIZE(pwm_module_list));
+
+    return diff;
+}
+
+/* Returns the index of the PWM entry. */
+static int pwm_index(const PWM *pwm)
+{
+    ptrdiff_t diff = pwm - pwm_list;
+
+    g_assert_true(diff >= 0 && diff < ARRAY_SIZE(pwm_list));
+
+    return diff;
+}
+
+static uint64_t pwm_qom_get(QTestState *qts, const char *path, const char *name)
+{
+    QDict *response;
+
+    g_test_message("Getting properties %s from %s", name, path);
+    response = qtest_qmp(qts, "{ 'execute': 'qom-get',"
+            " 'arguments': { 'path': %s, 'property': %s}}",
+            path, name);
+    /* The qom set message returns successfully. */
+    g_assert_true(qdict_haskey(response, "return"));
+    return qnum_get_uint(qobject_to(QNum, qdict_get(response, "return")));
+}
+
+static uint64_t pwm_get_freq(QTestState *qts, int module_index, int pwm_index)
+{
+    char path[100];
+    char name[100];
+
+    sprintf(path, "/machine/soc/pwm[%d]", module_index);
+    sprintf(name, "freq[%d]", pwm_index);
+
+    return pwm_qom_get(qts, path, name);
+}
+
+static uint64_t pwm_get_duty(QTestState *qts, int module_index, int pwm_index)
+{
+    char path[100];
+    char name[100];
+
+    sprintf(path, "/machine/soc/pwm[%d]", module_index);
+    sprintf(name, "duty[%d]", pwm_index);
+
+    return pwm_qom_get(qts, path, name);
+}
+
+static uint32_t get_pll(uint32_t con)
+{
+    return REF_HZ * PLL_FBDV(con) / (PLL_INDV(con) * PLL_OTDV1(con)
+            * PLL_OTDV2(con));
+}
+
+static uint64_t read_pclk(QTestState *qts)
+{
+    uint64_t freq = REF_HZ;
+    uint32_t clksel = qtest_readl(qts, CLK_BA + CLKSEL);
+    uint32_t pllcon;
+    uint32_t clkdiv1 = qtest_readl(qts, CLK_BA + CLKDIV1);
+    uint32_t clkdiv2 = qtest_readl(qts, CLK_BA + CLKDIV2);
+
+    switch (CPUCKSEL(clksel)) {
+    case 0:
+        pllcon = qtest_readl(qts, CLK_BA + PLLCON0);
+        freq = get_pll(pllcon);
+        break;
+    case 1:
+        pllcon = qtest_readl(qts, CLK_BA + PLLCON1);
+        freq = get_pll(pllcon);
+        break;
+    case 2:
+        break;
+    case 3:
+        break;
+    default:
+        g_assert_not_reached();
+    }
+
+    freq >>= (CLK2CKDIV(clkdiv1) + CLK4CKDIV(clkdiv1) + APB3CKDIV(clkdiv2));
+
+    return freq;
+}
+
+static uint32_t pwm_selector(uint32_t csr)
+{
+    switch (csr) {
+    case 0:
+        return 2;
+    case 1:
+        return 4;
+    case 2:
+        return 8;
+    case 3:
+        return 16;
+    case 4:
+        return 1;
+    default:
+        g_assert_not_reached();
+    }
+}
+
+static uint64_t pwm_compute_freq(QTestState *qts, uint32_t ppr, uint32_t csr,
+        uint32_t cnr)
+{
+    return read_pclk(qts) / ((ppr + 1) * pwm_selector(csr) * (cnr + 1));
+}
+
+static uint64_t pwm_compute_duty(uint32_t cnr, uint32_t cmr, bool inverted)
+{
+    uint64_t duty;
+
+    if (cnr == 0) {
+        /* PWM is stopped. */
+        duty = 0;
+    } else if (cmr >= cnr) {
+        duty = MAX_DUTY;
+    } else {
+        duty = MAX_DUTY * (cmr + 1) / (cnr + 1);
+    }
+
+    if (inverted) {
+        duty = MAX_DUTY - duty;
+    }
+
+    return duty;
+}
+
+static uint32_t pwm_read(QTestState *qts, const TestData *td, unsigned offset)
+{
+    return qtest_readl(qts, td->module->base_addr + offset);
+}
+
+static void pwm_write(QTestState *qts, const TestData *td, unsigned offset,
+        uint32_t value)
+{
+    qtest_writel(qts, td->module->base_addr + offset, value);
+}
+
+static uint32_t pwm_read_ppr(QTestState *qts, const TestData *td)
+{
+    return extract32(pwm_read(qts, td, PPR), ppr_base[pwm_index(td->pwm)], 8);
+}
+
+static void pwm_write_ppr(QTestState *qts, const TestData *td, uint32_t value)
+{
+    pwm_write(qts, td, PPR, value << ppr_base[pwm_index(td->pwm)]);
+}
+
+static uint32_t pwm_read_csr(QTestState *qts, const TestData *td)
+{
+    return extract32(pwm_read(qts, td, CSR), csr_base[pwm_index(td->pwm)], 3);
+}
+
+static void pwm_write_csr(QTestState *qts, const TestData *td, uint32_t value)
+{
+    pwm_write(qts, td, CSR, value << csr_base[pwm_index(td->pwm)]);
+}
+
+static uint32_t pwm_read_pcr(QTestState *qts, const TestData *td)
+{
+    return extract32(pwm_read(qts, td, PCR), pcr_base[pwm_index(td->pwm)], 4);
+}
+
+static void pwm_write_pcr(QTestState *qts, const TestData *td, uint32_t value)
+{
+    pwm_write(qts, td, PCR, value << pcr_base[pwm_index(td->pwm)]);
+}
+
+static uint32_t pwm_read_cnr(QTestState *qts, const TestData *td)
+{
+    return pwm_read(qts, td, td->pwm->cnr_offset);
+}
+
+static void pwm_write_cnr(QTestState *qts, const TestData *td, uint32_t value)
+{
+    pwm_write(qts, td, td->pwm->cnr_offset, value);
+}
+
+static uint32_t pwm_read_cmr(QTestState *qts, const TestData *td)
+{
+    return pwm_read(qts, td, td->pwm->cmr_offset);
+}
+
+static void pwm_write_cmr(QTestState *qts, const TestData *td, uint32_t value)
+{
+    pwm_write(qts, td, td->pwm->cmr_offset, value);
+}
+
+/* Check pwm registers can be reset to default value */
+static void test_init(gconstpointer test_data)
+{
+    const TestData *td = test_data;
+    QTestState *qts = qtest_init("-machine quanta-gsj");
+    int module = pwm_module_index(td->module);
+    int pwm = pwm_index(td->pwm);
+
+    g_assert_cmpuint(pwm_get_freq(qts, module, pwm), ==, 0);
+    g_assert_cmpuint(pwm_get_duty(qts, module, pwm), ==, 0);
+
+    qtest_quit(qts);
+}
+
+/* One-shot mode should not change frequency and duty cycle. */
+static void test_oneshot(gconstpointer test_data)
+{
+    const TestData *td = test_data;
+    QTestState *qts = qtest_init("-machine quanta-gsj");
+    int module = pwm_module_index(td->module);
+    int pwm = pwm_index(td->pwm);
+    uint32_t ppr, csr, pcr;
+    int i, j;
+
+    pcr = CH_EN;
+    for (i = 0; i < ARRAY_SIZE(ppr_list); ++i) {
+        ppr = ppr_list[i];
+        pwm_write_ppr(qts, td, ppr);
+
+        for (j = 0; j < ARRAY_SIZE(csr_list); ++j) {
+            csr = csr_list[j];
+            pwm_write_csr(qts, td, csr);
+            pwm_write_pcr(qts, td, pcr);
+
+            g_assert_cmpuint(pwm_read_ppr(qts, td), ==, ppr);
+            g_assert_cmpuint(pwm_read_csr(qts, td), ==, csr);
+            g_assert_cmpuint(pwm_read_pcr(qts, td), ==, pcr);
+            g_assert_cmpuint(pwm_get_freq(qts, module, pwm), ==, 0);
+            g_assert_cmpuint(pwm_get_duty(qts, module, pwm), ==, 0);
+        }
+    }
+
+    qtest_quit(qts);
+}
+
+/* In toggle mode, the PWM generates correct outputs. */
+static void test_toggle(gconstpointer test_data)
+{
+    const TestData *td = test_data;
+    QTestState *qts = qtest_init("-machine quanta-gsj");
+    int module = pwm_module_index(td->module);
+    int pwm = pwm_index(td->pwm);
+    uint32_t ppr, csr, pcr, cnr, cmr;
+    int i, j, k, l;
+    uint64_t expected_freq, expected_duty;
+
+    pcr = CH_EN | CH_MOD;
+    for (i = 0; i < ARRAY_SIZE(ppr_list); ++i) {
+        ppr = ppr_list[i];
+        pwm_write_ppr(qts, td, ppr);
+
+        for (j = 0; j < ARRAY_SIZE(csr_list); ++j) {
+            csr = csr_list[j];
+            pwm_write_csr(qts, td, csr);
+
+            for (k = 0; k < ARRAY_SIZE(cnr_list); ++k) {
+                cnr = cnr_list[k];
+                pwm_write_cnr(qts, td, cnr);
+
+                for (l = 0; l < ARRAY_SIZE(cmr_list); ++l) {
+                    cmr = cmr_list[l];
+                    pwm_write_cmr(qts, td, cmr);
+                    expected_freq = pwm_compute_freq(qts, ppr, csr, cnr);
+                    expected_duty = pwm_compute_duty(cnr, cmr, false);
+
+                    pwm_write_pcr(qts, td, pcr);
+                    g_assert_cmpuint(pwm_read_ppr(qts, td), ==, ppr);
+                    g_assert_cmpuint(pwm_read_csr(qts, td), ==, csr);
+                    g_assert_cmpuint(pwm_read_pcr(qts, td), ==, pcr);
+                    g_assert_cmpuint(pwm_read_cnr(qts, td), ==, cnr);
+                    g_assert_cmpuint(pwm_read_cmr(qts, td), ==, cmr);
+                    g_assert_cmpuint(pwm_get_duty(qts, module, pwm),
+                            ==, expected_duty);
+                    if (expected_duty != 0 && expected_duty != 100) {
+                        /* Duty cycle with 0 or 100 doesn't need frequency. */
+                        g_assert_cmpuint(pwm_get_freq(qts, module, pwm),
+                                ==, expected_freq);
+                    }
+
+                    /* Test inverted mode */
+                    expected_duty = pwm_compute_duty(cnr, cmr, true);
+                    pwm_write_pcr(qts, td, pcr | CH_INV);
+                    g_assert_cmpuint(pwm_read_pcr(qts, td), ==, pcr | CH_INV);
+                    g_assert_cmpuint(pwm_get_duty(qts, module, pwm),
+                            ==, expected_duty);
+                    if (expected_duty != 0 && expected_duty != 100) {
+                        /* Duty cycle with 0 or 100 doesn't need frequency. */
+                        g_assert_cmpuint(pwm_get_freq(qts, module, pwm),
+                                ==, expected_freq);
+                    }
+
+                }
+            }
+        }
+    }
+
+    qtest_quit(qts);
+}
+
+static void pwm_add_test(const char *name, const TestData* td,
+        GTestDataFunc fn)
+{
+    g_autofree char *full_name = g_strdup_printf(
+            "npcm7xx_pwm/module[%d]/pwm[%d]/%s", pwm_module_index(td->module),
+            pwm_index(td->pwm), name);
+    qtest_add_data_func(full_name, td, fn);
+}
+#define add_test(name, td) pwm_add_test(#name, td, test_##name)
+
+int main(int argc, char **argv)
+{
+    TestData test_data_list[ARRAY_SIZE(pwm_module_list) * ARRAY_SIZE(pwm_list)];
+
+    g_test_init(&argc, &argv, NULL);
+
+    for (int i = 0; i < ARRAY_SIZE(pwm_module_list); ++i) {
+        for (int j = 0; j < ARRAY_SIZE(pwm_list); ++j) {
+            TestData *td = &test_data_list[i * ARRAY_SIZE(pwm_list) + j];
+
+            td->module = &pwm_module_list[i];
+            td->pwm = &pwm_list[j];
+
+            add_test(init, td);
+            add_test(oneshot, td);
+            add_test(toggle, td);
+        }
+    }
+
+    return g_test_run();
+}
diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index 955710d1c5d..0b5467f0844 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -136,6 +136,7 @@ qtests_sparc64 = \
 qtests_npcm7xx = \
   ['npcm7xx_adc-test',
    'npcm7xx_gpio-test',
+   'npcm7xx_pwm-test',
    'npcm7xx_rng-test',
    'npcm7xx_timer-test',
    'npcm7xx_watchdog_timer-test']
-- 
2.20.1


