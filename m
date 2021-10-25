Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB61E438E4A
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Oct 2021 06:26:29 +0200 (CEST)
Received: from localhost ([::1]:58156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1merZ7-0008LR-3W
	for lists+qemu-devel@lfdr.de; Mon, 25 Oct 2021 00:26:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1merXC-0005sd-D9
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 00:24:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:20016)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1merX9-0005l1-57
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 00:24:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635135865;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0jjQzczD4kEqGuY9oEEI2ywnjprqrl9/YheOgfujrm8=;
 b=ZiFaqnjViZyM1EzBa69BX53rmbLz8CfvKkUGE2vcvAzZU8nhJHrFPCjJOdsduXRqZmKXPX
 DD3eQ0+9i1al11XeJc6DxwKXS3/+c9MLL4FRrGLeXN7Ii+dmJDvVLfeI/5bqdNHSI4O8NT
 OB4LsOsefnwzK7SXg1Nyy5L/MOThFiA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-43-kFNomBMuNHSPy4VEVOtGww-1; Mon, 25 Oct 2021 00:24:24 -0400
X-MC-Unique: kFNomBMuNHSPy4VEVOtGww-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4181C180831F;
 Mon, 25 Oct 2021 04:24:23 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CA75F1002D71;
 Mon, 25 Oct 2021 04:24:07 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 07C2411380BA; Mon, 25 Oct 2021 06:24:06 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 3/5] qapi: Move compat policy from QObject to generic
 visitor
Date: Mon, 25 Oct 2021 06:24:03 +0200
Message-Id: <20211025042405.3762351-4-armbru@redhat.com>
In-Reply-To: <20211025042405.3762351-1-armbru@redhat.com>
References: <20211025042405.3762351-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, berrange@redhat.com,
 libvir-list@redhat.com, eblake@redhat.com, mdroth@linux.vnet.ibm.com,
 pkrempa@redhat.com, marcandre.lureau@redhat.com, jsnow@redhat.com,
 libguestfs@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The next commit needs to access compat policy from the generic visitor
core.  Move it there from qobject input and output visitor.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
 include/qapi/qobject-input-visitor.h  |  4 ----
 include/qapi/qobject-output-visitor.h |  4 ----
 include/qapi/visitor-impl.h           |  3 +++
 include/qapi/visitor.h                |  9 +++++++++
 qapi/qapi-visit-core.c                |  9 +++++++++
 qapi/qmp-dispatch.c                   |  4 ++--
 qapi/qobject-input-visitor.c          | 14 +-------------
 qapi/qobject-output-visitor.c         | 14 +-------------
 8 files changed, 25 insertions(+), 36 deletions(-)

diff --git a/include/qapi/qobject-input-visitor.h b/include/qapi/qobject-input-visitor.h
index 8d69388810..95985e25e5 100644
--- a/include/qapi/qobject-input-visitor.h
+++ b/include/qapi/qobject-input-visitor.h
@@ -15,7 +15,6 @@
 #ifndef QOBJECT_INPUT_VISITOR_H
 #define QOBJECT_INPUT_VISITOR_H
 
-#include "qapi/qapi-types-compat.h"
 #include "qapi/visitor.h"
 
 typedef struct QObjectInputVisitor QObjectInputVisitor;
@@ -59,9 +58,6 @@ typedef struct QObjectInputVisitor QObjectInputVisitor;
  */
 Visitor *qobject_input_visitor_new(QObject *obj);
 
