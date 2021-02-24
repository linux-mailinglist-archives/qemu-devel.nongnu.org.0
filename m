Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE7B6323F5D
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 16:07:38 +0100 (CET)
Received: from localhost ([::1]:59166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEvlJ-0001ux-U8
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 10:07:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lEvQa-00026Y-Fu
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 09:46:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23180)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lEvQY-0003aw-0F
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 09:46:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614177969;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gXKPVrh+jgfeYVb1XMNU0rRTCPP0Mh1UYn9crCAR9qA=;
 b=Y7VCtzhGpYPbVUmZfWJwQ0HTeIujqzPUDLdYi9waMDIy807mAzg04jRf83U4zRak2WYh+t
 mi2Y2m7nfMxIW8O8fntIj4EpUl8Ap5U+0+wvbL4aZQFPzHGCxAQhOiWvQIAeLJuDmCT3Uf
 7ECt8WN4vpWsP4nPH8ZdQsl/3YtVgxw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-13-uk5i3W6POA-kg0JWS4zQuQ-1; Wed, 24 Feb 2021 09:46:07 -0500
X-MC-Unique: uk5i3W6POA-kg0JWS4zQuQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1C61D1081DAD;
 Wed, 24 Feb 2021 13:56:05 +0000 (UTC)
Received: from merkur.redhat.com (ovpn-114-142.ams2.redhat.com [10.36.114.142])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 15AC25D6D3;
 Wed, 24 Feb 2021 13:56:00 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 23/31] qom: Factor out user_creatable_process_cmdline()
Date: Wed, 24 Feb 2021 14:52:47 +0100
Message-Id: <20210224135255.253837-24-kwolf@redhat.com>
In-Reply-To: <20210224135255.253837-1-kwolf@redhat.com>
References: <20210224135255.253837-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 mreitz@redhat.com, kraxel@redhat.com, pbonzini@redhat.com, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The implementation for --object can be shared between
qemu-storage-daemon and other binaries, so move it into a function in
qom/object_interfaces.c that is accessible from everywhere.

This also requires moving the implementation of qmp_object_add() into a
new user_creatable_add_qapi(), because qom/qom-qmp-cmds.c is not linked
for tools.

user_creatable_print_help_from_qdict() can become static now.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 include/qom/object_interfaces.h      | 41 +++++++++++++++--------
 qom/object_interfaces.c              | 50 +++++++++++++++++++++++++++-
 qom/qom-qmp-cmds.c                   | 20 +----------
 storage-daemon/qemu-storage-daemon.c | 22 +-----------
 4 files changed, 79 insertions(+), 54 deletions(-)

diff --git a/include/qom/object_interfaces.h b/include/qom/object_interfaces.h
index 5299603f50..1e6c51b541 100644
--- a/include/qom/object_interfaces.h
+++ b/include/qom/object_interfaces.h
@@ -2,6 +2,7 @@
 #define OBJECT_INTERFACES_H
 
 #include "qom/object.h"
+#include "qapi/qapi-types-qom.h"
 #include "qapi/visitor.h"
 
 #define TYPE_USER_CREATABLE "user-creatable"
@@ -86,6 +87,18 @@ Object *user_creatable_add_type(const char *type, const char *id,
                                 const QDict *qdict,
                                 Visitor *v, Error **errp);
 
+/**
+ * user_creatable_add_qapi:
+ * @options: the object definition
+ * @errp: if an error occurs, a pointer to an area to store the error
+ *
+ * Create an instance of the user creatable object according to the
+ * options passed in @opts as described in the QAPI schema documentation.
+ *
+ * Returns: the newly created object or NULL on error
+ */
+void user_creatable_add_qapi(ObjectOptions *options, Error **errp);
+
 /**
  * user_creatable_add_opts:
  * @opts: the object definition
@@ -131,6 +144,21 @@ typedef bool (*user_creatable_add_opts_predicate)(const char *type);
 int user_creatable_add_opts_foreach(void *opaque,
                                     QemuOpts *opts, Error **errp);
 
+/**
+ * user_creatable_process_cmdline:
+ * @optarg: the object definition string as passed on the command line
+ *
+ * Create an instance of the user creatable object by parsing optarg
+ * with a keyval parser and implicit key 'qom-type', converting the
+ * result to ObjectOptions and calling into qmp_object_add().
+ *
+ * If a help option is given, print help instead and exit.
+ *
+ * This function is only meant to be called during command line parsing.
+ * It exits the process on failure or after printing help.
+ */
+void user_creatable_process_cmdline(const char *optarg);
+
 /**
  * user_creatable_print_help:
  * @type: the QOM type to be added
@@ -145,19 +173,6 @@ int user_creatable_add_opts_foreach(void *opaque,
  */
 bool user_creatable_print_help(const char *type, QemuOpts *opts);
 
