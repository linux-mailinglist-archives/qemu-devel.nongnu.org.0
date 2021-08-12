Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 831973EA84C
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Aug 2021 18:13:40 +0200 (CEST)
Received: from localhost ([::1]:43636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mEDKt-0007LB-GG
	for lists+qemu-devel@lfdr.de; Thu, 12 Aug 2021 12:13:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mEDJ6-0005Aw-Bb
 for qemu-devel@nongnu.org; Thu, 12 Aug 2021 12:11:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33555)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mEDJ2-0001Ms-OW
 for qemu-devel@nongnu.org; Thu, 12 Aug 2021 12:11:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628784703;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ClZ2V82vIuah89XudutsMjf4+R0o17xvTWdNNTPgtHY=;
 b=QOR1xTF5W1n54QOGDgFZogODRr8Tc0jI8jYHx3NX8gBiEljQH1UNkDfVAsM+Vv7YVo+zyn
 URPOKZI3b0oFsjiJovFwrBl6bdgLwXyaufQYCOe5PW7izSGsZytqK+JBJJLmqIbXKa4OZD
 o2io4/0bi0s3mhf7u2hM1o5B3+rHAAE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-401-64yBGazXMfmz9NiESRAjCA-1; Thu, 12 Aug 2021 12:11:42 -0400
X-MC-Unique: 64yBGazXMfmz9NiESRAjCA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 51F8118C8C16
 for <qemu-devel@nongnu.org>; Thu, 12 Aug 2021 16:11:41 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.194.67])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 61F545C3E0;
 Thu, 12 Aug 2021 16:11:40 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 2/6] qapi: Remember alias definitions in
 qobject-input-visitor
Date: Thu, 12 Aug 2021 18:11:27 +0200
Message-Id: <20210812161131.92017-3-kwolf@redhat.com>
In-Reply-To: <20210812161131.92017-1-kwolf@redhat.com>
References: <20210812161131.92017-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.701,
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
 qapi/qobject-input-visitor.c | 147 +++++++++++++++++++++++++++++++++++
 1 file changed, 147 insertions(+)

diff --git a/qapi/qobject-input-visitor.c b/qapi/qobject-input-visitor.c
index 04b790412e..d0061d33d6 100644
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
+    QSLIST_ENTRY(InputVisitorAlias) next;
+} InputVisitorAlias;
+
 typedef struct StackObject {
     const char *name;            /* Name of @obj in its parent, if any */
     QObject *obj;                /* QDict or QList being visited */
@@ -39,6 +83,9 @@ typedef struct StackObject {
     const QListEntry *entry;    /* If @obj is QList: unvisited tail */
     unsigned index;             /* If @obj is QList: list index of @entry */
 
+    QSLIST_HEAD(, InputVisitorAlias) aliases;
+    int alias_scope_nesting;    /* Number of open alias scopes */
+
     QSLIST_ENTRY(StackObject) node; /* parent */
 } StackObject;
 
@@ -205,6 +252,45 @@ static const char *qobject_input_get_keyval(QObjectInputVisitor *qiv,
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
+    QSLIST_FOREACH(a, &src->aliases, next) {
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
+        QSLIST_INSERT_HEAD(&dst->aliases, propagated_alias, next);
+    }
+}
+
 static const QListEntry *qobject_input_push(QObjectInputVisitor *qiv,
                                             const char *name,
                                             QObject *obj, void *qapi)
@@ -228,6 +314,9 @@ static const QListEntry *qobject_input_push(QObjectInputVisitor *qiv,
             g_hash_table_insert(h, (void *)qdict_entry_key(entry), NULL);
         }
         tos->h = h;
+        if (!QSLIST_EMPTY(&qiv->stack)) {
+            propagate_aliases(tos, QSLIST_FIRST(&qiv->stack));
+        }
     } else {
         assert(qlist);
         tos->entry = qlist_first(qlist);
@@ -259,10 +348,17 @@ static bool qobject_input_check_struct(Visitor *v, Error **errp)
 
 static void qobject_input_stack_object_free(StackObject *tos)
 {
+    InputVisitorAlias *a;
+
     if (tos->h) {
         g_hash_table_unref(tos->h);
     }
 
+    while ((a = QSLIST_FIRST(&tos->aliases))) {
+        QSLIST_REMOVE_HEAD(&tos->aliases, next);
+        g_free(a);
+    }
+
     g_free(tos);
 }
 
@@ -276,6 +372,54 @@ static void qobject_input_pop(Visitor *v, void **obj)
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
+    QSLIST_FOREACH_SAFE(a, &tos->aliases, next, next) {
+        if (a->scope_nesting > tos->alias_scope_nesting) {
+            QSLIST_REMOVE(&tos->aliases, a, InputVisitorAlias, next);
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
+    QSLIST_INSERT_HEAD(&tos->aliases, alias, next);
+}
+
 static bool qobject_input_start_struct(Visitor *v, const char *name, void **obj,
                                        size_t size, Error **errp)
 {
@@ -717,6 +861,9 @@ static QObjectInputVisitor *qobject_input_visitor_base_new(QObject *obj)
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


