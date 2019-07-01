Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E0BB4C269
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Jun 2019 22:29:01 +0200 (CEST)
Received: from localhost ([::1]:41778 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hdhCW-0004ky-PY
	for lists+qemu-devel@lfdr.de; Wed, 19 Jun 2019 16:29:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35421)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <armbru@redhat.com>) id 1hdgvD-0004LO-Is
 for qemu-devel@nongnu.org; Wed, 19 Jun 2019 16:11:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1hdgv7-00019m-8V
 for qemu-devel@nongnu.org; Wed, 19 Jun 2019 16:11:06 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52234)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1hdgv5-00012A-RL
 for qemu-devel@nongnu.org; Wed, 19 Jun 2019 16:11:00 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id EDC42307D980
 for <qemu-devel@nongnu.org>; Wed, 19 Jun 2019 20:10:53 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-85.ams2.redhat.com
 [10.36.116.85])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 958C560BFB;
 Wed, 19 Jun 2019 20:10:53 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id B365A1138529; Wed, 19 Jun 2019 22:10:50 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed, 19 Jun 2019 22:10:39 +0200
Message-Id: <20190619201050.19040-7-armbru@redhat.com>
In-Reply-To: <20190619201050.19040-1-armbru@redhat.com>
References: <20190619201050.19040-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.48]); Wed, 19 Jun 2019 20:10:53 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH 06/17] qom: Move HMP command handlers to qom/
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
Cc: kwolf@redhat.com, "Daniel P. Berrange" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There are just two HMP commands related to QOM: qom-list and qom-set.
Move their handlers from monitor/hmp-cmds.c to new qom/qom-hmp-cmds.c,
where they are covered by MAINTAINERS section QOM.

Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: "Daniel P. Berrange" <berrange@redhat.com>
Cc: Eduardo Habkost <ehabkost@redhat.com>
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 include/monitor/hmp.h |  2 ++
 monitor/hmp-cmds.c    | 50 +---------------------------------
 qom/Makefile.objs     |  2 +-
 qom/qom-hmp-cmds.c    | 62 +++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 66 insertions(+), 50 deletions(-)
 create mode 100644 qom/qom-hmp-cmds.c

diff --git a/include/monitor/hmp.h b/include/monitor/hmp.h
index 1d095d5837..f46ccdaa35 100644
--- a/include/monitor/hmp.h
+++ b/include/monitor/hmp.h
@@ -16,6 +16,8 @@
=20
 #include "qemu/readline.h"
=20
+void hmp_handle_error(Monitor *mon, Error **errp);
+
 void hmp_info_name(Monitor *mon, const QDict *qdict);
 void hmp_info_version(Monitor *mon, const QDict *qdict);
 void hmp_info_kvm(Monitor *mon, const QDict *qdict);
diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index d94ab7563e..5641036dc3 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -60,7 +60,7 @@
 #include <spice/enums.h>
 #endif
