Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C7F52EFFA9
	for <lists+qemu-devel@lfdr.de>; Sat,  9 Jan 2021 13:47:14 +0100 (CET)
Received: from localhost ([::1]:35820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyDeD-0002NJ-GH
	for lists+qemu-devel@lfdr.de; Sat, 09 Jan 2021 07:47:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kyDTv-0001W9-LX; Sat, 09 Jan 2021 07:36:35 -0500
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:36903)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kyDTu-0001mL-03; Sat, 09 Jan 2021 07:36:35 -0500
Received: by mail-pf1-x42a.google.com with SMTP id 11so8018199pfu.4;
 Sat, 09 Jan 2021 04:36:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mG1MTXK9dNCfs7Rn1MWcFj8sMscSVuyy26GcmnPOYdM=;
 b=pcYzFWX0Y0ahryzO4n3aYv78WToGnijRSHa/OoRZPdYNXUL1VhvMQXJvTCphAIo6E4
 IqBXKb/89RvHo3zlXgrdbqOkn16bSwX0yopprU/52ph/rnwyAQm/BMY1kYjpvyXpj+8Z
 qcBxSNUn9460CiE0VEzGgHkDgWjqOGKu/4EUkUB0AWRaLyC9vmnTiWReCWl6SoBb4PB6
 JZfNb6mI+DKuRUhUdUTN4meXS0+IJ7xHx8ZYQtMqzGaAqwWAi6fhaT7HDb8Xc0FXKyNh
 t8fsjJzOqjNVW0w6YmQbw2Wh15xd03yzW7fvmtYP3TJKbJZ8x344hh04yuyQVqU8yp3T
 k5KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mG1MTXK9dNCfs7Rn1MWcFj8sMscSVuyy26GcmnPOYdM=;
 b=jsjoHXgSaZEsKRgLGASAMYixeJcISiqthjDUPS9NiMSfWiW/OaKudHrnQHIXvouaCQ
 axTPRqhy5o5AzDi5Hswgj7EFpE78UaZmNm5vxz+she2CTLpCI8KBMn5S2v+lehkwM14y
 CjaseVQIg6v/tsYtiZ7Z9ZSzWgIJNc5ySS9fE8wdRemvexgzoJT0Fng7U5XqL3DWKpht
 BKYbcQLFdr3anmbPysVtRfngYpRwu1JwGvX+275dcQrd5a4V9oF58u235aJ89dVbBTDG
 cLXpdy9ub+GJhYJfmxn/6EwRrLV3DYMRaTuKXOUn2hMpG7NP2/oq8NGW16eOFMCBctQ0
 We+g==
X-Gm-Message-State: AOAM531AszTHEmJpyBCA8y/TSrDsc6XpVdJwgf9Cyi4denkOtpn/O/M8
 US5UgVZ9aoAVHJ00E5LBxwra5a790Ho=
X-Google-Smtp-Source: ABdhPJyttpSoLeyDjOMY0mGkKPkD6qFK0H+opSslOdu+Wuk3ZZaxf4oNcu//OPxxQgkal6Ju2z0ouA==
X-Received: by 2002:a63:1d59:: with SMTP id d25mr11322861pgm.259.1610195792482; 
 Sat, 09 Jan 2021 04:36:32 -0800 (PST)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id b10sm12840748pgh.15.2021.01.09.04.36.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Jan 2021 04:36:31 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH v3 6/6] hw/ssi: imx_spi: Correct tx and rx fifo endianness
Date: Sat,  9 Jan 2021 20:35:45 +0800
Message-Id: <20210109123545.12001-7-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210109123545.12001-1-bmeng.cn@gmail.com>
References: <20210109123545.12001-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pf1-x42a.google.com
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
Cc: Bin Meng <bin.meng@windriver.com>
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

Changes in v3:
- Simplify the tx fifo endianness handling

 hw/ssi/imx_spi.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/hw/ssi/imx_spi.c b/hw/ssi/imx_spi.c
index 68a32b689e..a81242e860 100644
--- a/hw/ssi/imx_spi.c
+++ b/hw/ssi/imx_spi.c
@@ -171,7 +171,6 @@ static void imx_spi_flush_txfifo(IMXSPIState *s)
 
     while (!fifo32_is_empty(&s->tx_fifo)) {
         int tx_burst = 0;
-        int index = 0;
 
         if (s->burst_length <= 0) {
             s->burst_length = imx_spi_burst_length(s);
@@ -192,7 +191,7 @@ static void imx_spi_flush_txfifo(IMXSPIState *s)
         rx = 0;
 
         while (tx_burst > 0) {
-            uint8_t byte = tx & 0xff;
+            uint8_t byte = tx >> (tx_burst - 8);
 
             DPRINTF("writing 0x%02x\n", (uint32_t)byte);
 
@@ -201,13 +200,11 @@ static void imx_spi_flush_txfifo(IMXSPIState *s)
 
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
2.25.1


