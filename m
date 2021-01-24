Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7EAE301EA5
	for <lists+qemu-devel@lfdr.de>; Sun, 24 Jan 2021 21:13:34 +0100 (CET)
Received: from localhost ([::1]:38848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l3llN-0004cl-PT
	for lists+qemu-devel@lfdr.de; Sun, 24 Jan 2021 15:13:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l3ljV-0002eo-2I; Sun, 24 Jan 2021 15:11:37 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:54854)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l3ljT-00086H-09; Sun, 24 Jan 2021 15:11:36 -0500
Received: by mail-wm1-x32e.google.com with SMTP id u14so2173221wml.4;
 Sun, 24 Jan 2021 12:11:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=azG5XzPp/6ZRHAy0TjMc2B6T/f3v9NNr1zArUdRagcQ=;
 b=sfRqk+XumWyD0xgDZrmsstFrJuXQ0kf+RgjYr+iGQGoXERjkwwZUmmDu8+L009Lmsm
 4bYVJPjEyni5HewZm3IQ520a4ytCDU1sV9BqUNtI+PCUD9xOCOsOuIxnsEQiw9YIR0oy
 z/SGfHEwht9GrDRRfLX8gJTlUYqmYCDEwdOzAN+UfNeW9/B7cfc4M3JHqi1ZpCI6zPBV
 iRg9VqMh5UbTWhHRt/8B3Pt0WXn1xWl6uP9XU8CTl8cQyBRwAm8eAvQNqKLO6gm4IAeF
 F2ZZSRJuyRcS814NDo/1vnRC2aLhxQtDz8ndZQrXS3SaeD47f6ciq54GtZxGJb70Q/ED
 bb4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=azG5XzPp/6ZRHAy0TjMc2B6T/f3v9NNr1zArUdRagcQ=;
 b=qZqOSQ4eSAZRZ41PofMOidL2n1FFqRqUDm/xe0WBLTPAjhp8dxbY5BG177hAK2oG5P
 iZ7N44+zkYp/GdDmQ3fBkw/XP/lw25jKnk4q4BZlqnYTT8ddfWJUEURGjw9AZ5RaIpc5
 B6ty7hNlumuNY2xR11aU2tUc7YNnC507JRw9QzixcKAxmywDWc6tdkiyhfOIJ8wuJTzC
 l5MdzMTipfyiBm7rAR17WnnAD2RgRXMQXu2sPf4Z7xuzLXEGsGfGyTSp2obZZCzDhlP5
 FSdDr/6w9HNZnxzGg8UAAw2kVmgennpDVRFHqPy6Q46Gm1xfKyF/1q+E2oAAm1I+jqnc
 iSHQ==
X-Gm-Message-State: AOAM531cNC9mcj/eoQ4vPecLbtV4WJuVbXjAmr/jhy10UZ/7WsvraspZ
 y6jlgnMTo0h9X48sgcrW6g0Z9Aznlx8=
X-Google-Smtp-Source: ABdhPJxumd4XypZkhbsxeJA3Ww995/hZ5X68B6CI3XKragxrObBGunRGttV+PbvUUDX2fhJdagFaCw==
X-Received: by 2002:a1c:a406:: with SMTP id n6mr3220348wme.53.1611519093071;
 Sun, 24 Jan 2021 12:11:33 -0800 (PST)
Received: from localhost.localdomain (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id p15sm20093565wrt.15.2021.01.24.12.11.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Jan 2021 12:11:32 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 5/9] hw/sd: ssi-sd: Suffix a data block with CRC16
Date: Sun, 24 Jan 2021 21:11:02 +0100
Message-Id: <20210124201106.2602238-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210124201106.2602238-1-f4bug@amsat.org>
References: <20210124201106.2602238-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32e.google.com
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

Per the SD spec, a valid data block is suffixed with a 16-bit CRC
generated by the standard CCITT polynomial x16+x12+x5+1. This part
is currently missing in the ssi-sd state machine. Without it, all
data block transfer fails in guest software because the expected
CRC16 is missing on the data out line.

