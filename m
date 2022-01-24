Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 540354978CE
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Jan 2022 07:09:23 +0100 (CET)
Received: from localhost ([::1]:42114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nBsXX-0008RU-Rl
	for lists+qemu-devel@lfdr.de; Mon, 24 Jan 2022 01:09:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1nBsTN-0006b5-Bd
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 01:05:06 -0500
Received: from [2607:f8b0:4864:20::1031] (port=40712
 helo=mail-pj1-x1031.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1nBsTK-00033F-As
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 01:05:00 -0500
Received: by mail-pj1-x1031.google.com with SMTP id
 z10-20020a17090acb0a00b001b520826011so11082077pjt.5
 for <qemu-devel@nongnu.org>; Sun, 23 Jan 2022 22:04:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hIPVPEFvzLuScn+ByrDyXPZxUjf/6SICjfavfk2FnKQ=;
 b=cdL3gJBoP/H0nc6kDolB80kWz+hoiPlqda51gr3vf0fYGnokYDJcAbH1vLgfOS+BlV
 xyhoLIRDyfZE7K9SpXs1oz8+Qlj/I4vzJEDgpYWTqldxOZ0VrnKaWdYqUg9m09IiMmX8
 bVqQPmgHJel0C7m1Y2xPNXbV40baVlKNvnr90rqbr/sAVJSCI1Iifm75jd9FG7r9Aywm
 mT0kExmyzA/if4RWApYXpLM3ZVnCwgz8irutbYjuKjkgGNVS2BTD095rmKDgteRnfoFF
 P6p+SG4CLo3KbmlmQbcFYt7+7BEirineCOoBv8E0o0DKEk2mzhwDLx61fx31aRss32Kf
 iXPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hIPVPEFvzLuScn+ByrDyXPZxUjf/6SICjfavfk2FnKQ=;
 b=tH2rrE/t0wJniDwCyb9eE6BHwlmvAoEwL3Pcx5tJCy3knfHu+URzCYVcIxgqrQfF9c
 SONjnCVlVJWEVoMLEQijzwJUHN/e5mG4l5SinihiR3qsf+rKc1HTh+JRRzrgzqPdecH9
 XRyKi2rkKjS7V7KhhaxVFuG9Oj4rPuccARamWOC6Sb1c5SvwfBr29O7+SOPacQx9iwNG
 rz1ov9lwrjkGsCRhgvv51zVUT6Nm8oGeegiOxJMY6+Z9oNeti04cyRMWCYytwrURiPbf
 6YB8luSd1o+3DuFicc4MW394D3tRuIDnLUkokJKDhp0LBCf580n3ZksZ8ZygaF5bmlSS
 LAvg==
X-Gm-Message-State: AOAM530ayQ0GZgBlWdyLBoYrZtbKo+jTxWxpJ8Alg7yWyu3zpowKF6H8
 36mDTxcgNnpYbQXmnl7eMCSWT7cQ2/3B5g==
X-Google-Smtp-Source: ABdhPJwH8qt18/E3WegEvW6tm8a/DYpTw77XcY7O8v9U46Tx0FhWw18O5aO3xhG0aP0ycAqn0aVJ1A==
X-Received: by 2002:a17:90b:3143:: with SMTP id
 ip3mr444362pjb.161.1643004295098; 
 Sun, 23 Jan 2022 22:04:55 -0800 (PST)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id k12sm15453194pfc.107.2022.01.23.22.04.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Jan 2022 22:04:54 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Subject: [PATCH] hw/sd: Correct card status clear conditions in SPI-mode
Date: Mon, 24 Jan 2022 14:04:47 +0800
Message-Id: <20220124060449.22498-1-frank.chang@sifive.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1031
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x1031.google.com
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
Cc: qemu-block@nongnu.org, Frank Chang <frank.chang@sifive.com>,
 Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Alexander Bulekov <alxndr@bu.edu>, Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Frank Chang <frank.chang@sifive.com>

In SPI-mode, unlike SD-mode, card status bits: ILLEGAL_COMMAND and
COM_CRC_ERROR have type C ("cleared by read") clear conditions.
Also, type B ("cleared on valid command") clear condition is not
supported in SPI-mode. As the "In idle state" bit in SPI-mode has type A
("according to current state") clear condition, the CURRENT_STATE bits
in an SPI-mode response should be the SD card's state after the command
is executed, instead of the state when it received the preceding
command.

This patch redefines the card status clear conditions used in SD-mode
and SPI-mode according to SD spec.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 hw/sd/sd.c | 84 ++++++++++++++++++++++++++++++++++++++----------------
 1 file changed, 59 insertions(+), 25 deletions(-)

diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index cd67a7bac8..4c6c1b9424 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -479,24 +479,50 @@ FIELD(CSR, OUT_OF_RANGE,               31,  1)
 #define CARD_STATUS_A           (R_CSR_READY_FOR_DATA_MASK \
                                | R_CSR_CARD_ECC_DISABLED_MASK \
                                | R_CSR_CARD_IS_LOCKED_MASK)
-#define CARD_STATUS_B           (R_CSR_CURRENT_STATE_MASK \
-                               | R_CSR_ILLEGAL_COMMAND_MASK \
-                               | R_CSR_COM_CRC_ERROR_MASK)
-#define CARD_STATUS_C           (R_CSR_AKE_SEQ_ERROR_MASK \
-                               | R_CSR_APP_CMD_MASK \
-                               | R_CSR_ERASE_RESET_MASK \
-                               | R_CSR_WP_ERASE_SKIP_MASK \
-                               | R_CSR_CSD_OVERWRITE_MASK \
-                               | R_CSR_ERROR_MASK \
-                               | R_CSR_CC_ERROR_MASK \
-                               | R_CSR_CARD_ECC_FAILED_MASK \
-                               | R_CSR_LOCK_UNLOCK_FAILED_MASK \
-                               | R_CSR_WP_VIOLATION_MASK \
-                               | R_CSR_ERASE_PARAM_MASK \
-                               | R_CSR_ERASE_SEQ_ERROR_MASK \
-                               | R_CSR_BLOCK_LEN_ERROR_MASK \
-                               | R_CSR_ADDRESS_ERROR_MASK \
-                               | R_CSR_OUT_OF_RANGE_MASK)
+
+static uint32_t sd_card_status_b(SDState *sd)
+{
+    uint32_t sd_mask = R_CSR_CURRENT_STATE_MASK |
+                       R_CSR_ILLEGAL_COMMAND_MASK |
+                       R_CSR_COM_CRC_ERROR_MASK;
+
+    /* SPI-mode dosen't have type B clear condition. */
+    return !sd->spi ? sd_mask : 0;
+}
+
+static uint32_t sd_card_status_c(SDState *sd) {
+    uint32_t sd_mask = R_CSR_AKE_SEQ_ERROR_MASK |
+                       R_CSR_APP_CMD_MASK |
+                       R_CSR_ERASE_RESET_MASK |
+                       R_CSR_WP_ERASE_SKIP_MASK |
+                       R_CSR_CSD_OVERWRITE_MASK |
+                       R_CSR_ERROR_MASK |
+                       R_CSR_CC_ERROR_MASK |
+                       R_CSR_CARD_ECC_FAILED_MASK |
+                       R_CSR_LOCK_UNLOCK_FAILED_MASK |
+                       R_CSR_WP_VIOLATION_MASK |
+                       R_CSR_ERASE_PARAM_MASK |
+                       R_CSR_ERASE_SEQ_ERROR_MASK |
+                       R_CSR_BLOCK_LEN_ERROR_MASK |
+                       R_CSR_ADDRESS_ERROR_MASK |
+                       R_CSR_OUT_OF_RANGE_MASK;
+    uint32_t spi_mask = R_CSR_ERASE_RESET_MASK |
+                        R_CSR_LOCK_UNLOCK_FAILED_MASK |
+                        R_CSR_WP_ERASE_SKIP_MASK |
+                        R_CSR_CSD_OVERWRITE_MASK |
+                        R_CSR_ERROR_MASK |
+                        R_CSR_CC_ERROR_MASK |
+                        R_CSR_CARD_ECC_FAILED_MASK |
+                        R_CSR_ILLEGAL_COMMAND_MASK |
+                        R_CSR_COM_CRC_ERROR_MASK|
+                        R_CSR_WP_VIOLATION_MASK |
+                        R_CSR_ERASE_PARAM_MASK |
+                        R_CSR_ERASE_SEQ_ERROR_MASK |
+                        R_CSR_ADDRESS_ERROR_MASK |
+                        R_CSR_OUT_OF_RANGE_MASK;
+
+    return !sd->spi ? sd_mask : spi_mask;
+}
 
 static void sd_set_cardstatus(SDState *sd)
 {
@@ -522,7 +548,7 @@ static void sd_response_r1_make(SDState *sd, uint8_t *response)
     stl_be_p(response, sd->card_status);
 
     /* Clear the "clear on read" status bits */
-    sd->card_status &= ~CARD_STATUS_C;
+    sd->card_status &= ~sd_card_status_c(sd);
 }
 
 static void sd_response_r3_make(SDState *sd, uint8_t *response)
@@ -537,7 +563,7 @@ static void sd_response_r6_make(SDState *sd, uint8_t *response)
     status = ((sd->card_status >> 8) & 0xc000) |
              ((sd->card_status >> 6) & 0x2000) |
               (sd->card_status & 0x1fff);
-    sd->card_status &= ~(CARD_STATUS_C & 0xc81fff);
+    sd->card_status &= ~(sd_card_status_c(sd) & 0xc81fff);
     stw_be_p(response + 0, sd->rca);
     stw_be_p(response + 2, status);
 }
@@ -1757,12 +1783,20 @@ int sd_do_command(SDState *sd, SDRequest *req,
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
@@ -1811,7 +1845,7 @@ send_response:
         /* Clear the "clear on valid command" status bits now we've
          * sent any response
          */
-        sd->card_status &= ~CARD_STATUS_B;
+        sd->card_status &= ~sd_card_status_b(sd);
     }
 
 #ifdef DEBUG_SD
-- 
2.31.1


