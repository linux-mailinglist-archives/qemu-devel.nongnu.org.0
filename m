Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFBDD301EBB
	for <lists+qemu-devel@lfdr.de>; Sun, 24 Jan 2021 21:34:02 +0100 (CET)
Received: from localhost ([::1]:50346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l3m5B-0005Jl-Qd
	for lists+qemu-devel@lfdr.de; Sun, 24 Jan 2021 15:34:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l3m0E-0000pC-L6; Sun, 24 Jan 2021 15:28:55 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:34607)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l3m0C-0005WE-Sd; Sun, 24 Jan 2021 15:28:54 -0500
Received: by mail-wr1-x430.google.com with SMTP id g10so10273978wrx.1;
 Sun, 24 Jan 2021 12:28:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yP26PpmJagN4jG84JFkSeSaPQBLeLAiKLXm9b3ACybs=;
 b=tzfBvAz3pQDVChvcJBMR9Tu7opB3A18s0lrsBHzAhJYQfarIP+3WR48SoxU+DisNSb
 ZCSipGtobD7ux00IfeoE47MRqMANSe/aYGK+J3J4caclgOYGBccHXrkAG9lmelQwghwB
 2vEs2ZftuA9uq6bl0ZDfPNfN+LaiFQAD1fO8nk5RiSqiZNh0HPregZJWVvhphVv5JSaF
 1bk79ygHWtAGyEH7XlJAJaWlZKjq+7HIVrK9z9LtE72AnoW2AmhuXcoflSqHHqUTpTQb
 thEYIrQIF6SjPLW3CbMbvSmajIsdGcjEWWJipM8anKfHEFX0YvwPTYOyZ2jfETmvEyEF
 260A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=yP26PpmJagN4jG84JFkSeSaPQBLeLAiKLXm9b3ACybs=;
 b=pURvnKytHlUj99eWDxM8JVgBaKf7U2srQJun2qZ4w9ni/B7KXuo3xCuN6VhzgaYrlW
 goVIf89z7zwdZ5haMtkChYunHYAb8t23OXRt2r0s0OpPGRv3GVTkTw5pHmGuzMvCzAev
 arh5DzPy6Fd0UnCwJTGtLKTV37AVtXsBWgy9jd0/IFVu52Da2xddWon3XlYTmFyA/8me
 m0rhKrz4IPOPoi1QHDb8Er/MJp+fVoyhsESw0NmzqKOkNF4+3MjxE+3Mo3E7H9/n5IJ5
 2DwTVYLAkkF5xVrcykxV9+yrn/MZXjLjojjZLytg1vUscbF+RXabz0tBobZEIef+lnoc
 QMKg==
X-Gm-Message-State: AOAM530v7q32MsPSTvdcpNPbpljDkjb95tHQ2nnEq/ennNjR6Ey7dVlM
 5vXvJs0KMrEQPyTmdK7cBVNBBhiOxOE=
X-Google-Smtp-Source: ABdhPJyG17Ye37egAn5Gd5CN8XCVreyrg9hI35tuKX/AIuPVCj7/iZ/Gxw7RaNreThRKkyllUkHIeg==
X-Received: by 2002:adf:eb05:: with SMTP id s5mr233869wrn.333.1611520130636;
 Sun, 24 Jan 2021 12:28:50 -0800 (PST)
