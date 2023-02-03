Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FCC16892B5
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 09:51:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNri3-0008RK-0Y; Fri, 03 Feb 2023 03:46:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pNrhq-0008Jo-12
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 03:46:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pNrhl-0007Tf-29
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 03:46:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675413955;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=y9hkarl3GhRyUs0CcYvGonsN5Rr3Ab2mLhgbZptq2rE=;
 b=LZy56tNloD+A4+6ANdKPOaKjt91rHIwYodsG4lxBEGD6Ed4PyzL7HNMLt+FDB1Ah8aB7Mz
 yuqM/jCF0actAfL6LgL3150ItqPkNXeIn3sM9jJNauUmp/Gu7zF700Ex9cvZ/1k2YCmsw+
 IbsWu/CMCQzQPd1+U9AYg+cFPf10OkM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-314-lkJNzejPMbS4Sf9k0XefPg-1; Fri, 03 Feb 2023 03:45:52 -0500
X-MC-Unique: lkJNzejPMbS4Sf9k0XefPg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8D614857A93;
 Fri,  3 Feb 2023 08:45:52 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4F8F0C15BA0;
 Fri,  3 Feb 2023 08:45:52 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id D05D221E6915; Fri,  3 Feb 2023 09:45:49 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 14/35] qom: Move HMP commands from monitor/ to qom/
Date: Fri,  3 Feb 2023 09:45:28 +0100
Message-Id: <20230203084549.2622302-15-armbru@redhat.com>
In-Reply-To: <20230203084549.2622302-1-armbru@redhat.com>
References: <20230203084549.2622302-1-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

This moves these commands from MAINTAINERS sections "Human
Monitor (HMP)" and "QMP" to "QOM".

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20230124121946.1139465-12-armbru@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 monitor/hmp-cmds.c | 19 -------------
 monitor/misc.c     | 49 ---------------------------------
 qom/qom-hmp-cmds.c | 67 ++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 67 insertions(+), 68 deletions(-)

diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index 1e41381e77..4fe2aaebcd 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -40,7 +40,6 @@
 #include "qapi/qmp/qerror.h"
 #include "qapi/string-input-visitor.h"
 #include "qapi/string-output-visitor.h"
-#include "qom/object_interfaces.h"
 #include "qemu/cutils.h"
 #include "qemu/error-report.h"
 #include "hw/core/cpu.h"
@@ -1054,15 +1053,6 @@ void hmp_netdev_del(Monitor *mon, const QDict *qdict)
     hmp_handle_error(mon, err);
 }
 
-void hmp_object_add(Monitor *mon, const QDict *qdict)
-{
-    const char *options = qdict_get_str(qdict, "object");
-    Error *err = NULL;
-
-    user_creatable_add_from_str(options, &err);
-    hmp_handle_error(mon, err);
-}
-
 void hmp_getfd(Monitor *mon, const QDict *qdict)
 {
     const char *fdname = qdict_get_str(qdict, "fdname");
@@ -1081,15 +1071,6 @@ void hmp_closefd(Monitor *mon, const QDict *qdict)
     hmp_handle_error(mon, err);
 }
 
-void hmp_object_del(Monitor *mon, const QDict *qdict)
-{
-    const char *id = qdict_get_str(qdict, "id");
-    Error *err = NULL;
-
-    user_creatable_del(id, &err);
-    hmp_handle_error(mon, err);
-}
-
 void hmp_info_iothreads(Monitor *mon, const QDict *qdict)
 {
     IOThreadInfoList *info_list = qmp_query_iothreads(NULL);
diff --git a/monitor/misc.c b/monitor/misc.c
index 2a6bc13e7f..0cf2518ce1 100644
--- a/monitor/misc.c
+++ b/monitor/misc.c
@@ -38,7 +38,6 @@
 #include "sysemu/device_tree.h"
 #include "qapi/qmp/qdict.h"
 #include "qapi/qmp/qerror.h"
-#include "qom/object_interfaces.h"
 #include "monitor/hmp-target.h"
 #include "monitor/hmp.h"
 #include "exec/address-spaces.h"
@@ -48,7 +47,6 @@
 #include "qapi/qapi-commands-control.h"
 #include "qapi/qapi-commands-migration.h"
 #include "qapi/qapi-commands-misc.h"
-#include "qapi/qapi-commands-qom.h"
 #include "qapi/qapi-commands-run-state.h"
 #include "qapi/qapi-commands-machine.h"
 #include "qapi/qapi-init-commands.h"
@@ -1310,30 +1308,6 @@ void device_add_completion(ReadLineState *rs, int nb_args, const char *str)
     g_slist_free(list);
 }
 
