Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B61DB3B3156
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Jun 2021 16:29:46 +0200 (CEST)
Received: from localhost ([::1]:60208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwQMT-0004vO-RN
	for lists+qemu-devel@lfdr.de; Thu, 24 Jun 2021 10:29:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lwQFh-0006Os-Hb; Thu, 24 Jun 2021 10:22:45 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:40546)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lwQFf-0008VB-U0; Thu, 24 Jun 2021 10:22:45 -0400
Received: by mail-wr1-x435.google.com with SMTP id g7so2254296wri.7;
 Thu, 24 Jun 2021 07:22:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZYvuxt0NCh8Bn052rHsHuAYilMYeW5qZBoGZhPd54Lk=;
 b=skZ0/5UWRUEmo3J7TzGc/hC0AHrRKuifqYpEYYl+mkD5KsAzIwHWlWwnDm7LWCkMwI
 Pe1la39DWaewBK5wghXe0pIEKfhZXPKHka+QDFTsMYWzlf1fJ6l0iw9vXSh35v0WaNXB
 vQDO5bqL7ieyE210bJyV6oKjgxDbCEZJnJFdLw6butoRbSyAjKu8qvXyLwGPAbuQUVjX
 8OVvGjao1Zs9Wc2+XYbQtSMORkF2GkPKyKofffkJMdmshaYmxddcknJmyielM5o2Gh6x
 mbpdHQZN8tuOvHdOi83oe9gr0C0sizO0TPlUeLPXvqOItLU0lr2UhM/pCUtZKj9SxlV3
 G60g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=ZYvuxt0NCh8Bn052rHsHuAYilMYeW5qZBoGZhPd54Lk=;
 b=ePsyw0BUBjIxA1c9TSxEN+ugis6HST2HJOWT3Q3069hleVaH33Gr9DtVQ0Iq0XF1v9
 G3+PouToy+gn1uC02L7xZeWNeAwIs72XBKASmwuc2AZUfr8NRkxTyKHpvq6pl0kKrk/z
 xVJhIfL/0keF5Iaroyk/ZGss/S/myw2LUYljjyirnetn5g1nvZ4jhV+dxt8YgDllx8aX
 MrKvjo/YQnq1olm0FXR2b4h7Q2ATayf//i/KSAJo7v7oHAVgMoBhcabhMuMmmLrVF0tm
 pnCjiOqqG284rPkmSlgV/2LtfH3Xerco22BbzloffvjzMLqKBTkEUcUqI9PzbbBLMd/v
 KemQ==
X-Gm-Message-State: AOAM532SmKGnWAwPK3zI0hZeFLRC3/MMgxkEC8LFy/It73BprSf82F/S
 dotd58dLJGG6jpGPMaLCSILsjnTSF0+vLg==
X-Google-Smtp-Source: ABdhPJycTAx3L7vZcldgxhrMz4ec+gyuuZvY1whVcMOolmHdGuaVqCJ2HrCVt2/OOZniHWBqVG9ivg==
X-Received: by 2002:a5d:680c:: with SMTP id w12mr4814139wru.142.1624544562084; 
 Thu, 24 Jun 2021 07:22:42 -0700 (PDT)
Received: from x1w.. (93.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id c21sm2942022wme.38.2021.06.24.07.22.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Jun 2021 07:22:41 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 06/10] hw/sd: Add sd_cmd_unimplemented() handler
Date: Thu, 24 Jun 2021 16:22:05 +0200
Message-Id: <20210624142209.1193073-7-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210624142209.1193073-1-f4bug@amsat.org>
References: <20210624142209.1193073-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x435.google.com
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

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/sd/sd.c | 21 ++++++++++++---------
 1 file changed, 12 insertions(+), 9 deletions(-)

diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index 0215bdb3689..2647fd26566 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -973,6 +973,15 @@ static sd_rsp_type_t sd_cmd_illegal(SDState *sd, SDRequest req)
     return sd_illegal;
 }
 
+/* Commands that are recognised but not yet implemented. */
+static sd_rsp_type_t sd_cmd_unimplemented(SDState *sd, SDRequest req)
+{
+    qemu_log_mask(LOG_UNIMP, "%s: CMD%i not implemented\n",
+                  sd->proto->name, req.cmd);
+
+    return sd_illegal;
+}
+
 static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
 {
     uint32_t rca = 0x0000;
@@ -1522,9 +1531,6 @@ static sd_rsp_type_t sd_app_command(SDState *sd,
 
     switch (req.cmd) {
     case 6:	/* ACMD6:  SET_BUS_WIDTH */
-        if (sd->spi) {
-            goto unimplemented_spi_cmd;
-        }
         switch (sd->state) {
         case sd_transfer_state:
             sd->sd_status[0] &= 0x3f;
@@ -1655,12 +1661,6 @@ static sd_rsp_type_t sd_app_command(SDState *sd,
     default:
         /* Fall back to standard commands.  */
         return sd_normal_command(sd, req);
-
-    unimplemented_spi_cmd:
-        /* Commands that are recognised but not yet implemented in SPI mode.  */
-        qemu_log_mask(LOG_UNIMP, "SD: CMD%i not implemented in SPI mode\n",
-                      req.cmd);
-        return sd_illegal;
     }
 
     qemu_log_mask(LOG_GUEST_ERROR, "SD: ACMD%i in a wrong state\n", req.cmd);
@@ -2096,6 +2096,9 @@ static const SDProto sd_proto_spi = {
         [26]        = sd_cmd_illegal,
         [52 ... 54] = sd_cmd_illegal,
     },
+    .cmd = {
+        [6]         = sd_cmd_unimplemented,
+    },
 };
 
 static const SDProto sd_proto_sd = {
-- 
2.31.1


