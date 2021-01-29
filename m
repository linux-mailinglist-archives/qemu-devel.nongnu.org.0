Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1994430895F
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 14:37:41 +0100 (CET)
Received: from localhost ([::1]:51982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5Ty0-0006kB-3I
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 08:37:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l5Tlq-0004zC-L0; Fri, 29 Jan 2021 08:25:09 -0500
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:39118)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l5Tlk-0008KT-JL; Fri, 29 Jan 2021 08:25:06 -0500
Received: by mail-pj1-x102c.google.com with SMTP id d2so350031pjs.4;
 Fri, 29 Jan 2021 05:24:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=m0BdiYb2aO99L/y+s2LkY0AUaYKp2VRWJME7aRkjESk=;
 b=Ye19j0Hcekw+MArdFXSXZqQ0YaD/Pu6ySTpe1zmcgYsZs949nH3W/fQHgIc8uUEgdI
 zXk7SJeUn+re+yGURTkWdJTM7OirSioegfaWipkgraR/NpW5fbXtNmr/vSzLzRDYTWxN
 +po9w8ZLkwVvM4ZDpaDLWKEFVE2OXh1wHx3UPEzXRY0SToc5GAykajZn75HzXNLAlybu
 836fQ4bON+dpsF6c3w9y34ZYjGqgJHLk3LqJo83RBuXjffKtYw1UhdxtaKDAUTaLD0dN
 QZx41Hmy5mv+/VSBnYXAScbdHuMoAHVjaKds6VakFhPCHwPtAtrFy/R1iJtWpjEhiDzo
 JplQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=m0BdiYb2aO99L/y+s2LkY0AUaYKp2VRWJME7aRkjESk=;
 b=SmSvChea63SizAq34q2Z8db3MYwaYAyRXFpOxXhwWcG3m2YNHyWIXFSuuYG2uzgFtB
 Nk+Tuz+/Hy4+2ubk456rRii/8vwIUehYSZWys974y9nIVsTbDmBnSsaMsg6RRORFRDf9
 GyIf3tziY+mw51I/kJ6iXNqhWY+dAgbui1CLpATIRZGfH2WJs0aTY0kp7zTsTdpk2vba
 ciqbOCKaHlRXEcb9qUdpzFNB6DkKzqFite+H8xaqYltuXjw2OhTBH0+xo0Zh5xsWFvOX
 1pIDn6v5f3gQXL9fZO0up1O840/lawT8Rf3OPQA/RbIKNNqGYDc9XKwo2YiffvzQt1kM
 wvUQ==
X-Gm-Message-State: AOAM531I0iRUUlUoguAG7s82GUbp1pKhi4q3CT0F+5/5WMZ/YuCkxipf
 kXwko0pBbULoybjuO1r4QP4=
X-Google-Smtp-Source: ABdhPJwAFrc6RveqiX+PcFtbEz0D6jtRlGRjLinj3n0u+YF9grcRCW/ujnYWI5VlfaH26z8BxLuU7g==
X-Received: by 2002:a17:90a:8006:: with SMTP id
 b6mr4577952pjn.108.1611926699170; 
 Fri, 29 Jan 2021 05:24:59 -0800 (PST)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id j6sm8857259pfg.159.2021.01.29.05.24.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jan 2021 05:24:58 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Subject: [PATCH v9 10/10] hw/ssi: imx_spi: Correct tx and rx fifo endianness
Date: Fri, 29 Jan 2021 21:23:23 +0800
Message-Id: <20210129132323.30946-11-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210129132323.30946-1-bmeng.cn@gmail.com>
References: <20210129132323.30946-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pj1-x102c.google.com
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
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

---

(no changes since v3)

Changes in v3:
- Simplify the tx fifo endianness handling

 hw/ssi/imx_spi.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/hw/ssi/imx_spi.c b/hw/ssi/imx_spi.c
index a34194c1b0..189423bb3a 100644
--- a/hw/ssi/imx_spi.c
+++ b/hw/ssi/imx_spi.c
@@ -169,7 +169,6 @@ static void imx_spi_flush_txfifo(IMXSPIState *s)
 
     while (!fifo32_is_empty(&s->tx_fifo)) {
         int tx_burst = 0;
-        int index = 0;
 
         if (s->burst_length <= 0) {
             s->burst_length = imx_spi_burst_length(s);
@@ -190,7 +189,7 @@ static void imx_spi_flush_txfifo(IMXSPIState *s)
         rx = 0;
 
         while (tx_burst > 0) {
-            uint8_t byte = tx & 0xff;
+            uint8_t byte = tx >> (tx_burst - 8);
 
             DPRINTF("writing 0x%02x\n", (uint32_t)byte);
 
@@ -199,13 +198,11 @@ static void imx_spi_flush_txfifo(IMXSPIState *s)
 
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


