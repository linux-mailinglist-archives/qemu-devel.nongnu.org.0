Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 156176E10F4
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Apr 2023 17:21:27 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmykG-00065m-0n; Thu, 13 Apr 2023 11:20:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <slp@redhat.com>) id 1pmykD-00065M-OF
 for qemu-devel@nongnu.org; Thu, 13 Apr 2023 11:20:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <slp@redhat.com>) id 1pmykB-0008Cl-6f
 for qemu-devel@nongnu.org; Thu, 13 Apr 2023 11:20:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681399214;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MA/BQcbbAclo0q+YU9wdPYIrpdqh4HNJRJmcJur6uBM=;
 b=Amuk+TJeYnodyNGLPgxF0DAybFSwxXN7Vgoaf7Jjg3i8AiH5axwhtm8OPQVL0PNcq2X+qI
 7BKX5/Yb+95bXrMtvRgkv9rxw8j2mhqA2gDW4rIw4tAHSC4Wj9aY2CeM1PzuZ/M9R3q+fj
 gjopumaEVnwjqtjOhUe68Olj+OCAOvc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-217-4BUI374GPRS8luhtzfXlAA-1; Thu, 13 Apr 2023 11:20:11 -0400
X-MC-Unique: 4BUI374GPRS8luhtzfXlAA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BF5623822DF3;
 Thu, 13 Apr 2023 15:20:10 +0000 (UTC)
Received: from toolbox.redhat.com (unknown [10.33.36.16])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A5F51C16028;
 Thu, 13 Apr 2023 15:20:08 +0000 (UTC)
From: Sergio Lopez <slp@redhat.com>
To: qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Eric Blake <eblake@redhat.com>, Sergio Lopez <slp@redhat.com>
Subject: [PATCH v3 6/6] ui/gtk: enable backend to send multi-touch events
Date: Thu, 13 Apr 2023 17:21:20 +0200
Message-Id: <20230413152120.53967-7-slp@redhat.com>
In-Reply-To: <20230413152120.53967-1-slp@redhat.com>
References: <20230413152120.53967-1-slp@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=slp@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

GTK3 provides the infrastructure to receive and process multi-touch
events through the "touch-event" signal and the GdkEventTouch type.
Make use of it to transpose events from the host to the guest.

This allows users of machines with hardware capable of receiving
multi-touch events to run guests that can also receive those events
and interpret them as gestures, when appropriate.

An example of this in action can be seen here:

 https://fosstodon.org/@slp/109545849296546767

Signed-off-by: Sergio Lopez <slp@redhat.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 ui/gtk.c | 92 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 92 insertions(+)

diff --git a/ui/gtk.c b/ui/gtk.c
index f16e0f8dee..b3e6443943 100644
--- a/ui/gtk.c
+++ b/ui/gtk.c
@@ -130,6 +130,13 @@ typedef struct VCChardev VCChardev;
 DECLARE_INSTANCE_CHECKER(VCChardev, VC_CHARDEV,
                          TYPE_CHARDEV_VC)
 
+struct touch_slot {
+    int x;
+    int y;
+    int tracking_id;
+};
+static struct touch_slot touch_slots[INPUT_EVENT_SLOTS_MAX];
+
 bool gtk_use_gl_area;
 
 static void gd_grab_pointer(VirtualConsole *vc, const char *reason);
@@ -1059,6 +1066,82 @@ static gboolean gd_scroll_event(GtkWidget *widget, GdkEventScroll *scroll,
 }
 
 
