Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BCFE207C66
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Jun 2020 21:50:25 +0200 (CEST)
Received: from localhost ([::1]:53212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1joBPc-0002Fl-Gz
	for lists+qemu-devel@lfdr.de; Wed, 24 Jun 2020 15:50:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1joBNh-0000U8-1T
 for qemu-devel@nongnu.org; Wed, 24 Jun 2020 15:48:25 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:60501
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1joBNf-0002UR-3q
 for qemu-devel@nongnu.org; Wed, 24 Jun 2020 15:48:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593028102;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EGTL8pM+8wcrg6Z0enRSYsT9IKK6OQ+RsAB8e7e/w5s=;
 b=ikMbmo4xcSgipdTOwYArkOUS4gyC39ti6I/Xk+YCEnuOsq6rkLzfSjlAHnQ9gDCGh5TXwR
 afbrCR9tXc7trS57PS1ZJ6xQBsKoG0Mt5p2Ro3OjCbwWtOpBgH3+ZPiJuoIpTAqDdM5qEH
 E3IQEhbElcL0GoCclCrxi+V4J2It3CE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-197-XKw2PMTFOtGSQB6-ayMg4Q-1; Wed, 24 Jun 2020 15:48:19 -0400
X-MC-Unique: XKw2PMTFOtGSQB6-ayMg4Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A71F210059A5;
 Wed, 24 Jun 2020 19:48:18 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-114-197.ams2.redhat.com [10.36.114.197])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C62BF19934;
 Wed, 24 Jun 2020 19:48:16 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 pbonzini@redhat.com, berrange@redhat.com, ehabkost@redhat.com,
 armbru@redhat.com
Subject: [PATCH v3 1/2] qom: Introduce object_property_try_add_child()
Date: Wed, 24 Jun 2020 21:48:08 +0200
Message-Id: <20200624194809.26600-2-eric.auger@redhat.com>
In-Reply-To: <20200624194809.26600-1-eric.auger@redhat.com>
References: <20200624194809.26600-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/24 02:33:25
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

object_property_add() does not allow object_property_try_add()
to gracefully fail as &error_abort is passed as an error handle.

However such failure can easily be triggered from the QMP shell when,
for instance, one attempts to create an object with an id that already
exists. This is achived from the following call path:

user_creatable_add_type -> object_property_add_child ->
object_property_add

For instance, call twice:
object-add qom-type=memory-backend-ram id=mem1 props.size=1073741824
and QEMU aborts.

This behavior is undesired as a user/management application mistake
in reusing a property ID shouldn't result in loss of the VM and live
data within.

This patch introduces a new function, object_property_try_add_child()
which takes an error handle and turn object_property_try_add() into
a non-static one.

Now the call path becomes:

user_creatable_add_type -> object_property_try_add_child ->
object_property_try_add

and the error is returned gracefully to the QMP client.

