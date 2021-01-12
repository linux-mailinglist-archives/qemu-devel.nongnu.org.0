Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F0D42F3936
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 19:52:11 +0100 (CET)
Received: from localhost ([::1]:56142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzOm1-0007Hx-Uz
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 13:52:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kzOX5-0002Aw-1Z; Tue, 12 Jan 2021 13:36:43 -0500
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b]:35528)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kzOX3-0007Zc-HC; Tue, 12 Jan 2021 13:36:42 -0500
Received: by mail-ed1-x52b.google.com with SMTP id u19so3485492edx.2;
 Tue, 12 Jan 2021 10:36:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xLLdvkIJe1l73eWOGFy35bKaZgGosmrQIeGMAiRhIRc=;
 b=GGdNkTjdD2SqUviwqnZEDqQkbcZq129V6FUHz6H1xgq8nZGAWREXGKd6RgQi5DoR3J
 pUGB0xdlbTctnsCfWeWpFuvl/7NFfHFOeVaHRVd5s322a7WN1zHZfMQmPJJjeJJLTFgA
 74aZXkOrwvGpir5QiDW2Or2mLKmEloFYg/0z3KVMqXXhu3bZ/hO8mBlJp7LX/PAqTwLR
 awm6qogOKyv6w7up9vZ/VnOdX/hfex6EJEAuUMIG5b4IAPspKK3fD2V68VTSC4beSm4C
 nwBFDCIwtZTsfO0va8uwp76vkS8Ipwwm3V9pjZhwDGIM8K1JV6knoDDX1XJqveMDAXW3
 4/Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=xLLdvkIJe1l73eWOGFy35bKaZgGosmrQIeGMAiRhIRc=;
 b=cLMIfuuXxXWwjNTlzgQCaC1zFESk293U8FdRxBy6ZQcHcDnXdQ7eOkJ9HPx9/UaB2D
 esqSDzVHbwdugy67Mbm99u0cFW75bWbF+oO2ojnnCLQuO27UuEZ6D0i9aTwb5ekmQVzf
 sEUBKLCkYMUjvy8NJfQFC7HrGRgjp294wfs6J7AwvA7sVe675hOnKMQdGdwp6wiZq+7J
 3p7ndDy9WVF867rvZblpDmr4cHb9EAjXz4tnz/XL7IeFruXVvcmMYkTy8UdFLxclWbZ/
 0q7IeLEUnO2tt1L/xzgalgOuQZS3SbA63rCPMXxVTmsND9z0EDMgDMlanL78aaVnxHlj
 ljaw==
X-Gm-Message-State: AOAM533iAswEn2DhLWfO3zQrcr9Uw88zBZi0n7XZOwcmZeNYq5ggLRNk
 T6QHR4WAAzhZ4BF8JCDJl5TQfYwoTYQ=
X-Google-Smtp-Source: ABdhPJy9RrAi0h8sC/vPap5Yg4VTQNuty1PJc6i07aUmQo+7XHcYfVaZj/YxXT/KfMOdPgGpD0w36Q==
X-Received: by 2002:a05:6402:31bb:: with SMTP id
 dj27mr356816edb.285.1610476599942; 
 Tue, 12 Jan 2021 10:36:39 -0800 (PST)
Received: from x1w.redhat.com (190.red-83-57-173.dynamicip.rima-tde.net.
 [83.57.173.190])
 by smtp.gmail.com with ESMTPSA id x20sm1517322ejv.66.2021.01.12.10.36.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 10:36:39 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Bin Meng <bin.meng@windriver.com>, qemu-devel@nongnu.org,
 Bin Meng <bmeng.cn@gmail.com>
Subject: [RFC PATCH v6 10/11] hw/ssi: imx_spi: Correct the burst length > 32
 bit transfer logic
Date: Tue, 12 Jan 2021 19:35:28 +0100
Message-Id: <20210112183529.2011863-11-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210112183529.2011863-1-f4bug@amsat.org>
References: <20210112183529.2011863-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x52b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
 Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-arm@nongnu.org,
 Peter Chubb <peter.chubb@nicta.com.au>
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
Message-Id: <20210112145526.31095-6-bmeng.cn@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/ssi/imx_spi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/ssi/imx_spi.c b/hw/ssi/imx_spi.c
index 638959daa08..c4e2d2e1c97 100644
--- a/hw/ssi/imx_spi.c
+++ b/hw/ssi/imx_spi.c
@@ -192,7 +192,7 @@ static void imx_spi_flush_txfifo(IMXSPIState *s)
 
         DPRINTF("data tx:0x%08x\n", tx);
 
-        tx_burst = MIN(s->burst_length, 32);
+        tx_burst = (s->burst_length % 32) ? : 32;
 
         rx = 0;
 
-- 
2.26.2


