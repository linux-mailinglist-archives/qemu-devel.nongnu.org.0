Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 486CC438ED8
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Oct 2021 07:31:42 +0200 (CEST)
Received: from localhost ([::1]:43066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mesaD-0005n6-AN
	for lists+qemu-devel@lfdr.de; Mon, 25 Oct 2021 01:31:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mesUd-0005IS-V7
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 01:25:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46253)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mesUb-0005GP-0O
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 01:25:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635139552;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0Pae19ZvE+tk/uq7rnhHFYh50rzZEaPr3MYzebwKmFw=;
 b=EkvRd0ryYAPw0iIw7OjdphxQQhmj+MUkUngFlsBKV1ADCH6vgAK4Wql3UNRWko96vM8piw
 kBs8D4HNmeTdwbeOmuTzG+O4za33lDJpZOcL7DkCGPWbwJpz/yttIm2f++QkB7FkgBgzXk
 CtnJ2AtPPvh9TC18MO8JLI30VXf3pHQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-305-lSk_f53yNDugbAWI7Qbjww-1; Mon, 25 Oct 2021 01:25:48 -0400
X-MC-Unique: lSk_f53yNDugbAWI7Qbjww-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 18C721006AA2;
 Mon, 25 Oct 2021 05:25:47 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3D32B5C25D;
 Mon, 25 Oct 2021 05:25:46 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id DEF2011380CA; Mon, 25 Oct 2021 07:25:32 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 5/9] qapi: Generalize struct member policy checking
Date: Mon, 25 Oct 2021 07:25:28 +0200
Message-Id: <20211025052532.3859634-6-armbru@redhat.com>
In-Reply-To: <20211025052532.3859634-1-armbru@redhat.com>
References: <20211025052532.3859634-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, pkrempa@redhat.com, berrange@redhat.com,
 ehabkost@redhat.com, qemu-block@nongnu.org, quintela@redhat.com,
 libvir-list@redhat.com, eblake@redhat.com, mdroth@linux.vnet.ibm.com,
 dgilbert@redhat.com, pbonzini@redhat.com, marcandre.lureau@redhat.com,
 jsnow@redhat.com, libguestfs@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The generated visitor functions call visit_deprecated_accept() and
visit_deprecated() when visiting a struct member with special feature
flag 'deprecated'.  This makes the feature flag visible to the actual
visitors.  I want to make feature flag 'unstable' visible there as
well, so I can add policy for it.

To let me make it visible, replace these functions by
visit_policy_reject() and visit_policy_skip(), which take the member's
special features as an argument.  Note that the new functions have the
opposite sense, i.e. the return value flips.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 include/qapi/visitor-impl.h   |  6 ++++--
 include/qapi/visitor.h        | 17 +++++++++++++----
 qapi/qapi-forward-visitor.c   | 16 +++++++++-------
 qapi/qapi-visit-core.c        | 22 ++++++++++++----------
 qapi/qobject-input-visitor.c  | 15 ++++++++++-----
 qapi/qobject-output-visitor.c |  9 ++++++---
 qapi/trace-events             |  4 ++--
 scripts/qapi/visit.py         | 14 +++++++-------
 8 files changed, 63 insertions(+), 40 deletions(-)

diff --git a/include/qapi/visitor-impl.h b/include/qapi/visitor-impl.h
index 72b6537bef..2badec5ba4 100644
--- a/include/qapi/visitor-impl.h
+++ b/include/qapi/visitor-impl.h
@@ -114,10 +114,12 @@ struct Visitor
     void (*optional)(Visitor *v, const char *name, bool *present);
 
     /* Optional */
-    bool (*deprecated_accept)(Visitor *v, const char *name, Error **errp);
+    bool (*policy_reject)(Visitor *v, const char *name,
+                          unsigned special_features, Error **errp);
 
     /* Optional */
-    bool (*deprecated)(Visitor *v, const char *name);
+    bool (*policy_skip)(Visitor *v, const char *name,
+                        unsigned special_features);
 
     /* Must be set */
     VisitorType type;
diff --git a/include/qapi/visitor.h b/include/qapi/visitor.h
index dcb96018a9..d53a84c9ba 100644
--- a/include/qapi/visitor.h
+++ b/include/qapi/visitor.h
@@ -461,22 +461,31 @@ void visit_end_alternate(Visitor *v, void **obj);
 bool visit_optional(Visitor *v, const char *name, bool *present);
 
 /*
- * Should we reject deprecated member @name?
+ * Should we reject member @name due to policy?
+ *
+ * @special_features is the member's special features encoded as a
+ * bitset of QapiSpecialFeature.
  *
  * @name must not be NULL.  This function is only useful between
  * visit_start_struct() and visit_end_struct(), since only objects
  * have deprecated members.
  */
-bool visit_deprecated_accept(Visitor *v, const char *name, Error **errp);
+bool visit_policy_reject(Visitor *v, const char *name,
+                         unsigned special_features, Error **errp);
 
 /*
- * Should we visit deprecated member @name?
+ *
+ * Should we skip member @name due to policy?
+ *
+ * @special_features is the member's special features encoded as a
+ * bitset of QapiSpecialFeature.
  *
  * @name must not be NULL.  This function is only useful between
  * visit_start_struct() and visit_end_struct(), since only objects
  * have deprecated members.
  */
