Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8E79342682
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Mar 2021 20:53:30 +0100 (CET)
Received: from localhost ([::1]:54478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lNLBZ-0005iU-Uc
	for lists+qemu-devel@lfdr.de; Fri, 19 Mar 2021 15:53:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3pABVYAMKCgMgmhjrrjoh.frpthpx-ghyhoqrqjqx.ruj@flex--dje.bounces.google.com>)
 id 1lNL9F-0004ge-O8
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 15:51:05 -0400
Received: from mail-vk1-xa49.google.com ([2607:f8b0:4864:20::a49]:49365)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3pABVYAMKCgMgmhjrrjoh.frpthpx-ghyhoqrqjqx.ruj@flex--dje.bounces.google.com>)
 id 1lNL9D-0007J5-6I
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 15:51:05 -0400
Received: by mail-vk1-xa49.google.com with SMTP id o133so3462366vkd.16
 for <qemu-devel@nongnu.org>; Fri, 19 Mar 2021 12:51:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=j46CI3Og4hVkDDNrH53Wwik7HYlH8KkukwySRapqCWU=;
 b=GYj7hsz0MkYuOu42/ryzsO7gctCRvx5eRxK58FVdd+1vbOGi4nIXcyQ8s18Gs+mtvq
 dXcpIlzj979Q/Jw9YFs9y66jF3+Lu27r8H0egEjuJHmDesIt0osR87PetYIaNfnN+6An
 wzy+TC46WtJaL1NQbM6aSR93OdFsME4hCPxlDhI42DX9XF4o4ZxTy1QSH58pwlRwqB7x
 dnYU0/+vyZQT4cajSZf/J2CqJanXF6V+rwk5SfQS+gaWSa0sUWSiHDacMrXBCpGw2yRj
 72RB1M0hRH2amRWio72xE2gmzEFwvonnV/GD94/jyPbPeauv4QhwiwGQGe8cb/28//1Y
 Q2SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=j46CI3Og4hVkDDNrH53Wwik7HYlH8KkukwySRapqCWU=;
 b=Fb9WJSQPq+sbB8/+N+xhkCxf9PDJTKx9u9q4hNzf3BYmFWWcFqkEQyE0zGISAUbdfl
 gkfoOScVug/3cSo6WIx6hCylesX8FUgjA9Av+4rZ8RLIOwuk5WuvD23HW3LFBA9SS9J8
 AT5MbVTGa+TvCKwX4Y4zDLwNhTbqVWvtG7AHBY/wCGIZuC4d/pMrOV5w5T8YT2yXa8mB
 alhT+GG0ujUQxfeRH11IxQrzk3WdPPlDWYGohko+RwaaDVpn851ITf2NzzFf6GTvr5C8
 5zw27+E8Bupn2hYHFxNU/C92OSRL+RF/WC6WN0oTnLOsgQTRv63/4a7lI3O8ARmD/eOJ
 JFGg==
X-Gm-Message-State: AOAM5309HQuM62dnC4yhLiabzq9Q69Z9/gSO2x7XZHJKonocG+DAu5/P
 3a1QV76jFzIORCn1k3cfKGizZQk=
X-Google-Smtp-Source: ABdhPJxfMTn+EzfJdgiHiYNmbStb38x6TMfLciSYqacItz7O3+p05P+7IxaaxnZMtHnFPL2XxxKje3E=
X-Received: from ruffy.mtv.corp.google.com
 ([2620:0:1000:1412:e514:6b57:7d74:59ea])
 (user=dje job=sendgmr) by 2002:ab0:2b06:: with SMTP id
 e6mr163139uar.43.1616183460527; 
 Fri, 19 Mar 2021 12:51:00 -0700 (PDT)
Date: Fri, 19 Mar 2021 12:50:44 -0700
Message-Id: <20210319195044.741821-1-dje@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.31.0.rc2.261.g7f71774620-goog
Subject: [PATCH] net/npcm7xx_emc.c: Fix handling of receiving packets when
 RSDR not set
From: Doug Evans <dje@google.com>
To: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Cc: Havard Skinnemoen <hskinnemoen@google.com>,
 Tyrone Ting <kfting@nuvoton.com>, 
 Jason Wang <jasowang@redhat.com>, Doug Evans <dje@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::a49;
 envelope-from=3pABVYAMKCgMgmhjrrjoh.frpthpx-ghyhoqrqjqx.ruj@flex--dje.bounces.google.com;
 helo=mail-vk1-xa49.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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

Turning REG_MCMDR_RXON is enough to start receiving packets.

Signed-off-by: Doug Evans <dje@google.com>
---
 hw/net/npcm7xx_emc.c           |  4 +++-
 tests/qtest/npcm7xx_emc-test.c | 30 +++++++++++++++++++++---------
 2 files changed, 24 insertions(+), 10 deletions(-)

diff --git a/hw/net/npcm7xx_emc.c b/hw/net/npcm7xx_emc.c
index 714a742ba7..7c892f820f 100644
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
index 7a28173195..9eec71d87c 100644
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
2.31.0.rc2.261.g7f71774620-goog


