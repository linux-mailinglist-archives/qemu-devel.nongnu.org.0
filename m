Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18CA8480955
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Dec 2021 13:59:13 +0100 (CET)
Received: from localhost ([::1]:43870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n2C4N-0005jC-Tg
	for lists+qemu-devel@lfdr.de; Tue, 28 Dec 2021 07:59:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1n2C2l-00049D-MW
 for qemu-devel@nongnu.org; Tue, 28 Dec 2021 07:57:31 -0500
Received: from [2607:f8b0:4864:20::432] (port=44868
 helo=mail-pf1-x432.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1n2C2j-0004cp-7q
 for qemu-devel@nongnu.org; Tue, 28 Dec 2021 07:57:30 -0500
Received: by mail-pf1-x432.google.com with SMTP id t187so2624445pfb.11
 for <qemu-devel@nongnu.org>; Tue, 28 Dec 2021 04:57:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NstPAxvrciGkKx8GpMRdOfSRQQ4m+OEaC0ZI75Ux6H0=;
 b=aZBOwBk1yRZ3uJ8bWXtLZPiQrA8KWcesykoRZEXxizshezRs5cuUDD3Rtj0xS3PdVn
 Zl7EBTmVsg6UNVNma/j9aSVp/AE+La6wp4eLeqwzt/ouVg6r6Wyi1mmlJyYdDGzGmx8k
 FZ6NJh4sUrjfxsR3Z6yNFuy9OLcJ2Zo/tylUUciNeKxlJ5fJLkIQF0pImqj2dnvQCAyK
 P/iQzOTRZV4vbpmhszlxgMBgvgw3yzyJUJIAoQDJT1hLfkgz8kPMwVD3ck2eppRj6jvy
 AzRFxmF0qltyK4Hu8FlWMNnkGYq5w1n0m64UJs/2nWqtj8IKfDtfSKqupGT6U5MgGkT0
 SOGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NstPAxvrciGkKx8GpMRdOfSRQQ4m+OEaC0ZI75Ux6H0=;
 b=apeJfzODGn23ZUI3BL0ieDpTjzV7D6c4BHZCrUdwiaMkpO4JymSi9Ef+hOzsmfCpy0
 TPDMInMOGdWysyYmvkHqs7Rdd+SAsDP0sibGCyYmNQmHJ0d7TtQfbgiVuDTS1o5UD6/z
 c53ub4t2QgYrhYlYxFC73a3EVCy9CHezjcWhPP4j/m8ffNX5PeOFr7i8UmV029oTpfTc
 +3qsONfBrEW+O6GUKVqQD/+OzZiXpuv74hzAd4eHsO5E9+/PUMjJ8kbDf8zDiSlOQ483
 d6YkkWs8/Ib7SQQjFSINjDvRQ21vrn3d6lPNMJkoGjrZ7OOO2swTlMsxrLQHKEHuG2xs
 XyUQ==
X-Gm-Message-State: AOAM531E4ha5LNLpl5tkU48mBn/YqFmKenrQCCzROhc5KX+cRIH09rmp
 2qFLnVJtXHEyZk4Qgf5NeXmqm78DzIpDQZPJ
X-Google-Smtp-Source: ABdhPJxHgby7eRKqSupd9Hh2bRjd0mCop3qfFDlZjMjy5KioxKiNHl39fRjgNr5NWsR59+FMX7SMJg==
X-Received: by 2002:a63:8f02:: with SMTP id n2mr20000035pgd.270.1640696244878; 
 Tue, 28 Dec 2021 04:57:24 -0800 (PST)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id c11sm18817782pfv.85.2021.12.28.04.57.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Dec 2021 04:57:24 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Subject: [PATCH v2] hw/sd: Add SDHC support for SD card SPI-mode
Date: Tue, 28 Dec 2021 20:57:17 +0800
Message-Id: <20211228125719.14712-1-frank.chang@sifive.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::432
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x432.google.com
X-Spam_score_int: 6
X-Spam_score: 0.6
X-Spam_bar: /
X-Spam_report: (0.6 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-block@nongnu.org,
 Frank Chang <frank.chang@sifive.com>, Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Jim Shu <jim.shu@sifive.com>, Alexander Bulekov <alxndr@bu.edu>,
 Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Frank Chang <frank.chang@sifive.com>

In SPI-mode, SD card's OCR register: Card Capacity Status (CCS) bit
is not set to 1 correclty when the assigned SD image size is larger
than 2GB (SDHC). This will cause the SD card to be indentified as SDSC
incorrectly. CCS bit should be set to 1 if we are using SDHC.

Also, as there's no power up emulation in SPI-mode.
The OCR register: Card power up status bit bit (busy) should also
be set to 1 when reset. (busy bit is set to LOW if the card has not
finished the power up routine.)

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Jim Shu <jim.shu@sifive.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/sd/sd.c | 24 +++++++++++++++++-------
 1 file changed, 17 insertions(+), 7 deletions(-)

diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index bb5dbff68c..3da5e3dada 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -290,12 +290,6 @@ FIELD(OCR, CARD_POWER_UP,              31,  1)
                                | R_OCR_CARD_CAPACITY_MASK \
                                | R_OCR_CARD_POWER_UP_MASK)
 
-static void sd_set_ocr(SDState *sd)
-{
-    /* All voltages OK */
-    sd->ocr = R_OCR_VDD_VOLTAGE_WIN_HI_MASK;
-}
-
 static void sd_ocr_powerup(void *opaque)
 {
     SDState *sd = opaque;
@@ -311,6 +305,22 @@ static void sd_ocr_powerup(void *opaque)
     }
 }
 
+static void sd_set_ocr(SDState *sd)
+{
+    /* All voltages OK */
+    sd->ocr = R_OCR_VDD_VOLTAGE_WIN_HI_MASK;
+
+    if (sd->spi) {
+        /*
+         * We don't need to emulate power up sequence in SPI-mode.
+         * Thus, the card's power up status bit should be set to 1 when reset.
+         * The card's capacity status bit should also be set if SD card size
+         * is larger than 2GB for SDHC support.
+         */
+        sd_ocr_powerup(sd);
+    }
+}
+
 static void sd_set_scr(SDState *sd)
 {
     sd->scr[0] = 0 << 4;        /* SCR structure version 1.0 */
@@ -560,6 +570,7 @@ static void sd_reset(DeviceState *dev)
 
     sd->state = sd_idle_state;
     sd->rca = 0x0000;
+    sd->size = size;
     sd_set_ocr(sd);
     sd_set_scr(sd);
     sd_set_cid(sd);
@@ -574,7 +585,6 @@ static void sd_reset(DeviceState *dev)
     memset(sd->function_group, 0, sizeof(sd->function_group));
     sd->erase_start = INVALID_ADDRESS;
     sd->erase_end = INVALID_ADDRESS;
-    sd->size = size;
     sd->blk_len = 0x200;
     sd->pwd_len = 0;
     sd->expecting_acmd = false;
-- 
2.31.1


