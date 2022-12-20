Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F0F1651D86
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Dec 2022 10:36:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7YaW-0000b2-In; Tue, 20 Dec 2022 04:07:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p7YaP-0000Wv-Ql
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 04:06:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p7YaN-0006UP-PW
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 04:06:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671527215;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=n7LQWhmn7iKyM1nc9k7jXinnRLLnRjwgQRsotKorC/c=;
 b=RevKWSUY6NRU2NKrtoVkHHAh5QyJZ4qTIREDHmJhY5/mYsbfMjEzG+F+6u1V9VnfqU4xO3
 53LSp9fL2DzATQlfENOQkZsAzCzaPKj3MlOJ8YW31UwQZiSjK+TTki/7FNN5GsiC8s0TDW
 z7DQuOK7luXMkZOL1HDRgCweE0BPofI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-255-88vGhgqsOJSy-Z-DZB3iQA-1; Tue, 20 Dec 2022 04:06:49 -0500
X-MC-Unique: 88vGhgqsOJSy-Z-DZB3iQA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 796BE85A588;
 Tue, 20 Dec 2022 09:06:49 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.195.91])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 14DD2112132D;
 Tue, 20 Dec 2022 09:06:49 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 9A15B21E66CC; Tue, 20 Dec 2022 10:06:45 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: kraxel@redhat.com, dgilbert@redhat.com, berrange@redhat.com,
 philmd@linaro.org
Subject: [PATCH v3 16/18] ui: Split hmp_mouse_set() and move the HMP part to
 ui/
Date: Tue, 20 Dec 2022 10:06:43 +0100
Message-Id: <20221220090645.2844881-17-armbru@redhat.com>
In-Reply-To: <20221220090645.2844881-1-armbru@redhat.com>
References: <20221220090645.2844881-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
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
---
 include/monitor/hmp.h | 1 +
 include/ui/console.h  | 2 +-
 monitor/misc.c        | 1 -
 ui/input.c            | 5 +----
 ui/ui-hmp-cmds.c      | 8 ++++++++
 5 files changed, 11 insertions(+), 6 deletions(-)

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
index e400ee9fa7..e7f375312c 100644
--- a/include/ui/console.h
+++ b/include/ui/console.h
@@ -65,7 +65,7 @@ void qemu_remove_led_event_handler(QEMUPutLEDEntry *entry);
 
 void kbd_put_ledstate(int ledstate);
 
-void hmp_mouse_set(Monitor *mon, const QDict *qdict);
+void qemu_mouse_set(int index, Error **err);
 
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
index 8f4a87d1d7..7bece94e79 100644
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
+void qemu_mouse_set(int index, Error **err)
 {
     QemuInputHandlerState *s;
-    int index = qdict_get_int(qdict, "index");
     int found = 0;
 
     QTAILQ_FOREACH(s, &handlers, node) {
diff --git a/ui/ui-hmp-cmds.c b/ui/ui-hmp-cmds.c
index adea425d35..ad6a2a52e2 100644
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
2.38.1


