Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F5B216139E
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Feb 2020 14:34:44 +0100 (CET)
Received: from localhost ([::1]:45608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j3gXr-0004FU-M0
	for lists+qemu-devel@lfdr.de; Mon, 17 Feb 2020 08:34:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54502)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1j3gRj-0004In-CO
 for qemu-devel@nongnu.org; Mon, 17 Feb 2020 08:28:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1j3gRg-0000sh-2O
 for qemu-devel@nongnu.org; Mon, 17 Feb 2020 08:28:23 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:58039
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1j3gRf-0000rr-TS
 for qemu-devel@nongnu.org; Mon, 17 Feb 2020 08:28:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581946099;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=41FcP4x2ytSyRf+bb3WRHdxlaC7aOONcpuzwqMnMcqs=;
 b=OIubl+A/9R7GUCn3UXi+AJWv+0rCPbhZ3taSM50n5FklQbCzARn5x/XH7rS6c/i1ujEoOG
 FGzRFl6QNnDqEqsEQeevQpeAbfXr0esO7n6fX6riwZm7mbQmpTl7hUIkTB+kHBOX2tt06h
 XO7djTs2oWH7BqTvVbG5ePsl9MkKPwE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-201-A2-O8_d4NUeUMWWO3jMhLA-1; Mon, 17 Feb 2020 08:28:17 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 89AB11005F6C
 for <qemu-devel@nongnu.org>; Mon, 17 Feb 2020 13:28:16 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-117-234.ams2.redhat.com
 [10.36.117.234])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2FCE15C3FA;
 Mon, 17 Feb 2020 13:28:16 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id AD4B411366C5; Mon, 17 Feb 2020 14:28:14 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 3/5] monitor: Collect "control" command handlers in
 qmp-cmds.control.c
Date: Mon, 17 Feb 2020 14:28:12 +0100
Message-Id: <20200217132814.9018-4-armbru@redhat.com>
In-Reply-To: <20200217132814.9018-1-armbru@redhat.com>
References: <20200217132814.9018-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: A2-O8_d4NUeUMWWO3jMhLA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: Kevin Wolf <kwolf@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Kevin Wolf <kwolf@redhat.com>

Move all of the QMP commands handlers to implement the 'control' module
(qapi/control.json) that can be shared between the system emulator and
tools such as a storage daemon to a new file monitor/qmp-cmds-control.c.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20200129102239.31435-4-kwolf@redhat.com>
[Commit message tweaked]
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 monitor/misc.c             | 110 --------------------------
 monitor/qmp-cmds-control.c | 153 +++++++++++++++++++++++++++++++++++++
 monitor/qmp-cmds.c         |  14 ----
 monitor/Makefile.objs      |   3 +-
 4 files changed, 155 insertions(+), 125 deletions(-)
 create mode 100644 monitor/qmp-cmds-control.c

diff --git a/monitor/misc.c b/monitor/misc.c
index b4303d42d0..4c4e47fdc4 100644
--- a/monitor/misc.c
+++ b/monitor/misc.c
@@ -72,7 +72,6 @@
 #include "qapi/qapi-commands-misc.h"
 #include "qapi/qapi-commands-qom.h"
 #include "qapi/qapi-commands-trace.h"
-#include "qapi/qapi-emit-events.h"
 #include "qapi/qapi-init-commands.h"
 #include "qapi/error.h"
 #include "qapi/qmp-event.h"
@@ -233,58 +232,6 @@ static void hmp_info_help(Monitor *mon, const QDict *q=
dict)
     help_cmd(mon, "info");
 }
