Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2980C47D976
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Dec 2021 23:59:32 +0100 (CET)
Received: from localhost ([::1]:60240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0Aa3-0004Q8-0A
	for lists+qemu-devel@lfdr.de; Wed, 22 Dec 2021 17:59:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dpetroff@gmail.com>)
 id 1n0AWv-0002Hr-Ol
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 17:56:20 -0500
Received: from [2a00:1450:4864:20::52f] (port=43827
 helo=mail-ed1-x52f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dpetroff@gmail.com>)
 id 1n0AWr-0002Q0-Gi
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 17:56:15 -0500
Received: by mail-ed1-x52f.google.com with SMTP id o20so14164333eds.10
 for <qemu-devel@nongnu.org>; Wed, 22 Dec 2021 14:56:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Xpyd2QrX9R5y5Ib/uEM0qbhGdn+eYDLESu72a+hgXE0=;
 b=aijRAj9Zc8Ozed3KHIR85+piYEsc6p1MO9fVrDmPA00JJ0Qwn9Kf3D+lqYO00nYtzS
 f7/k7Po6Bo2f8Jz6L+OfHxj2WlC3hdPUyoAqf50joLGllz74tlivpIlmb2g5tO7OqBla
 6B1vi6Nzd2pVB/1g3xe//+MHEyYC0nSE0gGAI1jCCr0Sju3qmz93zjwrh81QIRD4z/zj
 raoYWTIi53U/4l6BbPA/O1ZgVHTpnJT0NtkqYMVmTGd0uFq8OaGL51mGoxDB2hBTO75Q
 Xdtr0dZGswNrgtJ5oEJ/bQACg83wxzta0F0qYSrKM2tru+U/K/YpTH2eINYU6tz4uba4
 vX7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Xpyd2QrX9R5y5Ib/uEM0qbhGdn+eYDLESu72a+hgXE0=;
 b=2z1jSdmgyYOYCxM7XGznbkoxCXBSp/FcoydbaF11LIs+pdg8v+Z1gF16d26ybHHn/3
 +s4Z/DHJjpqxY2I54OcAyvJJSf7DfGqzBLkm1VIv/nzS42sP6Kn99cR10hT8vFkLvoAw
 eXiQ8UyitTcr1jUOhx9RStLbymjCrHa0rkIelyeDwbID09+Z3zsXVPZnEbwF3pAQnKxk
 OgyjG0sqfqFfixZ0BYHwJ2CKQjymuyib1mjVmQjrDEI9/fHXq3UTg97KkBR+zoyR/VlF
 cPGcL0TSAnntmZhIFtdh8/Z71k6FDGhVNfUFFwfF8XgB5GN8+skj8Ynxds24NxqgqDu+
 B67A==
X-Gm-Message-State: AOAM531Y/ipHcBUaCdnZMgjGNjQmHghIHd59xp71rDcDWDxoWTRc6xQP
 NnDnfU+SsYE4oIonwoJGEBHNNH2ecbU=
X-Google-Smtp-Source: ABdhPJwo/GTr5ePTuuGGhRkITdNa2PWPperk1+e18ELG3X7MAb5xLA2OnCSS+47V7jdWT07G0NDMkQ==
X-Received: by 2002:a17:907:7b8d:: with SMTP id
 ne13mr4075417ejc.496.1640213768477; 
 Wed, 22 Dec 2021 14:56:08 -0800 (PST)
Received: from owl.kpn ([2a02:a467:f77d:1:deba:f393:276b:fad2])
 by smtp.gmail.com with ESMTPSA id gv11sm1097226ejc.135.2021.12.22.14.56.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Dec 2021 14:56:07 -0800 (PST)
From: Dmitry Petrov <dpetroff@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 1/5] ps2: Initial horizontal scroll support
Date: Wed, 22 Dec 2021 23:56:02 +0100
Message-Id: <20211222225606.1359162-2-dpetroff@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211222225606.1359162-1-dpetroff@gmail.com>
References: <20211222225606.1359162-1-dpetroff@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=dpetroff@gmail.com; helo=mail-ed1-x52f.google.com
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
Cc: Dmitry Petrov <dpetroff@gmail.com>
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


