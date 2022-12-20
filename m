Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 270AD651D0A
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Dec 2022 10:19:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7YaU-0000Zm-IP; Tue, 20 Dec 2022 04:07:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p7YaO-0000WC-EG
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 04:06:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p7YaK-0006TA-JH
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 04:06:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671527212;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LwGIEFCb9AsgR92Pq+1Qw8kosu4BV9r5IBmwYpSmV5Y=;
 b=EOjwwX8H8m7wQMeVXjhXP4Eabnru4tIAKSrlfGhDFMjN7hoB97l584U6r3THzWxnwJLY+c
 AV3PxkjnG+KBDctd+pFf2wcbUGsEFj4yppW3RpQr0+X/AJSBfi8D9pg+BEtf40+OBP63Pl
 zTLAMui4EWbh+zE+UfgbG0BPlaB+r0o=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-256-3ltptZUGNX2k4M4Tt1T_vw-1; Tue, 20 Dec 2022 04:06:48 -0500
X-MC-Unique: 3ltptZUGNX2k4M4Tt1T_vw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1CD2085C06A;
 Tue, 20 Dec 2022 09:06:48 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.195.91])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C8E0B40C2064;
 Tue, 20 Dec 2022 09:06:47 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 8F90721E6821; Tue, 20 Dec 2022 10:06:45 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: kraxel@redhat.com, dgilbert@redhat.com, berrange@redhat.com,
 philmd@linaro.org
Subject: [PATCH v3 12/18] ui: Move more HMP commands from monitor to ui/
Date: Tue, 20 Dec 2022 10:06:39 +0100
Message-Id: <20221220090645.2844881-13-armbru@redhat.com>
In-Reply-To: <20221220090645.2844881-1-armbru@redhat.com>
References: <20221220090645.2844881-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
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

This moves these commands from MAINTAINERS section "Human
Monitor (HMP)" to "Graphics".

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 include/monitor/hmp.h |  2 ++
 monitor/misc.c        | 66 -------------------------------------------
 ui/ui-hmp-cmds.c      | 66 +++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 68 insertions(+), 66 deletions(-)

diff --git a/include/monitor/hmp.h b/include/monitor/hmp.h
index 27f86399f7..b228a406f3 100644
--- a/include/monitor/hmp.h
+++ b/include/monitor/hmp.h
@@ -81,6 +81,8 @@ void hmp_netdev_add(Monitor *mon, const QDict *qdict);
 void hmp_netdev_del(Monitor *mon, const QDict *qdict);
 void hmp_getfd(Monitor *mon, const QDict *qdict);
 void hmp_closefd(Monitor *mon, const QDict *qdict);
+void hmp_mouse_move(Monitor *mon, const QDict *qdict);
+void hmp_mouse_button(Monitor *mon, const QDict *qdict);
 void hmp_sendkey(Monitor *mon, const QDict *qdict);
 void coroutine_fn hmp_screendump(Monitor *mon, const QDict *qdict);
 void hmp_chardev_add(Monitor *mon, const QDict *qdict);
diff --git a/monitor/misc.c b/monitor/misc.c
index bf3f1c67ca..3d68940d28 100644
--- a/monitor/misc.c
+++ b/monitor/misc.c
@@ -34,7 +34,6 @@
 #include "qemu/config-file.h"
 #include "qemu/ctype.h"
 #include "ui/console.h"
-#include "ui/input.h"
 #include "audio/audio.h"
 #include "disas/disas.h"
 #include "qemu/timer.h"
@@ -825,49 +824,6 @@ static void hmp_sum(Monitor *mon, const QDict *qdict)
     monitor_printf(mon, "%05d\n", sum);
 }
 
-static int mouse_button_state;
-
-static void hmp_mouse_move(Monitor *mon, const QDict *qdict)
-{
-    int dx, dy, dz, button;
-    const char *dx_str = qdict_get_str(qdict, "dx_str");
-    const char *dy_str = qdict_get_str(qdict, "dy_str");
-    const char *dz_str = qdict_get_try_str(qdict, "dz_str");
-
-    dx = strtol(dx_str, NULL, 0);
-    dy = strtol(dy_str, NULL, 0);
-    qemu_input_queue_rel(NULL, INPUT_AXIS_X, dx);
-    qemu_input_queue_rel(NULL, INPUT_AXIS_Y, dy);
-
-    if (dz_str) {
-        dz = strtol(dz_str, NULL, 0);
-        if (dz != 0) {
-            button = (dz > 0) ? INPUT_BUTTON_WHEEL_UP : INPUT_BUTTON_WHEEL_DOWN;
-            qemu_input_queue_btn(NULL, button, true);
-            qemu_input_event_sync();
-            qemu_input_queue_btn(NULL, button, false);
-        }
-    }
-    qemu_input_event_sync();
-}
-
-static void hmp_mouse_button(Monitor *mon, const QDict *qdict)
-{
-    static uint32_t bmap[INPUT_BUTTON__MAX] = {
-        [INPUT_BUTTON_LEFT]       = MOUSE_EVENT_LBUTTON,
-        [INPUT_BUTTON_MIDDLE]     = MOUSE_EVENT_MBUTTON,
-        [INPUT_BUTTON_RIGHT]      = MOUSE_EVENT_RBUTTON,
-    };
-    int button_state = qdict_get_int(qdict, "button_state");
-
-    if (mouse_button_state == button_state) {
-        return;
-    }
-    qemu_input_update_buttons(NULL, bmap, mouse_button_state, button_state);
-    qemu_input_event_sync();
-    mouse_button_state = button_state;
-}
-
 static void hmp_ioport_read(Monitor *mon, const QDict *qdict)
 {
     int size = qdict_get_int(qdict, "size");
@@ -1700,28 +1656,6 @@ void object_del_completion(ReadLineState *rs, int nb_args, const char *str)
     qapi_free_ObjectPropertyInfoList(start);
 }
 
