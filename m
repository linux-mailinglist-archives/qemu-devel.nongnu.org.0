Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B87DB340A7A
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 17:48:00 +0100 (CET)
Received: from localhost ([::1]:45824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMvoV-0007Br-JS
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 12:47:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lMvfE-00025D-DF
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 12:38:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58226)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lMvez-00032y-3F
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 12:38:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616085486;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=n/vFqUmTOHZzF+7y5NPMA8AFAt1xC7VB2wYUgbMXIcM=;
 b=XckdAn7HmCFAAOOJZPOKAJJtsHkl7mA74749EBF14L2H5ADuKYwrZqOhHDpfT43y+g8q4m
 rLj/QCraiHpO7gwfpdNG6uPokPyttsIatxfhoF4Wb/66cVxlzscklTqSTzRrafJACpFy/h
 g5wCgXySZ4Q+qHQMPJHvBLKvir/mUx0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-20-Dsp2JUnCNcmzTAghiGHoEg-1; Thu, 18 Mar 2021 12:38:01 -0400
X-MC-Unique: Dsp2JUnCNcmzTAghiGHoEg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4ED5780006E;
 Thu, 18 Mar 2021 16:38:00 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-83.phx2.redhat.com
 [10.3.112.83])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C4F7660CD7;
 Thu, 18 Mar 2021 16:37:59 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 3CB0B1138613; Thu, 18 Mar 2021 17:37:57 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 03/11] qapi: Implement deprecated-output=hide for QMP
 command results
Date: Thu, 18 Mar 2021 17:37:49 +0100
Message-Id: <20210318163757.1345341-4-armbru@redhat.com>
In-Reply-To: <20210318163757.1345341-1-armbru@redhat.com>
References: <20210318163757.1345341-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

This policy suppresses deprecated bits in output, and thus permits
"testing the future".  Implement it for QMP command results.  Example:
when QEMU is run with -compat deprecated-output=hide, then

    {"execute": "query-cpus-fast"}

yields

    {"return": [{"thread-id": 9805, "props": {"core-id": 0, "thread-id": 0, "socket-id": 0}, "qom-path": "/machine/unattached/device[0]", "cpu-index": 0, "target": "x86_64"}]}

instead of

    {"return": [{"arch": "x86", "thread-id": 22436, "props": {"core-id": 0, "thread-id": 0, "socket-id": 0}, "qom-path": "/machine/unattached/device[0]", "cpu-index": 0, "target": "x86_64"}]}

Note the suppression of deprecated member "arch".

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Message-Id: <20210318155519.1224118-4-armbru@redhat.com>
---
 include/qapi/compat-policy.h            |  9 ++++++
 include/qapi/qobject-output-visitor.h   |  4 +++
 include/qapi/visitor-impl.h             |  3 ++
 include/qapi/visitor.h                  |  9 ++++++
 qapi/qapi-visit-core.c                  |  9 ++++++
 qapi/qmp-dispatch.c                     |  9 ++++++
 qapi/qobject-output-visitor.c           | 19 +++++++++++
 tests/unit/test-qmp-cmds.c              | 42 ++++++++++++++++++++++---
 qapi/trace-events                       |  1 +
 scripts/qapi/commands.py                |  4 +--
 scripts/qapi/visit.py                   | 12 +++++++
 tests/qapi-schema/qapi-schema-test.json | 17 +++++-----
 tests/qapi-schema/qapi-schema-test.out  | 18 +++++------
 13 files changed, 132 insertions(+), 24 deletions(-)

diff --git a/include/qapi/compat-policy.h b/include/qapi/compat-policy.h
index b8c6638156..94c8bbd790 100644
--- a/include/qapi/compat-policy.h
+++ b/include/qapi/compat-policy.h
@@ -17,4 +17,13 @@
 
 extern CompatPolicy compat_policy;
 
+/*
+ * Create a QObject output visitor for @obj for use with QMP
+ *
+ * This is like qobject_output_visitor_new(), except it obeys the
+ * policy for handling deprecated management interfaces set with
+ * -compat.
+ */
+Visitor *qobject_output_visitor_new_qmp(QObject **result);
+
 #endif
