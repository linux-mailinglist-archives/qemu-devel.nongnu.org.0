Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BEE6E483E1C
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Jan 2022 09:30:02 +0100 (CET)
Received: from localhost ([::1]:38092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4fCj-0007Ui-RI
	for lists+qemu-devel@lfdr.de; Tue, 04 Jan 2022 03:30:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n4eeJ-0005xm-0O; Tue, 04 Jan 2022 02:54:27 -0500
Received: from [2a00:1450:4864:20::435] (port=42614
 helo=mail-wr1-x435.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n4eeH-0007Dg-EP; Tue, 04 Jan 2022 02:54:26 -0500
Received: by mail-wr1-x435.google.com with SMTP id w20so65386077wra.9;
 Mon, 03 Jan 2022 23:54:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Wd/Soq2H07h5BSMvthuGipUGkg5Y9nHl9X+h1GuA2BY=;
 b=Bw7i9dVjJFZHPlqWcIvp9Vxedw4D97BnbyJEC+8Wmr9HqKOacfuLfVywXdQYxEstfF
 1c4ApXpcEuztNJDZVmAbkxViFNgB57qh3Fa4B151xsrED40yEw4gjKQimfaMDdj8sVCB
 1u1/jwcR3Y6gz9JeK+nf5WPt3asuHxtloMWGL3hXWz8ubXzMIiOQkRn0gQuaanZkl0P8
 XhyOGDKSmGi3FpzSr8soh72e1d89Gt5cavYwb8hbZw8xXRye5Vb05v/uh5ADr8kHP/wS
 QfcERxeAa4A4SXCrswfjWM4FSoz9a/CE19B3NK1/ZZPYveAqVEavNEZYUVfI9zxt3z7B
 /a9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Wd/Soq2H07h5BSMvthuGipUGkg5Y9nHl9X+h1GuA2BY=;
 b=ukYM9IXIa9WPEM0cQMs5BJIJucRXG7A8qD7WJficzrznI8kOaygxbNQRqICmMXOJwX
 jJCGrVZloMGg96fjyBojq20pwInwyh5O8Fo8nTJUuSvYT9mRvBCdJU/yRfOF/Cnhnb4I
 9Kyu/kTdvTl5IWKGk6+5wpbYGx4E64eJJUsIB44XwPilAPjnYHORi7k5qgsDedFsBzoZ
 C+bTewHT0TAoBPF4c6XNcOFA3lpfGZBa02vpVQHABxWkyoyddRd9UHxwo83d0oqLN/ac
 41g9O0d5pS6aVfXJbx5LgaBdU4QRQSVQ7WDyB2LInex3WDu1rKJwOVE4I+rJs55ZNJE1
 D+hw==
X-Gm-Message-State: AOAM531GDPvWYHFrwzUGP97JpcPPeMgHCjL89Qzr5/0dr3OREeCk9fsp
 xM6+rvQP+pTioX3slEle4/HnDfFIAbHUzg==
X-Google-Smtp-Source: ABdhPJzmcC/QKRkJql+EPxuMU0Jio+JBx9MUrN8fYMMUDMmNqRbn/ToLDlkMyzV2C8ZmOw9CQfok2w==
X-Received: by 2002:adf:f48e:: with SMTP id l14mr41835621wro.88.1641282863763; 
 Mon, 03 Jan 2022 23:54:23 -0800 (PST)
Received: from x1w.. (26.red-83-50-86.dynamicip.rima-tde.net. [83.50.86.26])
 by smtp.gmail.com with ESMTPSA id f10sm16295181wmq.16.2022.01.03.23.54.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Jan 2022 23:54:23 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 2/2] hw/sd: Add SDHC support for SD card SPI-mode
Date: Tue,  4 Jan 2022 08:54:12 +0100
Message-Id: <20220104075412.2088859-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220104075412.2088859-1-f4bug@amsat.org>
References: <20220104075412.2088859-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::435
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x435.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_NONE=-0.0001,
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
Cc: Frank Chang <frank.chang@sifive.com>, Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-block@nongnu.org, Jim Shu <jim.shu@sifive.com>
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
Message-Id: <20211228125719.14712-1-frank.chang@sifive.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/sd/sd.c | 24 +++++++++++++++++-------
 1 file changed, 17 insertions(+), 7 deletions(-)

diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index 0bb99352cc1..551d03cf5ec 100644
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
2.33.1


