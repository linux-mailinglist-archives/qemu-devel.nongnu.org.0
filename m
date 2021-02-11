Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C775319252
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 19:34:43 +0100 (CET)
Received: from localhost ([::1]:50600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAGna-0005R2-FT
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 13:34:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lAGlJ-0003qA-6D
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 13:32:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:43827)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lAGlF-0002Ws-VZ
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 13:32:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613068336;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JmeOn7sJy+b4yQeBq6PnEDyH/8Fa23VxEt2DjW/7Y9o=;
 b=H2yVbffL4CyV71oyt2Xni8E3AP4reg8w3ZCP30OBFPM7ndOnHsmPluZOY4wruYoRCglY7I
 no8M0yyaK/xI7rI5ps50FpQjjGOFDrwRTY59HaKY1urIcag4fxofIpmg4gYdEEs5a6M8Y3
 zJcUV8Uy2HB/mPN4DZZcvFa3CX4D1q4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-308-LsSKlbZyOfC4i-syljgeYw-1; Thu, 11 Feb 2021 13:32:15 -0500
X-MC-Unique: LsSKlbZyOfC4i-syljgeYw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E2CA8101E716
 for <qemu-devel@nongnu.org>; Thu, 11 Feb 2021 18:31:35 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-113-82.ams2.redhat.com [10.36.113.82])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EB3B35C3E0;
 Thu, 11 Feb 2021 18:31:34 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 4/6] qapi: Apply aliases in qobject-input-visitor
Date: Thu, 11 Feb 2021 19:31:16 +0100
Message-Id: <20210211183118.422036-5-kwolf@redhat.com>
In-Reply-To: <20210211183118.422036-1-kwolf@redhat.com>
References: <20210211183118.422036-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.569,
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
Cc: kwolf@redhat.com, jsnow@redhat.com, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When looking for an object in a struct in the external representation,
check not only the currently visited struct, but also whether an alias
in the current StackObject matches and try to fetch the value from the
alias then. Providing two values for the same object through different
aliases is an error.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 qapi/qobject-input-visitor.c | 214 +++++++++++++++++++++++++++++++++--
 1 file changed, 205 insertions(+), 9 deletions(-)

diff --git a/qapi/qobject-input-visitor.c b/qapi/qobject-input-visitor.c
index dd04ef0027..3ea5e5abd6 100644
--- a/qapi/qobject-input-visitor.c
+++ b/qapi/qobject-input-visitor.c
@@ -95,6 +95,8 @@ struct QObjectInputVisitor {
     QObject *root;
     bool keyval;                /* Assume @root made with keyval_parse() */
 
+    QDict *empty_qdict;         /* Used for implicit objects */
+
     /* Stack of objects being visited (all entries will be either
      * QDict or QList). */
     QSLIST_HEAD(, StackObject) stack;
@@ -167,9 +169,178 @@ static const char *full_name(QObjectInputVisitor *qiv, const char *name)
     return full_name_so(qiv, name, false, tos);
 }
 
