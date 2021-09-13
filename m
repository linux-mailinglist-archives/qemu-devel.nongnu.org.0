Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6D4B4098ED
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 18:23:49 +0200 (CEST)
Received: from localhost ([::1]:50018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPokG-0000gQ-QV
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 12:23:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mPoYi-0000i1-Sq
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 12:11:52 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:43778)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mPoYg-000838-Ub
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 12:11:52 -0400
Received: by mail-wr1-x42c.google.com with SMTP id b6so15529454wrh.10
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 09:11:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=7onW0Bfb60JGQhCGTb7ec53pyNPLVFuz/cIRlQftZzg=;
 b=bonEPv5UO+lQi3NJIolyLoR854mMy6E27dWrbkH7JZSubaWCVxy/mf5LTE0JQByWR8
 eBq385KBbd4jRv3MNa/+Zvg63iVeX9ilmPSZr58XFnhTljGwDVutoK8cmatN5HlHCyvi
 E6bpULHW+jL6hCDZAOjKkjwBQITc0Ugft9A+snqfzIL3Qunznn9/GQ/OFduhwUVBYZ69
 S76QIObCNAEGNiApM+e0kEzh5HeI9rrUU0rKBlOpFG1E6HKdFe/qqW9iL4ZI56+YcfP7
 yfb6VsUE0LG0Tv0TgHzAw7TmmXJXGCHF94/iR5XiYFTVy6xNh5spe0SGZWI70bZ+tTI9
 ac2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7onW0Bfb60JGQhCGTb7ec53pyNPLVFuz/cIRlQftZzg=;
 b=zgMmJN5QZyr8pGjK7nYAhRaJLiH3IxrCpe/IyWjaEEFoh2JYSy9Bu6GjCuw51CNHEI
 Lv3DaYywA8wiCQlwyKKsKmnN7VQ7uxhj3KqOIgsYrRGj+kX8nSVN/I2k5x4PytkzZ8sT
 o+Vfy/9ED8mxoVbHZRVNiI0sEwJnokais1TqFKoXAsvqtQzzOSur9cBFtvcfj5++YoCB
 O88XbEZkBsS+aK/JoS7h2xcEMHRxBbZiRSMC4uCP2wYQTBJplv1iEHJjXQXHjJA78Uat
 /fm2tWU4Fxptr4Sz4oOxtw9WjsAELOprq3ozUnJvvbf+XRIcI+Y/tWc0MFc/5At1ce8T
 JI8g==
X-Gm-Message-State: AOAM533gmoQZyW/imIaQBZZB+aPozq3M6MjrW5fsEMNHZreIGXbjuU22
 APWhoHo8UHOy+jWwEq1vFnMzVXTnroyN+g==
X-Google-Smtp-Source: ABdhPJxH9Dg6dtR85ZWGAiz1jBljyY2gx+VKMj0ygyFO7vyQbGOF4k6KKmVJ3aLcDZ7uW8MVAnzVHw==
X-Received: by 2002:a5d:4a46:: with SMTP id v6mr3042864wrs.262.1631549509515; 
 Mon, 13 Sep 2021 09:11:49 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id y1sm7629265wmq.43.2021.09.13.09.11.48
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Sep 2021 09:11:49 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 04/23] hw/char: cadence_uart: Convert to memop_with_attrs() ops
Date: Mon, 13 Sep 2021 17:11:25 +0100
Message-Id: <20210913161144.12347-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210913161144.12347-1-peter.maydell@linaro.org>
References: <20210913161144.12347-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42c.google.com
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

From: Bin Meng <bmeng.cn@gmail.com>

This converts uart_read() and uart_write() to memop_with_attrs() ops.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20210901124521.30599-5-bmeng.cn@gmail.com
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/char/cadence_uart.c | 26 +++++++++++++++-----------
 1 file changed, 15 insertions(+), 11 deletions(-)

diff --git a/hw/char/cadence_uart.c b/hw/char/cadence_uart.c
index fff8be36191..8bcf2b718a0 100644
--- a/hw/char/cadence_uart.c
+++ b/hw/char/cadence_uart.c
@@ -411,15 +411,15 @@ static void uart_read_rx_fifo(CadenceUARTState *s, uint32_t *c)
     uart_update_status(s);
 }
 
-static void uart_write(void *opaque, hwaddr offset,
-                          uint64_t value, unsigned size)
+static MemTxResult uart_write(void *opaque, hwaddr offset,
+                              uint64_t value, unsigned size, MemTxAttrs attrs)
 {
     CadenceUARTState *s = opaque;
 
     DB_PRINT(" offset:%x data:%08x\n", (unsigned)offset, (unsigned)value);
     offset >>= 2;
     if (offset >= CADENCE_UART_R_MAX) {
-        return;
+        return MEMTX_DECODE_ERROR;
     }
     switch (offset) {
     case R_IER: /* ier (wts imr) */
@@ -466,30 +466,34 @@ static void uart_write(void *opaque, hwaddr offset,
         break;
     }
     uart_update_status(s);
+
+    return MEMTX_OK;
 }
 
-static uint64_t uart_read(void *opaque, hwaddr offset,
-        unsigned size)
+static MemTxResult uart_read(void *opaque, hwaddr offset,
+                             uint64_t *value, unsigned size, MemTxAttrs attrs)
 {
     CadenceUARTState *s = opaque;
     uint32_t c = 0;
 
     offset >>= 2;
     if (offset >= CADENCE_UART_R_MAX) {
-        c = 0;
-    } else if (offset == R_TX_RX) {
+        return MEMTX_DECODE_ERROR;
+    }
+    if (offset == R_TX_RX) {
         uart_read_rx_fifo(s, &c);
     } else {
-       c = s->r[offset];
+        c = s->r[offset];
     }
 
     DB_PRINT(" offset:%x data:%08x\n", (unsigned)(offset << 2), (unsigned)c);
-    return c;
+    *value = c;
+    return MEMTX_OK;
 }
 
 static const MemoryRegionOps uart_ops = {
-    .read = uart_read,
-    .write = uart_write,
+    .read_with_attrs = uart_read,
+    .write_with_attrs = uart_write,
     .endianness = DEVICE_NATIVE_ENDIAN,
 };
 
-- 
2.20.1


