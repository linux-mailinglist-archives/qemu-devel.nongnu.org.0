Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71E34301EBA
	for <lists+qemu-devel@lfdr.de>; Sun, 24 Jan 2021 21:33:44 +0100 (CET)
Received: from localhost ([::1]:49390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l3m4t-0004vs-HG
	for lists+qemu-devel@lfdr.de; Sun, 24 Jan 2021 15:33:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l3lzu-0000TI-0K; Sun, 24 Jan 2021 15:28:34 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:39835)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l3lzs-0005O4-G3; Sun, 24 Jan 2021 15:28:33 -0500
Received: by mail-wm1-x336.google.com with SMTP id u14so8969787wmq.4;
 Sun, 24 Jan 2021 12:28:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+5slmPoo61HxnQOohyNLZo6tnq7nkp2gmI544rH0wak=;
 b=G0PMksLv/UF/DrQ2Nzr/t0B/F0/GOCnhUkl+hRL5qWjuaUnCn1BSMFbxTx6uAnI0b3
 E5eysODPudhVQR/Q0nQn4w8GGQvmbd4Xg4ZfjeGshZwf8njLd4JSxWZjZnW/ew4ObfoQ
 V8isKwu0I0QS6XU+oZykL+0Q3hVKnwsx0hGulb7WPEHL0pxZe9bhneKSArdNfMFjxtnX
 6JEQQLTsfTY5aRPWrIvak9gjhxQ/bAPvKExvjitTK1XzG69jfWBAovtrizqMZp9k8cMO
 FOtPzAfZmBzqEJhnDHWQiZe9RDNwrkMT0fI9m5oE2+2f8L9xG4PjQkzXCNp3LZLb4uZA
 8hTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=+5slmPoo61HxnQOohyNLZo6tnq7nkp2gmI544rH0wak=;
 b=ckfDA9FBy/XGZyRqsmGgWoAFVPZhPtzwlqp1ueFKVvNCIbEHR7buj6wwIC3xHed+pe
 uTHwkswHN6brRHjagsh5HULjjWnxw5HSmIz9DNw9Ze/+/1u7ZJ6CDmxgxDROZbqM/BkS
 5otDS9a0XcYiaXD9PIdYLUjP3uB3Z4qQAnw4eCQ3wDI7AIWm6UoHc9iYzt7fiIr5E4tk
 FsuC5xGmOfzvka6sWRPaEq5hFyei19QSzwakjseWXxYmCRqcTpUN2Zruy3biFzKfH+4V
 FzJLodE09O6VLLhu1ZaGcJj1EbU7b8/Vy5mB6+99GZ8fHe3kZMCFJ/EfSlQJm1BXNQ3v
 ULsg==
X-Gm-Message-State: AOAM531p2D61iLXXNDV9DNXNq9Dd2mW+fr7v7ORu7MDxEolWPGT78Asp
 8Pyy27qgO8zEmH3Xk+TvWW2ljkQ/8I0=
X-Google-Smtp-Source: ABdhPJz1Imu5jsf0SZ6Wv+aSNBAdTv98YqAWtTVwatJcYhn84//PfW78ar2P0a3qnT9NdvtZdwTbDA==
X-Received: by 2002:a1c:a716:: with SMTP id q22mr2827044wme.143.1611520110581; 
 Sun, 24 Jan 2021 12:28:30 -0800 (PST)
Received: from localhost.localdomain (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id n125sm2786075wmf.30.2021.01.24.12.28.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Jan 2021 12:28:29 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org,
	Bin Meng <bmeng.cn@gmail.com>
Subject: [PATCH v3 2/6] hw/sd: sd: Remove duplicated codes in single/multiple
 block read/write
Date: Sun, 24 Jan 2021 21:28:13 +0100
Message-Id: <20210124202817.2624557-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210124202817.2624557-1-f4bug@amsat.org>
References: <20210124202817.2624557-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x336.google.com
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

The single block read (CMD17) codes are the same as the multiple
block read (CMD18). Merge them into one. The same applies to single
block write (CMD24) and multiple block write (CMD25).

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20210123104016.17485-13-bmeng.cn@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/sd/sd.c | 47 -----------------------------------------------
 1 file changed, 47 deletions(-)

diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index b3952514fed..09753359bb2 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -1181,24 +1181,6 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
         break;
 
     case 17:	/* CMD17:  READ_SINGLE_BLOCK */
-        switch (sd->state) {
-        case sd_transfer_state:
-
-            if (addr + sd->blk_len > sd->size) {
-                sd->card_status |= ADDRESS_ERROR;
-                return sd_r1;
-            }
-
-            sd->state = sd_sendingdata_state;
-            sd->data_start = addr;
-            sd->data_offset = 0;
-            return sd_r1;
-
-        default:
-            break;
-        }
-        break;
-
     case 18:	/* CMD18:  READ_MULTIPLE_BLOCK */
         switch (sd->state) {
         case sd_transfer_state:
@@ -1245,35 +1227,6 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
 
     /* Block write commands (Class 4) */
     case 24:	/* CMD24:  WRITE_SINGLE_BLOCK */
-        switch (sd->state) {
-        case sd_transfer_state:
-            /* Writing in SPI mode not implemented.  */
-            if (sd->spi)
-                break;
-
-            if (addr + sd->blk_len > sd->size) {
-                sd->card_status |= ADDRESS_ERROR;
-                return sd_r1;
-            }
-
-            sd->state = sd_receivingdata_state;
-            sd->data_start = addr;
-            sd->data_offset = 0;
-            sd->blk_written = 0;
-
-            if (sd_wp_addr(sd, sd->data_start)) {
-                sd->card_status |= WP_VIOLATION;
-            }
-            if (sd->csd[14] & 0x30) {
-                sd->card_status |= WP_VIOLATION;
-            }
-            return sd_r1;
-
-        default:
-            break;
-        }
-        break;
-
     case 25:	/* CMD25:  WRITE_MULTIPLE_BLOCK */
         switch (sd->state) {
         case sd_transfer_state:
-- 
2.26.2


