Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EA9347B668
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Dec 2021 01:11:54 +0100 (CET)
Received: from localhost ([::1]:45566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzSkz-0006mH-Ad
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 19:11:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dpetroff@gmail.com>)
 id 1mzSDu-0008F6-HD
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 18:37:44 -0500
Received: from [2a00:1450:4864:20::534] (port=43868
 helo=mail-ed1-x534.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dpetroff@gmail.com>)
 id 1mzSDs-0005X7-Do
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 18:37:42 -0500
Received: by mail-ed1-x534.google.com with SMTP id o20so44683868eds.10
 for <qemu-devel@nongnu.org>; Mon, 20 Dec 2021 15:37:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gl/ZXZS14hycRrxXJFqbwTO2BM86eI0FVtwXBIhubMY=;
 b=lkvieanBqv3BVaOSuAzAXiKRgm6xrmHtBRfMFDZI0vnXkaiuvLE+jCPglSLh138tQs
 BQpVWQJTyBfTjzP0c10fy8Ptag7qvyehvoX2Ztlqk9aqTCyTSn4MM7ResQsMrOL8bXw7
 JuURwjPFzGWqbq/OW0vT0Vz0zsR8hzl+B30zjrxfQMElnoW/TP4WkgNHddgWI4SjtPO4
 tbLvfDSojsLLW3cYxJW+b/ZHSjeORGCsTEGnEkiztGUTSQDgsF0XPnW/Ro9nNa011NqV
 rUYD3UClKS8cO0B+6SOENfpEsMGj/Pi1wIxwGfO8G7rt4RwC6KZYvFlRWAqW3IAFRCGP
 xeUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gl/ZXZS14hycRrxXJFqbwTO2BM86eI0FVtwXBIhubMY=;
 b=K9SHGfQE4A5wnRRfWGCqQkYkOrTPrGvFvBCjZiq4pxIjFetCgukUMwyMZslNTzTi8E
 Gy+61ZgfXKMrfKdDVbTXNoqXakM7uGjanaDrLVLpdAnTpYJMS614ROveEFH/HE+Ga28r
 dDIstkpUl5S5KT7p2BvkNXmrRXENhTclrazgYP8n380CxLcDFzo7DDRB5NtExKeNtdsU
 0RRQ+SgoMgn6a5duxv11jKCgfElED534ze2pYWLdaCq/XxnK7/uDHWBr00lIdmx9G0Ur
 iWZ95Jy/STk+F0r3mIA/bjqF7SN4f22lgE36aFW0Rr6mhcKqkX337fEZ7dF0rx6LDn9b
 Z91g==
X-Gm-Message-State: AOAM5333WH2R6d8LDtccIpNo27rq9TtKxAf2hcGEUYico8/DtU8BPkza
 dyEfiWPuDVVkNehwZmXTDajfFAjvF4g=
X-Google-Smtp-Source: ABdhPJzO5YbiWJpVvfhp4RY3Xm4bfvjWmgnyZJ/iElpu9dgAOK2B2lBX7hBtvsAnnzEk82WWCj52GQ==
X-Received: by 2002:aa7:d957:: with SMTP id l23mr477001eds.116.1640043457871; 
 Mon, 20 Dec 2021 15:37:37 -0800 (PST)
Received: from owl.kpn ([2a02:a467:f77d:1:7257:4bab:f3e5:aafd])
 by smtp.gmail.com with ESMTPSA id u21sm4520042eds.8.2021.12.20.15.37.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Dec 2021 15:37:37 -0800 (PST)
From: Dmitry Petrov <dpetroff@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] ps2: Initial horizontal scroll support
Date: Tue, 21 Dec 2021 00:37:22 +0100
Message-Id: <20211220233722.1262821-1-dpetroff@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::534
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=dpetroff@gmail.com; helo=mail-ed1-x534.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 20 Dec 2021 19:10:40 -0500
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
Cc: Dmitry Petrov <dpetroff@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch introduces horizontal scroll support for the ps/2 mouse.
It includes changes in the ps/2 device driver as well as support
for three display options - cocoa, gtk and sdl, tested and working
on all of them against guest ubuntu system.

The patch is based on the previous work by Brad Jorsch done in 2010
but never merge, see
https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=579968

Signed-off-by: Dmitry Petrov <dpetroff@gmail.com>
---
 hw/input/ps2.c    | 54 ++++++++++++++++++++++++++++++++++++++++-------
 qapi/ui.json      |  2 +-
 ui/cocoa.m        | 18 ++++++++++------
 ui/gtk.c          | 54 ++++++++++++++++++++++++++++++++++++-----------
 ui/input-legacy.c | 16 ++++++++++++++
 ui/sdl2.c         |  5 +++++
 6 files changed, 122 insertions(+), 27 deletions(-)

