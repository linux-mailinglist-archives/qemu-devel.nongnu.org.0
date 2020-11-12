Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0EA12B0B4D
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Nov 2020 18:31:11 +0100 (CET)
Received: from localhost ([::1]:43640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdGRC-0002us-Rb
	for lists+qemu-devel@lfdr.de; Thu, 12 Nov 2020 12:31:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kdGPH-0001CW-BR
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 12:29:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:23592)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kdGPF-0006rC-Cf
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 12:29:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605202148;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uwsAGapOhQHVbm/iIny+CACibwCIp7kJv++sEiXwlN0=;
 b=WOnbn/s9qOKbpd0DJ8/V8pEFSptyyovUbNLNNigLLkgN/o7fnsgjBdiOAjcrqxVmNiC+vK
 TMwbuAXdHCz5upsw90/ZRKYUmT1/5ROnU2UvTiVONxpqetrnlKy9hQa6Eenu9rruJpU2oS
 aLOhO3P4gqwQ/S3irJZE7Bmicb5Yqj4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-308-efXt_QPaPvKfUWSLFGRLyQ-1; Thu, 12 Nov 2020 12:29:01 -0500
X-MC-Unique: efXt_QPaPvKfUWSLFGRLyQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C4E9F1074662
 for <qemu-devel@nongnu.org>; Thu, 12 Nov 2020 17:29:00 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-115-57.ams2.redhat.com [10.36.115.57])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CB6055D9E4;
 Thu, 12 Nov 2020 17:28:59 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/6] qapi: Remember alias definitions in qobject-input-visitor
Date: Thu, 12 Nov 2020 18:28:46 +0100
Message-Id: <20201112172850.401925-3-kwolf@redhat.com>
In-Reply-To: <20201112172850.401925-1-kwolf@redhat.com>
References: <20201112172850.401925-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/12 00:52:29
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: kwolf@redhat.com, jsnow@redhat.com, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This makes qobject-input-visitor remember the currently valid aliases in
each StackObject. It doesn't actually allow using the aliases yet.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 qapi/qobject-input-visitor.c | 115 +++++++++++++++++++++++++++++++++++
 1 file changed, 115 insertions(+)

diff --git a/qapi/qobject-input-visitor.c b/qapi/qobject-input-visitor.c
index 23843b242e..a00ac32682 100644
--- a/qapi/qobject-input-visitor.c
+++ b/qapi/qobject-input-visitor.c
@@ -29,6 +29,29 @@
 #include "qemu/cutils.h"
 #include "qemu/option.h"
 
+typedef struct InputVisitorAlias {
+   /* Alias name. NULL for any (wildcard alias). */
+    const char *alias;
+
+    /*
+     * NULL terminated array representing a path.
+     * Must contain at least one non-NULL element if alias is not NULL.
+     */
+    const char **src;
+
+    /* StackObject in which the alias should be looked for */
+    struct StackObject *alias_so;
+
+    /*
+     * The alias remains valid as long as the containing StackObject has
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
@@ -38,6 +61,9 @@ typedef struct StackObject {
     const QListEntry *entry;    /* If @obj is QList: unvisited tail */
     unsigned index;             /* If @obj is QList: list index of @entry */
 
+    QSLIST_HEAD(, InputVisitorAlias) aliases;
+    int alias_scope_nesting;    /* Increase on scope start, decrease on end */
+
     QSLIST_ENTRY(StackObject) node; /* parent */
 } StackObject;
 
@@ -203,6 +229,38 @@ static const char *qobject_input_get_keyval(QObjectInputVisitor *qiv,
     return qstring_get_str(qstr);
 }
 
+/*
+ * Propagates aliases from the parent StackObject @src to its direct
+ * child StackObject @dst, which is representing the child struct @name.
+ *
+ * Every alias whose source path begins with @name and which still
+ * applies in @dst (i.e. it is either a wildcard alias or has at least
+ * one more source path element) is propagated to @dst with the first
+ * element (i.e. @name) removed from the source path.
+ */
+static void propagate_aliases(StackObject *dst, StackObject *src,
+                              const char *name)
+{
+    InputVisitorAlias *a;
+
+    QSLIST_FOREACH(a, &src->aliases, next) {
+        if (!a->src[0] || strcmp(a->src[0], name)) {
+            continue;
+        }
+        if (a->src[1] || !a->alias) {
+            InputVisitorAlias *alias = g_new(InputVisitorAlias, 1);
+
+            *alias = (InputVisitorAlias) {
+                .alias      = a->alias,
+                .alias_so   = a->alias_so,
+                .src        = &a->src[1],
+            };
+
+            QSLIST_INSERT_HEAD(&dst->aliases, alias, next);
+        }
+    }
+}
+
 static const QListEntry *qobject_input_push(QObjectInputVisitor *qiv,
                                             const char *name,
                                             QObject *obj, void *qapi)
@@ -226,6 +284,9 @@ static const QListEntry *qobject_input_push(QObjectInputVisitor *qiv,
             g_hash_table_insert(h, (void *)qdict_entry_key(entry), NULL);
         }
         tos->h = h;
+        if (!QSLIST_EMPTY(&qiv->stack)) {
+            propagate_aliases(tos, QSLIST_FIRST(&qiv->stack), name);
+        }
     } else {
         assert(qlist);
         tos->entry = qlist_first(qlist);
@@ -257,10 +318,17 @@ static bool qobject_input_check_struct(Visitor *v, Error **errp)
 
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
 
@@ -274,6 +342,50 @@ static void qobject_input_pop(Visitor *v, void **obj)
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
+static void qobject_input_define_alias(Visitor *v, const char *alias_name,
+                                       const char **source)
+{
+    QObjectInputVisitor *qiv = to_qiv(v);
+    StackObject *tos = QSLIST_FIRST(&qiv->stack);
+    InputVisitorAlias *alias = g_new(InputVisitorAlias, 1);
+
+    /* The source path can only be empty for wildcard aliases */
+    assert(source[0] || !alias_name);
+
+    *alias = (InputVisitorAlias) {
+        .alias      = alias_name,
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
@@ -696,6 +808,9 @@ static QObjectInputVisitor *qobject_input_visitor_base_new(QObject *obj)
     v->visitor.end_list = qobject_input_end_list;
     v->visitor.start_alternate = qobject_input_start_alternate;
     v->visitor.optional = qobject_input_optional;
+    v->visitor.define_alias = qobject_input_define_alias;
+    v->visitor.start_alias_scope = qobject_input_start_alias_scope;
+    v->visitor.end_alias_scope = qobject_input_end_alias_scope;
     v->visitor.free = qobject_input_free;
 
     v->root = qobject_ref(obj);
-- 
2.28.0


