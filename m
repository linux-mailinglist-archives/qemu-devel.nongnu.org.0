Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0B9820B5FD
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Jun 2020 18:37:04 +0200 (CEST)
Received: from localhost ([::1]:54324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jorLb-0001KP-J1
	for lists+qemu-devel@lfdr.de; Fri, 26 Jun 2020 12:37:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jorDR-0005kp-Jq; Fri, 26 Jun 2020 12:28:37 -0400
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:34163)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jorDQ-0003Mc-40; Fri, 26 Jun 2020 12:28:37 -0400
Received: by mail-wr1-x441.google.com with SMTP id f7so7088347wrw.1;
 Fri, 26 Jun 2020 09:28:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=j4YLj9RlP5uo0+3BOkjl/ihTz1eGF7coUl6hG3PUY6A=;
 b=CUjZAt8b3mMAT+05mccVgH9jGMD+GA5IbtnYWCjVTkib+UDzUQpHaVlpP1dher+8IM
 aTY6eAguh5gq2GTE83jsbjnKQ3ix0BitcRGkNRaJepkn+JBtQOrPdyySO3FwI46uNATp
 Vq1GWWpLXDqIUspZY526Pg/3z0PxIX4mkAT7UllyfO1wyCNNFY935hU/dINLR2dO7PMQ
 liT7viVINtgQT+E4Xm7mMC1z53k4NvX/VEeLF5EDQAgz/4mWvYvSuLcU3XhxODfLhS/H
 93kOcikkac2P3oHg8Ko+vGRQm9NUxX0D/73dJidZSLQ/0+uHiTxqsDUIkAsRj8yhDu6S
 zt7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=j4YLj9RlP5uo0+3BOkjl/ihTz1eGF7coUl6hG3PUY6A=;
 b=eNS4YMiZbxZUHqhP3K1RMgpRK2TQ+tid61oKv8yW1QIr6Q8DIqJjrLp6R+onsWKz51
 ZCrvGDx6EpZyEeYQyRL7YD2o6norf92meyCGzG+v479sOT5D6LZCXfig84QsBzBFPyWx
 lTFeRsx7ycXpuCWhHTQSWzTJvvEQc1VKcVFDk5MC4dYKf8AlvnBMy+EzOXkq8Q44sJxw
 r/UEzSPueJmQLkB6s7tIGjm+32DjSNxuGcy6qs0bsPUl71hEo9WSQCCofopXUF+H8sJS
 nhCAZ+Efp6VvvJ+33Gvv05Vl0U0v+/SR3ct6zAxSc+TfAXXk8XTtWxyI1I8SGeNfzL1l
 zS9Q==
X-Gm-Message-State: AOAM531gqKDQ+eKB5mQ1a5SFtQ7EklcvE25XcrBOzqSV6TLdbA3mzM33
 9O16noG+0nZ5YuemzU5A+MA97KHZ
X-Google-Smtp-Source: ABdhPJxrkRdqQZQyUGb9pBMElH67D/oKd6bg6+/C6Yf0EspRZK+VP0ju866POmIsD7CwLGKqodtGfA==
X-Received: by 2002:adf:dcd0:: with SMTP id x16mr4371446wrm.387.1593188914332; 
 Fri, 26 Jun 2020 09:28:34 -0700 (PDT)
Received: from localhost.localdomain (1.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.1])
 by smtp.gmail.com with ESMTPSA id 12sm4867255wmg.6.2020.06.26.09.28.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jun 2020 09:28:33 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 12/14] hw/sd/sdcard: Correctly display the command name in
 trace events
Date: Fri, 26 Jun 2020 18:28:16 +0200
Message-Id: <20200626162818.25840-13-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200626162818.25840-1-f4bug@amsat.org>
References: <20200626162818.25840-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::441;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x441.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=1, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Some ACMD were incorrectly displayed. Fix by remembering if we
are processing a ACMD (with current_cmd_is_acmd) and add the
sd_current_cmd_name() helper, which display to correct name
regardless it is a CMD or ACMD.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/sd/sd.c | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index 8dd83c365c..798a2346a7 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -125,6 +125,7 @@ struct SDState {
     uint8_t pwd[16];
     uint32_t pwd_len;
     uint8_t function_group[6];
+    bool current_cmd_is_acmd;
     uint8_t current_cmd;
     /* True if we will handle the next command as an ACMD. Note that this does
      * *not* track the APP_CMD status bit!
@@ -1704,6 +1705,8 @@ int sd_do_command(SDState *sd, SDRequest *req,
                       req->cmd);
         req->cmd &= 0x3f;
     }
+    sd->current_cmd = req->cmd;
+    sd->current_cmd_is_acmd = sd->expecting_acmd;
 
     if (sd->card_status & CARD_IS_LOCKED) {
         if (!cmd_valid_while_locked(sd, req->cmd)) {
@@ -1731,7 +1734,6 @@ int sd_do_command(SDState *sd, SDRequest *req,
         /* Valid command, we can update the 'state before command' bits.
          * (Do this now so they appear in r1 responses.)
          */
-        sd->current_cmd = req->cmd;
         sd->card_status &= ~CURRENT_STATE;
         sd->card_status |= (last_state << 9);
     }
@@ -1792,6 +1794,15 @@ send_response:
     return rsplen;
 }
 
+static const char *sd_current_cmd_name(SDState *sd)
+{
+    if (sd->current_cmd_is_acmd) {
+        return sd_acmd_name(sd->current_cmd);
+    } else {
+        return sd_cmd_name(sd->current_cmd);
+    }
+}
+
 static void sd_blk_read(SDState *sd, uint64_t addr, uint32_t len)
 {
     trace_sdcard_read_block(addr, len);
@@ -1830,7 +1841,7 @@ void sd_write_data(SDState *sd, uint8_t value)
         return;
 
     trace_sdcard_write_data(sd->proto_name,
-                            sd_acmd_name(sd->current_cmd),
+                            sd_current_cmd_name(sd),
                             sd->current_cmd, value);
     switch (sd->current_cmd) {
     case 24:	/* CMD24:  WRITE_SINGLE_BLOCK */
@@ -1984,7 +1995,7 @@ uint8_t sd_read_data(SDState *sd)
     io_len = (sd->ocr & (1 << 30)) ? HWBLOCK_SIZE : sd->blk_len;
 
     trace_sdcard_read_data(sd->proto_name,
-                           sd_acmd_name(sd->current_cmd),
+                           sd_current_cmd_name(sd),
                            sd->current_cmd, io_len);
     switch (sd->current_cmd) {
     case 6:	/* CMD6:   SWITCH_FUNCTION */
-- 
2.21.3