diff --git a/hw/input/ps2.c b/hw/input/ps2.c
index 9376a8f4ce..9e42284cd9 100644
--- a/hw/input/ps2.c
+++ b/hw/input/ps2.c
@@ -123,6 +123,7 @@ typedef struct {
     int mouse_dx; /* current values, needed for 'poll' mode */
     int mouse_dy;
     int mouse_dz;
+    int mouse_dw;
     uint8_t mouse_buttons;
 } PS2MouseState;
 
@@ -715,7 +716,7 @@ static int ps2_mouse_send_packet(PS2MouseState *s)
     /* IMPS/2 and IMEX send 4 bytes, PS2 sends 3 bytes */
     const int needed = s->mouse_type ? 4 : 3;
     unsigned int b;
-    int dx1, dy1, dz1;
+    int dx1, dy1, dz1, dw1;
 
     if (PS2_QUEUE_SIZE - s->common.queue.count < needed) {
         return 0;
@@ -724,6 +725,7 @@ static int ps2_mouse_send_packet(PS2MouseState *s)
     dx1 = s->mouse_dx;
     dy1 = s->mouse_dy;
     dz1 = s->mouse_dz;
+    dw1 = s->mouse_dw;
     /* XXX: increase range to 8 bits ? */
     if (dx1 > 127)
         dx1 = 127;
@@ -740,6 +742,9 @@ static int ps2_mouse_send_packet(PS2MouseState *s)
     /* extra byte for IMPS/2 or IMEX */
     switch(s->mouse_type) {
     default:
+        /* Just ignore the wheels if not supported */
+        s->mouse_dz = 0;
+        s->mouse_dw = 0;
         break;
     case 3:
         if (dz1 > 127)
@@ -747,13 +752,38 @@ static int ps2_mouse_send_packet(PS2MouseState *s)
         else if (dz1 < -127)
                 dz1 = -127;
         ps2_queue_noirq(&s->common, dz1 & 0xff);
+        s->mouse_dz -= dz1;
+        s->mouse_dw = 0;
         break;
     case 4:
-        if (dz1 > 7)
-            dz1 = 7;
-        else if (dz1 < -7)
-            dz1 = -7;
-        b = (dz1 & 0x0f) | ((s->mouse_buttons & 0x18) << 1);
+        /*
+         * This matches what the Linux kernel expects for exps/2 in
+         * drivers/input/mouse/psmouse-base.c. Note, if you happen to
+         * press/release the 4th or 5th buttons at the same moment as a
+         * horizontal wheel scroll, those button presses will get lost. I'm not
+         * sure what to do about that, since by this point we don't know
+         * whether those buttons actually changed state.
+         */
+        if (dw1 != 0) {
+            if (dw1 > 15) {
+                dw1 = 15;
+            } else if (dw1 < -15) {
+                dw1 = -15;
+            }
+
+            /* 0x3f was found by trial and error vs ubuntu instance */
+            b = (dw1 & 0x3f) | 0x40;
+            s->mouse_dw -= dw1;
+        } else {
+            if (dz1 > 7) {
+                dz1 = 7;
+            } else if (dz1 < -7) {
+                dz1 = -7;
+            }
+
+            b = (dz1 & 0x0f) | ((s->mouse_buttons & 0x18) << 1);
+            s->mouse_dz -= dz1;
+        }
         ps2_queue_noirq(&s->common, b);
         break;
     }
@@ -764,7 +794,6 @@ static int ps2_mouse_send_packet(PS2MouseState *s)
     /* update deltas */
     s->mouse_dx -= dx1;
     s->mouse_dy -= dy1;
-    s->mouse_dz -= dz1;
 
     return 1;
 }
@@ -806,6 +835,12 @@ static void ps2_mouse_event(DeviceState *dev, QemuConsole *src,
             } else if (btn->button == INPUT_BUTTON_WHEEL_DOWN) {
                 s->mouse_dz++;
             }
+
+            if (btn->button == INPUT_BUTTON_WHEEL_RIGHT) {
+                s->mouse_dw--;
+            } else if (btn->button == INPUT_BUTTON_WHEEL_LEFT) {
+                s->mouse_dw++;
+            }
         } else {
             s->mouse_buttons &= ~bmap[btn->button];
         }
