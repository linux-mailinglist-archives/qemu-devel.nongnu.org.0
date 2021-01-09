Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BEF162EFFAB
	for <lists+qemu-devel@lfdr.de>; Sat,  9 Jan 2021 13:48:20 +0100 (CET)
Received: from localhost ([::1]:40066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyDfH-00046A-Rj
	for lists+qemu-devel@lfdr.de; Sat, 09 Jan 2021 07:48:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kyDTs-0001MM-Cx; Sat, 09 Jan 2021 07:36:32 -0500
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:37129)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kyDTq-0001kd-6D; Sat, 09 Jan 2021 07:36:32 -0500
Received: by mail-pg1-x535.google.com with SMTP id z21so9432533pgj.4;
 Sat, 09 Jan 2021 04:36:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=B2jAlpjFw7XPhC0HC48VFfcY7gcoBuUEhgdvZgD7bo0=;
 b=hP8DW9agdXeqI+RMPb09GuMDQF5cuJlmvKV7kaR7lrAbDASzxGesPsSHaiLDZlkNur
 KHiqZVSAkD07BZ2VRK5xPHce1Kt1oIJ+8OZeGwc5dYJKhyNPtURIXDg7IZspVV4XZYz3
 E/KcUCqT1zb1XKySZ6UlKKWsfSnXyCjdNU9p+m/f+PZi6Yf9hYYvM5oMEpEg6tsrmCrH
 K6UCpaDz9My+o1QZI9kR6/orf/KxKhn4AoVi/61whBRqjYEqI7/8oNLKAndoeNNA+/AB
 7FBKXlBRcUl10f0f9HHZbFWCivPXiVLnXbScLTkxJWiLo/sT0DiKKkkhyhGH2XFnW94c
 KZIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=B2jAlpjFw7XPhC0HC48VFfcY7gcoBuUEhgdvZgD7bo0=;
 b=DkUPxIp6KYl9oCCOPrsUSbnThdQkf3qEidxBF62A4psPK49nXPXE5OjMjBGsk7CyN/
 ioCWDDFXF/RUCPU0OC0Sxn7GfkjgnYZvlT9t4cKIa/tX9idSRhCsSeojVSlkJheZka0L
 Xu4mhA1/gnvhSixmLKD6aLEijSXZXE5HY1FhwYR5w/JDGW4cbADbgKmXBjar8hJwF1z5
 O/i9y6cX9JhlNnyAXpaPP9VcOYI04UucJoipSsDMmClFuO8ytk+VjBbxa15xk8fG/y7A
 TU88oQOZR65K2qaceFsStzA3U2PJ3EAYqw5ZvM/ZPEjTI8h+n1NyzID8ELyLGfK+uz7d
 kH1w==
X-Gm-Message-State: AOAM533viWHVrDFQ8gs0mxkHvJKx1OL7xgJdX2clOAvvG9M53xvXrON9
 22S1H3Ihc0bY8u15ozthIi0=
X-Google-Smtp-Source: ABdhPJwFEIst+OPDpKt7TP+mgIB+rDv2luHBXUSCDZyA6QWkdg1vSFxaMVz3ZrtFYESn5J8Q8DgSOQ==
X-Received: by 2002:a63:174f:: with SMTP id 15mr11537566pgx.49.1610195788448; 
 Sat, 09 Jan 2021 04:36:28 -0800 (PST)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id b10sm12840748pgh.15.2021.01.09.04.36.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Jan 2021 04:36:28 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH v3 5/6] hw/ssi: imx_spi: Correct the burst length > 32 bit
 transfer logic
Date: Sat,  9 Jan 2021 20:35:44 +0800
Message-Id: <20210109123545.12001-6-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210109123545.12001-1-bmeng.cn@gmail.com>
References: <20210109123545.12001-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pg1-x535.google.com
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
index 609d4b658e..68a32b689e 100644
--- a/hw/ssi/imx_spi.c
+++ b/hw/ssi/imx_spi.c
@@ -187,7 +187,7 @@ static void imx_spi_flush_txfifo(IMXSPIState *s)
 
         DPRINTF("data tx:0x%08x\n", tx);
 
-        tx_burst = MIN(s->burst_length, 32);
+        tx_burst = (s->burst_length % 32) ? : 32;
 
         rx = 0;
 
-- 
2.25.1