-void qobject_input_visitor_set_policy(Visitor *v,
-                                      CompatPolicyInput deprecated);
-
 /*
  * Create a QObject input visitor for @obj for use with keyval_parse()
  *
diff --git a/include/qapi/qobject-output-visitor.h b/include/qapi/qobject-output-visitor.h
index f2a2f92a00..2b1726baf5 100644
--- a/include/qapi/qobject-output-visitor.h
+++ b/include/qapi/qobject-output-visitor.h
@@ -15,7 +15,6 @@
 #define QOBJECT_OUTPUT_VISITOR_H
 
 #include "qapi/visitor.h"
-#include "qapi/qapi-types-compat.h"
 
 typedef struct QObjectOutputVisitor QObjectOutputVisitor;
 
@@ -54,7 +53,4 @@ typedef struct QObjectOutputVisitor QObjectOutputVisitor;
  */
 Visitor *qobject_output_visitor_new(QObject **result);
 
-void qobject_output_visitor_set_policy(Visitor *v,
-                                       CompatPolicyOutput deprecated);
-
 #endif
diff --git a/include/qapi/visitor-impl.h b/include/qapi/visitor-impl.h
index 3b950f6e3d..72b6537bef 100644
--- a/include/qapi/visitor-impl.h
+++ b/include/qapi/visitor-impl.h
@@ -122,6 +122,9 @@ struct Visitor
     /* Must be set */
     VisitorType type;
 
+    /* Optional */
+    struct CompatPolicy compat_policy;
+
     /* Must be set for output visitors, optional otherwise. */
     void (*complete)(Visitor *v, void *opaque);
 
diff --git a/include/qapi/visitor.h b/include/qapi/visitor.h
index b3c9ef7a81..dcb96018a9 100644
--- a/include/qapi/visitor.h
+++ b/include/qapi/visitor.h
@@ -16,6 +16,7 @@
 #define QAPI_VISITOR_H
 
 #include "qapi/qapi-builtin-types.h"
+#include "qapi/qapi-types-compat.h"
 
 /*
  * The QAPI schema defines both a set of C data types, and a QMP wire
@@ -477,6 +478,14 @@ bool visit_deprecated_accept(Visitor *v, const char *name, Error **errp);
  */
 bool visit_deprecated(Visitor *v, const char *name);
 
+/*
+ * Set policy for handling deprecated management interfaces.
+ *
+ * Intended use: call visit_set_policy(v, &compat_policy) when
+ * visiting management interface input or output.
+ */
+void visit_set_policy(Visitor *v, CompatPolicy *policy);
+
 /*
  * Visit an enum value.
  *
diff --git a/qapi/qapi-visit-core.c b/qapi/qapi-visit-core.c
index a641adec51..066f77a26d 100644
--- a/qapi/qapi-visit-core.c
+++ b/qapi/qapi-visit-core.c
@@ -19,6 +19,10 @@
 #include "qapi/visitor-impl.h"
 #include "trace.h"
 
+/* Zero-initialization must result in default policy */
+QEMU_BUILD_BUG_ON(COMPAT_POLICY_INPUT_ACCEPT || COMPAT_POLICY_OUTPUT_ACCEPT);
+
+
 void visit_complete(Visitor *v, void *opaque)
 {
     assert(v->type != VISITOR_OUTPUT || v->complete);
@@ -153,6 +157,11 @@ bool visit_deprecated(Visitor *v, const char *name)
     return true;
 }
 
