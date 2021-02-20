Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21B96320223
	for <lists+qemu-devel@lfdr.de>; Sat, 20 Feb 2021 01:17:47 +0100 (CET)
Received: from localhost ([::1]:37820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDFxy-0005NL-3D
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 19:17:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDFth-0000Fd-AP; Fri, 19 Feb 2021 19:13:21 -0500
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:36270)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDFtf-0005KF-J6; Fri, 19 Feb 2021 19:13:21 -0500
Received: by mail-ej1-x633.google.com with SMTP id do6so16929453ejc.3;
 Fri, 19 Feb 2021 16:13:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/u/xjf4UYFb69kyu3yFPBKnJe5Gy0CQG9X8dWyHsftQ=;
 b=VIzQS8y+ecHm3uvQeKJVueeuStSdzbRKyYrXRQqvX0q12Yjf2HoyHbhhGaw+o6CQGG
 nbvLtHxLA1WMIYO0CZcXVf4ncGWXTX3Sr7JZMjOP9BlEy51/sibKusyYTPaZopb+oGQf
 +DTslNjynxk78V2NLehCRBdI8UcsThNt1xfc+HzrikV4JRPa9fxUXWeoG5rHo0mPR+gs
 ps3P8a//pVDfS+BovAlQcFM5AlTeK2xZzyvBJvPE07hYLiSHNEj6ojJ4NmHJTPDOLOh1
 DHtI/Fo5W9T2BrGHM0u48SgyqIuIfh+LTHKZK/NntmwbHWNcw2adYSUauzZPlQ2FXsZd
 C46Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=/u/xjf4UYFb69kyu3yFPBKnJe5Gy0CQG9X8dWyHsftQ=;
 b=izsqMP0ZyQq2W+UeQOQyHe94fUH8YDcYjrY01DHzqZrDnoQ5gpbVNglKXgsBlfiM1K
 MTeofSGRCZJJQpevtqht4UmTA3r7pR+tH6WkBE61HigG5nIJusKr8JzRdFJKedPV+fDE
 4CY7r624AneefDbx23CQaAaXT5R7kF+lUoiNxiBlD7RlpsOpA0HMJ63gipyz/4FZDLio
 Ep3fb4XQ+gigetrc0fYVxNrOoWDWSY9DDZF7og+us+bnUnTv1oZP85I9dnGmAAjYStil
 cEboKTRFQ5tY7W4k/N9caXjXzmwktE03xWvR+qQFYQSCyrcjzmowx+BwARvc0BmED6Xj
 pyNw==
X-Gm-Message-State: AOAM532D9YYjnFQ6ZN6tPlGUF1nt8wJaMa3rzCeSF+kGB+bQx1i5XekC
 2oLyS6/SbpYS8vIZAGv4ZJLsFRtmrTQ=
X-Google-Smtp-Source: ABdhPJwkT4QxH8ZRDePCzdamCNx+78ChKXQiAknGagchqWQdrRVF8eWanV0n5x2M/vTMkX8Y0uYrbw==
X-Received: by 2002:a17:906:9259:: with SMTP id
 c25mr10982020ejx.37.1613779997553; 
 Fri, 19 Feb 2021 16:13:17 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id kz4sm5357871ejc.38.2021.02.19.16.13.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Feb 2021 16:13:16 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 01/18] hw/sd: ssi-sd: Support multiple block read
Date: Sat, 20 Feb 2021 01:12:52 +0100
Message-Id: <20210220001309.2225022-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210220001309.2225022-1-f4bug@amsat.org>
References: <20210220001309.2225022-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x633.google.com
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
Cc: Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bin.meng@windriver.com>

In the case of a multiple block read operation every transferred
block has its suffix of CRC16. Update the state machine logic to
handle multiple block read.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
[PMD: Change VMState version id 5 -> 6]
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20210128063035.15674-2-bmeng.cn@gmail.com>
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


