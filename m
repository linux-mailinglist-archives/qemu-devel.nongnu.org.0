Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 133E3340B80
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 18:17:23 +0100 (CET)
Received: from localhost ([::1]:44992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMwGw-0006ep-4Q
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 13:17:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lMvfR-00029P-Ot
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 12:38:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34177)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lMvfB-000343-Dx
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 12:38:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616085488;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=peSX3QakEb+051wXOskZvU8DkB1TFqRGwdUIc8XIBpE=;
 b=RqoPFldJBrNmgkbpXRVArb69wSpLbo4wSQiUzMrjJc/L3eylLPIKLB1L2DjlwYDPuXt7Na
 sQ5rlLGZBBHC1oKXVL5fXtQwN/CR2UN4QEJVGM0AX1Ivx2OuwtcWSDbW/q5BLNIKeTkt0D
 8DV/ZB8GzN0KRz1pCtc5vWxngvxmX9U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-154-BmGjQgEvPw6xvRE50jP7Zg-1; Thu, 18 Mar 2021 12:38:05 -0400
X-MC-Unique: BmGjQgEvPw6xvRE50jP7Zg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 520801922965;
 Thu, 18 Mar 2021 16:38:04 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-83.phx2.redhat.com
 [10.3.112.83])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EE3B45C1D1;
 Thu, 18 Mar 2021 16:38:03 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 538FB11384AA; Thu, 18 Mar 2021 17:37:57 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 10/11] qapi: Implement deprecated-input=reject for QMP
 command arguments
Date: Thu, 18 Mar 2021 17:37:56 +0100
Message-Id: <20210318163757.1345341-11-armbru@redhat.com>
In-Reply-To: <20210318163757.1345341-1-armbru@redhat.com>
References: <20210318163757.1345341-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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

This policy rejects deprecated input, and thus permits "testing the
future".  Implement it for QMP command arguments: reject commands with
deprecated ones.  Example: when QEMU is run with -compat
deprecated-input=reject, then

    {"execute": "eject", "arguments": {"device": "cd"}}

fails like this

    {"error": {"class": "GenericError", "desc": "Deprecated parameter 'device' disabled by policy"}}

When the deprecated parameter is removed, the error will change to

    {"error": {"class": "GenericError", "desc": "Parameter 'device' is unexpected"}}

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Message-Id: <20210318155519.1224118-11-armbru@redhat.com>
---
 include/qapi/compat-policy.h         |  9 +++++++++
 include/qapi/qobject-input-visitor.h |  4 ++++
 include/qapi/visitor-impl.h          |  3 +++
 include/qapi/visitor.h               |  9 +++++++++
 qapi/qapi-visit-core.c               |  9 +++++++++
 qapi/qmp-dispatch.c                  |  9 +++++++++
 qapi/qobject-input-visitor.c         | 28 ++++++++++++++++++++++++++++
 tests/unit/test-qmp-cmds.c           | 25 +++++++++++++++++++++++++
 qapi/trace-events                    |  1 +
 scripts/qapi/commands.py             |  3 +--
 scripts/qapi/visit.py                |  3 +++
 11 files changed, 101 insertions(+), 2 deletions(-)

diff --git a/include/qapi/compat-policy.h b/include/qapi/compat-policy.h
index 94c8bbd790..1083f95122 100644
--- a/include/qapi/compat-policy.h
+++ b/include/qapi/compat-policy.h
@@ -17,6 +17,15 @@
 
 extern CompatPolicy compat_policy;
 
+/*
+ * Create a QObject input visitor for @obj for use with QMP
+ *
+ * This is like qobject_input_visitor_new(), except it obeys the
+ * policy for handling deprecated management interfaces set with
+ * -compat.
+ */
+Visitor *qobject_input_visitor_new_qmp(QObject *obj);
+
 /*
  * Create a QObject output visitor for @obj for use with QMP
  *
diff --git a/include/qapi/qobject-input-visitor.h b/include/qapi/qobject-input-visitor.h
index 95985e25e5..8d69388810 100644
--- a/include/qapi/qobject-input-visitor.h
+++ b/include/qapi/qobject-input-visitor.h
@@ -15,6 +15,7 @@
 #ifndef QOBJECT_INPUT_VISITOR_H
 #define QOBJECT_INPUT_VISITOR_H
 
+#include "qapi/qapi-types-compat.h"
 #include "qapi/visitor.h"
 
 typedef struct QObjectInputVisitor QObjectInputVisitor;
@@ -58,6 +59,9 @@ typedef struct QObjectInputVisitor QObjectInputVisitor;
  */
 Visitor *qobject_input_visitor_new(QObject *obj);
 
+void qobject_input_visitor_set_policy(Visitor *v,
+                                      CompatPolicyInput deprecated);
+
 /*
  * Create a QObject input visitor for @obj for use with keyval_parse()
  *
diff --git a/include/qapi/visitor-impl.h b/include/qapi/visitor-impl.h
index 2d853255a3..3b950f6e3d 100644
--- a/include/qapi/visitor-impl.h
+++ b/include/qapi/visitor-impl.h
@@ -113,6 +113,9 @@ struct Visitor
        The core takes care of the return type in the public interface. */
     void (*optional)(Visitor *v, const char *name, bool *present);
 
