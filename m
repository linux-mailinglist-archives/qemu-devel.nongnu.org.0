Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 875B8301EAD
	for <lists+qemu-devel@lfdr.de>; Sun, 24 Jan 2021 21:18:33 +0100 (CET)
Received: from localhost ([::1]:50472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l3lqC-0001FH-Jc
	for lists+qemu-devel@lfdr.de; Sun, 24 Jan 2021 15:18:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l3ljK-0002Xm-Ne; Sun, 24 Jan 2021 15:11:26 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:35508)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l3ljJ-00083q-9n; Sun, 24 Jan 2021 15:11:26 -0500
Received: by mail-wr1-x436.google.com with SMTP id l12so10238570wry.2;
 Sun, 24 Jan 2021 12:11:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VaQ5twrurTPnPi9Fu8ehy5XYvFMSYl2eaKK3OA9dOLE=;
 b=VotrvCaVY1nO/qImuEdyN8sNzV46/GK4m2g5eWQaMuoOIshCWlBIjJOUio2R15Et4R
 /ZSbnGGyf7nqA/HENa7zcZLUzMMG2EZ47k1q6ui8lX4j/1zWy63UtUIGdYPAxSQrqxXR
 kTbHcqel0LDBBKbYmmep61ceB2pCuBE/riaKZSc9F6L20KcXYzpwHzhl2Lvews0Kdf65
 2FyGCaT40+Zu9b6wjwYg1tfJF2RIvU+4A4a8cjA27bFJU5QsQnTw2pQRoByPgo/VGYUT
 vPtRctsHvIQOFyrc1qdJH6/nplogfir+GKIK2lnZJf2BlpznWps7IFUW1W/l53KCWVEP
 FL8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=VaQ5twrurTPnPi9Fu8ehy5XYvFMSYl2eaKK3OA9dOLE=;
 b=E2WmjHDVHry34ItRZzrlxeIw4xKQErXB+US6g9ZZ3+OlNz3imRw5VWV6oT0fp575RP
 MVx2Hh5posXbkuHEjedYApwMx0U06XIfpt3f1iKq2RvQG7hSG0oOo2BvQuwdWAdRrPYD
 lhpOjri/6IHVbI9PjxcabZMol4cv/ARTsop8x7kJbdsGmJs7Ce8Ho6Cru4xjqfh/meBq
 ESc3nNKSac8c6sQ2ltdfHeR3RRzB3W3pboNeEVIYylLAA/9hWBe200XeyMrgHHKKJdLR
 ti0yvi98LxRJ9tDhgj750rYGRbxxlykij1ggrEQKlQV/0j5gDONszHG6hX6NTsFbyWRu
 Dw6A==
X-Gm-Message-State: AOAM5308vell/OD3QlRwY41eC+PyTdzO8x79CoF4RruV670xAogVPDCC
 TLY9J1IjNJyG+NlOsVmU1I0WKoCFYms=
X-Google-Smtp-Source: ABdhPJwq+nPbsuAmf2eBrRSkLaLd+MeKb1HNrdMx4kUyQ4VQGab5Tl2pO9SzlngVRh34OmXH6t2HhA==
X-Received: by 2002:a05:6000:104d:: with SMTP id
 c13mr3955122wrx.127.1611519083459; 
 Sun, 24 Jan 2021 12:11:23 -0800 (PST)
Received: from localhost.localdomain (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id o14sm19769800wri.48.2021.01.24.12.11.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Jan 2021 12:11:22 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 3/9] hw/sd: sd: Drop sd_crc16()
Date: Sun, 24 Jan 2021 21:11:00 +0100
Message-Id: <20210124201106.2602238-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210124201106.2602238-1-f4bug@amsat.org>
References: <20210124201106.2602238-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x436.google.com
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
Cc: Pragnesh Patel <pragnesh.patel@sifive.com>,
 Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bin.meng@windriver.com>

commit f6fb1f9b319f ("sdcard: Correct CRC16 offset in sd_function_switch()")
changed the 16-bit CRC to be stored at offset 64. In fact, this CRC
calculation is completely wrong. From the original codes, it wants
to calculate the CRC16 of the first 64 bytes of sd->data[], however
passing 64 as the `width` to sd_crc16() actually counts 256 bytes
starting from the `message` for the CRC16 calculation, which is not
what we want.

Besides that, it seems existing sd_crc16() algorithm does not match
the SD spec, which says CRC16 is the CCITT one but the calculation
does not produce expected result. It turns out the CRC16 was never
transferred outside the sd core, as in sd_read_byte() we see:

    if (sd->data_offset >= 64)
        sd->state = sd_transfer_state;

Given above reasons, let's drop it.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Tested-by: Pragnesh Patel <pragnesh.patel@sifive.com>
Reviewed-by: Pragnesh Patel <pragnesh.patel@sifive.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210123104016.17485-6-bmeng.cn@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/sd/sd.c | 18 ------------------
 1 file changed, 18 deletions(-)

diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index bfea5547d53..b3952514fed 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -271,23 +271,6 @@ static uint8_t sd_crc7(const void *message, size_t width)
     return shift_reg;
 }
 
-static uint16_t sd_crc16(const void *message, size_t width)
-{
-    int i, bit;
-    uint16_t shift_reg = 0x0000;
-    const uint16_t *msg = (const uint16_t *)message;
-    width <<= 1;
-
-    for (i = 0; i < width; i ++, msg ++)
-        for (bit = 15; bit >= 0; bit --) {
-            shift_reg <<= 1;
-            if ((shift_reg >> 15) ^ ((*msg >> bit) & 1))
-                shift_reg ^= 0x1011;
-        }
-
-    return shift_reg;
-}
-
 #define OCR_POWER_DELAY_NS      500000 /* 0.5ms */
 
 FIELD(OCR, VDD_VOLTAGE_WINDOW,          0, 24)
@@ -843,7 +826,6 @@ static void sd_function_switch(SDState *sd, uint32_t arg)
         sd->data[16 - (i >> 1)] |= new_func << ((i % 2) * 4);
     }
     memset(&sd->data[17], 0, 47);
-    stw_be_p(sd->data + 64, sd_crc16(sd->data, 64));
 }
 
 static inline bool sd_wp_addr(SDState *sd, uint64_t addr)
-- 
2.26.2