(QEMU) object-add qom-type=memory-backend-ram id=mem2  props.size=4294967296
{"return": {}}
(QEMU) object-add qom-type=memory-backend-ram id=mem2  props.size=4294967296
{"error": {"class": "GenericError", "desc": "attempt to add duplicate property
'mem2' to object (type 'container')"}}

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Fixes: d2623129a7de ("qom: Drop parameter @errp of object_property_add() & friends")

---

v2 -> v3:
- don't take the object reference on failure in
  object_property_try_add_child
---
 include/qom/object.h    | 24 ++++++++++++++++++++++--
 qom/object.c            | 21 ++++++++++++++++-----
 qom/object_interfaces.c |  7 +++++--
 3 files changed, 43 insertions(+), 9 deletions(-)

diff --git a/include/qom/object.h b/include/qom/object.h
index 94a61ccc3f..91cf058d86 100644
--- a/include/qom/object.h
+++ b/include/qom/object.h
@@ -1039,7 +1039,7 @@ Object *object_ref(Object *obj);
 void object_unref(Object *obj);
 
 /**
- * object_property_add:
+ * object_property_try_add:
  * @obj: the object to add a property to
  * @name: the name of the property.  This can contain any character except for
  *  a forward slash.  In general, you should use hyphens '-' instead of
@@ -1056,10 +1056,22 @@ void object_unref(Object *obj);
  *   meant to allow a property to free its opaque upon object
  *   destruction.  This may be NULL.
  * @opaque: an opaque pointer to pass to the callbacks for the property
+ * @errp: error handle
  *
  * Returns: The #ObjectProperty; this can be used to set the @resolve
  * callback for child and link properties.
  */
+ObjectProperty *object_property_try_add(Object *obj, const char *name,
+                                        const char *type,
+                                        ObjectPropertyAccessor *get,
+                                        ObjectPropertyAccessor *set,
+                                        ObjectPropertyRelease *release,
+                                        void *opaque, Error **errp);
+
+/**
+ * object_property_add: same as object_property_try_add with
+ * errp hardcoded to &error_abort
+ */
 ObjectProperty *object_property_add(Object *obj, const char *name,
                                     const char *type,
                                     ObjectPropertyAccessor *get,
@@ -1495,10 +1507,11 @@ Object *object_resolve_path_type(const char *path, const char *typename,
 Object *object_resolve_path_component(Object *parent, const char *part);
 
 /**
- * object_property_add_child:
+ * object_property_try_add_child:
  * @obj: the object to add a property to
  * @name: the name of the property
  * @child: the child object
+ * @errp: error handle
  *
  * Child properties form the composition tree.  All objects need to be a child
  * of another object.  Objects can only be a child of one object.
@@ -1512,6 +1525,13 @@ Object *object_resolve_path_component(Object *parent, const char *part);
  *
  * Returns: The newly added property on success, or %NULL on failure.
  */
+ObjectProperty *object_property_try_add_child(Object *obj, const char *name,
+                                              Object *child, Error **errp);
+
+/**
+ * object_property_add_child: same as object_property_try_add_child with
+ * errp hardcoded to &error_abort
+ */
 ObjectProperty *object_property_add_child(Object *obj, const char *name,
                                           Object *child);
 
diff --git a/qom/object.c b/qom/object.c
index 6ece96bc2b..dc10bb1889 100644
--- a/qom/object.c
+++ b/qom/object.c
@@ -1132,7 +1132,7 @@ void object_unref(Object *obj)
     }
 }
 
-static ObjectProperty *
+ObjectProperty *
 object_property_try_add(Object *obj, const char *name, const char *type,
                         ObjectPropertyAccessor *get,
                         ObjectPropertyAccessor *set,
@@ -1651,8 +1651,8 @@ static void object_finalize_child_property(Object *obj, const char *name,
 }
 
 ObjectProperty *
-object_property_add_child(Object *obj, const char *name,
-                          Object *child)
+object_property_try_add_child(Object *obj, const char *name,
+                              Object *child, Error **errp)
 {
     g_autofree char *type = NULL;
     ObjectProperty *op;
@@ -1661,14 +1661,25 @@ object_property_add_child(Object *obj, const char *name,
 
     type = g_strdup_printf("child<%s>", object_get_typename(child));
 
-    op = object_property_add(obj, name, type, object_get_child_property, NULL,
-                             object_finalize_child_property, child);
+    op = object_property_try_add(obj, name, type, object_get_child_property,
+                                 NULL, object_finalize_child_property,
+                                 child, errp);
+    if (!op) {
+        return NULL;
+    }
     op->resolve = object_resolve_child_property;
     object_ref(child);
     child->parent = obj;
     return op;
 }
 
+ObjectProperty *
+object_property_add_child(Object *obj, const char *name,
+                          Object *child)
+{
+    return object_property_try_add_child(obj, name, child, &error_abort);
+}
+
 void object_property_allow_set_link(const Object *obj, const char *name,
                                     Object *val, Error **errp)
 {
diff --git a/qom/object_interfaces.c b/qom/object_interfaces.c
index 7e26f86fa6..1e05e41d2f 100644
--- a/qom/object_interfaces.c
+++ b/qom/object_interfaces.c
@@ -82,8 +82,11 @@ Object *user_creatable_add_type(const char *type, const char *id,
     }
 
     if (id != NULL) {
-        object_property_add_child(object_get_objects_root(),
-                                  id, obj);
+        object_property_try_add_child(object_get_objects_root(),
+                                      id, obj, &local_err);
+        if (local_err) {
+            goto out;
+        }
     }
 
     user_creatable_complete(USER_CREATABLE(obj), &local_err);
-- 
2.20.1


