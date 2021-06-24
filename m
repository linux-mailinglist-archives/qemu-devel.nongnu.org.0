Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 390693B3147
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Jun 2021 16:26:42 +0200 (CEST)
Received: from localhost ([::1]:48884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwQJV-0005lG-9L
	for lists+qemu-devel@lfdr.de; Thu, 24 Jun 2021 10:26:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lwQFR-00067v-Hp; Thu, 24 Jun 2021 10:22:31 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:37837)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lwQFP-0008Jz-RZ; Thu, 24 Jun 2021 10:22:29 -0400
Received: by mail-wr1-x434.google.com with SMTP id i94so6898588wri.4;
 Thu, 24 Jun 2021 07:22:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WBraHyjmGr6XeI21kbbyD3nKLW6L5v9q4ad+mz4xwSY=;
 b=eGZRapmrGlXpGUcDzSRBfIice1Nc5ySOwuBv57ra2GK+BvtDeqS2h9Gl63CzV8qEnj
 q95fFB4RdM3XkC1yWKTe2wWMwqPaPWQpCqZt3cLhO3B4Y3cxGohl6OEVe7Q9+RsyyTpA
 upg8tKe2VH0aRX43j2ebhM92/A+kRPK7Gc2/2YxNk/WkGG9zn8eEiJeuU89CH2p4ZhdH
 Q6xvYVa9Hyejr0ehhCnDyaZDlAi06yWS7EQpWtjDO0HmS+V6COQPbdM/A4VBrQWGJltK
 cxptBfSXx1w+jaEKtWR60T14ovpmztEqqXxpySJS/A+EFw7PBxman12Q9dvOXKjgI79q
 4dJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=WBraHyjmGr6XeI21kbbyD3nKLW6L5v9q4ad+mz4xwSY=;
 b=iBCL6zr3QlcoJMD+r1LENAH4mGKdFAPfUm694baV99GVnSeEke7pv+FjIrvNydjNKg
 P1YdM6/dGfOUUnYFgvAmFWTgF9KI7E7sACB2rvtIvuyzi2MdNLv2zAZCmBu4Myv40olt
 J1v9r7iDGFJaBU4p+N45ixOHzfsfn108VUUfYbWykGnFxGz5/zQknMBB89eCPOaFL1nK
 2IEnJ/SSnKCx7rfmOKyo0w2zNq1VeWidASdYt54BlFQA4q3W3xk/3fFwPcNQB4WWwl76
 peLmx1duOnhGN8Xspmg+6JhZvIrxxFDPC5NAE/mQ7Y5aoybpt8AdnBuR8Oas3e8PdLP7
 CM1g==
X-Gm-Message-State: AOAM532p/iomyCIRzIB2T23GfBT5CzZfooYAwFK1HXqsvG7NrwMEK+7n
 q7//9/dSHgn59jtSeOLgFFUtUWn+ub/7nQ==
X-Google-Smtp-Source: ABdhPJzJ7UKKUcLkV8WV49CIiVgT+x9EwHSyNCzlgpXJbQUol1x2SmtOy63OReqWBLq1tepAM632+A==
X-Received: by 2002:a5d:6d8b:: with SMTP id l11mr4789719wrs.21.1624544545943; 
 Thu, 24 Jun 2021 07:22:25 -0700 (PDT)
Received: from x1w.. (93.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id e11sm3290531wrs.64.2021.06.24.07.22.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Jun 2021 07:22:25 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 03/10] hw/sd: Move proto_name to SDProto structure
Date: Thu, 24 Jun 2021 16:22:02 +0200
Message-Id: <20210624142209.1193073-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210624142209.1193073-1-f4bug@amsat.org>
References: <20210624142209.1193073-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x434.google.com
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

Introduce a new structure to hold the bus protocol specific
fields: SDProto. The first field is the protocol name.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/sd/sd.c | 28 ++++++++++++++++++++--------
 1 file changed, 20 insertions(+), 8 deletions(-)

diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index d71ec81c22a..a1cc8ab0be8 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -88,6 +88,10 @@ enum SDCardStates {
     sd_disconnect_state,
 };
 