-/**
- * user_creatable_print_help_from_qdict:
- * @args: options to create
- *
- * Prints help considering the other options given in @args (if "qom-type" is
- * given and valid, print properties for the type, otherwise print valid types)
- *
- * In contrast to user_creatable_print_help(), this function can't return that
- * no help was requested. It should only be called if we know that help is
- * requested and it will always print some help.
- */
-void user_creatable_print_help_from_qdict(QDict *args);
-
 /**
  * user_creatable_del:
  * @id: the unique ID for the object
diff --git a/qom/object_interfaces.c b/qom/object_interfaces.c
index 7d8a4b77b8..efb48249d5 100644
--- a/qom/object_interfaces.c
+++ b/qom/object_interfaces.c
@@ -2,10 +2,13 @@
 
 #include "qemu/cutils.h"
 #include "qapi/error.h"
+#include "qapi/qapi-commands-qom.h"
+#include "qapi/qapi-visit-qom.h"
 #include "qapi/qmp/qdict.h"
 #include "qapi/qmp/qerror.h"
 #include "qapi/qmp/qjson.h"
 #include "qapi/qobject-input-visitor.h"
+#include "qapi/qobject-output-visitor.h"
 #include "qom/object_interfaces.h"
 #include "qemu/help_option.h"
 #include "qemu/module.h"
@@ -104,6 +107,29 @@ out:
     return obj;
 }
 
+void user_creatable_add_qapi(ObjectOptions *options, Error **errp)
+{
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
+}
+
 Object *user_creatable_add_opts(QemuOpts *opts, Error **errp)
 {
     Visitor *v;
@@ -247,7 +273,7 @@ bool user_creatable_print_help(const char *type, QemuOpts *opts)
     return false;
 }
 
-void user_creatable_print_help_from_qdict(QDict *args)
+static void user_creatable_print_help_from_qdict(QDict *args)
 {
     const char *type = qdict_get_try_str(args, "qom-type");
 
@@ -256,6 +282,28 @@ void user_creatable_print_help_from_qdict(QDict *args)
     }
 }
 
+void user_creatable_process_cmdline(const char *optarg)
+{
+    QDict *args;
+    bool help;
+    Visitor *v;
+    ObjectOptions *options;
+
+    args = keyval_parse(optarg, "qom-type", &help, &error_fatal);
+    if (help) {
+        user_creatable_print_help_from_qdict(args);
+        exit(EXIT_SUCCESS);
+    }
+
+    v = qobject_input_visitor_new_keyval(QOBJECT(args));
+    visit_type_ObjectOptions(v, NULL, &options, &error_fatal);
+    visit_free(v);
+    qobject_unref(args);
+
+    user_creatable_add_qapi(options, &error_fatal);
+    qapi_free_ObjectOptions(options);
+}
+
 bool user_creatable_del(const char *id, Error **errp)
 {
     QemuOptsList *opts_list;
diff --git a/qom/qom-qmp-cmds.c b/qom/qom-qmp-cmds.c
index e577a96adf..2d6f41ecc7 100644
--- a/qom/qom-qmp-cmds.c
+++ b/qom/qom-qmp-cmds.c
@@ -228,25 +228,7 @@ ObjectPropertyInfoList *qmp_qom_list_properties(const char *typename,
 
 void qmp_object_add(ObjectOptions *options, Error **errp)
 {
-    Visitor *v;
-    QObject *qobj;
-    QDict *props;
-    Object *obj;
-
-    v = qobject_output_visitor_new(&qobj);
-    visit_type_ObjectOptions(v, NULL, &options, &error_abort);
-    visit_complete(v, &qobj);
-    visit_free(v);
-
-    props = qobject_to(QDict, qobj);
-    qdict_del(props, "qom-type");
-    qdict_del(props, "id");
-
-    v = qobject_input_visitor_new(QOBJECT(props));
-    obj = user_creatable_add_type(ObjectType_str(options->qom_type),
-                                  options->id, props, v, errp);
-    object_unref(obj);
-    visit_free(v);
+    user_creatable_add_qapi(options, errp);
 }
 
 void qmp_object_del(const char *id, Error **errp)
diff --git a/storage-daemon/qemu-storage-daemon.c b/storage-daemon/qemu-storage-daemon.c
index 0dfb9c1448..32b59878a7 100644
--- a/storage-daemon/qemu-storage-daemon.c
+++ b/storage-daemon/qemu-storage-daemon.c
@@ -38,7 +38,6 @@
 #include "qapi/qapi-visit-block-core.h"
 #include "qapi/qapi-visit-block-export.h"
 #include "qapi/qapi-visit-control.h"
-#include "qapi/qapi-visit-qom.h"
 #include "qapi/qmp/qdict.h"
 #include "qapi/qmp/qstring.h"
 #include "qapi/qobject-input-visitor.h"
@@ -252,27 +251,8 @@ static void process_options(int argc, char *argv[])
                 break;
             }
         case OPTION_OBJECT:
-            {
-                QDict *args;
-                bool help;
-                Visitor *v;
-                ObjectOptions *options;
-
-                args = keyval_parse(optarg, "qom-type", &help, &error_fatal);
-                if (help) {
-                    user_creatable_print_help_from_qdict(args);
-                    exit(EXIT_SUCCESS);
-                }
-
-                v = qobject_input_visitor_new_keyval(QOBJECT(args));
-                visit_type_ObjectOptions(v, NULL, &options, &error_fatal);
-                visit_free(v);
-                qobject_unref(args);
-
-                qmp_object_add(options, &error_fatal);
-                qapi_free_ObjectOptions(options);
+                user_creatable_process_cmdline(optarg);
                 break;
-            }
         default:
             g_assert_not_reached();
         }
-- 
2.29.2


