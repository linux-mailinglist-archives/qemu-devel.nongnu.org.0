Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50C87301EB7
	for <lists+qemu-devel@lfdr.de>; Sun, 24 Jan 2021 21:30:54 +0100 (CET)
Received: from localhost ([::1]:42664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l3m29-0001ul-BD
	for lists+qemu-devel@lfdr.de; Sun, 24 Jan 2021 15:30:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l3lzp-0000J0-AH; Sun, 24 Jan 2021 15:28:29 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:35591)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l3lzn-0005LT-KY; Sun, 24 Jan 2021 15:28:29 -0500
Received: by mail-wr1-x431.google.com with SMTP id l12so10264194wry.2;
 Sun, 24 Jan 2021 12:28:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vbPgcE8iMHZqcnJv4lm0MKaKfzQFYn4DZYh80ZJfCVg=;
 b=rU7F7V+Jx17yHER5emQDtiYKjj+I6z3sn4wtgHJSJ9Q7VYrQu0hBpjb9Tsc1tpAxxo
 ssFAaMBizane7hab6SwLDoXP/V6qSoMsjYX+28zE1Ho4zyL+okjP+dbOP7bS9m4OXAZq
 n45h1af5wkm8iOFgMEggUPXa+kPxp2wp+PKEGRmf1i1UkNO5Zg+ku0zNIdBoOr8TdTc7
 j5atjYitcdnxV/eEWNqjg+fDb5WlXe+MtoB/lrIUXFbFkwKEaG9Uowp45SHqGnnXb4o0
 xDDoBDrggJnnPCnDSEG9l0gUNzrmtmsIv7zJ4+CcJInpftF8Nvxf3jVNjeMyh6OidyEZ
 HSxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=vbPgcE8iMHZqcnJv4lm0MKaKfzQFYn4DZYh80ZJfCVg=;
 b=c5yxaxxLNPWPinKlOxoFNPhz0tmghkBePc+s6AJB9i4wFRlN/LKbGoWdpoteq1sXLy
 F1h9itoM0QbafCiB/zjAnlqT97B2HDAP3PcbM69OZjrCxTbOJb2VU+t/jdQ+/LqNPWX1
 7h+S2TCxTVZSkbUqFibc7gIlIdZ/QEbkLMGY3xtlamBPY3/6NQlHZrC1fv9vcihpEfHP
 rKaoIO4eSVfE1lTiQJYuEy8lYwquE6Y+tXUya/EN7Z1K7oylWGTWcZj5KkZ1lGMSq+VR
 mOolulYuL3t8tYaDgNH8F1AJZ0AxwWXvj4IU8G+/HHWUYExwTEyyB4zH92pr7fExnfmq
 OGrA==
X-Gm-Message-State: AOAM531qWzrRFJQuZ/KWoXlH419jmT2NwBOFjUTPMPpsrkMa3U9izLJr
 UHnxCCHpiUyl9Q6OG92B6ym/5TrN5QU=
X-Google-Smtp-Source: ABdhPJy/9zyS+y5qLEzys8BJ+U+V+A1D/WzpUBrD9VGOTtRtHRY+nG0L6RIrT9FE9Hqe5M79PA6FkQ==
X-Received: by 2002:a05:6000:1ce:: with SMTP id
 t14mr2852074wrx.297.1611520105301; 
 Sun, 24 Jan 2021 12:28:25 -0800 (PST)
