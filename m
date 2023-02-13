Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51EA26947A0
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 15:05:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRZP3-0006iR-8Q; Mon, 13 Feb 2023 09:01:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pRZOa-0006bg-CX
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 09:01:37 -0500
Received: from forwardcorp1b.mail.yandex.net ([178.154.239.136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pRZOS-0005sj-VO
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 09:01:22 -0500
Received: from myt6-23a5e62c0090.qloud-c.yandex.net
 (myt6-23a5e62c0090.qloud-c.yandex.net
 [IPv6:2a02:6b8:c12:1da3:0:640:23a5:e62c])
 by forwardcorp1b.mail.yandex.net (Yandex) with ESMTP id 015BC6149F;
 Mon, 13 Feb 2023 17:01:16 +0300 (MSK)
Received: from vsementsov-win.yandex-team.ru (unknown
 [2a02:6b8:b081:6527::1:3a])
 by myt6-23a5e62c0090.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 51j9w00QYCg1-wmpjGa0s; Mon, 13 Feb 2023 17:01:15 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1676296875; bh=Ofg0z5A6EVb25euaqITm+xboRrJRtcaO1cNMbngTL1Q=;
 h=Message-Id:Date:In-Reply-To:Cc:Subject:References:To:From;
 b=l4YnlTJZJGc19dfNB9XfWYVgf1veDeUNWl8f9eHK+CnharkEyNF3KZhHP4L4KgFTJ
 srizNQ5FfmbO9YRBHR62DrOFVW6XEfPXjcpvgfOwAPsLtamNEijf8aaK1pyFtZ3god
 vauZiGXDfpagfR6yKEHBlLhqaU9z4NM4RuHCSUmU=
Authentication-Results: myt6-23a5e62c0090.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
To: qemu-devel@nongnu.org
Cc: armbru@redhat.com, eblake@redhat.com, eduardo@habkost.net,
 berrange@redhat.com, pbonzini@redhat.com, marcel.apfelbaum@gmail.com,
 mst@redhat.com, philmd@linaro.org, vsementsov@yandex-team.ru,
 den-plotnikov@yandex-team.ru, antonkuchin@yandex-team.ru
Subject: [PATCH v4 04/16] pci/shpc: more generic handle hot-unplug in
 shpc_slot_command()
Date: Mon, 13 Feb 2023 17:00:51 +0300
Message-Id: <20230213140103.1518173-5-vsementsov@yandex-team.ru>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230213140103.1518173-1-vsementsov@yandex-team.ru>
References: <20230213140103.1518173-1-vsementsov@yandex-team.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=178.154.239.136;
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

Free slot if both conditions (power-led = OFF and state = DISABLED)
becomes true regardless of the sequence. It is similar to how PCIe
hotplug works.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
---
 hw/pci/shpc.c | 52 ++++++++++++++++++++++++++++++---------------------
 1 file changed, 31 insertions(+), 21 deletions(-)

diff --git a/hw/pci/shpc.c b/hw/pci/shpc.c
index 25e4172382..959dc470f3 100644
--- a/hw/pci/shpc.c
+++ b/hw/pci/shpc.c
@@ -258,49 +258,59 @@ static void shpc_free_devices_in_slot(SHPCDevice *shpc, int slot)
     }
 }
 
+static bool shpc_slot_is_off(uint8_t state, uint8_t power, uint8_t attn)
+{
+    return state == SHPC_STATE_DISABLED && power == SHPC_LED_OFF;
+}
+
 static void shpc_slot_command(SHPCDevice *shpc, uint8_t target,
                               uint8_t state, uint8_t power, uint8_t attn)
 {
-    uint8_t current_state;
     int slot = SHPC_LOGICAL_TO_IDX(target);
+    uint8_t old_state = shpc_get_status(shpc, slot, SHPC_SLOT_STATE_MASK);
+    uint8_t old_power = shpc_get_status(shpc, slot, SHPC_SLOT_PWR_LED_MASK);
+    uint8_t old_attn = shpc_get_status(shpc, slot, SHPC_SLOT_ATTN_LED_MASK);
+
     if (target < SHPC_CMD_TRGT_MIN || slot >= shpc->nslots) {
         shpc_invalid_command(shpc);
         return;
     }
-    current_state = shpc_get_status(shpc, slot, SHPC_SLOT_STATE_MASK);
-    if (current_state == SHPC_STATE_ENABLED && state == SHPC_STATE_PWRONLY) {
+
+    if (old_state == SHPC_STATE_ENABLED && state == SHPC_STATE_PWRONLY) {
         shpc_invalid_command(shpc);
         return;
     }
 
-    if (power != SHPC_LED_NO) {
+    if (power == SHPC_LED_NO) {
+        power = old_power;
+    } else {
         /* TODO: send event to monitor */
         shpc_set_status(shpc, slot, power, SHPC_SLOT_PWR_LED_MASK);
     }
-    if (attn != SHPC_LED_NO) {
+
+    if (attn == SHPC_LED_NO) {
+        attn = old_attn;
+    } else {
         /* TODO: send event to monitor */
         shpc_set_status(shpc, slot, attn, SHPC_SLOT_ATTN_LED_MASK);
     }
-    if (state != SHPC_STATE_NO) {
+
+    if (state == SHPC_STATE_NO) {
+        state = old_state;
+    } else {
         shpc_set_status(shpc, slot, state, SHPC_SLOT_STATE_MASK);
     }
 
-    if ((current_state == SHPC_STATE_ENABLED ||
-         current_state == SHPC_STATE_PWRONLY) &&
-        state == SHPC_STATE_DISABLED)
+    if (!shpc_slot_is_off(old_state, old_power, old_attn) &&
+        shpc_slot_is_off(state, power, attn))
     {
-        power = shpc_get_status(shpc, slot, SHPC_SLOT_PWR_LED_MASK);
-        /* TODO: track what monitor requested. */
-        /* Look at LED to figure out whether it's ok to remove the device. */
-        if (power == SHPC_LED_OFF) {
-            shpc_free_devices_in_slot(shpc, slot);
-            shpc_set_status(shpc, slot, 1, SHPC_SLOT_STATUS_MRL_OPEN);
-            shpc_set_status(shpc, slot, SHPC_SLOT_STATUS_PRSNT_EMPTY,
-                            SHPC_SLOT_STATUS_PRSNT_MASK);
-            shpc->config[SHPC_SLOT_EVENT_LATCH(slot)] |=
-                SHPC_SLOT_EVENT_MRL |
-                SHPC_SLOT_EVENT_PRESENCE;
-        }
+        shpc_free_devices_in_slot(shpc, slot);
+        shpc_set_status(shpc, slot, 1, SHPC_SLOT_STATUS_MRL_OPEN);
+        shpc_set_status(shpc, slot, SHPC_SLOT_STATUS_PRSNT_EMPTY,
+                        SHPC_SLOT_STATUS_PRSNT_MASK);
+        shpc->config[SHPC_SLOT_EVENT_LATCH(slot)] |=
+            SHPC_SLOT_EVENT_MRL |
+            SHPC_SLOT_EVENT_PRESENCE;
     }
 }
 
-- 
2.34.1