+static bool find_object_member(QObjectInputVisitor *qiv,
+                               StackObject **so, const char **name,
+                               bool *implicit_object, Error **errp);
+
+/*
+ * Check whether the alias member defined by @a is present in the
+ * input and can be used to obtain the value for the member @name in
+ * the currently visited object.
+ */
+static bool alias_present(QObjectInputVisitor *qiv,
+                          InputVisitorAlias *a, const char *name)
+{
+    StackObject *so = a->alias_so;
+
+    /*
+     * The passed source @name is only relevant for wildcard aliases which
+     * don't have a separate name, otherwise we use the alias name.
+     */
+    if (a->name) {
+        name = a->name;
+    }
+
+    /*
+     * Check whether the alias member is present in the input
+     * (possibly recursively because aliases are transitive).
+     */
+    if (!find_object_member(qiv, &so, &name, NULL, NULL)) {
+        return false;
+    }
+
+    /*
+     * Every source can be used only once. If a value in the input would end up
+     * being used twice through aliases, we'll fail the second access.
+     */
+    if (!g_hash_table_contains(so->h, name)) {
+        return false;
+    }
+
+    return true;
+}
+
+/*
+ * Check whether the member @name in the object visited by @so can be
+ * specified in the input by using the alias described by @a.
+ *
+ * If @name is only a prefix of the alias source, but doesn't match
+ * immediately, false is returned and @implicit_object is set to true
+ * if it is non-NULL.  In all other cases, @implicit_object is left
+ * unchanged.
+ */
+static bool alias_source_matches(QObjectInputVisitor *qiv,
+                                 StackObject *so, InputVisitorAlias *a,
+                                 const char *name, bool *implicit_object)
+{
+    if (a->src[0] == NULL) {
+        assert(a->name == NULL);
+        return true;
+    }
+
+    if (!strcmp(a->src[0], name)) {
+        if (a->name && a->src[1] == NULL) {
+            /*
+             * We're matching an exact member, the source for this alias is
+             * immediately in @so.
+             */
+            return true;
+        } else if (implicit_object) {
+            /*
+             * We're only looking at a prefix of the source path for the alias.
+             * If the input contains no object of the requested name, we will
+             * implicitly create an empty one so that the alias can still be
+             * used.
+             *
+             * We want to create the implicit object only if the alias is
+             * actually used, but we can't tell here for wildcard aliases (only
+             * a later visitor call will determine this). This means that
+             * wildcard aliases must never have optional keys in their source
+             * path.
+             */
+            if (!a->name || alias_present(qiv, a, a->name)) {
+                *implicit_object = true;
+            }
+        }
+    }
+
+    return false;
+}
+
+/*
+ * Find the place in the input where the value for the object member
+ * @name in @so is specified, considering applicable aliases.
+ *
+ * If a value could be found, true is returned and @so and @name are
+ * updated to identify the key name and StackObject where the value
+ * can be found in the input.  (This is either unchanged or the
+ * alias_so/name of an alias.)  The value of @implicit_object on
+ * return is undefined in this case.
+ *
+ * If no value could be found in the input, false is returned.  This
+ * is not an error and @errp remains unchanged.  If @implicit_object
+ * is non-NULL, it is set to true if the given name is a prefix of the
+ * source path of an alias for which a value may be present in the
+ * input.  It is set to false otherwise.
+ *
+ * If an error occurs (e.g. two values are specified for the member
+ * through different names), false is returned and @errp is set.  The
+ * value of @implicit_object on return is undefined in this case.
+ */
+static bool find_object_member(QObjectInputVisitor *qiv,
+                               StackObject **so, const char **name,
+                               bool *implicit_object, Error **errp)
+{
+    StackObject *cur_so = *so;
+    QDict *qdict = qobject_to(QDict, cur_so->obj);
+    const char *found = NULL;
+    bool found_is_wildcard = false;
+    InputVisitorAlias *a;
+
+    if (implicit_object) {
+        *implicit_object = false;
+    }
+
+    /* Directly present in the container */
+    if (qdict_haskey(qdict, *name)) {
+        found = *name;
+    }
+
+    /*
+     * Find aliases whose source path matches @name in this StackObject. We can
+     * then get the value with the key a->name from a->alias_so.
+     */
+    QSLIST_FOREACH(a, &cur_so->aliases, next) {
+        if (a->name == NULL && found) {
+            /*
+             * Skip wildcard aliases if we already have a match. This is
+             * not a conflict that should result in an error.
+             */
+            continue;
+        }
+
+        if (!alias_source_matches(qiv, cur_so, a, *name, implicit_object)) {
+            continue;
+        }
+
+        if (!alias_present(qiv, a, *name)) {
+            continue;
+        }
+
+        if (found && !found_is_wildcard) {
+            error_setg(errp, "Value for parameter %s was already given "
+                       "through an alias",
+                       full_name_so(qiv, *name, false, *so));
+            return false;
+        } else {
+            found = a->name ?: *name;
+            *so = a->alias_so;
+            found_is_wildcard = !a->name;
+        }
+    }
+
+    /* Chained aliases: *so/found might be the source of another alias */
+    if (found && (*so != cur_so || found != *name)) {
+        find_object_member(qiv, so, &found, NULL, errp);
+    }
+
+    *name = found;
+    return found;
+}
+
 static QObject *qobject_input_try_get_object(QObjectInputVisitor *qiv,
                                              const char *name,
-                                             bool consume)
+                                             bool consume, Error **errp)
 {
     StackObject *tos;
     QObject *qobj;
@@ -187,10 +358,30 @@ static QObject *qobject_input_try_get_object(QObjectInputVisitor *qiv,
     assert(qobj);
 
     if (qobject_type(qobj) == QTYPE_QDICT) {
-        assert(name);
-        ret = qdict_get(qobject_to(QDict, qobj), name);
-        if (tos->h && consume && ret) {
-            bool removed = g_hash_table_remove(tos->h, name);
+        StackObject *so = tos;
+        const char *key = name;
+        bool implicit_object;
+
+        assert(key);
+        if (!find_object_member(qiv, &so, &key, &implicit_object, errp)) {
+            if (implicit_object) {
+                /*
+                 * The member is not present in the input, but
+                 * something inside of it might still be given through
+                 * an alias. Pretend there was an empty object in the
+                 * input.
+                 */
+                if (!qiv->empty_qdict) {
+                    qiv->empty_qdict = qdict_new();
+                }
+                return QOBJECT(qiv->empty_qdict);
+            } else {
+                return NULL;
+            }
+        }
+        ret = qdict_get(qobject_to(QDict, so->obj), key);
+        if (so->h && consume && ret) {
+            bool removed = g_hash_table_remove(so->h, key);
             assert(removed);
         }
     } else {
@@ -216,9 +407,10 @@ static QObject *qobject_input_get_object(QObjectInputVisitor *qiv,
                                          const char *name,
                                          bool consume, Error **errp)
 {
-    QObject *obj = qobject_input_try_get_object(qiv, name, consume);
+    ERRP_GUARD();
+    QObject *obj = qobject_input_try_get_object(qiv, name, consume, errp);
 
-    if (!obj) {
+    if (!obj && !*errp) {
         error_setg(errp, QERR_MISSING_PARAMETER, full_name(qiv, name));
     }
     return obj;
@@ -799,13 +991,16 @@ static bool qobject_input_type_size_keyval(Visitor *v, const char *name,
 static void qobject_input_optional(Visitor *v, const char *name, bool *present)
 {
     QObjectInputVisitor *qiv = to_qiv(v);
-    QObject *qobj = qobject_input_try_get_object(qiv, name, false);
+    Error *local_err = NULL;
+    QObject *qobj = qobject_input_try_get_object(qiv, name, false, &local_err);
 
-    if (!qobj) {
+    /* If there was an error, let the caller try and run into the error */
+    if (!qobj && !local_err) {
         *present = false;
         return;
     }
 
+    error_free(local_err);
     *present = true;
 }
 
@@ -820,6 +1015,7 @@ static void qobject_input_free(Visitor *v)
         qobject_input_stack_object_free(tos);
     }
 
+    qobject_unref(qiv->empty_qdict);
     qobject_unref(qiv->root);
     if (qiv->errname) {
         g_string_free(qiv->errname, TRUE);
-- 
2.29.2


