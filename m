Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C42F55387D8
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 21:46:41 +0200 (CEST)
Received: from localhost ([::1]:36888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvlLc-0007tX-UO
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 15:46:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nvlED-0006w2-Ln; Mon, 30 May 2022 15:39:02 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:53208)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nvlEB-0008Du-OU; Mon, 30 May 2022 15:39:01 -0400
Received: by mail-pj1-x102d.google.com with SMTP id gd1so3595015pjb.2;
 Mon, 30 May 2022 12:38:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=g/fUXjzaltH1avxyUdAnsl5PWfk9MZbsOrfjIpDgLv4=;
 b=TXUBozCUrpoIP6RnuSWz86zeZtz3DjR904S86tzxBFJs+rPZFZgdeYIvwa9WjCIRAO
 dJ7IAWaOofDfIat8TcXYY2yhbYnYB+/K88bLgnuoTqcdJtFp4Ki1nEVmBl0E9uoiHYMO
 CD4byqQgAbF+BX6f5I72Swb8pF1hpRPWz1WjsT3PdNbgk0MGmL5WjxStU0RBut01U5PH
 U9LfbHX8iK1Q4zZBZWNX6Uik5x+BTkQwySWgxQ6vlheT2ANaQvbx3+OIvoB1XpTfn7eE
 a/Mwoa3Nif+9zdrBk/68yo8+kcinETQI6zLyFw6kPZcF6I67u89QODzPHcX/D++yEh8A
 W2Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=g/fUXjzaltH1avxyUdAnsl5PWfk9MZbsOrfjIpDgLv4=;
 b=vyfxx19Crj2YM3EA+tFCgkglNxkH65JZEKrFvQFtk+boLMab66Zz9QlyRVeuFVPvOw
 qPOlX+bq9RFw3LcpyUJuBW4AxU5QbRLCcToI89A3/3+BzPRR5HXvRNXxJiN6HhmFdB3T
 QgvaEJICIfw18b0l0urXGxnhdTyknlzrynzaBy0s9fU0DMxpGbr2Qih4wMkFg52G7sCg
 8JOm4OIIdq4d1UdH3H2XLHb1jH8wA/S67tlU0jiUTVoUihLQNkTtOyoYGZ4G+iWpUPG6
 bDmJqpFMOfqf4+zdg4VYMoBj9UVH1Vl190zY0vqUxRphgUqefF9HkA88/Y3JJSEhEGiN
 gEbg==
X-Gm-Message-State: AOAM531LAbJFNHLbXceeyX3DrvccUxyG7PwfGSFIf9U4WHes//bTxzu+
 NigX+Sjd+JzQ//IGCTNf1yIKrRXFe9w=
X-Google-Smtp-Source: ABdhPJxdMyC/6rMAQ5rRrjPPhEmugutiRqylUcTfD7beooVdsSfb4DEbt1EB7fNFDqWsmykTN7TX4g==
X-Received: by 2002:a17:902:ecc6:b0:162:27bd:4a4c with SMTP id
 a6-20020a170902ecc600b0016227bd4a4cmr39582895plh.97.1653939537895; 
 Mon, 30 May 2022 12:38:57 -0700 (PDT)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 p22-20020a63f456000000b003fae31058e2sm8889232pgk.29.2022.05.30.12.38.55
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 30 May 2022 12:38:57 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Bin Meng <bin.meng@windriver.com>, qemu-block@nongnu.org,
 Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>, Bin Meng <bmeng.cn@gmail.com>
Subject: [PATCH v2 04/25] hw/sd: Move proto_name to SDProto structure
Date: Mon, 30 May 2022 21:37:55 +0200
Message-Id: <20220530193816.45841-5-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220530193816.45841-1-philippe.mathieu.daude@gmail.com>
References: <20220530193816.45841-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Introduce a new structure to hold the bus protocol specific
fields: SDProto. The first field is the protocol name.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Message-Id: <20210624142209.1193073-4-f4bug@amsat.org>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/sd/sd.c         | 35 +++++++++++++++++++++++++++--------
 include/hw/sd/sd.h |  2 ++
 2 files changed, 29 insertions(+), 8 deletions(-)

diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index b3e61b9f84..953dbbd7ae 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -87,6 +87,10 @@ enum SDCardStates {
     sd_disconnect_state,
 };
 
