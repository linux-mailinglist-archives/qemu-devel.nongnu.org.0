Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DEF22173F2
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jul 2020 18:29:19 +0200 (CEST)
Received: from localhost ([::1]:45008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jsqT8-0000d0-6f
	for lists+qemu-devel@lfdr.de; Tue, 07 Jul 2020 12:29:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jsq7N-0002XC-KG
 for qemu-devel@nongnu.org; Tue, 07 Jul 2020 12:06:49 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:29453
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jsq78-0006rA-Ip
 for qemu-devel@nongnu.org; Tue, 07 Jul 2020 12:06:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594137993;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Bw2KULU9h3zQnDLahiBARIsKp/Vv98PcRv0ZHFxt45M=;
 b=KUyhQJE4aHB4CQhOm/fqlPg3iWOzwqZCFZkGwOHd5YSy7n/+hssgTv7a33N3eBpTJapC14
 X5AjT+xNAjo0t7PzapWAwbsCm+CORRCxaJ3heymoP8vL2bAARtHA4SqImUtEtxdjDaLd+3
 NlgkDC2oPrz4lvvXK8KKB+ehnf9BB7c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-9-raBluHqAPjyXBcjcwFoq2A-1; Tue, 07 Jul 2020 12:06:29 -0400
X-MC-Unique: raBluHqAPjyXBcjcwFoq2A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7AF2A10059A8;
 Tue,  7 Jul 2020 16:06:27 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-143.ams2.redhat.com
 [10.36.112.143])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EC0FA797F0;
 Tue,  7 Jul 2020 16:06:26 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id E051411275F5; Tue,  7 Jul 2020 18:06:13 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 27/45] qom: Make functions taking Error ** return bool,
 not void
Date: Tue,  7 Jul 2020 18:05:55 +0200
Message-Id: <20200707160613.848843-28-armbru@redhat.com>
In-Reply-To: <20200707160613.848843-1-armbru@redhat.com>
References: <20200707160613.848843-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=armbru@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/07 00:46:09
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: peter.maydell@linaro.org, vsementsov@virtuozzo.com, berrange@redhat.com,
 ehabkost@redhat.com, qemu-block@nongnu.org, groug@kaod.org,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

See recent commit "error: Document Error API usage rules" for
rationale.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 include/qom/object.h            | 42 ++++++++++----
 include/qom/object_interfaces.h | 12 +++-
 include/qom/qom-qobject.h       |  4 +-
 qom/object.c                    | 99 +++++++++++++++++++++------------
 qom/object_interfaces.c         | 21 ++++---
 qom/qom-qobject.c               |  6 +-
 6 files changed, 122 insertions(+), 62 deletions(-)

diff --git a/include/qom/object.h b/include/qom/object.h
index e60aa8dd5c..189f8ecbf6 100644
--- a/include/qom/object.h
+++ b/include/qom/object.h
@@ -703,7 +703,7 @@ Object *object_new_with_propv(const char *typename,
                               Error **errp,
                               va_list vargs);
 
