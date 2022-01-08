Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6551C488690
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Jan 2022 23:02:20 +0100 (CET)
Received: from localhost ([::1]:34980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6Jn1-0006b0-IQ
	for lists+qemu-devel@lfdr.de; Sat, 08 Jan 2022 17:02:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n6JjL-0002iy-BY; Sat, 08 Jan 2022 16:58:32 -0500
Received: from [2a00:1450:4864:20::42a] (port=46950
 helo=mail-wr1-x42a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n6JjJ-0002Sy-PD; Sat, 08 Jan 2022 16:58:31 -0500
Received: by mail-wr1-x42a.google.com with SMTP id l25so7799469wrb.13;
 Sat, 08 Jan 2022 13:58:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WeW5GAt608lg7IJIEIoHnKi4Rqvvxe15V5MIMCzbIdg=;
 b=fWLMP7oC3veazTecUwTADhbJy1xbudeKP9JFjBsaso61rI4dF+n48VqUxqq0HUnW9T
 zs0Me/YIG1MGQyprhkb8ScRAuZUKD40PHtYyxMn1s1E0R7ofPGhJNGxybVVh/4q9YWB1
 eeTnyzrQVsZCiQRH+/cq1+8Xkf8MO2tn9zn0upiXp3fLErqdMOZsLZbBLwW1/CzjY3In
 vrYayu8OTBrUwILNiFMcTDssTKwzgcJUL1235W2bO8x1BHjAuE/RVEvOI4jBbcvQVntM
 z0hSlxd2rrgjvW4AYk7WomEeNLRdeu1ygEfflDCXGag7noAhs5UEf9huNtC5qasrW5pV
 V+jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=WeW5GAt608lg7IJIEIoHnKi4Rqvvxe15V5MIMCzbIdg=;
 b=I169+QCSQ3HZ7FCkI2XG126oQ4f7D0FzlZgBepqdwF/f99rJcVSLIuhVXzqTQ0RIY8
 jeH6Q7iwRRxkXg90jmuZJlK+CteP1g34h2tgAFw/QpJgBGYszp2AXGG+NC15M0quur/R
 63kaSwjFIV4J3VYl0kMpWqgOxEzDVok5uPPRlWmPdBxJTKoaI97Yi0DoYj7MsuDP0d0g
 6obLo4ytT6WZ7f8qWPXGtivkPTyf+fynQNZH2dvunSEBkO8eM4M1FZ5OcmVF4jZCLuAb
 XFS4wpJcYjoz5/wsefwxKHysQFBT45jdjD/0U8TTbMYtffbIGQdYfCH9WO4Otjlv2gQr
 j6YA==
X-Gm-Message-State: AOAM533SwYPdGJ55/2nl8bg8tt2YW0vP++o5pQkCvSDdGz5aDZL+44Vf
 noNVVE2qAswKWb4CW1xhwtfl6ohTMJ4BIg==
X-Google-Smtp-Source: ABdhPJxRWlZ1dFGTxD2DXXfKp5xl9nIlwTZYX5d77cBHjZvE8jQP+kNCWcQJ6MOjoH/HvH8cv0TkNA==
X-Received: by 2002:a5d:6f09:: with SMTP id ay9mr15874197wrb.671.1641679107640; 
 Sat, 08 Jan 2022 13:58:27 -0800 (PST)
Received: from nuc.. (83.red-83-50-87.dynamicip.rima-tde.net. [83.50.87.83])
 by smtp.gmail.com with ESMTPSA id m5sm2405001wml.48.2022.01.08.13.58.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Jan 2022 13:58:27 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 2/2] hw/sd: Add SDHC support for SD card SPI-mode
Date: Sat,  8 Jan 2022 22:58:15 +0100
Message-Id: <20220108215815.551241-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220108215815.551241-1-f4bug@amsat.org>
References: <20220108215815.551241-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
index c10a1e469b7..cd67a7bac8e 100644
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


