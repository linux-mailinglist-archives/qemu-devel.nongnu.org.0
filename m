Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57AD03FD9D8
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 14:51:35 +0200 (CEST)
Received: from localhost ([::1]:49210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLPiI-0004os-DU
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 08:51:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mLPca-0003KB-PL; Wed, 01 Sep 2021 08:45:40 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b]:39701)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mLPcZ-0003aU-6d; Wed, 01 Sep 2021 08:45:40 -0400
Received: by mail-pf1-x42b.google.com with SMTP id e16so1952963pfc.6;
 Wed, 01 Sep 2021 05:45:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ev+aq0JxPAo6o7UOcP7jbXTgregVlkRbo8hoXTI7T1k=;
 b=baOT5eMEWdfO8bzuyV5Cu8ZmkQoATFMAV9NQU7vHMifn/T8HYLmyOcNsoy0jUsrCjT
 oa1meNceuZrW8mK4j7BszhLFiNWGVHDpoH5bx1Od5QiOJKxH3iW000isFBz63qOLolro
 Nwf/LatDNra7uPs2s5JgOzaxD4q9NU+0d2NJofAcDf/tvWC9ObAeSExwoG6JLS5niVRd
 rdszH87qjkAl+Cg2V7LDR7O1qGk52pKpieA+vwuuq8GhcW3gN7GEL0M/kdqE1XY5Zijj
 GUCyDLgZNMUujo7k4jHtbM/3PlFxWzQPebSbWy6TZhMCWGbjqykJHlsqA9jivw8zZ3tg
 WigA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ev+aq0JxPAo6o7UOcP7jbXTgregVlkRbo8hoXTI7T1k=;
 b=i0Uqe8QzCk6xsqW5pn4m4nwOdcTSbQ/HJ1uK8Z0b1ui6sjhmd1Bk+9G9lQfpshvjDm
 g7Lzckbf5uMbGlUVETvtDDO2LhZae49+9ntE5DjwCBjj9zNSIvOLBC1jE5RFVvvsZ+A+
 VTgBP11Fy4QSZRMseraBYz5f73KB+JpfICW3Ps3Bzxj3MQLBn28NjwEKq3xfyWISuX3g
 qyyj3IF6vk4aSf6E++bSB0GtLimjb7/YwS/5smlSzceCSR4sZF7lsGLsgP2nwrgQWySa
 NEc4uFFxQKN9H3Hk9bnHDvY0ZTWBm3/a+3XkOi8XiBE6Pynd8KUgnfNtpwDO92DFurj1
 /vsQ==
X-Gm-Message-State: AOAM53287boCqZTMbt603HchuwJd9EjO6coCKISrW6Xc2uGLuXVcVR5i
 d1S9ly2fcMJbzejZ41AHYpQurQntq4zUaQ==
X-Google-Smtp-Source: ABdhPJwGBh7YtMPkFNFC69GuhDZJ1Omi0DhfsuvxoHXpA1tIcAykgrxHjC6aQxCk+cJYVEyCoXgezg==
X-Received: by 2002:a63:fd12:: with SMTP id d18mr32166158pgh.129.1630500337499; 
 Wed, 01 Sep 2021 05:45:37 -0700 (PDT)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id d22sm20917134pfq.158.2021.09.01.05.45.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Sep 2021 05:45:37 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Damien Hedde <damien.hedde@greensocs.com>,
 "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v3 3/6] hw/char: cadence_uart: Move clock/reset check to
 uart_can_receive()
Date: Wed,  1 Sep 2021 20:45:18 +0800
Message-Id: <20210901124521.30599-4-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210901124521.30599-1-bmeng.cn@gmail.com>
References: <20210901124521.30599-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pf1-x42b.google.com
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

Currently the clock/reset check is done in uart_receive(), but we
can move the check to uart_can_receive() which is earlier.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>

---

(no changes since v2)

Changes in v2:
- avoid declaring variables mid-scope

 hw/char/cadence_uart.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/hw/char/cadence_uart.c b/hw/char/cadence_uart.c
index 154be34992..fff8be3619 100644
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
2.25.1


