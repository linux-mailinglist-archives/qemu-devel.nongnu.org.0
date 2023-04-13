Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C15B86E10FC
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Apr 2023 17:22:27 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmym3-0000bo-Io; Thu, 13 Apr 2023 11:22:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhouzongmin@kylinos.cn>)
 id 1pms7Y-00062j-BI
 for qemu-devel@nongnu.org; Thu, 13 Apr 2023 04:15:57 -0400
Received: from mailgw.kylinos.cn ([124.126.103.232])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhouzongmin@kylinos.cn>)
 id 1pms7S-0006wa-3b
 for qemu-devel@nongnu.org; Thu, 13 Apr 2023 04:15:55 -0400
X-UUID: ae554d2ec21c4252a2dfd1ee852229f5-20230413
X-CID-O-RULE: Release_Ham
X-CID-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.22, REQID:030e2a02-2565-49dd-97c0-b0d958bb47a5, IP:5,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:-5,FILE:0,BULK:0,RULE:Release_Ham,ACTION
 :release,TS:0
X-CID-INFO: VERSION:1.1.22, REQID:030e2a02-2565-49dd-97c0-b0d958bb47a5, IP:5,
 URL
 :0,TC:0,Content:0,EDM:0,RT:0,SF:-5,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
 elease,TS:0
X-CID-META: VersionHash:120426c, CLOUDID:87eb32a1-8fcb-430b-954a-ba3f00fa94a5,
 B
 ulkID:230413161533M9Y73YZS,BulkQuantity:0,Recheck:0,SF:38|24|17|19|44|102,
 TC:nil,Content:0,EDM:-3,IP:-2,URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
 ,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-UUID: ae554d2ec21c4252a2dfd1ee852229f5-20230413
X-User: zhouzongmin@kylinos.cn
Received: from thinkpadx13gen2i.. [(116.128.244.169)] by mailgw
 (envelope-from <zhouzongmin@kylinos.cn>) (Generic MTA)
 with ESMTP id 1148605125; Thu, 13 Apr 2023 16:15:30 +0800
From: Zongmin Zhou <zhouzongmin@kylinos.cn>
To: pbonzini@redhat.com, richard.henderson@linaro.org, eduardo@habkost.net,
 mst@redhat.com, marcel.apfelbaum@gmail.com
Cc: qemu-devel@nongnu.org,
	Zongmin Zhou <zhouzongmin@kylinos.cn>
Subject: [PATCH] hw/i386/vmmouse:add relative packet flag for button status
Date: Thu, 13 Apr 2023 16:15:26 +0800
Message-Id: <20230413081526.2229916-1-zhouzongmin@kylinos.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=124.126.103.232;
 envelope-from=zhouzongmin@kylinos.cn; helo=mailgw.kylinos.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 13 Apr 2023 11:22:06 -0400
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

The buttons value use macros instead of direct numbers.

If request relative mode, have to add this for
guest vmmouse driver to judge this is a relative packet.
otherwise,vmmouse driver will not match
the condition 'status & VMMOUSE_RELATIVE_PACKET',
and can't report events on the correct(relative) input device,
result to relative mode unuseful.

Signed-off-by: Zongmin Zhou<zhouzongmin@kylinos.cn>
---
 hw/i386/vmmouse.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/hw/i386/vmmouse.c b/hw/i386/vmmouse.c
index a56c185f15..6cd624bd09 100644
--- a/hw/i386/vmmouse.c
+++ b/hw/i386/vmmouse.c
@@ -44,6 +44,12 @@
 
 #define VMMOUSE_VERSION		0x3442554a
 
+#define VMMOUSE_RELATIVE_PACKET    0x00010000
+
+#define VMMOUSE_LEFT_BUTTON        0x20
+#define VMMOUSE_RIGHT_BUTTON       0x10
+#define VMMOUSE_MIDDLE_BUTTON      0x08
+
 #ifdef DEBUG_VMMOUSE
 #define DPRINTF(fmt, ...) printf(fmt, ## __VA_ARGS__)
 #else
@@ -103,15 +109,18 @@ static void vmmouse_mouse_event(void *opaque, int x, int y, int dz, int buttons_
             x, y, dz, buttons_state);
 
     if ((buttons_state & MOUSE_EVENT_LBUTTON))
-        buttons |= 0x20;
+        buttons |= VMMOUSE_LEFT_BUTTON;
     if ((buttons_state & MOUSE_EVENT_RBUTTON))
-        buttons |= 0x10;
+        buttons |= VMMOUSE_RIGHT_BUTTON;
     if ((buttons_state & MOUSE_EVENT_MBUTTON))
-        buttons |= 0x08;
+        buttons |= VMMOUSE_MIDDLE_BUTTON;
 
     if (s->absolute) {
         x <<= 1;
         y <<= 1;
+    } else{
+        /* add for guest vmmouse driver to judge this is a relative packet. */
+        buttons |= VMMOUSE_RELATIVE_PACKET;
     }
 
     s->queue[s->nb_queue++] = buttons;
-- 
2.34.1


No virus found
		Checked by Hillstone Network AntiVirus

