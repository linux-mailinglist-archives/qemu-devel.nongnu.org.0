Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9D5F339671
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 19:28:43 +0100 (CET)
Received: from localhost ([::1]:42982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKmWg-0002Tg-U4
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 13:28:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lKlhd-0001Od-A2
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 12:35:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28739)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lKlha-0005Mt-B9
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 12:35:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615570552;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tKH7xmuh938WOGxH1+eTJYP06sVPEO46iolmfeRSgn0=;
 b=Hh7KC7dluWIBs4jC9ZKSFY+lf5Qf/2eox3ONRBMB8dZgfCnCKzG+TMODRjQYAG7VW68B3V
 qQy+e49+6wPm19S84yqbUJvgk+orB8ntmtZCQHs10ETzYHR/Mjahl8kETY4z97xKRzi7LH
 cJCNxVLpA1asSYmUQsL0PkZljkGVl7E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-21-WglVXLIxNsyMF1TneD1I1w-1; Fri, 12 Mar 2021 12:35:50 -0500
X-MC-Unique: WglVXLIxNsyMF1TneD1I1w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7EA1B93925
 for <qemu-devel@nongnu.org>; Fri, 12 Mar 2021 17:35:49 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E940E5C1C5;
 Fri, 12 Mar 2021 17:35:48 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/3] qom: move user_creatable_add_opts logic to vl.c and
 QAPIfy it
Date: Fri, 12 Mar 2021 12:35:46 -0500
Message-Id: <20210312173547.1283477-3-pbonzini@redhat.com>
In-Reply-To: <20210312173547.1283477-1-pbonzini@redhat.com>
References: <20210312173547.1283477-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
Cc: kwolf@redhat.com, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Emulators are currently using OptsVisitor (via user_creatable_add_opts)
to parse the -object command line option.  This has one extra feature,
compared to keyval, which is automatic conversion of integers to lists
as well as support for lists as repeated options:

  -object memory-backend-ram,id=pc.ram,size=1048576000,host-nodes=0,policy=bind

So we cannot replace OptsVisitor with keyval right now.  Still, this
patch moves the user_creatable_add_opts logic to vl.c since it is
not needed anywhere else, and makes it go through user_creatable_add_qapi.

In order to minimize code changes, the predicate still takes a string.
This can be changed later to use the ObjectType QAPI enum directly.

Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 include/qom/object_interfaces.h | 47 ---------------------
 qom/object_interfaces.c         | 54 ------------------------
 softmmu/vl.c                    | 74 +++++++++++++++++++++++++--------
 3 files changed, 56 insertions(+), 119 deletions(-)

