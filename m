Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FB8E301EB8
	for <lists+qemu-devel@lfdr.de>; Sun, 24 Jan 2021 21:31:17 +0100 (CET)
Received: from localhost ([::1]:43806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l3m2W-0002ND-CG
	for lists+qemu-devel@lfdr.de; Sun, 24 Jan 2021 15:31:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l3m09-0000ng-0r; Sun, 24 Jan 2021 15:28:49 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:39682)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l3m07-0005UG-FD; Sun, 24 Jan 2021 15:28:48 -0500
Received: by mail-wr1-x429.google.com with SMTP id a1so10260572wrq.6;
 Sun, 24 Jan 2021 12:28:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8cyx359tJuUV31B1jXXoRAIiQKjeJQ7/Oz0pZLR+MTQ=;
 b=a9wYft/xQe+7/tTaxmt1V5nDg+L0UBufe8rSk21RnUESoUYEHxXhs65QBT9VOT5N56
 l8FLQVZKSbe9TlgtKjZVu7q9PEkHG7ov5Hvv15aqGn8SReB4Q3a4rItSEgdUx8QSVo+a
 QVPm8yltETWflut4YGNJnad+2LcbQtRnWKIL70BdiiBfdOO677cG/z3NnnH88A5tvDca
 3yfmEhjbTURT+/Pc2v8buVgQp/ZwHQlycUeqtKqxXVR5BOUaDAFM+3x0OBENHeUvIYIe
 GEoUJKBiydEpY35UZ4RCx3wQT35YNpkXQXXnAV/XYOm96il/Qqu2YcWKjEcLpOzWHPCd
 bx3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=8cyx359tJuUV31B1jXXoRAIiQKjeJQ7/Oz0pZLR+MTQ=;
 b=ql30XBMcV22uI9LPH/Ep2DvPl3aXSTGXSytS1ipsk0nHdaqvzVPmOMlPAvZGr0VBOS
 ToblaRUADD7eda+QPsjJLyZ9ikjRZ+kJr8aeiFKPk8XybrLN+UXfqA902+pgaD9gXa/I
 eVUKc1v6Jo0m1xoK+S1tufP/97dFiQEEptL25qHLjI5kdYSUSQ/xInYjhGezl/SwKs3W
 D0KcusC53P5/xBnx6q0eRVcZjxqNFDFwdcHH0g0ol0Lh02t4y9zA5NjOdpE5Dmj0WvCM
 4Qy6fbxKsNKyW32WJTjs5dWlxK8w/dauN5Ay7TB8ZrAs9EQL4gJXArEFoZmEHMVcUlkJ
 mb2Q==
X-Gm-Message-State: AOAM53118EvI/Z7VNpI6e/MRcu6Rcoo/zS/u6e1h0OuEtWUarD+H5Odl
 QqgcYtNTbz1Dwi4lYDjjodXbNZwIgaA=
X-Google-Smtp-Source: ABdhPJyFegcgHD0JxJKxXyO2zJKacCOEcOdl4JWpcbwL8SbhdyCMurclxebCZYkqSYD1biMfgN1JAQ==
X-Received: by 2002:adf:c6c4:: with SMTP id c4mr3692701wrh.348.1611520125663; 
 Sun, 24 Jan 2021 12:28:45 -0800 (PST)
