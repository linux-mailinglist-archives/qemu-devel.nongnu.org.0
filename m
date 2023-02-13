Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ED97694793
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 15:03:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRZOz-0006eW-PK; Mon, 13 Feb 2023 09:01:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pRZOk-0006cP-Ha
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 09:01:38 -0500
Received: from forwardcorp1b.mail.yandex.net
 ([2a02:6b8:c02:900:1:45:d181:df01])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pRZOa-0005t4-1H
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 09:01:29 -0500
Received: from myt6-23a5e62c0090.qloud-c.yandex.net
 (myt6-23a5e62c0090.qloud-c.yandex.net
 [IPv6:2a02:6b8:c12:1da3:0:640:23a5:e62c])
 by forwardcorp1b.mail.yandex.net (Yandex) with ESMTP id 224DA62287;
 Mon, 13 Feb 2023 17:01:17 +0300 (MSK)
Received: from vsementsov-win.yandex-team.ru (unknown
 [2a02:6b8:b081:6527::1:3a])
 by myt6-23a5e62c0090.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 51j9w00QYCg1-EpK6jA2n; Mon, 13 Feb 2023 17:01:16 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1676296876; bh=WCjwcGMUVI5gHbUTYAnMwvGBnHHLWrdxrFw5oKOIvEM=;
 h=Message-Id:Date:In-Reply-To:Cc:Subject:References:To:From;
 b=HflVsyqJRBTiqyBv6GNnvMb7RpxRgGSdil62165p8W08VYTmzTnFApq5jB6HvxhmV
 tccLZEtFVdu7s45y/gBOCzTL8eptsoYjgfFldlwBjKco+WdOJNYTlWMRdaS4Eq1As/
 DU1qWOKNmwFRKcsHtQtDJVC0tVc+bOqjT64xwjuE=
Authentication-Results: myt6-23a5e62c0090.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
To: qemu-devel@nongnu.org
Cc: armbru@redhat.com, eblake@redhat.com, eduardo@habkost.net,
 berrange@redhat.com, pbonzini@redhat.com, marcel.apfelbaum@gmail.com,
 mst@redhat.com, philmd@linaro.org, vsementsov@yandex-team.ru,
 den-plotnikov@yandex-team.ru, antonkuchin@yandex-team.ru
Subject: [PATCH v4 05/16] pci/shpc: pass PCIDevice pointer to
 shpc_slot_command()
Date: Mon, 13 Feb 2023 17:00:52 +0300
Message-Id: <20230213140103.1518173-6-vsementsov@yandex-team.ru>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230213140103.1518173-1-vsementsov@yandex-team.ru>
References: <20230213140103.1518173-1-vsementsov@yandex-team.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a02:6b8:c02:900:1:45:d181:df01;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1b.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

We'll need it in further patch to report bridge in QAPI event.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
---
 hw/pci/shpc.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/hw/pci/shpc.c b/hw/pci/shpc.c
index 959dc470f3..9f964b1d70 100644
--- a/hw/pci/shpc.c
+++ b/hw/pci/shpc.c
@@ -263,9 +263,10 @@ static bool shpc_slot_is_off(uint8_t state, uint8_t power, uint8_t attn)
     return state == SHPC_STATE_DISABLED && power == SHPC_LED_OFF;
 }
 
-static void shpc_slot_command(SHPCDevice *shpc, uint8_t target,
+static void shpc_slot_command(PCIDevice *d, uint8_t target,
                               uint8_t state, uint8_t power, uint8_t attn)
 {
+    SHPCDevice *shpc = d->shpc;
     int slot = SHPC_LOGICAL_TO_IDX(target);
     uint8_t old_state = shpc_get_status(shpc, slot, SHPC_SLOT_STATE_MASK);
     uint8_t old_power = shpc_get_status(shpc, slot, SHPC_SLOT_PWR_LED_MASK);
@@ -314,8 +315,9 @@ static void shpc_slot_command(SHPCDevice *shpc, uint8_t target,
     }
 }
 
-static void shpc_command(SHPCDevice *shpc)
+static void shpc_command(PCIDevice *d)
 {
+    SHPCDevice *shpc = d->shpc;
     uint8_t code = pci_get_byte(shpc->config + SHPC_CMD_CODE);
     uint8_t speed;
     uint8_t target;
@@ -336,7 +338,7 @@ static void shpc_command(SHPCDevice *shpc)
         state = (code & SHPC_SLOT_STATE_MASK) >> SHPC_SLOT_STATE_SHIFT;
         power = (code & SHPC_SLOT_PWR_LED_MASK) >> SHPC_SLOT_PWR_LED_SHIFT;
         attn = (code & SHPC_SLOT_ATTN_LED_MASK) >> SHPC_SLOT_ATTN_LED_SHIFT;
-        shpc_slot_command(shpc, target, state, power, attn);
+        shpc_slot_command(d, target, state, power, attn);
         break;
     case 0x40 ... 0x47:
         speed = code & SHPC_SEC_BUS_MASK;
@@ -354,10 +356,10 @@ static void shpc_command(SHPCDevice *shpc)
         }
         for (i = 0; i < shpc->nslots; ++i) {
             if (!(shpc_get_status(shpc, i, SHPC_SLOT_STATUS_MRL_OPEN))) {
-                shpc_slot_command(shpc, i + SHPC_CMD_TRGT_MIN,
+                shpc_slot_command(d, i + SHPC_CMD_TRGT_MIN,
                                   SHPC_STATE_PWRONLY, SHPC_LED_ON, SHPC_LED_NO);
             } else {
-                shpc_slot_command(shpc, i + SHPC_CMD_TRGT_MIN,
+                shpc_slot_command(d, i + SHPC_CMD_TRGT_MIN,
                                   SHPC_STATE_NO, SHPC_LED_OFF, SHPC_LED_NO);
             }
         }
@@ -375,10 +377,10 @@ static void shpc_command(SHPCDevice *shpc)
         }
         for (i = 0; i < shpc->nslots; ++i) {
             if (!(shpc_get_status(shpc, i, SHPC_SLOT_STATUS_MRL_OPEN))) {
-                shpc_slot_command(shpc, i + SHPC_CMD_TRGT_MIN,
+                shpc_slot_command(d, i + SHPC_CMD_TRGT_MIN,
                                   SHPC_STATE_ENABLED, SHPC_LED_ON, SHPC_LED_NO);
             } else {
-                shpc_slot_command(shpc, i + SHPC_CMD_TRGT_MIN,
+                shpc_slot_command(d, i + SHPC_CMD_TRGT_MIN,
                                   SHPC_STATE_NO, SHPC_LED_OFF, SHPC_LED_NO);
             }
         }
@@ -410,7 +412,7 @@ static void shpc_write(PCIDevice *d, unsigned addr, uint64_t val, int l)
         shpc->config[a] &= ~(val & w1cmask); /* W1C: Write 1 to Clear */
     }
     if (ranges_overlap(addr, l, SHPC_CMD_CODE, 2)) {
-        shpc_command(shpc);
+        shpc_command(d);
     }
     shpc_interrupt_update(d);
 }
-- 
2.34.1