Received: from localhost.localdomain (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id y14sm714198wro.58.2021.01.24.12.28.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Jan 2021 12:28:50 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org,
	Bin Meng <bmeng.cn@gmail.com>
Subject: [PATCH v3 6/6] hw/sd: ssi-sd: Support multiple block write
Date: Sun, 24 Jan 2021 21:28:17 +0100
Message-Id: <20210124202817.2624557-7-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210124202817.2624557-1-f4bug@amsat.org>
References: <20210124202817.2624557-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x430.google.com
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
 Bin Meng <bin.meng@windriver.com>, Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bin.meng@windriver.com>

For a multiple block write operation, each block begins with a multi
write start token. Unlike the SD mode that the multiple block write
ends when receiving a STOP_TRAN command (CMD12), a special stop tran
token is used to signal the card.

Emulating this by manually sending a CMD12 to the SD card core, to
bring it out of the receiving data state.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20210123104016.17485-18-bmeng.cn@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/sd/ssi-sd.c | 35 +++++++++++++++++++++++++++++++++--
 1 file changed, 33 insertions(+), 2 deletions(-)

diff --git a/hw/sd/ssi-sd.c b/hw/sd/ssi-sd.c
index 1205ad8b52c..2d08ce4820a 100644
--- a/hw/sd/ssi-sd.c
+++ b/hw/sd/ssi-sd.c
@@ -4,6 +4,11 @@
  * Copyright (c) 2007-2009 CodeSourcery.
  * Written by Paul Brook
  *
+ * Copyright (c) 2021 Wind River Systems, Inc.
+ * Improved by Bin Meng <bin.meng@windriver.com>
+ *
+ * Validated with U-Boot v2021.01 and Linux v5.10 mmc_spi driver
+ *
  * This code is licensed under the GNU GPL v2.
  *
  * Contributions after 2012-01-13 are licensed under the terms of the
@@ -82,6 +87,10 @@ OBJECT_DECLARE_SIMPLE_TYPE(ssi_sd_state, SSI_SD)
 #define SSI_SDR_ADDRESS_ERROR   0x2000
 #define SSI_SDR_PARAMETER_ERROR 0x4000
 
+/* multiple block write */
+#define SSI_TOKEN_MULTI_WRITE   0xfc
+/* terminate multiple block write */
+#define SSI_TOKEN_STOP_TRAN     0xfd
 /* single block read/write, multiple block read */
 #define SSI_TOKEN_SINGLE        0xfe
 
@@ -94,6 +103,8 @@ OBJECT_DECLARE_SIMPLE_TYPE(ssi_sd_state, SSI_SD)
 static uint32_t ssi_sd_transfer(SSIPeripheral *dev, uint32_t val)
 {
     ssi_sd_state *s = SSI_SD(dev);
+    SDRequest request;
+    uint8_t longresp[16];
 
     /*
      * Special case: allow CMD12 (STOP TRANSMISSION) while reading data.
@@ -125,9 +136,31 @@ static uint32_t ssi_sd_transfer(SSIPeripheral *dev, uint32_t val)
             return SSI_DUMMY;
             break;
         case SSI_TOKEN_SINGLE:
+        case SSI_TOKEN_MULTI_WRITE:
             DPRINTF("Start write block\n");
             s->mode = SSI_SD_DATA_WRITE;
             return SSI_DUMMY;
+        case SSI_TOKEN_STOP_TRAN:
+            DPRINTF("Stop multiple write\n");
+
+            /* manually issue cmd12 to stop the transfer */
+            request.cmd = 12;
+            request.arg = 0;
+            s->arglen = sdbus_do_command(&s->sdbus, &request, longresp);
+            if (s->arglen <= 0) {
+                s->arglen = 1;
+                /* a zero value indicates the card is busy */
+                s->response[0] = 0;
+                DPRINTF("SD card busy\n");
+            } else {
+                s->arglen = 1;
+                /* a non-zero value indicates the card is ready */
+                s->response[0] = SSI_DUMMY;
+            }
+
+            s->mode = SSI_SD_RESPONSE;
+            s->response_pos = 0;
+            return SSI_DUMMY;
         }
 
         s->cmd = val & 0x3f;
@@ -136,8 +169,6 @@ static uint32_t ssi_sd_transfer(SSIPeripheral *dev, uint32_t val)
         return SSI_DUMMY;
     case SSI_SD_CMDARG:
         if (s->arglen == 4) {
-            SDRequest request;
-            uint8_t longresp[16];
             /* FIXME: Check CRC.  */
             request.cmd = s->cmd;
             request.arg = ldl_be_p(s->cmdarg);
-- 
2.26.2


