Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2289306DA9
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 07:37:56 +0100 (CET)
Received: from localhost ([::1]:51576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l50wF-0004Vf-T3
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 01:37:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l50pX-0007Ni-Us; Thu, 28 Jan 2021 01:30:59 -0500
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:45124)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l50pV-0001Dm-4w; Thu, 28 Jan 2021 01:30:59 -0500
Received: by mail-pl1-x62e.google.com with SMTP id b8so2759444plh.12;
 Wed, 27 Jan 2021 22:30:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kiZzURgNKUaKMTl+/k2tJPs5zx6O3LyssmArnoO6Yl0=;
 b=jOHE+Ljegb5xTqZmPlAXhMaCi9IIpaLTlTZHe5fiuj0LjvnVXKKFcNqdX3lj/mtGft
 A0XXI3p1iX1TABZktR9umgAk1WRZTKm7BAN4Fxt7rc2hxEtl2WN8bUuh84uHrpg6/LaV
 gH2MivO5UgEjIMchEA4FaNrN2ZNv8Ksm4ffjgeyWTi1AAAknMHYPnN726b9JGae5XPV1
 8SHdslJZWViSlHlqldy9NFs6VMKq3lhPGRu8po4q6OBW9sSL00vbWoMlrkfY4FNu/M8Z
 TlCyvM6r5wI41TQZQKsrbOeMmsYLXIXRt2FA8/ikm63JzqN2KC9Om4ESrE1VY6x/TlGj
 axLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kiZzURgNKUaKMTl+/k2tJPs5zx6O3LyssmArnoO6Yl0=;
 b=i0Z+VYpLnPdDLPB7K94HwS0nmh3S7REOEQ576LHDG5MCLa0KMkjVFbfIl99iD5+8cX
 hA9C8C4wVn1X4o/9QFFWfu9oE+UOgb9lYuwdFth9jHYl/MByXWq6UHurZL8QKuWkantZ
 whOcMLA8DmvoBSbwjRXhXXane+aqLc6wy1jppuQGE6YzZKWP/ligGeyqrGocg8xR9RMp
 3zGgcj/0wfzRbjx5vxVBhNyine6mY5X3eQG1UhrRSE3CZwZDeQPcGpZo95dZqPsuim4Z
 p5Qaix2vYiCHTWKT5RgqmTjTc0QXkqfYDhLZfIUFT7tiqS7Gp9k+e6jnGf/jZ30BHjUp
 0uYA==
X-Gm-Message-State: AOAM530JHGp74PPzaNds7vtihuaoqmuwq83PkShzrauUo/7VmDZAymFv
 HTZ+f8lwOHrelBMF/5gR43Vms5ZWj8M0pA==
X-Google-Smtp-Source: ABdhPJw1Dcindqpig794Em8dkeY6Ft1AF85Z0iTa9dGsa47NeUR2jjGG0Cs12PJe8K+VLHvw2eUamg==
X-Received: by 2002:a17:902:7008:b029:df:fb48:8c3a with SMTP id
 y8-20020a1709027008b02900dffb488c3amr14780318plk.19.1611815455414; 
 Wed, 27 Jan 2021 22:30:55 -0800 (PST)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id t6sm4245080pfc.64.2021.01.27.22.30.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Jan 2021 22:30:55 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH v4 5/9] hw/sd: ssi-sd: Support single block write
Date: Thu, 28 Jan 2021 14:30:31 +0800
Message-Id: <20210128063035.15674-6-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210128063035.15674-1-bmeng.cn@gmail.com>
References: <20210128063035.15674-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bin.meng@windriver.com>

Add 2 more states for the block write operation. The SPI host needs
to send a data start token to start the transfer, and the data block
written to the card will be acknowledged by a data response token.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
[PMD: Change VMState version id 6 -> 7]
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---

(no changes since v1)

 hw/sd/ssi-sd.c | 44 ++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 40 insertions(+), 4 deletions(-)

diff --git a/hw/sd/ssi-sd.c b/hw/sd/ssi-sd.c
index 6d20a240c6..1205ad8b52 100644
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
2.25.1