-bool visit_deprecated(Visitor *v, const char *name);
+bool visit_policy_skip(Visitor *v, const char *name,
+                       unsigned special_features);
 
 /*
  * Set policy for handling deprecated management interfaces.
diff --git a/qapi/qapi-forward-visitor.c b/qapi/qapi-forward-visitor.c
index a4b111e22a..25d098aa8a 100644
--- a/qapi/qapi-forward-visitor.c
+++ b/qapi/qapi-forward-visitor.c
@@ -246,25 +246,27 @@ static void forward_field_optional(Visitor *v, const char *name, bool *present)
     visit_optional(ffv->target, name, present);
 }
 
-static bool forward_field_deprecated_accept(Visitor *v, const char *name,
-                                            Error **errp)
+static bool forward_field_policy_reject(Visitor *v, const char *name,
+                                        unsigned special_features,
+                                        Error **errp)
 {
     ForwardFieldVisitor *ffv = to_ffv(v);
 
     if (!forward_field_translate_name(ffv, &name, errp)) {
         return false;
     }
-    return visit_deprecated_accept(ffv->target, name, errp);
+    return visit_policy_reject(ffv->target, name, special_features, errp);
 }
 
-static bool forward_field_deprecated(Visitor *v, const char *name)
+static bool forward_field_policy_skip(Visitor *v, const char *name,
+                                      unsigned special_features)
 {
     ForwardFieldVisitor *ffv = to_ffv(v);
 
     if (!forward_field_translate_name(ffv, &name, NULL)) {
         return false;
     }
-    return visit_deprecated(ffv->target, name);
+    return visit_policy_skip(ffv->target, name, special_features);
 }
 
 static void forward_field_complete(Visitor *v, void *opaque)
@@ -313,8 +315,8 @@ Visitor *visitor_forward_field(Visitor *target, const char *from, const char *to
     v->visitor.type_any = forward_field_type_any;
     v->visitor.type_null = forward_field_type_null;
     v->visitor.optional = forward_field_optional;
-    v->visitor.deprecated_accept = forward_field_deprecated_accept;
-    v->visitor.deprecated = forward_field_deprecated;
+    v->visitor.policy_reject = forward_field_policy_reject;
+    v->visitor.policy_skip = forward_field_policy_skip;
     v->visitor.complete = forward_field_complete;
     v->visitor.free = forward_field_free;
 
diff --git a/qapi/qapi-visit-core.c b/qapi/qapi-visit-core.c
index 49136ae88e..b4a81f1757 100644
--- a/qapi/qapi-visit-core.c
+++ b/qapi/qapi-visit-core.c
@@ -139,22 +139,24 @@ bool visit_optional(Visitor *v, const char *name, bool *present)
     return *present;
 }
 
-bool visit_deprecated_accept(Visitor *v, const char *name, Error **errp)
+bool visit_policy_reject(Visitor *v, const char *name,
+                         unsigned special_features, Error **errp)
 {
-    trace_visit_deprecated_accept(v, name);
-    if (v->deprecated_accept) {
-        return v->deprecated_accept(v, name, errp);
+    trace_visit_policy_reject(v, name);
+    if (v->policy_reject) {
+        return v->policy_reject(v, name, special_features, errp);
     }
-    return true;
+    return false;
 }
 
-bool visit_deprecated(Visitor *v, const char *name)
+bool visit_policy_skip(Visitor *v, const char *name,
+                       unsigned special_features)
 {
-    trace_visit_deprecated(v, name);
-    if (v->deprecated) {
-        return v->deprecated(v, name);
+    trace_visit_policy_skip(v, name);
+    if (v->policy_skip) {
+        return v->policy_skip(v, name, special_features);
     }
-    return true;
+    return false;
 }
 
 void visit_set_policy(Visitor *v, CompatPolicy *policy)
diff --git a/qapi/qobject-input-visitor.c b/qapi/qobject-input-visitor.c
index 71b24a4429..fda485614b 100644
--- a/qapi/qobject-input-visitor.c
+++ b/qapi/qobject-input-visitor.c
@@ -662,16 +662,21 @@ static void qobject_input_optional(Visitor *v, const char *name, bool *present)
     *present = true;
 }
 
-static bool qobject_input_deprecated_accept(Visitor *v, const char *name,
-                                            Error **errp)
+static bool qobject_input_policy_reject(Visitor *v, const char *name,
+                                        unsigned special_features,
+                                        Error **errp)
 {
+    if (!(special_features && 1u << QAPI_DEPRECATED)) {
+        return false;
+    }
+
     switch (v->compat_policy.deprecated_input) {
     case COMPAT_POLICY_INPUT_ACCEPT:
-        return true;
+        return false;
     case COMPAT_POLICY_INPUT_REJECT:
         error_setg(errp, "Deprecated parameter '%s' disabled by policy",
                    name);
-        return false;
+        return true;
     case COMPAT_POLICY_INPUT_CRASH:
     default:
         abort();
@@ -712,7 +717,7 @@ static QObjectInputVisitor *qobject_input_visitor_base_new(QObject *obj)
     v->visitor.end_list = qobject_input_end_list;
     v->visitor.start_alternate = qobject_input_start_alternate;
     v->visitor.optional = qobject_input_optional;
-    v->visitor.deprecated_accept = qobject_input_deprecated_accept;
+    v->visitor.policy_reject = qobject_input_policy_reject;
     v->visitor.free = qobject_input_free;
 
     v->root = qobject_ref(obj);
diff --git a/qapi/qobject-output-visitor.c b/qapi/qobject-output-visitor.c
index 9b7f510036..b5c6564cbb 100644
--- a/qapi/qobject-output-visitor.c
+++ b/qapi/qobject-output-visitor.c
@@ -13,6 +13,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qapi/compat-policy.h"
 #include "qapi/qobject-output-visitor.h"
 #include "qapi/visitor-impl.h"
 #include "qemu/queue.h"
@@ -208,9 +209,11 @@ static bool qobject_output_type_null(Visitor *v, const char *name,
     return true;
 }
 
-static bool qobject_output_deprecated(Visitor *v, const char *name)
+static bool qobject_output_policy_skip(Visitor *v, const char *name,
+                                       unsigned special_features)
 {
-    return v->compat_policy.deprecated_output != COMPAT_POLICY_OUTPUT_HIDE;
+    return !(special_features && 1u << QAPI_DEPRECATED)
+        || v->compat_policy.deprecated_output == COMPAT_POLICY_OUTPUT_HIDE;
 }
 
 /* Finish building, and return the root object.
@@ -262,7 +265,7 @@ Visitor *qobject_output_visitor_new(QObject **result)
     v->visitor.type_number = qobject_output_type_number;
     v->visitor.type_any = qobject_output_type_any;
     v->visitor.type_null = qobject_output_type_null;
-    v->visitor.deprecated = qobject_output_deprecated;
+    v->visitor.policy_skip = qobject_output_policy_skip;
     v->visitor.complete = qobject_output_complete;
     v->visitor.free = qobject_output_free;
 
diff --git a/qapi/trace-events b/qapi/trace-events
index cccafc07e5..ab108c4f0e 100644
--- a/qapi/trace-events
+++ b/qapi/trace-events
@@ -17,8 +17,8 @@ visit_start_alternate(void *v, const char *name, void *obj, size_t size) "v=%p n
 visit_end_alternate(void *v, void *obj) "v=%p obj=%p"
 
 visit_optional(void *v, const char *name, bool *present) "v=%p name=%s present=%p"
-visit_deprecated_accept(void *v, const char *name) "v=%p name=%s"
-visit_deprecated(void *v, const char *name) "v=%p name=%s"
+visit_policy_reject(void *v, const char *name) "v=%p name=%s"
+visit_policy_skip(void *v, const char *name) "v=%p name=%s"
 
 visit_type_enum(void *v, const char *name, int *obj) "v=%p name=%s obj=%p"
 visit_type_int(void *v, const char *name, int64_t *obj) "v=%p name=%s obj=%p"
diff --git a/scripts/qapi/visit.py b/scripts/qapi/visit.py
index 9d9196a143..e13bbe4292 100644
--- a/scripts/qapi/visit.py
+++ b/scripts/qapi/visit.py
@@ -21,7 +21,7 @@
     indent,
     mcgen,
 )
-from .gen import QAPISchemaModularCVisitor, ifcontext
+from .gen import QAPISchemaModularCVisitor, gen_special_features, ifcontext
 from .schema import (
     QAPISchema,
     QAPISchemaEnumMember,
@@ -76,7 +76,6 @@ def gen_visit_object_members(name: str,
                      c_type=base.c_name())
 
     for memb in members:
-        deprecated = 'deprecated' in [f.name for f in memb.features]
         ret += memb.ifcond.gen_if()
         if memb.optional:
             ret += mcgen('''
@@ -84,14 +83,15 @@ def gen_visit_object_members(name: str,
 ''',
                          name=memb.name, c_name=c_name(memb.name))
             indent.increase()
-        if deprecated:
+        special_features = gen_special_features(memb.features)
+        if special_features != '0':
             ret += mcgen('''
-    if (!visit_deprecated_accept(v, "%(name)s", errp)) {
+    if (visit_policy_reject(v, "%(name)s", %(special_features)s, errp)) {
         return false;
     }
-    if (visit_deprecated(v, "%(name)s")) {
+    if (!visit_policy_skip(v, "%(name)s", %(special_features)s)) {
 ''',
-                         name=memb.name)
+                         name=memb.name, special_features=special_features)
             indent.increase()
         ret += mcgen('''
     if (!visit_type_%(c_type)s(v, "%(name)s", &obj->%(c_name)s, errp)) {
@@ -100,7 +100,7 @@ def gen_visit_object_members(name: str,
 ''',
                      c_type=memb.type.c_name(), name=memb.name,
                      c_name=c_name(memb.name))
-        if deprecated:
+        if special_features != '0':
             indent.decrease()
             ret += mcgen('''
     }
-- 
2.31.1