+    /* Optional */
+    bool (*deprecated_accept)(Visitor *v, const char *name, Error **errp);
+
     /* Optional */
     bool (*deprecated)(Visitor *v, const char *name);
 
diff --git a/include/qapi/visitor.h b/include/qapi/visitor.h
index 4d23b59853..b3c9ef7a81 100644
--- a/include/qapi/visitor.h
+++ b/include/qapi/visitor.h
@@ -459,6 +459,15 @@ void visit_end_alternate(Visitor *v, void **obj);
  */
 bool visit_optional(Visitor *v, const char *name, bool *present);
 
+/*
+ * Should we reject deprecated member @name?
+ *
+ * @name must not be NULL.  This function is only useful between
+ * visit_start_struct() and visit_end_struct(), since only objects
+ * have deprecated members.
+ */
+bool visit_deprecated_accept(Visitor *v, const char *name, Error **errp);
+
 /*
  * Should we visit deprecated member @name?
  *
diff --git a/qapi/qapi-visit-core.c b/qapi/qapi-visit-core.c
index d9726ecaa1..a641adec51 100644
--- a/qapi/qapi-visit-core.c
+++ b/qapi/qapi-visit-core.c
@@ -135,6 +135,15 @@ bool visit_optional(Visitor *v, const char *name, bool *present)
     return *present;
 }
 
+bool visit_deprecated_accept(Visitor *v, const char *name, Error **errp)
+{
+    trace_visit_deprecated_accept(v, name);
+    if (v->deprecated_accept) {
+        return v->deprecated_accept(v, name, errp);
+    }
+    return true;
+}
+
 bool visit_deprecated(Visitor *v, const char *name)
 {
     trace_visit_deprecated(v, name);
diff --git a/qapi/qmp-dispatch.c b/qapi/qmp-dispatch.c
index 1e3325ec02..174ebf2793 100644
--- a/qapi/qmp-dispatch.c
+++ b/qapi/qmp-dispatch.c
@@ -19,6 +19,7 @@
 #include "qapi/qmp/dispatch.h"
 #include "qapi/qmp/qdict.h"
 #include "qapi/qmp/qjson.h"
+#include "qapi/qobject-input-visitor.h"
 #include "qapi/qobject-output-visitor.h"
 #include "sysemu/runstate.h"
 #include "qapi/qmp/qbool.h"
@@ -27,6 +28,14 @@
 
 CompatPolicy compat_policy;
 
+Visitor *qobject_input_visitor_new_qmp(QObject *obj)
+{
+    Visitor *v = qobject_input_visitor_new(obj);
+
+    qobject_input_visitor_set_policy(v, compat_policy.deprecated_input);
+    return v;
+}
+
 Visitor *qobject_output_visitor_new_qmp(QObject **result)
 {
     Visitor *v = qobject_output_visitor_new(result);
diff --git a/qapi/qobject-input-visitor.c b/qapi/qobject-input-visitor.c
index 23843b242e..bd94cf187a 100644
--- a/qapi/qobject-input-visitor.c
+++ b/qapi/qobject-input-visitor.c
@@ -14,6 +14,7 @@
 
 #include "qemu/osdep.h"
 #include <math.h>
+#include "qapi/compat-policy.h"
 #include "qapi/error.h"
 #include "qapi/qobject-input-visitor.h"
 #include "qapi/visitor-impl.h"
@@ -43,6 +44,7 @@ typedef struct StackObject {
 
 struct QObjectInputVisitor {
     Visitor visitor;
+    CompatPolicyInput deprecated_policy;
 
     /* Root of visit at visitor creation. */
     QObject *root;
@@ -662,6 +664,23 @@ static void qobject_input_optional(Visitor *v, const char *name, bool *present)
     *present = true;
 }
 
+static bool qobject_input_deprecated_accept(Visitor *v, const char *name,
+                                            Error **errp)
+{
+    QObjectInputVisitor *qiv = to_qiv(v);
+
+    switch (qiv->deprecated_policy) {
+    case COMPAT_POLICY_INPUT_ACCEPT:
+        return true;
+    case COMPAT_POLICY_INPUT_REJECT:
+        error_setg(errp, "Deprecated parameter '%s' disabled by policy",
+                   name);
+        return false;
+    default:
+        abort();
+    }
+}
+
 static void qobject_input_free(Visitor *v)
 {
     QObjectInputVisitor *qiv = to_qiv(v);
@@ -696,6 +715,7 @@ static QObjectInputVisitor *qobject_input_visitor_base_new(QObject *obj)
     v->visitor.end_list = qobject_input_end_list;
     v->visitor.start_alternate = qobject_input_start_alternate;
     v->visitor.optional = qobject_input_optional;
+    v->visitor.deprecated_accept = qobject_input_deprecated_accept;
     v->visitor.free = qobject_input_free;
 
     v->root = qobject_ref(obj);
@@ -718,6 +738,14 @@ Visitor *qobject_input_visitor_new(QObject *obj)
     return &v->visitor;
 }
 
