Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0495F6911E6
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Feb 2023 21:09:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQDDu-0001cp-SS; Thu, 09 Feb 2023 15:08:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pQDDk-0001Zw-Ro
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 15:08:41 -0500
Received: from forwardcorp1b.mail.yandex.net
 ([2a02:6b8:c02:900:1:45:d181:df01])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pQDDd-0002g7-KS
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 15:08:35 -0500
Received: from myt5-8800bd68420f.qloud-c.yandex.net
 (myt5-8800bd68420f.qloud-c.yandex.net
 [IPv6:2a02:6b8:c12:4615:0:640:8800:bd68])
 by forwardcorp1b.mail.yandex.net (Yandex) with ESMTP id 91EB661C4F;
 Thu,  9 Feb 2023 23:08:25 +0300 (MSK)
Received: from vsementsov-win.yandex-team.ru (unknown
 [2a02:6b8:b081:6518::1:1])
 by myt5-8800bd68420f.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 A8lCI60OTGk1-Fct6rbxj; Thu, 09 Feb 2023 23:08:24 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1675973304; bh=MMa6nDioTx3cGuqWVQFeRTH8JsSLdlX2olYFCTFUFVU=;
 h=Message-Id:Date:In-Reply-To:Cc:Subject:References:To:From;
 b=XX71IDrSEkkgaDmfpktkEG9LxbuNgGtl5iBqTmKX4VCOF6LB7aUUFld4ttzBJdIr3
 lCHBnauHP5ji6jDbDFzVGVOXyUmFDlK1NQmRuSFaMtCoveNi1+HxpGXqzAsUVM9+Qo
 lMfcKcIJ1iUgPa5Dw76EamMTBlWrCsAjjFzNR5zk=
Authentication-Results: myt5-8800bd68420f.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
To: qemu-devel@nongnu.org
Cc: armbru@redhat.com, eblake@redhat.com, eduardo@habkost.net,
 berrange@redhat.com, pbonzini@redhat.com, marcel.apfelbaum@gmail.com,
 mst@redhat.com, vsementsov@yandex-team.ru, den-plotnikov@yandex-team.ru
Subject: [PATCH v3 03/15] pci/shpc: shpc_slot_command(): handle PWRONLY ->
 ENABLED transition
Date: Thu,  9 Feb 2023 23:07:56 +0300
Message-Id: <20230209200808.869275-4-vsementsov@yandex-team.ru>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230209200808.869275-1-vsementsov@yandex-team.ru>
References: <20230209200808.869275-1-vsementsov@yandex-team.ru>
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


