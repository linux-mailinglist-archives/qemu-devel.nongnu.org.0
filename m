Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BFA630C91F
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 19:13:04 +0100 (CET)
Received: from localhost ([::1]:47408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l70Ah-00067O-ER
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 13:13:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l6zu1-0005aM-Gi
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 12:55:49 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:37276)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l6ztr-0002Gw-O7
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 12:55:49 -0500
Received: by mail-wm1-x32e.google.com with SMTP id m1so3079149wml.2
 for <qemu-devel@nongnu.org>; Tue, 02 Feb 2021 09:55:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=ucWUEoYYchXzDLEbvClJQp6sHbKPuWhIZgX+SOpoXsg=;
 b=SksGykz9B4/hpM3xPo543HTI4nV5EP1Zd0O2IzKm57cqbFkgiGU3a68ch27vN59F8q
 6FG/Ro55oSUifrjnXMcBYyTzAayL4owbXqzUg+zuu6SBEpeaFRdmhxYbQ4DdDi5I9PyT
 aVZn0iC/FyaXceUNnI2TnxoE3rJTgd6Hn1v9dQrAOsq6RmjsgmcLl+h7UyDP37VYta9A
 y5REkg3c82vs6BgSrTrBAMUiBVrFsMrO8McSh3mi6hpBxIt7GNGfzF9jGJ4JlwHIwHEt
 gJs6etbi90PAH57LSCPrZs7WZXNPYBj4c+f0KVwNdH+v1atwVHzjy2kwINd+t97D5eYz
 Vttw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ucWUEoYYchXzDLEbvClJQp6sHbKPuWhIZgX+SOpoXsg=;
 b=aC970nlpYpdZRD23pCA8Qq033ukC7oGOAyvmyCkKs4dX6wV1m0d/7QqtZd6y7sR+QZ
 uyICEPbH44SIWAG3zMTaJJUmO6N0pK0m28VZRMCFfICDApvkVnw60dFCzxF4k7kzwiDp
 j3kKSyiLeHOBPvqaw26GSwcuMB477edewyHKpTZt8WoX0h9yEk+3JOaswVt05YfFLEnk
 T2RXHhTGZvMxddSW0soXKm29SekayzuBHhpmL+zoUTfE7gu5fCUIMAwF5vwDUXFx5l9v
 fZgzxnhQeXp/FSUJNSOnJ3ejdVt4GqM5NEzAC8tS5lTILZkmDeiuwwF4ZSW6cYIemW7K
 tVMw==
X-Gm-Message-State: AOAM533v9bjq+HzPWlZ+qLub6hNszH3a2F6EhaHF3RuWvsBUrhpcz9o3
 tLH1S545f005JDW1bFhVp3FehQ1JGpSgdQ==
X-Google-Smtp-Source: ABdhPJzItYtWtjJUINPhCFV5Hl+6niEVnhxjd0Fy81E9Tz4Ecix28n/I5v+IL4TiP1x+p3nSgodQjw==
X-Received: by 2002:a7b:cb8a:: with SMTP id m10mr4593048wmi.127.1612288533260; 
 Tue, 02 Feb 2021 09:55:33 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id q6sm4142283wmj.32.2021.02.02.09.55.32
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Feb 2021 09:55:32 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 14/21] hw/ssi: imx_spi: Correct tx and rx fifo endianness
Date: Tue,  2 Feb 2021 17:55:10 +0000
Message-Id: <20210202175517.28729-15-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210202175517.28729-1-peter.maydell@linaro.org>
References: <20210202175517.28729-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32e.google.com
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
Message-id: 20210129132323.30946-11-bmeng.cn@gmail.com
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/ssi/imx_spi.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/hw/ssi/imx_spi.c b/hw/ssi/imx_spi.c
index a34194c1b06..189423bb3a5 100644
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
2.20.1