diff --git a/include/qapi/qobject-output-visitor.h b/include/qapi/qobject-output-visitor.h
index 2b1726baf5..f2a2f92a00 100644
--- a/include/qapi/qobject-output-visitor.h
+++ b/include/qapi/qobject-output-visitor.h
@@ -15,6 +15,7 @@
 #define QOBJECT_OUTPUT_VISITOR_H
 
 #include "qapi/visitor.h"
+#include "qapi/qapi-types-compat.h"
 
 typedef struct QObjectOutputVisitor QObjectOutputVisitor;
 
@@ -53,4 +54,7 @@ typedef struct QObjectOutputVisitor QObjectOutputVisitor;
  */
 Visitor *qobject_output_visitor_new(QObject **result);
 
+void qobject_output_visitor_set_policy(Visitor *v,
+                                       CompatPolicyOutput deprecated);
+
 #endif
diff --git a/include/qapi/visitor-impl.h b/include/qapi/visitor-impl.h
index 7362c043be..2d853255a3 100644
--- a/include/qapi/visitor-impl.h
+++ b/include/qapi/visitor-impl.h
@@ -113,6 +113,9 @@ struct Visitor
        The core takes care of the return type in the public interface. */
     void (*optional)(Visitor *v, const char *name, bool *present);
 
+    /* Optional */
+    bool (*deprecated)(Visitor *v, const char *name);
+
     /* Must be set */
     VisitorType type;
 
diff --git a/include/qapi/visitor.h b/include/qapi/visitor.h
index ebc19ede7f..4d23b59853 100644
--- a/include/qapi/visitor.h
+++ b/include/qapi/visitor.h
@@ -459,6 +459,15 @@ void visit_end_alternate(Visitor *v, void **obj);
  */
 bool visit_optional(Visitor *v, const char *name, bool *present);
 
+/*
+ * Should we visit deprecated member @name?
+ *
+ * @name must not be NULL.  This function is only useful between
+ * visit_start_struct() and visit_end_struct(), since only objects
+ * have deprecated members.
+ */
+bool visit_deprecated(Visitor *v, const char *name);
+
 /*
  * Visit an enum value.
  *
diff --git a/qapi/qapi-visit-core.c b/qapi/qapi-visit-core.c
index 7e5f40e7f0..d9726ecaa1 100644
--- a/qapi/qapi-visit-core.c
+++ b/qapi/qapi-visit-core.c
@@ -135,6 +135,15 @@ bool visit_optional(Visitor *v, const char *name, bool *present)
     return *present;
 }
 
+bool visit_deprecated(Visitor *v, const char *name)
+{
+    trace_visit_deprecated(v, name);
+    if (v->deprecated) {
+        return v->deprecated(v, name);
+    }
+    return true;
+}
+
 bool visit_is_input(Visitor *v)
 {
     return v->type == VISITOR_INPUT;
diff --git a/qapi/qmp-dispatch.c b/qapi/qmp-dispatch.c
index 45090f881a..68501bed29 100644
--- a/qapi/qmp-dispatch.c
+++ b/qapi/qmp-dispatch.c
@@ -19,6 +19,7 @@
 #include "qapi/qmp/dispatch.h"
 #include "qapi/qmp/qdict.h"
 #include "qapi/qmp/qjson.h"
+#include "qapi/qobject-output-visitor.h"
 #include "sysemu/runstate.h"
 #include "qapi/qmp/qbool.h"
 #include "qemu/coroutine.h"
@@ -26,6 +27,14 @@
 
 CompatPolicy compat_policy;
 
+Visitor *qobject_output_visitor_new_qmp(QObject **result)
+{
+    Visitor *v = qobject_output_visitor_new(result);
+
+    qobject_output_visitor_set_policy(v, compat_policy.deprecated_output);
+    return v;
+}
+
 static QDict *qmp_dispatch_check_obj(QDict *dict, bool allow_oob,
                                      Error **errp)
 {
diff --git a/qapi/qobject-output-visitor.c b/qapi/qobject-output-visitor.c
index ba6f6ac8a7..e4873308d4 100644
--- a/qapi/qobject-output-visitor.c
+++ b/qapi/qobject-output-visitor.c
@@ -13,6 +13,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qapi/compat-policy.h"
 #include "qapi/qobject-output-visitor.h"
 #include "qapi/visitor-impl.h"
 #include "qemu/queue.h"
@@ -31,6 +32,8 @@ typedef struct QStackEntry {
 
 struct QObjectOutputVisitor {
     Visitor visitor;
+    CompatPolicyOutput deprecated_policy;
+
     QSLIST_HEAD(, QStackEntry) stack; /* Stack of unfinished containers */
     QObject *root; /* Root of the output visit */
     QObject **result; /* User's storage location for result */