+void visit_set_policy(Visitor *v, CompatPolicy *policy)
+{
+    v->compat_policy = *policy;
+}
+
 bool visit_is_input(Visitor *v)
 {
     return v->type == VISITOR_INPUT;
diff --git a/qapi/qmp-dispatch.c b/qapi/qmp-dispatch.c
index 59600210ce..7e943a0af5 100644
--- a/qapi/qmp-dispatch.c
+++ b/qapi/qmp-dispatch.c
@@ -32,7 +32,7 @@ Visitor *qobject_input_visitor_new_qmp(QObject *obj)
 {
     Visitor *v = qobject_input_visitor_new(obj);
 
-    qobject_input_visitor_set_policy(v, compat_policy.deprecated_input);
+    visit_set_policy(v, &compat_policy);
     return v;
 }
 
@@ -40,7 +40,7 @@ Visitor *qobject_output_visitor_new_qmp(QObject **result)
 {
     Visitor *v = qobject_output_visitor_new(result);
 
-    qobject_output_visitor_set_policy(v, compat_policy.deprecated_output);
+    visit_set_policy(v, &compat_policy);
     return v;
 }
 
diff --git a/qapi/qobject-input-visitor.c b/qapi/qobject-input-visitor.c
index 04b790412e..71b24a4429 100644
--- a/qapi/qobject-input-visitor.c
+++ b/qapi/qobject-input-visitor.c
@@ -14,7 +14,6 @@
 
 #include "qemu/osdep.h"
 #include <math.h>
-#include "qapi/compat-policy.h"
 #include "qapi/error.h"
 #include "qapi/qobject-input-visitor.h"
 #include "qapi/visitor-impl.h"
@@ -44,7 +43,6 @@ typedef struct StackObject {
 
 struct QObjectInputVisitor {
     Visitor visitor;
-    CompatPolicyInput deprecated_policy;
 
     /* Root of visit at visitor creation. */
     QObject *root;
@@ -667,9 +665,7 @@ static void qobject_input_optional(Visitor *v, const char *name, bool *present)
 static bool qobject_input_deprecated_accept(Visitor *v, const char *name,
                                             Error **errp)
 {
-    QObjectInputVisitor *qiv = to_qiv(v);
-
-    switch (qiv->deprecated_policy) {
+    switch (v->compat_policy.deprecated_input) {
     case COMPAT_POLICY_INPUT_ACCEPT:
         return true;
     case COMPAT_POLICY_INPUT_REJECT:
@@ -739,14 +735,6 @@ Visitor *qobject_input_visitor_new(QObject *obj)
     return &v->visitor;
 }
 
-void qobject_input_visitor_set_policy(Visitor *v,
-                                       CompatPolicyInput deprecated)
-{
-    QObjectInputVisitor *qiv = to_qiv(v);
-
-    qiv->deprecated_policy = deprecated;
-}
-
 Visitor *qobject_input_visitor_new_keyval(QObject *obj)
 {
     QObjectInputVisitor *v = qobject_input_visitor_base_new(obj);
diff --git a/qapi/qobject-output-visitor.c b/qapi/qobject-output-visitor.c
index e4873308d4..9b7f510036 100644
--- a/qapi/qobject-output-visitor.c
+++ b/qapi/qobject-output-visitor.c
@@ -13,7 +13,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "qapi/compat-policy.h"
 #include "qapi/qobject-output-visitor.h"
 #include "qapi/visitor-impl.h"
 #include "qemu/queue.h"
@@ -32,7 +31,6 @@ typedef struct QStackEntry {
 
 struct QObjectOutputVisitor {
     Visitor visitor;
-    CompatPolicyOutput deprecated_policy;
 
     QSLIST_HEAD(, QStackEntry) stack; /* Stack of unfinished containers */
     QObject *root; /* Root of the output visit */
@@ -212,9 +210,7 @@ static bool qobject_output_type_null(Visitor *v, const char *name,
 
 static bool qobject_output_deprecated(Visitor *v, const char *name)
 {
-    QObjectOutputVisitor *qov = to_qov(v);
-
-    return qov->deprecated_policy != COMPAT_POLICY_OUTPUT_HIDE;
+    return v->compat_policy.deprecated_output != COMPAT_POLICY_OUTPUT_HIDE;
 }
 
 /* Finish building, and return the root object.
@@ -275,11 +271,3 @@ Visitor *qobject_output_visitor_new(QObject **result)
 
     return &v->visitor;
 }
-
-void qobject_output_visitor_set_policy(Visitor *v,
-                                       CompatPolicyOutput deprecated)
-{
-    QObjectOutputVisitor *qov = to_qov(v);
-
-    qov->deprecated_policy = deprecated;
-}
-- 
2.31.1


