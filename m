Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C6192C848F
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Nov 2020 14:00:01 +0100 (CET)
Received: from localhost ([::1]:49134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kjime-0005Bp-Ji
	for lists+qemu-devel@lfdr.de; Mon, 30 Nov 2020 08:00:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kjiIN-0003Gr-23
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 07:28:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50619)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kjiIJ-00035U-9l
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 07:28:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606739318;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rNrDfkezU6M4abtX0+UCMjOm24La/keOGpPQx7DsPTA=;
 b=CbguL0K6VQ7qrgmlM0XcWn0Cdv/Qk5vXxTvDwhok2tAp/ELIKPSzW1RCfmLSsjOesur256
 dnrBwzWW68wbPUWev0UAix7VYfQ1XaeDJJI6HhNiLK6M3D1gcK2CIAmC/wLEfDjMq31YJq
 HOt4yaDq715QVyEf1mhqkjPgONkZkTE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-377-drQneCE5NpytqKt68dHuzw-1; Mon, 30 Nov 2020 07:28:35 -0500
X-MC-Unique: drQneCE5NpytqKt68dHuzw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 01BE180F041;
 Mon, 30 Nov 2020 12:28:35 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-117.ams2.redhat.com [10.36.114.117])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2E90519C71;
 Mon, 30 Nov 2020 12:28:32 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 18/18] qapi/qom: QAPIfy object-add
Date: Mon, 30 Nov 2020 13:25:38 +0100
Message-Id: <20201130122538.27674-19-kwolf@redhat.com>
In-Reply-To: <20201130122538.27674-1-kwolf@redhat.com>
References: <20201130122538.27674-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.496,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: kwolf@redhat.com, lvivier@redhat.com, thuth@redhat.com, pkrempa@redhat.com,
 berrange@redhat.com, ehabkost@redhat.com, qemu-block@nongnu.org,
 libvir-list@redhat.com, jasowang@redhat.com, armbru@redhat.com,
 mreitz@redhat.com, kraxel@redhat.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This converts object-add from 'gen': false to the ObjectOptions QAPI
type. As an immediate benefit, clients can now use QAPI schema
introspection for user creatable QOM objects.

It is also the first step towards making the QAPI schema the only
external interface for the creation of user creatable objects. Once all
other places (HMP and command lines of the system emulator and all
tools) go through QAPI, too, some object implementations can be
simplified because some checks (e.g. that mandatory options are set) are
already performed by QAPI, and in another step, QOM boilerplate code
could be generated from the schema.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 qapi/qom.json                   | 11 +----------
 include/qom/object_interfaces.h |  7 -------
 hw/block/xen-block.c            | 16 ++++++++--------
 monitor/misc.c                  |  2 --
 qom/qom-qmp-cmds.c              | 25 +++++++++++++++++++++++--
 5 files changed, 32 insertions(+), 29 deletions(-)

diff --git a/qapi/qom.json b/qapi/qom.json
index 7e0d26a728..f6c6ba6748 100644
--- a/qapi/qom.json
+++ b/qapi/qom.json
@@ -809,13 +809,6 @@
 #
 # Create a QOM object.
 #
-# @qom-type: the class name for the object to be created
-#
-# @id: the name of the new object
-#
-# Additional arguments depend on qom-type and are passed to the backend
-# unchanged.
-#
 # Returns: Nothing on success
 #          Error if @qom-type is not a valid class name
 #
@@ -829,9 +822,7 @@
 # <- { "return": {} }
 #
 ##
-{ 'command': 'object-add',
-  'data': {'qom-type': 'str', 'id': 'str'},
-  'gen': false } # so we can get the additional arguments
+{ 'command': 'object-add', 'data': 'ObjectOptions', 'boxed': true }
 
 ##
 # @object-del:
diff --git a/include/qom/object_interfaces.h b/include/qom/object_interfaces.h
index 07d5cc8832..9b9938b8c0 100644
--- a/include/qom/object_interfaces.h
+++ b/include/qom/object_interfaces.h
@@ -196,11 +196,4 @@ bool user_creatable_del(const char *id, Error **errp);
  */
 void user_creatable_cleanup(void);
 
