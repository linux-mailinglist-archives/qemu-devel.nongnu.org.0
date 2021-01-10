Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B26ED2F05EE
	for <lists+qemu-devel@lfdr.de>; Sun, 10 Jan 2021 09:22:20 +0100 (CET)
Received: from localhost ([::1]:35082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyVzP-0001Hz-Qq
	for lists+qemu-devel@lfdr.de; Sun, 10 Jan 2021 03:22:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kyVst-0003KB-OW; Sun, 10 Jan 2021 03:15:37 -0500
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:42085)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kyVsp-0006AE-Go; Sun, 10 Jan 2021 03:15:35 -0500
Received: by mail-pl1-x633.google.com with SMTP id s15so7881972plr.9;
 Sun, 10 Jan 2021 00:15:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Jc5qCCv8yOqGsR9K5aIOE6SIqlfFPiNl3jIRInfxLho=;
 b=FpDSXqOIAPy2ER5fSbuJzBOGRXd/ke6d5nLDhQOV3qm3lgIz4p0BYQXJth275HT8T5
 ijDJ0PGUh/5J5Wd4qqPxWemCadQErF8zioyGvNs9Mvfmp0t2ATnj9z3xMdL8UTrSwv8q
 NvYZAEZ5YLZthljph77KW8gnzWtvZm4ULbANpKyiWcGiNkmCB/wd9Vq1z7B65s5b4YKi
 CZ1Cj0vwWAxORoHM/njN06TTX7ghUU90PAyAGmL9wUqbmB1vhT+trPyRoQBUTudwqXU4
 fn33GIxwlqtng86943W0FE/qYJ52BISm0xAIeVXZtVJFNZLMAXyWxBWqn1h6q8bbFo6l
 Datg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Jc5qCCv8yOqGsR9K5aIOE6SIqlfFPiNl3jIRInfxLho=;
 b=XMyTUOiJPgEDoO17qSIL/qTAW4xdpxGCHiX8ZfGF54dhTsocxG7HJtjgDOhaDpkYDz
 nUE+uKGjkPhpB71SOHj1Tdvy6JhoPxXRqcHM+McZVByrbP6aQFliifAmHCex8ENZrvYz
 rAuY7L6r0XfIsZIB7fYy3EAxwg5Fft6I7PmxxJvZlmyfhOCY2gJP6w3J84TCT3VPr9CD
 +RMKLSog39F6HO3j/mvB6QfIjKsTG/WbH2vk2uHT0969IYtZXKD8CobiL5hIUWg3SuVe
 8FUHHCjqVJtMnEX8VMBhmuqqst7LnB66hAenqKCRvFKuuIHt97x7IINVZVmDFrtZNomr
 qM+g==
X-Gm-Message-State: AOAM532zJvni0gfy2W9Lv+lyMCIvQ5Yq3c6Q/DlbbaIKyTxlLz/32MbA
 gPqzGeKzsvo4D+VbHseC6Tc=
X-Google-Smtp-Source: ABdhPJzdQkVJKgjc8+6VQAccRhh7AVaBrNnTZh1crqoYj+05CL+Wz/qWdY/mNmF4qdUYP4h+LBT9qg==
X-Received: by 2002:a17:90a:4d84:: with SMTP id
 m4mr12168444pjh.145.1610266529858; 
 Sun, 10 Jan 2021 00:15:29 -0800 (PST)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id jx4sm13519070pjb.24.2021.01.10.00.15.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Jan 2021 00:15:29 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH v4 6/6] hw/ssi: imx_spi: Correct tx and rx fifo endianness
Date: Sun, 10 Jan 2021 16:14:29 +0800
Message-Id: <20210110081429.10126-7-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210110081429.10126-1-bmeng.cn@gmail.com>
References: <20210110081429.10126-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pl1-x633.google.com
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
index 47c8a0f572..b5124a6426 100644
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