=20
-static void hmp_handle_error(Monitor *mon, Error **errp)
+void hmp_handle_error(Monitor *mon, Error **errp)
 {
     assert(errp);
     if (*errp) {
@@ -2714,54 +2714,6 @@ void hmp_info_iothreads(Monitor *mon, const QDict =
*qdict)
     qapi_free_IOThreadInfoList(info_list);
 }
=20
-void hmp_qom_list(Monitor *mon, const QDict *qdict)
-{
-    const char *path =3D qdict_get_try_str(qdict, "path");
-    ObjectPropertyInfoList *list;
-    Error *err =3D NULL;
-
-    if (path =3D=3D NULL) {
-        monitor_printf(mon, "/\n");
-        return;
-    }
-
-    list =3D qmp_qom_list(path, &err);
-    if (err =3D=3D NULL) {
-        ObjectPropertyInfoList *start =3D list;
-        while (list !=3D NULL) {
-            ObjectPropertyInfo *value =3D list->value;
-
-            monitor_printf(mon, "%s (%s)\n",
-                           value->name, value->type);
-            list =3D list->next;
-        }
-        qapi_free_ObjectPropertyInfoList(start);
-    }
-    hmp_handle_error(mon, &err);
-}
-
-void hmp_qom_set(Monitor *mon, const QDict *qdict)
-{
-    const char *path =3D qdict_get_str(qdict, "path");
-    const char *property =3D qdict_get_str(qdict, "property");
-    const char *value =3D qdict_get_str(qdict, "value");
-    Error *err =3D NULL;
-    bool ambiguous =3D false;
-    Object *obj;
-
-    obj =3D object_resolve_path(path, &ambiguous);
-    if (obj =3D=3D NULL) {
-        error_set(&err, ERROR_CLASS_DEVICE_NOT_FOUND,
-                  "Device '%s' not found", path);
-    } else {
-        if (ambiguous) {
-            monitor_printf(mon, "Warning: Path '%s' is ambiguous\n", pat=
h);
-        }
-        object_property_parse(obj, value, property, &err);
-    }
-    hmp_handle_error(mon, &err);
-}
-
 void hmp_rocker(Monitor *mon, const QDict *qdict)
 {
     const char *name =3D qdict_get_str(qdict, "name");
diff --git a/qom/Makefile.objs b/qom/Makefile.objs
index 5fb43b842c..aae478fc21 100644
--- a/qom/Makefile.objs
+++ b/qom/Makefile.objs
@@ -2,4 +2,4 @@ qom-obj-y =3D object.o container.o qom-qobject.o
 qom-obj-y +=3D object_interfaces.o
=20
 common-obj-y =3D cpu.o
-common-obj-$(CONFIG_SOFTMMU) +=3D qom-qmp-cmds.o
+common-obj-$(CONFIG_SOFTMMU) +=3D qom-hmp-cmds.o qom-qmp-cmds.o
diff --git a/qom/qom-hmp-cmds.c b/qom/qom-hmp-cmds.c
new file mode 100644
index 0000000000..2028a21052
--- /dev/null
+++ b/qom/qom-hmp-cmds.c
@@ -0,0 +1,62 @@
+/*
+ * HMP commands related to QOM
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or
+ * later.  See the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include "monitor/hmp.h"
+#include "qapi/qapi-commands-qom.h"
+#include "qapi/qmp/qdict.h"
+#include "monitor/monitor.h"
+#include "qom/object.h"
+#include "qapi/error.h"
+
+void hmp_qom_list(Monitor *mon, const QDict *qdict)
+{
+    const char *path =3D qdict_get_try_str(qdict, "path");
+    ObjectPropertyInfoList *list;
+    Error *err =3D NULL;
+
+    if (path =3D=3D NULL) {
+        monitor_printf(mon, "/\n");
+        return;
+    }
+
+    list =3D qmp_qom_list(path, &err);
+    if (err =3D=3D NULL) {
+        ObjectPropertyInfoList *start =3D list;
+        while (list !=3D NULL) {
+            ObjectPropertyInfo *value =3D list->value;
+
+            monitor_printf(mon, "%s (%s)\n",
+                           value->name, value->type);
+            list =3D list->next;
+        }
+        qapi_free_ObjectPropertyInfoList(start);
+    }
+    hmp_handle_error(mon, &err);
+}
+
+void hmp_qom_set(Monitor *mon, const QDict *qdict)
+{
+    const char *path =3D qdict_get_str(qdict, "path");
+    const char *property =3D qdict_get_str(qdict, "property");
+    const char *value =3D qdict_get_str(qdict, "value");
+    Error *err =3D NULL;
+    bool ambiguous =3D false;
+    Object *obj;
+
+    obj =3D object_resolve_path(path, &ambiguous);
+    if (obj =3D=3D NULL) {
+        error_set(&err, ERROR_CLASS_DEVICE_NOT_FOUND,
+                  "Device '%s' not found", path);
+    } else {
+        if (ambiguous) {
+            monitor_printf(mon, "Warning: Path '%s' is ambiguous\n", pat=
h);
+        }
+        object_property_parse(obj, value, property, &err);
+    }
+    hmp_handle_error(mon, &err);
+}
--=20
2.21.0


