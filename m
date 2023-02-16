Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54E6B699BD5
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 19:06:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSicA-0008Uw-WD; Thu, 16 Feb 2023 13:04:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pSic9-0008P2-7w
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 13:04:13 -0500
Received: from forwardcorp1c.mail.yandex.net ([178.154.239.200])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pSic5-0005lu-Pm
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 13:04:12 -0500
Received: from iva8-99b070b76c56.qloud-c.yandex.net
 (iva8-99b070b76c56.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0c:1099:0:640:99b0:70b7])
 by forwardcorp1c.mail.yandex.net (Yandex) with ESMTP id C4A8560153;
 Thu, 16 Feb 2023 21:04:03 +0300 (MSK)
Received: from vsementsov-win.yandex-team.ru (unknown
 [2a02:6b8:b081:8813::1:16])
 by iva8-99b070b76c56.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 u3q89J0Qp8c1-K0GSVfcF; Thu, 16 Feb 2023 21:04:03 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1676570643; bh=NbcCnKazuSUBtSMi8XHtmAMrPNfUeTOAcnzBYThFUXM=;
 h=Message-Id:Date:In-Reply-To:Cc:Subject:References:To:From;
 b=hNqLOYOmqbxBWsCTcGmkE+LfeoOdFwVT1pJ9+t5A4CJ7Gckxya6jdHQ2ukvH5rL8j
 2EYAO7ieLbH3cEpn6gJCLhlqcgXQsJ7rRU1Cwh0ctYybGLf0SlKsSAv8tn+zH3VBlQ
 WHzmuX1KGsThl6vtlrPyLjU2jTDJatMByC/KAdAs=
Authentication-Results: iva8-99b070b76c56.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
To: qemu-devel@nongnu.org
Cc: armbru@redhat.com, eblake@redhat.com, eduardo@habkost.net,
 berrange@redhat.com, pbonzini@redhat.com, marcel.apfelbaum@gmail.com,
 mst@redhat.com, philmd@linaro.org, vsementsov@yandex-team.ru,
 den-plotnikov@yandex-team.ru, antonkuchin@yandex-team.ru
Subject: [PATCH v5 03/18] pci/shpc: shpc_slot_command(): handle PWRONLY ->
 ENABLED transition
Date: Thu, 16 Feb 2023 21:03:41 +0300
Message-Id: <20230216180356.156832-4-vsementsov@yandex-team.ru>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230216180356.156832-1-vsementsov@yandex-team.ru>
References: <20230216180356.156832-1-vsementsov@yandex-team.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=178.154.239.200;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1c.mail.yandex.net
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

ENABLED -> PWRONLY transition is not allowed and we handle it by
shpc_invalid_command(). But PWRONLY -> ENABLED transition is silently
ignored, which seems wrong. Let's handle it as correct.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Reviewed-by: Anton Kuchin <antonkuchin@yandex-team.ru>
---
 hw/pci/shpc.c | 24 +++++++++---------------
 1 file changed, 9 insertions(+), 15 deletions(-)

diff --git a/hw/pci/shpc.c b/hw/pci/shpc.c
index 5d71569b13..25e4172382 100644
--- a/hw/pci/shpc.c
+++ b/hw/pci/shpc.c
@@ -273,28 +273,22 @@ static void shpc_slot_command(SHPCDevice *shpc, uint8_t target,
         return;
     }
 
-    switch (power) {
-    case SHPC_LED_NO:
-        break;
-    default:
+    if (power != SHPC_LED_NO) {
         /* TODO: send event to monitor */
         shpc_set_status(shpc, slot, power, SHPC_SLOT_PWR_LED_MASK);
     }
-    switch (attn) {
-    case SHPC_LED_NO:
-        break;
-    default:
+    if (attn != SHPC_LED_NO) {
         /* TODO: send event to monitor */
         shpc_set_status(shpc, slot, attn, SHPC_SLOT_ATTN_LED_MASK);
     }
-
-    if ((current_state == SHPC_STATE_DISABLED && state == SHPC_STATE_PWRONLY) ||
-        (current_state == SHPC_STATE_DISABLED && state == SHPC_STATE_ENABLED)) {
-        shpc_set_status(shpc, slot, state, SHPC_SLOT_STATE_MASK);
-    } else if ((current_state == SHPC_STATE_ENABLED ||
-                current_state == SHPC_STATE_PWRONLY) &&
-               state == SHPC_STATE_DISABLED) {
+    if (state != SHPC_STATE_NO) {
         shpc_set_status(shpc, slot, state, SHPC_SLOT_STATE_MASK);
+    }
+
+    if ((current_state == SHPC_STATE_ENABLED ||
+         current_state == SHPC_STATE_PWRONLY) &&
+        state == SHPC_STATE_DISABLED)
+    {
         power = shpc_get_status(shpc, slot, SHPC_SLOT_PWR_LED_MASK);
         /* TODO: track what monitor requested. */
         /* Look at LED to figure out whether it's ok to remove the device. */
-- 
2.34.1


