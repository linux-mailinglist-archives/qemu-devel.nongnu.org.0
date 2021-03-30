Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 049C534E927
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Mar 2021 15:31:07 +0200 (CEST)
Received: from localhost ([::1]:42238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRESY-0003Sq-1h
	for lists+qemu-devel@lfdr.de; Tue, 30 Mar 2021 09:31:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lRENf-0006oS-Rm
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 09:26:03 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:45980)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lRENb-0003bW-O8
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 09:26:03 -0400
Received: by mail-wr1-x433.google.com with SMTP id j9so14525101wrx.12
 for <qemu-devel@nongnu.org>; Tue, 30 Mar 2021 06:25:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=bR9eSdSf4qznX0LV24L+tKEZx+CKvg1TgSxkuks1KkM=;
 b=Mw/LK2+bA1T3fuE+T2rjLweWEJv1Vx3OOyvaUiy9Uxi6X7AcoKS8Pdbj4F+vFwO4Mk
 +MrL5bbOS39PhttX5WSI3szBDZqPx0RlbjpV0MmcSbjhl4Em3MRHYmXr2jYmuhZ+VLSd
 E5vMYzh5E9lPuqj0flLWNQ0AUt2aKd+0Iu/EpgZyG2tdxpWDgrxxCLds8eKF9QVF5KSB
 qlHwB4r97UDYizlwW9FVwUbbCPLaNpSxouH0VHtuWDVsWks2e/Wfda+o0Mwws5sgn0UK
 wPfKbHUEaw1/Wl2CmXI9riOwN2xGWYSsww2sz8xgOPl5bsuf2D/RfngzJm8oowOwpP+7
 4akA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bR9eSdSf4qznX0LV24L+tKEZx+CKvg1TgSxkuks1KkM=;
 b=YherHVyIU/sVByeDiRt8Y/JrpyUXA3ZU1+wtQDDNRJi1/d4uvsYDL8VpkhT4hcFgVf
 5tgbP+ICHF61g37M8ipJVXpI8QBsPp/FydsSIJpfs5Q0MRBgy8p2tWH2KEQc1RvwFCEZ
 NlwgjGqpT0IFGumSEL+E/OmsIU2kkFcPqU0r/qdLZsuyfCjYDfdJm4WoXu9kVFG6zOlm
 Tksal5mK3wcoKOGwWFBgSOJCrFaZJcS9nvZU7ZI4KxF3xen2ASQ3p2xmS7EheiLGPq+i
 yoOAIxmFfQjW8u0m3Xb8XPwku5Ynurc59kNgAnavWyy93BYKf2ZSeHiUJzyb9JrNud5P
 uLiQ==
X-Gm-Message-State: AOAM533uEI64fqsU7PmRpUOmggIrt/WIKZGZ1WxcLyqTGDhqzh9ZsV4B
 gEwU2zMdy8U9nOy8eRzcZPHWq0e9iDwFV5uY
X-Google-Smtp-Source: ABdhPJw/6fCbjS99bQfjmclGM5KfUZEi87MxsINO0zNcGcNhXpOSakhxfffr6xl91nEj99lMzgy89g==
X-Received: by 2002:adf:b642:: with SMTP id i2mr33257940wre.8.1617110758101;
 Tue, 30 Mar 2021 06:25:58 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id p18sm33140892wrs.68.2021.03.30.06.25.57
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Mar 2021 06:25:57 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 1/5] net/npcm7xx_emc.c: Fix handling of receiving packets when
 RSDR not set
Date: Tue, 30 Mar 2021 14:25:51 +0100
Message-Id: <20210330132555.8144-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210330132555.8144-1-peter.maydell@linaro.org>
References: <20210330132555.8144-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Doug Evans <dje@google.com>

Turning REG_MCMDR_RXON is enough to start receiving packets.

Signed-off-by: Doug Evans <dje@google.com>
Message-id: 20210319195044.741821-1-dje@google.com
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/net/npcm7xx_emc.c           |  4 +++-
 tests/qtest/npcm7xx_emc-test.c | 30 +++++++++++++++++++++---------
 2 files changed, 24 insertions(+), 10 deletions(-)