+static gboolean gd_touch_event(GtkWidget *widget, GdkEventTouch *touch,
+                               void *opaque)
+{
+    VirtualConsole *vc = opaque;
+    struct touch_slot *slot;
+    uint64_t num_slot = GPOINTER_TO_UINT(touch->sequence);
+    bool needs_sync = false;
+    int update;
+    int type = -1;
+    int i;
+
+    if (num_slot >= INPUT_EVENT_SLOTS_MAX) {
+        warn_report("gtk: unexpected touch slot number: %ld >= %d\n",
+                    num_slot, INPUT_EVENT_SLOTS_MAX);
+        return FALSE;
+    }
+
+    slot = &touch_slots[num_slot];
+    slot->x = touch->x;
+    slot->y = touch->y;
+
+    switch (touch->type) {
+    case GDK_TOUCH_BEGIN:
+        type = INPUT_MULTITOUCH_TYPE_BEGIN;
+        slot->tracking_id = num_slot;
+        break;
+    case GDK_TOUCH_UPDATE:
+        type = INPUT_MULTITOUCH_TYPE_UPDATE;
+        break;
+    case GDK_TOUCH_END:
+    case GDK_TOUCH_CANCEL:
+        type = INPUT_MULTITOUCH_TYPE_END;
+        break;
+    default:
+        warn_report("gtk: unexpected touch event type\n");
+    }
+
+    for (i = 0; i < INPUT_EVENT_SLOTS_MAX; ++i) {
+        if (i == num_slot) {
+            update = type;
+        } else {
+            update = INPUT_MULTITOUCH_TYPE_UPDATE;
+        }
+
+        slot = &touch_slots[i];
+
+        if (slot->tracking_id == -1) {
+            continue;
+        }
+
+        if (update == INPUT_MULTITOUCH_TYPE_END) {
+            slot->tracking_id = -1;
+            qemu_input_queue_mtt(vc->gfx.dcl.con, update, i, slot->tracking_id);
+            needs_sync = true;
+        } else {
+            qemu_input_queue_mtt(vc->gfx.dcl.con, update, i, slot->tracking_id);
+            qemu_input_queue_btn(vc->gfx.dcl.con, INPUT_BUTTON_TOUCH, true);
+            qemu_input_queue_mtt_abs(vc->gfx.dcl.con,
+                                     INPUT_AXIS_X, (int) slot->x,
+                                     0, surface_width(vc->gfx.ds),
+                                     i, slot->tracking_id);
+            qemu_input_queue_mtt_abs(vc->gfx.dcl.con,
+                                     INPUT_AXIS_Y, (int) slot->y,
+                                     0, surface_height(vc->gfx.ds),
+                                     i, slot->tracking_id);
+            needs_sync = true;
+        }
+    }
+
+    if (needs_sync) {
+        qemu_input_event_sync();
+    }
+
+    return TRUE;
+}
+
 static const guint16 *gd_get_keymap(size_t *maplen)
 {
     GdkDisplay *dpy = gdk_display_get_default();
@@ -1980,6 +2063,8 @@ static void gd_connect_vc_gfx_signals(VirtualConsole *vc)
                          G_CALLBACK(gd_key_event), vc);
         g_signal_connect(vc->gfx.drawing_area, "key-release-event",
                          G_CALLBACK(gd_key_event), vc);
+        g_signal_connect(vc->gfx.drawing_area, "touch-event",
+                         G_CALLBACK(gd_touch_event), vc);
 
         g_signal_connect(vc->gfx.drawing_area, "enter-notify-event",
                          G_CALLBACK(gd_enter_event), vc);
@@ -2089,6 +2174,7 @@ static GSList *gd_vc_gfx_init(GtkDisplayState *s, VirtualConsole *vc,
                               GSList *group, GtkWidget *view_menu)
 {
     bool zoom_to_fit = false;
+    int i;
 
     vc->label = qemu_console_get_label(con);
     vc->s = s;
@@ -2136,6 +2222,7 @@ static GSList *gd_vc_gfx_init(GtkDisplayState *s, VirtualConsole *vc,
                           GDK_BUTTON_PRESS_MASK |
                           GDK_BUTTON_RELEASE_MASK |
                           GDK_BUTTON_MOTION_MASK |
+                          GDK_TOUCH_MASK |
                           GDK_ENTER_NOTIFY_MASK |
                           GDK_LEAVE_NOTIFY_MASK |
                           GDK_SCROLL_MASK |
@@ -2171,6 +2258,11 @@ static GSList *gd_vc_gfx_init(GtkDisplayState *s, VirtualConsole *vc,
         s->free_scale = true;
     }
 
+    for (i = 0; i < INPUT_EVENT_SLOTS_MAX; i++) {
+        struct touch_slot *slot = &touch_slots[i];
+        slot->tracking_id = -1;
+    }
+
     return group;
 }
 
-- 
2.38.1


