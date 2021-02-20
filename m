Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFF93320231
	for <lists+qemu-devel@lfdr.de>; Sat, 20 Feb 2021 01:24:42 +0100 (CET)
Received: from localhost ([::1]:36086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDG4f-0007iS-So
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 19:24:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDFuI-0000u4-LT; Fri, 19 Feb 2021 19:13:58 -0500
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:43114)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDFuG-0005ap-8h; Fri, 19 Feb 2021 19:13:58 -0500
Received: by mail-ej1-x62a.google.com with SMTP id k13so15043399ejs.10;
 Fri, 19 Feb 2021 16:13:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5r9uQjDLFi6eLClRWOICufpqmGktPWbrOwAV+KCU7UQ=;
 b=jFyGipKfEkAY+qNILhK+Jyn4icVAI2JYBEKwE9bTp9U4iMje2z5/D2af0hnFhM4EaD
 C9vkFu40kdNzz4ft579mb4kzMxhmjnVzGsoQjABeJCdgtSzR0nvp8jN1FP8SHyDeovCl
 Q6axue5dhYMZ5y2100K9FO6+hkY54lkFfAKA3qltmdsxULUjdJOfYMSIl89FyPzSAM3b
 T6y/Cjalg+WE8ULSe3+MzmpqYPNtQY+vxH1eU8T+jRxGMa7d6gi4gflKQDKpuAdDNNAk
 thKXISIEyPA8huqQhN7yMFu6fBguEn/p7d9+ORLcptzt7SoMRDrlMnhRQ9+Wa/kdnpti
 +uLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=5r9uQjDLFi6eLClRWOICufpqmGktPWbrOwAV+KCU7UQ=;
 b=ctUfRITkpFFl5qUoDWGK7R+pyPX/ryZQKAKWGmzfgUTu3rw/U0kVwxzireQYxvd+BC
 wKgnkAzsMfwuBXJ9tineYN2PcvOXeMixtpuUbZRAW72K87A+xc5MkJJB5pWotW0erWxw
 AGK0ug2oeqpI7eZlX9g4lGfUkl0UfJjZj9quN8/42XfI7ooiFzzGSEq3pghctoHGYZGd
 pazxIkBMqtTtQ1MN/Ge5bCpoBgvLFN5xW4kqK5Rv8ezTdzlkWG5rZ2n4NZh3Z2hRikXS
 UZ4dNuuqIDwRfQrkmTiRv79s+CPHAKKpbC/ku3LApja57EZH1t/ddSNJo0TgK6GlrlD2
 dfTQ==
X-Gm-Message-State: AOAM531QFpswLzPXEuv+PguRJjJfcF1WiFP0+TfqGPXbB3BUhPQkTvfn
 Cd3j9uLYmhbddSX9ShVMyOMORkSbJjY=
X-Google-Smtp-Source: ABdhPJy46SGoUfvFAn7rDMoOmhEDDtH27zsPNiMiEsSSuhPUh2Yv3lZK3O1aSDZu8LQQbZZsf/ASew==
X-Received: by 2002:a17:906:5d15:: with SMTP id
 g21mr11358902ejt.373.1613780034488; 
 Fri, 19 Feb 2021 16:13:54 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id y29sm6410223edl.91.2021.02.19.16.13.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Feb 2021 16:13:53 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 08/18] hw/sd: ssi-sd: Fix STOP_TRANSMISSION (CMD12) response
Date: Sat, 20 Feb 2021 01:12:59 +0100
Message-Id: <20210220001309.2225022-9-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210220001309.2225022-1-f4bug@amsat.org>
References: <20210220001309.2225022-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x62a.google.com
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bin.meng@windriver.com>

CMD12's response type is R1b, which is basically a R1 plus optional
addition of the busy signal token that can be any number of bytes.
A zero value indicates card is busy and a non-zero value indicates
the card is ready for the next command.

Current implementation sends the busy signal token without sending
the R1 first. This does not break the U-Boot/Linux mmc_spi driver,
but it does not make the VxWorks driver happy.

Move the testing logic of s->stopping in the SSI_SD_RESPONSE state
a bit later, after the first byte of the card reponse is sent out,
to conform with the spec. After the busy signal token is sent, the
state should be transferred to SSI_SD_CMD.

Fixes: 775616c3ae8c ("Partial SD card SPI mode support")
Signed-off-by: Bin Meng <bin.meng@windriver.com>
Message-Id: <20210128063035.15674-9-bmeng.cn@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/sd/ssi-sd.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/hw/sd/ssi-sd.c b/hw/sd/ssi-sd.c
index 84c873b3fd4..907d681d19e 100644
--- a/hw/sd/ssi-sd.c
+++ b/hw/sd/ssi-sd.c
@@ -243,14 +243,15 @@ static uint32_t ssi_sd_transfer(SSIPeripheral *dev, uint32_t val)
         s->mode = SSI_SD_RESPONSE;
         return SSI_DUMMY;
     case SSI_SD_RESPONSE:
-        if (s->stopping) {
-            s->stopping = 0;
-            return SSI_DUMMY;
-        }
         if (s->response_pos < s->arglen) {
             DPRINTF("Response 0x%02x\n", s->response[s->response_pos]);
             return s->response[s->response_pos++];
         }
+        if (s->stopping) {
+            s->stopping = 0;
+            s->mode = SSI_SD_CMD;
+            return SSI_DUMMY;
+        }
         if (sdbus_data_ready(&s->sdbus)) {
             DPRINTF("Data read\n");
             s->mode = SSI_SD_DATA_START;
-- 
2.26.2


