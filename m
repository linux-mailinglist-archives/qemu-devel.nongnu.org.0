Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C06AB488442
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Jan 2022 16:42:19 +0100 (CET)
Received: from localhost ([::1]:49300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6DrF-0000L7-J6
	for lists+qemu-devel@lfdr.de; Sat, 08 Jan 2022 10:42:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dpetroff@gmail.com>)
 id 1n6Dou-0006gj-2d
 for qemu-devel@nongnu.org; Sat, 08 Jan 2022 10:39:52 -0500
Received: from [2a00:1450:4864:20::535] (port=34748
 helo=mail-ed1-x535.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dpetroff@gmail.com>)
 id 1n6Dos-0006oK-FR
 for qemu-devel@nongnu.org; Sat, 08 Jan 2022 10:39:51 -0500
Received: by mail-ed1-x535.google.com with SMTP id u25so34495894edf.1
 for <qemu-devel@nongnu.org>; Sat, 08 Jan 2022 07:39:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=Xpyd2QrX9R5y5Ib/uEM0qbhGdn+eYDLESu72a+hgXE0=;
 b=loiXXuo0otR6f5gMLR4Frh0F2Ix0rS8DDiIzG3SFMMpaYa3Y+teCn/0eLX6gaU30yf
 MNYfozlX4Iqydjw0hcIfqbdExAxMA0emO7prfR6bmgXqeUV1TkVnk8qy5P8Mk3Iklo8C
 NtZndfiPogtvJNzjZPPSWkD6Kju/prJVbgG1RIHK9OQuq8EJWaKBw1slVCFWmBq1/8CR
 rbwTo/j5zc0tq7zsYH4v7fVUmrtiHmIEMjKzh+Fjeh0mDoyz99Ar9ApBq6EqMcIzOUQb
 jjCXbQAJ7btGF8gPtcPSmC/Luf2xmmlqYwRMxiSxNxChfP0lYWso/2TKlCev0zpptE+2
 kIOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Xpyd2QrX9R5y5Ib/uEM0qbhGdn+eYDLESu72a+hgXE0=;
 b=y5tiM2CfBT5oxkM01CaeWlpKXXjRmNlBMudAVsIXNOO0c9KdhRuW7DDIjwFkf3kSBS
 8q3WiABZFvKofd+n03ielkU5A3wOqUuCTyciefv8Y+PYzqFCA6rC5q1qjlLF4hSirA2v
 +ttGbjeHtqwCzk/2zn7TuXCJ56fReWYMF9qspzl79z27iKy8cN1JQc0YXJIDycyCRvcQ
 R+jtq2m3/DsPtb8WS016gdsaK85mjvgORBP9wNMtDDMRQMymvs8B5uaYkd0liBFjri+E
 JwS5nmS/5SEziQozFKlWfWv+LgvQhI9iDly9SIXMfh4ifMrawlpeJBMkIMgWbL61/4uq
 8pyg==
X-Gm-Message-State: AOAM533Sg47gBf9bcXeZEYRlMA2c/OS7Zqt7h6eJF9LGnQxpw2kIwg+r
 AnZXcrdr0+y/yWiymY39GPek0Eyd1x4=
X-Google-Smtp-Source: ABdhPJxFTzyoI3QSjOR+8MoLRn5/eS6Bmu0aBH9UNwlVlk6nflFdaeRExEa7t+/CdZ3KPIXoW5RqnA==
X-Received: by 2002:a17:906:4fd6:: with SMTP id
 i22mr52538225ejw.484.1641656388479; 
 Sat, 08 Jan 2022 07:39:48 -0800 (PST)
Received: from localhost.localdomain ([2a02:a467:f77d:1:78f2:78aa:23a7:b824])
 by smtp.gmail.com with ESMTPSA id
 24sm599840ejg.47.2022.01.08.07.39.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Jan 2022 07:39:48 -0800 (PST)
From: Dmitry Petrov <dpetroff@gmail.com>
To: qemu-devel@nongnu.org,
	dpetroff@gmail.com
Subject: [PATCH v4 1/5] ps2: Initial horizontal scroll support
Date: Sat,  8 Jan 2022 16:39:43 +0100
Message-Id: <20220108153947.171861-2-dpetroff@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220108153947.171861-1-dpetroff@gmail.com>
References: <20220108153947.171861-1-dpetroff@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::535
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=dpetroff@gmail.com; helo=mail-ed1-x535.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

This change adds support for horizontal scroll to ps/2 mouse device
code. The code is implemented to match the logic of linux kernel
which is used as a reference.

Signed-off-by: Dmitry Petrov <dpetroff@gmail.com>
---
 hw/input/ps2.c | 57 +++++++++++++++++++++++++++++++++++++++++++-------
 qapi/ui.json   |  2 +-
 2 files changed, 50 insertions(+), 9 deletions(-)

diff --git a/hw/input/ps2.c b/hw/input/ps2.c
index 9376a8f4ce..6236711e1b 100644
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
@@ -747,13 +752,41 @@ static int ps2_mouse_send_packet(PS2MouseState *s)
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
+            if (dw1 > 31) {
+                dw1 = 31;
+            } else if (dw1 < -31) {
+                dw1 = -31;
+            }
+
+            /*
+             * linux kernel expects first 6 bits to represent the value
+             * for horizontal scroll
+             */
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
@@ -764,7 +797,6 @@ static int ps2_mouse_send_packet(PS2MouseState *s)
     /* update deltas */
     s->mouse_dx -= dx1;
     s->mouse_dy -= dy1;
-    s->mouse_dz -= dz1;
 
     return 1;
 }
@@ -806,6 +838,12 @@ static void ps2_mouse_event(DeviceState *dev, QemuConsole *src,
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
@@ -833,8 +871,10 @@ static void ps2_mouse_sync(DeviceState *dev)
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
@@ -1036,6 +1076,7 @@ static void ps2_mouse_reset(void *opaque)
     s->mouse_dx = 0;
     s->mouse_dy = 0;
     s->mouse_dz = 0;
+    s->mouse_dw = 0;
     s->mouse_buttons = 0;
 }
 
diff --git a/qapi/ui.json b/qapi/ui.json
index 2b4371da37..9354f4c467 100644
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
-- 
2.32.0


