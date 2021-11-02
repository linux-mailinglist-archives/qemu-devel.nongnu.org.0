Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27A81442C24
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 12:06:34 +0100 (CET)
Received: from localhost ([::1]:39420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhrcf-0007b2-AK
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 07:06:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhrW2-0007Mm-2L
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 06:59:42 -0400
Received: from mail-qt1-x835.google.com ([2607:f8b0:4864:20::835]:42503)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhrVz-0006r4-VP
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 06:59:41 -0400
Received: by mail-qt1-x835.google.com with SMTP id v22so809761qtk.9
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 03:59:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5olNar/voJxctGgKV5rYLhEwaLGt/m101tgdSsLT0J8=;
 b=iXo8DKjfBucclI9t86IravtApnAGcNWoUib2yhBaKXhno4bbiMjAytNyF1vaAbKqcV
 XEqmEO5OGQ7hlQYqBI4kqa3pc1MJV1zd52TfnZF8T29PipSLipGR9eujSaMLclHAKlrF
 NTWHmTIL/awZEfeoypipjh87Via0SvJlHpdj71eV7nFp0QRYkQRLQ02KjcCbvLF892T5
 /sAnH+WCAI00M1RTEI3AF8vt0UrwsEx/Ba+dQmJl/Q4f+7c+gcrc6A0K9fjuluxy8jQ6
 bcUleGSsKuFuancADcenDttF8H+ZRZo56C+ktNcOQCwnm2I/ijAMbXAGIBh41xjJcVmp
 yWmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5olNar/voJxctGgKV5rYLhEwaLGt/m101tgdSsLT0J8=;
 b=q4SZCMGK81KkVkX97BaxEdWehHU9OVjVPt+OL6jbHSYN0VtgB7e5QwD9ccZ+f8/tan
 R8vuAt8A+D5/SlrtqwDfvAwzgt9g7AmEUNkvhyiQzrP3rgOm/HmlxPYvCrqS8f7JcMLc
 MvZjjqgEynaEDwZHttBv1xCbRsHvPmei412G+BwBy5pvCKvBg+YYNyIpzbCK8c1M/MXr
 gFv929TrJ7Udwck+SdQo+v779hxSWGtToH19+UWFgwZpMwVZESNwhikkAEr7AFZJbyeT
 xHCXB32ktcxJX90ZQupTTNsCsS6gjX4u8yYyZO/UtKjAJiUYEweY0ObhrDVHUgFiYIWS
 ilgw==
X-Gm-Message-State: AOAM5310den1UzPOYlaMIVt0a/a4r895ZSlp7Q1oxIZ6ApDD0u6fYSyD
 XZZl900Wi2Y8LykDOWg3pdnmmc8LJq4o6Q==
X-Google-Smtp-Source: ABdhPJw4WRHwICzM0iDdhcrb8DznynhQ6OUJ5uBGTW5BYEUNTnjSOuLyr/A8Kk2QB7URHOReeQCp5Q==
X-Received: by 2002:ac8:5996:: with SMTP id e22mr9678548qte.373.1635850778036; 
 Tue, 02 Nov 2021 03:59:38 -0700 (PDT)
Received: from localhost.localdomain (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id z26sm11789510qko.13.2021.11.02.03.59.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 03:59:37 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 04/12] tests/qtest/libqos: add SDHCI commands
Date: Tue,  2 Nov 2021 06:59:26 -0400
Message-Id: <20211102105934.214596-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211102105934.214596-1-richard.henderson@linaro.org>
References: <20211102105934.214596-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::835;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x835.google.com
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
Message-Id: <20211008002628.1958285-5-wuhaotsh@google.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tests/qtest/libqos/sdhci-cmd.h |  70 ++++++++++++++++++++
 tests/qtest/libqos/sdhci-cmd.c | 116 +++++++++++++++++++++++++++++++++
 tests/qtest/libqos/meson.build |   1 +
 3 files changed, 187 insertions(+)
 create mode 100644 tests/qtest/libqos/sdhci-cmd.h
 create mode 100644 tests/qtest/libqos/sdhci-cmd.c

diff --git a/tests/qtest/libqos/sdhci-cmd.h b/tests/qtest/libqos/sdhci-cmd.h
new file mode 100644
index 0000000000..64763c5a2a
--- /dev/null
+++ b/tests/qtest/libqos/sdhci-cmd.h
@@ -0,0 +1,70 @@
+/*
+ * MMC Host Controller Commands
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
+#include "libqtest.h"
+
+/* more details at hw/sd/sdhci-internal.h */
+#define SDHC_BLKSIZE 0x04
+#define SDHC_BLKCNT 0x06
+#define SDHC_ARGUMENT 0x08
+#define SDHC_TRNMOD 0x0C
+#define SDHC_CMDREG 0x0E
+#define SDHC_BDATA 0x20
+#define SDHC_PRNSTS 0x24
+#define SDHC_BLKGAP 0x2A
+#define SDHC_CLKCON 0x2C
+#define SDHC_SWRST 0x2F
+#define SDHC_CAPAB 0x40
+#define SDHC_MAXCURR 0x48
+#define SDHC_HCVER 0xFE
+
+/* TRNSMOD Reg */
+#define SDHC_TRNS_BLK_CNT_EN 0x0002
+#define SDHC_TRNS_READ 0x0010
+#define SDHC_TRNS_WRITE 0x0000
+#define SDHC_TRNS_MULTI 0x0020
+
+/* CMD Reg */
+#define SDHC_CMD_DATA_PRESENT (1 << 5)
+#define SDHC_ALL_SEND_CID (2 << 8)
+#define SDHC_SEND_RELATIVE_ADDR (3 << 8)
+#define SDHC_SELECT_DESELECT_CARD (7 << 8)
+#define SDHC_SEND_CSD (9 << 8)
+#define SDHC_STOP_TRANSMISSION (12 << 8)
+#define SDHC_READ_MULTIPLE_BLOCK (18 << 8)
+#define SDHC_WRITE_MULTIPLE_BLOCK (25 << 8)
+#define SDHC_APP_CMD (55 << 8)
+
+/* SWRST Reg */
+#define SDHC_RESET_ALL 0x01
+
+/* CLKCTRL Reg */
+#define SDHC_CLOCK_INT_EN 0x0001
+#define SDHC_CLOCK_INT_STABLE 0x0002
+#define SDHC_CLOCK_SDCLK_EN (1 << 2)
+
+/* Set registers needed to send commands to SD */
+void sdhci_cmd_regs(QTestState *qts, uint64_t base_addr, uint16_t blksize,
+                    uint16_t blkcnt, uint32_t argument, uint16_t trnmod,
+                    uint16_t cmdreg);
+
+/* Read at most 1 block of SD using non-DMA  */
+ssize_t sdhci_read_cmd(QTestState *qts, uint64_t base_addr, char *msg,
+                       size_t count);
+
+/* Write at most 1 block of SD using non-DMA  */
+void sdhci_write_cmd(QTestState *qts, uint64_t base_addr, const char *msg,
+                     size_t count, size_t blksize);
diff --git a/tests/qtest/libqos/sdhci-cmd.c b/tests/qtest/libqos/sdhci-cmd.c
new file mode 100644
index 0000000000..2d9e518341
--- /dev/null
+++ b/tests/qtest/libqos/sdhci-cmd.c
@@ -0,0 +1,116 @@
+/*
+ * MMC Host Controller Commands
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
+#include "sdhci-cmd.h"
+#include "libqtest.h"
+
+static ssize_t read_fifo(QTestState *qts, uint64_t reg, char *msg, size_t count)
+{
+    uint32_t mask = 0xff;
+    size_t index = 0;
+    uint32_t msg_frag;
+    int size;
+    while (index < count) {
+        size = count - index;
+        if (size > 4) {
+            size = 4;
+        }
+        msg_frag = qtest_readl(qts, reg);
+        while (size > 0) {
+            msg[index] = msg_frag & mask;
+            if (msg[index++] == 0) {
+                return index;
+            }
+            msg_frag >>= 8;
+            --size;
+        }
+    }
+    return index;
+}
+
+static void write_fifo(QTestState *qts, uint64_t reg, const char *msg,
+                       size_t count)
+{
+    size_t index = 0;
+    uint32_t msg_frag;
+    int size;
+    int frag_i;
+    while (index < count) {
+        size = count - index;
+        if (size > 4) {
+            size = 4;
+        }
+        msg_frag = 0;
+        frag_i = 0;
+        while (frag_i < size) {
+            msg_frag |= ((uint32_t)msg[index++]) << (frag_i * 8);
+            ++frag_i;
+        }
+        qtest_writel(qts, reg, msg_frag);
+    }
+}
+
+static void fill_block(QTestState *qts, uint64_t reg, int count)
+{
+    while (--count >= 0) {
+        qtest_writel(qts, reg, 0);
+    }
+}
+
+void sdhci_cmd_regs(QTestState *qts, uint64_t base_addr, uint16_t blksize,
+                    uint16_t blkcnt, uint32_t argument, uint16_t trnmod,
+                    uint16_t cmdreg)
+{
+    qtest_writew(qts, base_addr + SDHC_BLKSIZE, blksize);
+    qtest_writew(qts, base_addr + SDHC_BLKCNT, blkcnt);
+    qtest_writel(qts, base_addr + SDHC_ARGUMENT, argument);
+    qtest_writew(qts, base_addr + SDHC_TRNMOD, trnmod);
+    qtest_writew(qts, base_addr + SDHC_CMDREG, cmdreg);
+}
+
+ssize_t sdhci_read_cmd(QTestState *qts, uint64_t base_addr, char *msg,
+                       size_t count)
+{
+    sdhci_cmd_regs(qts, base_addr, count, 1, 0,
+                   SDHC_TRNS_MULTI | SDHC_TRNS_READ | SDHC_TRNS_BLK_CNT_EN,
+                   SDHC_READ_MULTIPLE_BLOCK | SDHC_CMD_DATA_PRESENT);
+
+    /* read sd fifo_buffer */
+    ssize_t bytes_read = read_fifo(qts, base_addr + SDHC_BDATA, msg, count);
+
+    sdhci_cmd_regs(qts, base_addr, 0, 0, 0,
+                   SDHC_TRNS_MULTI | SDHC_TRNS_READ | SDHC_TRNS_BLK_CNT_EN,
+                   SDHC_STOP_TRANSMISSION);
+
+    return bytes_read;
+}
+
+void sdhci_write_cmd(QTestState *qts, uint64_t base_addr, const char *msg,
+                     size_t count, size_t blksize)
+{
+    sdhci_cmd_regs(qts, base_addr, blksize, 1, 0,
+                   SDHC_TRNS_MULTI | SDHC_TRNS_WRITE | SDHC_TRNS_BLK_CNT_EN,
+                   SDHC_WRITE_MULTIPLE_BLOCK | SDHC_CMD_DATA_PRESENT);
+
+    /* write to sd fifo_buffer */
+    write_fifo(qts, base_addr + SDHC_BDATA, msg, count);
+    fill_block(qts, base_addr + SDHC_BDATA, (blksize - count) / 4);
+
+    sdhci_cmd_regs(qts, base_addr, 0, 0, 0,
+                   SDHC_TRNS_MULTI | SDHC_TRNS_WRITE | SDHC_TRNS_BLK_CNT_EN,
+                   SDHC_STOP_TRANSMISSION);
+}
diff --git a/tests/qtest/libqos/meson.build b/tests/qtest/libqos/meson.build
index 1f5c8f1053..4af1f04787 100644
--- a/tests/qtest/libqos/meson.build
+++ b/tests/qtest/libqos/meson.build
@@ -5,6 +5,7 @@ libqos_srcs = files('../libqtest.c',
         'fw_cfg.c',
         'malloc.c',
         'libqos.c',
+        'sdhci-cmd.c',
 
         # spapr
         'malloc-spapr.c',
-- 
2.25.1