@@ -833,8 +868,10 @@ static void ps2_mouse_sync(DeviceState *dev)
         /* if not remote, send event. Multiple events are sent if
            too big deltas */
         while (ps2_mouse_send_packet(s)) {
-            if (s->mouse_dx == 0 && s->mouse_dy == 0 && s->mouse_dz == 0)
+            if (s->mouse_dx == 0 && s->mouse_dy == 0
+                    && s->mouse_dz == 0 && s->mouse_dw == 0) {
                 break;
+            }
         }
     }
 }
@@ -1036,6 +1073,7 @@ static void ps2_mouse_reset(void *opaque)
     s->mouse_dx = 0;
     s->mouse_dy = 0;
     s->mouse_dz = 0;
+    s->mouse_dw = 0;
     s->mouse_buttons = 0;
 }
 
diff --git a/qapi/ui.json b/qapi/ui.json
index d7567ac866..9dac1bf548 100644
--- a/qapi/ui.json
+++ b/qapi/ui.json
@@ -905,7 +905,7 @@
 ##
 { 'enum'  : 'InputButton',
   'data'  : [ 'left', 'middle', 'right', 'wheel-up', 'wheel-down', 'side',
-  'extra' ] }
+  'extra', 'wheel-left', 'wheel-right' ] }
 
 ##
 # @InputAxis:
diff --git a/ui/cocoa.m b/ui/cocoa.m
index 68a6302184..c898a8aeaa 100644
--- a/ui/cocoa.m
+++ b/ui/cocoa.m
@@ -970,21 +970,27 @@ QemuCocoaView *cocoaView;
              */
 
             /*
-             * When deltaY is zero, it means that this scrolling event was
-             * either horizontal, or so fine that it only appears in
-             * scrollingDeltaY. So we drop the event.
+             * We shouldn't have got a scroll event when deltaY and delta Y
+             * are zero, hence no harm in dropping the event
              */
