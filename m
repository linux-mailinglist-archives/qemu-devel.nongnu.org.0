Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E0FA2DCC16
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 06:31:34 +0100 (CET)
Received: from localhost ([::1]:60656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kplsz-0006gR-0u
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 00:31:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kplqI-0005Zx-4s; Thu, 17 Dec 2020 00:28:46 -0500
Received: from mail-qt1-x835.google.com ([2607:f8b0:4864:20::835]:34809)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kplqG-0006Rg-28; Thu, 17 Dec 2020 00:28:45 -0500
Received: by mail-qt1-x835.google.com with SMTP id 7so19413594qtp.1;
 Wed, 16 Dec 2020 21:28:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=EXChrC5gkzfVYI7erB3OTiU4nPjdhy+eCp+7MHWO3+E=;
 b=bo6xk9EM3d78QcVmnt9i5Rj+CgadpEvCoWTiyaXv6IH443GpUrN9XDaACbRZjrBBJ2
 6Cc9zF8fE4LGcTkZFpBJQiK3v4DNTQy85m6/1hj8rfWIUlldpMOvP8nnDu8yrkMZ5dEo
 +qq1dztVmXAbgvDNVDfSEtwb4QEKNboXx0Hopj5MRDJfodzhTCW3pDggLalxtcQ1ngG5
 GGjCiajzTNF0NOuiQTxCuvnU2XVtLhsYqRMNsGocNgesOOT7k9AdsnAuUulfESGUWEJq
 4Ke8z7m7dDn3Gui0gkXO3VaifDOBviJRdcFWHduomNlp22Pq2UZNme96ezjhrRfmHUyF
 /Mgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=EXChrC5gkzfVYI7erB3OTiU4nPjdhy+eCp+7MHWO3+E=;
 b=DxIkoGAPedANlnXd7kjJl86qObRtsKgPGerh4r/IH/UbzVbwVdt5cuednMzxFiE5pE
 KLGH/eIujBm35PmrKxfmtHHyTejfTfYNY3hxB2pFlnXzIAwPbUQ7vntOH84G7pZEksUT
 Ttg4FJ5PN3R/i89TDO+Okw5V3juxGha/oN1W5XYBhslCZ5YBOS+7x66lCQZMI6IRVTqr
 GVnAiIllEffaKdjSuQ1s8U37gtGZHD+KNTOHI+inm63KJOhiSO9ae73GIrWWIACRKlvI
 kvcJsrEc5GND5+aHtDOe1WJU3X9Gqb9TX44jEMnGFsRucXyfBt436SA/tbyVU4G/Xgt5
 Jdzw==
X-Gm-Message-State: AOAM533/suwJZjTnIzLYeZVs6ZSK7XvlbTe5i9RlQi3qDwdPl9HfhXkO
 Cc4fnacX5RlAOSrK1rtDBPo=
X-Google-Smtp-Source: ABdhPJwS4TwN5Rxz004PAEBXm2iEO6g4Sl8MlONkZQrCI0bwk1kG8LAUrhwKWjouvJKKQEji+M4M4w==
X-Received: by 2002:ac8:5441:: with SMTP id d1mr2660193qtq.384.1608182922215; 
 Wed, 16 Dec 2020 21:28:42 -0800 (PST)
Received: from pek-vx-bsp2.wrs.com (unknown-124-94.windriver.com.
 [147.11.124.94])
 by smtp.gmail.com with ESMTPSA id i13sm2674072qkk.83.2020.12.16.21.28.39
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 16 Dec 2020 21:28:41 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Subject: [PATCH 1/2] hw/ssi: imx_spi: Correct the burst length > 32 bit
 transfer logic
Date: Thu, 17 Dec 2020 13:28:32 +0800
Message-Id: <1608182913-54603-1-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.7.4
Received-SPF: pass client-ip=2607:f8b0:4864:20::835;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qt1-x835.google.com
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

For the ECSPIx_CONREG register BURST_LENGTH field, the manual says:

0x020 A SPI burst contains the 1 LSB in first word and all 32 bits in second word.
0x021 A SPI burst contains the 2 LSB in first word and all 32 bits in second word.

Current logic uses either s->burst_length or 32, whichever smaller,
to determine how many bits it should read from the tx fifo each time.
For example, for a 48 bit burst length, current logic transfers the
first 32 bit from the first word in the tx fifo, followed by a 16
bit from the second word in the tx fifo, which is wrong. The correct
logic should be: transfer the first 16 bit from the first word in
the tx fifo, followed by a 32 bit from the second word in the tx fifo.

With this change, SPI flash can be successfully probed by U-Boot on
imx6 sabrelite board.

  => sf probe
  SF: Detected sst25vf016b with page size 256 Bytes, erase size 4 KiB, total 2 MiB

Fixes: c906a3a01582 ("i.MX: Add the Freescale SPI Controller")
Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

 hw/ssi/imx_spi.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/hw/ssi/imx_spi.c b/hw/ssi/imx_spi.c
index 85c172e..509fb9f 100644
--- a/hw/ssi/imx_spi.c
+++ b/hw/ssi/imx_spi.c
@@ -178,7 +178,10 @@ static void imx_spi_flush_txfifo(IMXSPIState *s)
 
         DPRINTF("data tx:0x%08x\n", tx);
 
-        tx_burst = MIN(s->burst_length, 32);
+        tx_burst = s->burst_length % 32;
+        if (tx_burst == 0) {
+            tx_burst = 32;
+        }
 
         rx = 0;
 
-- 
2.7.4


