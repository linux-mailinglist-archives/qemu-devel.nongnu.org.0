Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C84A4757C2
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 12:29:40 +0100 (CET)
Received: from localhost ([::1]:56266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxSTb-0004sH-D5
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 06:29:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mxRih-0007FO-Fu
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 05:41:11 -0500
Received: from [2a00:1450:4864:20::330] (port=54818
 helo=mail-wm1-x330.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mxRic-00008C-9y
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 05:41:10 -0500
Received: by mail-wm1-x330.google.com with SMTP id i12so16260250wmq.4
 for <qemu-devel@nongnu.org>; Wed, 15 Dec 2021 02:41:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=BueFJrFQF32/n5kB0mnvMkP97sG05knzH92TC7Y/zGQ=;
 b=FtQx4a+d4uD6UeFeRI6O5xA7qPyCeR/PhAA4H9RKUEWTZ83g8NQ0FfQdSCD3bVpxBM
 zO4kdfE3u1bhP8OMsZtbZv/3zrwTXCtBpMJlSgydrK+o5yIJSdZC+QQrs9PrxeTr/nFf
 r+WWQKgmD4nQ07euOmUjBcMtYbYiT49t09UdLvGjdO4Jno/GA8xU0WrACZhztics0Sm6
 i/aqUefMo1pFYjV2TawBFBifbBLF9NZCkC34ajBTRRapyOSWFKvKW9sjTy9HkQmyL82h
 jCGXlm1g+rXbdJiknHewRckTbQMjYNv9xdKBXTrMhYZ5yrgIpHRkYWbWVWJgbTJe/w+F
 n1sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BueFJrFQF32/n5kB0mnvMkP97sG05knzH92TC7Y/zGQ=;
 b=4BGtKoCRBXm6a+NCuJAD14yD9pBnndXaoWHNZNu31QgFsz54MUgfMp6YMJQ4kyLWy5
 qLiMSkn1QMJIHBXHppzil0MqYF5kZUQPUyw5OIPcvTNj5U+18z4HM9hY2WvPSbVdia3f
 qtG5XosyCHEu6OqCA5aetxH1CcfqNLfCm+IhJg6nU7BjCIse2vd9Jmn+USdLRIOTBpEU
 LUrfMRyLCI/NiwEnte+wwbP28WpIhf1D/JTBCU/hrDMvytTZytNyDKs4R1sSCBBGoMZH
 NBA+yuQBMB2pjwY5drBP5rqPm1YmiY08nuB9NI/CfpuGVsrl8WJ4ucdObTvk/Kxl5+y+
 VZbg==
X-Gm-Message-State: AOAM531/0CrZe4Dsl+FYiXZuzWljwUfTQb0OxujNaUZTsc2AwGTXdrqj
 CVkKHHNR3p5U1ZURVtDr8yBsF0Xdkt2egA==
X-Google-Smtp-Source: ABdhPJyg/txC6HrtyOVYfLhOeTYtVANegx4GjVggAvN1Br7M0kYKcasXdJbdUsxVoZF+KVy62oh6XA==
X-Received: by 2002:a1c:8002:: with SMTP id b2mr3950078wmd.2.1639564864922;
 Wed, 15 Dec 2021 02:41:04 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id e18sm1600815wrs.48.2021.12.15.02.41.04
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Dec 2021 02:41:04 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 25/33] hw/net: npcm7xx_emc fix missing queue_flush
Date: Wed, 15 Dec 2021 10:40:41 +0000
Message-Id: <20211215104049.2030475-26-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211215104049.2030475-1-peter.maydell@linaro.org>
References: <20211215104049.2030475-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::330
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Patrick Venture <venture@google.com>

The rx_active boolean change to true should always trigger a try_read
call that flushes the queue.

Signed-off-by: Patrick Venture <venture@google.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-id: 20211203221002.1719306-1-venture@google.com
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/net/npcm7xx_emc.c | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/hw/net/npcm7xx_emc.c b/hw/net/npcm7xx_emc.c
index 7c892f820fb..545b2b74108 100644
--- a/hw/net/npcm7xx_emc.c
+++ b/hw/net/npcm7xx_emc.c
@@ -284,6 +284,12 @@ static void emc_halt_rx(NPCM7xxEMCState *emc, uint32_t mista_flag)
     emc_set_mista(emc, mista_flag);
 }
 
+static void emc_enable_rx_and_flush(NPCM7xxEMCState *emc)
+{
+    emc->rx_active = true;
+    qemu_flush_queued_packets(qemu_get_queue(emc->nic));
+}
+
 static void emc_set_next_tx_descriptor(NPCM7xxEMCState *emc,
                                        const NPCM7xxEMCTxDesc *tx_desc,
                                        uint32_t desc_addr)
@@ -581,13 +587,6 @@ static ssize_t emc_receive(NetClientState *nc, const uint8_t *buf, size_t len1)
     return len;
 }
 
-static void emc_try_receive_next_packet(NPCM7xxEMCState *emc)
-{
-    if (emc_can_receive(qemu_get_queue(emc->nic))) {
-        qemu_flush_queued_packets(qemu_get_queue(emc->nic));
-    }
-}
-
 static uint64_t npcm7xx_emc_read(void *opaque, hwaddr offset, unsigned size)
 {
     NPCM7xxEMCState *emc = opaque;
@@ -703,7 +702,7 @@ static void npcm7xx_emc_write(void *opaque, hwaddr offset,
             emc->regs[REG_MGSTA] |= REG_MGSTA_RXHA;
         }
         if (value & REG_MCMDR_RXON) {
-            emc->rx_active = true;
+            emc_enable_rx_and_flush(emc);
         } else {
             emc_halt_rx(emc, 0);
         }
@@ -739,8 +738,7 @@ static void npcm7xx_emc_write(void *opaque, hwaddr offset,
         break;
     case REG_RSDR:
         if (emc->regs[REG_MCMDR] & REG_MCMDR_RXON) {
-            emc->rx_active = true;
-            emc_try_receive_next_packet(emc);
+            emc_enable_rx_and_flush(emc);
         }
         break;
     case REG_MIIDA:
-- 
2.25.1