@@ -207,6 +210,13 @@ static bool qobject_output_type_null(Visitor *v, const char *name,
     return true;
 }
 
+static bool qobject_output_deprecated(Visitor *v, const char *name)
+{
+    QObjectOutputVisitor *qov = to_qov(v);
+
+    return qov->deprecated_policy != COMPAT_POLICY_OUTPUT_HIDE;
+}
+
 /* Finish building, and return the root object.
  * The root object is never null. The caller becomes the object's
  * owner, and should use qobject_unref() when done with it.  */
@@ -256,6 +266,7 @@ Visitor *qobject_output_visitor_new(QObject **result)
     v->visitor.type_number = qobject_output_type_number;
     v->visitor.type_any = qobject_output_type_any;
     v->visitor.type_null = qobject_output_type_null;
+    v->visitor.deprecated = qobject_output_deprecated;
     v->visitor.complete = qobject_output_complete;
     v->visitor.free = qobject_output_free;
 
@@ -264,3 +275,11 @@ Visitor *qobject_output_visitor_new(QObject **result)
 
     return &v->visitor;
 }
+
+void qobject_output_visitor_set_policy(Visitor *v,
+                                       CompatPolicyOutput deprecated)
+{
+    QObjectOutputVisitor *qov = to_qov(v);
+
+    qov->deprecated_policy = deprecated;
+}
diff --git a/tests/unit/test-qmp-cmds.c b/tests/unit/test-qmp-cmds.c
index d3413bfef0..1079d35122 100644
--- a/tests/unit/test-qmp-cmds.c
+++ b/tests/unit/test-qmp-cmds.c
@@ -1,4 +1,5 @@
 #include "qemu/osdep.h"
+#include "qapi/compat-policy.h"
 #include "qapi/qmp/qdict.h"
 #include "qapi/qmp/qjson.h"
 #include "qapi/qmp/qnum.h"
@@ -49,12 +50,17 @@ void qmp_user_def_cmd1(UserDefOne * ud1, Error **errp)
 {
 }
 
-void qmp_test_features0(FeatureStruct0 *fs0, FeatureStruct1 *fs1,
-                       FeatureStruct2 *fs2, FeatureStruct3 *fs3,
-                       FeatureStruct4 *fs4, CondFeatureStruct1 *cfs1,
-                       CondFeatureStruct2 *cfs2, CondFeatureStruct3 *cfs3,
-                       Error **errp)
+FeatureStruct1 *qmp_test_features0(bool has_fs0, FeatureStruct0 *fs0,
+                                   bool has_fs1, FeatureStruct1 *fs1,
+                                   bool has_fs2, FeatureStruct2 *fs2,
+                                   bool has_fs3, FeatureStruct3 *fs3,
+                                   bool has_fs4, FeatureStruct4 *fs4,
+                                   bool has_cfs1, CondFeatureStruct1 *cfs1,
+                                   bool has_cfs2, CondFeatureStruct2 *cfs2,
+                                   bool has_cfs3, CondFeatureStruct3 *cfs3,
+                                   Error **errp)
 {
+    return g_new0(FeatureStruct1, 1);
 }
 
 void qmp_test_command_features1(Error **errp)
@@ -275,6 +281,30 @@ static void test_dispatch_cmd_io(void)
     qobject_unref(ret3);
 }
 
