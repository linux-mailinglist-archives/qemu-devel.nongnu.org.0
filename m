Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6170E2F05ED
	for <lists+qemu-devel@lfdr.de>; Sun, 10 Jan 2021 09:21:02 +0100 (CET)
Received: from localhost ([::1]:32932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyVy9-0000Fq-E2
	for lists+qemu-devel@lfdr.de; Sun, 10 Jan 2021 03:21:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kyVso-0003CC-Fk; Sun, 10 Jan 2021 03:15:30 -0500
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a]:46017)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kyVsm-00068o-SZ; Sun, 10 Jan 2021 03:15:30 -0500
Received: by mail-pl1-x62a.google.com with SMTP id e2so7874830plt.12;
 Sun, 10 Jan 2021 00:15:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LQvfnj7woxwAyoAooXJjlnYpcF3uwPljUdCZJXOXThs=;
 b=G7knzXg6eignm4/rz+x+mn0isCiEYk2zAfWQX0t4TaBQWZsdOUHVdawxZ86/unqHqh
 08sXk/5kimwCJN+KwShdwAr2zdj2tBfO49DAQpFDLv5zdMwgs+T9qUUlGts2hV776RtX
 Urddb69A5iT6J/rf3+DteEDn8FKqDhrfgdlWh9GNVK5JVjRA3Sv2wXlWdz/lkUM5j6Xn
 zwm551Tgb7rGcWYRwszGXCLWw+DfhcMWqhjyBY92aqXcp16njzi+sG51xnm8EnAjaqrd
 HUkcIYy/LRvqTM8Zs5msxU2vRzm0ZKOOVRFYWlr1mIgzeLKpGK2PpeDCShhvD1A6anSV
 VFHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LQvfnj7woxwAyoAooXJjlnYpcF3uwPljUdCZJXOXThs=;
 b=VSfQSBQNRvREh7CLTJY1VA5icpVpwPTGLkIr1ZBTLq+iOS5ma+1ZuWEZX89wsVoDOn
 ATtT3sjpRmv0YA4rqQOFXx/qK/MQMEnjBr+otMuRPGfArLIEBXEBtbc13LNeoJaVNaMA
 6DLQVVnkPKQZxMSfGvdGJ0urlC8PJgnwY0hD39Qj/uK4yqei7YYv96ZUVHUjjsVBiJ8b
 wxMOApcr9+hlc5FFsqx+oPZNQunNDEfj48p89FWePKn2kJ5PRcSS5XMMrOgUv97wUqSf
 hJmmF5on8jEB9njz3oKjrqVquvag79QxSallu/E5QYTAkduFqGTPXdJgSmkritkdqZVT
 Lk6A==
X-Gm-Message-State: AOAM533DDfBd8VskjwdMhB/W6wrY/JV/lU/juijJ+ERbrVlqhL7XNvK9
 6JS51IfV4d/ptcVcK0N5lHU=
X-Google-Smtp-Source: ABdhPJyIOOiD82ayPsXCVgSWnjNiU2NdSQqvqbbxgVnOJ/MbCn1S8YsU3OIICajUAkvhO1e4bA3z8A==
X-Received: by 2002:a17:90a:c8d:: with SMTP id
 v13mr12105712pja.75.1610266527303; 
 Sun, 10 Jan 2021 00:15:27 -0800 (PST)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id jx4sm13519070pjb.24.2021.01.10.00.15.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Jan 2021 00:15:26 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH v4 5/6] hw/ssi: imx_spi: Correct the burst length > 32 bit
 transfer logic
Date: Sun, 10 Jan 2021 16:14:28 +0800
Message-Id: <20210110081429.10126-6-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210110081429.10126-1-bmeng.cn@gmail.com>
References: <20210110081429.10126-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pl1-x62a.google.com
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

(no changes since v2)

Changes in v2:
- Use ternary operator as Philippe suggested

 hw/ssi/imx_spi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/ssi/imx_spi.c b/hw/ssi/imx_spi.c
index 7f81b329a4..47c8a0f572 100644
--- a/hw/ssi/imx_spi.c
+++ b/hw/ssi/imx_spi.c
@@ -187,7 +187,7 @@ static void imx_spi_flush_txfifo(IMXSPIState *s)
 
         DPRINTF("data tx:0x%08x\n", tx);
 
-        tx_burst = MIN(s->burst_length, 32);
+        tx_burst = (s->burst_length % 32) ? : 32;
 
         rx = 0;
 
-- 
2.25.1