diff --git a/include/qom/object_interfaces.h b/include/qom/object_interfaces.h
index fb32330901..81541e2080 100644
--- a/include/qom/object_interfaces.h
+++ b/include/qom/object_interfaces.h
@@ -94,56 +94,9 @@ Object *user_creatable_add_type(const char *type, const char *id,
  *
  * Create an instance of the user creatable object according to the
  * options passed in @opts as described in the QAPI schema documentation.
- *
- * Returns: the newly created object or NULL on error
  */
 void user_creatable_add_qapi(ObjectOptions *options, Error **errp);
 
-/**
- * user_creatable_add_opts:
- * @opts: the object definition
- * @errp: if an error occurs, a pointer to an area to store the error
- *
- * Create an instance of the user creatable object whose type
- * is defined in @opts by the 'qom-type' option, placing it
- * in the object composition tree with name provided by the
- * 'id' field. The remaining options in @opts are used to
- * initialize the object properties.
- *
- * Returns: the newly created object or NULL on error
- */
-Object *user_creatable_add_opts(QemuOpts *opts, Error **errp);
-
-
-/**
- * user_creatable_add_opts_predicate:
- * @type: the QOM type to be added
- *
- * A callback function to determine whether an object
- * of type @type should be created. Instances of this
- * callback should be passed to user_creatable_add_opts_foreach
- */
-typedef bool (*user_creatable_add_opts_predicate)(const char *type);
-
-/**
- * user_creatable_add_opts_foreach:
- * @opaque: a user_creatable_add_opts_predicate callback or NULL
- * @opts: options to create
- * @errp: unused
- *
- * An iterator callback to be used in conjunction with
- * the qemu_opts_foreach() method for creating a list of
- * objects from a set of QemuOpts
- *
- * The @opaque parameter can be passed a user_creatable_add_opts_predicate
- * callback to filter which types of object are created during iteration.
- * When it fails, report the error.
- *
- * Returns: 0 on success, -1 when an error was reported.
- */
-int user_creatable_add_opts_foreach(void *opaque,
-                                    QemuOpts *opts, Error **errp);
-
 /**
  * user_creatable_parse_str:
  * @optarg: the object definition string as passed on the command line
diff --git a/qom/object_interfaces.c b/qom/object_interfaces.c
index 62d7db7629..7074040db1 100644
--- a/qom/object_interfaces.c
+++ b/qom/object_interfaces.c
@@ -140,60 +140,6 @@ void user_creatable_add_qapi(ObjectOptions *options, Error **errp)
     visit_free(v);
 }
 
-Object *user_creatable_add_opts(QemuOpts *opts, Error **errp)
-{
-    Visitor *v;
-    QDict *pdict;
-    Object *obj;
-    const char *id = qemu_opts_id(opts);
-    char *type = qemu_opt_get_del(opts, "qom-type");
-
-    if (!type) {
-        error_setg(errp, QERR_MISSING_PARAMETER, "qom-type");
-        return NULL;
-    }
-    if (!id) {
-        error_setg(errp, QERR_MISSING_PARAMETER, "id");
-        qemu_opt_set(opts, "qom-type", type, &error_abort);
-        g_free(type);
-        return NULL;
-    }
-
-    qemu_opts_set_id(opts, NULL);
-    pdict = qemu_opts_to_qdict(opts, NULL);
-
-    v = opts_visitor_new(opts);
-    obj = user_creatable_add_type(type, id, pdict, v, errp);
-    visit_free(v);
-
-    qemu_opts_set_id(opts, (char *) id);
-    qemu_opt_set(opts, "qom-type", type, &error_abort);
-    g_free(type);
-    qobject_unref(pdict);
-    return obj;
-}
-
-
-int user_creatable_add_opts_foreach(void *opaque, QemuOpts *opts, Error **errp)
-{
-    bool (*type_opt_predicate)(const char *, QemuOpts *) = opaque;
-    Object *obj = NULL;
-    const char *type;
-
-    type = qemu_opt_get(opts, "qom-type");
-    if (type && type_opt_predicate &&
-        !type_opt_predicate(type, opts)) {
-        return 0;
-    }
-
-    obj = user_creatable_add_opts(opts, errp);
-    if (!obj) {
-        return -1;
-    }
-    object_unref(obj);
-    return 0;
-}
-
 char *object_property_help(const char *name, const char *type,
                            QObject *defval, const char *description)
 {
diff --git a/softmmu/vl.c b/softmmu/vl.c
index ff488ea3e7..ae017de46c 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -117,6 +117,7 @@
 #include "qapi/qapi-commands-block-core.h"
 #include "qapi/qapi-commands-migration.h"
 #include "qapi/qapi-commands-misc.h"
+#include "qapi/qapi-visit-qom.h"
 #include "qapi/qapi-commands-ui.h"
 #include "qapi/qmp/qerror.h"
 #include "sysemu/iothread.h"
@@ -132,10 +133,16 @@ typedef struct BlockdevOptionsQueueEntry {
 
 typedef QSIMPLEQ_HEAD(, BlockdevOptionsQueueEntry) BlockdevOptionsQueue;
 
+typedef struct ObjectOption {
+    ObjectOptions *opts;
+    QTAILQ_ENTRY(ObjectOption) next;
+} ObjectOption;
+
 static const char *cpu_option;
 static const char *mem_path;
 static const char *incoming;
 static const char *loadvm;
+static QTAILQ_HEAD(, ObjectOption) object_opts = QTAILQ_HEAD_INITIALIZER(object_opts);
 static ram_addr_t maxram_size;
 static uint64_t ram_slots;
 static int display_remote;
@@ -1684,6 +1691,49 @@ static int machine_set_property(void *opaque,
     return object_parse_property_opt(opaque, name, value, "type", errp);
 }
 
+static void object_option_foreach_add(bool (*type_opt_predicate)(const char *))
+{
+    ObjectOption *opt, *next;
+
+    QTAILQ_FOREACH_SAFE(opt, &object_opts, next, next) {
+        const char *type = ObjectType_str(opt->opts->qom_type);
+        if (type_opt_predicate(type)) {
+            user_creatable_add_qapi(opt->opts, &error_fatal);
+            qapi_free_ObjectOptions(opt->opts);
+            QTAILQ_REMOVE(&object_opts, opt, next);
+        }
+    }
+}
+
+static void object_option_parse(const char *optarg)
+{
+    ObjectOption *opt;
+    QemuOpts *opts;
+    const char *type;
+    Visitor *v;
+
+    opts = qemu_opts_parse_noisily(qemu_find_opts("object"),
+                                   optarg, true);
+    if (!opts) {
+        exit(1);
+    }
+
+    type = qemu_opt_get(opts, "qom-type");
+    if (!type) {
+        error_setg(&error_fatal, QERR_MISSING_PARAMETER, "qom-type");
+    }
+    if (user_creatable_print_help(type, opts)) {
+        exit(0);
+    }
+
+    opt = g_new0(ObjectOption, 1);
+    v = opts_visitor_new(opts);
+    visit_type_ObjectOptions(v, NULL, &opt->opts, &error_fatal);
+    visit_free(v);
+
+    QTAILQ_INSERT_TAIL(&object_opts, opt, next);
+}
+
 /*
  * Initial object creation happens before all other
  * QEMU data types are created. The majority of objects
@@ -1691,12 +1741,8 @@ static int machine_set_property(void *opaque,
  * cannot be created here, as it depends on the chardev
  * already existing.
  */
-static bool object_create_early(const char *type, QemuOpts *opts)
+static bool object_create_early(const char *type)
 {
-    if (user_creatable_print_help(type, opts)) {
-        exit(0);
-    }
-
     /*
      * Objects should not be made "delayed" without a reason.  If you
      * add one, state the reason in a comment!
@@ -1815,9 +1861,7 @@ static void qemu_create_early_backends(void)
         exit(1);
     }
 
-    qemu_opts_foreach(qemu_find_opts("object"),
-                      user_creatable_add_opts_foreach,
-                      object_create_early, &error_fatal);
+    object_option_foreach_add(object_create_early);
 
     /* spice needs the timers to be initialized by this point */
     /* spice must initialize before audio as it changes the default auiodev */
@@ -1846,9 +1890,9 @@ static void qemu_create_early_backends(void)
  * The remainder of object creation happens after the
  * creation of chardev, fsdev, net clients and device data types.
  */
-static bool object_create_late(const char *type, QemuOpts *opts)
+static bool object_create_late(const char *type)
 {
-    return !object_create_early(type, opts);
+    return !object_create_early(type);
 }
 
 static void qemu_create_late_backends(void)
@@ -1859,9 +1903,7 @@ static void qemu_create_late_backends(void)
 
     net_init_clients(&error_fatal);
 
-    qemu_opts_foreach(qemu_find_opts("object"),
-                      user_creatable_add_opts_foreach,
-                      object_create_late, &error_fatal);
+    object_option_foreach_add(object_create_late);
 
     if (tpm_init() < 0) {
         exit(1);
@@ -3398,11 +3440,7 @@ void qemu_init(int argc, char **argv, char **envp)
 #endif
                 break;
             case QEMU_OPTION_object:
-                opts = qemu_opts_parse_noisily(qemu_find_opts("object"),
-                                               optarg, true);
-                if (!opts) {
-                    exit(1);
-                }
+                object_option_parse(optarg);
                 break;
             case QEMU_OPTION_overcommit:
                 opts = qemu_opts_parse_noisily(qemu_find_opts("overcommit"),
-- 
2.26.2



