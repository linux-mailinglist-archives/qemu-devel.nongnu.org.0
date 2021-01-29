Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A91C4308956
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 14:32:06 +0100 (CET)
Received: from localhost ([::1]:37262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5Tsb-0000XA-K7
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 08:32:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l5Tli-0004yY-1S; Fri, 29 Jan 2021 08:24:59 -0500
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:36006)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l5Tle-0008Gl-KS; Fri, 29 Jan 2021 08:24:57 -0500
Received: by mail-pj1-x1036.google.com with SMTP id gx1so6367217pjb.1;
 Fri, 29 Jan 2021 05:24:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hwvGbS5LDh3Z8XeKXBpeFCpn6ZrLyIA6WHiWs4apvvk=;
 b=mr4LoVFyg9DSHeXNRf7unLz5ftmUe5SWWI34UulD/YDMDV1YEA1S+mz5v2MFpjGTjm
 KO5b5bLoI6Nwu3S2lmRp6iEpfPKLs9dtXsuf92QLCZJLccVSvtUDmYZfSyQiMjbPs62T
 6+MIwLBmff0zGTg08J4MVleQyxJRyNKBBnFMPPQLe8P8g/ets5x2+i3IiGJrkHfMlnJP
 5WkzvMV/0Ey3ZT8HDxaEXYYjrFOFEwIQuE4IOBV2MozAsq2CFbMNaK7N8QLWdiIG8whM
 BziRgKHJGw8BfLW+oLZKCVCxHwhNi6b8Jt3PW12/SIImDhgaIVJiYCjNvhZIQUFsqfH+
 Cu4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hwvGbS5LDh3Z8XeKXBpeFCpn6ZrLyIA6WHiWs4apvvk=;
 b=kNPROJLL80Sam/efVDvdes/A8+60rg75DWtuh30lb/mF8CAvXebzA6KasMkIqNscuI
 mWOtriXw9UFpqyh6IN7CTu+5eVFc6o6oKDLn0rP2l6CYcRGFAQ7itNIzVF4Oq1AyAthW
 7d7/UIxX0MmELDSdzeUvpX5MBnBnqW4eMhw7Egs3AXUDG+abiX7lFZkuYVseNeuEPeEt
 pJHEVJ+k3+yMg5zJmhNTFsYNWT+qhYIE+vSQ/ashKBpj+Jdh9QzmP2oQ6eJu/KTyv1mH
 9cHPU0BLfAo2vsDWzv4fpUSAQ/bltpUn4oG2O5HmsMeMxo5hzyl+VBBsdyqE3TSxeSGd
 PdxA==
X-Gm-Message-State: AOAM530ny35j5LxHnAu7H8Vve0KKrhLzX2rFDBK2kMduBprlDEU+RtY4
 Fzry8h5gPUS/iPEYPX1j5P4=
X-Google-Smtp-Source: ABdhPJyKu6/e2RK/0Ch51/84uwiGqDVYoOvjHpnzV27QN6DO7vupw1JjvGe/SqtFZo4+lBW62R+YBw==
X-Received: by 2002:a17:90b:3792:: with SMTP id
 mz18mr4505328pjb.23.1611926692580; 
 Fri, 29 Jan 2021 05:24:52 -0800 (PST)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id j6sm8857259pfg.159.2021.01.29.05.24.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jan 2021 05:24:52 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Subject: [PATCH v9 09/10] hw/ssi: imx_spi: Correct the burst length > 32 bit
 transfer logic
Date: Fri, 29 Jan 2021 21:23:22 +0800
Message-Id: <20210129132323.30946-10-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210129132323.30946-1-bmeng.cn@gmail.com>
References: <20210129132323.30946-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pj1-x1036.google.com
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
index 41fe199c9f..a34194c1b0 100644
--- a/hw/ssi/imx_spi.c
+++ b/hw/ssi/imx_spi.c
@@ -185,7 +185,7 @@ static void imx_spi_flush_txfifo(IMXSPIState *s)
 
         DPRINTF("data tx:0x%08x\n", tx);
 
-        tx_burst = MIN(s->burst_length, 32);
+        tx_burst = (s->burst_length % 32) ? : 32;
 
         rx = 0;
 
-- 
2.25.1