-void object_add_completion(ReadLineState *rs, int nb_args, const char *str)
-{
-    GSList *list, *elt;
-    size_t len;
-
-    if (nb_args != 2) {
-        return;
-    }
-
-    len = strlen(str);
-    readline_set_completion_index(rs, len);
-    list = elt = object_class_get_list(TYPE_USER_CREATABLE, false);
-    while (elt) {
-        const char *name;
-
-        name = object_class_get_name(OBJECT_CLASS(elt->data));
-        if (strcmp(name, TYPE_USER_CREATABLE)) {
-            readline_add_completion_of(rs, str, name);
-        }
-        elt = elt->next;
-    }
-    g_slist_free(list);
-}
-
 static int qdev_add_hotpluggable_device(Object *obj, void *opaque)
 {
     GSList **list = opaque;
@@ -1391,29 +1365,6 @@ void device_del_completion(ReadLineState *rs, int nb_args, const char *str)
     peripheral_device_del_completion(rs, str);
 }
 
-void object_del_completion(ReadLineState *rs, int nb_args, const char *str)
-{
-    ObjectPropertyInfoList *list, *start;
-    size_t len;
-
-    if (nb_args != 2) {
-        return;
-    }
-    len = strlen(str);
-    readline_set_completion_index(rs, len);
-
-    start = list = qmp_qom_list("/objects", NULL);
-    while (list) {
-        ObjectPropertyInfo *info = list->value;
-
-        if (!strncmp(info->type, "child<", 5)) {
-            readline_add_completion_of(rs, str, info->name);
-        }
-        list = list->next;
-    }
-    qapi_free_ObjectPropertyInfoList(start);
-}
-
 void set_link_completion(ReadLineState *rs, int nb_args, const char *str)
 {
     size_t len;
diff --git a/qom/qom-hmp-cmds.c b/qom/qom-hmp-cmds.c
index 453fbfeabc..6e3a2175a4 100644
--- a/qom/qom-hmp-cmds.c
+++ b/qom/qom-hmp-cmds.c
@@ -13,7 +13,9 @@
 #include "qapi/qapi-commands-qom.h"
 #include "qapi/qmp/qdict.h"
 #include "qapi/qmp/qjson.h"
+#include "qemu/readline.h"
 #include "qom/object.h"
+#include "qom/object_interfaces.h"
 
 void hmp_qom_list(Monitor *mon, const QDict *qdict)
 {
@@ -150,3 +152,68 @@ void hmp_info_qom_tree(Monitor *mon, const QDict *dict)
     }
     print_qom_composition(mon, obj, 0);
 }
+
+void hmp_object_add(Monitor *mon, const QDict *qdict)
+{
+    const char *options = qdict_get_str(qdict, "object");
+    Error *err = NULL;
+
+    user_creatable_add_from_str(options, &err);
+    hmp_handle_error(mon, err);
+}
+
+void hmp_object_del(Monitor *mon, const QDict *qdict)
+{
+    const char *id = qdict_get_str(qdict, "id");
+    Error *err = NULL;
+
+    user_creatable_del(id, &err);
+    hmp_handle_error(mon, err);
+}
+
+void object_add_completion(ReadLineState *rs, int nb_args, const char *str)
+{
+    GSList *list, *elt;
+    size_t len;
+
+    if (nb_args != 2) {
+        return;
+    }
+
+    len = strlen(str);
+    readline_set_completion_index(rs, len);
+    list = elt = object_class_get_list(TYPE_USER_CREATABLE, false);
+    while (elt) {
+        const char *name;
+
+        name = object_class_get_name(OBJECT_CLASS(elt->data));
+        if (strcmp(name, TYPE_USER_CREATABLE)) {
+            readline_add_completion_of(rs, str, name);
+        }
+        elt = elt->next;
+    }
+    g_slist_free(list);
+}
+
+void object_del_completion(ReadLineState *rs, int nb_args, const char *str)
+{
+    ObjectPropertyInfoList *list, *start;
+    size_t len;
+
+    if (nb_args != 2) {
+        return;
+    }
+    len = strlen(str);
+    readline_set_completion_index(rs, len);
+
+    start = list = qmp_qom_list("/objects", NULL);
+    while (list) {
+        ObjectPropertyInfo *info = list->value;
+
+        if (!strncmp(info->type, "child<", 5)) {
+            readline_add_completion_of(rs, str, info->name);
+        }
+        list = list->next;
+    }
+    qapi_free_ObjectPropertyInfoList(start);
+}
-- 
2.39.0