Fixes: 775616c3ae8c ("Partial SD card SPI mode support")
Signed-off-by: Bin Meng <bin.meng@windriver.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210123104016.17485-8-bmeng.cn@gmail.com>
[PMD: Change VMState version id 3 -> 4,
      check s->mode validity in post_load()]
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/sd/ssi-sd.c | 23 ++++++++++++++++++++---
 1 file changed, 20 insertions(+), 3 deletions(-)

diff --git a/hw/sd/ssi-sd.c b/hw/sd/ssi-sd.c
index d97646795a2..08852dc8d4b 100644
--- a/hw/sd/ssi-sd.c
+++ b/hw/sd/ssi-sd.c
@@ -17,6 +17,7 @@
 #include "hw/qdev-properties.h"
 #include "hw/sd/sd.h"
 #include "qapi/error.h"
+#include "qemu/crc-ccitt.h"
 #include "qemu/module.h"
 #include "qom/object.h"
 
@@ -40,6 +41,7 @@ typedef enum {
     SSI_SD_RESPONSE,
     SSI_SD_DATA_START,
     SSI_SD_DATA_READ,
+    SSI_SD_DATA_CRC16,
 } ssi_sd_mode;
 
 struct ssi_sd_state {
@@ -48,6 +50,7 @@ struct ssi_sd_state {
     int cmd;
     uint8_t cmdarg[4];
     uint8_t response[5];
+    uint16_t crc16;
     int32_t arglen;
     int32_t response_pos;
     int32_t stopping;
@@ -194,12 +197,24 @@ static uint32_t ssi_sd_transfer(SSIPeripheral *dev, uint32_t val)
     case SSI_SD_DATA_START:
         DPRINTF("Start read block\n");
         s->mode = SSI_SD_DATA_READ;
+        s->response_pos = 0;
         return 0xfe;
     case SSI_SD_DATA_READ:
         val = sdbus_read_byte(&s->sdbus);
+        s->crc16 = crc_ccitt_false(s->crc16, (uint8_t *)&val, 1);
         if (!sdbus_data_ready(&s->sdbus)) {
             DPRINTF("Data read end\n");
+            s->mode = SSI_SD_DATA_CRC16;
+        }
+        return val;
+    case SSI_SD_DATA_CRC16:
+        val = (s->crc16 & 0xff00) >> 8;
+        s->crc16 <<= 8;
+        s->response_pos++;
+        if (s->response_pos == 2) {
+            DPRINTF("CRC16 read end\n");
             s->mode = SSI_SD_CMD;
+            s->response_pos = 0;
         }
         return val;
     }
@@ -211,7 +226,7 @@ static int ssi_sd_post_load(void *opaque, int version_id)
 {
     ssi_sd_state *s = (ssi_sd_state *)opaque;
 
-    if (s->mode > SSI_SD_DATA_READ) {
+    if (s->mode > SSI_SD_DATA_CRC16) {
         return -EINVAL;
     }
     if (s->mode == SSI_SD_CMDARG &&
@@ -229,14 +244,15 @@ static int ssi_sd_post_load(void *opaque, int version_id)
 
 static const VMStateDescription vmstate_ssi_sd = {
     .name = "ssi_sd",
-    .version_id = 3,
-    .minimum_version_id = 3,
+    .version_id = 4,
+    .minimum_version_id = 4,
     .post_load = ssi_sd_post_load,
     .fields = (VMStateField []) {
         VMSTATE_UINT32(mode, ssi_sd_state),
         VMSTATE_INT32(cmd, ssi_sd_state),
         VMSTATE_UINT8_ARRAY(cmdarg, ssi_sd_state, 4),
         VMSTATE_UINT8_ARRAY(response, ssi_sd_state, 5),
+        VMSTATE_UINT16(crc16, ssi_sd_state),
         VMSTATE_INT32(arglen, ssi_sd_state),
         VMSTATE_INT32(response_pos, ssi_sd_state),
         VMSTATE_INT32(stopping, ssi_sd_state),
@@ -288,6 +304,7 @@ static void ssi_sd_reset(DeviceState *dev)
     s->cmd = 0;
     memset(s->cmdarg, 0, sizeof(s->cmdarg));
     memset(s->response, 0, sizeof(s->response));
+    s->crc16 = 0;
     s->arglen = 0;
     s->response_pos = 0;
     s->stopping = 0;
-- 
2.26.2


