Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D630426A28
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Oct 2021 13:51:30 +0200 (CEST)
Received: from localhost ([::1]:54702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYoPR-0003EC-8j
	for lists+qemu-devel@lfdr.de; Fri, 08 Oct 2021 07:51:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mYoJn-0006Lv-NV
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 07:45:39 -0400
Received: from mout.kundenserver.de ([212.227.126.134]:57365)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mYoJb-0006yy-Vr
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 07:45:37 -0400
Received: from quad ([82.142.3.114]) by mrelayeu.kundenserver.de (mreue011
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MHXSD-1mUfS60wcL-00DWVv; Fri, 08
 Oct 2021 13:45:23 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 07/13] macfb: implement mode sense to allow display type to be
 detected
Date: Fri,  8 Oct 2021 13:45:12 +0200
Message-Id: <20211008114518.757615-8-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211008114518.757615-1-laurent@vivier.eu>
References: <20211008114518.757615-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:DJw3w7G8u4yZR6E2YDxIn2sqKos4lWSSFP78yyZwkeREytUQTNm
 DUp+pfsR8JC/wzb/cFLaOcf/gGFl2sNfSLcZ/kYqUoGggeud0mR5Qwr7YRAMjIgdn4Mzkq9
 P1k5veG3GoY8WT1hESsEOJ+EK8XesUeMRfSoS4vogcwc7hX4nEuFTyvbZFilAU+Er/8vYDb
 zG06U+mq5UcMOzQJtc22w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:6JCrKgzlO9g=:AqK6dQesI6KCforDNNLxpj
 hL0CggQqsGEzL0iuwQegQCpdgUmL+upgWtZu2C+rgEVw0tYHR8IB4uzYMciNuYlfaxHFjM4n5
 syxRiN39nYp2hfED+cDQSQiI8YBfCOiRxlHN7Drg8ZbIuRhjMylHDJTnMhsCvaQ//j9pdXvO2
 WVH6wV87vcgvNcOEKG1j2Czu1uSToC2xQoCaycdiNj1UwIVO9zdFIH8TToSod86u6zd1g/K4h
 4kpIhHlCvKrcp9tgs1Gosm+RPJFH4yjaopodrr2wAIsEfcRGQ/tXH5kttJb+FunBHwvRQPJv3
 OD+zKxek1mvCWF+nl+maTdU8aFdMMZ+jkIpxvapxrEwQVVT14Plm/cppY4YWjNBJKwA4QM6Hb
 8twPjbgrcdpeLsMLWw6woGTdpfq93I+Q/BuK/La7BMap7p9Opu8OpjEIiYVVaXvSVqet2grYP
 BpRsGxlYozWL9W5AoHvQ0cRm2EadtW7KwwHFnOaamIoDJQM527GQJxx9NehvoxK1wkWztByz9
 ccESKiLL4oJQLj/5qHJ/CAj3bPGyQD+aVXIhCMpU+qci6RrgEg05K+yID/6IslF4Dtstny597
 3XOeUlVjyi6AkO7yYhQmaIHnqd97xYlpi8zqYt0AD18KrfR+xAcCnP4OFpMf66uwsyqg2fJSG
 ExGCbbjGhP54ghYhtFsR4SNhxZ3Xb/Jg6HsrR6PPS/so+P5SYNtTqhO8rBMNFZ0NNN26bgBV9
 bC2aNTK7CK9iFr57y1atJO5hZIgu9liC5wegFQ==
Received-SPF: none client-ip=212.227.126.134; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

The MacOS toolbox ROM uses the monitor sense to detect the display type and then
offer a fixed set of resolutions and colour depths accordingly. Implement the
monitor sense using information found in Apple Technical Note HW26: "Macintosh
Quadra Built-In Video" along with some local experiments.

Since the default configuration is 640 x 480 with 8-bit colour then hardcode
the sense register to return MACFB_DISPLAY_VGA for now.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20211007221253.29024-8-mark.cave-ayland@ilande.co.uk>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 include/hw/display/macfb.h |  20 +++++++
 hw/display/macfb.c         | 117 ++++++++++++++++++++++++++++++++++++-
 hw/display/trace-events    |   2 +
 3 files changed, 137 insertions(+), 2 deletions(-)

diff --git a/include/hw/display/macfb.h b/include/hw/display/macfb.h
index 80806b0306a9..febf4ce0e843 100644
--- a/include/hw/display/macfb.h
+++ b/include/hw/display/macfb.h
@@ -17,6 +17,24 @@
 #include "ui/console.h"
 #include "qom/object.h"
 
+typedef enum  {
+    MACFB_DISPLAY_APPLE_21_COLOR = 0,
+    MACFB_DISPLAY_APPLE_PORTRAIT = 1,
+    MACFB_DISPLAY_APPLE_12_RGB = 2,
+    MACFB_DISPLAY_APPLE_2PAGE_MONO = 3,
+    MACFB_DISPLAY_NTSC_UNDERSCAN = 4,
+    MACFB_DISPLAY_NTSC_OVERSCAN = 5,
+    MACFB_DISPLAY_APPLE_12_MONO = 6,
+    MACFB_DISPLAY_APPLE_13_RGB = 7,
+    MACFB_DISPLAY_16_COLOR = 8,
+    MACFB_DISPLAY_PAL1_UNDERSCAN = 9,
+    MACFB_DISPLAY_PAL1_OVERSCAN = 10,
+    MACFB_DISPLAY_PAL2_UNDERSCAN = 11,
+    MACFB_DISPLAY_PAL2_OVERSCAN = 12,
+    MACFB_DISPLAY_VGA = 13,
+    MACFB_DISPLAY_SVGA = 14,
+} MacfbDisplayType;
+
 typedef struct MacfbState {
     MemoryRegion mem_vram;
     MemoryRegion mem_ctrl;
@@ -28,6 +46,8 @@ typedef struct MacfbState {
     uint8_t color_palette[256 * 3];
     uint32_t width, height; /* in pixels */
     uint8_t depth;
+
+    uint32_t sense;
 } MacfbState;
 
 #define TYPE_MACFB "sysbus-macfb"
diff --git a/hw/display/macfb.c b/hw/display/macfb.c
index 1128a51c9836..6e485d7aef90 100644
--- a/hw/display/macfb.c
+++ b/hw/display/macfb.c
@@ -28,8 +28,66 @@
 #define MACFB_PAGE_SIZE 4096
 #define MACFB_VRAM_SIZE (4 * MiB)
 
-#define DAFB_RESET      0x200
-#define DAFB_LUT        0x213
+#define DAFB_MODE_SENSE     0x1c
+#define DAFB_RESET          0x200
+#define DAFB_LUT            0x213
+
+
+/*
+ * Quadra sense codes taken from Apple Technical Note HW26:
+ * "Macintosh Quadra Built-In Video". The sense codes and
+ * extended sense codes have different meanings:
+ *
+ * Sense:
+ *    bit 2: SENSE2 (pin 10)
+ *    bit 1: SENSE1 (pin 7)
+ *    bit 0: SENSE0 (pin 4)
+ *
+ * 0 = pin tied to ground
+ * 1 = pin unconnected
+ *
+ * Extended Sense:
+ *    bit 2: pins 4-10
+ *    bit 1: pins 10-7
+ *    bit 0: pins 7-4
+ *
+ * 0 = pins tied together
+ * 1 = pins unconnected
+ *
+ * Reads from the sense register appear to be active low, i.e. a 1 indicates
+ * that the pin is tied to ground, a 0 indicates the pin is disconnected.
+ *
+ * Writes to the sense register appear to activate pulldowns i.e. a 1 enables
+ * a pulldown on a particular pin.
+ *
+ * The MacOS toolbox appears to use a series of reads and writes to first
+ * determine if extended sense is to be used, and then check which pins are
+ * tied together in order to determine the display type.
+ */
+
+typedef struct MacFbSense {
+    uint8_t type;
+    uint8_t sense;
+    uint8_t ext_sense;
+} MacFbSense;
+
+static MacFbSense macfb_sense_table[] = {
+    { MACFB_DISPLAY_APPLE_21_COLOR, 0x0, 0 },
+    { MACFB_DISPLAY_APPLE_PORTRAIT, 0x1, 0 },
+    { MACFB_DISPLAY_APPLE_12_RGB, 0x2, 0 },
+    { MACFB_DISPLAY_APPLE_2PAGE_MONO, 0x3, 0 },
+    { MACFB_DISPLAY_NTSC_UNDERSCAN, 0x4, 0 },
+    { MACFB_DISPLAY_NTSC_OVERSCAN, 0x4, 0 },
+    { MACFB_DISPLAY_APPLE_12_MONO, 0x6, 0 },
+    { MACFB_DISPLAY_APPLE_13_RGB, 0x6, 0 },
+    { MACFB_DISPLAY_16_COLOR, 0x7, 0x3 },
+    { MACFB_DISPLAY_PAL1_UNDERSCAN, 0x7, 0x0 },
+    { MACFB_DISPLAY_PAL1_OVERSCAN, 0x7, 0x0 },
+    { MACFB_DISPLAY_PAL2_UNDERSCAN, 0x7, 0x6 },
+    { MACFB_DISPLAY_PAL2_OVERSCAN, 0x7, 0x6 },
+    { MACFB_DISPLAY_VGA, 0x7, 0x5 },
+    { MACFB_DISPLAY_SVGA, 0x7, 0x5 },
+};
 
 
 typedef void macfb_draw_line_func(MacfbState *s, uint8_t *d, uint32_t addr,
@@ -253,6 +311,50 @@ static void macfb_invalidate_display(void *opaque)
     memory_region_set_dirty(&s->mem_vram, 0, MACFB_VRAM_SIZE);
 }
 
+static uint32_t macfb_sense_read(MacfbState *s)
+{
+    MacFbSense *macfb_sense;
+    uint8_t sense;
+
+    macfb_sense = &macfb_sense_table[MACFB_DISPLAY_VGA];
+    if (macfb_sense->sense == 0x7) {
+        /* Extended sense */
+        sense = 0;
+        if (!(macfb_sense->ext_sense & 1)) {
+            /* Pins 7-4 together */
+            if (~s->sense & 3) {
+                sense = (~s->sense & 7) | 3;
+            }
+        }
+        if (!(macfb_sense->ext_sense & 2)) {
+            /* Pins 10-7 together */
+            if (~s->sense & 6) {
+                sense = (~s->sense & 7) | 6;
+            }
+        }
+        if (!(macfb_sense->ext_sense & 4)) {
+            /* Pins 4-10 together */
+            if (~s->sense & 5) {
+                sense = (~s->sense & 7) | 5;
+            }
+        }
+    } else {
+        /* Normal sense */
+        sense = (~macfb_sense->sense & 7) | (~s->sense & 7);
+    }
+
+    trace_macfb_sense_read(sense);
+    return sense;
+}
+
+static void macfb_sense_write(MacfbState *s, uint32_t val)
+{
+    s->sense = val;
+
+    trace_macfb_sense_write(val);
+    return;
+}
+
 static void macfb_update_display(void *opaque)
 {
     MacfbState *s = opaque;
@@ -290,8 +392,15 @@ static uint64_t macfb_ctrl_read(void *opaque,
                                 hwaddr addr,
                                 unsigned int size)
 {
+    MacfbState *s = opaque;
     uint64_t val = 0;
 
+    switch (addr) {
+    case DAFB_MODE_SENSE:
+        val = macfb_sense_read(s);
+        break;
+    }
+
     trace_macfb_ctrl_read(addr, val, size);
     return val;
 }
@@ -303,6 +412,9 @@ static void macfb_ctrl_write(void *opaque,
 {
     MacfbState *s = opaque;
     switch (addr) {
+    case DAFB_MODE_SENSE:
+        macfb_sense_write(s, val);
+        break;
     case DAFB_RESET:
         s->palette_current = 0;
         break;
@@ -342,6 +454,7 @@ static const VMStateDescription vmstate_macfb = {
     .fields = (VMStateField[]) {
         VMSTATE_UINT8_ARRAY(color_palette, MacfbState, 256 * 3),
         VMSTATE_UINT32(palette_current, MacfbState),
+        VMSTATE_UINT32(sense, MacfbState),
         VMSTATE_END_OF_LIST()
     }
 };
diff --git a/hw/display/trace-events b/hw/display/trace-events
index f227de1bb96b..30cb460e4d1b 100644
--- a/hw/display/trace-events
+++ b/hw/display/trace-events
@@ -171,3 +171,5 @@ sm501_2d_engine_write(uint32_t addr, uint32_t val) "addr=0x%x, val=0x%x"
 # macfb.c
 macfb_ctrl_read(uint64_t addr, uint64_t value, unsigned int size) "addr 0x%"PRIx64 " value 0x%"PRIx64 " size %u"
 macfb_ctrl_write(uint64_t addr, uint64_t value, unsigned int size) "addr 0x%"PRIx64 " value 0x%"PRIx64 " size %u"
+macfb_sense_read(uint32_t value) "video sense: 0x%"PRIx32
+macfb_sense_write(uint32_t value) "video sense: 0x%"PRIx32
-- 
2.31.1


