Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CA542F7FC2
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 16:39:01 +0100 (CET)
Received: from localhost ([::1]:45102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0RBk-0007B7-GP
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 10:39:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l0R4d-00062N-06; Fri, 15 Jan 2021 10:31:39 -0500
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:39756)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l0R4b-0001Kq-DB; Fri, 15 Jan 2021 10:31:38 -0500
Received: by mail-ej1-x62f.google.com with SMTP id n26so13842961eju.6;
 Fri, 15 Jan 2021 07:31:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4fJWv7T8ni1UgNw8omgysewBjnwqG7EbsoSKPeXsii8=;
 b=lzifNm3cJxOPtWGXFvfLqIGNzR8hJHhy9rToFJfvGcE97KyWAgQnlDexulLCWYSjEd
 VwA/bcttwCqYYJJryfLNGVtyqGdV6xPaQdcNr+8nzKNHCO6nLojpqsQfim9mzsajXUbu
 xJ1Vrj1eA1P8YHHic+Enie56T79CIK6NjSGD5ET3CYWg3bp5sY4UZaXji23E3cEBMgG7
 zIa3zouHEIDt0k+A0UIgPlJ31r//wokYZmx+cHEyAlPXl5uWi3OBj5froQzEff3RphoK
 mPH20NWxM4UClN5VoxzPwIW5eshFDV3TD8dQapL1/MD7AWvlflknqFyarNdQT1IoFY8C
 gvlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=4fJWv7T8ni1UgNw8omgysewBjnwqG7EbsoSKPeXsii8=;
 b=P/D6r2SaDkSKZEFdG5OBKwBxxMiB5B0DoVRKq7OcprSQ75XFlr0Ar171AZm1ahQ5+B
 oBBGgc1FDqSmYof7BOVtHUjgTAiaUxP8U5+nNq+mJTXc6bKwHthURoHnSkXlaF+yvCIF
 MFZ0NI3z6AN2n539wxDZ4uhFIl+QQjcgdCJ7e4fi2bZLuWWcASSy3EUr5chH5TCpvgPF
 2UHjDzUgf7JPkfIsaufkMCdHpdtdvdzXejsvKcEdHCi0RtZjKwuQgs90fa+33Qu0zUAc
 mNSeB4zyml5S9sApOrVmVyQNUqmVR7PeqNvs6FK4PMHaRjcz4ckI7LAwfvxV1pac3FTy
 hyug==
X-Gm-Message-State: AOAM5302pLvjy+914/SBUfWTeWTtx4jeo5yvY8jHBLp6CO+upfapZbSG
 F6Ejz9dpy7oWxbfQ0hh/ZunUY0AFRVc=
X-Google-Smtp-Source: ABdhPJzZmXzxRol0w1xttkBVBhbTSTguYFnzG3SCxDBpOO2WQ86RWctTz2Zm/N0EmMRnnqpg8G7UKA==
X-Received: by 2002:a17:906:aec6:: with SMTP id
 me6mr9090264ejb.542.1610724695528; 
 Fri, 15 Jan 2021 07:31:35 -0800 (PST)
Received: from x1w.redhat.com (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id k6sm3681616ejb.84.2021.01.15.07.31.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 07:31:34 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 8/9] hw/ssi: imx_spi: Correct the burst length > 32 bit
 transfer logic
Date: Fri, 15 Jan 2021 16:30:48 +0100
Message-Id: <20210115153049.3353008-9-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210115153049.3353008-1-f4bug@amsat.org>
References: <20210115153049.3353008-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x62f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
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
 Alistair Francis <alistair@alistair23.me>, Bin Meng <bin.meng@windriver.com>,
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
index b79304d93d9..707defb8b3f 100644
--- a/hw/ssi/imx_spi.c
+++ b/hw/ssi/imx_spi.c
@@ -191,7 +191,7 @@ static void imx_spi_flush_txfifo(IMXSPIState *s)
 
         DPRINTF("data tx:0x%08x\n", tx);
 
-        tx_burst = MIN(s->burst_length, 32);
+        tx_burst = (s->burst_length % 32) ? : 32;
 
         rx = 0;
 
-- 
2.26.2


