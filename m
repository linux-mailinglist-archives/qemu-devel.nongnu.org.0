Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC74A3B477D
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Jun 2021 18:37:55 +0200 (CEST)
Received: from localhost ([::1]:38824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwoq2-0002s1-Op
	for lists+qemu-devel@lfdr.de; Fri, 25 Jun 2021 12:37:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lwooQ-0000ow-96
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 12:36:14 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:59818
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lwooK-0005aZ-E8
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 12:36:11 -0400
Received: from host109-153-84-9.range109-153.btcentralplus.com ([109.153.84.9]
 helo=kentang.home) by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lwoo0-000A6b-P1; Fri, 25 Jun 2021 17:35:53 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org, f4bug@amsat.org, aurelien@aurel32.net,
 jiaxun.yang@flygoat.com, aleksandar.rikalo@syrmia.com,
 hpoussin@reactos.org, fthain@telegraphics.com.au
Date: Fri, 25 Jun 2021 17:35:53 +0100
Message-Id: <20210625163554.14879-2-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210625163554.14879-1-mark.cave-ayland@ilande.co.uk>
References: <20210625163554.14879-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 109.153.84.9
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v2 1/2] g364fb: use RAM memory region for framebuffer
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

Since the migration stream is already broken, we can use this opportunity to
change the framebuffer so that it is migrated as a RAM memory region rather
than as an array of bytes.

In particular this helps the output of the analyze-migration.py tool which
no longer contains a huge array representing the framebuffer contents.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/display/g364fb.c | 20 +++++++++-----------
 1 file changed, 9 insertions(+), 11 deletions(-)

diff --git a/hw/display/g364fb.c b/hw/display/g364fb.c
index 8f1725432c..87effbf2b0 100644
--- a/hw/display/g364fb.c
+++ b/hw/display/g364fb.c
@@ -22,6 +22,7 @@
 #include "hw/hw.h"
 #include "hw/irq.h"
 #include "hw/qdev-properties.h"
+#include "qapi/error.h"
 #include "qemu/error-report.h"
 #include "qemu/module.h"
 #include "ui/console.h"
@@ -33,7 +34,6 @@
 
 typedef struct G364State {
     /* hardware */
-    uint8_t *vram;
     uint32_t vram_size;
     qemu_irq irq;
     MemoryRegion mem_vram;
@@ -125,7 +125,7 @@ static void g364fb_draw_graphic8(G364State *s)
         xcursor = ycursor = -65;
     }
 
-    vram = s->vram + s->top_of_screen;
+    vram = memory_region_get_ram_ptr(&s->mem_vram) + s->top_of_screen;
     /* XXX: out of range in vram? */
     data_display = dd = surface_data(surface);
     snap = memory_region_snapshot_and_clear_dirty(&s->mem_vram, 0, s->vram_size,
@@ -274,6 +274,8 @@ static inline void g364fb_invalidate_display(void *opaque)
 
 static void g364fb_reset(G364State *s)
 {
+    uint8_t *vram = memory_region_get_ram_ptr(&s->mem_vram);
+
     qemu_irq_lower(s->irq);
 
     memset(s->color_palette, 0, sizeof(s->color_palette));
@@ -283,7 +285,7 @@ static void g364fb_reset(G364State *s)
     s->ctla = 0;
     s->top_of_screen = 0;
     s->width = s->height = 0;
-    memset(s->vram, 0, s->vram_size);
+    memset(vram, 0, s->vram_size);
     g364fb_invalidate_display(s);
 }
 
@@ -450,11 +452,10 @@ static int g364fb_post_load(void *opaque, int version_id)
 
 static const VMStateDescription vmstate_g364fb = {
     .name = "g364fb",
-    .version_id = 1,
-    .minimum_version_id = 1,
+    .version_id = 2,
+    .minimum_version_id = 2,
     .post_load = g364fb_post_load,
     .fields = (VMStateField[]) {
-        VMSTATE_VBUFFER_UINT32(vram, G364State, 1, NULL, vram_size),
         VMSTATE_BUFFER_UNSAFE(color_palette, G364State, 0, 256 * 3),
         VMSTATE_BUFFER_UNSAFE(cursor_palette, G364State, 0, 9),
         VMSTATE_UINT16_ARRAY(cursor, G364State, 512),
@@ -474,15 +475,12 @@ static const GraphicHwOps g364fb_ops = {
 
 static void g364fb_init(DeviceState *dev, G364State *s)
 {
-    s->vram = g_malloc0(s->vram_size);
-
     s->con = graphic_console_init(dev, 0, &g364fb_ops, s);
 
     memory_region_init_io(&s->mem_ctrl, OBJECT(dev), &g364fb_ctrl_ops, s,
                           "ctrl", 0x180000);
-    memory_region_init_ram_ptr(&s->mem_vram, NULL, "vram",
-                               s->vram_size, s->vram);
-    vmstate_register_ram(&s->mem_vram, dev);
+    memory_region_init_ram(&s->mem_vram, NULL, "g364fb.vram", s->vram_size,
+                           &error_fatal);
     memory_region_set_log(&s->mem_vram, true, DIRTY_MEMORY_VGA);
 }
 
-- 
2.20.1


