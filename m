Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C8AF2F3389
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 16:03:40 +0100 (CET)
Received: from localhost ([::1]:47754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzLCt-0006j4-7j
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 10:03:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kzL5V-0008O7-50; Tue, 12 Jan 2021 09:56:01 -0500
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:36867)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kzL5T-0004ps-Dk; Tue, 12 Jan 2021 09:56:00 -0500
Received: by mail-pg1-x52a.google.com with SMTP id z21so1611864pgj.4;
 Tue, 12 Jan 2021 06:55:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PdFwrdJNlHNeKN1ZR3AWcNlXHaUv5kTriH28HT1ONsE=;
 b=jzBdg7mmfA4x01sDM2alMcCvuxxVAACStuygbnWbFw+cSnyMTQpfltBRIlnl/D9KSO
 1Exe58GomaponQIuV/1Dp/ag8g8/ykYsO1CWVVsm4FiIaQHOr2NofeJmtkr+Pr0aQxN8
 pSRJVDB8cGX05CjovOpEdwDwBllZbr8guxcD+p1GvQ4e2vY1OQSpkbT+XUdK97+sxCnj
 V+ps3noiNU/tPhVLV7GcSPDtI9p3hxk8/kZRjsG6HoAaOew85XdBfj9C17SxbM8hIyss
 SgPmycYt2bLzqQaDpnW3bJAduMc2MRa5SO/ttN4aI0Tj1cg+xQKtuYff4pNOFAAxARUa
 3AZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PdFwrdJNlHNeKN1ZR3AWcNlXHaUv5kTriH28HT1ONsE=;
 b=T4728BjMgnLK4kFHbqM3PU6AmsEqyhAu8lNxR818UCgdhqSiaemf9nd1cxiSC3BIAW
 r4ZHE3YtOVPO/gurcQcUUVWDSaJWkhsxy9s5+nYc4InqR+84aXwK9jtwVarYryJHuGms
 Qy9ICONhYjS8EoPCO1JInAjf2JrpdTe+tmV81BU+TxCy4YjiMpMMmKCyeJqLxdfDS6L1
 KlSl97hwSvTEjPeA27up+YVsrlQLjLKupjw4nInDjVnhRtuR83o7lEZdXlAVTvCncw+d
 178+1P6RmZJD5ZhgSEXU78EcgqtNw28fwkgvuTaDHgbRx88sBbyMCZTcfLmBTXQlly0p
 cuMA==
X-Gm-Message-State: AOAM533Z+AhOCz9cjtqeDhp+kCTCTjJek6twtSDYWj4es+C9upVl5Gqh
 5GHXel6Pr4s51fo6qIvTI08=
X-Google-Smtp-Source: ABdhPJzjI9LVG8I8JlJqCPCsqMiEke6YLXhmSYUbBGY7/g9rj9P0hjBACEXjTHhla+uM4sgyQhVSuA==
X-Received: by 2002:a62:14c4:0:b029:19d:d3f5:c304 with SMTP id
 187-20020a6214c40000b029019dd3f5c304mr5069333pfu.55.1610463357711; 
 Tue, 12 Jan 2021 06:55:57 -0800 (PST)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id l141sm3593938pfd.124.2021.01.12.06.55.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 06:55:57 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH v5 6/6] hw/ssi: imx_spi: Correct tx and rx fifo endianness
Date: Tue, 12 Jan 2021 22:55:26 +0800
Message-Id: <20210112145526.31095-7-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210112145526.31095-1-bmeng.cn@gmail.com>
References: <20210112145526.31095-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pg1-x52a.google.com
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

(no changes since v3)

Changes in v3:
- Simplify the tx fifo endianness handling

 hw/ssi/imx_spi.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/hw/ssi/imx_spi.c b/hw/ssi/imx_spi.c
index 5c2d818560..bbbf6afce5 100644
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
2.25.1


