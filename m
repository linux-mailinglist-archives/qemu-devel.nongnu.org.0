Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 402F327D476
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Sep 2020 19:29:02 +0200 (CEST)
Received: from localhost ([::1]:40454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kNJQz-0002f5-Am
	for lists+qemu-devel@lfdr.de; Tue, 29 Sep 2020 13:29:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kNJPB-0001Jw-UC
 for qemu-devel@nongnu.org; Tue, 29 Sep 2020 13:27:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22297)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kNJPA-0004dk-3w
 for qemu-devel@nongnu.org; Tue, 29 Sep 2020 13:27:09 -0400
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601400427;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0qhokdQOgbhVy3MgKGiOb7ZzJj6In6Bnya/WTLi8Abs=;
 b=IMBNucyrg00PwEktQImdcePswT5SyVkt+1d5D83EhihPC4NvwCkgFQTImskriBwBDpJrfq
 JHf8BBjnhAl1Agj/pZnQ4lyUFYDPw9kudIc9Lxq3Ik4CM2o3BgKfpv98vN9uqqKXjg7irK
 snw/QxeuWnD8f19ACcADen5+3H0VSFU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-249-DlaEqeYtP7SE-dKVz_V6yA-1; Tue, 29 Sep 2020 13:27:05 -0400
X-MC-Unique: DlaEqeYtP7SE-dKVz_V6yA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6DFA4107B26B;
 Tue, 29 Sep 2020 17:27:03 +0000 (UTC)
Received: from linux.fritz.box.com (ovpn-115-44.ams2.redhat.com [10.36.115.44])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 50FEC1002C01;
 Tue, 29 Sep 2020 17:27:02 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH 2/4] qom: Factor out helpers from user_creatable_print_help()
Date: Tue, 29 Sep 2020 19:26:47 +0200
Message-Id: <20200929172649.158086-3-kwolf@redhat.com>
In-Reply-To: <20200929172649.158086-1-kwolf@redhat.com>
References: <20200929172649.158086-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/29 02:22:44
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.687,
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
Cc: kwolf@redhat.com, qemu-devel@nongnu.org, armbru@redhat.com,
 mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This creates separate helper functions for printing a list of user
creatable object types and for printing a list of properties of a given
type. This allows using these parts without having a QemuOpts.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 qom/object_interfaces.c | 90 ++++++++++++++++++++++++-----------------
 1 file changed, 52 insertions(+), 38 deletions(-)

diff --git a/qom/object_interfaces.c b/qom/object_interfaces.c
index e8e1523960..3fd1da157e 100644
--- a/qom/object_interfaces.c
+++ b/qom/object_interfaces.c
@@ -214,54 +214,68 @@ char *object_property_help(const char *name, const char *type,
     return g_string_free(str, false);
 }
 
-bool user_creatable_print_help(const char *type, QemuOpts *opts)
+static void user_creatable_print_types(void)
+{
+    GSList *l, *list;
+
+    printf("List of user creatable objects:\n");
+    list = object_class_get_list_sorted(TYPE_USER_CREATABLE, false);
+    for (l = list; l != NULL; l = l->next) {
+        ObjectClass *oc = OBJECT_CLASS(l->data);
+        printf("  %s\n", object_class_get_name(oc));
+    }
+    g_slist_free(list);
+}
+
+static bool user_creatable_print_type_properites(const char *type)
 {
     ObjectClass *klass;
+    ObjectPropertyIterator iter;
+    ObjectProperty *prop;
+    GPtrArray *array;
+    int i;
 
-    if (is_help_option(type)) {
-        GSList *l, *list;
+    klass = object_class_by_name(type);
+    if (!klass) {
+        return false;
+    }
 
-        printf("List of user creatable objects:\n");
-        list = object_class_get_list_sorted(TYPE_USER_CREATABLE, false);
-        for (l = list; l != NULL; l = l->next) {
-            ObjectClass *oc = OBJECT_CLASS(l->data);
-            printf("  %s\n", object_class_get_name(oc));
+    array = g_ptr_array_new();
+    object_class_property_iter_init(&iter, klass);
+    while ((prop = object_property_iter_next(&iter))) {
+        if (!prop->set) {
+            continue;
         }
-        g_slist_free(list);
-        return true;
+
+        g_ptr_array_add(array,
+                        object_property_help(prop->name, prop->type,
+                                             prop->defval, prop->description));
     }
+    g_ptr_array_sort(array, (GCompareFunc)qemu_pstrcmp0);
+    if (array->len > 0) {
+        printf("%s options:\n", type);
+    } else {
+        printf("There are no options for %s.\n", type);
+    }
+    for (i = 0; i < array->len; i++) {
+        printf("%s\n", (char *)array->pdata[i]);
+    }
+    g_ptr_array_set_free_func(array, g_free);
+    g_ptr_array_free(array, true);
+    return true;
+}
 
-    klass = object_class_by_name(type);
-    if (klass && qemu_opt_has_help_opt(opts)) {
-        ObjectPropertyIterator iter;
-        ObjectProperty *prop;
-        GPtrArray *array = g_ptr_array_new();
-        int i;
-
-        object_class_property_iter_init(&iter, klass);
-        while ((prop = object_property_iter_next(&iter))) {
-            if (!prop->set) {
-                continue;
-            }
-
-            g_ptr_array_add(array,
-                            object_property_help(prop->name, prop->type,
-                                                 prop->defval, prop->description));
-        }
-        g_ptr_array_sort(array, (GCompareFunc)qemu_pstrcmp0);
-        if (array->len > 0) {
-            printf("%s options:\n", type);
-        } else {
-            printf("There are no options for %s.\n", type);
-        }
-        for (i = 0; i < array->len; i++) {
-            printf("%s\n", (char *)array->pdata[i]);
-        }
-        g_ptr_array_set_free_func(array, g_free);
-        g_ptr_array_free(array, true);
+bool user_creatable_print_help(const char *type, QemuOpts *opts)
+{
+    if (is_help_option(type)) {
+        user_creatable_print_types();
         return true;
     }
 
+    if (qemu_opt_has_help_opt(opts)) {
+        return user_creatable_print_type_properites(type);
+    }
+
     return false;
 }
 
-- 
2.25.4


