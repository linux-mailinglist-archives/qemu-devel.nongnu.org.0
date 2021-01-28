Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 321F7306DBC
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 07:42:43 +0100 (CET)
Received: from localhost ([::1]:60258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l510s-0008Is-6v
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 01:42:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l50pZ-0007PH-J3; Thu, 28 Jan 2021 01:31:01 -0500
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:41040)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l50pX-0001Ef-7U; Thu, 28 Jan 2021 01:31:01 -0500
Received: by mail-pl1-x636.google.com with SMTP id h15so2765329pli.8;
 Wed, 27 Jan 2021 22:30:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=afDz9PCYu5aSX7IpsLMahZVGXDBSh7683K7tqxoMULI=;
 b=GhHWurhyv5dWvH/FBnFcVRBjV8cMa7ZLRN0j9JqvsvUHQSGaG6f6QvhcF4dkJyxZHo
 lNYAFilLfqtG7SNzaif9pO4r6faygVGxaH4lQzyDmwRsVuOh5WKMyet/oymVbqzP5MaB
 bURN6LtcXs9Y4n6/0J2x64wwnGlPUkN8LRC6fgTVMb3dvn/gq75m4WxjK+dRtUaP7nUK
 i6BIZnOEmvIo4zg5MpsAkv/FFKByNXJrIkuTWkiDiz5W/OK0CgQCIA0l9K9EWzn/YVmK
 9d6W93LYmx/k+matL2SDgjMNdeTsZp9Om72myT0RF3NucQg3b3w5I1K8m8DQ+f1XgnRl
 Rm9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=afDz9PCYu5aSX7IpsLMahZVGXDBSh7683K7tqxoMULI=;
 b=iOzEa9vB+uTZjGeqxLAsUeV7YAoxSthyBMIzCfCXrg0AqSk/jiMztoRKJGYaw8K8tz
 Bqbdx97N+hIrwOT60DIhuVMUfq7kr11JlpnS4UPhcUlvJUkMefhQ8j36uGSUsCGuv6Yx
 plnlVZSKjXQnQr8cvpnN3JYbyAF3tOroJk/GWAOcOpbHb+UF5n9AWakR9Rt9VWlORC6d
 qyU0KqX/ViZVgmEx0r6if9j0pKt7+4ghdQMuUdnM+FpkWGKt/6M+QdMqG0mj9rPc9eec
 Evn1F7PFgPT64KA+qWUJoa8+z4OdxcYf1fmb1uXJx0x4zBUZlZt9qvk8CdeVA6XWhytL
 k4GA==
X-Gm-Message-State: AOAM532hkxwpRGGZcdB78fSKn6ptFex1Gm0gXtyJdXROtFbnKLUFoTJz
 xqYNJBlHaACI48sHfGHmG6w=
X-Google-Smtp-Source: ABdhPJzgs/8BOOg5l1Ui1z7DZIbDD963QV+sbZX9N0P+VKsn0+4UlDbB0FNRzWmnWDKnbynkD2UMzA==
X-Received: by 2002:a17:90b:4acc:: with SMTP id
 mh12mr9678110pjb.10.1611815457678; 
 Wed, 27 Jan 2021 22:30:57 -0800 (PST)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id t6sm4245080pfc.64.2021.01.27.22.30.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Jan 2021 22:30:57 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH v4 6/9] hw/sd: ssi-sd: Support multiple block write
Date: Thu, 28 Jan 2021 14:30:32 +0800
Message-Id: <20210128063035.15674-7-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210128063035.15674-1-bmeng.cn@gmail.com>
References: <20210128063035.15674-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pl1-x636.google.com
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

For a multiple block write operation, each block begins with a multi
write start token. Unlike the SD mode that the multiple block write
ends when receiving a STOP_TRAN command (CMD12), a special stop tran
token is used to signal the card.

Emulating this by manually sending a CMD12 to the SD card core, to
bring it out of the receiving data state.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

---

Changes in v4:
- Keep the card state to SSI_SD_CMD instead of SSI_SD_RESPONSE after
  receiving the STOP_TRAN token per the spec

 hw/sd/ssi-sd.c | 33 +++++++++++++++++++++++++++++++--
 1 file changed, 31 insertions(+), 2 deletions(-)

diff --git a/hw/sd/ssi-sd.c b/hw/sd/ssi-sd.c
index 1205ad8b52..200e885225 100644
--- a/hw/sd/ssi-sd.c
+++ b/hw/sd/ssi-sd.c
@@ -4,6 +4,11 @@
  * Copyright (c) 2007-2009 CodeSourcery.
  * Written by Paul Brook
  *
+ * Copyright (c) 2021 Wind River Systems, Inc.
+ * Improved by Bin Meng <bin.meng@windriver.com>
+ *
+ * Validated with U-Boot v2021.01 and Linux v5.10 mmc_spi driver
+ *
  * This code is licensed under the GNU GPL v2.
  *
  * Contributions after 2012-01-13 are licensed under the terms of the
@@ -82,6 +87,10 @@ OBJECT_DECLARE_SIMPLE_TYPE(ssi_sd_state, SSI_SD)
 #define SSI_SDR_ADDRESS_ERROR   0x2000
 #define SSI_SDR_PARAMETER_ERROR 0x4000
 
+/* multiple block write */
+#define SSI_TOKEN_MULTI_WRITE   0xfc
+/* terminate multiple block write */
+#define SSI_TOKEN_STOP_TRAN     0xfd
 /* single block read/write, multiple block read */
 #define SSI_TOKEN_SINGLE        0xfe
 
@@ -94,6 +103,8 @@ OBJECT_DECLARE_SIMPLE_TYPE(ssi_sd_state, SSI_SD)
 static uint32_t ssi_sd_transfer(SSIPeripheral *dev, uint32_t val)
 {
     ssi_sd_state *s = SSI_SD(dev);
+    SDRequest request;
+    uint8_t longresp[16];
 
     /*
      * Special case: allow CMD12 (STOP TRANSMISSION) while reading data.
@@ -125,8 +136,28 @@ static uint32_t ssi_sd_transfer(SSIPeripheral *dev, uint32_t val)
             return SSI_DUMMY;
             break;
         case SSI_TOKEN_SINGLE:
+        case SSI_TOKEN_MULTI_WRITE:
             DPRINTF("Start write block\n");
             s->mode = SSI_SD_DATA_WRITE;
+            return SSI_DUMMY;
+        case SSI_TOKEN_STOP_TRAN:
+            DPRINTF("Stop multiple write\n");
+
+            /* manually issue cmd12 to stop the transfer */
+            request.cmd = 12;
+            request.arg = 0;
+            s->arglen = sdbus_do_command(&s->sdbus, &request, longresp);
+            if (s->arglen <= 0) {
+                s->arglen = 1;
+                /* a zero value indicates the card is busy */
+                s->response[0] = 0;
+                DPRINTF("SD card busy\n");
+            } else {
+                s->arglen = 1;
+                /* a non-zero value indicates the card is ready */
+                s->response[0] = SSI_DUMMY;
+            }
+
             return SSI_DUMMY;
         }
 
@@ -136,8 +167,6 @@ static uint32_t ssi_sd_transfer(SSIPeripheral *dev, uint32_t val)
         return SSI_DUMMY;
     case SSI_SD_CMDARG:
         if (s->arglen == 4) {
-            SDRequest request;
-            uint8_t longresp[16];
             /* FIXME: Check CRC.  */
             request.cmd = s->cmd;
             request.arg = ldl_be_p(s->cmdarg);
-- 
2.25.1


