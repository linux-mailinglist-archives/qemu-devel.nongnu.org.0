Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07FBA425044
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 11:43:45 +0200 (CEST)
Received: from localhost ([::1]:42268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYPwG-0008Gm-3K
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 05:43:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mYPnh-00009x-IA
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 05:34:53 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:40706
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mYPne-0001L0-7N
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 05:34:53 -0400
Received: from [2a00:23c4:8b9d:4100:5d98:71b5:90ca:dad1] (helo=kentang.home)
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mYPnO-0000tc-Qm; Thu, 07 Oct 2021 10:34:39 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org,
	laurent@vivier.eu
Date: Thu,  7 Oct 2021 10:34:03 +0100
Message-Id: <20211007093407.3329-10-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211007093407.3329-1-mark.cave-ayland@ilande.co.uk>
References: <20211007093407.3329-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8b9d:4100:5d98:71b5:90ca:dad1
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v3 09/13] macfb: add common monitor modes supported by the
 MacOS toolbox ROM
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

The monitor modes table is found by experimenting with the Monitors Control
Panel in MacOS and analysing the reads/writes. From this it can be found that
the mode is controlled by writes to the DAFB_MODE_CTRL1 and DAFB_MODE_CTRL2
registers.

Implement the first block of DAFB registers as a register array including the
existing sense register, the newly discovered control registers above, and also
the DAFB_MODE_VADDR1 and DAFB_MODE_VADDR2 registers which are used by NetBSD to
determine the current video mode.

These experiments also show that the offset of the start of video RAM and the
stride can change depending upon the monitor mode, so update macfb_draw_graphic()
and both the BI_MAC_VADDR and BI_MAC_VROW bootinfo for the q800 machine
accordingly.

Finally update macfb_common_realize() so that only the resolution and depth
supported by the display type can be specified on the command line, and add an
error hint showing the list of supported resolutions and depths if the user tries
to specify an invalid display mode.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/display/macfb.c         | 149 +++++++++++++++++++++++++++++++++----
 hw/display/trace-events    |   1 +
 hw/m68k/q800.c             |  11 ++-
 include/hw/display/macfb.h |  16 +++-
 4 files changed, 156 insertions(+), 21 deletions(-)

diff --git a/hw/display/macfb.c b/hw/display/macfb.c
index f98bcdec2d..2759fb5e34 100644
--- a/hw/display/macfb.c
+++ b/hw/display/macfb.c
@@ -22,12 +22,16 @@
 #include "migration/vmstate.h"
 #include "trace.h"
 
-#define VIDEO_BASE 0x00001000
+#define VIDEO_BASE 0x0
 #define DAFB_BASE  0x00800000
 
 #define MACFB_PAGE_SIZE 4096
 #define MACFB_VRAM_SIZE (4 * MiB)
 
+#define DAFB_MODE_VADDR1    0x0
+#define DAFB_MODE_VADDR2    0x4
+#define DAFB_MODE_CTRL1     0x8
+#define DAFB_MODE_CTRL2     0xc
 #define DAFB_MODE_SENSE     0x1c
 #define DAFB_RESET          0x200
 #define DAFB_LUT            0x213
@@ -89,6 +93,22 @@ static MacFbSense macfb_sense_table[] = {
     { MACFB_DISPLAY_SVGA, 0x7, 0x5 },
 };
 
+static MacFbMode macfb_mode_table[] = {
+    { MACFB_DISPLAY_VGA, 1, 0x100, 0x71e, 640, 480, 0x400, 0x1000 },
+    { MACFB_DISPLAY_VGA, 2, 0x100, 0x70e, 640, 480, 0x400, 0x1000 },
+    { MACFB_DISPLAY_VGA, 4, 0x100, 0x706, 640, 480, 0x400, 0x1000 },
+    { MACFB_DISPLAY_VGA, 8, 0x100, 0x702, 640, 480, 0x400, 0x1000 },
+    { MACFB_DISPLAY_VGA, 24, 0x100, 0x7ff, 640, 480, 0x1000, 0x1000 },
+    { MACFB_DISPLAY_VGA, 1, 0xd0 , 0x70e, 800, 600, 0x340, 0xe00 },
+    { MACFB_DISPLAY_VGA, 2, 0xd0 , 0x706, 800, 600, 0x340, 0xe00 },
+    { MACFB_DISPLAY_VGA, 4, 0xd0 , 0x702, 800, 600, 0x340, 0xe00 },
+    { MACFB_DISPLAY_VGA, 8, 0xd0,  0x700, 800, 600, 0x340, 0xe00 },
+    { MACFB_DISPLAY_VGA, 24, 0x340, 0x100, 800, 600, 0xd00, 0xe00 },
+    { MACFB_DISPLAY_APPLE_21_COLOR, 1, 0x90, 0x506, 1152, 870, 0x240, 0x80 },
+    { MACFB_DISPLAY_APPLE_21_COLOR, 2, 0x90, 0x502, 1152, 870, 0x240, 0x80 },
+    { MACFB_DISPLAY_APPLE_21_COLOR, 4, 0x90, 0x500, 1152, 870, 0x240, 0x80 },
+    { MACFB_DISPLAY_APPLE_21_COLOR, 8, 0x120, 0x5ff, 1152, 870, 0x480, 0x80 },
+};
 
 typedef void macfb_draw_line_func(MacfbState *s, uint8_t *d, uint32_t addr,
                                   int width);
