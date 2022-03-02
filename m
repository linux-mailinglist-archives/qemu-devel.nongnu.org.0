Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3123D4CB180
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 22:41:05 +0100 (CET)
Received: from localhost ([::1]:53490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPWiW-0002YW-AP
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 16:41:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nPWWG-0001SZ-7Z
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 16:28:24 -0500
Received: from [2001:41c9:1:41f::167] (port=54740
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nPWWE-0002DG-Mu
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 16:28:23 -0500
Received: from [2a00:23c4:8ba0:ca00:d4eb:dbd5:5a41:aefe] (helo=kentang.home)
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nPWVT-000C4G-Ud; Wed, 02 Mar 2022 21:27:40 +0000
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: laurent@vivier.eu, pbonzini@redhat.com, fam@euphon.net,
 qemu-devel@nongnu.org
Date: Wed,  2 Mar 2022 21:27:43 +0000
Message-Id: <20220302212752.6922-2-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220302212752.6922-1-mark.cave-ayland@ilande.co.uk>
References: <20220302212752.6922-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba0:ca00:d4eb:dbd5:5a41:aefe
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v2 01/10] macfb: add VMStateDescription for MacfbNubusState
 and MacfbSysBusState
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.bv.iomart.io)
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2001:41c9:1:41f::167
 (failed)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.bv.iomart.io
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently when QEMU tries to migrate the macfb framebuffer it crashes randomly
because the opaque provided by the DeviceClass vmsd property for both devices
is set to MacfbState rather than MacfbNubusState or MacfbSysBusState as
appropriate.

Resolve the issue by adding new VMStateDescriptions for MacfbNubusState and
MacfbSysBusState which embed the existing vmstate_macfb VMStateDescription
within them using VMSTATE_STRUCT.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/display/macfb.c | 24 ++++++++++++++++++++++--
 1 file changed, 22 insertions(+), 2 deletions(-)

diff --git a/hw/display/macfb.c b/hw/display/macfb.c
index c9b468c10e..66ceacf1ae 100644
--- a/hw/display/macfb.c
+++ b/hw/display/macfb.c
@@ -746,6 +746,16 @@ static Property macfb_sysbus_properties[] = {
     DEFINE_PROP_END_OF_LIST(),
 };
 
+static const VMStateDescription vmstate_macfb_sysbus = {
+    .name = "macfb-sysbus",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields = (VMStateField[]) {
+        VMSTATE_STRUCT(macfb, MacfbSysBusState, 1, vmstate_macfb, MacfbState),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
 static Property macfb_nubus_properties[] = {
     DEFINE_PROP_UINT32("width", MacfbNubusState, macfb.width, 640),
     DEFINE_PROP_UINT32("height", MacfbNubusState, macfb.height, 480),
@@ -755,6 +765,16 @@ static Property macfb_nubus_properties[] = {
     DEFINE_PROP_END_OF_LIST(),
 };
 
+static const VMStateDescription vmstate_macfb_nubus = {
+    .name = "macfb-nubus",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields = (VMStateField[]) {
+        VMSTATE_STRUCT(macfb, MacfbNubusState, 1, vmstate_macfb, MacfbState),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
 static void macfb_sysbus_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
@@ -762,7 +782,7 @@ static void macfb_sysbus_class_init(ObjectClass *klass, void *data)
     dc->realize = macfb_sysbus_realize;
     dc->desc = "SysBus Macintosh framebuffer";
     dc->reset = macfb_sysbus_reset;
-    dc->vmsd = &vmstate_macfb;
+    dc->vmsd = &vmstate_macfb_sysbus;
     device_class_set_props(dc, macfb_sysbus_properties);
 }
 
@@ -777,7 +797,7 @@ static void macfb_nubus_class_init(ObjectClass *klass, void *data)
                                       &ndc->parent_unrealize);
     dc->desc = "Nubus Macintosh framebuffer";
     dc->reset = macfb_nubus_reset;
-    dc->vmsd = &vmstate_macfb;
+    dc->vmsd = &vmstate_macfb_nubus;
     set_bit(DEVICE_CATEGORY_DISPLAY, dc->categories);
     device_class_set_props(dc, macfb_nubus_properties);
 }
-- 
2.20.1


