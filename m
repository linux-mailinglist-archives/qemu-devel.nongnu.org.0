Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E364E3FD9D3
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 14:48:18 +0200 (CEST)
Received: from localhost ([::1]:38150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLPf7-0005mi-OF
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 08:48:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mLPcd-0003Rh-3G; Wed, 01 Sep 2021 08:45:43 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:33587)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mLPcb-0003b2-Ix; Wed, 01 Sep 2021 08:45:42 -0400
Received: by mail-pf1-x432.google.com with SMTP id u6so1999543pfi.0;
 Wed, 01 Sep 2021 05:45:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=L07n8zX3R8GaFuJBCKEivKi6SKW1wli53ep7Q/Pq37k=;
 b=pwnSenhhI4iiB7KGYPoIfpziezgnieKsDSACMP2F7Qu5t25C6ERg3C4k6hTGOJySyf
 E2YQRlNo5ZpphPZ/L06EuAZGtfNMaqpfi8WiMCsTGHnWJEvSqjB1bF8diwPkux0afbCe
 xGLhaMD8b1KLB2dWqOX09oz+3MC4rsfLkofPoKAqQ7bMJf/g+h6SdhHaWdbdOUTccxPT
 4t34CApThERdRcY2cM5crwOXTNBW9Yz/X0I/I2EozeNk+CONwzuc+D45saGpX4t9n4GO
 roeA/fDFUTG+I+18Ud0OXAYG93edIW5603zwdlJ1UpqgRZsHmXT+BtW0/zfGxlDMCLOA
 5MKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=L07n8zX3R8GaFuJBCKEivKi6SKW1wli53ep7Q/Pq37k=;
 b=qsfu3wTe5SFN1C/HC+KwGhQSJYDdCEgfrwzU/NctpNzNPhDEWmc3LErVLSaaLZBWmt
 FJ1OhjvPQunVH4A0TzXUFVOWZ1UBp0lx9LOB363tgHvzuWmwBQ4nbeUfNKdhIFhZhBlo
 6j5VbquFr3OcPbBtmXpaCeIH+scUHXe6R9Sv95oeFL8Vw6i8r5li43Riq4Rgrm6DM4uP
 ZT12L0O1plaYHmQO6hU9YPZJUk3fIDMEhUSxlNse6HTKIOt8SjFwniYZjhULesXU0ANw
 gS3pBVuAou6+WEj5sD2xfwRmi9fHx5bJm+TnZ9nTMxy7IOHTOIgu7jM25Gd7AHH2l/PE
 V7Xg==
X-Gm-Message-State: AOAM531EX8hz1HVh+CqUutjThj1Ki8JNroDffauklWhKNhAAoZs9U/3l
 u8W9gPEqlUQPI45hPg5aHB2FjnDC5JJ9Rw==
X-Google-Smtp-Source: ABdhPJxqq99grwyCFRq/zmHpXkCvhTNre1lZ+kWFxY531yYu3iCI4y4NnZKxkfToFV1jNkfYSA3Jgg==
X-Received: by 2002:a62:ea06:0:b0:3e1:62a6:95b8 with SMTP id
 t6-20020a62ea06000000b003e162a695b8mr34188875pfh.70.1630500340059; 
 Wed, 01 Sep 2021 05:45:40 -0700 (PDT)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id d22sm20917134pfq.158.2021.09.01.05.45.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Sep 2021 05:45:39 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Damien Hedde <damien.hedde@greensocs.com>,
 "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v3 4/6] hw/char: cadence_uart: Convert to memop_with_attrs()
 ops
Date: Wed,  1 Sep 2021 20:45:19 +0800
Message-Id: <20210901124521.30599-5-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210901124521.30599-1-bmeng.cn@gmail.com>
References: <20210901124521.30599-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pf1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This converts uart_read() and uart_write() to memop_with_attrs() ops.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>

---

(no changes since v2)

Changes in v2:
- new patch: hw/char: cadence_uart: Convert to memop_with_attrs() ops

 hw/char/cadence_uart.c | 26 +++++++++++++++-----------
 1 file changed, 15 insertions(+), 11 deletions(-)

diff --git a/hw/char/cadence_uart.c b/hw/char/cadence_uart.c
index fff8be3619..8bcf2b718a 100644
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
2.25.1