+static void test_dispatch_cmd_ret_deprecated(void)
+{
+    const char *cmd = "{ 'execute': 'test-features0' }";
+    QDict *ret;
+
+    memset(&compat_policy, 0, sizeof(compat_policy));
+
+    /* default accept */
+    ret = qobject_to(QDict, do_qmp_dispatch(false, cmd));
+    assert(ret && qdict_size(ret) == 1);
+    qobject_unref(ret);
+
+    compat_policy.has_deprecated_output = true;
+    compat_policy.deprecated_output = COMPAT_POLICY_OUTPUT_ACCEPT;
+    ret = qobject_to(QDict, do_qmp_dispatch(false, cmd));
+    assert(ret && qdict_size(ret) == 1);
+    qobject_unref(ret);
+
+    compat_policy.deprecated_output = COMPAT_POLICY_OUTPUT_HIDE;
+    ret = qobject_to(QDict, do_qmp_dispatch(false, cmd));
+    assert(ret && qdict_size(ret) == 0);
+    qobject_unref(ret);
+}
+
 /* test generated dealloc functions for generated types */
 static void test_dealloc_types(void)
 {
@@ -349,6 +379,8 @@ int main(int argc, char **argv)
     g_test_add_func("/qmp/dispatch_cmd_io", test_dispatch_cmd_io);
     g_test_add_func("/qmp/dispatch_cmd_success_response",
                     test_dispatch_cmd_success_response);
+    g_test_add_func("/qmp/dispatch_cmd_ret_deprecated",
+                    test_dispatch_cmd_ret_deprecated);
     g_test_add_func("/qmp/dealloc_types", test_dealloc_types);
     g_test_add_func("/qmp/dealloc_partial", test_dealloc_partial);
 
diff --git a/qapi/trace-events b/qapi/trace-events
index 5eb4afa110..eff1fbd199 100644
--- a/qapi/trace-events
+++ b/qapi/trace-events
@@ -17,6 +17,7 @@ visit_start_alternate(void *v, const char *name, void *obj, size_t size) "v=%p n
 visit_end_alternate(void *v, void *obj) "v=%p obj=%p"
 
 visit_optional(void *v, const char *name, bool *present) "v=%p name=%s present=%p"
+visit_deprecated(void *v, const char *name) "v=%p name=%s"
 
 visit_type_enum(void *v, const char *name, int *obj) "v=%p name=%s obj=%p"
 visit_type_int(void *v, const char *name, int64_t *obj) "v=%p name=%s obj=%p"
diff --git a/scripts/qapi/commands.py b/scripts/qapi/commands.py
index 0a75a9371b..b7e577a5d1 100644
--- a/scripts/qapi/commands.py
+++ b/scripts/qapi/commands.py
@@ -96,7 +96,7 @@ def gen_marshal_output(ret_type: QAPISchemaType) -> str:
 {
     Visitor *v;
 
-    v = qobject_output_visitor_new(ret_out);
+    v = qobject_output_visitor_new_qmp(ret_out);
     if (visit_type_%(c_name)s(v, "unused", &ret_in, errp)) {
         visit_complete(v, ret_out);
     }
@@ -251,9 +251,9 @@ def _begin_user_module(self, name: str) -> None:
         visit = self._module_basename('qapi-visit', name)
         self._genc.add(mcgen('''
 #include "qemu/osdep.h"
+#include "qapi/compat-policy.h"
 #include "qapi/visitor.h"
 #include "qapi/qmp/qdict.h"
-#include "qapi/qobject-output-visitor.h"
 #include "qapi/qobject-input-visitor.h"
 #include "qapi/dealloc-visitor.h"
 #include "qapi/error.h"
diff --git a/scripts/qapi/visit.py b/scripts/qapi/visit.py
index 9aa0b1e11e..9d83bf650f 100644
--- a/scripts/qapi/visit.py
+++ b/scripts/qapi/visit.py
@@ -77,6 +77,7 @@ def gen_visit_object_members(name: str,
                      c_type=base.c_name())
 
     for memb in members:
+        deprecated = 'deprecated' in [f.name for f in memb.features]
         ret += gen_if(memb.ifcond)
         if memb.optional:
             ret += mcgen('''
@@ -84,6 +85,12 @@ def gen_visit_object_members(name: str,
 ''',
                          name=memb.name, c_name=c_name(memb.name))
             indent.increase()
+        if deprecated:
+            ret += mcgen('''
+    if (visit_deprecated(v, "%(name)s")) {
+''',
+                         name=memb.name)
+            indent.increase()
         ret += mcgen('''
     if (!visit_type_%(c_type)s(v, "%(name)s", &obj->%(c_name)s, errp)) {
         return false;
@@ -91,6 +98,11 @@ def gen_visit_object_members(name: str,
 ''',
                      c_type=memb.type.c_name(), name=memb.name,
                      c_name=c_name(memb.name))
+        if deprecated:
+            indent.decrease()
+            ret += mcgen('''
+    }
+''')
         if memb.optional:
             indent.decrease()
             ret += mcgen('''
diff --git a/tests/qapi-schema/qapi-schema-test.json b/tests/qapi-schema/qapi-schema-test.json
index 63f92adf68..48a0adabae 100644
--- a/tests/qapi-schema/qapi-schema-test.json
+++ b/tests/qapi-schema/qapi-schema-test.json
@@ -299,14 +299,15 @@
   'features': [ 'feature1' ] }
 
 { 'command': 'test-features0',
-  'data': { 'fs0': 'FeatureStruct0',
-            'fs1': 'FeatureStruct1',
-            'fs2': 'FeatureStruct2',
-            'fs3': 'FeatureStruct3',
-            'fs4': 'FeatureStruct4',
-            'cfs1': 'CondFeatureStruct1',
-            'cfs2': 'CondFeatureStruct2',
-            'cfs3': 'CondFeatureStruct3' },
+  'data': { '*fs0': 'FeatureStruct0',
+            '*fs1': 'FeatureStruct1',
+            '*fs2': 'FeatureStruct2',
+            '*fs3': 'FeatureStruct3',
+            '*fs4': 'FeatureStruct4',
+            '*cfs1': 'CondFeatureStruct1',
+            '*cfs2': 'CondFeatureStruct2',
+            '*cfs3': 'CondFeatureStruct3' },
+  'returns': 'FeatureStruct1',
   'features': [] }
 
 { 'command': 'test-command-features1',
diff --git a/tests/qapi-schema/qapi-schema-test.out b/tests/qapi-schema/qapi-schema-test.out
index 3b1387d9f1..776d737891 100644
--- a/tests/qapi-schema/qapi-schema-test.out
+++ b/tests/qapi-schema/qapi-schema-test.out
@@ -409,15 +409,15 @@ alternate FeatureAlternate1
     case eins: FeatureStruct1
     feature feature1
 object q_obj_test-features0-arg
-    member fs0: FeatureStruct0 optional=False
-    member fs1: FeatureStruct1 optional=False
-    member fs2: FeatureStruct2 optional=False
-    member fs3: FeatureStruct3 optional=False
-    member fs4: FeatureStruct4 optional=False
-    member cfs1: CondFeatureStruct1 optional=False
-    member cfs2: CondFeatureStruct2 optional=False
-    member cfs3: CondFeatureStruct3 optional=False
-command test-features0 q_obj_test-features0-arg -> None
+    member fs0: FeatureStruct0 optional=True
+    member fs1: FeatureStruct1 optional=True
+    member fs2: FeatureStruct2 optional=True
+    member fs3: FeatureStruct3 optional=True
+    member fs4: FeatureStruct4 optional=True
+    member cfs1: CondFeatureStruct1 optional=True
+    member cfs2: CondFeatureStruct2 optional=True
+    member cfs3: CondFeatureStruct3 optional=True
+command test-features0 q_obj_test-features0-arg -> FeatureStruct1
     gen=True success_response=True boxed=False oob=False preconfig=False
 command test-command-features1 None -> None
     gen=True success_response=True boxed=False oob=False preconfig=False
-- 
2.26.3


