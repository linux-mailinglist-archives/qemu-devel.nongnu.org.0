Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1D1D301EAA
	for <lists+qemu-devel@lfdr.de>; Sun, 24 Jan 2021 21:16:15 +0100 (CET)
Received: from localhost ([::1]:45868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l3lny-0007YO-Of
	for lists+qemu-devel@lfdr.de; Sun, 24 Jan 2021 15:16:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l3lja-0002jZ-IN; Sun, 24 Jan 2021 15:11:43 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:36186)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l3ljY-00087f-CD; Sun, 24 Jan 2021 15:11:42 -0500
Received: by mail-wr1-x436.google.com with SMTP id 6so10234634wri.3;
 Sun, 24 Jan 2021 12:11:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LrDtq4QiTUsUiRmE+AfNkF3uAvxtgsZZEqrZ8VIhWkM=;
 b=F/Mu9/cAI1GgaxX79lf9MscO241BrYaG52+Xx+Yz1nn/EfbHRQLDSjYv6U0q8PWHaK
 tM1IWwy1Rrxh+9v0bTBYoBH+MPK+n46gvGDjzY/XnqiPGq5fjOpCW36VBKexncWwp3B1
 yNoZqb9L+J9xX+j8IGlbd6Y3O3NDOjWDsc2jzzk1l6HFm4VkoYk8h2nsaenl5E5/ViaF
 D8FCbuWcATdArxdWaqYN8YtobBvBn+UHUvIYUd4bc8x9x35dJn3J8S7Q68q4hhixbGcg
 OYec4sIjhFwpgr7kJRZGwJUd7SQuj3qqFrZoaKLgXEjXKNntW6uwvq+gPHd4EDCAnz4r
 LL/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=LrDtq4QiTUsUiRmE+AfNkF3uAvxtgsZZEqrZ8VIhWkM=;
 b=jAUJpQfZnD3YaOtY0su8GSlx3jTm9OMKX7mTyu1oDYUyvHwKHlHsuGNRiiMPah/8/9
 Cz7BoEdsDrWnHbeiZLHBp6IHNUGxslOM1J/MwJFuVcyDcyHSljMez4EOAUnm94Ot3GC5
 LqpDHoilPi9lbsMXqCmqYf+Nc80UqeAweul/M1+drjaVbSRbYZ1adhDY7d5qu1sbjX+7
 RP1pgoon2hVkY3mee8oalizBKKGL4gDv3eam5e3mkRNZjAgNJRTduw3k4akZETCZIKo7
 XdXxvu+4/mgl4C5XKd5TsnUQl1fv5sATHlQmbSCxge0c6I44LM0+39xlWv1alYYjve2Y
 /3qA==
X-Gm-Message-State: AOAM533kxDJqUaWNF4py3CKaeoh1XXdF9pGQsqrL2tqZEFg6/3LXsyqn
 v+nS1pt3VdWYcGJpNWOI9hecdIl8hzg=
X-Google-Smtp-Source: ABdhPJwQgea7d2pjlFMEw710xvdgXorvVdcsZjze0lWL16MPJQhAerm4HmwHz1uUrq8ZRV24XcJtXg==
X-Received: by 2002:adf:dd05:: with SMTP id a5mr10634027wrm.402.1611519097710; 
 Sun, 24 Jan 2021 12:11:37 -0800 (PST)
Received: from localhost.localdomain (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id k131sm19342293wmb.37.2021.01.24.12.11.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Jan 2021 12:11:37 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 6/9] hw/sd: ssi-sd: Add a state representing Nac
Date: Sun, 24 Jan 2021 21:11:03 +0100
Message-Id: <20210124201106.2602238-7-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210124201106.2602238-1-f4bug@amsat.org>
References: <20210124201106.2602238-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x436.google.com
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bin.meng@windriver.com>

Per the "Physical Layer Specification Version 8.00" chapter 7.5.2,
"Data Read", there is a minimum 8 clock cycles (Nac) after the card
response and before data block shows up on the data out line. This
applies to both single and multiple block read operations.

Current implementation of single block read already satisfies the
timing requirement as in the RESPONSE state after all responses are
transferred the state remains unchanged. In the next 8 clock cycles
it jumps to DATA_START state if data is ready.

However we need an explicit state when expanding our support to
multiple block read in the future. Let's add a new state PREP_DATA
explicitly in the ssi-sd state machine to represent Nac.

Note we don't change the single block read state machine to let it
jump from RESPONSE state to DATA_START state as that effectively
generates a 16 clock cycles Nac, which might not be safe. As the
spec says the maximum Nac shall be calculated from several fields
encoded in the CSD register, we don't want to bother updating CSD
to ensure our Nac is within range to complicate things.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210123104016.17485-9-bmeng.cn@gmail.com>
[PMD: Change VMState version id 4 -> 5]
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/sd/ssi-sd.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/hw/sd/ssi-sd.c b/hw/sd/ssi-sd.c
index 08852dc8d4b..1cdaf73c292 100644
--- a/hw/sd/ssi-sd.c
+++ b/hw/sd/ssi-sd.c
@@ -39,6 +39,7 @@ typedef enum {
     SSI_SD_CMDARG,
     SSI_SD_PREP_RESP,
     SSI_SD_RESPONSE,
+    SSI_SD_PREP_DATA,
     SSI_SD_DATA_START,
     SSI_SD_DATA_READ,
     SSI_SD_DATA_CRC16,
@@ -194,6 +195,10 @@ static uint32_t ssi_sd_transfer(SSIPeripheral *dev, uint32_t val)
             s->mode = SSI_SD_CMD;
         }
         return 0xff;
+    case SSI_SD_PREP_DATA:
+        DPRINTF("Prepare data block (Nac)\n");
+        s->mode = SSI_SD_DATA_START;
+        return 0xff;
     case SSI_SD_DATA_START:
         DPRINTF("Start read block\n");
         s->mode = SSI_SD_DATA_READ;
@@ -244,8 +249,8 @@ static int ssi_sd_post_load(void *opaque, int version_id)
 
 static const VMStateDescription vmstate_ssi_sd = {
     .name = "ssi_sd",
-    .version_id = 4,
-    .minimum_version_id = 4,
+    .version_id = 5,
+    .minimum_version_id = 5,
     .post_load = ssi_sd_post_load,
     .fields = (VMStateField []) {
         VMSTATE_UINT32(mode, ssi_sd_state),
-- 
2.26.2


