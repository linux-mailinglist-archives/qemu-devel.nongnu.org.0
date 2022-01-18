Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ED3849173C
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 03:38:51 +0100 (CET)
Received: from localhost ([::1]:57332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9eOY-0006lA-Cg
	for lists+qemu-devel@lfdr.de; Mon, 17 Jan 2022 21:38:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1n9eL9-0005ml-Vo
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 21:35:20 -0500
Received: from [2607:f8b0:4864:20::52e] (port=36674
 helo=mail-pg1-x52e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1n9eL7-0005pT-FW
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 21:35:19 -0500
Received: by mail-pg1-x52e.google.com with SMTP id e9so2042080pgb.3
 for <qemu-devel@nongnu.org>; Mon, 17 Jan 2022 18:35:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9VA+CPBaVlIXQJIjd2n3KCqK1vK4vBHKaZ5Iduz6fOo=;
 b=dqM5mBfGw3+SJnu4Znq/dEl9cBFj5MR/VoslvxINMAHhz3B0n4K+j5H3oTMPtT0CXr
 hr23Sqgt+tS6dAdueiLBrhvUm4HLhYm14cZTwpv6okMWbH2xQCszftUdJBV44RhUzKZF
 GmARhip8+jrpkLsfWbYHWdVD/JklVfPTPxXdY9w8JAiTqAQvEmcvjKo+icAef8uYZoi/
 SZaZLYTfbsL4Y2TXKEcg6ftFzsVXrKK0Eg07DKz1ir6ttEAIOSIMK7b4LrSDhIB2yHYq
 b/J8lmUtGv+J4lvotUqH2Cifu84Rsz9jkc46qrelt87tDLZqa5iZXjWtiyvdQS8cfoE8
 S4mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9VA+CPBaVlIXQJIjd2n3KCqK1vK4vBHKaZ5Iduz6fOo=;
 b=GQPOs53oqqxMpTuFs17gnFkGZvtfwUZ6kIw/tXPTJy5Gd7gwuYxX0n/0g+0immoqP5
 og1C1LrLjfxKUN+zYS7eZ3N4x9aWNUWn0ZSjyWg0mFDrvEIS8BZTOt7eCtAXTD3JLJsw
 dJTGPxcoIc2nzwcThsjgKKi2QhGwOOna8e95lmTOoJdBqszHaZaUzaRd9VWjhQaxH5hk
 /4zZBMMX2IxqFfCpmwZbtDHsL249Ksb2in1XloUHlw9QVpwSiWR/DN3DUArvuKub4DZd
 X1fS19Hl5WQ+EPApSLulkxeipbayc1LrKkV99VmbhDkP6Lcpwg6LjYYjJhyaGBEFV2/a
 6fWA==
X-Gm-Message-State: AOAM530it5FVcBjK3XpFgnDsgVJ5IX1ty/GuyVgw+9MIrd/MFQe3yKEZ
 SUy27ZRaCNTxeNwMs9ybOSimZl8526pth54l
X-Google-Smtp-Source: ABdhPJwFTNMq7vuFHJ2SUvWxqf/wyqp6HaxE3DUlLGEcvlVJPidD4BYrpfDoXqiwPyfH7CrS3/EgmA==
X-Received: by 2002:a05:6a00:a20:b0:4bb:95f6:93b3 with SMTP id
 p32-20020a056a000a2000b004bb95f693b3mr23871373pfh.77.1642473315012; 
 Mon, 17 Jan 2022 18:35:15 -0800 (PST)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id h5sm15037482pfi.46.2022.01.17.18.35.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jan 2022 18:35:14 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Subject: [PATCH] hw/sd: Correct the CURRENT_STATE bits in SPI-mode response
Date: Tue, 18 Jan 2022 10:35:05 +0800
Message-Id: <20220118023509.14496-1-frank.chang@sifive.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::52e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x52e.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
 Alexander Bulekov <alxndr@bu.edu>, Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Frank Chang <frank.chang@sifive.com>

In SPI-mode, type B ("cleared on valid command") clear condition is not
supported, and as the "In idle state" bit in SPI-mode has type A
("according to current state") clear condition, the CURRENT_STATE bits
in an SPI-mode response should be the SD card's state after the command
is executed, instead of the state when it received the preceding
command.

Also, we don't need to clear the type B ("clear on valid command")
status bits after the response is updated in SPI-mode.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 hw/sd/sd.c | 26 ++++++++++++++++++--------
 1 file changed, 18 insertions(+), 8 deletions(-)

diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index cd67a7bac8..9736b8912d 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -1757,12 +1757,20 @@ int sd_do_command(SDState *sd, SDRequest *req,
     if (rtype == sd_illegal) {
         sd->card_status |= ILLEGAL_COMMAND;
     } else {
-        /* Valid command, we can update the 'state before command' bits.
-         * (Do this now so they appear in r1 responses.)
-         */
         sd->current_cmd = req->cmd;
         sd->card_status &= ~CURRENT_STATE;
-        sd->card_status |= (last_state << 9);
+
+        if (!sd->spi) {
+            /* Valid command, we can update the 'state before command' bits.
+             * (Do this now so they appear in r1 responses.)
+             */
+            sd->card_status |= (last_state << 9);
+        } else {
+            /* Type B ("clear on valid command") is not supported
+             * in SPI-mode.
+             */
+            sd->card_status |= (sd->state << 9);
+        }
     }
 
 send_response:
@@ -1808,10 +1816,12 @@ send_response:
     trace_sdcard_response(sd_response_name(rtype), rsplen);
 
     if (rtype != sd_illegal) {
-        /* Clear the "clear on valid command" status bits now we've
-         * sent any response
-         */
-        sd->card_status &= ~CARD_STATUS_B;
+        if (!sd->spi) {
+            /* Clear the "clear on valid command" status bits now we've
+             * sent any response
+             */
+            sd->card_status &= ~CARD_STATUS_B;
+        }
     }
 
 #ifdef DEBUG_SD
-- 
2.31.1


