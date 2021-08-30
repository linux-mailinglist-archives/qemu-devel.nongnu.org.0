Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B40CE3FB3D8
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Aug 2021 12:28:20 +0200 (CEST)
Received: from localhost ([::1]:52260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mKeWZ-0000Cz-Od
	for lists+qemu-devel@lfdr.de; Mon, 30 Aug 2021 06:28:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mKeU6-0005l2-8N
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 06:25:46 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:53316
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mKeU2-0007LB-SG
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 06:25:45 -0400
Received: from host86-179-186-93.range86-179.btcentralplus.com
 ([86.179.186.93] helo=kentang.home)
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mKeTL-0003D2-Su; Mon, 30 Aug 2021 11:25:04 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org,
	laurent@vivier.eu
Date: Mon, 30 Aug 2021 11:24:41 +0100
Message-Id: <20210830102447.10806-7-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210830102447.10806-1-mark.cave-ayland@ilande.co.uk>
References: <20210830102447.10806-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.179.186.93
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 06/12] mac_via: move q800 VIA1 timer variables to q800 VIA1
 VMStateDescription
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.bv.iomart.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.bv.iomart.io
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) SPF_HELO_NONE=0.001,
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

These variables are already present in MOS6522Q800VIA1State and so it is just
the VMStateDescription move that is needed.

With this change the mac_via VMStateDescription is now empty and can be removed
completely.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/misc/mac_via.c | 20 +++++---------------
 1 file changed, 5 insertions(+), 15 deletions(-)

diff --git a/hw/misc/mac_via.c b/hw/misc/mac_via.c
index b4a65480fd..47e221dd88 100644
--- a/hw/misc/mac_via.c
+++ b/hw/misc/mac_via.c
@@ -1067,27 +1067,12 @@ static int via1_post_load(void *opaque, int version_id)
     return 0;
 }
 
-static const VMStateDescription vmstate_mac_via = {
-    .name = "mac-via",
-    .version_id = 2,
-    .minimum_version_id = 2,
-    .fields = (VMStateField[]) {
-        /* VIAs */
-        VMSTATE_TIMER_PTR(mos6522_via1.one_second_timer, MacVIAState),
-        VMSTATE_INT64(mos6522_via1.next_second, MacVIAState),
-        VMSTATE_TIMER_PTR(mos6522_via1.sixty_hz_timer, MacVIAState),
-        VMSTATE_INT64(mos6522_via1.next_sixty_hz, MacVIAState),
-        VMSTATE_END_OF_LIST()
-    }
-};
-
 static void mac_via_class_init(ObjectClass *oc, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(oc);
 
     dc->realize = mac_via_realize;
     dc->reset = mac_via_reset;
-    dc->vmsd = &vmstate_mac_via;
 }
 
 static TypeInfo mac_via_info = {
@@ -1150,6 +1135,11 @@ static const VMStateDescription vmstate_q800_via1 = {
         VMSTATE_BUFFER(adb_data_in, MOS6522Q800VIA1State),
         VMSTATE_BUFFER(adb_data_out, MOS6522Q800VIA1State),
         VMSTATE_UINT8(adb_autopoll_cmd, MOS6522Q800VIA1State),
+        /* Timers */
+        VMSTATE_TIMER_PTR(one_second_timer, MOS6522Q800VIA1State),
+        VMSTATE_INT64(next_second, MOS6522Q800VIA1State),
+        VMSTATE_TIMER_PTR(sixty_hz_timer, MOS6522Q800VIA1State),
+        VMSTATE_INT64(next_sixty_hz, MOS6522Q800VIA1State),
         VMSTATE_END_OF_LIST()
     }
 };
-- 
2.20.1


