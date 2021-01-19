Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23ECD2FB684
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 14:53:25 +0100 (CET)
Received: from localhost ([::1]:34766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1rRk-0007Bl-4V
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 08:53:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l1rFY-0003EH-AG; Tue, 19 Jan 2021 08:40:52 -0500
Received: from mail-io1-xd2a.google.com ([2607:f8b0:4864:20::d2a]:40581)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l1rFW-0003XG-MG; Tue, 19 Jan 2021 08:40:48 -0500
Received: by mail-io1-xd2a.google.com with SMTP id n2so22380028iom.7;
 Tue, 19 Jan 2021 05:40:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=81q2vH6wgdVZqHaFuZsg0z4KTvL3AEbyHNnby4vouL8=;
 b=OB1lhn+ERAtxV/VC4+8o8f0IKyRI6GVxoqscBkkTCQKqzo66KHVZre/TUsb4FfdHzP
 3Hpc8WBy1KN3iGi9vkFf0eWZ2mo+o+bPSxTdKwnqyfbqh9dOG53T2mD/68TFIK3epnpd
 Mpaq6f2jDlFTwjmQou509507Aofvs9Be2H15X8c+RNdAHNDZdcarcbKiS/7a3oZ3IPvL
 a+/aypUcbfjJTQRk1vjn3Rhng5IUeAotNSaJ7FJ5IaJJVLUSWj9ICaSnafRRCVNfXkCg
 EV68wXbSb1lhNpgyR9Q3FHuDCTmOVorqLPaUX/3C3CWVefllg1unesQ4QbGvLqp3o3SG
 O5Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=81q2vH6wgdVZqHaFuZsg0z4KTvL3AEbyHNnby4vouL8=;
 b=JL+jZV/PeWr9WCbAa6+VUq5p1pv2jN4nsN8/ufepRntcKbJJtqdwMFKKf2TRtbfKK0
 GEd8DXxdRI6xrR4J0MqRC6LShyZcLkIcd8GukXmtWvfniGYuiWXIrWZExOwd6LxsVJ7x
 mD78jlM5uciU3aLBhqCqB7Er7CKtUgJo7P68+J2KdzguGUpGoGIbawXM59EUiPF2eQ5x
 FI2Be4b6W9cBRfxwvv1XNtVjvy+kpLK5fUG1Hjy3QJO+gV8T6M1ygtnQPCSHK67RQlTE
 kimfNLlUpzeUILiz10G5PKzQj+x7YDGmJrilTLSWsCvymRMKtJ9yZEKKxRwztNj9jZrY
 4/uA==
X-Gm-Message-State: AOAM531OE5FvpNUBocAunkCJlcL0gxToxUXUA6ww2qSkFwbkPDr5NHwQ
 Ql9NPlkH0TVUQTBNNdGsBCDLusYVPAE=
X-Google-Smtp-Source: ABdhPJxrAaBLJJc65IJBEfjDc2RdNTTm9lTDHjllijzOHkD6BWbTvUyL51NT96Zlb6Q3tPr16/di7w==
X-Received: by 2002:a02:3213:: with SMTP id j19mr3460480jaa.79.1611063645447; 
 Tue, 19 Jan 2021 05:40:45 -0800 (PST)
Received: from pek-vx-bsp2.wrs.com (unknown-124-94.windriver.com.
 [147.11.124.94])
 by smtp.gmail.com with ESMTPSA id s6sm11089546ild.45.2021.01.19.05.40.42
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 19 Jan 2021 05:40:44 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v8 10/10] hw/ssi: imx_spi: Correct tx and rx fifo endianness
Date: Tue, 19 Jan 2021 21:39:06 +0800
Message-Id: <1611063546-20278-11-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1611063546-20278-1-git-send-email-bmeng.cn@gmail.com>
References: <1611063546-20278-1-git-send-email-bmeng.cn@gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2a;
 envelope-from=bmeng.cn@gmail.com; helo=mail-io1-xd2a.google.com
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
Cc: Bin Meng <bin.meng@windriver.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
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

---

(no changes since v3)

Changes in v3:
- Simplify the tx fifo endianness handling

 hw/ssi/imx_spi.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/hw/ssi/imx_spi.c b/hw/ssi/imx_spi.c
index de0c481..dee7368 100644
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
2.7.4


