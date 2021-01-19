Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6726E2FB67C
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 14:49:57 +0100 (CET)
Received: from localhost ([::1]:54980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1rOO-0003jG-FP
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 08:49:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l1rFV-00034Y-98; Tue, 19 Jan 2021 08:40:45 -0500
Received: from mail-io1-xd29.google.com ([2607:f8b0:4864:20::d29]:43478)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l1rFT-0003Wh-Ko; Tue, 19 Jan 2021 08:40:45 -0500
Received: by mail-io1-xd29.google.com with SMTP id x21so21354187iog.10;
 Tue, 19 Jan 2021 05:40:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ih8DXH2AR1+PTjLqD5HM8bi1+XcqteQvWXEW3+VB5p8=;
 b=pEKXCxJdHwxJVr9HfKLp+E/Ae/Nb+PYYmQUzI3ekzXXX9w2sqs7TgNtkIeZeKepwiq
 7CYqR4aESAJtz5Z9a4Z3FcAtHdG0MFHp89BdIOM7mES8yWMrJZuuAcOPRUjLvGQ6taHp
 kD+gVqGpZcpaRtE56Y9RMPuaOzKKXAXZqI4zS1u6zYqpGLg519HsvHwP5T1D6jgxIQzs
 5aVAdg/JXzzSchMem8zbUBEDnWt+CkTn875ZWDiNLLF/Xi2/kAQ0qRr80nQwuwGBziD1
 n2Z7/mumIEMQFmzQHTF0cHB0tE7Y8Ss7y6Aip9r61i47ueh4ph3jR4vab00dL3o+gzBG
 tJ0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ih8DXH2AR1+PTjLqD5HM8bi1+XcqteQvWXEW3+VB5p8=;
 b=rnQ2j0FnJyMIjNQCfuBtp8fxPu1fpspexM6EDLA/h/Hy/Qagz8lPbSJPMu65bPqlTq
 qWWO1Fm3TKNI2TNTOTHzjKfz3eJPls4l45tSSLPCtIHdO+ldfiwMZEKM1Dizco7KdVqH
 cYd0PpsB2WB+MN0W+g9P22zPsmbGjTvF088csPRGZCWWVx+ov3hYIwaW1vuIjM6jFkdu
 CDyrozI1u4sQvcVXYK8l8moJn9s+P++Ip7Wa/zOBQ/BXJgR5f642VM6spQFi6iHAC5J1
 cX5sMCdcFXTgyyL+vlTqN5QXLyGxKK65PI7dyfldF/uOj5MfFxU98pD1x7qFMCT97jl6
 6kaA==
X-Gm-Message-State: AOAM531zldYgSLj0tK3r88M/C0wXpIY6XDMtNS3y3/Et0MHElNI4WMXK
 7d2/sdE0aBac4lgCQFEXzCLF/YA7d2U=
X-Google-Smtp-Source: ABdhPJzZeIAOGWIzTZB+TQT3GzyNtS1d/Ko8/u496PYEYKeYvvk3U1pra8Z6qCL0GZHNswwOlLLO/g==
X-Received: by 2002:a05:6602:20c9:: with SMTP id
 9mr2904371ioz.51.1611063642160; 
 Tue, 19 Jan 2021 05:40:42 -0800 (PST)
Received: from pek-vx-bsp2.wrs.com (unknown-124-94.windriver.com.
 [147.11.124.94])
 by smtp.gmail.com with ESMTPSA id s6sm11089546ild.45.2021.01.19.05.40.39
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 19 Jan 2021 05:40:41 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v8 09/10] hw/ssi: imx_spi: Correct the burst length > 32 bit
 transfer logic
Date: Tue, 19 Jan 2021 21:39:05 +0800
Message-Id: <1611063546-20278-10-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1611063546-20278-1-git-send-email-bmeng.cn@gmail.com>
References: <1611063546-20278-1-git-send-email-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::d29;
 envelope-from=bmeng.cn@gmail.com; helo=mail-io1-xd29.google.com
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

(no changes since v2)

Changes in v2:
- Use ternary operator as Philippe suggested

 hw/ssi/imx_spi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/ssi/imx_spi.c b/hw/ssi/imx_spi.c
index 3c80725..de0c481 100644
--- a/hw/ssi/imx_spi.c
+++ b/hw/ssi/imx_spi.c
@@ -191,7 +191,7 @@ static void imx_spi_flush_txfifo(IMXSPIState *s)
 
         DPRINTF("data tx:0x%08x\n", tx);
 
-        tx_burst = MIN(s->burst_length, 32);
+        tx_burst = (s->burst_length % 32) ? : 32;
 
         rx = 0;
 
-- 
2.7.4