+typedef struct SDProto {
+    const char *name;
+} SDProto;
+
 struct SDState {
     DeviceState parent_obj;
 
@@ -112,6 +116,7 @@ struct SDState {
 
     /* Runtime changeables */
 
+    const SDProto *proto;   /* Bus protocol */
     uint32_t mode;    /* current card mode, one of SDCardModes */
     int32_t state;    /* current card state, one of SDCardStates */
     uint32_t vhs;
@@ -138,7 +143,6 @@ struct SDState {
     qemu_irq readonly_cb;
     qemu_irq inserted_cb;
     QEMUTimer *ocr_power_timer;
-    const char *proto_name;
     bool enable;
     uint8_t dat_lines;
     bool cmd_line;
@@ -951,8 +955,8 @@ static bool address_in_range(SDState *sd, const char *desc,
 
 static sd_rsp_type_t sd_invalid_state_for_cmd(SDState *sd, SDRequest req)
 {
-    qemu_log_mask(LOG_GUEST_ERROR, "SD: CMD%i in a wrong state: %s\n",
-                  req.cmd, sd_state_name(sd->state));
+    qemu_log_mask(LOG_GUEST_ERROR, "%s: CMD%i in a wrong state: %s\n",
+                  sd->proto->name, req.cmd, sd_state_name(sd->state));
 
     return sd_illegal;
 }
@@ -966,7 +970,7 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
      * However there is no ACMD55, so we want to trace this particular case.
      */
     if (req.cmd != 55 || sd->expecting_acmd) {
-        trace_sdcard_normal_command(sd->proto_name,
+        trace_sdcard_normal_command(sd->proto->name,
                                     sd_cmd_name(req.cmd), req.cmd,
                                     req.arg, sd_state_name(sd->state));
     }
@@ -1526,7 +1530,7 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
 static sd_rsp_type_t sd_app_command(SDState *sd,
                                     SDRequest req)
 {
-    trace_sdcard_app_command(sd->proto_name, sd_acmd_name(req.cmd),
+    trace_sdcard_app_command(sd->proto->name, sd_acmd_name(req.cmd),
                              req.cmd, req.arg, sd_state_name(sd->state));
     sd->card_status |= APP_CMD;
     switch (req.cmd) {
@@ -1820,7 +1824,7 @@ void sd_write_byte(SDState *sd, uint8_t value)
     if (sd->card_status & (ADDRESS_ERROR | WP_VIOLATION))
         return;
 
-    trace_sdcard_write_data(sd->proto_name,
+    trace_sdcard_write_data(sd->proto->name,
                             sd_acmd_name(sd->current_cmd),
                             sd->current_cmd, value);
     switch (sd->current_cmd) {
@@ -1976,7 +1980,7 @@ uint8_t sd_read_byte(SDState *sd)
 
     io_len = (sd->ocr & (1 << 30)) ? 512 : sd->blk_len;
 
-    trace_sdcard_read_data(sd->proto_name,
+    trace_sdcard_read_data(sd->proto->name,
                            sd_acmd_name(sd->current_cmd),
                            sd->current_cmd, io_len);
     switch (sd->current_cmd) {
@@ -2095,6 +2099,14 @@ void sd_enable(SDState *sd, bool enable)
     sd->enable = enable;
 }
 
+static const SDProto sd_proto_spi = {
+    .name = "SPI",
+};
+
+static const SDProto sd_proto_sd = {
+    .name = "SD",
+};
+
 static void sd_instance_init(Object *obj)
 {
     SDState *sd = SD_CARD(obj);
@@ -2115,7 +2127,7 @@ static void sd_realize(DeviceState *dev, Error **errp)
     SDState *sd = SD_CARD(dev);
     int ret;
 
-    sd->proto_name = sd->spi ? "SPI" : "SD";
+    sd->proto = sd->spi ? &sd_proto_spi : &sd_proto_sd;
 
     switch (sd->spec_version) {
     case SD_PHY_SPECv1_10_VERS
-- 
2.31.1


