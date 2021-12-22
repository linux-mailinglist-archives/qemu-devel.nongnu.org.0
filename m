Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B14EE47CAC4
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Dec 2021 02:28:53 +0100 (CET)
Received: from localhost ([::1]:51290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzqR2-0008Fh-PD
	for lists+qemu-devel@lfdr.de; Tue, 21 Dec 2021 20:28:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dpetroff@gmail.com>)
 id 1mzq5l-0001vz-Ar
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 20:06:53 -0500
Received: from [2a00:1450:4864:20::52d] (port=40547
 helo=mail-ed1-x52d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dpetroff@gmail.com>)
 id 1mzq5j-0002ao-KY
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 20:06:53 -0500
Received: by mail-ed1-x52d.google.com with SMTP id z29so1968644edl.7
 for <qemu-devel@nongnu.org>; Tue, 21 Dec 2021 17:06:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gQAWcF+SIOV+XPf+u+tXmOp+HTHnx4UVTWBcK32gjxc=;
 b=pYxQl28JHfYP48sx2NxtGYBCAEx+cZcDBFjiBRMAYvm+YOyDXzlUliC/CMyf2C79+5
 qqM9U2+Q7PzUMxD/g8Kfk9uR5xMtjDPpBhupCEJpJ5F7mXQiRPW6wFIJ3wmhYlsGb7NA
 YLUbXhYOHCM0PIALvUHQ63t/MQpqs9htxPCK0gqS4r6I6MGUJFRSIQ+lnZg/j+yzs/qJ
 6q3ucdXiHjGq1muKAGo08BQZov6CvzlXkKMzGMMgYuX4cEMR7reT8kGPrby52+FTFyK4
 IIXWkkscYy7tMOYgBQKW+6icO+mNwNIxBPRbeUaRE7cx5PTqzk2nVMYKclRdtAF4C8wS
 DRBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gQAWcF+SIOV+XPf+u+tXmOp+HTHnx4UVTWBcK32gjxc=;
 b=ngx7+yUD9CB2LL4ANbsu6FBGlGCCKKubGt6aiM808URc0mEeYpCiAMGSTvlXUm/wK6
 CG3cg6su5XlHMXm9Qx/FjYwprmT0y87lTGbQaryQryQUimFqeNDZP4lE5o2TdboY8vVD
 KjVESBma7gtP41CObPOv1oP/6V/fMl/0j2GUO//lJiZz0qteHblR3qc59Z4Gd5U4/HMy
 0/ID7Vzs5BHCJMHUgfP0K6s7xwDisnMyQgizBpnH75cc7f1hJN96DP0CO6craH4LIguJ
 OmZYx2XsV9ZNBoJ4kD/VhxcDvsIc1BtM7uEXWzzKK1VGpFLMhYzHaZRjdiVZVeO1v730
 +NmA==
X-Gm-Message-State: AOAM530or3/kuGB6YrHSIkNGubOdZd/zI/HW5Q8ngOVqNZU4ENNjYtdG
 UfyxHAcOebQOlhcmFvXYBouMyOwx+NU=
X-Google-Smtp-Source: ABdhPJyA25AZvrND9MSlBDPFvSL9zmsvIDittf2ugkRU1BZLjgSYkVUSMzClI/Iav9VsrCe72Ek4Gw==
X-Received: by 2002:a17:907:1b06:: with SMTP id
 mp6mr671849ejc.275.1640135209424; 
 Tue, 21 Dec 2021 17:06:49 -0800 (PST)
Received: from owl.kpn ([2a02:a467:f77d:1:e6fc:be30:e400:3c3])
 by smtp.gmail.com with ESMTPSA id nb20sm125199ejc.25.2021.12.21.17.06.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Dec 2021 17:06:49 -0800 (PST)
From: Dmitry Petrov <dpetroff@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/5] ps2: Initial horizontal scroll support
Date: Wed, 22 Dec 2021 02:06:43 +0100
Message-Id: <20211222010647.1332479-1-dpetroff@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=dpetroff@gmail.com; helo=mail-ed1-x52d.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 21 Dec 2021 20:24:48 -0500
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

v2:
  - Patch is split into a sequence
  - value is clamped to 31 for horizontal scroll

This patch introduces horizontal scroll support for the ps/2
mouse.

The patch is based on the previous work
by Brad Jorsch done in 2010
but never merge, see
https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=579968

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
-- 
2.32.0


