Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09A2A20B632
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Jun 2020 18:48:22 +0200 (CEST)
Received: from localhost ([::1]:45956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jorWW-0005eM-Kv
	for lists+qemu-devel@lfdr.de; Fri, 26 Jun 2020 12:48:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jorPA-0000J8-J2; Fri, 26 Jun 2020 12:40:44 -0400
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:35870)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jorP9-00068n-2U; Fri, 26 Jun 2020 12:40:44 -0400
Received: by mail-wm1-x342.google.com with SMTP id 17so9961633wmo.1;
 Fri, 26 Jun 2020 09:40:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RfRAaK5bCiGl7xgm0xZdlWrkb6KuXKvncQm/zm7wVgY=;
 b=XpW+Igd2vWW6H5nDo2Qe9hZVGZEH5nAhB8aiIT+hbxexQYDUUdY14pamcpgw1wIcO3
 /LwbgDZHk2h3f93BMCfV33Tfr9YwrjzSwwhfFYm+6rCIfC/7ow2N/rARbq+0caLgr2WL
 WATMBY7fdT4rU6AryN0gcGiXqa7Uvvs/sbeVsRUcvX6npEpVsJpDQGPVcl+57aG+rhlc
 wpS6c89uTbWS7PMyEz3JAJftVqRVGUKFksV9G1dnKuDGhSXSKh4pXyE+jLckZs7R7C7u
 lebJHsG74tXJsXF9NZntkRkIvtP9R3EkUftPdzQ2ZyTw3uXq4wN7cfSfUAK6pXYbCrOV
 lrpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=RfRAaK5bCiGl7xgm0xZdlWrkb6KuXKvncQm/zm7wVgY=;
 b=FDJcjlQpaXZBR1grLlqZMyXuKT5/eoKNhsEX/ThxjOHmlqVGb9pzHNL8BV80/9l0WD
 N8015pxvZQXxMZfnf6EOcz3mrsw3lqVkV31zi9oAGQnf4d2g5FVYK5csfSE2CMYBlbpy
 7eqa8b8E9i5K5cuDyag1h99Y1+LP7WK89uZlOzG2n0RRD8vylfHBKyJrL0MP7shmrJuI
 +YgvSBoGMVPGG1RAMgH8jUsVNtADO+A+1YgmYMoGhA4qeVoIovTIno6IyuqPoeXYEg8C
 QhjOU1yDTKzsMILrTejDKRFtXLzBLVLqBm3+v+/5gcWL2Qr4lIs/P8saJ0IjwK4+BibM
 ZkCw==
X-Gm-Message-State: AOAM533uiuXx2Y8a0M7WIHtXqxZkEiwsUBhjFmJ6WGHVgK8zuWQXgBQO
 DFdXrvNpyQHeGKP53oMS3dQMrrqk
X-Google-Smtp-Source: ABdhPJwSumzLS2e7WjBPSmqNYN8dbvuyye4qO4ClYTegBK1v96UxnHgqu5mEfzMbrR8by52wKv2+cw==
X-Received: by 2002:a1c:7d85:: with SMTP id y127mr4425645wmc.181.1593189640726; 
 Fri, 26 Jun 2020 09:40:40 -0700 (PDT)
Received: from localhost.localdomain (1.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.1])
 by smtp.gmail.com with ESMTPSA id f12sm24623646wrw.53.2020.06.26.09.40.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jun 2020 09:40:40 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 10/15] hw/sd/sdcard: Simplify cmd_valid_while_locked()
Date: Fri, 26 Jun 2020 18:40:21 +0200
Message-Id: <20200626164026.766-11-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200626164026.766-1-f4bug@amsat.org>
References: <20200626164026.766-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::342;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x342.google.com
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

cmd_valid_while_locked() only needs to read SDRequest->cmd,
pass it directly and make it const.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/sd/sd.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index d9ae4090fb..115a5aa4c3 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -1664,7 +1664,7 @@ static sd_rsp_type_t sd_app_command(SDState *sd,
     return sd_illegal;
 }
 
-static int cmd_valid_while_locked(SDState *sd, SDRequest *req)
+static int cmd_valid_while_locked(SDState *sd, const uint8_t cmd)
 {
     /* Valid commands in locked state:
      * basic class (0)
@@ -1675,13 +1675,12 @@ static int cmd_valid_while_locked(SDState *sd, SDRequest *req)
      * Anything else provokes an "illegal command" response.
      */
     if (sd->expecting_acmd) {
-        return req->cmd == 41 || req->cmd == 42;
+        return cmd == 41 || cmd == 42;
     }
-    if (req->cmd == 16 || req->cmd == 55) {
+    if (cmd == 16 || cmd == 55) {
         return 1;
     }
-    return sd_cmd_class[req->cmd] == 0
-            || sd_cmd_class[req->cmd] == 7;
+    return sd_cmd_class[cmd] == 0 || sd_cmd_class[cmd] == 7;
 }
 
 int sd_do_command(SDState *sd, SDRequest *req,
@@ -1707,7 +1706,7 @@ int sd_do_command(SDState *sd, SDRequest *req,
     }
 
     if (sd->card_status & CARD_IS_LOCKED) {
-        if (!cmd_valid_while_locked(sd, req)) {
+        if (!cmd_valid_while_locked(sd, req->cmd)) {
             sd->card_status |= ILLEGAL_COMMAND;
             sd->expecting_acmd = false;
             qemu_log_mask(LOG_GUEST_ERROR, "SD: Card is locked\n");
-- 
2.21.3