diff --git a/hw/net/npcm7xx_emc.c b/hw/net/npcm7xx_emc.c
index 714a742ba7a..7c892f820fb 100644
--- a/hw/net/npcm7xx_emc.c
+++ b/hw/net/npcm7xx_emc.c
@@ -702,7 +702,9 @@ static void npcm7xx_emc_write(void *opaque, hwaddr offset,
                    !(value & REG_MCMDR_RXON)) {
             emc->regs[REG_MGSTA] |= REG_MGSTA_RXHA;
         }
-        if (!(value & REG_MCMDR_RXON)) {
+        if (value & REG_MCMDR_RXON) {
+            emc->rx_active = true;
+        } else {
             emc_halt_rx(emc, 0);
         }
         break;
diff --git a/tests/qtest/npcm7xx_emc-test.c b/tests/qtest/npcm7xx_emc-test.c
index 7a281731950..9eec71d87c1 100644
--- a/tests/qtest/npcm7xx_emc-test.c
+++ b/tests/qtest/npcm7xx_emc-test.c
@@ -492,9 +492,6 @@ static void enable_tx(QTestState *qts, const EMCModule *mod,
         mcmdr |= REG_MCMDR_TXON;
         emc_write(qts, mod, REG_MCMDR, mcmdr);
     }
-
-    /* Prod the device to send the packet. */
-    emc_write(qts, mod, REG_TSDR, 1);
 }
 
 static void emc_send_verify1(QTestState *qts, const EMCModule *mod, int fd,
@@ -558,6 +555,9 @@ static void emc_send_verify(QTestState *qts, const EMCModule *mod, int fd,
     enable_tx(qts, mod, &desc[0], NUM_TX_DESCRIPTORS, desc_addr,
               with_irq ? REG_MIEN_ENTXINTR : 0);
 
+    /* Prod the device to send the packet. */
+    emc_write(qts, mod, REG_TSDR, 1);
+
     /*
      * It's problematic to observe the interrupt for each packet.
      * Instead just wait until all the packets go out.
@@ -643,13 +643,10 @@ static void enable_rx(QTestState *qts, const EMCModule *mod,
         mcmdr |= REG_MCMDR_RXON | mcmdr_flags;
         emc_write(qts, mod, REG_MCMDR, mcmdr);
     }
-
-    /* Prod the device to accept a packet. */
-    emc_write(qts, mod, REG_RSDR, 1);
 }
 
 static void emc_recv_verify(QTestState *qts, const EMCModule *mod, int fd,
-                            bool with_irq)
+                            bool with_irq, bool pump_rsdr)
 {
     NPCM7xxEMCRxDesc desc[NUM_RX_DESCRIPTORS];
     uint32_t desc_addr = DESC_ADDR;
@@ -679,6 +676,15 @@ static void emc_recv_verify(QTestState *qts, const EMCModule *mod, int fd,
     enable_rx(qts, mod, &desc[0], NUM_RX_DESCRIPTORS, desc_addr,
               with_irq ? REG_MIEN_ENRXINTR : 0, 0);
 
+    /*
+     * If requested, prod the device to accept a packet.
+     * This isn't necessary, the linux driver doesn't do this.
+     * Test doing/not-doing this for robustness.
+     */
+    if (pump_rsdr) {
+        emc_write(qts, mod, REG_RSDR, 1);
+    }
+
     /* Send test packet to device's socket. */
     ret = iov_send(fd, iov, 2, 0, sizeof(len) + sizeof(test));
     g_assert_cmpint(ret, == , sizeof(test) + sizeof(len));
@@ -826,8 +832,14 @@ static void test_rx(gconstpointer test_data)
 
     qtest_irq_intercept_in(qts, "/machine/soc/a9mpcore/gic");
 
-    emc_recv_verify(qts, td->module, test_sockets[0], /*with_irq=*/false);
-    emc_recv_verify(qts, td->module, test_sockets[0], /*with_irq=*/true);
+    emc_recv_verify(qts, td->module, test_sockets[0], /*with_irq=*/false,
+                    /*pump_rsdr=*/false);
+    emc_recv_verify(qts, td->module, test_sockets[0], /*with_irq=*/false,
+                    /*pump_rsdr=*/true);
+    emc_recv_verify(qts, td->module, test_sockets[0], /*with_irq=*/true,
+                    /*pump_rsdr=*/false);
+    emc_recv_verify(qts, td->module, test_sockets[0], /*with_irq=*/true,
+                    /*pump_rsdr=*/true);
     emc_test_ptle(qts, td->module, test_sockets[0]);
 
     qtest_quit(qts);
-- 
2.20.1


