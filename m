Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A4753B3150
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Jun 2021 16:28:28 +0200 (CEST)
Received: from localhost ([::1]:55600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwQLD-0001rX-CI
	for lists+qemu-devel@lfdr.de; Thu, 24 Jun 2021 10:28:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lwQFY-0006B4-Mg; Thu, 24 Jun 2021 10:22:36 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:42807)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lwQFX-0008OV-5m; Thu, 24 Jun 2021 10:22:36 -0400
Received: by mail-wr1-x432.google.com with SMTP id j1so6870589wrn.9;
 Thu, 24 Jun 2021 07:22:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XdJG7ZIE4+jGMuoiadGQKywOCCIK+dcTPMT2LT+HY3I=;
 b=PizqlPQ8uywdsFLvuXLK0lfJJ0AhVrrqPVbHHlSOtjmPLZ65gg1I/uCKCpquDEPNW3
 oMY/LwXYW1+pyGZTssLvgX89mC71Jy2MtJWVCSlrxDnRnp5Dj3YUyfb+Q05fFSUrIIQW
 Twsyx62T7n43kFtxOtt27yuWNtvFEOcykN+ZL3aJBvK/sCEEE+r7I7DBG2mMR+enKt4E
 l1+O4mEfXUbLaYITlsGyqbeAxXKPK+PC8WqLrMPodPNdQG7W7U2DKWlNRzyhFsvvvzJR
 Tw7IxkNRYpF5/vmnZiu9QjZ4KqJsiKbtEFOznfIQQYestBoXHo4yhQzMMm2lztGOBrqR
 uRFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=XdJG7ZIE4+jGMuoiadGQKywOCCIK+dcTPMT2LT+HY3I=;
 b=XQ2c+lzh93PzO/huHArbgiPAMvUDrbMLzMW+4ZaB0YUTzW57Q5fsbJ56p94Ihb4yxk
 /GWv/SL63tVpw0w5Cw4jgPSLmCg6EQJgRUX+XBTZ6uISShe5htDyJ3RutFrazG1eW9GQ
 +lprUg9I+RuWscmiDq0V9GHTJohw2ic3LvVeDhPpgHSQcZ2w0lKi3QafAsVDJwogSq4v
 TlOxg7ubv+V9BHdBnXSqagY6YY2s6MIf5FduCSFgnJ5z7nljZKABaZhpcOQitHkXkYiW
 LHa0O5ecr11I3CtIyNThUojiuw9DLmjJMH0DlrrDIznYHo2PjxxwjAavS4VPIdrVawt2
 CVGA==
X-Gm-Message-State: AOAM5339eyp6YM9vK/55jXKf26AY93jclIm0/rmvhJJXwuvgKzK8vRD0
 D+Srxg4orQPPQ9g8W608mvRbXl5iJ3D4bg==
X-Google-Smtp-Source: ABdhPJyyMUx++MFu9Ddwr7bJVCNwpX8iHwKaCj/f4kznu1Yet9eeB2O4NyD8ZWcRk0djvvOUtLek9Q==
X-Received: by 2002:a05:6000:1091:: with SMTP id
 y17mr4907241wrw.100.1624544552345; 
 Thu, 24 Jun 2021 07:22:32 -0700 (PDT)
Received: from x1w.. (93.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id x1sm3202870wmc.31.2021.06.24.07.22.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Jun 2021 07:22:31 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 04/10] hw/sd: Introduce sd_cmd_handler type
Date: Thu, 24 Jun 2021 16:22:03 +0200
Message-Id: <20210624142209.1193073-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210624142209.1193073-1-f4bug@amsat.org>
References: <20210624142209.1193073-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x432.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: qemu-block@nongnu.org, Andrew Jeffery <andrew@aj.id.au>,
 Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add 2 command handler arrays in SDProto, for CMD and ACMD.
Have sd_normal_command() / sd_app_command() use these arrays:
if an command handler is registered, call it, otherwise fall
back to current code base.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/sd/sd.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index a1cc8ab0be8..ce1eec0374f 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -88,8 +88,12 @@ enum SDCardStates {
     sd_disconnect_state,
 };
 
+typedef sd_rsp_type_t (*sd_cmd_handler)(SDState *sd, SDRequest req);
+
 typedef struct SDProto {
     const char *name;
+    sd_cmd_handler cmd[SDMMC_CMD_MAX];
+    sd_cmd_handler acmd[SDMMC_CMD_MAX];
 } SDProto;
 
 struct SDState {
@@ -994,6 +998,10 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
         return sd_illegal;
     }
 
+    if (sd->proto->cmd[req.cmd]) {
+        return sd->proto->cmd[req.cmd](sd, req);
+    }
+
     switch (req.cmd) {
     /* Basic commands (Class 0 and Class 1) */
     case 0:	/* CMD0:   GO_IDLE_STATE */
@@ -1533,6 +1541,11 @@ static sd_rsp_type_t sd_app_command(SDState *sd,
     trace_sdcard_app_command(sd->proto->name, sd_acmd_name(req.cmd),
                              req.cmd, req.arg, sd_state_name(sd->state));
     sd->card_status |= APP_CMD;
+
+    if (sd->proto->acmd[req.cmd]) {
+        return sd->proto->acmd[req.cmd](sd, req);
+    }
+
     switch (req.cmd) {
     case 6:	/* ACMD6:  SET_BUS_WIDTH */
         if (sd->spi) {
-- 
2.31.1


