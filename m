Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DACC3320221
	for <lists+qemu-devel@lfdr.de>; Sat, 20 Feb 2021 01:15:39 +0100 (CET)
Received: from localhost ([::1]:60134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDFvu-0002sH-MZ
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 19:15:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDFu2-0000fU-Iy; Fri, 19 Feb 2021 19:13:42 -0500
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:46628)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDFu0-0005Uj-MN; Fri, 19 Feb 2021 19:13:42 -0500
Received: by mail-ej1-x62b.google.com with SMTP id gg8so5534674ejb.13;
 Fri, 19 Feb 2021 16:13:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KigaGHfB9MhYavkx3CvoXXkkmhzaw5PYFB81q76DTIg=;
 b=lDmehx+azURW9GiFet5/oVK/MRtdLSf+beQk5TNJZBeRZAwepdT81CCk/qiFIq6U6p
 JuukrOx+ZBVhXJkLLtZvDDWTBoHJedhxTKUZDLSYNln3ADZCYCZjuOFfU7EtNWGF7UPw
 0yIZEk6QVoX+lm1A/hlJoLjT/Jnvbna9MOqdgp9EqMkmI6nspKBO9pu2fhu6fefP+mO6
 6/U/mOKAO9vUL5P++Y2wp4DF9bww+CfpbjM1NwGHHyLyBaauh7rQaQzQwvC/aFQixZoP
 qIAUPsh1gCnCGHKxrQm4H1rU3XON9qyC1sMfw54OUaz6QZ0IOf/v4gmC8k0PIyO8KjJk
 L/BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=KigaGHfB9MhYavkx3CvoXXkkmhzaw5PYFB81q76DTIg=;
 b=mp9V0SdVglhGHaqV+rPh6u7A+Sf/at96+rLnLpkSobP6efRbQP3iKv0upvAs9g8ST2
 hPZt7Lvw5k2dBn/JOqq6wNBB9Hf8Frz8pj/kxj1HdKLRkI6wt8gGuM4Dh0Z/pOOR2AMy
 2yGAPAtb8Rw7pHMOGE9d2U6ZoNv4OrMnn3cIR3V2AYZmKmpkuERpCkzic+oRpqBPBU7I
 fTeBK4MTmWFDrorE4+PtlXNsjE1aAM+Hb4EunqOmf5v6l00ASkuxPRwzF4z+GihVK28J
 PtgrdRj90qdhwq4J1pSe+YmM6zB3WZlCGgaKFljIlIKY6XfJuKxwkymPtRToo40maL0c
 1McA==
X-Gm-Message-State: AOAM5335uMmmQiBp0a0giKuPvVhYRXn/ih3AaqeD/2IWZ+YyMFJGY9UH
 r31R9Q3u17cuWg0Kq5LCOfsn9fPFyTM=
X-Google-Smtp-Source: ABdhPJywSxWfmB7M5nIDS0wowbfEaVEoMgGMvwXqc72+g9Y5XE55jW1S6jEmlUKI90WWjUQVAX1A1Q==
X-Received: by 2002:a17:906:6096:: with SMTP id
 t22mr11280734ejj.34.1613780018760; 
 Fri, 19 Feb 2021 16:13:38 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id dm20sm6289304edb.59.2021.02.19.16.13.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Feb 2021 16:13:38 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 05/18] hw/sd: ssi-sd: Support single block write
Date: Sat, 20 Feb 2021 01:12:56 +0100
Message-Id: <20210220001309.2225022-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210220001309.2225022-1-f4bug@amsat.org>
References: <20210220001309.2225022-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x62b.google.com
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

Add 2 more states for the block write operation. The SPI host needs
to send a data start token to start the transfer, and the data block
written to the card will be acknowledged by a data response token.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
[PMD: Change VMState version id 6 -> 7]
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20210128063035.15674-6-bmeng.cn@gmail.com>
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


