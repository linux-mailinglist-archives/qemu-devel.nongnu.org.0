Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E673306DAB
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 07:38:11 +0100 (CET)
Received: from localhost ([::1]:52588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l50wU-0004vp-ED
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 01:38:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l50pd-0007Qq-W0; Thu, 28 Jan 2021 01:31:07 -0500
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:38035)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l50pb-0001Fw-6f; Thu, 28 Jan 2021 01:31:05 -0500
Received: by mail-pl1-x62b.google.com with SMTP id d4so2774222plh.5;
 Wed, 27 Jan 2021 22:31:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5DYakafQd3sVhW5wXkjK4ifCj/JUkX6esOoLtn3SKFs=;
 b=YBLZr0W5DhQbJVQq4y1+0YZtZZL9BRy5syAFl17Y7vRzu0L3NnvdAsw1TtQOsTghGY
 5UDCCzDt5YA9zWnku/e9psOdoc0Cyd9NvdaKmVCPlpCZaaLp9uV33X1FHRZ1srDFe8C4
 C5qo8szRlhJuRrST0Hkb76Dj7kBGnBYkxCm7D9UcOjqf6voxPladNR9SpMUrHw2AenkY
 t3/IrSDypvomuLJy/Sox5MJgdegyHxZmCK5J8UzmWsBHKntZy+l3duVvnLhsWOYjpQ1U
 Sv1QvCfcBqaJgRykowTobip6uWe577WhgjRak8/OAkrcrtHghJiieqJXjxiA1/zYqwAJ
 yyEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5DYakafQd3sVhW5wXkjK4ifCj/JUkX6esOoLtn3SKFs=;
 b=WXMwBOllnNdUQXrvX1BQ79ynSRxQRpQQcea0ZBTryKU2K+qGwMSRbccsENfz8IALN/
 e8P8GXboK9FRrHaTU4SVJ5oHuscvuIWqs7BrKXnGhXrIfpc1vJe7BFCK6ur1dW4NfVFf
 tEPu+41JaAn1kT7eaLKs9HH3AHNXDk88fUxaG5EzTYVhktMpmVv5o57/3SfBLfZmN+0z
 nq5Uf6WP9gDk+AayTsmUXIuZzQsrFiQrt47JpqKH1qtvj+EPkSDkYgu7t5LBzQSbS50b
 D1grosqkuLT4Z2dcei8jS1/O1pE82gi9/ycxkvMyyHQESLzKaBzDCOj54HoKvCRxY3y5
 gHJg==
X-Gm-Message-State: AOAM532mxrbkdLOjRhjYpvm1cZLABu63ov3TRNKEp2TlQPvTZh/DCsbO
 suReq0R3p2rfzGLXhN4OF+h9Gi/O67df9Q==
X-Google-Smtp-Source: ABdhPJzIkZcTjzsoBcqm+PrHVdPdyKSdEVDV18WVUVfIF/gvpywWnQn3CmS9TbQz+GuScoRxHmL/sA==
X-Received: by 2002:a17:90b:1107:: with SMTP id
 gi7mr9909705pjb.123.1611815461707; 
 Wed, 27 Jan 2021 22:31:01 -0800 (PST)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id t6sm4245080pfc.64.2021.01.27.22.30.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Jan 2021 22:31:01 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH v4 8/9] hw/sd: ssi-sd: Fix STOP_TRANSMISSION (CMD12) response
Date: Thu, 28 Jan 2021 14:30:34 +0800
Message-Id: <20210128063035.15674-9-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210128063035.15674-1-bmeng.cn@gmail.com>
References: <20210128063035.15674-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pl1-x62b.google.com
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
Cc: Bin Meng <bin.meng@windriver.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bin.meng@windriver.com>

CMD12's response type is R1b, which is basically a R1 plus optional
addition of the busy signal token that can be any number of bytes.
A zero value indicates card is busy and a non-zero value indicates
the card is ready for the next command.

Current implementation sends the busy signal token without sending
the R1 first. This does not break the U-Boot/Linux mmc_spi driver,
but it does not make the VxWorks driver happy.

Move the testing logic of s->stopping in the SSI_SD_RESPONSE state
a bit later, after the first byte of the card reponse is sent out,
to conform with the spec. After the busy signal token is sent, the
state should be transferred to SSI_SD_CMD.

Fixes: 775616c3ae8c ("Partial SD card SPI mode support")
Signed-off-by: Bin Meng <bin.meng@windriver.com>

---

Changes in v4:
- new patch: fix STOP_TRANSMISSION (CMD12) response

 hw/sd/ssi-sd.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/hw/sd/ssi-sd.c b/hw/sd/ssi-sd.c
index 84c873b3fd..907d681d19 100644
--- a/hw/sd/ssi-sd.c
+++ b/hw/sd/ssi-sd.c
@@ -243,14 +243,15 @@ static uint32_t ssi_sd_transfer(SSIPeripheral *dev, uint32_t val)
         s->mode = SSI_SD_RESPONSE;
         return SSI_DUMMY;
     case SSI_SD_RESPONSE:
-        if (s->stopping) {
-            s->stopping = 0;
-            return SSI_DUMMY;
-        }
         if (s->response_pos < s->arglen) {
             DPRINTF("Response 0x%02x\n", s->response[s->response_pos]);
             return s->response[s->response_pos++];
         }
+        if (s->stopping) {
+            s->stopping = 0;
+            s->mode = SSI_SD_CMD;
+            return SSI_DUMMY;
+        }
         if (sdbus_data_ready(&s->sdbus)) {
             DPRINTF("Data read\n");
             s->mode = SSI_SD_DATA_START;
-- 
2.25.1


