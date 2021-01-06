Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A3E82EB9AF
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jan 2021 06:59:05 +0100 (CET)
Received: from localhost ([::1]:34646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kx1qa-0000Ql-KZ
	for lists+qemu-devel@lfdr.de; Wed, 06 Jan 2021 00:59:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kx1nR-0005CA-Gt; Wed, 06 Jan 2021 00:55:49 -0500
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:43465)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kx1nP-00050O-Rz; Wed, 06 Jan 2021 00:55:49 -0500
Received: by mail-pl1-x62c.google.com with SMTP id x12so1006426plr.10;
 Tue, 05 Jan 2021 21:55:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ctjrb0wLEu8UMxmCsMBYWKVGQJNBDXEyUZiU0DSOVTU=;
 b=saG65mL/nb4ayK6cIqYmLIkPX9wzVH23XMeJpwM0Nehd8UjnofpivGvFIKf+CUgJae
 iBVIaQfl1svNtAh1aiSm/7jX3PVcUZnIe7rHZD0IB7v6WcRnCWTVUGKNkqkCZcKDdLhO
 8X395mpswr9uFl2UoIgtkXxn7v3JBIc9vBSycbtKOGLdYfMAT0sESdi+/nyi7PFnm/MH
 UM2qWtGztKfSpvCYxS3MZT5DsN1HC3z6CMo3KxihEChFOsK3b6ZjxTjZk7xqjbyEGj96
 Gk6VlEO4bYMtOeBE1ZV29CP9Jv3Arfc/4hVkWFCrDgm+ibe8VKfpFJYWdgoUTUmeVHuE
 kt0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ctjrb0wLEu8UMxmCsMBYWKVGQJNBDXEyUZiU0DSOVTU=;
 b=CiYddmx0bhNhl2hjf0c2roz4w7oppeKYCKKUuiCZHAJTt+3nM+65qx3yfd3FZxkcuI
 f40UvqxJ1jRFOHsdbPlS9G1WJ45e6jouxtikzTY9fuQVVY7+4YdAEiNkhDbOieMO41jj
 0y5zFriuMfJHJ9QAq9ku7EBs0p5JVE+kvLEJzY03T6xXtNGvth/3ZIo4jck6m9821Pho
 ezB4azwHJzm9NRjBr72vUNkhLyrIp6PjYlkL3gKVI7tRoU2tB/EG0yYk+YnHX/trOes6
 EiWJUagnaOVPAdRfVGRYYg7lBSQH49vm409hX6jdtgIlsomeGT55LO3GhFgXbGzXaOOY
 AQDg==
X-Gm-Message-State: AOAM5328YPMHOCYANaJUqGvUBQ4qC3NYJRrk9eJUn+HSjhqUMNJA7aeX
 0H83VNXRl3zbTb0D+XPapKA=
X-Google-Smtp-Source: ABdhPJzFxVAYYOoHU9vY3vEH5J2xSk+CSIMUWoQ1JOwMUl8lD0zihjvpQsytf5QWOrmNh1c5aEvd3w==
X-Received: by 2002:a17:90a:68ca:: with SMTP id
 q10mr2795801pjj.15.1609912546272; 
 Tue, 05 Jan 2021 21:55:46 -0800 (PST)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id c62sm1070503pfa.116.2021.01.05.21.55.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Jan 2021 21:55:45 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH v2 3/4] hw/ssi: imx_spi: Correct the burst length > 32 bit
 transfer logic
Date: Wed,  6 Jan 2021 13:55:21 +0800
Message-Id: <20210106055522.2031-4-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210106055522.2031-1-bmeng.cn@gmail.com>
References: <20210106055522.2031-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pl1-x62c.google.com
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
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

---

Changes in v2:
- Use ternary operator as Philippe suggested

 hw/ssi/imx_spi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/ssi/imx_spi.c b/hw/ssi/imx_spi.c
index 85c172e815..0cf07d295c 100644
--- a/hw/ssi/imx_spi.c
+++ b/hw/ssi/imx_spi.c
@@ -178,7 +178,7 @@ static void imx_spi_flush_txfifo(IMXSPIState *s)
 
         DPRINTF("data tx:0x%08x\n", tx);
 
-        tx_burst = MIN(s->burst_length, 32);
+        tx_burst = (s->burst_length % 32) ? : 32;
 
         rx = 0;
 
-- 
2.25.1