+void qobject_input_visitor_set_policy(Visitor *v,
+                                       CompatPolicyInput deprecated)
+{
+    QObjectInputVisitor *qiv = to_qiv(v);
+
+    qiv->deprecated_policy = deprecated;
+}
+
 Visitor *qobject_input_visitor_new_keyval(QObject *obj)
 {
     QObjectInputVisitor *v = qobject_input_visitor_base_new(obj);
diff --git a/tests/unit/test-qmp-cmds.c b/tests/unit/test-qmp-cmds.c
index cba982154b..266db074b4 100644
--- a/tests/unit/test-qmp-cmds.c
+++ b/tests/unit/test-qmp-cmds.c
@@ -303,6 +303,29 @@ static void test_dispatch_cmd_deprecated(void)
     do_qmp_dispatch_error(false, ERROR_CLASS_COMMAND_NOT_FOUND, cmd);
 }
 
+static void test_dispatch_cmd_arg_deprecated(void)
+{
+    const char *cmd = "{ 'execute': 'test-features0',"
+        " 'arguments': { 'fs1': { 'foo': 42 } } }";
+    QDict *ret;
+
+    memset(&compat_policy, 0, sizeof(compat_policy));
+
+    /* accept */
+    ret = qobject_to(QDict, do_qmp_dispatch(false, cmd));
+    assert(ret && qdict_size(ret) == 1);
+    qobject_unref(ret);
+
+    compat_policy.has_deprecated_input = true;
+    compat_policy.deprecated_input = COMPAT_POLICY_INPUT_ACCEPT;
+    ret = qobject_to(QDict, do_qmp_dispatch(false, cmd));
+    assert(ret && qdict_size(ret) == 1);
+    qobject_unref(ret);
+
+    compat_policy.deprecated_input = COMPAT_POLICY_INPUT_REJECT;
+    do_qmp_dispatch_error(false, ERROR_CLASS_GENERIC_ERROR, cmd);
+}
+
 static void test_dispatch_cmd_ret_deprecated(void)
 {
     const char *cmd = "{ 'execute': 'test-features0' }";
@@ -403,6 +426,8 @@ int main(int argc, char **argv)
                     test_dispatch_cmd_success_response);
     g_test_add_func("/qmp/dispatch_cmd_deprecated",
                     test_dispatch_cmd_deprecated);
+    g_test_add_func("/qmp/dispatch_cmd_arg_deprecated",
+                    test_dispatch_cmd_arg_deprecated);
     g_test_add_func("/qmp/dispatch_cmd_ret_deprecated",
                     test_dispatch_cmd_ret_deprecated);
     g_test_add_func("/qmp/dealloc_types", test_dealloc_types);
diff --git a/qapi/trace-events b/qapi/trace-events
index eff1fbd199..3cabe912ae 100644
--- a/qapi/trace-events
+++ b/qapi/trace-events
@@ -17,6 +17,7 @@ visit_start_alternate(void *v, const char *name, void *obj, size_t size) "v=%p n
 visit_end_alternate(void *v, void *obj) "v=%p obj=%p"
 
 visit_optional(void *v, const char *name, bool *present) "v=%p name=%s present=%p"
+visit_deprecated_accept(void *v, const char *name) "v=%p name=%s"
 visit_deprecated(void *v, const char *name) "v=%p name=%s"
 
 visit_type_enum(void *v, const char *name, int *obj) "v=%p name=%s obj=%p"
diff --git a/scripts/qapi/commands.py b/scripts/qapi/commands.py
index c4628517ee..0e13d51054 100644
--- a/scripts/qapi/commands.py
+++ b/scripts/qapi/commands.py
@@ -154,7 +154,7 @@ def gen_marshal(name: str,
 
     ret += mcgen('''
 
-    v = qobject_input_visitor_new(QOBJECT(args));
+    v = qobject_input_visitor_new_qmp(QOBJECT(args));
     if (!visit_start_struct(v, NULL, NULL, 0, errp)) {
         goto out;
     }
@@ -258,7 +258,6 @@ def _begin_user_module(self, name: str) -> None:
 #include "qapi/compat-policy.h"
 #include "qapi/visitor.h"
 #include "qapi/qmp/qdict.h"
-#include "qapi/qobject-input-visitor.h"
 #include "qapi/dealloc-visitor.h"
 #include "qapi/error.h"
 #include "%(visit)s.h"
diff --git a/scripts/qapi/visit.py b/scripts/qapi/visit.py
index 9d83bf650f..9e96f3c566 100644
--- a/scripts/qapi/visit.py
+++ b/scripts/qapi/visit.py
@@ -87,6 +87,9 @@ def gen_visit_object_members(name: str,
             indent.increase()
         if deprecated:
             ret += mcgen('''
+    if (!visit_deprecated_accept(v, "%(name)s", errp)) {
+        return false;
+    }
     if (visit_deprecated(v, "%(name)s")) {
 ''',
                          name=memb.name)
-- 
2.26.3


