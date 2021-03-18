Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FF8A340AB1
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 17:53:59 +0100 (CET)
Received: from localhost ([::1]:60490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMvuI-000543-FJ
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 12:53:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lMvfE-00025B-Cs
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 12:38:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48213)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lMvf0-000337-Kt
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 12:38:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616085487;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ggr5smwfl1o/DNPjFPB9Qq6onyqgjJOeSvvqI9L2Et0=;
 b=ZBZ0hu0/xjrhaUC+j9vI3tD+isnk5MwUqVhNDuIzSRODDBefWkGec6t9OtCMH+8k3MW1ro
 da4MkKVfQ6rORUSuGSbYYhq8uIEndSHY6a/gL0BiBsmzCG8UrMYPUttNSz3i9N9QL/QZiO
 frPzjaVJe1qrxHUM+GaickQP1Aez33M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-16-NXjePxUfO_SQphzvgEI62w-1; Thu, 18 Mar 2021 12:38:04 -0400
X-MC-Unique: NXjePxUfO_SQphzvgEI62w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 75AE183DD24;
 Thu, 18 Mar 2021 16:38:03 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-83.phx2.redhat.com
 [10.3.112.83])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9DBB16064B;
 Thu, 18 Mar 2021 16:38:00 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 4693111385CB; Thu, 18 Mar 2021 17:37:57 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 06/11] monitor: Drop query-qmp-schema 'gen': false hack
Date: Thu, 18 Mar 2021 17:37:52 +0100
Message-Id: <20210318163757.1345341-7-armbru@redhat.com>
In-Reply-To: <20210318163757.1345341-1-armbru@redhat.com>
References: <20210318163757.1345341-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.249,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

QMP commands return their response as a generated QAPI type, which the
monitor core converts to JSON via QObject.

query-qmp-schema's response is the generated introspection data.  This
is a QLitObject since commit 7d0f982bfb "qapi: generate a literal
qobject for introspection", v2.12).  Before, it was a string.  Instead
of converting QLitObject / string -> QObject -> QAPI type
SchemaInfoList -> QObject -> JSON, we take a shortcut: the command is
'gen': false, so it can return the QObject instead of the QAPI type.
Slightly simpler and more efficient.

The next commit will filter the response for output policy, and this
is easier in the SchemaInfoList representation.  Drop the shortcut.

This replaces the manual command registration by a generated one.  The
manual registration makes the command available before the machine is
built by passing flag QCO_ALLOW_PRECONFIG.  To keep it available
there, we need need to add 'allow-preconfig': true to its definition
in the schema.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Message-Id: <20210318155519.1224118-7-armbru@redhat.com>
---
 qapi/introspect.json                 |  2 +-
 monitor/monitor-internal.h           |  3 ---
 monitor/misc.c                       |  2 --
 monitor/qmp-cmds-control.c           | 29 ++++++++++++++++------------
 storage-daemon/qemu-storage-daemon.c |  2 --
 5 files changed, 18 insertions(+), 20 deletions(-)

diff --git a/qapi/introspect.json b/qapi/introspect.json
index 944bb87a20..39bd303778 100644
--- a/qapi/introspect.json
+++ b/qapi/introspect.json
@@ -49,7 +49,7 @@
 ##
 { 'command': 'query-qmp-schema',
   'returns': [ 'SchemaInfo' ],
-  'gen': false }                # just to simplify qmp_query_json()
+  'allow-preconfig': true }
 
 ##
 # @SchemaMetaType:
diff --git a/monitor/monitor-internal.h b/monitor/monitor-internal.h
index 40903d6386..9c3a09cb01 100644
--- a/monitor/monitor-internal.h
+++ b/monitor/monitor-internal.h
@@ -183,7 +183,4 @@ void help_cmd(Monitor *mon, const char *name);
 void handle_hmp_command(MonitorHMP *mon, const char *cmdline);
 int hmp_compare_cmd(const char *name, const char *list);
 
-void qmp_query_qmp_schema(QDict *qdict, QObject **ret_data,
-                                 Error **errp);
-
 #endif
diff --git a/monitor/misc.c b/monitor/misc.c
index a7650ed747..0b46006e42 100644
--- a/monitor/misc.c
+++ b/monitor/misc.c
@@ -231,8 +231,6 @@ static void monitor_init_qmp_commands(void)
 
     qmp_init_marshal(&qmp_commands);
 
-    qmp_register_command(&qmp_commands, "query-qmp-schema",
-                         qmp_query_qmp_schema, QCO_ALLOW_PRECONFIG);
     qmp_register_command(&qmp_commands, "device_add", qmp_device_add,
                          QCO_NO_OPTIONS);
     qmp_register_command(&qmp_commands, "object-add", qmp_object_add,
diff --git a/monitor/qmp-cmds-control.c b/monitor/qmp-cmds-control.c
index 509ae870bd..25afd0867f 100644
--- a/monitor/qmp-cmds-control.c
+++ b/monitor/qmp-cmds-control.c
@@ -26,10 +26,14 @@
 
 #include "monitor-internal.h"
 #include "qemu-version.h"
+#include "qapi/compat-policy.h"
 #include "qapi/error.h"
 #include "qapi/qapi-commands-control.h"
+#include "qapi/qapi-commands-introspect.h"
 #include "qapi/qapi-emit-events.h"
 #include "qapi/qapi-introspect.h"
+#include "qapi/qapi-visit-introspect.h"
+#include "qapi/qobject-input-visitor.h"
 
 /*
  * Accept QMP capabilities in @list for @mon.
@@ -154,17 +158,18 @@ EventInfoList *qmp_query_events(Error **errp)
     return ev_list;
 }
 
-/*
- * Minor hack: generated marshalling suppressed for this command
- * ('gen': false in the schema) so we can parse the JSON string
- * directly into QObject instead of first parsing it with
- * visit_type_SchemaInfoList() into a SchemaInfoList, then marshal it
- * to QObject with generated output marshallers, every time.  Instead,
- * we do it in test-qobject-input-visitor.c, just to make sure
- * qapi-gen.py's output actually conforms to the schema.
- */
-void qmp_query_qmp_schema(QDict *qdict, QObject **ret_data,
-                                 Error **errp)
+SchemaInfoList *qmp_query_qmp_schema(Error **errp)
 {
-    *ret_data = qobject_from_qlit(&qmp_schema_qlit);
+    QObject *obj = qobject_from_qlit(&qmp_schema_qlit);
+    Visitor *v = qobject_input_visitor_new(obj);
+    SchemaInfoList *schema = NULL;
+
+    /* test_visitor_in_qmp_introspect() ensures this can't fail */
+    visit_type_SchemaInfoList(v, NULL, &schema, &error_abort);
+    g_assert(schema);
+
+    qobject_unref(obj);
+    visit_free(v);
+
+    return schema;
 }
diff --git a/storage-daemon/qemu-storage-daemon.c b/storage-daemon/qemu-storage-daemon.c
index 23756fc8e5..02afdbeafc 100644
--- a/storage-daemon/qemu-storage-daemon.c
+++ b/storage-daemon/qemu-storage-daemon.c
@@ -146,8 +146,6 @@ static QemuOptsList qemu_object_opts = {
 static void init_qmp_commands(void)
 {
     qmp_init_marshal(&qmp_commands);
-    qmp_register_command(&qmp_commands, "query-qmp-schema",
-                         qmp_query_qmp_schema, QCO_ALLOW_PRECONFIG);
     qmp_register_command(&qmp_commands, "object-add", qmp_object_add,
                          QCO_NO_OPTIONS);
 
-- 
2.26.3