Received: from localhost.localdomain (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id u142sm11558013wmu.3.2021.01.24.12.28.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Jan 2021 12:28:24 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org,
	Bin Meng <bmeng.cn@gmail.com>
Subject: [PATCH v3 1/6] hw/sd: ssi-sd: Support multiple block read
Date: Sun, 24 Jan 2021 21:28:12 +0100
Message-Id: <20210124202817.2624557-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210124202817.2624557-1-f4bug@amsat.org>
References: <20210124202817.2624557-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x431.google.com
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

In the case of a multiple block read operation every transferred
block has its suffix of CRC16. Update the state machine logic to
handle multiple block read.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20210123104016.17485-11-bmeng.cn@gmail.com>
[PMD: Change VMState version id 5 -> 6]
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/sd/ssi-sd.c | 42 +++++++++++++++++++++++++++++++++---------
 1 file changed, 33 insertions(+), 9 deletions(-)

diff --git a/hw/sd/ssi-sd.c b/hw/sd/ssi-sd.c
index be1bb101645..6d20a240c69 100644
--- a/hw/sd/ssi-sd.c
+++ b/hw/sd/ssi-sd.c
@@ -52,6 +52,7 @@ struct ssi_sd_state {
     uint8_t cmdarg[4];
     uint8_t response[5];
     uint16_t crc16;
+    int32_t read_bytes;
     int32_t arglen;
     int32_t response_pos;
     int32_t stopping;
@@ -88,11 +89,26 @@ static uint32_t ssi_sd_transfer(SSIPeripheral *dev, uint32_t val)
 {
     ssi_sd_state *s = SSI_SD(dev);
 
-    /* Special case: allow CMD12 (STOP TRANSMISSION) while reading data.  */
-    if (s->mode == SSI_SD_DATA_READ && val == 0x4c) {
-        s->mode = SSI_SD_CMD;
-        /* There must be at least one byte delay before the card responds.  */
-        s->stopping = 1;
+    /*
+     * Special case: allow CMD12 (STOP TRANSMISSION) while reading data.
+     *
+     * See "Physical Layer Specification Version 8.00" chapter 7.5.2.2,
+     * to avoid conflict between CMD12 response and next data block,
+     * timing of CMD12 should be controlled as follows:
+     *
+     * - CMD12 issued at the timing that end bit of CMD12 and end bit of
+     *   data block is overlapped
+     * - CMD12 issued after one clock cycle after host receives a token
+     *   (either Start Block token or Data Error token)
+     *
+     * We need to catch CMD12 in all of the data read states.
+     */
+    if (s->mode >= SSI_SD_PREP_DATA && s->mode <= SSI_SD_DATA_CRC16) {
+        if (val == 0x4c) {
+            s->mode = SSI_SD_CMD;
+            /* There must be at least one byte delay before the card responds */
+            s->stopping = 1;
+        }
     }
 
     switch (s->mode) {
@@ -212,8 +228,9 @@ static uint32_t ssi_sd_transfer(SSIPeripheral *dev, uint32_t val)
         return SSI_TOKEN_SINGLE;
     case SSI_SD_DATA_READ:
         val = sdbus_read_byte(&s->sdbus);
+        s->read_bytes++;
         s->crc16 = crc_ccitt_false(s->crc16, (uint8_t *)&val, 1);
-        if (!sdbus_data_ready(&s->sdbus)) {
+        if (!sdbus_data_ready(&s->sdbus) || s->read_bytes == 512) {
             DPRINTF("Data read end\n");
             s->mode = SSI_SD_DATA_CRC16;
         }
@@ -224,7 +241,12 @@ static uint32_t ssi_sd_transfer(SSIPeripheral *dev, uint32_t val)
         s->response_pos++;
         if (s->response_pos == 2) {
             DPRINTF("CRC16 read end\n");
-            s->mode = SSI_SD_CMD;
+            if (s->read_bytes == 512 && s->cmd != 17) {
+                s->mode = SSI_SD_PREP_DATA;
+            } else {
+                s->mode = SSI_SD_CMD;
+            }
+            s->read_bytes = 0;
             s->response_pos = 0;
         }
         return val;
@@ -255,8 +277,8 @@ static int ssi_sd_post_load(void *opaque, int version_id)
 
 static const VMStateDescription vmstate_ssi_sd = {
     .name = "ssi_sd",
-    .version_id = 5,
-    .minimum_version_id = 5,
+    .version_id = 6,
+    .minimum_version_id = 6,
     .post_load = ssi_sd_post_load,
     .fields = (VMStateField []) {
         VMSTATE_UINT32(mode, ssi_sd_state),
@@ -264,6 +286,7 @@ static const VMStateDescription vmstate_ssi_sd = {
         VMSTATE_UINT8_ARRAY(cmdarg, ssi_sd_state, 4),
         VMSTATE_UINT8_ARRAY(response, ssi_sd_state, 5),
         VMSTATE_UINT16(crc16, ssi_sd_state),
+        VMSTATE_INT32(read_bytes, ssi_sd_state),
         VMSTATE_INT32(arglen, ssi_sd_state),
         VMSTATE_INT32(response_pos, ssi_sd_state),
         VMSTATE_INT32(stopping, ssi_sd_state),
@@ -316,6 +339,7 @@ static void ssi_sd_reset(DeviceState *dev)
     memset(s->cmdarg, 0, sizeof(s->cmdarg));
     memset(s->response, 0, sizeof(s->response));
     s->crc16 = 0;
+    s->read_bytes = 0;
     s->arglen = 0;
     s->response_pos = 0;
     s->stopping = 0;
-- 
2.26.2


