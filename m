Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B3EF4098D1
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 18:21:05 +0200 (CEST)
Received: from localhost ([::1]:41820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPohc-0003Ud-2u
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 12:21:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mPoYi-0000gx-GS
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 12:11:52 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:42682)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mPoYg-00082Z-9T
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 12:11:52 -0400
Received: by mail-wr1-x433.google.com with SMTP id q11so15531797wrr.9
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 09:11:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=YmREMpGPfp1G5BBnMvJXaL2XEXTZtFxef2p5lhooP3s=;
 b=HkW0NiF1qFqllRLMTR+h1F7HNIepj3UKAuqt2fi55jPGEt2QLDzBr8oS8JfJfsVAO1
 vYIaWT2hrmd0vm58jQGE9LUr6N1aVZgNUGocUunbhtpPAcDl5PWF3YFPOLgcmp68c1K4
 NfLbAWLCQmyKEsiXJ0kg/dwBk7c4v7S0KvTE753PCT7OGLHPC8VK4ru3nSLeYSmGfGy1
 bzZr5vwi8bH8ZxwzH4K9M7EQV8TwhC/IKFkHc/lg93QJaZ/3/LQpMp/BZvZ/zf0GwPv4
 9s1nPhEK8KWp1UqbRf7fu/TZEkfuCyh8T3gILkqhMWyCL4zhftrBH1Z8ZW2Wdau1oCaU
 vgOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YmREMpGPfp1G5BBnMvJXaL2XEXTZtFxef2p5lhooP3s=;
 b=NqcMYOLORgwWZ8mvzUO2PVBNc6pV2ttc2TACOAwIz3LNqVJzGzc+dakSTzIiA1sSVh
 gxsrhtHegDK2JsRyTYaaN/a618B86CkcFGkJHeem23nC0a5FILn7hunFBJHyQ6OYPUEn
 W/Wqs8G+m7TupSDZ4hWx9uCJrnAVNOTlFH8cekT56XZ0/nKfAiEfBL6dokyXtSLDlWg5
 +f1RG+cg7TBo/87R1CAs5ZHiRc4ZnyJJu5QAbaO5SN3OyMkDzy+VLvPCp1SpXc/u90Iy
 3/BciducpJKTc3I+Q0f2qn4oXfTHo2iINNdnbc95a+Kd4ohNg3FJzykoGBiCKOz32HYZ
 5ReQ==
X-Gm-Message-State: AOAM533siC7Y2TRPev+YQn6XhnaflMeOhOJHXFhROtFcGhTStVkAx4Gw
 YUiM2tLQ1oq0nmYDK8j6TReh18WRHRlphA==
X-Google-Smtp-Source: ABdhPJw5dJc8Q4Z1trl9RZh5sbRwcxupQ7u9XNTkViuRbyTKJwTAy2klrGVCuycVLR9pe21Hip+Tyg==
X-Received: by 2002:a5d:404b:: with SMTP id w11mr13595704wrp.437.1631549508893; 
 Mon, 13 Sep 2021 09:11:48 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id y1sm7629265wmq.43.2021.09.13.09.11.48
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Sep 2021 09:11:48 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 03/23] hw/char: cadence_uart: Move clock/reset check to
 uart_can_receive()
Date: Mon, 13 Sep 2021 17:11:24 +0100
Message-Id: <20210913161144.12347-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210913161144.12347-1-peter.maydell@linaro.org>
References: <20210913161144.12347-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x433.google.com
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

Currently the clock/reset check is done in uart_receive(), but we
can move the check to uart_can_receive() which is earlier.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20210901124521.30599-4-bmeng.cn@gmail.com
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/char/cadence_uart.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/hw/char/cadence_uart.c b/hw/char/cadence_uart.c
index 154be34992b..fff8be36191 100644
--- a/hw/char/cadence_uart.c
+++ b/hw/char/cadence_uart.c
@@ -235,8 +235,16 @@ static void uart_parameters_setup(CadenceUARTState *s)
 static int uart_can_receive(void *opaque)
 {
     CadenceUARTState *s = opaque;
-    int ret = MAX(CADENCE_UART_RX_FIFO_SIZE, CADENCE_UART_TX_FIFO_SIZE);
-    uint32_t ch_mode = s->r[R_MR] & UART_MR_CHMODE;
+    int ret;
+    uint32_t ch_mode;
+
+    /* ignore characters when unclocked or in reset */
+    if (!clock_is_enabled(s->refclk) || device_is_in_reset(DEVICE(s))) {
+        return 0;
+    }
+
+    ret = MAX(CADENCE_UART_RX_FIFO_SIZE, CADENCE_UART_TX_FIFO_SIZE);
+    ch_mode = s->r[R_MR] & UART_MR_CHMODE;
 
     if (ch_mode == NORMAL_MODE || ch_mode == ECHO_MODE) {
         ret = MIN(ret, CADENCE_UART_RX_FIFO_SIZE - s->rx_count);
@@ -358,11 +366,6 @@ static void uart_receive(void *opaque, const uint8_t *buf, int size)
     CadenceUARTState *s = opaque;
     uint32_t ch_mode = s->r[R_MR] & UART_MR_CHMODE;
 
-    /* ignore characters when unclocked or in reset */
-    if (!clock_is_enabled(s->refclk) || device_is_in_reset(DEVICE(s))) {
-        return;
-    }
-
     if (ch_mode == NORMAL_MODE || ch_mode == ECHO_MODE) {
         uart_write_rx_fifo(opaque, buf, size);
     }
-- 
2.20.1


