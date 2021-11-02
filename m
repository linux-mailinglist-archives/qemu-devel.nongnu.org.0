Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21CA2442C1D
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 12:04:32 +0100 (CET)
Received: from localhost ([::1]:60866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhrah-0002xD-8H
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 07:04:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhrW1-0007Mj-Vz
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 06:59:42 -0400
Received: from mail-qv1-xf2f.google.com ([2607:f8b0:4864:20::f2f]:34364)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhrVz-0006rD-TQ
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 06:59:41 -0400
Received: by mail-qv1-xf2f.google.com with SMTP id i13so497183qvm.1
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 03:59:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Q6HNZmGYTbycFPeFxtYkDDBxjYNGXuSc6oSxfpDPpfw=;
 b=HzTiYXrXDlrijK6UQC32i9x0dktLH7nT0GHXfsWa/oRI5BcRPF3BUZ+T3P0895f/zA
 mEHWOEQ1NEhNl9cFocEDhNUWUz8KIkL2uBgcSvDqQSmiCSjMlYPsC36GJAuc1KWh0BsL
 NsZ3cY8khirldVJ/TRrnFBDPH41Z8JNDmmkAKWc1XdgFWQZrVc7I2GdItwayT0AEjKVV
 jw8VNFD1Mvneq2dsUK/rIPCHYdP3zGEQRTKzRT3AheBCLBlR7zRFmJnqZdeisSgWjigv
 gE8KS/wt5kAiKjBTnX6QQVc/1IwfAlEReNSr8kbRq1BsNsanHTb7GHMVu4pranF78fNJ
 89rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Q6HNZmGYTbycFPeFxtYkDDBxjYNGXuSc6oSxfpDPpfw=;
 b=gwMi65TuTcljM6vNGehs2//NMNS/AYMhZzX3El66V9A4nXUw7PB2mHFzaL+zR/5V37
 sD8aNGMw3q+z0Tt1W1ea2upyeHa+Y1FXovpbs+cGkoL644iVlxTb5R0cQ4EF1RJOQHLw
 Z+rgHk6B2V5f2jeuGwC30ABPxe7SOfNlhNr1Fw0q4sb6YjYd6vHfXLgSkekUcDFOFzzJ
 nBDVYewT6Oct7ucuIvotkI4c3xCn5GyFjzAaqHxkcSCPPkBOj6kmsLh1auVd/L5E47/G
 K798MFZ5MKe2rUq3tOjTzYXJO3X0ROWi4ve5m5qVeAvdu/L04DugMNSDfj/PX5Fi/YpK
 D5PA==
X-Gm-Message-State: AOAM532t5PWtrTsrzbSO55Qvpf0u1Vw+2fh9/i1CqSl7nlPfx0yBhxCy
 39qvtuhA5KOOettmEPVN8I3pf8DoD9mwIg==
X-Google-Smtp-Source: ABdhPJwGWoaQwGjHxOTlUZuAHYWmJsTmj0LmgD5OhT8jUH6iFv7Ut0G82e9598T58/gbKjj8t9srcA==
X-Received: by 2002:a05:6214:1d2b:: with SMTP id
 f11mr18926667qvd.7.1635850778982; 
 Tue, 02 Nov 2021 03:59:38 -0700 (PDT)
Received: from localhost.localdomain (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id z26sm11789510qko.13.2021.11.02.03.59.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 03:59:38 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 05/12] tests/qtest: add qtests for npcm7xx sdhci
Date: Tue,  2 Nov 2021 06:59:27 -0400
Message-Id: <20211102105934.214596-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211102105934.214596-1-richard.henderson@linaro.org>
References: <20211102105934.214596-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2f;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf2f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Hao Wu <wuhaotsh@google.com>, Tyrone Ting <kfting@nuvoton.com>,
 Shengtan Mao <stmao@google.com>, Chris Rauer <crauer@google.com>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Shengtan Mao <stmao@google.com>

Signed-off-by: Shengtan Mao <stmao@google.com>
Signed-off-by: Hao Wu <wuhaotsh@google.com>
Reviewed-by: Hao Wu <wuhaotsh@google.com>
Reviewed-by: Chris Rauer <crauer@google.com>
Reviewed-by: Tyrone Ting <kfting@nuvoton.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20211008002628.1958285-6-wuhaotsh@google.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tests/qtest/npcm7xx_sdhci-test.c | 209 +++++++++++++++++++++++++++++++
 tests/qtest/meson.build          |   1 +
 2 files changed, 210 insertions(+)
 create mode 100644 tests/qtest/npcm7xx_sdhci-test.c

diff --git a/tests/qtest/npcm7xx_sdhci-test.c b/tests/qtest/npcm7xx_sdhci-test.c
new file mode 100644
index 0000000000..a6732f657d
--- /dev/null
+++ b/tests/qtest/npcm7xx_sdhci-test.c
@@ -0,0 +1,209 @@
+/*
+ * QTests for NPCM7xx SD-3.0 / MMC-4.51 Host Controller
+ *
+ * Copyright (c) 2021 Google LLC
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
+#include "hw/sd/npcm7xx_sdhci.h"
+
+#include "libqos/libqtest.h"
+#include "libqtest-single.h"
+#include "libqos/sdhci-cmd.h"
+
+#define NPCM7XX_MMC_BA 0xF0842000
+#define NPCM7XX_BLK_SIZE 512
+#define NPCM7XX_TEST_IMAGE_SIZE (1 << 30)
+
+static char *sd_path;
+
+static QTestState *setup_sd_card(void)
+{
+    QTestState *qts = qtest_initf(
+        "-machine quanta-gbs-bmc "
+        "-device sd-card,drive=drive0 "
+        "-drive id=drive0,if=none,file=%s,format=raw,auto-read-only=off",
+        sd_path);
+
+    qtest_writew(qts, NPCM7XX_MMC_BA + SDHC_SWRST, SDHC_RESET_ALL);
+    qtest_writew(qts, NPCM7XX_MMC_BA + SDHC_CLKCON,
+                 SDHC_CLOCK_SDCLK_EN | SDHC_CLOCK_INT_STABLE |
+                 SDHC_CLOCK_INT_EN);
+    sdhci_cmd_regs(qts, NPCM7XX_MMC_BA, 0, 0, 0, 0, SDHC_APP_CMD);
+    sdhci_cmd_regs(qts, NPCM7XX_MMC_BA, 0, 0, 0x41200000, 0, (41 << 8));
+    sdhci_cmd_regs(qts, NPCM7XX_MMC_BA, 0, 0, 0, 0, SDHC_ALL_SEND_CID);
+    sdhci_cmd_regs(qts, NPCM7XX_MMC_BA, 0, 0, 0, 0, SDHC_SEND_RELATIVE_ADDR);
+    sdhci_cmd_regs(qts, NPCM7XX_MMC_BA, 0, 0, 0x45670000, 0,
+                   SDHC_SELECT_DESELECT_CARD);
+
+    return qts;
+}
+
+static void write_sdread(QTestState *qts, const char *msg)
+{
+    size_t len = strlen(msg);
+    char *rmsg = g_malloc(len);
+
+    /* write message to sd */
+    int fd = open(sd_path, O_WRONLY);
+    int ret;
+
+    g_assert(fd > 0);
+    ret = write(fd, msg, len);
+    g_assert(ret == len);
+    ret = close(fd);
+    g_assert(ret == 0);
+
+    /* read message using sdhci */
+    ret = sdhci_read_cmd(qts, NPCM7XX_MMC_BA, rmsg, len);
+    g_assert(ret == len);
+    g_assert(!strcmp(rmsg, msg));
+
+    free(rmsg);
+}
+
+/* Check MMC can read values from sd */
+static void test_read_sd(void)
+{
+    QTestState *qts = setup_sd_card();
+
+    write_sdread(qts, "hello world");
+    write_sdread(qts, "goodbye");
+
+    qtest_quit(qts);
+}
+
+static void sdwrite_read(QTestState *qts, const char *msg)
+{
+    size_t len = strlen(msg);
+    char *rmsg = g_malloc(len);
+
+    /* write message using sdhci */
+    sdhci_write_cmd(qts, NPCM7XX_MMC_BA, msg, len, NPCM7XX_BLK_SIZE);
+
+    /* read message from sd */
+    int fd = open(sd_path, O_RDONLY);
+    int ret;
+
+    g_assert(fd > 0);
+    ret = read(fd, rmsg, len);
+    g_assert(ret == len);
+    ret = close(fd);
+    g_assert(ret == 0);
+
+    g_assert(!strcmp(rmsg, msg));
+
+    free(rmsg);
+}
+
+/* Check MMC can write values to sd */
+static void test_write_sd(void)
+{
+    QTestState *qts = setup_sd_card();
+
+    sdwrite_read(qts, "hello world");
+    sdwrite_read(qts, "goodbye");
+
+    qtest_quit(qts);
+}
+
+/* Check SDHCI has correct default values. */
+static void test_reset(void)
+{
+    QTestState *qts = qtest_init("-machine quanta-gbs-bmc");
+
+    uint64_t addr = NPCM7XX_MMC_BA;
+    uint64_t end_addr = addr + 0x100;
+    uint16_t prstvals_resets[] = {NPCM7XX_PRSTVALS_0_RESET,
+                                  NPCM7XX_PRSTVALS_1_RESET,
+                                  0,
+                                  NPCM7XX_PRSTVALS_3_RESET,
+                                  0,
+                                  0};
+    int i;
+    uint32_t mask;
+    while (addr < end_addr) {
+        switch (addr - NPCM7XX_MMC_BA) {
+        case SDHC_PRNSTS:
+            /* ignores bits 20 to 24: they are changed when reading registers */
+            mask = 0x1f00000;
+            g_assert_cmphex(qtest_readl(qts, addr) | mask, ==,
+                            NPCM7XX_PRSNTS_RESET | mask);
+            addr += 4;
+            break;
+        case SDHC_BLKGAP:
+            g_assert_cmphex(qtest_readb(qts, addr), ==, NPCM7XX_BLKGAP_RESET);
+            addr += 1;
+            break;
+        case SDHC_CAPAB:
+            g_assert_cmphex(qtest_readq(qts, addr), ==, NPCM7XX_CAPAB_RESET);
+            addr += 8;
+            break;
+        case SDHC_MAXCURR:
+            g_assert_cmphex(qtest_readq(qts, addr), ==, NPCM7XX_MAXCURR_RESET);
+            addr += 8;
+            break;
+        case SDHC_HCVER:
+            g_assert_cmphex(qtest_readw(qts, addr), ==, NPCM7XX_HCVER_RESET);
+            addr += 2;
+            break;
+        case NPCM7XX_PRSTVALS:
+            for (i = 0; i < NPCM7XX_PRSTVALS_SIZE; ++i) {
+                g_assert_cmphex(qtest_readw(qts, addr + 2 * i), ==,
+                                prstvals_resets[i]);
+            }
+            addr += NPCM7XX_PRSTVALS_SIZE * 2;
+            break;
+        default:
+            g_assert_cmphex(qtest_readb(qts, addr), ==, 0);
+            addr += 1;
+        }
+    }
+
+    qtest_quit(qts);
+}
+
+static void drive_destroy(void)
+{
+    unlink(sd_path);
+    g_free(sd_path);
+}
+
+static void drive_create(void)
+{
+    int fd, ret;
+
+    sd_path = g_strdup("/tmp/qtest_npcm7xx_sdhci.XXXXXX");
+    /* Create a temporary raw image */
+    fd = mkstemp(sd_path);
+    g_assert_cmpint(fd, >=, 0);
+    ret = ftruncate(fd, NPCM7XX_TEST_IMAGE_SIZE);
+    g_assert_cmpint(ret, ==, 0);
+    g_message("%s", sd_path);
+    close(fd);
+}
+
+int main(int argc, char **argv)
+{
+    drive_create();
+
+    g_test_init(&argc, &argv, NULL);
+
+    qtest_add_func("npcm7xx_sdhci/reset", test_reset);
+    qtest_add_func("npcm7xx_sdhci/write_sd", test_write_sd);
+    qtest_add_func("npcm7xx_sdhci/read_sd", test_read_sd);
+
+    int ret = g_test_run();
+    drive_destroy();
+    return ret;
+}
diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index c9d8458062..84fa391229 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -157,6 +157,7 @@ qtests_npcm7xx = \
    'npcm7xx_gpio-test',
    'npcm7xx_pwm-test',
    'npcm7xx_rng-test',
+   'npcm7xx_sdhci-test',
    'npcm7xx_smbus-test',
    'npcm7xx_timer-test',
    'npcm7xx_watchdog_timer-test'] + \
-- 
2.25.1