+typedef struct SDProto {
+    const char *name;
+} SDProto;
+
 struct SDState {
     DeviceState parent_obj;
 
@@ -137,7 +141,6 @@ struct SDState {
     qemu_irq readonly_cb;
     qemu_irq inserted_cb;
     QEMUTimer *ocr_power_timer;
-    const char *proto_name;
     bool enable;
     uint8_t dat_lines;
     bool cmd_line;
@@ -145,6 +148,13 @@ struct SDState {
 
 static void sd_realize(DeviceState *dev, Error **errp);
 
+static const struct SDProto *sd_proto(SDState *sd)
+{
+    SDCardClass *sc = SD_CARD_GET_CLASS(sd);
+
+    return sc->proto;
+}
+
 static const char *sd_version_str(enum SDPhySpecificationVersion version)
 {
     static const char *sdphy_version[] = {
@@ -981,8 +991,8 @@ static bool address_in_range(SDState *sd, const char *desc,
 
 static sd_rsp_type_t sd_invalid_state_for_cmd(SDState *sd, SDRequest req)
 {
-    qemu_log_mask(LOG_GUEST_ERROR, "SD: CMD%i in a wrong state: %s (spec %s)\n",
-                  req.cmd, sd_state_name(sd->state),
+    qemu_log_mask(LOG_GUEST_ERROR, "%s: CMD%i in a wrong state: %s (spec %s)\n",
+                  sd_proto(sd)->name, req.cmd, sd_state_name(sd->state),
                   sd_version_str(sd->spec_version));
 
     return sd_illegal;
@@ -997,7 +1007,7 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
      * However there is no ACMD55, so we want to trace this particular case.
      */
     if (req.cmd != 55 || sd->expecting_acmd) {
-        trace_sdcard_normal_command(sd->proto_name,
+        trace_sdcard_normal_command(sd_proto(sd)->name,
                                     sd_cmd_name(req.cmd), req.cmd,
                                     req.arg, sd_state_name(sd->state));
     }
@@ -1562,7 +1572,7 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
 static sd_rsp_type_t sd_app_command(SDState *sd,
                                     SDRequest req)
 {
-    trace_sdcard_app_command(sd->proto_name, sd_acmd_name(req.cmd),
+    trace_sdcard_app_command(sd_proto(sd)->name, sd_acmd_name(req.cmd),
                              req.cmd, req.arg, sd_state_name(sd->state));
     sd->card_status |= APP_CMD;
     switch (req.cmd) {
@@ -1856,7 +1866,7 @@ void sd_write_byte(SDState *sd, uint8_t value)
     if (sd->card_status & (ADDRESS_ERROR | WP_VIOLATION))
         return;
 
-    trace_sdcard_write_data(sd->proto_name,
+    trace_sdcard_write_data(sd_proto(sd)->name,
                             sd_acmd_name(sd->current_cmd),
                             sd->current_cmd, value);
     switch (sd->current_cmd) {
@@ -2012,7 +2022,7 @@ uint8_t sd_read_byte(SDState *sd)
 
     io_len = (sd->ocr & (1 << 30)) ? 512 : sd->blk_len;
 
-    trace_sdcard_read_data(sd->proto_name,
+    trace_sdcard_read_data(sd_proto(sd)->name,
                            sd_acmd_name(sd->current_cmd),
                            sd->current_cmd, io_len);
     switch (sd->current_cmd) {
@@ -2131,6 +2141,14 @@ void sd_enable(SDState *sd, bool enable)
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
@@ -2149,9 +2167,10 @@ static void sd_instance_finalize(Object *obj)
 static void sd_realize(DeviceState *dev, Error **errp)
 {
     SDState *sd = SD_CARD(dev);
+    SDCardClass *sc = SD_CARD_GET_CLASS(sd);
     int ret;
 
-    sd->proto_name = sd->spi ? "SPI" : "SD";
+    sc->proto = sd->spi ? &sd_proto_spi : &sd_proto_sd;
 
     switch (sd->spec_version) {
     case SD_PHY_SPECv1_10_VERS
diff --git a/include/hw/sd/sd.h b/include/hw/sd/sd.h
index 47360ba4ee..0d94e1f346 100644
--- a/include/hw/sd/sd.h
+++ b/include/hw/sd/sd.h
@@ -124,6 +124,8 @@ struct SDCardClass {
     void (*enable)(SDState *sd, bool enable);
     bool (*get_inserted)(SDState *sd);
     bool (*get_readonly)(SDState *sd);
+
+    const struct SDProto *proto;
 };
 
 #define TYPE_SD_BUS "sd-bus"
-- 
2.36.1


