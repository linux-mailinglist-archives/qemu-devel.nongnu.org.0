Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A6A0301EA9
	for <lists+qemu-devel@lfdr.de>; Sun, 24 Jan 2021 21:16:05 +0100 (CET)
Received: from localhost ([::1]:45558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l3lno-0007Pr-E2
	for lists+qemu-devel@lfdr.de; Sun, 24 Jan 2021 15:16:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l3ljB-0002S9-U2; Sun, 24 Jan 2021 15:11:18 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:46750)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l3ljA-00080O-Ef; Sun, 24 Jan 2021 15:11:17 -0500
Received: by mail-wr1-x432.google.com with SMTP id q7so10203956wre.13;
 Sun, 24 Jan 2021 12:11:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nIGaYtMUtzLf5rdS8bkm2HkUPDJfWchz2YtNrxVRdq4=;
 b=HtUkrZQQUwxE9iQHgWW0HYZYroH1MLW8/th3GSat2+2/k054Q5Fb1CyFLMXm74B6MV
 r/U0NPRT5pOkZ5+0lGAuDZZfsjcY1E4HirC8YU0jQLeQxaZSVGBTMU9W5SmQL2L5jU5f
 jt+9NsQ39BC2P64qClQPyklThDiyydrRbjkBuU5c5C7Uj4HzN1qaFSOaYinnWYY/ZKZL
 gIYyafz0XDbnFBtYRkeE1O5pbzpTf1sPdJx+hLwWx/f//4TxyEppwVUcWboXCPkdophn
 +qPcqBZUqm6RQTw42TZlHr85FazQ2w0RuZSgfnDQ8mHr34VFuzXfoeTOyLmCnpjF1RHv
 P0aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=nIGaYtMUtzLf5rdS8bkm2HkUPDJfWchz2YtNrxVRdq4=;
 b=aWibMbQvUBt0njLkqf07RpUK161MDQWgXSoDIwFNTlZceDla9m5nyBNnCXmERvCNye
 sxh9v9KNK4dGDjTFRrM4McLN/3s8KABtAB94L7nvMLb92CuymRx8EP5PZ7Di467S9p5p
 7383IV/Ss/vVa1OJ54oIb1MN3sY3mqYn72jKIoCBhBQZBy3k6cpu/NkoRk6CFJwpA1uG
 iwJZPWkXmhYnJ5K1QDsFauki4HLjTlx/GY/RvC7NzBSSfUWM2uUPlB9OtMg3c++PZTbV
 48kWVWOzF73nWYv5GDm54RKlKr6JS1TFSfsWYUvh9NnpgJf9/HQsVdP9qm9XQ8HJdpdf
 Htfg==
X-Gm-Message-State: AOAM530X1DHiI8/WLaqKWK5HdN6hPUj+CNLCYJCu5DXi0tNzFS6UGPAO
 Zv3xpJzO76HxjHH0M9OzaXjUYPb+9yc=
X-Google-Smtp-Source: ABdhPJzHEH0yvr/0cmF8efU0W1TCo1/rSo1EEU1O86a2Chmh5HaDfTYjATLzEAsR7Hbc94KqQJPhEw==
X-Received: by 2002:a05:6000:188c:: with SMTP id
 a12mr14375845wri.105.1611519073814; 
 Sun, 24 Jan 2021 12:11:13 -0800 (PST)
Received: from localhost.localdomain (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id s4sm18856925wme.38.2021.01.24.12.11.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Jan 2021 12:11:13 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 1/9] hw/sd: ssi-sd: Fix incorrect card response sequence
Date: Sun, 24 Jan 2021 21:10:58 +0100
Message-Id: <20210124201106.2602238-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210124201106.2602238-1-f4bug@amsat.org>
References: <20210124201106.2602238-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x432.google.com
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
 Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bin.meng@windriver.com>

Per the "Physical Layer Specification Version 8.00" chapter 7.5.1,
"Command/Response", there is a minimum 8 clock cycles (Ncr) before
the card response shows up on the data out line. However current
implementation jumps directly to the sending response state after
all 6 bytes command is received, which is a spec violation.

Add a new state PREP_RESP in the ssi-sd state machine to handle it.

Fixes: 775616c3ae8c ("Partial SD card SPI mode support")
Signed-off-by: Bin Meng <bin.meng@windriver.com>
Tested-by: Pragnesh Patel <pragnesh.patel@sifive.com>
Reviewed-by: Pragnesh Patel <pragnesh.patel@sifive.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210123104016.17485-4-bmeng.cn@gmail.com>
[PMD: Change VMState version id 2 -> 3]
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/sd/ssi-sd.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/hw/sd/ssi-sd.c b/hw/sd/ssi-sd.c
index 9a75e0095cf..d97646795a2 100644
--- a/hw/sd/ssi-sd.c
+++ b/hw/sd/ssi-sd.c
@@ -36,6 +36,7 @@ do { fprintf(stderr, "ssi_sd: error: " fmt , ## __VA_ARGS__);} while (0)
 typedef enum {
     SSI_SD_CMD = 0,
     SSI_SD_CMDARG,
+    SSI_SD_PREP_RESP,
     SSI_SD_RESPONSE,
     SSI_SD_DATA_START,
     SSI_SD_DATA_READ,
@@ -163,12 +164,16 @@ static uint32_t ssi_sd_transfer(SSIPeripheral *dev, uint32_t val)
                 s->response[1] = status;
                 DPRINTF("Card status 0x%02x\n", status);
             }
-            s->mode = SSI_SD_RESPONSE;
+            s->mode = SSI_SD_PREP_RESP;
             s->response_pos = 0;
         } else {
             s->cmdarg[s->arglen++] = val;
         }
         return 0xff;
+    case SSI_SD_PREP_RESP:
+        DPRINTF("Prepare card response (Ncr)\n");
+        s->mode = SSI_SD_RESPONSE;
+        return 0xff;
     case SSI_SD_RESPONSE:
         if (s->stopping) {
             s->stopping = 0;
@@ -224,8 +229,8 @@ static int ssi_sd_post_load(void *opaque, int version_id)
 
 static const VMStateDescription vmstate_ssi_sd = {
     .name = "ssi_sd",
-    .version_id = 2,
-    .minimum_version_id = 2,
+    .version_id = 3,
+    .minimum_version_id = 3,
     .post_load = ssi_sd_post_load,
     .fields = (VMStateField []) {
         VMSTATE_UINT32(mode, ssi_sd_state),
-- 
2.26.2


