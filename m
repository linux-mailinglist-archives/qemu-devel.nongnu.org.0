Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DBBF40FDC7
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Sep 2021 18:20:48 +0200 (CEST)
Received: from localhost ([::1]:45810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mRGbX-0007Cs-Lz
	for lists+qemu-devel@lfdr.de; Fri, 17 Sep 2021 12:20:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mRGUi-0007R9-8v
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 12:13:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52854)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mRGUd-0005tR-L0
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 12:13:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631895217;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=duKdN5PaeB0zxGZrbLx4/ZdTPMC/htEF8vK1d1mEclw=;
 b=QFcnGYD0sGUfhGr2xMF8NGqlM8W6K/Qc+JQLHJfV3E/zmvDoNt2tlKk13XiQcEoSmzGEXo
 rx4cKzN1iVi2s+N8chxDPyViPUWpImyQVRpp5KxjjBeiuLXUtgdHXvGtnBQeFoKAsk08cS
 MFGGkVYo15gaFokN3suWRJ6t6sY3Jv0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-589-qK6_Q0goNR6sYIWjjPb0Ig-1; Fri, 17 Sep 2021 12:13:34 -0400
X-MC-Unique: qK6_Q0goNR6sYIWjjPb0Ig-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EB4B2835DE0
 for <qemu-devel@nongnu.org>; Fri, 17 Sep 2021 16:13:33 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.193.161])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 046437C1ED;
 Fri, 17 Sep 2021 16:13:32 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 2/8] qapi: Remember alias definitions in
 qobject-input-visitor
Date: Fri, 17 Sep 2021 18:13:14 +0200
Message-Id: <20210917161320.201086-3-kwolf@redhat.com>
In-Reply-To: <20210917161320.201086-1-kwolf@redhat.com>
References: <20210917161320.201086-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
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
Cc: kwolf@redhat.com, jsnow@redhat.com, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This makes qobject-input-visitor remember the currently valid aliases in
each StackObject. It doesn't actually allow using the aliases yet.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 qapi/qobject-input-visitor.c | 153 +++++++++++++++++++++++++++++++++++
 1 file changed, 153 insertions(+)

diff --git a/qapi/qobject-input-visitor.c b/qapi/qobject-input-visitor.c
index 04b790412e..44de05ad0a 100644
--- a/qapi/qobject-input-visitor.c
+++ b/qapi/qobject-input-visitor.c
@@ -30,6 +30,50 @@
 #include "qemu/cutils.h"
 #include "qemu/option.h"
 
