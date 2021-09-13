Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E12A4098C5
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 18:17:26 +0200 (CEST)
Received: from localhost ([::1]:34938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPoe5-0006y6-4q
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 12:17:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mPoYj-0000kb-Ix
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 12:11:53 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:43775)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mPoYh-00083q-G7
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 12:11:53 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 n7-20020a05600c3b8700b002f8ca941d89so361477wms.2
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 09:11:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=KUKdUJ0N5EPE3TGaxGcZDbPbShFxk6EWZr/urNOByoM=;
 b=rCA9PptDsj6wyPSij58a7/BOf0N5EmfJ9ttee7xMrTrPLMJ4YZiOZ1JNR3WzTqzwq8
 8lJDVKOS2CFtCHT8DL7xzbWQ6OiYlUqo0q14qndy9ANHo8TEJRHls2CKMcmUMILlHzCY
 3cnmHATePWxnk6TpJqzSftFlZH8m0Ru/FgE2wW5D9ScJTpv8ZOnpoZ4tH2yI5u+2/yh+
 +b9avvt5LzrIF/sEYRYabLfxfAmZ8o8v7+mDlvR0aYox8IEcyQfiyBTvxXYtvJpgaIhE
 2Nx2fpus8OXDUHdfuEA4OiVMSW09IRSXLhVgD1CbsWVqdHDocnAfJ+JHIClan5eHQnO0
 DViQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KUKdUJ0N5EPE3TGaxGcZDbPbShFxk6EWZr/urNOByoM=;
 b=O8ptEIrAh3U5TFaV2KAf83rTrGL7qVIl93xpkVKqJWqZazcNbQt4HEWLRwSnwP1Nla
 ociV7VVjttSupd7GYivdK19Xwi9NWkhqOAcr7weR1PcioFpIZ2oI4qUD3GAlsYH4Lqin
 kKVipn/TEKoVUefr9x/txYMAsFMej9WswV16gJM+pxFAntBVWVsiK+aeXZb8+apucYVc
 Uc+0PA2/DeDzEzo+xHsq+MrjFWgFwI4ZsmI5Y/bBtwnMUZTHl7v3nZMIKfsmQ1tLqAZl
 f0hQtWWeFnwi+/3WmA43R4tmoxbqDKkTNrAymFnPFjpvmTBIcjr57SlM9wgiYRuaDfyJ
 pbRQ==
X-Gm-Message-State: AOAM532nJYA6itGHcoCzrwj+kyoQ1Jc5kfxJBb5Tyirvq7rt0tzrpJZJ
 6FZRQcmFUWao2qfwE2Qzo0vuPggGtYexDg==
X-Google-Smtp-Source: ABdhPJx5JxNeZwpqvG95qHyhKRcyeQ4MY3L6771Q0WH8co1/S5uJJuiXnRcgqF0uJtAaI7IBThb+7Q==
X-Received: by 2002:a1c:2943:: with SMTP id p64mr11949971wmp.107.1631549510154; 
 Mon, 13 Sep 2021 09:11:50 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id y1sm7629265wmq.43.2021.09.13.09.11.49
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Sep 2021 09:11:49 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 05/23] hw/char: cadence_uart: Ignore access when unclocked or
 in reset for uart_{read, write}()
Date: Mon, 13 Sep 2021 17:11:26 +0100
Message-Id: <20210913161144.12347-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210913161144.12347-1-peter.maydell@linaro.org>
References: <20210913161144.12347-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x336.google.com
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

Read or write to uart registers when unclocked or in reset should be
ignored. Add the check there, and as a result of this, the check in
uart_write_tx_fifo() is now unnecessary.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20210901124521.30599-6-bmeng.cn@gmail.com
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/char/cadence_uart.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/hw/char/cadence_uart.c b/hw/char/cadence_uart.c
index 8bcf2b718a0..5f5a4645ac0 100644
--- a/hw/char/cadence_uart.c
+++ b/hw/char/cadence_uart.c
@@ -335,11 +335,6 @@ static gboolean cadence_uart_xmit(void *do_not_use, GIOCondition cond,
 static void uart_write_tx_fifo(CadenceUARTState *s, const uint8_t *buf,
                                int size)
 {
-    /* ignore characters when unclocked or in reset */
-    if (!clock_is_enabled(s->refclk) || device_is_in_reset(DEVICE(s))) {
-        return;
-    }
-
     if ((s->r[R_CR] & UART_CR_TX_DIS) || !(s->r[R_CR] & UART_CR_TX_EN)) {
         return;
     }
@@ -416,6 +411,11 @@ static MemTxResult uart_write(void *opaque, hwaddr offset,
 {
     CadenceUARTState *s = opaque;
 
+    /* ignore access when unclocked or in reset */
+    if (!clock_is_enabled(s->refclk) || device_is_in_reset(DEVICE(s))) {
+        return MEMTX_ERROR;
+    }
+
     DB_PRINT(" offset:%x data:%08x\n", (unsigned)offset, (unsigned)value);
     offset >>= 2;
     if (offset >= CADENCE_UART_R_MAX) {
@@ -476,6 +476,11 @@ static MemTxResult uart_read(void *opaque, hwaddr offset,
     CadenceUARTState *s = opaque;
     uint32_t c = 0;
 
+    /* ignore access when unclocked or in reset */
+    if (!clock_is_enabled(s->refclk) || device_is_in_reset(DEVICE(s))) {
+        return MEMTX_ERROR;
+    }
+
     offset >>= 2;
     if (offset >= CADENCE_UART_R_MAX) {
         return MEMTX_DECODE_ERROR;
-- 
2.20.1


