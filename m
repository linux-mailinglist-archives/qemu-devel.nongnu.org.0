Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 979E74EA25D
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Mar 2022 23:23:44 +0200 (CEST)
Received: from localhost ([::1]:32920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nYwpz-0006aq-Nf
	for lists+qemu-devel@lfdr.de; Mon, 28 Mar 2022 17:23:43 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maxim.davydov@openvz.org>)
 id 1nYwiS-0001t5-R1
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 17:15:56 -0400
Received: from [2a00:1450:4864:20::22a] (port=33533
 helo=mail-lj1-x22a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <maxim.davydov@openvz.org>)
 id 1nYwiQ-0003tN-HJ
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 17:15:56 -0400
Received: by mail-lj1-x22a.google.com with SMTP id u3so21002253ljd.0
 for <qemu-devel@nongnu.org>; Mon, 28 Mar 2022 14:15:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=openvz-org.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uJ24/uglX+XJ03oQfE1/6Xqa97vS7/5YP2QV3HloPNE=;
 b=zodEdULpAD4gqkEAohBBwdu2vU4PULN4V/PWvr+ljHnQxdGXGeHZHUU6wkQU5VkNk3
 biAbiPlGQfjQSL4TVgjAfMGlle01GmBJ5ffaixoO48VhKtaYvlZlqwmG3M0rGDMUazBW
 AWl8PO4+2nani2lI3etIT8SKhTIjqGEc0l8D72hYbMiQbalB8dTQT9ahjrdQcvvlE9Jx
 H+jQOS8gLggl6i5GAwA6WOKoioSBrS6r2wTaJZbw1cqXNhpwJFHRAc2C31CUxsED3gSV
 t3W2ssLlU9cHJoXSROlAr8Jh+92cUeYQkCGpRNSgbBRmLmY9BXcKOamNhY6LAMrgXgIZ
 vXsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uJ24/uglX+XJ03oQfE1/6Xqa97vS7/5YP2QV3HloPNE=;
 b=N5sibDeLSdv+DLkp7GvjVYt9XIz9eRN5ygubIJnB5/tjJ0hd023vyTE8S8Vr45L42Y
 kYT6TnvB7Vtp6f/nr1Dr7B+ehgH/g9leCIYTOM5gvTtupZacl8uovmAmSgAXI2iD/UVz
 kuYVne5Ow0ZGnaHz41zFqspq1zY5hwLiylMYnnAe+nfT8pc8XIpYsX5eG7eZMzlb4ZnA
 iv6wTFIaQA5uFanHHRnaRFmcz591nwnDdcawIXguSEIPWmUQsNa2IPVue2MMeLMvcGIG
 jSh4N6X7+1M1l0FaFWJF0cFt2ngGvF4NuoJEpDQU/t/jRvyKECGoOIz8WFvECvR95xqO
 08KQ==
X-Gm-Message-State: AOAM5314lIC4Dg42Y6f6JiyNBfHXrAgmgBv69n8a0cbhoeb+FBGvmoOv
 DnhbZoyDTdWn/K+To7iGMnwiItrjaXBUKQ==
X-Google-Smtp-Source: ABdhPJzk3AvIq8LDJzhyAUEUlaH5/7lEouvnjFCpI5U7T7dSjrx0bYtxt6+fCCaZklCTFWRa/jHDnA==
X-Received: by 2002:a05:651c:4c9:b0:249:afef:48a6 with SMTP id
 e9-20020a05651c04c900b00249afef48a6mr19144604lji.458.1648502152988; 
 Mon, 28 Mar 2022 14:15:52 -0700 (PDT)
Received: from localhost.localdomain ([93.175.1.181])
 by smtp.gmail.com with ESMTPSA id
 k15-20020a2e92cf000000b002493cc687f3sm1855827ljh.45.2022.03.28.14.15.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Mar 2022 14:15:52 -0700 (PDT)
