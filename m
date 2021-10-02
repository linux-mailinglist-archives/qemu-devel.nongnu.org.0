Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6029D41FB0B
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Oct 2021 13:12:34 +0200 (CEST)
Received: from localhost ([::1]:55186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWcwT-0003Nx-B2
	for lists+qemu-devel@lfdr.de; Sat, 02 Oct 2021 07:12:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mWcl2-0004v0-Gg
 for qemu-devel@nongnu.org; Sat, 02 Oct 2021 07:00:48 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:33186
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mWckz-0004yT-6Q
 for qemu-devel@nongnu.org; Sat, 02 Oct 2021 07:00:42 -0400
Received: from [2a00:23c4:8b9d:4100:5d98:71b5:90ca:dad1] (helo=kentang.home)
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mWckl-00020j-Ez; Sat, 02 Oct 2021 12:00:31 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org,
	laurent@vivier.eu
Date: Sat,  2 Oct 2021 12:00:02 +0100
Message-Id: <20211002110007.30825-8-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211002110007.30825-1-mark.cave-ayland@ilande.co.uk>
References: <20211002110007.30825-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8b9d:4100:5d98:71b5:90ca:dad1
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 07/12] macfb: add qdev property to specify display type
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.bv.iomart.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.bv.iomart.io
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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

Since the available resolutions and colour depths are determined by the attached
display type, add a qdev property to allow the display type to be specified.

The main resolutions of interest are high resolution 1152x870 with 8-bit colour
and SVGA resolution up to 800x600 with 32-bit colour so update the q800 machine
to allow high resolution mode if specified and otherwise fall back to SVGA.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/display/macfb.c         | 6 +++++-
 hw/m68k/q800.c             | 5 +++++
 include/hw/display/macfb.h | 1 +
 3 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/hw/display/macfb.c b/hw/display/macfb.c
index 5c95aa4a11..023d1f0cd1 100644
--- a/hw/display/macfb.c
+++ b/hw/display/macfb.c
@@ -316,7 +316,7 @@ static uint32_t macfb_sense_read(MacfbState *s)
     MacFbSense *macfb_sense;
     uint8_t sense;
 
-    macfb_sense = &macfb_sense_table[MACFB_DISPLAY_VGA];
+    macfb_sense = &macfb_sense_table[s->type];
     if (macfb_sense->sense == 0x7) {
         /* Extended sense */
         sense = 0;
@@ -545,6 +545,8 @@ static Property macfb_sysbus_properties[] = {
     DEFINE_PROP_UINT32("width", MacfbSysBusState, macfb.width, 640),
     DEFINE_PROP_UINT32("height", MacfbSysBusState, macfb.height, 480),
     DEFINE_PROP_UINT8("depth", MacfbSysBusState, macfb.depth, 8),
+    DEFINE_PROP_UINT8("display", MacfbSysBusState, macfb.type,
+                      MACFB_DISPLAY_VGA),
     DEFINE_PROP_END_OF_LIST(),
 };
 
@@ -552,6 +554,8 @@ static Property macfb_nubus_properties[] = {
     DEFINE_PROP_UINT32("width", MacfbNubusState, macfb.width, 640),
     DEFINE_PROP_UINT32("height", MacfbNubusState, macfb.height, 480),
     DEFINE_PROP_UINT8("depth", MacfbNubusState, macfb.depth, 8),
+    DEFINE_PROP_UINT8("display", MacfbNubusState, macfb.type,
+                      MACFB_DISPLAY_VGA),
     DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/hw/m68k/q800.c b/hw/m68k/q800.c
index 09b3366024..5223b880bc 100644
--- a/hw/m68k/q800.c
+++ b/hw/m68k/q800.c
@@ -421,6 +421,11 @@ static void q800_init(MachineState *machine)
     qdev_prop_set_uint32(dev, "width", graphic_width);
     qdev_prop_set_uint32(dev, "height", graphic_height);
     qdev_prop_set_uint8(dev, "depth", graphic_depth);
+    if (graphic_width == 1152 && graphic_height == 870 && graphic_depth == 8) {
+        qdev_prop_set_uint8(dev, "display", MACFB_DISPLAY_APPLE_21_COLOR);
+    } else {
+        qdev_prop_set_uint8(dev, "display", MACFB_DISPLAY_VGA);
+    }
     qdev_realize_and_unref(dev, BUS(nubus), &error_fatal);
 
     cs = CPU(cpu);
diff --git a/include/hw/display/macfb.h b/include/hw/display/macfb.h
index febf4ce0e8..e95a97ebdc 100644
--- a/include/hw/display/macfb.h
+++ b/include/hw/display/macfb.h
@@ -46,6 +46,7 @@ typedef struct MacfbState {
     uint8_t color_palette[256 * 3];
     uint32_t width, height; /* in pixels */
     uint8_t depth;
+    uint8_t type;
 
     uint32_t sense;
 } MacfbState;
-- 
2.20.1