Received: from localhost.localdomain (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id m82sm19364651wmf.29.2021.01.24.12.28.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Jan 2021 12:28:45 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org,
	Bin Meng <bmeng.cn@gmail.com>
Subject: [PATCH v3 5/6] hw/sd: ssi-sd: Support single block write
Date: Sun, 24 Jan 2021 21:28:16 +0100
Message-Id: <20210124202817.2624557-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210124202817.2624557-1-f4bug@amsat.org>
References: <20210124202817.2624557-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x429.google.com
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
Cc: Pragnesh Patel <pragnesh.patel@sifive.com>,
 Bin Meng <bin.meng@windriver.com>, Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bin.meng@windriver.com>

Add 2 more states for the block write operation. The SPI host needs
to send a data start token to start the transfer, and the data block
written to the card will be acknowledged by a data response token.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20210123104016.17485-17-bmeng.cn@gmail.com>
[PMD: Change VMState version id 6 -> 7]
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/sd/ssi-sd.c | 44 ++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 40 insertions(+), 4 deletions(-)

diff --git a/hw/sd/ssi-sd.c b/hw/sd/ssi-sd.c
index 6d20a240c69..1205ad8b52c 100644
--- a/hw/sd/ssi-sd.c
+++ b/hw/sd/ssi-sd.c
@@ -43,6 +43,8 @@ typedef enum {
     SSI_SD_DATA_START,
     SSI_SD_DATA_READ,
     SSI_SD_DATA_CRC16,
+    SSI_SD_DATA_WRITE,
+    SSI_SD_SKIP_CRC16,
 } ssi_sd_mode;
 
 struct ssi_sd_state {
@@ -53,6 +55,7 @@ struct ssi_sd_state {
     uint8_t response[5];
     uint16_t crc16;
     int32_t read_bytes;
+    int32_t write_bytes;
     int32_t arglen;
     int32_t response_pos;
     int32_t stopping;
@@ -85,6 +88,9 @@ OBJECT_DECLARE_SIMPLE_TYPE(ssi_sd_state, SSI_SD)
 /* dummy value - don't care */
 #define SSI_DUMMY               0xff
 
+/* data accepted */
+#define DATA_RESPONSE_ACCEPTED  0x05
+
 static uint32_t ssi_sd_transfer(SSIPeripheral *dev, uint32_t val)
 {
     ssi_sd_state *s = SSI_SD(dev);
@@ -113,10 +119,17 @@ static uint32_t ssi_sd_transfer(SSIPeripheral *dev, uint32_t val)
 
     switch (s->mode) {
     case SSI_SD_CMD:
-        if (val == SSI_DUMMY) {
+        switch (val) {
+        case SSI_DUMMY:
             DPRINTF("NULL command\n");
             return SSI_DUMMY;
+            break;
+        case SSI_TOKEN_SINGLE:
+            DPRINTF("Start write block\n");
+            s->mode = SSI_SD_DATA_WRITE;
+            return SSI_DUMMY;
         }
+
         s->cmd = val & 0x3f;
         s->mode = SSI_SD_CMDARG;
         s->arglen = 0;
@@ -250,6 +263,27 @@ static uint32_t ssi_sd_transfer(SSIPeripheral *dev, uint32_t val)
             s->response_pos = 0;
         }
         return val;
+    case SSI_SD_DATA_WRITE:
+        sdbus_write_byte(&s->sdbus, val);
+        s->write_bytes++;
+        if (!sdbus_receive_ready(&s->sdbus) || s->write_bytes == 512) {
+            DPRINTF("Data write end\n");
+            s->mode = SSI_SD_SKIP_CRC16;
+            s->response_pos = 0;
+        }
+        return val;
+    case SSI_SD_SKIP_CRC16:
+        /* we don't verify the crc16 */
+        s->response_pos++;
+        if (s->response_pos == 2) {
+            DPRINTF("CRC16 receive end\n");
+            s->mode = SSI_SD_RESPONSE;
+            s->write_bytes = 0;
+            s->arglen = 1;
+            s->response[0] = DATA_RESPONSE_ACCEPTED;
+            s->response_pos = 0;
+        }
+        return SSI_DUMMY;
     }
     /* Should never happen.  */
     return SSI_DUMMY;
@@ -259,7 +293,7 @@ static int ssi_sd_post_load(void *opaque, int version_id)
 {
     ssi_sd_state *s = (ssi_sd_state *)opaque;
 
-    if (s->mode > SSI_SD_DATA_CRC16) {
+    if (s->mode > SSI_SD_SKIP_CRC16) {
         return -EINVAL;
     }
     if (s->mode == SSI_SD_CMDARG &&
@@ -277,8 +311,8 @@ static int ssi_sd_post_load(void *opaque, int version_id)
 
 static const VMStateDescription vmstate_ssi_sd = {
     .name = "ssi_sd",
-    .version_id = 6,
-    .minimum_version_id = 6,
+    .version_id = 7,
+    .minimum_version_id = 7,
     .post_load = ssi_sd_post_load,
     .fields = (VMStateField []) {
         VMSTATE_UINT32(mode, ssi_sd_state),
@@ -287,6 +321,7 @@ static const VMStateDescription vmstate_ssi_sd = {
         VMSTATE_UINT8_ARRAY(response, ssi_sd_state, 5),
         VMSTATE_UINT16(crc16, ssi_sd_state),
         VMSTATE_INT32(read_bytes, ssi_sd_state),
+        VMSTATE_INT32(write_bytes, ssi_sd_state),
         VMSTATE_INT32(arglen, ssi_sd_state),
         VMSTATE_INT32(response_pos, ssi_sd_state),
         VMSTATE_INT32(stopping, ssi_sd_state),
@@ -340,6 +375,7 @@ static void ssi_sd_reset(DeviceState *dev)
     memset(s->response, 0, sizeof(s->response));
     s->crc16 = 0;
     s->read_bytes = 0;
+    s->write_bytes = 0;
     s->arglen = 0;
     s->response_pos = 0;
     s->stopping = 0;
-- 
2.26.2


