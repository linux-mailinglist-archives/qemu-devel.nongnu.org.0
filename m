Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 907BF306DA4
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 07:34:04 +0100 (CET)
Received: from localhost ([::1]:42618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l50sV-0000Wp-AD
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 01:34:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l50pN-0006z0-UY; Thu, 28 Jan 2021 01:30:49 -0500
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:39822)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l50pM-0001Ak-4U; Thu, 28 Jan 2021 01:30:49 -0500
Received: by mail-pl1-x62f.google.com with SMTP id b17so2774062plz.6;
 Wed, 27 Jan 2021 22:30:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vM1qdMkN6F77URC3NRV2IHY8+Dmwaotpvyy9SZ1Xe3c=;
 b=F0bAViwOlcqC7i/lSgAX3JVuEsy6b3lLJr/LDHmuR5n9hSC11Ta70osVceQrQgY1TB
 vK4oSO+cu+W//UCbputsy+fWwGmwqU7I9EzDP5JxTOe2cy3xmysX7AVNgyH8n89Ee7sG
 GPWLWGM8VGsKDIDHwYhL48clfdPM0yMiyO38X6EdYupLfzgB/2a/AaiI5wB3CYnVcsnq
 ckFQ4g0Rp39NSI3Puongxy9Zc5mFnIikDlF0oXid4izgmbyBaQ3UCyjxMlV6quPBSrhG
 AIQZ731iwV5XrnPenjXOsg17kUX6+bz2Is5jV/XMCafxx8+hFsXzwBe0kYOrLO3tBb69
 9v2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vM1qdMkN6F77URC3NRV2IHY8+Dmwaotpvyy9SZ1Xe3c=;
 b=bcp6rYcBHv40CRXKY6cmnd4faLoFMZahBlu49g1GfFtsv+IqswCAZZWss1fo5EOFJI
 vzjQNVKLmI77bQKfqhwQfxvnuXtwyZCRQH/n29Hgrp+d7XPfOG98QDVxIgZESAgRbvAC
 Rnu2KQEaetsDLEHpedQkCz8yUt012DZoQIkmOBUElCHtc7kIyT22FNu0i+JwQwSw9Qzu
 zAUr/E+s4/OUgEvZKTdKJK4A9niNTGfiK3F2G5scukcOW9oTv4drQkkCBuPlc8dGQDsB
 JBrOfF4ul6TkOrLpv1XNjmJN5mY8MEgI3QPT/3n1o0xj8WdHNWuy/O6D08U/n3ZLjm8j
 Thhg==
X-Gm-Message-State: AOAM532GviKrsoEEEDD5AEhpwgfup2YukYLIvRWkG5jVj8XV9T0WnhoK
 yuM7Q94+C3jvlUQ9CFd3uww=
X-Google-Smtp-Source: ABdhPJyVKtWH2X1n+PNI9/hQ3OoET0X3ZbNAiKGTbdhHHu11NkDtn6fSMbn6tLiwb9Z5ScgdwBrzyg==
X-Received: by 2002:a17:903:228e:b029:de:2bee:150d with SMTP id
 b14-20020a170903228eb02900de2bee150dmr15269880plh.18.1611815446427; 
 Wed, 27 Jan 2021 22:30:46 -0800 (PST)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id t6sm4245080pfc.64.2021.01.27.22.30.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Jan 2021 22:30:45 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH v4 1/9] hw/sd: ssi-sd: Support multiple block read
Date: Thu, 28 Jan 2021 14:30:27 +0800
Message-Id: <20210128063035.15674-2-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210128063035.15674-1-bmeng.cn@gmail.com>
References: <20210128063035.15674-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pl1-x62f.google.com
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

In the case of a multiple block read operation every transferred
block has its suffix of CRC16. Update the state machine logic to
handle multiple block read.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
[PMD: Change VMState version id 5 -> 6]
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---

(no changes since v1)

 hw/sd/ssi-sd.c | 42 +++++++++++++++++++++++++++++++++---------
 1 file changed, 33 insertions(+), 9 deletions(-)

diff --git a/hw/sd/ssi-sd.c b/hw/sd/ssi-sd.c
index be1bb10164..6d20a240c6 100644
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
2.25.1


