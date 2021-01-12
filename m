Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F8C02F338B
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 16:04:13 +0100 (CET)
Received: from localhost ([::1]:48854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzLDP-0007BP-Vt
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 10:04:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kzL5S-0008Gi-1s; Tue, 12 Jan 2021 09:55:58 -0500
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:35561)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kzL5Q-0004ov-CF; Tue, 12 Jan 2021 09:55:57 -0500
Received: by mail-pj1-x1035.google.com with SMTP id b5so1839183pjl.0;
 Tue, 12 Jan 2021 06:55:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1ox0W7mH3xZCkBWcpn4x9chA6DFhj8PXgPUX2LxAJf0=;
 b=gnZT+vHDI4/dYMVRewbDoBUr7VHRmvZNpjOS2NC8/2eKMVCxf5q/gcBVROfIdLcU8U
 w3bpsnSFPBD9vsQaQWHV8CI/zWyckaI1PSSLIjtoVzKWGY00rgKgyvQcGYOw7JFxfjcI
 UwfqAfIujXXpY4+LVphii+L8CvK7euys0kl/NiEIIcpHWiv0kjbY4b9gK0RP21m9XwFf
 Ktv/guUB1IrLyIO/H0wnyraUR78QGZTk4WtZvsqDmDHWquiOioNuJnLl178NSTyFZ9H8
 SgAl6gMCrlHh1NdDJnqPHUQt5N9FjxAMKhmggTkcqKDGKgjO3IVRkJzTWdATTdOVOHgZ
 w8tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1ox0W7mH3xZCkBWcpn4x9chA6DFhj8PXgPUX2LxAJf0=;
 b=JUWelC3cO3h0AB0pU48BVCubgnWGoAtn0ICj/FwcQAd6ZWVNQBw8aMWOAJgEZ5Ho71
 Qv+XN94yr0zQnOwrdfXtPZAOtwxtUsrLBW5Had4NH3WIal7PoWV7B8q01qD6GFOz1ga5
 vNvb3biT0mBPTU1CP8XWu9uqJ/i/1BJYyl0yIfgFRQxEFgXs/u4bgiTUcud79eazIBfD
 vPSQlG5cAVmRT5CcofMSS7DvadVZWW+9HA58FmNe6F85+4wj1HKrUNR9iau/hmUy0mm3
 p+894K7ZJSsJD10K59wm6NNU3690Bm4Swy5oK8Y0jx1GAX0Op8zCNdAckl+GYbtGFdvF
 ursA==
X-Gm-Message-State: AOAM533s6pkNXpZvsMgshMnVLDn0ZQMtnvjHW+4cV7V70iXbxgKahsKw
 cY+ETOR3wg6nIFzna5kBG1I=
X-Google-Smtp-Source: ABdhPJz8LGvx9/AZWYLAbbf+lCuHXC31x+NTvAfO/faps0zncFMZlsOZefTrh80GBN9sTbyy4hKbow==
X-Received: by 2002:a17:902:9a03:b029:dc:31af:8dc2 with SMTP id
 v3-20020a1709029a03b02900dc31af8dc2mr5097814plp.39.1610463354871; 
 Tue, 12 Jan 2021 06:55:54 -0800 (PST)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id l141sm3593938pfd.124.2021.01.12.06.55.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 06:55:54 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH v5 5/6] hw/ssi: imx_spi: Correct the burst length > 32 bit
 transfer logic
Date: Tue, 12 Jan 2021 22:55:25 +0800
Message-Id: <20210112145526.31095-6-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210112145526.31095-1-bmeng.cn@gmail.com>
References: <20210112145526.31095-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pj1-x1035.google.com
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
index b7456de065..5c2d818560 100644
--- a/hw/ssi/imx_spi.c
+++ b/hw/ssi/imx_spi.c
@@ -191,7 +191,7 @@ static void imx_spi_flush_txfifo(IMXSPIState *s)
 
         DPRINTF("data tx:0x%08x\n", tx);
 
-        tx_burst = MIN(s->burst_length, 32);
+        tx_burst = (s->burst_length % 32) ? : 32;
 
         rx = 0;
 
-- 
2.25.1


