Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 264CA33D9FA
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 18:00:01 +0100 (CET)
Received: from localhost ([::1]:49460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMD32-0003z3-4w
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 13:00:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lMCw0-0006Cp-Tc
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 12:52:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55574)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lMCvw-0008Fz-5L
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 12:52:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615913559;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GlNPrIdnpLbPdox1ZDhJNuNY34VCLHOo8AUXIp9DyU4=;
 b=IAI3iDOjPXzPdynYnX/tbOhnRCsN43R9q0Sc2IEQzU3cR0TmbYsmrEMttWkTKsz/DULB83
 wGIyZUilCCSENq3OtVuWdeTeM5PQN3fQfhzoNvcqLa5KIGyta9kqtarKUKcHsepF3QGV4x
 hv4muUMYA6Q+olBLsqJ409C5wJimkZM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-232-l9bUvPAANaasO8xltuhUYw-1; Tue, 16 Mar 2021 12:52:36 -0400
X-MC-Unique: l9bUvPAANaasO8xltuhUYw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5133980A5F8;
 Tue, 16 Mar 2021 16:52:35 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-83.phx2.redhat.com
 [10.3.112.83])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EE4D31964B;
 Tue, 16 Mar 2021 16:52:34 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id D229011268A1; Tue, 16 Mar 2021 17:52:31 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 10/11] qapi: Implement deprecated-input=reject for QMP command
 arguments
Date: Tue, 16 Mar 2021 17:52:30 +0100
Message-Id: <20210316165231.3910842-11-armbru@redhat.com>
In-Reply-To: <20210316165231.3910842-1-armbru@redhat.com>
References: <20210316165231.3910842-1-armbru@redhat.com>
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
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
Message-Id: <20210312153210.2810514-10-armbru@redhat.com>
---
 include/qapi/qobject-input-visitor.h |  9 +++++++++
 include/qapi/visitor-impl.h          |  3 +++
 include/qapi/visitor.h               |  9 +++++++++
 qapi/qapi-visit-core.c               |  9 +++++++++
 qapi/qobject-input-visitor.c         | 28 ++++++++++++++++++++++++++++
 tests/unit/test-qmp-cmds.c           | 25 +++++++++++++++++++++++++
 qapi/trace-events                    |  1 +
 scripts/qapi/commands.py             |  2 +-
 scripts/qapi/visit.py                |  3 +++
 9 files changed, 88 insertions(+), 1 deletion(-)

diff --git a/include/qapi/qobject-input-visitor.h b/include/qapi/qobject-input-visitor.h
index 95985e25e5..cbc54de4ac 100644
--- a/include/qapi/qobject-input-visitor.h
+++ b/include/qapi/qobject-input-visitor.h
@@ -58,6 +58,15 @@ typedef struct QObjectInputVisitor QObjectInputVisitor;
  */
 Visitor *qobject_input_visitor_new(QObject *obj);
 
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
diff --git a/qapi/qobject-input-visitor.c b/qapi/qobject-input-visitor.c
index 23843b242e..1b8fa1f2f6 100644
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
 
+Visitor *qobject_input_visitor_new_qmp(QObject *obj)
+{
+    QObjectInputVisitor *v = to_qiv(qobject_input_visitor_new(obj));
+
+    v->deprecated_policy = compat_policy.deprecated_input;
+    return &v->visitor;
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
index f5d97454af..8ccd1d9224 100644
--- a/scripts/qapi/commands.py
+++ b/scripts/qapi/commands.py
@@ -154,7 +154,7 @@ def gen_marshal(name: str,
 
     ret += mcgen('''
 
-    v = qobject_input_visitor_new(QOBJECT(args));
+    v = qobject_input_visitor_new_qmp(QOBJECT(args));
     if (!visit_start_struct(v, NULL, NULL, 0, errp)) {
         goto out;
     }
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
2.26.2


