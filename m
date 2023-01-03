Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E92D65C5EC
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Jan 2023 19:18:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pClrJ-0008Lt-9u; Tue, 03 Jan 2023 13:17:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pClqT-0008Fu-Eg
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 13:17:20 -0500
Received: from mail-vk1-xa2a.google.com ([2607:f8b0:4864:20::a2a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pClqQ-00057h-2K
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 13:17:04 -0500
Received: by mail-vk1-xa2a.google.com with SMTP id bk19so4768833vkb.11
 for <qemu-devel@nongnu.org>; Tue, 03 Jan 2023 10:17:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=poMxRDPn366GZBea/9dCLSAffdWXTadkp9C7Z8GBPIw=;
 b=EhHns2BUCjMTPif02/2HFPX0/2nXbqiCJvTl9wtnSGwYvXjrzQimjlvliJWSLMmPvv
 6E7BMMEI1KK5uWZ00an6oh95H8+wbUEk/wE2kXxFkSqRb18FFN8OzfcyZOmoX4XPlCWI
 o/CXLl8+Wf0tgNMKx01hrEWbxrdeajpOgHmkzwXb0JWds0xe7kGl8og5Oi0NZDySukiG
 qtR13mAASgzmUKqLx/2XASjoAkBL8728vEGoH//xnTZik9vjKYd803EeCMegnyQf5k36
 yYNtQGBAEk2Peim2ARjSpHfoBFVzI5uUIIhh8jAa/gpn20nPd6t4dlNFw4DwbtN6AqR7
 lRSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=poMxRDPn366GZBea/9dCLSAffdWXTadkp9C7Z8GBPIw=;
 b=2tAh8wJX4CIMfcvO9QycPGX+tG0oSKGZsj8ZFTiUaWdzpTJXpMr8+Ttzo7qVSjHF0e
 frYZxli8KlyIcth+bkpx7AliQcJ07WekHOLQ3RuWr4O7r0Zqx9F4EoXJf7bIpQxPhepk
 /t3TlqZXH5K3RVr2+VmyU6RugDDc5XC6PRMdHxMNsSQBIwKnAl2lBTDH6LsY2sJAlKYs
 r+hOtI1CHBTjMMFojBodDdB9v05hjhhlMg3mBuCcV/tkH+cijMlSaCEpfv3hqZ2d3Mq2
 NvVsF0fxb0X7uREjdiOXJsc9kMBgUCGAerRPNrk17ohw6w6/7GUBUuTSSCJDkdHOWTbo
 SACg==
X-Gm-Message-State: AFqh2krM4mKG2U8H0v5xHCj2KRM6NMpU/KthB2mPks+ZbjUy2pdDzh3+
 dYW1KlnSMzzgKEVO7PQSES4HMB4RRNgpffkf8Vg=
X-Google-Smtp-Source: AMrXdXtHUMzmtvsM5YbzCrdLPmwf3TsLDbFoyKichdhHRwGXyHxwT/dkeSPDP3gNesplAq6rerhv3A==
X-Received: by 2002:a1f:bdcf:0:b0:3d5:6850:70ac with SMTP id
 n198-20020a1fbdcf000000b003d5685070acmr13190791vkf.13.1672769820779; 
 Tue, 03 Jan 2023 10:17:00 -0800 (PST)
Received: from stoup.. ([2607:fb90:8060:51a2:184b:6e49:c396:be2])
 by smtp.gmail.com with ESMTPSA id
 v2-20020a05620a440200b006fed2788751sm23042354qkp.76.2023.01.03.10.16.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Jan 2023 10:17:00 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, berrange@redhat.com, eduardo@habkost.net,
 armbru@redhat.com, ajones@ventanamicro.com, alex.bennee@linaro.org
Subject: [RFC PATCH 03/40] qom: Create class properties
Date: Tue,  3 Jan 2023 10:16:09 -0800
Message-Id: <20230103181646.55711-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230103181646.55711-1-richard.henderson@linaro.org>
References: <20230103181646.55711-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::a2a;
 envelope-from=richard.henderson@linaro.org; helo=mail-vk1-xa2a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

These properties apply to the class itself, as opposed to
object_class_property_* in which the property is attached
to the class but applies to each object instance.

Apply global properties via a class_late_init on DeviceClass.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/core/qdev-prop-internal.h |   2 +
 include/qom/object.h         |  63 ++++++++++++
 include/qom/qom-qobject.h    |  28 +++++
 hw/core/cpu-common.c         |  61 ++++++++---
 hw/core/qdev-properties.c    |  36 +++++++
 hw/core/qdev.c               |   2 +
 qom/object.c                 | 194 +++++++++++++++++++++++++++++++++++
 qom/object_interfaces.c      |  13 +++
 qom/qom-qmp-cmds.c           |  37 +++++++
 9 files changed, 419 insertions(+), 17 deletions(-)

diff --git a/hw/core/qdev-prop-internal.h b/hw/core/qdev-prop-internal.h
index d7b77844fe..21cd3bca27 100644
--- a/hw/core/qdev-prop-internal.h
+++ b/hw/core/qdev-prop-internal.h
@@ -25,4 +25,6 @@ void qdev_propinfo_get_int32(Object *obj, Visitor *v, const char *name,
 void qdev_propinfo_get_size32(Object *obj, Visitor *v, const char *name,
                               void *opaque, Error **errp);
 
+bool device_class_late_init(ObjectClass *class, Error **errp);
+
 #endif
diff --git a/include/qom/object.h b/include/qom/object.h
index 86958abe15..caa4774f80 100644
--- a/include/qom/object.h
+++ b/include/qom/object.h
@@ -27,8 +27,25 @@ typedef struct InterfaceInfo InterfaceInfo;
 
 #define TYPE_OBJECT "object"
 
+typedef struct ClassProperty ClassProperty;
 typedef struct ObjectProperty ObjectProperty;
 
+/**
+ * typedef ClassPropertyAccessor:
+ * @klass: the class that owns the property
+ * @v: the visitor that contains the property data
+ * @name: the name of the property
+ * @opaque: the class property opaque
+ * @errp: a pointer to an Error that is filled if getting/setting fails.
+ *
+ * Called when trying to get/set a property.
+ */
+typedef bool (ClassPropertyAccessor)(ObjectClass *klass,
+                                     Visitor *v,
+                                     const char *name,
+                                     void *opaque,
+                                     Error **errp);
+
 /**
  * typedef ObjectPropertyAccessor:
  * @obj: the object that owns the property
@@ -85,6 +102,16 @@ typedef void (ObjectPropertyRelease)(Object *obj,
  */
 typedef void (ObjectPropertyInit)(Object *obj, ObjectProperty *prop);
 
+struct ClassProperty
+{
+    char *name;
+    char *type;
+    char *description;
+    ClassPropertyAccessor *get;
+    ClassPropertyAccessor *set;
+    void *opaque;
+};
+
 struct ObjectProperty
 {
     char *name;
@@ -135,6 +162,7 @@ struct ObjectClass
 
     ObjectUnparent *unparent;
 
+    GHashTable *class_properties;
     GHashTable *properties;
 };
 
@@ -1072,6 +1100,11 @@ ObjectProperty *object_property_add(Object *obj, const char *name,
 
 void object_property_del(Object *obj, const char *name);
 
+/**
+ * object_class_property_add:
+ *
+ * Add a property to the class, as if added to each object instance.
+ */
 ObjectProperty *object_class_property_add(ObjectClass *klass, const char *name,
                                           const char *type,
                                           ObjectPropertyAccessor *get,
@@ -1079,6 +1112,33 @@ ObjectProperty *object_class_property_add(ObjectClass *klass, const char *name,
                                           ObjectPropertyRelease *release,
                                           void *opaque);
 
+/**
+ * class_property_add:
+ *
+ * Add a property to the class, affecting the class as a whole
+ * rather than each instance.  All such properties are resolved
+ * before the first object instance is created.
+ */
+void class_property_add(ObjectClass *klass, const char *name,
+                        const char *type, const char *desc,
+                        ClassPropertyAccessor *get,
+                        ClassPropertyAccessor *set,
+                        void *opaque);
+
+ClassProperty *class_property_find(ObjectClass *klass, const char *name);
+
+bool class_property_set(ObjectClass *klass, ClassProperty *cp,
+                        Visitor *v, Error **errp);
+bool class_property_set_bool(ObjectClass *klass, const char *name,
+                             bool value, Error **errp);
+bool class_property_set_uint(ObjectClass *klass, const char *name,
+                             uint64_t value, Error **errp);
+
+bool class_property_get(ObjectClass *klass, ClassProperty *cp,
+                        Visitor *v, Error **errp);
+bool class_property_get_bool(ObjectClass *klass, const char *name,
+                             Error **errp);
+
 /**
  * object_property_set_default_bool:
  * @prop: the property to set
@@ -1229,6 +1289,9 @@ void object_class_property_iter_init(ObjectPropertyIterator *iter,
  */
 ObjectProperty *object_property_iter_next(ObjectPropertyIterator *iter);
 
+void class_property_iter_init(ObjectPropertyIterator *iter, ObjectClass *klass);
+ClassProperty *class_property_iter_next(ObjectPropertyIterator *iter);
+
 void object_unparent(Object *obj);
 
 /**
diff --git a/include/qom/qom-qobject.h b/include/qom/qom-qobject.h
index 73e4e0e474..4026fe6964 100644
--- a/include/qom/qom-qobject.h
+++ b/include/qom/qom-qobject.h
@@ -40,4 +40,32 @@ bool object_property_set_qobject(Object *obj,
                                  const char *name, struct QObject *value,
                                  struct Error **errp);
 
+/*
+ * class_property_get_qobject:
+ * @cls: the class object
+ * @name: the name of the property
+ * @errp: returns an error if this function fails
+ *
+ * Returns: the value of the property, converted to QObject, or NULL if
+ * an error occurs.
+ */
+struct QObject *class_property_get_qobject(ObjectClass *cls,
+                                           const char *name,
+                                           struct Error **errp);
+
+/**
+ * class_property_set_qobject:
+ * @cls: the class object
+ * @name: the name of the property
+ * @value: The value that will be written to the property.
+ * @errp: returns an error if this function fails
+ *
+ * Writes a property to a class object.
+ *
+ * Returns: %true on success, %false on failure.
+ */
+bool class_property_set_qobject(ObjectClass *cls,
+                                const char *name, struct QObject *value,
+                                struct Error **errp);
+
 #endif
diff --git a/hw/core/cpu-common.c b/hw/core/cpu-common.c
index 78b5f350a0..34cab4ef31 100644
--- a/hw/core/cpu-common.c
+++ b/hw/core/cpu-common.c
@@ -34,6 +34,7 @@
 #include "hw/qdev-properties.h"
 #include "trace/trace-root.h"
 #include "qemu/plugin.h"
+#include "qapi/string-input-visitor.h"
 
 CPUState *cpu_by_arch_id(int64_t id)
 {
@@ -158,31 +159,57 @@ ObjectClass *cpu_class_by_name(const char *typename, const char *cpu_model)
 static void cpu_common_parse_features(const char *typename, char *features,
                                       Error **errp)
 {
-    char *val;
     static bool cpu_globals_initialized;
-    /* Single "key=value" string being parsed */
-    char *featurestr = features ? strtok(features, ",") : NULL;
+    ObjectClass *klass;
+    char *f;
 
     /* should be called only once, catch invalid users */
     assert(!cpu_globals_initialized);
     cpu_globals_initialized = true;
 
-    while (featurestr) {
-        val = strchr(featurestr, '=');
-        if (val) {
-            GlobalProperty *prop = g_new0(typeof(*prop), 1);
-            *val = 0;
-            val++;
-            prop->driver = typename;
-            prop->property = g_strdup(featurestr);
-            prop->value = g_strdup(val);
-            qdev_prop_register_global(prop);
-        } else {
-            error_setg(errp, "Expected key=value format, found %s.",
-                       featurestr);
+    if (!features) {
+        return;
+    }
+
+    /*
+     * If typename is invalid, we'll register the global properties anyway
+     * and report a warning in qdev_prop_check_globals.
+     * TODO: Report an error early if -cpu typename is invalid; all classes
+     * will have been registered by now, whether or not the target is using
+     * class properties or object properties.
+     */
+    klass = object_class_by_name(typename);
+
+    /* Single "key=value" string being parsed */
+    for (f = strtok(features, ","); f != NULL; f = strtok(NULL, ",")) {
+        char *val = strchr(f, '=');
+        GlobalProperty *prop;
+
+        if (!val) {
+            error_setg(errp, "Expected key=value format, found %s.", f);
             return;
         }
-        featurestr = strtok(NULL, ",");
+        *val++ = 0;
+
+        if (klass) {
+            ClassProperty *cp = class_property_find(klass, f);
+            if (cp) {
+                Visitor *v = string_input_visitor_new(val);
+                bool ok = class_property_set(klass, cp, v, errp);
+
+                visit_free(v);
+                if (!ok) {
+                    return;
+                }
+                continue;
+            }
+        }
+
+        prop = g_new0(typeof(*prop), 1);
+        prop->driver = typename;
+        prop->property = g_strdup(f);
+        prop->value = g_strdup(val);
+        qdev_prop_register_global(prop);
     }
 }
 
diff --git a/hw/core/qdev-properties.c b/hw/core/qdev-properties.c
index f7775d0ea4..30037ddfb2 100644
--- a/hw/core/qdev-properties.c
+++ b/hw/core/qdev-properties.c
@@ -6,6 +6,7 @@
 #include "qemu/ctype.h"
 #include "qemu/error-report.h"
 #include "qapi/visitor.h"
+#include "qapi/string-input-visitor.h"
 #include "qemu/units.h"
 #include "qemu/cutils.h"
 #include "qdev-prop-internal.h"
@@ -821,6 +822,41 @@ void qdev_prop_set_globals(DeviceState *dev)
     }
 }
 
+bool device_class_late_init(ObjectClass *class, Error **errp)
+{
+    GPtrArray *props = global_properties;
+    int i, len = props ? props->len : 0;
+
+    for (i = 0; i < len; i++) {
+        GlobalProperty *p = g_ptr_array_index(props, i);
+        ClassProperty *cp;
+        Visitor *v;
+        bool ok;
+
+        if (object_class_dynamic_cast(class, p->driver) == NULL) {
+            continue;
+        }
+
+        cp = class_property_find(class, p->property);
+        if (!cp) {
+            /* The property may be on the object. */
+            continue;
+        }
+        p->used = true;
+
+        v = string_input_visitor_new(p->value);
+        ok = class_property_set(class, cp, v, errp);
+        visit_free(v);
+
+        if (!ok) {
+            error_prepend(errp, "can't apply global %s.%s=%s: ",
+                          p->driver, p->property, p->value);
+            return false;
+        }
+    }
+    return true;
+}
+
 /* --- 64bit unsigned int 'size' type --- */
 
 static void get_size(Object *obj, Visitor *v, const char *name, void *opaque,
diff --git a/hw/core/qdev.c b/hw/core/qdev.c
index d759c4602c..772aedc914 100644
--- a/hw/core/qdev.c
+++ b/hw/core/qdev.c
@@ -40,6 +40,7 @@
 #include "hw/qdev-clock.h"
 #include "migration/vmstate.h"
 #include "trace.h"
+#include "qdev-prop-internal.h"
 
 static bool qdev_hot_added = false;
 bool qdev_hot_removed = false;
@@ -901,6 +902,7 @@ static const TypeInfo device_type_info = {
     .instance_finalize = device_finalize,
     .class_base_init = device_class_base_init,
     .class_init = device_class_init,
+    .class_late_init = device_class_late_init,
     .abstract = true,
     .class_size = sizeof(DeviceClass),
     .interfaces = (InterfaceInfo[]) {
diff --git a/qom/object.c b/qom/object.c
index 82a5c7d36e..344ca03877 100644
--- a/qom/object.c
+++ b/qom/object.c
@@ -21,6 +21,7 @@
 #include "qapi/string-input-visitor.h"
 #include "qapi/string-output-visitor.h"
 #include "qapi/qobject-input-visitor.h"
+#include "qapi/qobject-output-visitor.h"
 #include "qapi/forward-visitor.h"
 #include "qapi/qapi-builtin-visit.h"
 #include "qapi/qmp/qerror.h"
@@ -34,6 +35,7 @@
 #include "qapi/qmp/qnum.h"
 #include "qapi/qmp/qstring.h"
 #include "qemu/error-report.h"
+#include "sysemu/qtest.h"
 
 #define MAX_INTERFACES 32
 
@@ -76,6 +78,190 @@ struct TypeImpl
     InterfaceImpl interfaces[MAX_INTERFACES];
 };
 
+ClassProperty *class_property_find(ObjectClass *klass, const char *name)
+{
+    ObjectClass *parent_klass;
+
+    if (klass->class_properties) {
+        ClassProperty *p = g_hash_table_lookup(klass->class_properties, name);
+        if (p) {
+            return p;
+        }
+    }
+
+    parent_klass = object_class_get_parent(klass);
+    if (parent_klass) {
+        return class_property_find(parent_klass, name);
+    }
+    return NULL;
+}
+
+static ClassProperty *class_property_find_err(ObjectClass *klass,
+                                              const char *name,
+                                              Error **errp)
+{
+    ClassProperty *cp = class_property_find(klass, name);
+    if (!cp) {
+        error_setg(errp, "Property '%s.%s' not found",
+                   klass->type->name, name);
+    }
+    return cp;
+}
+
+void class_property_add(ObjectClass *klass, const char *name,
+                        const char *type, const char *desc,
+                        ClassPropertyAccessor *get,
+                        ClassPropertyAccessor *set,
+                        void *opaque)
+{
+    ClassProperty *prop;
+
+    assert(!class_property_find(klass, name));
+
+    prop = g_new0(ClassProperty, 1);
+
+    prop->name = g_strdup(name);
+    prop->type = g_strdup(type);
+    prop->description = g_strdup(desc);
+
+    prop->get = get;
+    prop->set = set;
+    prop->opaque = opaque;
+
+    if (!klass->class_properties) {
+        klass->class_properties = g_hash_table_new(g_str_hash, g_str_equal);
+    }
+    g_hash_table_insert(klass->class_properties, prop->name, prop);
+}
+
+bool class_property_set(ObjectClass *klass, ClassProperty *cp,
+                        Visitor *v, Error **errp)
+{
+    /*
+     * FIXME: qtest/device-introspect-test creates one of each board,
+     * inside the same qemu instance.  The class properties for the
+     * cpus may well be adjusted for each board.  This cannot happen
+     * during normal usage.
+     */
+    if (!qtest_enabled() && klass->type->object_created) {
+        error_setg(errp, "Property '%s.%s' set after object creation",
+                   klass->type->name, cp->name);
+        return false;
+    }
+    return cp->set(klass, v, cp->name, cp->opaque, errp);
+}
+
+static bool class_property_set_lookup(ObjectClass *klass, const char *name,
+                                      Visitor *v, Error **errp)
+{
+    ClassProperty *cp = class_property_find_err(klass, name, errp);
+    if (!cp) {
+        return false;
+    }
+    return class_property_set(klass, cp, v, errp);
+}
+
+bool class_property_set_qobject(ObjectClass *klass, const char *name,
+                                QObject *value, Error **errp)
+{
+    Visitor *v = qobject_input_visitor_new(value);
+    bool ok;
+
+    ok = class_property_set_lookup(klass, name, v, errp);
+    visit_free(v);
+    return ok;
+}
+
+bool class_property_set_bool(ObjectClass *klass, const char *name,
+                             bool value, Error **errp)
+{
+    QBool *qbool = qbool_from_bool(value);
+    bool ok;
+
+    ok = class_property_set_qobject(klass, name, QOBJECT(qbool), errp);
+    qobject_unref(qbool);
+    return ok;
+}
+
+bool class_property_set_uint(ObjectClass *klass, const char *name,
+                             uint64_t value, Error **errp)
+{
+    QNum *qnum = qnum_from_uint(value);
+    bool ok;
+
+    ok = class_property_set_qobject(klass, name, QOBJECT(qnum), errp);
+    qobject_unref(qnum);
+    return ok;
+}
+
+bool class_property_get(ObjectClass *klass, ClassProperty *cp,
+                        Visitor *v, Error **errp)
+{
+    return cp->get(klass, v, cp->name, cp->opaque, errp);
+}
+
+static bool class_property_get_lookup(ObjectClass *klass, const char *name,
+                                      Visitor *v, Error **errp)
+{
+    ClassProperty *cp = class_property_find_err(klass, name, errp);
+    if (!cp) {
+        return false;
+    }
+    return class_property_get(klass, cp, v, errp);
+}
+
+
+QObject *class_property_get_qobject(ObjectClass *klass, const char *name,
+                                    Error **errp)
+{
+    QObject *ret = NULL;
+    Visitor *v = qobject_output_visitor_new(&ret);
+
+    if (class_property_get_lookup(klass, name, v, errp)) {
+        visit_complete(v, &ret);
+    }
+    visit_free(v);
+    return ret;
+}
+
+bool class_property_get_bool(ObjectClass *klass, const char *name,
+                             Error **errp)
+{
+    QObject *qobj = class_property_get_qobject(klass, name, errp);
+    bool ret = false;
+
+    if (qobj) {
+        QBool *qbool = qobject_to(QBool, qobj);
+        if (!qbool) {
+            error_setg(errp, QERR_INVALID_PARAMETER_TYPE, name, "boolean");
+        } else {
+            ret = qbool_get_bool(qbool);
+        }
+        qobject_unref(qobj);
+    }
+    return ret;
+}
+
+void class_property_iter_init(ObjectPropertyIterator *iter,
+                              ObjectClass *klass)
+{
+    g_hash_table_iter_init(&iter->iter, klass->class_properties);
+    iter->nextclass = object_class_get_parent(klass);
+}
+
+ClassProperty *class_property_iter_next(ObjectPropertyIterator *iter)
+{
+    gpointer key, val;
+    while (!g_hash_table_iter_next(&iter->iter, &key, &val)) {
+        if (!iter->nextclass) {
+            return NULL;
+        }
+        g_hash_table_iter_init(&iter->iter, iter->nextclass->class_properties);
+        iter->nextclass = object_class_get_parent(iter->nextclass);
+    }
+    return val;
+}
+
 static Type type_interface;
 
 static GHashTable *type_table_get(void)
@@ -322,6 +508,7 @@ static void type_initialize(TypeImpl *ti)
         g_assert(parent->instance_size <= ti->instance_size);
         memcpy(ti->class, parent->class, parent->class_size);
         ti->class->interfaces = NULL;
+        ti->class->class_properties = NULL;
 
         for (e = parent->class->interfaces; e; e = e->next) {
             InterfaceClass *iface = e->data;
@@ -415,12 +602,15 @@ static void object_post_init_with_type(Object *obj, TypeImpl *ti)
 bool object_apply_global_props(Object *obj, const GPtrArray *props,
                                Error **errp)
 {
+    ObjectClass *klass;
     int i;
 
     if (!props) {
         return true;
     }
 
+    klass = object_get_class(obj);
+
     for (i = 0; i < props->len; i++) {
         GlobalProperty *p = g_ptr_array_index(props, i);
         Error *err = NULL;
@@ -428,6 +618,10 @@ bool object_apply_global_props(Object *obj, const GPtrArray *props,
         if (object_dynamic_cast(obj, p->driver) == NULL) {
             continue;
         }
+        if (class_property_find(klass, p->property)) {
+            /* This was handled in device_class_late_init. */
+            continue;
+        }
         if (p->optional && !object_property_find(obj, p->property)) {
             continue;
         }
diff --git a/qom/object_interfaces.c b/qom/object_interfaces.c
index f94b6c3193..aee86eb708 100644
--- a/qom/object_interfaces.c
+++ b/qom/object_interfaces.c
@@ -203,6 +203,7 @@ bool type_print_class_properties(const char *type)
     ObjectClass *klass;
     ObjectPropertyIterator iter;
     ObjectProperty *prop;
+    ClassProperty *cprop;
     GPtrArray *array;
     int i;
 
@@ -212,6 +213,7 @@ bool type_print_class_properties(const char *type)
     }
 
     array = g_ptr_array_new();
+
     object_class_property_iter_init(&iter, klass);
     while ((prop = object_property_iter_next(&iter))) {
         if (!prop->set) {
@@ -222,6 +224,17 @@ bool type_print_class_properties(const char *type)
                         object_property_help(prop->name, prop->type,
                                              prop->defval, prop->description));
     }
+
+    class_property_iter_init(&iter, klass);
+    while ((cprop = class_property_iter_next(&iter))) {
+        if (!cprop->set) {
+            continue;
+        }
+        g_ptr_array_add(array,
+                        object_property_help(cprop->name, cprop->type,
+                                             NULL, cprop->description));
+    }
+
     g_ptr_array_sort(array, (GCompareFunc)qemu_pstrcmp0);
     if (array->len > 0) {
         qemu_printf("%s options:\n", type);
diff --git a/qom/qom-qmp-cmds.c b/qom/qom-qmp-cmds.c
index 7c087299de..ea3f542a1d 100644
--- a/qom/qom-qmp-cmds.c
+++ b/qom/qom-qmp-cmds.c
@@ -34,6 +34,7 @@ ObjectPropertyInfoList *qmp_qom_list(const char *path, Error **errp)
     bool ambiguous = false;
     ObjectPropertyInfoList *props = NULL;
     ObjectProperty *prop;
+    ClassProperty *cprop;
     ObjectPropertyIterator iter;
 
     obj = object_resolve_path(path, &ambiguous);
@@ -57,6 +58,16 @@ ObjectPropertyInfoList *qmp_qom_list(const char *path, Error **errp)
         value->type = g_strdup(prop->type);
     }
 
+    class_property_iter_init(&iter, object_get_class(obj));
+    while ((cprop = class_property_iter_next(&iter))) {
+        ObjectPropertyInfo *value = g_new0(ObjectPropertyInfo, 1);
+
+        QAPI_LIST_PREPEND(props, value);
+
+        value->name = g_strdup(cprop->name);
+        value->type = g_strdup(cprop->type);
+    }
+
     return props;
 }
 
@@ -124,6 +135,7 @@ ObjectPropertyInfoList *qmp_device_list_properties(const char *typename,
     ObjectClass *klass;
     Object *obj;
     ObjectProperty *prop;
+    ClassProperty *cprop;
     ObjectPropertyIterator iter;
     ObjectPropertyInfoList *prop_list = NULL;
 
@@ -172,6 +184,18 @@ ObjectPropertyInfoList *qmp_device_list_properties(const char *typename,
         QAPI_LIST_PREPEND(prop_list, info);
     }
 
+    class_property_iter_init(&iter, klass);
+    while ((cprop = class_property_iter_next(&iter))) {
+        ObjectPropertyInfo *info;
+
+        info = g_new0(ObjectPropertyInfo, 1);
+        info->name = g_strdup(cprop->name);
+        info->type = g_strdup(cprop->type);
+        info->description = g_strdup(cprop->description);
+
+        QAPI_LIST_PREPEND(prop_list, info);
+    }
+
     object_unref(obj);
 
     return prop_list;
@@ -183,6 +207,7 @@ ObjectPropertyInfoList *qmp_qom_list_properties(const char *typename,
     ObjectClass *klass;
     Object *obj = NULL;
     ObjectProperty *prop;
+    ClassProperty *cprop;
     ObjectPropertyIterator iter;
     ObjectPropertyInfoList *prop_list = NULL;
 
@@ -216,6 +241,18 @@ ObjectPropertyInfoList *qmp_qom_list_properties(const char *typename,
         QAPI_LIST_PREPEND(prop_list, info);
     }
 
+    class_property_iter_init(&iter, klass);
+    while ((cprop = class_property_iter_next(&iter))) {
+        ObjectPropertyInfo *info;
+
+        info = g_malloc0(sizeof(*info));
+        info->name = g_strdup(cprop->name);
+        info->type = g_strdup(cprop->type);
+        info->description = g_strdup(cprop->description);
+
+        QAPI_LIST_PREPEND(prop_list, info);
+    }
+
     object_unref(obj);
 
     return prop_list;
-- 
2.34.1