@@ -246,7 +266,7 @@ static void macfb_draw_graphic(MacfbState *s)
     ram_addr_t page;
     uint32_t v = 0;
     int y, ymin;
-    int macfb_stride = (s->depth * s->width + 7) / 8;
+    int macfb_stride = s->mode->stride;
     macfb_draw_line_func *macfb_draw_line;
 
     switch (s->depth) {
@@ -278,7 +298,7 @@ static void macfb_draw_graphic(MacfbState *s)
                                              DIRTY_MEMORY_VGA);
 
     ymin = -1;
-    page = 0;
+    page = s->mode->offset;
     for (y = 0; y < s->height; y++, page += macfb_stride) {
         if (macfb_check_dirty(s, snap, page, macfb_stride)) {
             uint8_t *data_display;
@@ -323,25 +343,26 @@ static uint32_t macfb_sense_read(MacfbState *s)
         sense = 0;
         if (!(macfb_sense->ext_sense & 1)) {
             /* Pins 7-4 together */
-            if (~s->sense & 3) {
-                sense = (~s->sense & 7) | 3;
+            if (~s->regs[DAFB_MODE_SENSE >> 2] & 3) {
+                sense = (~s->regs[DAFB_MODE_SENSE >> 2] & 7) | 3;
             }
         }
         if (!(macfb_sense->ext_sense & 2)) {
             /* Pins 10-7 together */
-            if (~s->sense & 6) {
-                sense = (~s->sense & 7) | 6;
+            if (~s->regs[DAFB_MODE_SENSE >> 2] & 6) {
+                sense = (~s->regs[DAFB_MODE_SENSE >> 2] & 7) | 6;
             }
         }
         if (!(macfb_sense->ext_sense & 4)) {
             /* Pins 4-10 together */
-            if (~s->sense & 5) {
-                sense = (~s->sense & 7) | 5;
+            if (~s->regs[DAFB_MODE_SENSE >> 2] & 5) {
+                sense = (~s->regs[DAFB_MODE_SENSE >> 2] & 7) | 5;
             }
         }
     } else {
         /* Normal sense */
-        sense = (~macfb_sense->sense & 7) | (~s->sense & 7);
+        sense = (~macfb_sense->sense & 7) |
+                (~s->regs[DAFB_MODE_SENSE >> 2] & 7);
     }
 
     trace_macfb_sense_read(sense);
@@ -350,12 +371,84 @@ static uint32_t macfb_sense_read(MacfbState *s)
 
 static void macfb_sense_write(MacfbState *s, uint32_t val)
 {
-    s->sense = val;
+    s->regs[DAFB_MODE_SENSE >> 2] = val;
 
     trace_macfb_sense_write(val);
     return;
 }
 
+static void macfb_update_mode(MacfbState *s)
+{
+    s->width = s->mode->width;
+    s->height = s->mode->height;
+    s->depth = s->mode->depth;
+
+    trace_macfb_update_mode(s->width, s->height, s->depth);
+    macfb_invalidate_display(s);
+}
+
+static void macfb_mode_write(MacfbState *s)
+{
+    MacFbMode *macfb_mode;
+    int i;
+
+    for (i = 0; i < ARRAY_SIZE(macfb_mode_table); i++) {
+        macfb_mode = &macfb_mode_table[i];
+
+        if (s->type != macfb_mode->type) {
+            continue;
+        }
+
+        if ((s->regs[DAFB_MODE_CTRL1 >> 2] & 0xff) ==
+             (macfb_mode->mode_ctrl1 & 0xff) &&
+            (s->regs[DAFB_MODE_CTRL2 >> 2] & 0xff) ==
+             (macfb_mode->mode_ctrl2 & 0xff)) {
+            s->mode = macfb_mode;
+            macfb_update_mode(s);
+            break;
+        }
+    }
+}
+
+static MacFbMode *macfb_find_mode(MacfbDisplayType display_type,
+                                  uint16_t width, uint16_t height,
+                                  uint8_t depth)
+{
+    MacFbMode *macfb_mode;
+    int i;
+
+    for (i = 0; i < ARRAY_SIZE(macfb_mode_table); i++) {
+        macfb_mode = &macfb_mode_table[i];
+
+        if (display_type == macfb_mode->type && width == macfb_mode->width &&
+                height == macfb_mode->height && depth == macfb_mode->depth) {
+            return macfb_mode;
+        }
+    }
+
+    return NULL;
+}
+
+static gchar *macfb_mode_list(void)
+{
+    gchar *list = NULL;
+    gchar *mode;
+    MacFbMode *macfb_mode;
+    int i;
+
+    for (i = 0; i < ARRAY_SIZE(macfb_mode_table); i++) {
+        macfb_mode = &macfb_mode_table[i];
+
+        mode = g_strdup_printf("    %dx%dx%d\n", macfb_mode->width,
+                               macfb_mode->height, macfb_mode->depth);
+        list = g_strconcat(mode, list, NULL);
+        g_free(mode);
+    }
+
+    return list;
+}
+
+
 static void macfb_update_display(void *opaque)
 {
     MacfbState *s = opaque;
@@ -397,6 +490,12 @@ static uint64_t macfb_ctrl_read(void *opaque,
     uint64_t val = 0;
 
     switch (addr) {
+    case DAFB_MODE_VADDR1:
+    case DAFB_MODE_VADDR2:
+    case DAFB_MODE_CTRL1:
+    case DAFB_MODE_CTRL2:
+        val = s->regs[addr >> 2];
+        break;
     case DAFB_MODE_SENSE:
         val = macfb_sense_read(s);
         break;
@@ -413,6 +512,17 @@ static void macfb_ctrl_write(void *opaque,
 {
     MacfbState *s = opaque;
     switch (addr) {
+    case DAFB_MODE_VADDR1:
+    case DAFB_MODE_VADDR2:
+        s->regs[addr >> 2] = val;
+        break;
+    case DAFB_MODE_CTRL1 ... DAFB_MODE_CTRL1 + 3:
+    case DAFB_MODE_CTRL2 ... DAFB_MODE_CTRL2 + 3:
+        s->regs[addr >> 2] = val;
+        if (val) {
+            macfb_mode_write(s);
+        }
+        break;
     case DAFB_MODE_SENSE:
         macfb_sense_write(s, val);
         break;
@@ -442,7 +552,7 @@ static const MemoryRegionOps macfb_ctrl_ops = {
 
 static int macfb_post_load(void *opaque, int version_id)
 {
-    macfb_invalidate_display(opaque);
+    macfb_mode_write(opaque);
     return 0;
 }
 
@@ -455,7 +565,7 @@ static const VMStateDescription vmstate_macfb = {
     .fields = (VMStateField[]) {
         VMSTATE_UINT8_ARRAY(color_palette, MacfbState, 256 * 3),
         VMSTATE_UINT32(palette_current, MacfbState),
-        VMSTATE_UINT32(sense, MacfbState),
+        VMSTATE_UINT32_ARRAY(regs, MacfbState, MACFB_NUM_REGS),
         VMSTATE_END_OF_LIST()
     }
 };
@@ -469,9 +579,15 @@ static bool macfb_common_realize(DeviceState *dev, MacfbState *s, Error **errp)
 {
     DisplaySurface *surface;
 
-    if (s->depth != 1 && s->depth != 2 && s->depth != 4 && s->depth != 8 &&
-        s->depth != 16 && s->depth != 24) {
-        error_setg(errp, "unknown guest depth %d", s->depth);
+    s->mode = macfb_find_mode(s->type, s->width, s->height, s->depth);
+    if (!s->mode) {
+        gchar *list;
+        error_setg(errp, "unknown display mode: width %d, height %d, depth %d",
+                   s->width, s->height, s->depth);
+        list =  macfb_mode_list();
+        error_append_hint(errp, "Available modes:\n%s", list);
+        g_free(list);
+
         return false;
     }
 
@@ -493,6 +609,7 @@ static bool macfb_common_realize(DeviceState *dev, MacfbState *s, Error **errp)
     s->vram_bit_mask = MACFB_VRAM_SIZE - 1;
     memory_region_set_coalescing(&s->mem_vram);
 
+    macfb_update_mode(s);
     return true;
 }
 
diff --git a/hw/display/trace-events b/hw/display/trace-events
index 5753421a43..075cd4614c 100644
--- a/hw/display/trace-events
+++ b/hw/display/trace-events
@@ -173,3 +173,4 @@ macfb_ctrl_read(uint64_t addr, uint64_t value, unsigned int size) "addr 0x%"PRIx
 macfb_ctrl_write(uint64_t addr, uint64_t value, unsigned int size) "addr 0x%"PRIx64 " value 0x%"PRIx64 " size %d"
 macfb_sense_read(uint32_t value) "video sense: 0x%"PRIx32
 macfb_sense_write(uint32_t value) "video sense: 0x%"PRIx32
+macfb_update_mode(uint32_t width, uint32_t height, uint8_t depth) "setting mode to width %"PRId32 " height %"PRId32 " size %d"
diff --git a/hw/m68k/q800.c b/hw/m68k/q800.c
index 5223b880bc..df3fd3711e 100644
--- a/hw/m68k/q800.c
+++ b/hw/m68k/q800.c
@@ -74,7 +74,7 @@
  * is needed by the kernel to have early display and
  * thus provided by the bootloader
  */
-#define VIDEO_BASE            0xf9001000
+#define VIDEO_BASE            0xf9000000
 
 #define MAC_CLOCK  3686418
 
@@ -221,6 +221,7 @@ static void q800_init(MachineState *machine)
     uint8_t *prom;
     const int io_slice_nb = (IO_SIZE / IO_SLICE) - 1;
     int i, checksum;
+    MacFbMode *macfb_mode;
     ram_addr_t ram_size = machine->ram_size;
     const char *kernel_filename = machine->kernel_filename;
     const char *initrd_filename = machine->initrd_filename;
@@ -428,6 +429,8 @@ static void q800_init(MachineState *machine)
     }
     qdev_realize_and_unref(dev, BUS(nubus), &error_fatal);
 
+    macfb_mode = (NUBUS_MACFB(dev)->macfb).mode;
+
     cs = CPU(cpu);
     if (linux_boot) {
         uint64_t high;
@@ -450,12 +453,12 @@ static void q800_init(MachineState *machine)
         BOOTINFO1(cs->as, parameters_base,
                   BI_MAC_MEMSIZE, ram_size >> 20); /* in MB */
         BOOTINFO2(cs->as, parameters_base, BI_MEMCHUNK, 0, ram_size);
-        BOOTINFO1(cs->as, parameters_base, BI_MAC_VADDR, VIDEO_BASE);
+        BOOTINFO1(cs->as, parameters_base, BI_MAC_VADDR,
+                  VIDEO_BASE + macfb_mode->offset);
         BOOTINFO1(cs->as, parameters_base, BI_MAC_VDEPTH, graphic_depth);
         BOOTINFO1(cs->as, parameters_base, BI_MAC_VDIM,
                   (graphic_height << 16) | graphic_width);
-        BOOTINFO1(cs->as, parameters_base, BI_MAC_VROW,
-                  (graphic_width * graphic_depth + 7) / 8);
+        BOOTINFO1(cs->as, parameters_base, BI_MAC_VROW, macfb_mode->stride);
         BOOTINFO1(cs->as, parameters_base, BI_MAC_SCCBASE, SCC_BASE);
 
         rom = g_malloc(sizeof(*rom));
diff --git a/include/hw/display/macfb.h b/include/hw/display/macfb.h
index e95a97ebdc..0aff0d84d2 100644
--- a/include/hw/display/macfb.h
+++ b/include/hw/display/macfb.h
@@ -35,6 +35,19 @@ typedef enum  {
     MACFB_DISPLAY_SVGA = 14,
 } MacfbDisplayType;
 
+typedef struct MacFbMode {
+    uint8_t type;
+    uint8_t depth;
+    uint32_t mode_ctrl1;
+    uint32_t mode_ctrl2;
+    uint32_t width;
+    uint32_t height;
+    uint32_t stride;
+    uint32_t offset;
+} MacFbMode;
+
+#define MACFB_NUM_REGS      8
+
 typedef struct MacfbState {
     MemoryRegion mem_vram;
     MemoryRegion mem_ctrl;
@@ -48,7 +61,8 @@ typedef struct MacfbState {
     uint8_t depth;
     uint8_t type;
 
-    uint32_t sense;
+    uint32_t regs[MACFB_NUM_REGS];
+    MacFbMode *mode;
 } MacfbState;
 
 #define TYPE_MACFB "sysbus-macfb"
-- 
2.20.1


