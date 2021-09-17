Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0293940FDDC
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Sep 2021 18:27:22 +0200 (CEST)
Received: from localhost ([::1]:58970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mRGhs-0007sl-Ss
	for lists+qemu-devel@lfdr.de; Fri, 17 Sep 2021 12:27:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mRGUi-0007RC-Ud
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 12:13:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20214)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mRGUg-0005wr-Tf
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 12:13:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631895221;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xg3h0x5yfiMr/9mI52xncRCUilhlS0Ubgaqa0bUT2yY=;
 b=Jd0RipZSi+hyyQnKweMoXOqEd3mGu7AnmGDjspG3UKx4XO9dqTa80syd9W0/bf2jttfdfq
 Sq7QioEK2GMNx1Yxw66kJQyxY6zPdSOqFopIzGAlogHltmSANmOGaY3v2Af1F6PAAnDQFX
 LabX3LCosrw3tIsKTrDVbl4swPaCUX0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-173-iuIjlwm9PPaty1ITNTKBwg-1; Fri, 17 Sep 2021 12:13:39 -0400
X-MC-Unique: iuIjlwm9PPaty1ITNTKBwg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A986E19611D8
 for <qemu-devel@nongnu.org>; Fri, 17 Sep 2021 16:13:37 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.193.161])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B720660C2B;
 Fri, 17 Sep 2021 16:13:36 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 5/8] qapi: Apply aliases in qobject-input-visitor
Date: Fri, 17 Sep 2021 18:13:17 +0200
Message-Id: <20210917161320.201086-6-kwolf@redhat.com>
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

When looking for an object in a struct in the external representation,
check not only the currently visited struct, but also whether an alias
in the current StackObject matches and try to fetch the value from the
alias then. Providing two values for the same object through different
aliases is an error.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 qapi/qobject-input-visitor.c | 232 +++++++++++++++++++++++++++++++++--
 1 file changed, 223 insertions(+), 9 deletions(-)

diff --git a/qapi/qobject-input-visitor.c b/qapi/qobject-input-visitor.c
index 90ebd2fe95..bf302a6e07 100644
--- a/qapi/qobject-input-visitor.c
+++ b/qapi/qobject-input-visitor.c
@@ -109,6 +109,9 @@ struct QObjectInputVisitor {
     QObject *root;
     bool keyval;                /* Assume @root made with keyval_parse() */
 
+    /* For visiting objects where all members are from aliases */
+    QDict *empty_qdict;
+
     /* Stack of objects being visited (all entries will be either
      * QDict or QList). */
     QSLIST_HEAD(, StackObject) stack;
@@ -181,9 +184,194 @@ static const char *full_name(QObjectInputVisitor *qiv, const char *name)
     return full_name_so(qiv, name, false, tos);
 }
 