-            if ([event deltaY] != 0) {
+            if ([event deltaY] != 0 || [event deltaX] != 0) {
             /* Determine if this is a scroll up or scroll down event */
-                buttons = ([event deltaY] > 0) ?
+                if ([event deltaY] != 0) {
+                  buttons = ([event deltaY] > 0) ?
                     INPUT_BUTTON_WHEEL_UP : INPUT_BUTTON_WHEEL_DOWN;
+                } else if ([event deltaX] != 0) {
+                  buttons = ([event deltaX] > 0) ?
+                    INPUT_BUTTON_WHEEL_LEFT : INPUT_BUTTON_WHEEL_RIGHT;
+                }
+
                 qemu_input_queue_btn(dcl.con, buttons, true);
                 qemu_input_event_sync();
                 qemu_input_queue_btn(dcl.con, buttons, false);
                 qemu_input_event_sync();
             }
+
             /*
-             * Since deltaY also reports scroll wheel events we prevent mouse
+             * Since deltaY/deltaY also report scroll wheel events we prevent mouse
              * movement code from executing.
              */
             mouse_event = false;
diff --git a/ui/gtk.c b/ui/gtk.c
index 428f02f2df..b52eec6fe9 100644
--- a/ui/gtk.c
+++ b/ui/gtk.c
@@ -963,33 +963,63 @@ static gboolean gd_scroll_event(GtkWidget *widget, GdkEventScroll *scroll,
                                 void *opaque)
 {
     VirtualConsole *vc = opaque;
-    InputButton btn;
+    InputButton btn_vertical;
+    InputButton btn_horizontal;
+    bool has_vertical = false;
+    bool has_horizontal = false;
 
     if (scroll->direction == GDK_SCROLL_UP) {
-        btn = INPUT_BUTTON_WHEEL_UP;
+        btn_vertical = INPUT_BUTTON_WHEEL_UP;
+        has_vertical = true;
     } else if (scroll->direction == GDK_SCROLL_DOWN) {
-        btn = INPUT_BUTTON_WHEEL_DOWN;
+        btn_vertical = INPUT_BUTTON_WHEEL_DOWN;
+        has_vertical = true;
+    } else if (scroll->direction == GDK_SCROLL_LEFT) {
+        btn_horizontal = INPUT_BUTTON_WHEEL_LEFT;
+        has_horizontal = true;
+    } else if (scroll->direction == GDK_SCROLL_RIGHT) {
+        btn_horizontal = INPUT_BUTTON_WHEEL_RIGHT;
+        has_horizontal = true;
     } else if (scroll->direction == GDK_SCROLL_SMOOTH) {
         gdouble delta_x, delta_y;
         if (!gdk_event_get_scroll_deltas((GdkEvent *)scroll,
                                          &delta_x, &delta_y)) {
             return TRUE;
         }
-        if (delta_y == 0) {
-            return TRUE;
-        } else if (delta_y > 0) {
-            btn = INPUT_BUTTON_WHEEL_DOWN;
+
+        if (delta_y > 0) {
+            btn_vertical = INPUT_BUTTON_WHEEL_DOWN;
+            has_vertical = true;
+        } else if (delta_y < 0) {
+            btn_vertical = INPUT_BUTTON_WHEEL_UP;
+            has_vertical = true;
+        } else if (delta_x > 0) {
+            btn_horizontal = INPUT_BUTTON_WHEEL_RIGHT;
+            has_horizontal = true;
+        } else if (delta_x < 0) {
+            btn_horizontal = INPUT_BUTTON_WHEEL_LEFT;
+            has_horizontal = true;
         } else {
-            btn = INPUT_BUTTON_WHEEL_UP;
+            return TRUE;
         }
     } else {
         return TRUE;
     }
 
-    qemu_input_queue_btn(vc->gfx.dcl.con, btn, true);
-    qemu_input_event_sync();
-    qemu_input_queue_btn(vc->gfx.dcl.con, btn, false);
-    qemu_input_event_sync();
+    if (has_vertical) {
+        qemu_input_queue_btn(vc->gfx.dcl.con, btn_vertical, true);
+        qemu_input_event_sync();
+        qemu_input_queue_btn(vc->gfx.dcl.con, btn_vertical, false);
+        qemu_input_event_sync();
+    }
+
+    if (has_horizontal) {
+        qemu_input_queue_btn(vc->gfx.dcl.con, btn_horizontal, true);
+        qemu_input_event_sync();
+        qemu_input_queue_btn(vc->gfx.dcl.con, btn_horizontal, false);
+        qemu_input_event_sync();
+    }
+
     return TRUE;
 }
 
diff --git a/ui/input-legacy.c b/ui/input-legacy.c
index 9fc78a639b..2c9a215d7f 100644
--- a/ui/input-legacy.c
+++ b/ui/input-legacy.c
@@ -23,6 +23,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/log.h"
 #include "qapi/qapi-commands-ui.h"
 #include "ui/console.h"
 #include "keymaps.h"
@@ -179,6 +180,20 @@ static void legacy_mouse_event(DeviceState *dev, QemuConsole *src,
                                     1,
                                     s->buttons);
         }
+        if (btn->down && btn->button == INPUT_BUTTON_WHEEL_RIGHT) {
+            s->qemu_put_mouse_event(s->qemu_put_mouse_event_opaque,
+                                    s->axis[INPUT_AXIS_X],
+                                    s->axis[INPUT_AXIS_Y],
+                                    -2,
+                                    s->buttons);
+        }
+        if (btn->down && btn->button == INPUT_BUTTON_WHEEL_LEFT) {
+            s->qemu_put_mouse_event(s->qemu_put_mouse_event_opaque,
+                                    s->axis[INPUT_AXIS_X],
+                                    s->axis[INPUT_AXIS_Y],
+                                    2,
+                                    s->buttons);
+        }
         break;
     case INPUT_EVENT_KIND_ABS:
         move = evt->u.abs.data;
@@ -216,6 +231,7 @@ QEMUPutMouseEntry *qemu_add_mouse_event_handler(QEMUPutMouseEvent *func,
     QEMUPutMouseEntry *s;
 
     s = g_new0(QEMUPutMouseEntry, 1);
+    qemu_log("qemu_add_mouse_event_handler %s", name);
 
     s->qemu_put_mouse_event = func;
     s->qemu_put_mouse_event_opaque = opaque;
diff --git a/ui/sdl2.c b/ui/sdl2.c
index 17c0ec30eb..19bbc1fdd4 100644
--- a/ui/sdl2.c
+++ b/ui/sdl2.c
@@ -33,6 +33,7 @@
 #include "sysemu/runstate-action.h"
 #include "sysemu/sysemu.h"
 #include "ui/win32-kbd-hook.h"
+#include "qemu/log.h"
 
 static int sdl2_num_outputs;
 static struct sdl2_console *sdl2_console;
@@ -535,6 +536,10 @@ static void handle_mousewheel(SDL_Event *ev)
         btn = INPUT_BUTTON_WHEEL_UP;
     } else if (wev->y < 0) {
         btn = INPUT_BUTTON_WHEEL_DOWN;
+    } else if (wev->x < 0) {
+        btn = INPUT_BUTTON_WHEEL_RIGHT;
+    } else if (wev->x > 0) {
+        btn = INPUT_BUTTON_WHEEL_LEFT;
     } else {
         return;
     }
-- 
2.32.0