-/**
- * qmp_object_add:
- *
- * QMP command handler for object-add. See the QAPI schema for documentation.
- */
-void qmp_object_add(QDict *qdict, QObject **ret_data, Error **errp);
-
 #endif
diff --git a/hw/block/xen-block.c b/hw/block/xen-block.c
index 8a7a3f5452..d8960ff55b 100644
--- a/hw/block/xen-block.c
+++ b/hw/block/xen-block.c
@@ -842,17 +842,17 @@ static XenBlockIOThread *xen_block_iothread_create(const char *id,
 {
     ERRP_GUARD();
     XenBlockIOThread *iothread = g_new(XenBlockIOThread, 1);
-    QDict *opts;
-    QObject *ret_data = NULL;
+    ObjectOptions *opts;
 
     iothread->id = g_strdup(id);
 
-    opts = qdict_new();
-    qdict_put_str(opts, "qom-type", TYPE_IOTHREAD);
-    qdict_put_str(opts, "id", id);
-    qmp_object_add(opts, &ret_data, errp);
-    qobject_unref(opts);
-    qobject_unref(ret_data);
+    opts = g_new(ObjectOptions, 1);
+    *opts = (ObjectOptions) {
+        .qom_type = OBJECT_TYPE_IOTHREAD,
+        .id = g_strdup(id),
+    };
+    qmp_object_add(opts, errp);
+    qapi_free_ObjectOptions(opts);
 
     if (*errp) {
         g_free(iothread->id);
diff --git a/monitor/misc.c b/monitor/misc.c
index 398211a034..0586ee1f4f 100644
--- a/monitor/misc.c
+++ b/monitor/misc.c
@@ -240,8 +240,6 @@ static void monitor_init_qmp_commands(void)
                          qmp_query_qmp_schema, QCO_ALLOW_PRECONFIG);
     qmp_register_command(&qmp_commands, "device_add", qmp_device_add,
                          QCO_NO_OPTIONS);
-    qmp_register_command(&qmp_commands, "object-add", qmp_object_add,
-                         QCO_NO_OPTIONS);
 
     QTAILQ_INIT(&qmp_cap_negotiation_commands);
     qmp_register_command(&qmp_cap_negotiation_commands, "qmp_capabilities",
diff --git a/qom/qom-qmp-cmds.c b/qom/qom-qmp-cmds.c
index 0e7d7247fc..5c73f04913 100644
--- a/qom/qom-qmp-cmds.c
+++ b/qom/qom-qmp-cmds.c
@@ -19,8 +19,11 @@
 #include "qapi/error.h"
 #include "qapi/qapi-commands-qdev.h"
 #include "qapi/qapi-commands-qom.h"
+#include "qapi/qapi-visit-qom.h"
 #include "qapi/qmp/qdict.h"
 #include "qapi/qmp/qerror.h"
+#include "qapi/qobject-input-visitor.h"
+#include "qapi/qobject-output-visitor.h"
 #include "qemu/cutils.h"
 #include "qom/object_interfaces.h"
 #include "qom/qom-qobject.h"
@@ -241,9 +244,27 @@ ObjectPropertyInfoList *qmp_qom_list_properties(const char *typename,
     return prop_list;
 }
 
-void qmp_object_add(QDict *qdict, QObject **ret_data, Error **errp)
+void qmp_object_add(ObjectOptions *options, Error **errp)
 {
-    user_creatable_add_dict(qdict, false, errp);
+    Visitor *v;
+    QObject *qobj;
+    QDict *props;
+    Object *obj;
+
+    v = qobject_output_visitor_new(&qobj);
+    visit_type_ObjectOptions(v, NULL, &options, &error_abort);
+    visit_complete(v, &qobj);
+    visit_free(v);
+
+    props = qobject_to(QDict, qobj);
+    qdict_del(props, "qom-type");
+    qdict_del(props, "id");
+
+    v = qobject_input_visitor_new(QOBJECT(props));
+    obj = user_creatable_add_type(ObjectType_str(options->qom_type),
+                                  options->id, props, v, errp);
+    object_unref(obj);
+    visit_free(v);
 }
 
 void qmp_object_del(const char *id, Error **errp)
-- 
2.28.0


