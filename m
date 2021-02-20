Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BAC832022B
	for <lists+qemu-devel@lfdr.de>; Sat, 20 Feb 2021 01:21:51 +0100 (CET)
Received: from localhost ([::1]:52134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDG1t-0002pp-VC
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 19:21:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDFu9-0000o8-C7; Fri, 19 Feb 2021 19:13:49 -0500
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:43807)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDFu6-0005Wt-3X; Fri, 19 Feb 2021 19:13:49 -0500
Received: by mail-ed1-x52a.google.com with SMTP id d2so12662924edq.10;
 Fri, 19 Feb 2021 16:13:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=02M7HfeR1O9C/gJijTKiVQeyuhKE0/PPtd8pPEOGOuk=;
 b=Sk32K2oPN0bBLFaOwRWSGrzA4pjWUcI1bqGBnMqN3i8YKe7Gvn794AnhOU6OEx5nuH
 RzQgFSHhBzhgmhDdZEFX2ycQg9PDKfCXbwdL8md4EyHvtkOE91H4cjrEf/g9G3k5P+nR
 AaQJmy4ev8HYOa6ET2ciPjyXOLNKKi/vLu+nojQrd7llj/3rCcXm/DtsQAEGroW0WJV9
 16OU9lr8oU9anZhDtHgnpcNoLwONp8mSkOnBJ2VqQaVnWJmrgCCUE9205zVFSgwotsRD
 D49KQ+mSJO9pBj6VFBf7O+wAaq3nFDWARQujQ4s+Rwg8TvAnGuWxbR0aosF5QXPXljum
 dDTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=02M7HfeR1O9C/gJijTKiVQeyuhKE0/PPtd8pPEOGOuk=;
 b=Co6Onp5u5p+TRHk7SomA1nrh7Jl69le827dXq4P981lUYvuwshBkBpjXXrJdzUawId
 lOqR31nsn61Vl/kDPXctV64yrqh1B4UF+Ct6z5TRCUQoaCsxDjOXZMOIjgbvyk4hakzv
 1p43FdRvKXPIrKwXoba5tLuoy2XYR/HnOZqItnirAW5RSIJ1NBi7w4aS83dzKZkbAz6D
 yxMaEkZ6jD0OMBI6lC4H5M5T13G8IKueOdKV8NXu8AJeussX2rAfIX9XeGPTtpJ/Wvvi
 TyzlBE4l2HWxASFmEzW7ZM14UzM+/M4j13r9+VK+N5byISQtukV7Ge9TNddT4zRoOFr/
 mX8g==
X-Gm-Message-State: AOAM531h0rbftfHKxc55ZvibvwODGhSQ4v/GllwMdeyhPjO8dw3cDsI0
 OxYYlxzgiQgtXPqZkLQxUq9OsNXATXA=
X-Google-Smtp-Source: ABdhPJxIGurQM15Myq8VdqH7/rDLBbQvd3BzeufolaizPYsGw3Cg7WG8WPknoM/lGv+au7JWDW98Dg==
X-Received: by 2002:a50:fa89:: with SMTP id w9mr11475465edr.22.1613780024115; 
 Fri, 19 Feb 2021 16:13:44 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id t4sm2378460edw.24.2021.02.19.16.13.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Feb 2021 16:13:43 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 06/18] hw/sd: ssi-sd: Support multiple block write
Date: Sat, 20 Feb 2021 01:12:57 +0100
Message-Id: <20210220001309.2225022-7-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210220001309.2225022-1-f4bug@amsat.org>
References: <20210220001309.2225022-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x52a.google.com
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

For a multiple block write operation, each block begins with a multi
write start token. Unlike the SD mode that the multiple block write
ends when receiving a STOP_TRAN command (CMD12), a special stop tran
token is used to signal the card.

Emulating this by manually sending a CMD12 to the SD card core, to
bring it out of the receiving data state.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20210128063035.15674-7-bmeng.cn@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/sd/ssi-sd.c | 33 +++++++++++++++++++++++++++++++--
 1 file changed, 31 insertions(+), 2 deletions(-)

diff --git a/hw/sd/ssi-sd.c b/hw/sd/ssi-sd.c
index 1205ad8b52c..200e885225a 100644
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
2.26.2