=20
-static void query_commands_cb(QmpCommand *cmd, void *opaque)
-{
-    CommandInfoList *info, **list =3D opaque;
-
-    if (!cmd->enabled) {
-        return;
-    }
-
-    info =3D g_malloc0(sizeof(*info));
-    info->value =3D g_malloc0(sizeof(*info->value));
-    info->value->name =3D g_strdup(cmd->name);
-    info->next =3D *list;
-    *list =3D info;
-}
-
-CommandInfoList *qmp_query_commands(Error **errp)
-{
-    CommandInfoList *list =3D NULL;
-    MonitorQMP *mon;
-
-    assert(monitor_is_qmp(cur_mon));
-    mon =3D container_of(cur_mon, MonitorQMP, common);
-
-    qmp_for_each_command(mon->commands, query_commands_cb, &list);
-
-    return list;
-}
-
-EventInfoList *qmp_query_events(Error **errp)
-{
-    /*
-     * TODO This deprecated command is the only user of
-     * QAPIEvent_str() and QAPIEvent_lookup[].  When the command goes,
-     * they should go, too.
-     */
-    EventInfoList *info, *ev_list =3D NULL;
-    QAPIEvent e;
-
-    for (e =3D 0 ; e < QAPI_EVENT__MAX ; e++) {
-        const char *event_name =3D QAPIEvent_str(e);
-        assert(event_name !=3D NULL);
-        info =3D g_malloc0(sizeof(*info));
-        info->value =3D g_malloc0(sizeof(*info->value));
-        info->value->name =3D g_strdup(event_name);
-
-        info->next =3D ev_list;
-        ev_list =3D info;
-    }
-
-    return ev_list;
-}
-
 /*
  * Minor hack: generated marshalling suppressed for this command
  * ('gen': false in the schema) so we can parse the JSON string
@@ -323,63 +270,6 @@ static void monitor_init_qmp_commands(void)
                          qmp_marshal_qmp_capabilities, QCO_ALLOW_PRECONFIG=
);
 }
=20
-/*
- * Accept QMP capabilities in @list for @mon.
- * On success, set mon->qmp.capab[], and return true.
- * On error, set @errp, and return false.
- */
-static bool qmp_caps_accept(MonitorQMP *mon, QMPCapabilityList *list,
-                            Error **errp)
-{
-    GString *unavailable =3D NULL;
-    bool capab[QMP_CAPABILITY__MAX];
-
-    memset(capab, 0, sizeof(capab));
-
-    for (; list; list =3D list->next) {
-        if (!mon->capab_offered[list->value]) {
-            if (!unavailable) {
-                unavailable =3D g_string_new(QMPCapability_str(list->value=
));
-            } else {
-                g_string_append_printf(unavailable, ", %s",
-                                      QMPCapability_str(list->value));
-            }
-        }
-        capab[list->value] =3D true;
-    }
-
-    if (unavailable) {
-        error_setg(errp, "Capability %s not available", unavailable->str);
-        g_string_free(unavailable, true);
-        return false;
-    }
-
-    memcpy(mon->capab, capab, sizeof(capab));
-    return true;
-}
-
-void qmp_qmp_capabilities(bool has_enable, QMPCapabilityList *enable,
-                          Error **errp)
-{
-    MonitorQMP *mon;
-
-    assert(monitor_is_qmp(cur_mon));
-    mon =3D container_of(cur_mon, MonitorQMP, common);
-
-    if (mon->commands =3D=3D &qmp_commands) {
-        error_set(errp, ERROR_CLASS_COMMAND_NOT_FOUND,
-                  "Capabilities negotiation is already complete, command "
-                  "ignored");
-        return;
-    }
-
-    if (!qmp_caps_accept(mon, enable, errp)) {
-        return;
-    }
-
-    mon->commands =3D &qmp_commands;
-}
-
 /* Set the current CPU defined by the user. Callers must hold BQL. */
 int monitor_set_cpu(int cpu_index)
 {
diff --git a/monitor/qmp-cmds-control.c b/monitor/qmp-cmds-control.c
new file mode 100644
index 0000000000..d5f21f90e6
--- /dev/null
+++ b/monitor/qmp-cmds-control.c
@@ -0,0 +1,153 @@
+/*
+ * QMP commands related to the monitor (common to sysemu and tools)
+ *
+ * Copyright (c) 2003-2004 Fabrice Bellard
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a=
 copy
+ * of this software and associated documentation files (the "Software"), t=
o deal
+ * in the Software without restriction, including without limitation the r=
ights
+ * to use, copy, modify, merge, publish, distribute, sublicense, and/or se=
ll
+ * copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included=
 in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS=
 OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY=
,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OT=
HER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING=
 FROM,
+ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS =
IN
+ * THE SOFTWARE.
+ */
+
+#include "qemu/osdep.h"
+
+#include "monitor-internal.h"
+#include "qemu-version.h"
+#include "qapi/error.h"
+#include "qapi/qapi-commands-control.h"
+#include "qapi/qapi-emit-events.h"
+
+/*
+ * Accept QMP capabilities in @list for @mon.
+ * On success, set mon->qmp.capab[], and return true.
+ * On error, set @errp, and return false.
+ */
+static bool qmp_caps_accept(MonitorQMP *mon, QMPCapabilityList *list,
+                            Error **errp)
+{
+    GString *unavailable =3D NULL;
+    bool capab[QMP_CAPABILITY__MAX];
+
+    memset(capab, 0, sizeof(capab));
+
+    for (; list; list =3D list->next) {
+        if (!mon->capab_offered[list->value]) {
+            if (!unavailable) {
+                unavailable =3D g_string_new(QMPCapability_str(list->value=
));
+            } else {
+                g_string_append_printf(unavailable, ", %s",
+                                      QMPCapability_str(list->value));
+            }
+        }
+        capab[list->value] =3D true;
+    }
+
+    if (unavailable) {
+        error_setg(errp, "Capability %s not available", unavailable->str);
+        g_string_free(unavailable, true);
+        return false;
+    }
+
+    memcpy(mon->capab, capab, sizeof(capab));
+    return true;
+}
+
+void qmp_qmp_capabilities(bool has_enable, QMPCapabilityList *enable,
+                          Error **errp)
+{
+    MonitorQMP *mon;
+
+    assert(monitor_is_qmp(cur_mon));
+    mon =3D container_of(cur_mon, MonitorQMP, common);
+
+    if (mon->commands =3D=3D &qmp_commands) {
+        error_set(errp, ERROR_CLASS_COMMAND_NOT_FOUND,
+                  "Capabilities negotiation is already complete, command "
+                  "ignored");
+        return;
+    }
+
+    if (!qmp_caps_accept(mon, enable, errp)) {
+        return;
+    }
+
+    mon->commands =3D &qmp_commands;
+}
+
+VersionInfo *qmp_query_version(Error **errp)
+{
+    VersionInfo *info =3D g_new0(VersionInfo, 1);
+
+    info->qemu =3D g_new0(VersionTriple, 1);
+    info->qemu->major =3D QEMU_VERSION_MAJOR;
+    info->qemu->minor =3D QEMU_VERSION_MINOR;
+    info->qemu->micro =3D QEMU_VERSION_MICRO;
+    info->package =3D g_strdup(QEMU_PKGVERSION);
+
+    return info;
+}
+
+static void query_commands_cb(QmpCommand *cmd, void *opaque)
+{
+    CommandInfoList *info, **list =3D opaque;
+
+    if (!cmd->enabled) {
+        return;
+    }
+
+    info =3D g_malloc0(sizeof(*info));
+    info->value =3D g_malloc0(sizeof(*info->value));
+    info->value->name =3D g_strdup(cmd->name);
+    info->next =3D *list;
+    *list =3D info;
+}
+
+CommandInfoList *qmp_query_commands(Error **errp)
+{
+    CommandInfoList *list =3D NULL;
+    MonitorQMP *mon;
+
+    assert(monitor_is_qmp(cur_mon));
+    mon =3D container_of(cur_mon, MonitorQMP, common);
+
+    qmp_for_each_command(mon->commands, query_commands_cb, &list);
+
+    return list;
+}
+
+EventInfoList *qmp_query_events(Error **errp)
+{
+    /*
+     * TODO This deprecated command is the only user of
+     * QAPIEvent_str() and QAPIEvent_lookup[].  When the command goes,
+     * they should go, too.
+     */
+    EventInfoList *info, *ev_list =3D NULL;
+    QAPIEvent e;
+
+    for (e =3D 0 ; e < QAPI_EVENT__MAX ; e++) {
+        const char *event_name =3D QAPIEvent_str(e);
+        assert(event_name !=3D NULL);
+        info =3D g_malloc0(sizeof(*info));
+        info->value =3D g_malloc0(sizeof(*info->value));
+        info->value->name =3D g_strdup(event_name);
+
+        info->next =3D ev_list;
+        ev_list =3D info;
+    }
+
+    return ev_list;
+}
diff --git a/monitor/qmp-cmds.c b/monitor/qmp-cmds.c
index a55d2dffc2..da7083087e 100644
--- a/monitor/qmp-cmds.c
+++ b/monitor/qmp-cmds.c
@@ -15,7 +15,6 @@
=20
 #include "qemu/osdep.h"
 #include "qemu-common.h"
-#include "qemu-version.h"
 #include "qemu/cutils.h"
 #include "qemu/option.h"
 #include "monitor/monitor.h"
@@ -52,19 +51,6 @@ NameInfo *qmp_query_name(Error **errp)
     return info;
 }
=20
-VersionInfo *qmp_query_version(Error **errp)
-{
-    VersionInfo *info =3D g_new0(VersionInfo, 1);
-
-    info->qemu =3D g_new0(VersionTriple, 1);
-    info->qemu->major =3D QEMU_VERSION_MAJOR;
-    info->qemu->minor =3D QEMU_VERSION_MINOR;
-    info->qemu->micro =3D QEMU_VERSION_MICRO;
-    info->package =3D g_strdup(QEMU_PKGVERSION);
-
-    return info;
-}
-
 KvmInfo *qmp_query_kvm(Error **errp)
 {
     KvmInfo *info =3D g_malloc0(sizeof(*info));
diff --git a/monitor/Makefile.objs b/monitor/Makefile.objs
index e91a8581cd..9244d90859 100644
--- a/monitor/Makefile.objs
+++ b/monitor/Makefile.objs
@@ -1,3 +1,4 @@
 obj-y +=3D misc.o
 common-obj-y +=3D monitor.o qmp.o hmp.o
-common-obj-y +=3D qmp-cmds.o hmp-cmds.o
+common-obj-y +=3D qmp-cmds.o qmp-cmds-control.o
+common-obj-y +=3D hmp-cmds.o
--=20
2.21.1