-void sendkey_completion(ReadLineState *rs, int nb_args, const char *str)
-{
-    int i;
-    char *sep;
-    size_t len;
-
-    if (nb_args != 2) {
-        return;
-    }
-    sep = strrchr(str, '-');
-    if (sep) {
-        str = sep + 1;
-    }
-    len = strlen(str);
-    readline_set_completion_index(rs, len);
-    for (i = 0; i < Q_KEY_CODE__MAX; i++) {
-        if (!strncmp(str, QKeyCode_str(i), len)) {
-            readline_add_completion(rs, QKeyCode_str(i));
-        }
-    }
-}
-
 void set_link_completion(ReadLineState *rs, int nb_args, const char *str)
 {
     size_t len;
diff --git a/ui/ui-hmp-cmds.c b/ui/ui-hmp-cmds.c
index aecd996968..95abd4693f 100644
--- a/ui/ui-hmp-cmds.c
+++ b/ui/ui-hmp-cmds.c
@@ -23,6 +23,50 @@
 #include "qapi/qmp/qdict.h"
 #include "qemu/cutils.h"
 #include "ui/console.h"
+#include "ui/input.h"
+
+static int mouse_button_state;
+
+void hmp_mouse_move(Monitor *mon, const QDict *qdict)
+{
+    int dx, dy, dz, button;
+    const char *dx_str = qdict_get_str(qdict, "dx_str");
+    const char *dy_str = qdict_get_str(qdict, "dy_str");
+    const char *dz_str = qdict_get_try_str(qdict, "dz_str");
+
+    dx = strtol(dx_str, NULL, 0);
+    dy = strtol(dy_str, NULL, 0);
+    qemu_input_queue_rel(NULL, INPUT_AXIS_X, dx);
+    qemu_input_queue_rel(NULL, INPUT_AXIS_Y, dy);
+
+    if (dz_str) {
+        dz = strtol(dz_str, NULL, 0);
+        if (dz != 0) {
+            button = (dz > 0) ? INPUT_BUTTON_WHEEL_UP : INPUT_BUTTON_WHEEL_DOWN;
+            qemu_input_queue_btn(NULL, button, true);
+            qemu_input_event_sync();
+            qemu_input_queue_btn(NULL, button, false);
+        }
+    }
+    qemu_input_event_sync();
+}
+
+void hmp_mouse_button(Monitor *mon, const QDict *qdict)
+{
+    static uint32_t bmap[INPUT_BUTTON__MAX] = {
+        [INPUT_BUTTON_LEFT]       = MOUSE_EVENT_LBUTTON,
+        [INPUT_BUTTON_MIDDLE]     = MOUSE_EVENT_MBUTTON,
+        [INPUT_BUTTON_RIGHT]      = MOUSE_EVENT_RBUTTON,
+    };
+    int button_state = qdict_get_int(qdict, "button_state");
+
+    if (mouse_button_state == button_state) {
+        return;
+    }
+    qemu_input_update_buttons(NULL, bmap, mouse_button_state, button_state);
+    qemu_input_event_sync();
+    mouse_button_state = button_state;
+}
 
 void hmp_info_mice(Monitor *mon, const QDict *qdict)
 {
@@ -334,6 +378,28 @@ err_out:
     goto out;
 }
 
+void sendkey_completion(ReadLineState *rs, int nb_args, const char *str)
+{
+    int i;
+    char *sep;
+    size_t len;
+
+    if (nb_args != 2) {
+        return;
+    }
+    sep = strrchr(str, '-');
+    if (sep) {
+        str = sep + 1;
+    }
+    len = strlen(str);
+    readline_set_completion_index(rs, len);
+    for (i = 0; i < Q_KEY_CODE__MAX; i++) {
+        if (!strncmp(str, QKeyCode_str(i), len)) {
+            readline_add_completion(rs, QKeyCode_str(i));
+        }
+    }
+}
+
 void coroutine_fn
 hmp_screendump(Monitor *mon, const QDict *qdict)
 {
-- 
2.38.1


