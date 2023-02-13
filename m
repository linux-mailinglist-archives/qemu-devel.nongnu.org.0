Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A31516947AF
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 15:06:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRZP3-0006iP-1i; Mon, 13 Feb 2023 09:01:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pRZOa-0006bh-CN
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 09:01:37 -0500
Received: from forwardcorp1b.mail.yandex.net ([178.154.239.136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pRZOS-0005sc-Op
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 09:01:22 -0500
Received: from myt6-23a5e62c0090.qloud-c.yandex.net
 (myt6-23a5e62c0090.qloud-c.yandex.net
 [IPv6:2a02:6b8:c12:1da3:0:640:23a5:e62c])
 by forwardcorp1b.mail.yandex.net (Yandex) with ESMTP id E6AA061FE4;
 Mon, 13 Feb 2023 17:01:14 +0300 (MSK)
Received: from vsementsov-win.yandex-team.ru (unknown
 [2a02:6b8:b081:6527::1:3a])
 by myt6-23a5e62c0090.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 51j9w00QYCg1-Pk3iS5Sf; Mon, 13 Feb 2023 17:01:14 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1676296874; bh=MMa6nDioTx3cGuqWVQFeRTH8JsSLdlX2olYFCTFUFVU=;
 h=Message-Id:Date:In-Reply-To:Cc:Subject:References:To:From;
 b=Ar4JmQqCNaPSNzGu8uszabpp0+w+3M+tHqQZ3VGDaDS+R3wxQmhpyu3XGyHcQ+ZpV
 WJb6KGJoNmEc2bKAVbaBqX1A5vp3UcxxMmxTS4uiM7iujwfo5ZluoSDnQqPytJxdbz
 efmfXFMhPyYBJ5/GysPI7Xm/Cs+UtHXHbDyPfYH0=
Authentication-Results: myt6-23a5e62c0090.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
To: qemu-devel@nongnu.org
Cc: armbru@redhat.com, eblake@redhat.com, eduardo@habkost.net,
 berrange@redhat.com, pbonzini@redhat.com, marcel.apfelbaum@gmail.com,
 mst@redhat.com, philmd@linaro.org, vsementsov@yandex-team.ru,
 den-plotnikov@yandex-team.ru, antonkuchin@yandex-team.ru
Subject: [PATCH v4 03/16] pci/shpc: shpc_slot_command(): handle PWRONLY ->
 ENABLED transition
Date: Mon, 13 Feb 2023 17:00:50 +0300
Message-Id: <20230213140103.1518173-4-vsementsov@yandex-team.ru>
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

ENABLED -> PWRONLY transition is not allowed and we handle it by
shpc_invalid_command(). But PWRONLY -> ENABLED transition is silently
ignored, which seems wrong. Let's handle it as correct.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
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