+static bool find_object_member(QObjectInputVisitor *qiv,
+                               StackObject **so, const char **name,
+                               bool *is_alias_prefix, Error **errp);
+
+/*
+ * Check whether the member @name in the object visited by @so can be
+ * specified in the input by using the alias described by @a (which
+ * must be an alias contained in so->aliases).
+ *
+ * If @name is only a prefix of the alias source, but doesn't match
+ * immediately, false is returned and *is_alias_prefix is set to true
+ * if it is non-NULL.  In all other cases, *is_alias_prefix is left
+ * unchanged.
+ */
+static bool alias_source_matches(QObjectInputVisitor *qiv,
+                                 StackObject *so, InputVisitorAlias *a,
+                                 const char *name, bool *is_alias_prefix)
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
+        } else if (is_alias_prefix) {
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
+             * path. The QAPI generator checks this condition.
+             */
+            const char *alias_name = a->name;
+            StackObject *alias_so = a->alias_so;
+            if (!a->name || find_object_member(qiv, &alias_so, &alias_name,
+                                               NULL, NULL)) {
+                *is_alias_prefix = true;
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
+ * alias_so/name of an alias.)  The value of @is_alias_prefix on
+ * return is undefined in this case.
+ *
+ * If no value could be found in the input, false is returned and @so
+ * and @name are set to NULL.  This is not an error and @errp remains
+ * unchanged.  If @is_alias_prefix is non-NULL, it is set to true if
+ * the given name is a prefix of the source path of an alias for which
+ * a value may be present in the input.  It is set to false otherwise.
+ *
+ * If an error occurs (e.g. two values are specified for the member
+ * through different names), false is returned and @errp is set.  The
+ * value of @is_alias_prefix is set to false and @name is set to NULL
+ * on return in this case.
+ */
+static bool find_object_member(QObjectInputVisitor *qiv,
+                               StackObject **so, const char **name,
+                               bool *is_alias_prefix, Error **errp)
+{
+    QDict *qdict = qobject_to(QDict, (*so)->obj);
+    const char *found_name = NULL;
+    StackObject *found_so = NULL;
+    bool found_is_wildcard = false;
+    InputVisitorAlias *a;
+
+    if (is_alias_prefix) {
+        *is_alias_prefix = false;
+    }
+
+    /* Directly present in the container */
+    if (qdict_haskey(qdict, *name)) {
+        found_name = *name;
+        found_so = *so;
+    }
+
+    /*
+     * Find aliases whose source path matches @name in this StackObject. We can
+     * then get the value with the key a->name from a->alias_so.
+     */
+    QSIMPLEQ_FOREACH(a, &(*so)->aliases, next) {
+        /*
+         * For single-member aliases, an alias name is specified in the
+         * alias definition. For wildcard aliases, the alias has the same
+         * name as the member in the source object, i.e. *name.
+         */
+        const char *alias_name = a->name ?: *name;
+        StackObject *alias_so = a->alias_so;
+
+        if (!alias_source_matches(qiv, *so, a, *name, is_alias_prefix)) {
+            continue;
+        }
+
+        /*
+         * Check whether the alias is present in the input
+         * (potentially through chained aliases) and update @alias_so
+         * and @alias_name accordingly if so.
+         *
+         * The QAPI generator makes sure that aliases cannot form loops,
+         * so the recursion is guaranteed to terminate.
+         */
+        if (!find_object_member(qiv, &alias_so, &alias_name, NULL, NULL)) {
+            continue;
+        }
+
+        /* Conflict: The input has multiple values for the member */
+        if (found_name) {
+            g_autofree char *name1 =
+                g_strdup(full_name_so(qiv, found_name, false, found_so));
+            g_autofree char *name2 =
+                g_strdup(full_name_so(qiv, alias_name, false, alias_so));
+            Error *local_err = NULL;
+
+            error_setg(&local_err, "Value for parameter '%s' is specified "
+                       "both as '%s' and '%s'",
+                       full_name_so(qiv, *name, false, *so), name1, name2);
+
+            if (!a->name) {
+                /*
+                 * Less local wildcard alias: Assume the value belongs
+                 * elsewhere and ignore it, but store the error in case
+                 * it stays unused.
+                 */
+                g_hash_table_replace(alias_so->h, (void *) alias_name,
+                                     local_err);
+                continue;
+            } else if (found_is_wildcard) {
+                /*
+                 * Override a previously found wildcard alias with a
+                 * single-member alias. Store the error in case the
+                 * value for the wildcard alias isn't used elsewhere.
+                 */
+                g_hash_table_replace(found_so->h, (void *) found_name,
+                                     local_err);
+            } else {
+                /* Any other conflict is definitely an error */
+                error_propagate(errp, local_err);
+                if (is_alias_prefix) {
+                    *is_alias_prefix = false;
+                }
+                *name = NULL;
+                return false;
+            }
+        }
+
+        found_name = alias_name;
+        found_so = alias_so;
+        found_is_wildcard = !a->name;
+    }
+
+    *so = found_so;
+    *name = found_name;
+
+    if (!found_name) {
+        return false;
+    }
+
+    /*
+     * Every source can be used only once. If a value in the input
+     * would end up being used twice through aliases, we'll fail the
+     * second access.
+     */
+    return g_hash_table_contains(found_so->h, found_name);
+}
+
 static QObject *qobject_input_try_get_object(QObjectInputVisitor *qiv,
                                              const char *name,
-                                             bool consume)
+                                             bool consume, Error **errp)
 {
     StackObject *tos;
     QObject *qobj;
@@ -201,10 +389,31 @@ static QObject *qobject_input_try_get_object(QObjectInputVisitor *qiv,
     assert(qobj);
 
     if (qobject_type(qobj) == QTYPE_QDICT) {
-        assert(name);
-        ret = qdict_get(qobject_to(QDict, qobj), name);
-        if (tos->h && consume && ret) {
-            bool removed = g_hash_table_remove(tos->h, name);
+        StackObject *so = tos;
+        const char *key = name;
+        bool is_alias_prefix;
+
+        assert(key);
+        if (!find_object_member(qiv, &so, &key, &is_alias_prefix, errp)) {
+            if (is_alias_prefix) {
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
+        assert(ret != NULL);
+        if (so->h && consume) {
+            bool removed = g_hash_table_remove(so->h, key);
             assert(removed);
         }
     } else {
@@ -230,9 +439,10 @@ static QObject *qobject_input_get_object(QObjectInputVisitor *qiv,
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
@@ -823,13 +1033,16 @@ static bool qobject_input_type_size_keyval(Visitor *v, const char *name,
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
 
@@ -862,6 +1075,7 @@ static void qobject_input_free(Visitor *v)
         qobject_input_stack_object_free(tos);
     }
 
+    qobject_unref(qiv->empty_qdict);
     qobject_unref(qiv->root);
     if (qiv->errname) {
         g_string_free(qiv->errname, TRUE);
-- 
2.31.1