From: Maxim Davydov <maxim.davydov@openvz.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 8/9] qom: add command to print initial properties
Date: Tue, 29 Mar 2022 00:15:38 +0300
Message-Id: <20220328211539.90170-9-maxim.davydov@openvz.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220328211539.90170-1-maxim.davydov@openvz.org>
References: <20220328211539.90170-1-maxim.davydov@openvz.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::22a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::22a;
 envelope-from=maxim.davydov@openvz.org; helo=mail-lj1-x22a.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: eduardo@habkost.net, v.sementsov-og@mail.ru, berrange@redhat.com,
 xiaoguangrong.eric@gmail.com, mst@redhat.com, jsnow@redhat.com,
 crosa@redhat.com, f4bug@amsat.org, chen.zhang@intel.com, armbru@redhat.com,
 wangyanan55@huawei.com, marcandre.lureau@redhat.com, imammedo@redhat.com,
 lizhijian@fujitsu.com, pbonzini@redhat.com, ani@anisinha.ca, den@openvz.org,
 maxim.davydov@openvz.org, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The command "query-init-properties" is needed to get values of properties
after initialization (not only default value). It makes sense, for example,
when working with x86_64-cpu.
All machine types (and x-remote-object, because its init uses machime
type's infrastructure) should be skipped, because only the one instance can
be correctly initialized.

Signed-off-by: Maxim Davydov <maxim.davydov@openvz.org>
---
 qapi/qom.json      |  69 ++++++++++++++++++++++++++
 qom/qom-qmp-cmds.c | 121 +++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 190 insertions(+)

diff --git a/qapi/qom.json b/qapi/qom.json
index eeb5395ff3..1eedc441eb 100644
--- a/qapi/qom.json
+++ b/qapi/qom.json
@@ -949,3 +949,72 @@
 ##
 { 'command': 'object-del', 'data': {'id': 'str'},
   'allow-preconfig': true }
+
+##
+# @InitValue:
+#
+# Not all objects have default values but they have "initial" values.
+#
+# @name: property name
+#
+# @value: Current value (default or after initialization. It makes sence,
+#         for example, for x86-cpus)
+#
+# Since: 7.0
+#
+##
+{ 'struct': 'InitValue',
+  'data': { 'name': 'str',
+            '*value': 'any' } }
+
+##
+# @ClassProperties:
+#
+# Initial values of properties that are owned by the class
+#
+# @classname: name of the class that owns appropriate properties
+#
+# @classprops: List of class properties
+#
+# Since: 7.0
+#
+##
+{ 'struct': 'ClassProperties',
+  'data': { 'classname': 'str',
+            '*classprops': [ 'InitValue' ] } }
+
+##
+# @InitProps:
+#
+# List of properties and their values that are available after class
+# initialization. So it important to know default value of the property
+# even if it doesn't have "QObject *defval"
+#
+# @name: Object name
+#
+# @props: List of properties
+#
+# Notes: a value in each property was defval if it's available
+#        otherwise it's obtained via "(ObjectPropertyAccessor*) get"
+#        immediately after initialization of device object.
+#
+# Since: 7.0
+#
+##
+{ 'struct': 'InitProps',
+  'data': { 'name': 'str',
+            'props': [ 'ClassProperties' ] } }
+
+##
+# @query-init-properties:
+#
+# Returns list of all objects (except all types related with machine type)
+# with all properties and their "default" values that  will be available
+# after initialization. The main purpose of this command is to be used to
+# build table with all machine-type-specific properties
+#
+# Since: 7.0
+#
+##
+{ 'command': 'query-init-properties',
+  'returns': [ 'InitProps' ] }
diff --git a/qom/qom-qmp-cmds.c b/qom/qom-qmp-cmds.c
index 2d6f41ecc7..c1bb3f1f8b 100644
--- a/qom/qom-qmp-cmds.c
+++ b/qom/qom-qmp-cmds.c
@@ -27,6 +27,7 @@
 #include "qemu/cutils.h"
 #include "qom/object_interfaces.h"
 #include "qom/qom-qobject.h"
+#include "hw/boards.h"
 
 ObjectPropertyInfoList *qmp_qom_list(const char *path, Error **errp)
 {
@@ -235,3 +236,123 @@ void qmp_object_del(const char *id, Error **errp)
 {
     user_creatable_del(id, errp);
 }
+
+static void query_object_prop(InitValueList **props_list, ObjectProperty *prop,
+                              Object *obj, Error **errp)
+{
+    InitValue *prop_info = NULL;
+
+    /* Skip inconsiderable properties */
+    if (strcmp(prop->name, "type") == 0 ||
+        strcmp(prop->name, "realized") == 0 ||
+        strcmp(prop->name, "hotpluggable") == 0 ||
+        strcmp(prop->name, "hotplugged") == 0 ||
+        strcmp(prop->name, "parent_bus") == 0) {
+        return;
+    }
+
+    prop_info = g_malloc0(sizeof(*prop_info));
+    prop_info->name = g_strdup(prop->name);
+    prop_info->value = NULL;
+    if (prop->defval) {
+        prop_info->value = qobject_ref(prop->defval);
+    } else if (prop->get) {
+        /*
+         * crash-information in x86-cpu uses errp to return current state.
+         * So, after requesting this property it returns  GenericError:
+         * "No crash occured"
+         */
+        if (strcmp(prop->name, "crash-information") != 0) {
+            prop_info->value = object_property_get_qobject(obj, prop->name,
+                                                           errp);
+        }
+    }
+    prop_info->has_value = !!prop_info->value;
+
+    QAPI_LIST_PREPEND(*props_list, prop_info);
+}
+
+typedef struct QIPData {
+    InitPropsList **dev_list;
+    Error **errp;
+} QIPData;
+
+static void query_init_properties_tramp(gpointer list_data, gpointer opaque)
+{
+    ObjectClass *k = list_data;
+    Object *obj;
+    ObjectClass *parent;
+    GHashTableIter iter;
+
+    QIPData *data = opaque;
+    ClassPropertiesList *class_props_list = NULL;
+    InitProps *dev_info;
+
+    /* Only one machine can be initialized correctly (it's already happened) */
+    if (object_class_dynamic_cast(k, TYPE_MACHINE)) {
+        return;
+    }
+
+    const char *klass_name = object_class_get_name(k);
+    /*
+     * Uses machine type infrastructure with notifiers. It causes immediate
+     * notify and SEGSEGV during remote_object_machine_done
+     */
+    if (strcmp(klass_name, "x-remote-object") == 0) {
+        return;
+    }
+
+    dev_info = g_malloc0(sizeof(*dev_info));
+    dev_info->name = g_strdup(klass_name);
+
+    obj = object_new_with_class(k);
+
+    /*
+     * Part of ObjectPropertyIterator infrastructure, but we need more precise
+     * control of current class to dump appropriate features
+     * This part was taken out from loop because first initialization differ
+     * from other reinitializations
+     */
+    parent = object_get_class(obj);
+    g_hash_table_iter_init(&iter, obj->properties);
+    const char *prop_owner_name = object_get_typename(obj);
+    do {
+        InitValueList *prop_list = NULL;
+        ClassProperties *class_data;
+
+        gpointer key, val;
+        while (g_hash_table_iter_next(&iter, &key, &val)) {
+            query_object_prop(&prop_list, (ObjectProperty *)val, obj,
+                              data->errp);
+        }
+        class_data = g_malloc0(sizeof(*class_data));
+        class_data->classname = g_strdup(prop_owner_name);
+        class_data->classprops = prop_list;
+        class_data->has_classprops = !!prop_list;
+
+        QAPI_LIST_PREPEND(class_props_list, class_data);
+
+        if (!parent) {
+            break;
+        }
+        g_hash_table_iter_init(&iter, parent->properties);
+        prop_owner_name = object_class_get_name(parent);
+        parent = object_class_get_parent(parent);
+    } while (true);
+    dev_info->props = class_props_list;
+    object_unref(OBJECT(obj));
+
+    QAPI_LIST_PREPEND(*(data->dev_list), dev_info);
+}
+
+InitPropsList *qmp_query_init_properties(Error **errp)
+{
+    GSList *typename_list = object_class_get_list(TYPE_OBJECT, false);
+
+    InitPropsList *dev_list = NULL;
+    QIPData data = { &dev_list, errp };
+    g_slist_foreach(typename_list, query_init_properties_tramp, &data);
+    g_slist_free(typename_list);
+
+    return dev_list;
+}
-- 
2.31.1