-void object_apply_global_props(Object *obj, const GPtrArray *props,
+bool object_apply_global_props(Object *obj, const GPtrArray *props,
                                Error **errp);
 void object_set_machine_compat_props(GPtrArray *compat_props);
 void object_set_accelerator_compat_props(GPtrArray *compat_props);
@@ -798,8 +798,10 @@ void object_initialize(void *obj, size_t size, const char *typename);
  * strings. The propname of %NULL indicates the end of the property list.
  * If the object implements the user creatable interface, the object will
  * be marked complete once all the properties have been processed.
+ *
+ * Returns: %true on success, %false on failure.
  */
-void object_initialize_child_with_props(Object *parentobj,
+bool object_initialize_child_with_props(Object *parentobj,
                              const char *propname,
                              void *childobj, size_t size, const char *type,
                              Error **errp, ...) QEMU_SENTINEL;
@@ -815,8 +817,10 @@ void object_initialize_child_with_props(Object *parentobj,
  * @vargs: list of property names and values
  *
  * See object_initialize_child() for documentation.
+ *
+ * Returns: %true on success, %false on failure.
  */
-void object_initialize_child_with_propsv(Object *parentobj,
+bool object_initialize_child_with_propsv(Object *parentobj,
                               const char *propname,
                               void *childobj, size_t size, const char *type,
                               Error **errp, va_list vargs);
@@ -1197,8 +1201,10 @@ void object_unparent(Object *obj);
  * @errp: returns an error if this function fails
  *
  * Reads a property from a object.
+ *
+ * Returns: %true on success, %false on failure.
  */
-void object_property_get(Object *obj, const char *name, Visitor *v,
+bool object_property_get(Object *obj, const char *name, Visitor *v,
                          Error **errp);
 
 /**
@@ -1208,8 +1214,10 @@ void object_property_get(Object *obj, const char *name, Visitor *v,
  * @errp: returns an error if this function fails
  *
  * Writes a string value to a property.
+ *
+ * Returns: %true on success, %false on failure.
  */
-void object_property_set_str(Object *obj, const char *name,
+bool object_property_set_str(Object *obj, const char *name,
                              const char *value, Error **errp);
 
 /**
@@ -1237,8 +1245,9 @@ char *object_property_get_str(Object *obj, const char *name,
  * <code>OBJ_PROP_LINK_STRONG</code> bit, the old target object is
  * unreferenced, and a reference is added to the new target object.
  *
+ * Returns: %true on success, %false on failure.
  */
-void object_property_set_link(Object *obj, const char *name,
+bool object_property_set_link(Object *obj, const char *name,
                               Object *value, Error **errp);
 
 /**
@@ -1261,8 +1270,10 @@ Object *object_property_get_link(Object *obj, const char *name,
  * @errp: returns an error if this function fails
  *
  * Writes a bool value to a property.
+ *
+ * Returns: %true on success, %false on failure.
  */
-void object_property_set_bool(Object *obj, const char *name,
+bool object_property_set_bool(Object *obj, const char *name,
                               bool value, Error **errp);
 
 /**
@@ -1284,8 +1295,10 @@ bool object_property_get_bool(Object *obj, const char *name,
  * @errp: returns an error if this function fails
  *
  * Writes an integer value to a property.
+ *
+ * Returns: %true on success, %false on failure.
  */
-void object_property_set_int(Object *obj, const char *name,
+bool object_property_set_int(Object *obj, const char *name,
                              int64_t value, Error **errp);
 
 /**
@@ -1307,8 +1320,10 @@ int64_t object_property_get_int(Object *obj, const char *name,
  * @errp: returns an error if this function fails
  *
  * Writes an unsigned integer value to a property.
+ *
+ * Returns: %true on success, %false on failure.
  */
-void object_property_set_uint(Object *obj, const char *name,
+bool object_property_set_uint(Object *obj, const char *name,
                               uint64_t value, Error **errp);
 
 /**
@@ -1347,8 +1362,10 @@ int object_property_get_enum(Object *obj, const char *name,
  * @errp: returns an error if this function fails
  *
  * Writes a property to a object.
+ *
+ * Returns: %true on success, %false on failure.
  */
-void object_property_set(Object *obj, const char *name, Visitor *v,
+bool object_property_set(Object *obj, const char *name, Visitor *v,
                          Error **errp);
 
 /**
@@ -1359,8 +1376,10 @@ void object_property_set(Object *obj, const char *name, Visitor *v,
  * @errp: returns an error if this function fails
  *
  * Parses a string and writes the result into a property of an object.
+ *
+ * Returns: %true on success, %false on failure.
  */
-void object_property_parse(Object *obj, const char *name,
+bool object_property_parse(Object *obj, const char *name,
                            const char *string, Error **errp);
 
 /**
@@ -1803,6 +1822,7 @@ ObjectProperty *object_property_add_const_link(Object *obj, const char *name,
  *
  * Set an object property's description.
  *
+ * Returns: %true on success, %false on failure.
  */
 void object_property_set_description(Object *obj, const char *name,
                                      const char *description);
diff --git a/include/qom/object_interfaces.h b/include/qom/object_interfaces.h
index 65172120fa..7035829337 100644
--- a/include/qom/object_interfaces.h
+++ b/include/qom/object_interfaces.h
@@ -57,8 +57,10 @@ typedef struct UserCreatableClass {
  * Wrapper to call complete() method if one of types it's inherited
  * from implements USER_CREATABLE interface, otherwise the call does
  * nothing.
+ *
+ * Returns: %true on success, %false on failure.
  */
-void user_creatable_complete(UserCreatable *uc, Error **errp);
+bool user_creatable_complete(UserCreatable *uc, Error **errp);
 
 /**
  * user_creatable_can_be_deleted:
@@ -100,8 +102,10 @@ Object *user_creatable_add_type(const char *type, const char *id,
  * @qdict.  The object type is taken from the QDict key 'qom-type', its
  * ID from the key 'id'. The remaining entries in @qdict are used to
  * initialize the object properties.
+ *
+ * Returns: %true on success, %false on failure.
  */
-void user_creatable_add_dict(QDict *qdict, bool keyval, Error **errp);
+bool user_creatable_add_dict(QDict *qdict, bool keyval, Error **errp);
 
 /**
  * user_creatable_add_opts:
@@ -167,8 +171,10 @@ bool user_creatable_print_help(const char *type, QemuOpts *opts);
  *
  * Delete an instance of the user creatable object identified
  * by @id.
+ *
+ * Returns: %true on success, %false on failure.
  */
-void user_creatable_del(const char *id, Error **errp);
+bool user_creatable_del(const char *id, Error **errp);
 
 /**
  * user_creatable_cleanup:
diff --git a/include/qom/qom-qobject.h b/include/qom/qom-qobject.h
index ad9a98dd62..73e4e0e474 100644
--- a/include/qom/qom-qobject.h
+++ b/include/qom/qom-qobject.h
@@ -33,8 +33,10 @@ struct QObject *object_property_get_qobject(Object *obj, const char *name,
  * @errp: returns an error if this function fails
  *
  * Writes a property to a object.
+ *
+ * Returns: %true on success, %false on failure.
  */
-void object_property_set_qobject(Object *obj,
+bool object_property_set_qobject(Object *obj,
                                  const char *name, struct QObject *value,
                                  struct Error **errp);
 
diff --git a/qom/object.c b/qom/object.c
index b34bac4874..c4b915a484 100644
--- a/qom/object.c
+++ b/qom/object.c
@@ -385,12 +385,13 @@ static void object_post_init_with_type(Object *obj, TypeImpl *ti)
     }
 }
 
-void object_apply_global_props(Object *obj, const GPtrArray *props, Error **errp)
+bool object_apply_global_props(Object *obj, const GPtrArray *props,
+                               Error **errp)
 {
     int i;
 
     if (!props) {
-        return;
+        return true;
     }
 
     for (i = 0; i < props->len; i++) {
@@ -415,12 +416,14 @@ void object_apply_global_props(Object *obj, const GPtrArray *props, Error **errp
              */
             if (errp) {
                 error_propagate(errp, err);
-                return;
+                return false;
             } else {
                 warn_report_err(err);
             }
         }
     }
+
+    return true;
 }
 
 /*
@@ -524,25 +527,31 @@ void object_initialize(void *data, size_t size, const char *typename)
     object_initialize_with_type(data, size, type);
 }
 
-void object_initialize_child_with_props(Object *parentobj,
-                             const char *propname,
-                             void *childobj, size_t size, const char *type,
-                             Error **errp, ...)
+bool object_initialize_child_with_props(Object *parentobj,
+                                        const char *propname,
+                                        void *childobj, size_t size,
+                                        const char *type,
+                                        Error **errp, ...)
 {
     va_list vargs;
+    bool ok;
 
     va_start(vargs, errp);
-    object_initialize_child_with_propsv(parentobj, propname,
-                                        childobj, size, type, errp, vargs);
+    ok = object_initialize_child_with_propsv(parentobj, propname,
+                                             childobj, size, type, errp,
+                                             vargs);
     va_end(vargs);
+    return ok;
 }
 
-void object_initialize_child_with_propsv(Object *parentobj,
-                              const char *propname,
-                              void *childobj, size_t size, const char *type,
-                              Error **errp, va_list vargs)
+bool object_initialize_child_with_propsv(Object *parentobj,
+                                         const char *propname,
+                                         void *childobj, size_t size,
+                                         const char *type,
+                                         Error **errp, va_list vargs)
 {
     Error *local_err = NULL;
+    bool ok = false;
     Object *obj;
     UserCreatable *uc;
 
@@ -564,6 +573,8 @@ void object_initialize_child_with_propsv(Object *parentobj,
         }
     }
 
+    ok = true;
+
 out:
     /*
      * We want @obj's reference to be 1 on success, 0 on failure.
@@ -576,6 +587,7 @@ out:
     object_unref(obj);
 
     error_propagate(errp, local_err);
+    return ok;
 }
 
 void object_initialize_child_internal(Object *parent,
@@ -1298,43 +1310,52 @@ void object_property_del(Object *obj, const char *name)
     g_hash_table_remove(obj->properties, name);
 }
 
-void object_property_get(Object *obj, const char *name, Visitor *v,
+bool object_property_get(Object *obj, const char *name, Visitor *v,
                          Error **errp)
 {
+    Error *err = NULL;
     ObjectProperty *prop = object_property_find(obj, name, errp);
+
     if (prop == NULL) {
-        return;
+        return false;
     }
 
     if (!prop->get) {
         error_setg(errp, QERR_PERMISSION_DENIED);
-    } else {
-        prop->get(obj, v, name, prop->opaque, errp);
+        return false;
     }
+    prop->get(obj, v, name, prop->opaque, &err);
+    error_propagate(errp, err);
+    return !err;
 }
 
-void object_property_set(Object *obj, const char *name, Visitor *v,
+bool object_property_set(Object *obj, const char *name, Visitor *v,
                          Error **errp)
 {
+    Error *err = NULL;
     ObjectProperty *prop = object_property_find(obj, name, errp);
+
     if (prop == NULL) {
-        return;
+        return false;
     }
 
     if (!prop->set) {
         error_setg(errp, QERR_PERMISSION_DENIED);
-    } else {
-        prop->set(obj, v, name, prop->opaque, errp);
+        return false;
     }
+    prop->set(obj, v, name, prop->opaque, &err);
+    error_propagate(errp, err);
+    return !err;
 }
 
-void object_property_set_str(Object *obj, const char *name,
+bool object_property_set_str(Object *obj, const char *name,
                              const char *value, Error **errp)
 {
     QString *qstr = qstring_from_str(value);
-    object_property_set_qobject(obj, name, QOBJECT(qstr), errp);
+    bool ok = object_property_set_qobject(obj, name, QOBJECT(qstr), errp);
 
     qobject_unref(qstr);
+    return ok;
 }
 
 char *object_property_get_str(Object *obj, const char *name,
@@ -1356,16 +1377,15 @@ char *object_property_get_str(Object *obj, const char *name,
     return retval;
 }
 
-void object_property_set_link(Object *obj, const char *name,
+bool object_property_set_link(Object *obj, const char *name,
                               Object *value, Error **errp)
 {
+    g_autofree char *path = NULL;
+
     if (value) {
-        char *path = object_get_canonical_path(value);
-        object_property_set_str(obj, name, path, errp);
-        g_free(path);
-    } else {
-        object_property_set_str(obj, name, "", errp);
+        path = object_get_canonical_path(value);
     }
+    return object_property_set_str(obj, name, path ?: "", errp);
 }
 
 Object *object_property_get_link(Object *obj, const char *name,
@@ -1386,13 +1406,14 @@ Object *object_property_get_link(Object *obj, const char *name,
     return target;
 }
 
-void object_property_set_bool(Object *obj, const char *name,
+bool object_property_set_bool(Object *obj, const char *name,
                               bool value, Error **errp)
 {
     QBool *qbool = qbool_from_bool(value);
-    object_property_set_qobject(obj, name, QOBJECT(qbool), errp);
+    bool ok = object_property_set_qobject(obj, name, QOBJECT(qbool), errp);
 
     qobject_unref(qbool);
+    return ok;
 }
 
 bool object_property_get_bool(Object *obj, const char *name,
@@ -1417,13 +1438,14 @@ bool object_property_get_bool(Object *obj, const char *name,
     return retval;
 }
 
-void object_property_set_int(Object *obj, const char *name,
+bool object_property_set_int(Object *obj, const char *name,
                              int64_t value, Error **errp)
 {
     QNum *qnum = qnum_from_int(value);
-    object_property_set_qobject(obj, name, QOBJECT(qnum), errp);
+    bool ok = object_property_set_qobject(obj, name, QOBJECT(qnum), errp);
 
     qobject_unref(qnum);
+    return ok;
 }
 
 int64_t object_property_get_int(Object *obj, const char *name,
@@ -1486,13 +1508,14 @@ void object_property_set_default_uint(ObjectProperty *prop, uint64_t value)
     object_property_set_default(prop, QOBJECT(qnum_from_uint(value)));
 }
 
-void object_property_set_uint(Object *obj, const char *name,
+bool object_property_set_uint(Object *obj, const char *name,
                               uint64_t value, Error **errp)
 {
     QNum *qnum = qnum_from_uint(value);
+    bool ok = object_property_set_qobject(obj, name, QOBJECT(qnum), errp);
 
-    object_property_set_qobject(obj, name, QOBJECT(qnum), errp);
     qobject_unref(qnum);
+    return ok;
 }
 
 uint64_t object_property_get_uint(Object *obj, const char *name,
@@ -1553,12 +1576,14 @@ int object_property_get_enum(Object *obj, const char *name,
     return ret;
 }
 
-void object_property_parse(Object *obj, const char *name,
+bool object_property_parse(Object *obj, const char *name,
                            const char *string, Error **errp)
 {
     Visitor *v = string_input_visitor_new(string);
-    object_property_set(obj, name, v, errp);
+    bool ok = object_property_set(obj, name, v, errp);
+
     visit_free(v);
+    return ok;
 }
 
 char *object_property_print(Object *obj, const char *name, bool human,
diff --git a/qom/object_interfaces.c b/qom/object_interfaces.c
index 4c59ee56d5..382198504c 100644
--- a/qom/object_interfaces.c
+++ b/qom/object_interfaces.c
@@ -14,13 +14,16 @@
 #include "qapi/opts-visitor.h"
 #include "qemu/config-file.h"
 
-void user_creatable_complete(UserCreatable *uc, Error **errp)
+bool user_creatable_complete(UserCreatable *uc, Error **errp)
 {
     UserCreatableClass *ucc = USER_CREATABLE_GET_CLASS(uc);
+    Error *err = NULL;
 
     if (ucc->complete) {
-        ucc->complete(uc, errp);
+        ucc->complete(uc, &err);
+        error_propagate(errp, err);
     }
+    return !err;
 }
 
 bool user_creatable_can_be_deleted(UserCreatable *uc)
@@ -101,7 +104,7 @@ out:
     return obj;
 }
 
-void user_creatable_add_dict(QDict *qdict, bool keyval, Error **errp)
+bool user_creatable_add_dict(QDict *qdict, bool keyval, Error **errp)
 {
     Visitor *v;
     Object *obj;
@@ -111,14 +114,14 @@ void user_creatable_add_dict(QDict *qdict, bool keyval, Error **errp)
     type = g_strdup(qdict_get_try_str(qdict, "qom-type"));
     if (!type) {
         error_setg(errp, QERR_MISSING_PARAMETER, "qom-type");
-        return;
+        return false;
     }
     qdict_del(qdict, "qom-type");
 
     id = g_strdup(qdict_get_try_str(qdict, "id"));
     if (!id) {
         error_setg(errp, QERR_MISSING_PARAMETER, "id");
-        return;
+        return false;
     }
     qdict_del(qdict, "id");
 
@@ -130,6 +133,7 @@ void user_creatable_add_dict(QDict *qdict, bool keyval, Error **errp)
     obj = user_creatable_add_type(type, id, qdict, v, errp);
     visit_free(v);
     object_unref(obj);
+    return !!obj;
 }
 
 Object *user_creatable_add_opts(QemuOpts *opts, Error **errp)
@@ -260,7 +264,7 @@ bool user_creatable_print_help(const char *type, QemuOpts *opts)
     return false;
 }
 
-void user_creatable_del(const char *id, Error **errp)
+bool user_creatable_del(const char *id, Error **errp)
 {
     Object *container;
     Object *obj;
@@ -269,12 +273,12 @@ void user_creatable_del(const char *id, Error **errp)
     obj = object_resolve_path_component(container, id);
     if (!obj) {
         error_setg(errp, "object '%s' not found", id);
-        return;
+        return false;
     }
 
     if (!user_creatable_can_be_deleted(USER_CREATABLE(obj))) {
         error_setg(errp, "object '%s' is in use, can not be deleted", id);
-        return;
+        return false;
     }
 
     /*
@@ -285,6 +289,7 @@ void user_creatable_del(const char *id, Error **errp)
                                  id));
 
     object_unparent(obj);
+    return true;
 }
 
 void user_creatable_cleanup(void)
diff --git a/qom/qom-qobject.c b/qom/qom-qobject.c
index f949572d8a..62ac5e07ac 100644
--- a/qom/qom-qobject.c
+++ b/qom/qom-qobject.c
@@ -17,15 +17,17 @@
 #include "qapi/qobject-input-visitor.h"
 #include "qapi/qobject-output-visitor.h"
 
-void object_property_set_qobject(Object *obj,
+bool object_property_set_qobject(Object *obj,
                                  const char *name, QObject *value,
                                  Error **errp)
 {
     Visitor *v;
+    bool ok;
 
     v = qobject_input_visitor_new(value);
-    object_property_set(obj, name, v, errp);
+    ok = object_property_set(obj, name, v, errp);
     visit_free(v);
+    return ok;
 }
 
 QObject *object_property_get_qobject(Object *obj, const char *name,
-- 
2.26.2


