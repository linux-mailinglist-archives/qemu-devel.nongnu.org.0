Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E12FD62CCE9
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Nov 2022 22:46:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovQDu-00058N-6i; Wed, 16 Nov 2022 16:45:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1ovQDl-000580-9G
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 16:45:26 -0500
Received: from forwardcorp1a.mail.yandex.net ([178.154.239.72])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1ovQDi-0000z5-1n
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 16:45:24 -0500
Received: from vla5-b2806cb321eb.qloud-c.yandex.net
 (vla5-b2806cb321eb.qloud-c.yandex.net
 [IPv6:2a02:6b8:c18:3e0d:0:640:b280:6cb3])
 by forwardcorp1a.mail.yandex.net (Yandex) with ESMTP id 79C445FFF2;
 Thu, 17 Nov 2022 00:45:14 +0300 (MSK)
Received: from vsementsov-win.yandex-team.ru (unknown
 [2a02:6b8:b081:8128::1:3])
 by vla5-b2806cb321eb.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 X3SKbQNutI-jDOCt2BL; Thu, 17 Nov 2022 00:45:13 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1668635113; bh=sOuZ4yUMA00UtxswVXKC1w0nPOhE1ATEzrGHFwSL93Y=;
 h=Message-Id:Date:Cc:Subject:To:From;
 b=WXciLDUb5+6xrXba4yLCnYP/tmC0tAM+dDgygviwZx1QGam48IHjww1BNCgawrL6r
 celSQuOfx/QRXoKTgBUQ4yPt4qxheMXuiMA/su7SAfd9imNOQcxG3baW/e8AF4fpYF
 q9NxE1/xWwuzbLLb/YAlP8KqXIXMY0fQZrWaVHsg=
Authentication-Results: vla5-b2806cb321eb.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
To: qemu-devel@nongnu.org
Cc: marcel.apfelbaum@gmail.com, mst@redhat.com, vsementsov@yandex-team.ru,
 kraxel@redhat.com
Subject: [PATCH] shpc: disallow unplug when power indicator is blinking
Date: Thu, 17 Nov 2022 00:44:58 +0300
Message-Id: <20221116214458.82090-1-vsementsov@yandex-team.ru>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=178.154.239.72;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1a.mail.yandex.net
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

Pressing attention button has special meaning when power indicator is
blinking. Better just not do it.

For example, trying to remove device immediately after hotplug leads to
both commands succeded but device not actually unrealized.

Same thing for PCIE hotplug was done in
  81124b3c7a5dae "pcie: add power indicator blink check"

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
---
 hw/pci/shpc.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/hw/pci/shpc.c b/hw/pci/shpc.c
index e71f3a7483..fca7f6691a 100644
--- a/hw/pci/shpc.c
+++ b/hw/pci/shpc.c
@@ -568,6 +568,13 @@ void shpc_device_unplug_request_cb(HotplugHandler *hotplug_dev,
 
     state = shpc_get_status(shpc, slot, SHPC_SLOT_STATE_MASK);
     led = shpc_get_status(shpc, slot, SHPC_SLOT_PWR_LED_MASK);
+
+    if (led == SHPC_LED_BLINK) {
+        error_setg(errp, "Hot-unplug failed: "
+                   "guest is busy (power indicator blinking)");
+        return;
+    }
+
     if (state == SHPC_STATE_DISABLED && led == SHPC_LED_OFF) {
         shpc_free_devices_in_slot(shpc, slot);
         shpc_set_status(shpc, slot, 1, SHPC_SLOT_STATUS_MRL_OPEN);
-- 
2.34.1


