Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8BBE480596
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Dec 2021 02:52:17 +0100 (CET)
Received: from localhost ([::1]:45158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n21ey-0007Bf-8S
	for lists+qemu-devel@lfdr.de; Mon, 27 Dec 2021 20:52:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1n21dq-00062x-Q8
 for qemu-devel@nongnu.org; Mon, 27 Dec 2021 20:51:06 -0500
Received: from [2607:f8b0:4864:20::1034] (port=50774
 helo=mail-pj1-x1034.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1n21dl-0001wP-Vd
 for qemu-devel@nongnu.org; Mon, 27 Dec 2021 20:51:06 -0500
Received: by mail-pj1-x1034.google.com with SMTP id gj24so14753110pjb.0
 for <qemu-devel@nongnu.org>; Mon, 27 Dec 2021 17:51:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mtvl/SxX5DdGmPPnCV2UPts69JiKbegpYHlKQm2ZoZY=;
 b=LcQ35BM7ujeZltCuUzxG2MODKriLZPse0W4bPnmD57TMc1QK+TE8B0xf8ha7FCd7wc
 aXGJuqWtkse/GFfOdSpZu78dQqlUnbpvjOyI4p21PX089ttsZ5Mngwux26SnuXBt68R8
 Zigz+Wr/fRnqAQ/s+MXeIHB184DfP5/MznWURTfRQHbWmQSXd5+W1KXpy3noFlXvwE4t
 AKvgCIQjLw1qeBpmB2OtGmFdKPSqiO/WQmdoJClC2fOaGnKhv4wcif7Bupi3N0tv+izr
 1ij8QFcm07RNicLxwo2bEnapWD/l/JLM+sKSYtHkETRhmPmXis/BFliN9+Q3V6gptqPz
 WNbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mtvl/SxX5DdGmPPnCV2UPts69JiKbegpYHlKQm2ZoZY=;
 b=ZQdgcuoEC3ak3Wei0DcLgrTi1cyYFCWh9yy1MI/OyvjbdBCxel8kG5s5HpR1tslelj
 3arZsR8+/vziJyy4Vpo8tW3780aHdjfLuIHTEWngwifAdNvhkZ3PP74+Z3ko94Md8/0T
 s5i9ErQ/oBiARy4q8mMYhy+VnlXX/Eibm3cM0FwQArUvzSj6LcYo1wSUp9cANKiPObz9
 k2n/Qx6T67fu2o3RNns3iF+sZP46lzjQNzIrD+Zl22Uucn7l74xRBmvczko9uSp7/Vng
 GGwIPgGlkxxn+XP3I8MDFxpmqKtaV2sQtbALZbOV+pazeIJh+gMU+9myneMRMoWfV/Vo
 bkhw==
X-Gm-Message-State: AOAM530iK0WRMk5VqkSCzcFA22rcsr63l0qZ+AS2aH3YedH2X4zgslq1
 RuZHHVa9qOZockAimPHaUVyZFiu+WAFhfek4NK4=
X-Google-Smtp-Source: ABdhPJwyUq1yjCcR9Xarjyo4kmr5MpkSzxJeu5jFj2jZzGjgFQPnNl7x3NgoGN8LdgpqOPhXkffy8Q==
X-Received: by 2002:a17:90a:2b03:: with SMTP id
 x3mr23683966pjc.28.1640656260372; 
 Mon, 27 Dec 2021 17:51:00 -0800 (PST)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id m3sm15222701pgj.25.2021.12.27.17.50.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Dec 2021 17:50:59 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Subject: [PATCH] hw/sd: Add SDHC support for SD card SPI-mode
Date: Tue, 28 Dec 2021 09:50:41 +0800
Message-Id: <20211228015055.8709-1-frank.chang@sifive.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1034
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
---
 hw/sd/sd.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index bb5dbff68c..9169208dbc 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -294,6 +294,18 @@ static void sd_set_ocr(SDState *sd)
 {
     /* All voltages OK */
     sd->ocr = R_OCR_VDD_VOLTAGE_WIN_HI_MASK;
+
+    if (sd->spi) {
+        /*
+         * We don't need to emulate power up sequence in SPI-mode.
+         * Thus, the card's power up status bit should be set to 1 when reset.
+         * The card's capacity status bit should also be set if SD card size
+         * is larger than 2GB for SDHC support.
+         */
+        sd->ocr = FIELD_DP32(sd->ocr, OCR, CARD_POWER_UP, 1);
+        sd->ocr = FIELD_DP32(sd->ocr, OCR, CARD_CAPACITY,
+                             sd->size > SDSC_MAX_CAPACITY);
+    }
 }
 
 static void sd_ocr_powerup(void *opaque)
@@ -560,6 +572,7 @@ static void sd_reset(DeviceState *dev)
 
     sd->state = sd_idle_state;
     sd->rca = 0x0000;
+    sd->size = size;
     sd_set_ocr(sd);
     sd_set_scr(sd);
     sd_set_cid(sd);
@@ -574,7 +587,6 @@ static void sd_reset(DeviceState *dev)
     memset(sd->function_group, 0, sizeof(sd->function_group));
     sd->erase_start = INVALID_ADDRESS;
     sd->erase_end = INVALID_ADDRESS;
-    sd->size = size;
     sd->blk_len = 0x200;
     sd->pwd_len = 0;
     sd->expecting_acmd = false;
-- 
2.31.1