+/*
+ * Describes an alias that is relevant for the current StackObject,
+ * either because it aliases a member of the currently visited object
+ * or because it aliases a member of a nested object.
+ *
+ * When processing a nested object, all InputVisitorAlias objects that
+ * are relevant for the nested object are propagated, i.e. copied with
+ * the name of the nested object removed from @source.
+ */
+typedef struct InputVisitorAlias {
+    /* StackObject in which the alias was defined */
+    struct StackObject *alias_so;
+
+    /*
+     * Alias name as defined for @alias_so.
+     * NULL means that this is a wildcard alias, i.e. all members of
+     * @src get an alias in @alias_so with the same name.
+     */
+    const char *name;
+
+    /*
+     * NULL-terminated array representing a path to the source member
+     * that the alias refers to.
+     *
+     * Must contain at least one non-NULL element if @alias is not NULL.
+     *
+     * If it contains no non-NULL element, @alias_so must be different
+     * from the StackObject which contains this InputVisitorAlias in
+     * its aliases list.  In this case, all elements in the currently
+     * visited object have an alias with the same name in @alias_so.
+     */
+    const char **src;
+
+    /*
+     * The alias remains valid as long as the StackObject which
+     * contains this InputVisitorAlias in its aliases list has
+     * StackObject.alias_scope_nesting >= InputVisitorAlias.scope_nesting
+     * or until the whole StackObject is removed.
+     */
+    int scope_nesting;
+
+    QSIMPLEQ_ENTRY(InputVisitorAlias) next;
+} InputVisitorAlias;
+
 typedef struct StackObject {
     const char *name;            /* Name of @obj in its parent, if any */
     QObject *obj;                /* QDict or QList being visited */
@@ -39,6 +83,14 @@ typedef struct StackObject {
     const QListEntry *entry;    /* If @obj is QList: unvisited tail */
     unsigned index;             /* If @obj is QList: list index of @entry */
 
+    /*
+     * Aliases for members in the visited object or nested objects.
+     * Ordered so that the more locally defined alias comes first.
+     */
+    QSIMPLEQ_HEAD(, InputVisitorAlias) aliases;
+
+    int alias_scope_nesting;    /* Number of open alias scopes */
+
     QSLIST_ENTRY(StackObject) node; /* parent */
 } StackObject;
 
@@ -205,6 +257,45 @@ static const char *qobject_input_get_keyval(QObjectInputVisitor *qiv,
     return qstring_get_str(qstr);
 }
 
+/*
+ * Propagate aliases from the parent StackObject @src to its direct
+ * child StackObject @dst, which is representing the child struct @name.
+ *
+ * Every alias whose source path begins with @dst->name and which still
+ * applies in @dst (i.e. it is either a wildcard alias or has at least
+ * one more source path element) is propagated to @dst with the first
+ * element (i.e. @dst->name) removed from the source path.
+ */
+static void propagate_aliases(StackObject *dst, StackObject *src)
+{
+    InputVisitorAlias *a;
+    InputVisitorAlias *propagated_alias;
+
+    QSIMPLEQ_FOREACH(a, &src->aliases, next) {
+        if (!a->src[0] || strcmp(a->src[0], dst->name)) {
+            continue;
+        }
+
+        /*
+         * If this is not a wildcard alias, but a->src[1] is NULL,
+         * then it referred to a->name in src and doesn't apply inside
+         * dst any more.
+         */
+        if (a->name && !a->src[1]) {
+            continue;
+        }
+
+        propagated_alias = g_new(InputVisitorAlias, 1);
+        *propagated_alias = (InputVisitorAlias) {
+            .name       = a->name,
+            .alias_so   = a->alias_so,
+            .src        = &a->src[1],
+        };
+
+        QSIMPLEQ_INSERT_TAIL(&dst->aliases, propagated_alias, next);
+    }
+}
+
 static const QListEntry *qobject_input_push(QObjectInputVisitor *qiv,
                                             const char *name,
                                             QObject *obj, void *qapi)
@@ -219,6 +310,7 @@ static const QListEntry *qobject_input_push(QObjectInputVisitor *qiv,
     tos->name = name;
     tos->obj = obj;
     tos->qapi = qapi;
+    QSIMPLEQ_INIT(&tos->aliases);
 
     if (qdict) {
         h = g_hash_table_new(g_str_hash, g_str_equal);
@@ -228,6 +320,9 @@ static const QListEntry *qobject_input_push(QObjectInputVisitor *qiv,
             g_hash_table_insert(h, (void *)qdict_entry_key(entry), NULL);
         }
         tos->h = h;
+        if (!QSLIST_EMPTY(&qiv->stack)) {
+            propagate_aliases(tos, QSLIST_FIRST(&qiv->stack));
+        }
     } else {
         assert(qlist);
         tos->entry = qlist_first(qlist);
@@ -259,10 +354,17 @@ static bool qobject_input_check_struct(Visitor *v, Error **errp)
 
 static void qobject_input_stack_object_free(StackObject *tos)
 {
+    InputVisitorAlias *a;
+
     if (tos->h) {
         g_hash_table_unref(tos->h);
     }
 
+    while ((a = QSIMPLEQ_FIRST(&tos->aliases))) {
+        QSIMPLEQ_REMOVE_HEAD(&tos->aliases, next);
+        g_free(a);
+    }
+
     g_free(tos);
 }
 
@@ -276,6 +378,54 @@ static void qobject_input_pop(Visitor *v, void **obj)
     qobject_input_stack_object_free(tos);
 }
 
+static void qobject_input_start_alias_scope(Visitor *v)
+{
+    QObjectInputVisitor *qiv = to_qiv(v);
+    StackObject *tos = QSLIST_FIRST(&qiv->stack);
+
+    tos->alias_scope_nesting++;
+}
+
+static void qobject_input_end_alias_scope(Visitor *v)
+{
+    QObjectInputVisitor *qiv = to_qiv(v);
+    StackObject *tos = QSLIST_FIRST(&qiv->stack);
+    InputVisitorAlias *a, *next;
+
+    assert(tos->alias_scope_nesting > 0);
+    tos->alias_scope_nesting--;
+
+    QSIMPLEQ_FOREACH_SAFE(a, &tos->aliases, next, next) {
+        if (a->scope_nesting > tos->alias_scope_nesting) {
+            QSIMPLEQ_REMOVE(&tos->aliases, a, InputVisitorAlias, next);
+            g_free(a);
+        }
+    }
+}
+
+static void qobject_input_define_alias(Visitor *v, const char *name,
+                                       const char **source)
+{
+    QObjectInputVisitor *qiv = to_qiv(v);
+    StackObject *tos = QSLIST_FIRST(&qiv->stack);
+    InputVisitorAlias *alias = g_new(InputVisitorAlias, 1);
+
+    /*
+     * The source path can become empty during alias propagation for
+     * wildcard aliases, but not when defining an alias (it would map
+     * all names onto themselves, which doesn't make sense).
+     */
+    assert(source[0]);
+
+    *alias = (InputVisitorAlias) {
+        .name       = name,
+        .alias_so   = tos,
+        .src        = source,
+    };
+
+    QSIMPLEQ_INSERT_HEAD(&tos->aliases, alias, next);
+}
+
 static bool qobject_input_start_struct(Visitor *v, const char *name, void **obj,
                                        size_t size, Error **errp)
 {
@@ -717,6 +867,9 @@ static QObjectInputVisitor *qobject_input_visitor_base_new(QObject *obj)
     v->visitor.start_alternate = qobject_input_start_alternate;
     v->visitor.optional = qobject_input_optional;
     v->visitor.deprecated_accept = qobject_input_deprecated_accept;
+    v->visitor.define_alias = qobject_input_define_alias;
+    v->visitor.start_alias_scope = qobject_input_start_alias_scope;
+    v->visitor.end_alias_scope = qobject_input_end_alias_scope;
     v->visitor.free = qobject_input_free;
 
     v->root = qobject_ref(obj);
-- 
2.31.1


