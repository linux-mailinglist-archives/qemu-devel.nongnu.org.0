Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16D2E673A23
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 14:29:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIUxG-0005rn-Ml; Thu, 19 Jan 2023 08:27:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pIUx4-0005qQ-Ja
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 08:27:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pIUx1-0008Cq-Sh
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 08:27:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674134840;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=X8PvGScThlQiFozoB1d+92czy8rP63T4s/aW8kv6IBg=;
 b=Lu04pvRCC9P6G5SkHsNnj15ZFWeXwc8pDmtyvBL5JRVzKUih7NbuvySvV1B4I1OkagA5FD
 DoXOHLVbjCXSGPPqwg2hE6wwXFklf4RoxAyvItwpNVENIkNseKIr5QVMcbIzldeD52vyUH
 yEG2Y/mWZay2ZgP4TlWZysrpMXzbQAA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-515-pIciMTUdMduTzkGRfRCVYg-1; Thu, 19 Jan 2023 08:27:17 -0500
X-MC-Unique: pIciMTUdMduTzkGRfRCVYg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0D5EA3C10EE0;
 Thu, 19 Jan 2023 13:27:17 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DAA38492B11;
 Thu, 19 Jan 2023 13:27:16 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 7285121E5DE0; Thu, 19 Jan 2023 14:27:13 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PULL 16/17] ui: Split hmp_mouse_set() and move the HMP part to ui/
Date: Thu, 19 Jan 2023 14:27:12 +0100
Message-Id: <20230119132713.3493556-17-armbru@redhat.com>
In-Reply-To: <20230119132713.3493556-1-armbru@redhat.com>
References: <20230119132713.3493556-1-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
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

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20230109190321.1056914-17-armbru@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
---
 include/monitor/hmp.h |  1 +
 include/ui/console.h  |  2 +-
 monitor/misc.c        |  1 -
 ui/input.c            | 15 +++++++--------
 ui/ui-hmp-cmds.c      |  8 ++++++++
 5 files changed, 17 insertions(+), 10 deletions(-)

diff --git a/include/monitor/hmp.h b/include/monitor/hmp.h
index df89eac22a..8688769a27 100644
--- a/include/monitor/hmp.h
+++ b/include/monitor/hmp.h
@@ -88,6 +88,7 @@ void hmp_getfd(Monitor *mon, const QDict *qdict);
 void hmp_closefd(Monitor *mon, const QDict *qdict);
 void hmp_mouse_move(Monitor *mon, const QDict *qdict);
 void hmp_mouse_button(Monitor *mon, const QDict *qdict);
+void hmp_mouse_set(Monitor *mon, const QDict *qdict);
 void hmp_sendkey(Monitor *mon, const QDict *qdict);
 void coroutine_fn hmp_screendump(Monitor *mon, const QDict *qdict);
 void hmp_chardev_add(Monitor *mon, const QDict *qdict);
diff --git a/include/ui/console.h b/include/ui/console.h
index e400ee9fa7..8e6cf782a1 100644
--- a/include/ui/console.h
+++ b/include/ui/console.h
@@ -65,7 +65,7 @@ void qemu_remove_led_event_handler(QEMUPutLEDEntry *entry);
 
 void kbd_put_ledstate(int ledstate);
 
-void hmp_mouse_set(Monitor *mon, const QDict *qdict);
+bool qemu_mouse_set(int index, Error **errp);
 
 /* keysym is a unicode code except for special keys (see QEMU_KEY_xxx
    constants) */
diff --git a/monitor/misc.c b/monitor/misc.c
index 3d68940d28..50cb9f008b 100644
--- a/monitor/misc.c
+++ b/monitor/misc.c
@@ -33,7 +33,6 @@
 #include "ui/qemu-spice.h"
 #include "qemu/config-file.h"
 #include "qemu/ctype.h"
-#include "ui/console.h"
 #include "audio/audio.h"
 #include "disas/disas.h"
 #include "qemu/timer.h"
diff --git a/ui/input.c b/ui/input.c
index d1c7605238..7048810a57 100644
--- a/ui/input.c
+++ b/ui/input.c
@@ -2,8 +2,6 @@
 #include "sysemu/sysemu.h"
 #include "qapi/error.h"
 #include "qapi/qapi-commands-ui.h"
-#include "qapi/qmp/qdict.h"
-#include "qemu/error-report.h"
 #include "trace.h"
 #include "ui/input.h"
 #include "ui/console.h"
@@ -594,10 +592,9 @@ MouseInfoList *qmp_query_mice(Error **errp)
     return mice_list;
 }
 
-void hmp_mouse_set(Monitor *mon, const QDict *qdict)
+bool qemu_mouse_set(int index, Error **errp)
 {
     QemuInputHandlerState *s;
-    int index = qdict_get_int(qdict, "index");
     int found = 0;
 
     QTAILQ_FOREACH(s, &handlers, node) {
@@ -606,8 +603,9 @@ void hmp_mouse_set(Monitor *mon, const QDict *qdict)
         }
         if (!(s->handler->mask & (INPUT_EVENT_MASK_REL |
                                   INPUT_EVENT_MASK_ABS))) {
-            error_report("Input device '%s' is not a mouse", s->handler->name);
-            return;
+            error_setg(errp, "Input device '%s' is not a mouse",
+                       s->handler->name);
+            return false;
         }
         found = 1;
         qemu_input_handler_activate(s);
@@ -615,9 +613,10 @@ void hmp_mouse_set(Monitor *mon, const QDict *qdict)
     }
 
     if (!found) {
-        error_report("Mouse at index '%d' not found", index);
-        return;
+        error_setg(errp, "Mouse at index '%d' not found", index);
+        return false;
     }
 
     qemu_input_check_mode_change();
+    return true;
 }
diff --git a/ui/ui-hmp-cmds.c b/ui/ui-hmp-cmds.c
index 7ca80c8626..5c456ecc02 100644
--- a/ui/ui-hmp-cmds.c
+++ b/ui/ui-hmp-cmds.c
@@ -69,6 +69,14 @@ void hmp_mouse_button(Monitor *mon, const QDict *qdict)
     mouse_button_state = button_state;
 }
 
+void hmp_mouse_set(Monitor *mon, const QDict *qdict)
+{
+    Error *err = NULL;
+
+    qemu_mouse_set(qdict_get_int(qdict, "index"), &err);
+    hmp_handle_error(mon, err);
+}
+
 void hmp_info_mice(Monitor *mon, const QDict *qdict)
 {
     MouseInfoList *mice_list, *mouse;
-- 
2.39.0


