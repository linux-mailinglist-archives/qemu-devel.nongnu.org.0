Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB9E332021F
	for <lists+qemu-devel@lfdr.de>; Sat, 20 Feb 2021 01:15:23 +0100 (CET)
Received: from localhost ([::1]:58858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDFve-0002M4-P0
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 19:15:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDFtm-0000PL-8F; Fri, 19 Feb 2021 19:13:26 -0500
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:39474)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDFtk-0005MP-Jz; Fri, 19 Feb 2021 19:13:25 -0500
Received: by mail-ej1-x633.google.com with SMTP id t11so16887586ejx.6;
 Fri, 19 Feb 2021 16:13:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nrlOa5uEAXGuJkLltzQnPowCn7sKixIFglrfWbQ5DbM=;
 b=QAD6ACOIlM/KBAnKRsx6IA7sa+qDc0jKWXbKf7a1gioSTHTybKlQZwcPkc3h7AZqPE
 YMifDlRa9c1DTp0h2mQgtC8eQ1lnPbRx3qP96dz6OgwfdxJ/8kK1MaD2oEIb69G6eH1f
 n6Eu4JlWuDrDFCzMBqrGkMdKzaRq92+M2Dg9GWnstVRLMS2MOCdxPf32iOnX7w3zuG/W
 WI65/1hzEgAb6zKbCp78wNPuCc4ep2wH8CZ5FRrowWZOOkSr3ZD1uUmJZWsmN9Sqc2t5
 4N9lWfCW1qKY7HD40OpgV0oaq71ifIXvOBbELaPXkHGAggPg1saZRCP+HArsk2YmKBJP
 JroQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=nrlOa5uEAXGuJkLltzQnPowCn7sKixIFglrfWbQ5DbM=;
 b=Cg8h64Z2MVswUjMaK5TK9mJBrBGy2Vxn8TUbs9I/Jk6Bgswb1B0B1OYmF/P/EK88de
 LHEzxAPyGkoaR8pXFd2JzmJVYUOW/1cX2gZ+C8t8kbkda2TPgFGDUzGv5rmZPva0RD7d
 djvEhRj8VjB0vBQ6n6CCb39KS5D/7BYNgqISm4deBhDvw2T+S7Hr7THkJ0VSbrQUijeY
 TS+0ZZ+LhVZBND8TgXNFK+eBS97qUOZDRSwSmoj8BsZsARTZI0lS+s7Zq2ACW1k5cd2v
 VeRcLsQBXuqj5CWi3SkdnOsAuVXYUE3vEMug5x8yMU9NUnTRRKh+cWFW6Ri14bLkvXed
 Ko3w==
X-Gm-Message-State: AOAM530loVP+hpRxnX1T4tlvIwbilLppqnmupFHCjOZYSjG8g3ED9J1P
 Xude9q45sTodmcbS0DQiISUsVSqoCgA=
X-Google-Smtp-Source: ABdhPJw3VH+7yNQ6NrAnDw7jATmQ3stVlfUY7cC4HbKWONnshGWdjfJLz5KWx+6bKc3eMjq6gghFKw==
X-Received: by 2002:a17:906:4f96:: with SMTP id
 o22mr10634328eju.511.1613780002800; 
 Fri, 19 Feb 2021 16:13:22 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id t19sm5303919ejc.62.2021.02.19.16.13.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Feb 2021 16:13:22 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 02/18] hw/sd: sd: Remove duplicated codes in single/multiple
 block read/write
Date: Sat, 20 Feb 2021 01:12:53 +0100
Message-Id: <20210220001309.2225022-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210220001309.2225022-1-f4bug@amsat.org>
References: <20210220001309.2225022-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x633.google.com
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
Cc: Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bin.meng@windriver.com>

The single block read (CMD17) codes are the same as the multiple
block read (CMD18). Merge them into one. The same applies to single
block write (CMD24) and multiple block write (CMD25).

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20210128063035.15674-3-bmeng.cn@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/sd/sd.c | 47 -----------------------------------------------
 1 file changed, 47 deletions(-)

diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index 8517dbce8ba..a85a821abbe 100644
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


