Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BFE93FB3F2
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Aug 2021 12:34:23 +0200 (CEST)
Received: from localhost ([::1]:39814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mKecL-0002in-34
	for lists+qemu-devel@lfdr.de; Mon, 30 Aug 2021 06:34:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mKeU7-0005nH-9J
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 06:25:47 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:53320
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mKeU4-0007MP-AE
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 06:25:46 -0400
Received: from host86-179-186-93.range86-179.btcentralplus.com
 ([86.179.186.93] helo=kentang.home)
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mKeTR-0003D2-2i; Mon, 30 Aug 2021 11:25:10 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org,
	laurent@vivier.eu
Date: Mon, 30 Aug 2021 11:24:42 +0100
Message-Id: <20210830102447.10806-8-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210830102447.10806-1-mark.cave-ayland@ilande.co.uk>
References: <20210830102447.10806-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.179.186.93
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 07/12] mac_via: move VIA1 reset logic from mac_via_reset() to
 mos6522_q800_via1_reset()
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

After this change mac_via_reset() is now empty and can be removed.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/misc/mac_via.c | 22 ++++++++--------------
 1 file changed, 8 insertions(+), 14 deletions(-)

diff --git a/hw/misc/mac_via.c b/hw/misc/mac_via.c
index 47e221dd88..a2df17d9be 100644
--- a/hw/misc/mac_via.c
+++ b/hw/misc/mac_via.c
@@ -945,18 +945,6 @@ static const MemoryRegionOps mos6522_q800_via2_ops = {
     },
 };
 
-static void mac_via_reset(DeviceState *dev)
-{
-    MacVIAState *m = MAC_VIA(dev);
-    MOS6522Q800VIA1State *v1s = &m->mos6522_via1;
-    ADBBusState *adb_bus = &v1s->adb_bus;
-
-    adb_set_autopoll_enabled(adb_bus, true);
-
-    v1s->cmd = REG_EMPTY;
-    v1s->alt = REG_EMPTY;
-}
-
 static void mac_via_realize(DeviceState *dev, Error **errp)
 {
     MacVIAState *m = MAC_VIA(dev);
@@ -1072,7 +1060,6 @@ static void mac_via_class_init(ObjectClass *oc, void *data)
     DeviceClass *dc = DEVICE_CLASS(oc);
 
     dc->realize = mac_via_realize;
-    dc->reset = mac_via_reset;
 }
 
 static TypeInfo mac_via_info = {
@@ -1086,8 +1073,10 @@ static TypeInfo mac_via_info = {
 /* VIA 1 */
 static void mos6522_q800_via1_reset(DeviceState *dev)
 {
-    MOS6522State *ms = MOS6522(dev);
+    MOS6522Q800VIA1State *v1s = MOS6522_Q800_VIA1(dev);
+    MOS6522State *ms = MOS6522(v1s);
     MOS6522DeviceClass *mdc = MOS6522_GET_CLASS(ms);
+    ADBBusState *adb_bus = &v1s->adb_bus;
 
     mdc->parent_reset(dev);
 
@@ -1095,6 +1084,11 @@ static void mos6522_q800_via1_reset(DeviceState *dev)
     ms->timers[1].frequency = VIA_TIMER_FREQ;
 
     ms->b = VIA1B_vADB_StateMask | VIA1B_vADBInt | VIA1B_vRTCEnb;
+
+    /* ADB/RTC */
+    adb_set_autopoll_enabled(adb_bus, true);
+    v1s->cmd = REG_EMPTY;
+    v1s->alt = REG_EMPTY;
 }
 
 static void mos6522_q800_via1_init(Object *obj)
-- 
2.20.1


