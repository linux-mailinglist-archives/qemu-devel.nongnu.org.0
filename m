Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34B1F15FE8C
	for <lists+qemu-devel@lfdr.de>; Sat, 15 Feb 2020 14:06:53 +0100 (CET)
Received: from localhost ([::1]:51126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j2x9o-0001XO-8j
	for lists+qemu-devel@lfdr.de; Sat, 15 Feb 2020 08:06:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57270)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1j2x8e-0000Cu-VB
 for qemu-devel@nongnu.org; Sat, 15 Feb 2020 08:05:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1j2x8b-0002jG-Gq
 for qemu-devel@nongnu.org; Sat, 15 Feb 2020 08:05:39 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:59219
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1j2x8b-0002hY-D8
 for qemu-devel@nongnu.org; Sat, 15 Feb 2020 08:05:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581771935;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EWJN2qxwSmjmo7/A3dWxWzUdQCpOLcD6TAOZxHPINlQ=;
 b=h4+2QzsLxABpTv9HZlq2f0cY7leZsFh4IU8xzSXjRjgiG0KotkmjzwuKWIhSfzG6Om1n7m
 91IvpZpAtGZw6r3Txs/GKp1ZKIYuQOnwf2ataXRkdxbtmxSgRxAkpO9+sI60FpNrGxhZss
 AJP4TjZuPQbqIRt68xq4NfAU/tp/8rc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-420-5LAfjbioOIa6TIvwBZv4IA-1; Sat, 15 Feb 2020 08:05:30 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3AA7B1882CCC
 for <qemu-devel@nongnu.org>; Sat, 15 Feb 2020 13:05:29 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-117-234.ams2.redhat.com
 [10.36.117.234])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 07A685C1C3;
 Sat, 15 Feb 2020 13:05:28 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 72CBB11366C8; Sat, 15 Feb 2020 14:05:27 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 4/5] monitor: Move qmp_query_qmp_schema to qmp-cmds-control.c
Date: Sat, 15 Feb 2020 14:05:26 +0100
Message-Id: <20200215130527.28861-5-armbru@redhat.com>
In-Reply-To: <20200215130527.28861-1-armbru@redhat.com>
References: <20200215130527.28861-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: 5LAfjbioOIa6TIvwBZv4IA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
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

monitor/misc.c contains code that works only in the system emulator, so
it can't be linked to tools like a storage daemon. In order to make
schema introspection available for tools, move the function to
monitor/qmp-cmds-control.c, which can be linked into the storage daemon.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20200129102239.31435-5-kwolf@redhat.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 monitor/monitor-internal.h |  3 +++
 monitor/misc.c             | 16 ----------------
 monitor/qmp-cmds-control.c | 16 ++++++++++++++++
 3 files changed, 19 insertions(+), 16 deletions(-)

diff --git a/monitor/monitor-internal.h b/monitor/monitor-internal.h
index 4d402ded85..3e6baba88f 100644
--- a/monitor/monitor-internal.h
+++ b/monitor/monitor-internal.h
@@ -180,4 +180,7 @@ void help_cmd(Monitor *mon, const char *name);
 void handle_hmp_command(MonitorHMP *mon, const char *cmdline);
 int hmp_compare_cmd(const char *name, const char *list);
=20
+void qmp_query_qmp_schema(QDict *qdict, QObject **ret_data,
+                                 Error **errp);
+
 #endif
diff --git a/monitor/misc.c b/monitor/misc.c
index 4c4e47fdc4..6c41293102 100644
--- a/monitor/misc.c
+++ b/monitor/misc.c
@@ -75,7 +75,6 @@
 #include "qapi/qapi-init-commands.h"
 #include "qapi/error.h"
 #include "qapi/qmp-event.h"
-#include "qapi/qapi-introspect.h"
 #include "sysemu/cpus.h"
 #include "qemu/cutils.h"
 #include "tcg/tcg.h"
@@ -232,21 +231,6 @@ static void hmp_info_help(Monitor *mon, const QDict *q=
dict)
     help_cmd(mon, "info");
 }
=20
-/*
- * Minor hack: generated marshalling suppressed for this command
- * ('gen': false in the schema) so we can parse the JSON string
- * directly into QObject instead of first parsing it with
- * visit_type_SchemaInfoList() into a SchemaInfoList, then marshal it
- * to QObject with generated output marshallers, every time.  Instead,
- * we do it in test-qobject-input-visitor.c, just to make sure
- * qapi-gen.py's output actually conforms to the schema.
- */
-static void qmp_query_qmp_schema(QDict *qdict, QObject **ret_data,
-                                 Error **errp)
-{
-    *ret_data =3D qobject_from_qlit(&qmp_schema_qlit);
-}
-
 static void monitor_init_qmp_commands(void)
 {
     /*
diff --git a/monitor/qmp-cmds-control.c b/monitor/qmp-cmds-control.c
index d5f21f90e6..5cd9bb817c 100644
--- a/monitor/qmp-cmds-control.c
+++ b/monitor/qmp-cmds-control.c
@@ -29,6 +29,7 @@
 #include "qapi/error.h"
 #include "qapi/qapi-commands-control.h"
 #include "qapi/qapi-emit-events.h"
+#include "qapi/qapi-introspect.h"
=20
 /*
  * Accept QMP capabilities in @list for @mon.
@@ -151,3 +152,18 @@ EventInfoList *qmp_query_events(Error **errp)
=20
     return ev_list;
 }
+
+/*
+ * Minor hack: generated marshalling suppressed for this command
+ * ('gen': false in the schema) so we can parse the JSON string
+ * directly into QObject instead of first parsing it with
+ * visit_type_SchemaInfoList() into a SchemaInfoList, then marshal it
+ * to QObject with generated output marshallers, every time.  Instead,
+ * we do it in test-qobject-input-visitor.c, just to make sure
+ * qapi-gen.py's output actually conforms to the schema.
+ */
+void qmp_query_qmp_schema(QDict *qdict, QObject **ret_data,
+                                 Error **errp)
+{
+    *ret_data =3D qobject_from_qlit(&qmp_schema_qlit);
+}
--=20
2.21.1


