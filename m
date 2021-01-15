Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 467BB2F7FDC
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 16:41:06 +0100 (CET)
Received: from localhost ([::1]:52286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0RDl-0001hp-CA
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 10:41:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l0R4i-00069X-Hg; Fri, 15 Jan 2021 10:31:44 -0500
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:46131)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l0R4g-0001NU-VY; Fri, 15 Jan 2021 10:31:44 -0500
Received: by mail-ej1-x630.google.com with SMTP id t16so13793852ejf.13;
 Fri, 15 Jan 2021 07:31:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aEe4vTMLP9auxSgIg50YIr5kL7dVLhmpX4y+OZIHpwk=;
 b=ASpgClg+JRP/ky8FIiFta/JZigSt9d0hu6L3+YKSl+b6Psm5H6Nz66j9blO/MsG5Uh
 TigbpTMoukHoTNLLmqBtnefgiOpNl12IXY+pkIuAfTdFNgAPjLd27taOHQS9FSEt2FOA
 KwRO7jJghfcqIa0DfRUUVHTpCD02SIx3M3Qt4uZRA2gtBh1ru6lKkkFmBhYuDVY28ea8
 oDzaTG4wvpuhKKcnjze5bEBvaMhBkTgAOsTv/PslY2Qqlt1nY7epEUnKObPKkXt3eFkG
 rB18BjOeFcdh93Yo7/avKPEIe6KWGvbLVa9VqPcFyn22urzdvrlJ0ACjO2DM6sWdrvuh
 B5VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=aEe4vTMLP9auxSgIg50YIr5kL7dVLhmpX4y+OZIHpwk=;
 b=qYpvyWlJ3+F+9VTd4oCqNupIYi6ThkbCGPXnVSAbci1mslmG5/I+UVlFoQ5g2EZo2X
 PVQmJbkYQQBxFMaBeIJoF4obmkkYWYiF3y2jg4M/NdUfwb9XEENWiYDEX9sDoL1BXmrP
 xrww6/mmsVxFgPUcIA1nxSndv2sR0SLAyIgC/KXAWIpq5RAoc0KAPJpFAGdomIAknBoE
 OGTp5z+15f1FV5sM35rQKsmEmtt2VwTkOC4Wx68GPfoPPnNUPJEMaVZ4X6Ug8AZu2+f5
 L6pdCxH+k0+vd2F8eJglqYVcqzzSlU9BfQ5ucrJ9TNigRdGp70FPiRugOwEaBSNJbSsq
 lLYg==
X-Gm-Message-State: AOAM532NWRyS60VvrONbQM9SdIqWrvu9vOFbu0wN1p+Jec0FTAQ1IdtA
 ZROw+bBs3f5dU/T4xmBmOaqQEzanUeU=
X-Google-Smtp-Source: ABdhPJzv3vkO37wk3vhcrLrdJw6BuyJyGc4fTtVXoe0XV4v2Ls8bhk+3nXEvkzgq44c31BnOJPRSbg==
X-Received: by 2002:a17:906:fa85:: with SMTP id
 lt5mr9330813ejb.344.1610724700940; 
 Fri, 15 Jan 2021 07:31:40 -0800 (PST)
Received: from x1w.redhat.com (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id oq7sm3872991ejb.63.2021.01.15.07.31.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 07:31:40 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 9/9] hw/ssi: imx_spi: Correct tx and rx fifo endianness
Date: Fri, 15 Jan 2021 16:30:49 +0100
Message-Id: <20210115153049.3353008-10-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210115153049.3353008-1-f4bug@amsat.org>
References: <20210115153049.3353008-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x630.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>, Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-arm@nongnu.org,
 Peter Chubb <peter.chubb@nicta.com.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bin.meng@windriver.com>

The endianness of data exchange between tx and rx fifo is incorrect.
Earlier bytes are supposed to show up on MSB and later bytes on LSB,
ie: in big endian. The manual does not explicitly say this, but the
U-Boot and Linux driver codes have a swap on the data transferred
to tx fifo and from rx fifo.

With this change, U-Boot read from / write to SPI flash tests pass.

  => sf test 1ff000 1000
  SPI flash test:
  0 erase: 0 ticks, 4096000 KiB/s 32768.000 Mbps
  1 check: 3 ticks, 1333 KiB/s 10.664 Mbps
  2 write: 235 ticks, 17 KiB/s 0.136 Mbps
  3 read: 2 ticks, 2000 KiB/s 16.000 Mbps
  Test passed
  0 erase: 0 ticks, 4096000 KiB/s 32768.000 Mbps
  1 check: 3 ticks, 1333 KiB/s 10.664 Mbps
  2 write: 235 ticks, 17 KiB/s 0.136 Mbps
  3 read: 2 ticks, 2000 KiB/s 16.000 Mbps

Fixes: c906a3a01582 ("i.MX: Add the Freescale SPI Controller")
Signed-off-by: Bin Meng <bin.meng@windriver.com>
Message-Id: <20210112145526.31095-7-bmeng.cn@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/ssi/imx_spi.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/hw/ssi/imx_spi.c b/hw/ssi/imx_spi.c
index 707defb8b3f..081b7e464ff 100644
--- a/hw/ssi/imx_spi.c
+++ b/hw/ssi/imx_spi.c
@@ -175,7 +175,6 @@ static void imx_spi_flush_txfifo(IMXSPIState *s)
 
     while (!fifo32_is_empty(&s->tx_fifo)) {
         int tx_burst = 0;
-        int index = 0;
 
         if (s->burst_length <= 0) {
             s->burst_length = imx_spi_burst_length(s);
@@ -196,7 +195,7 @@ static void imx_spi_flush_txfifo(IMXSPIState *s)
         rx = 0;
 
         while (tx_burst > 0) {
-            uint8_t byte = tx & 0xff;
+            uint8_t byte = tx >> (tx_burst - 8);
 
             DPRINTF("writing 0x%02x\n", (uint32_t)byte);
 
@@ -205,13 +204,11 @@ static void imx_spi_flush_txfifo(IMXSPIState *s)
 
             DPRINTF("0x%02x read\n", (uint32_t)byte);
 
-            tx = tx >> 8;
-            rx |= (byte << (index * 8));
+            rx = (rx << 8) | byte;
 
             /* Remove 8 bits from the actual burst */
             tx_burst -= 8;
             s->burst_length -= 8;
-            index++;
         }
 
         DPRINTF("data rx:0x%08x\n", rx);
-- 
2.26.2


