Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26C2E3AB805
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 17:56:47 +0200 (CEST)
Received: from localhost ([::1]:36008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltuNq-00033H-4h
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 11:56:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ltuKP-0006Ww-W3
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 11:53:14 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:41596)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ltuKO-0001Qp-28
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 11:53:13 -0400
Received: by mail-ej1-x636.google.com with SMTP id ho18so10650448ejc.8
 for <qemu-devel@nongnu.org>; Thu, 17 Jun 2021 08:53:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/w3OWkmILd9DHLt7xHUVjE/0QCuFPWmxaED4RkhRstM=;
 b=tFhMvECHBbgWN5fZGG9/3v3wG3Gi6GBnRvNVWLfmnzFamb67+GbnSOtq9dZLNLKYBd
 7+V8D8p6BijEApQMLguulML8eC1gzxcVauj3PTSDYBkMq1uzQyysMqExqQXdcpA4frkT
 LH98yR/GUha2EDRzGMP0ocqy68uMcdphP0Reg8JzzHnpleIbvRDuLJRSWYtNPLoJVvz0
 xEfCjnZ38s2Ousiw+uXTdUwlO3w+Ui5eWTYBtDp8eR1WCGGYlw28IzX4UhNhqu1leCuK
 uWOE+0oS043FURkn9vPDuiE8hpq4Lhv0XCgyC31kjn8w+met8HsypBKqF7yeBIERdAtV
 1HbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=/w3OWkmILd9DHLt7xHUVjE/0QCuFPWmxaED4RkhRstM=;
 b=A8FYTLAW7czIAjLmVfTJPs0YidWANHSmBOQnG9xWxN+eAt8rzoUZJx5g/GA8demrl+
 f8VpMvzfwiAhQN2ncol4IZG/N4aKTzJatROwgdikyazNcmZheTEOFTpfK99s6TIm7nY8
 oFBm6eZx7P5ZfrxKYf0t3rLy6Qu4+6P8uHHgj5iqGtWRplQvOmCoOCXzKo6QwO4m5Kp3
 RCPoikT9Zf6k4ggbKrLKTZCZyfFckPrJ/5hEVPFoZlWiPnJfypgBBgyyib1mEuO46Crj
 tpiP+lUksewARV5U68dBClGyCkF9vQhdbwlq8cTU+BuiKvgWtSbTr5k9DybCnPeJu+Go
 kfVA==
X-Gm-Message-State: AOAM533QneevR73dGJCekSYynvjIkjJbtuBzbY7CYzVkbDaAjbX6YZsR
 B9gRhhu7eYXaA5QTyXiQgvf3iVbqJnY=
X-Google-Smtp-Source: ABdhPJxAOzcZZdD+OAOYfEuUBKZISNQvTgBSvHDdqPLu7UFzEDi+Mz5lO1V4MHWNpLxNbxNEP3sKZA==
X-Received: by 2002:a17:906:744:: with SMTP id
 z4mr6040482ejb.347.1623945190533; 
 Thu, 17 Jun 2021 08:53:10 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id p13sm4604061edh.79.2021.06.17.08.53.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 08:53:10 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 01/11] qom: export more functions for use with
 non-UserCreatable objects
Date: Thu, 17 Jun 2021 17:52:58 +0200
Message-Id: <20210617155308.928754-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210617155308.928754-1-pbonzini@redhat.com>
References: <20210617155308.928754-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x636.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Machines and accelerators are not user-creatable but they are going
to share similar command-line parsing machinery.  Export functions
that will be used with -machine and -accel in softmmu/vl.c.

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 include/qom/object.h    | 23 ++++++++++++++++
 qom/object_interfaces.c | 58 +++++++++++++++++++++++++++++------------
 2 files changed, 65 insertions(+), 16 deletions(-)

diff --git a/include/qom/object.h b/include/qom/object.h
index 6721cd312e..faae0d841f 100644
--- a/include/qom/object.h
+++ b/include/qom/object.h
@@ -861,6 +861,29 @@ static void do_qemu_init_ ## type_array(void)                               \
 }                                                                           \
 type_init(do_qemu_init_ ## type_array)
 
+/**
+ * type_print_class_properties:
+ * @type: a QOM class name
+ *
+ * Print the object's class properties to stdout or the monitor.
+ * Return whether an object was found.
+ */
+bool type_print_class_properties(const char *type);
+
+/**
+ * object_set_properties_from_keyval:
+ * @obj: a QOM object
+ * @qdict: a dictionary with the properties to be set
+ * @from_json: true if leaf values of @qdict are typed, false if they
+ * are strings
+ * @errp: pointer to error object
+ *
+ * For each key in the dictionary, parse the value string if needed,
+ * then set the corresponding property in @obj.
+ */
+void object_set_properties_from_keyval(Object *obj, const QDict *qdict,
+                                       bool from_json, Error **errp);
+
 /**
  * object_class_dynamic_cast_assert:
  * @klass: The #ObjectClass to attempt to cast.
diff --git a/qom/object_interfaces.c b/qom/object_interfaces.c
index 4479ee693a..ad9b56b59a 100644
--- a/qom/object_interfaces.c
+++ b/qom/object_interfaces.c
@@ -42,6 +42,44 @@ bool user_creatable_can_be_deleted(UserCreatable *uc)
     }
 }
 
+static void object_set_properties_from_qdict(Object *obj, const QDict *qdict,
+                                             Visitor *v, Error **errp)
+{
+    const QDictEntry *e;
+    Error *local_err = NULL;
+
+    if (!visit_start_struct(v, NULL, NULL, 0, &local_err)) {
+        goto out;
+    }
+    for (e = qdict_first(qdict); e; e = qdict_next(qdict, e)) {
+        if (!object_property_set(obj, e->key, v, &local_err)) {
+            break;
+        }
+    }
+    if (!local_err) {
+        visit_check_struct(v, &local_err);
+    }
+    visit_end_struct(v, NULL);
+
+out:
+    if (local_err) {
+        error_propagate(errp, local_err);
+    }
+}
+
+void object_set_properties_from_keyval(Object *obj, const QDict *qdict,
+                                       bool from_json, Error **errp)
+{
+    Visitor *v;
+    if (from_json) {
+        v = qobject_input_visitor_new(QOBJECT(qdict));
+    } else {
+        v = qobject_input_visitor_new_keyval(QOBJECT(qdict));
+    }
+    object_set_properties_from_qdict(obj, qdict, v, errp);
+    visit_free(v);
+}
+
 Object *user_creatable_add_type(const char *type, const char *id,
                                 const QDict *qdict,
                                 Visitor *v, Error **errp)
@@ -49,7 +87,6 @@ Object *user_creatable_add_type(const char *type, const char *id,
     ERRP_GUARD();
     Object *obj;
     ObjectClass *klass;
-    const QDictEntry *e;
     Error *local_err = NULL;
 
     if (id != NULL && !id_wellformed(id)) {
@@ -78,18 +115,7 @@ Object *user_creatable_add_type(const char *type, const char *id,
 
     assert(qdict);
     obj = object_new(type);
-    if (!visit_start_struct(v, NULL, NULL, 0, &local_err)) {
-        goto out;
-    }
-    for (e = qdict_first(qdict); e; e = qdict_next(qdict, e)) {
-        if (!object_property_set(obj, e->key, v, &local_err)) {
-            break;
-        }
-    }
-    if (!local_err) {
-        visit_check_struct(v, &local_err);
-    }
-    visit_end_struct(v, NULL);
+    object_set_properties_from_qdict(obj, qdict, v, &local_err);
     if (local_err) {
         goto out;
     }
@@ -178,7 +204,7 @@ static void user_creatable_print_types(void)
     g_slist_free(list);
 }
 
-static bool user_creatable_print_type_properites(const char *type)
+bool type_print_class_properties(const char *type)
 {
     ObjectClass *klass;
     ObjectPropertyIterator iter;
@@ -224,7 +250,7 @@ bool user_creatable_print_help(const char *type, QemuOpts *opts)
     }
 
     if (qemu_opt_has_help_opt(opts)) {
-        return user_creatable_print_type_properites(type);
+        return type_print_class_properties(type);
     }
 
     return false;
@@ -234,7 +260,7 @@ static void user_creatable_print_help_from_qdict(QDict *args)
 {
     const char *type = qdict_get_try_str(args, "qom-type");
 
-    if (!type || !user_creatable_print_type_properites(type)) {
+    if (!type || !type_print_class_properties(type)) {
         user_creatable_print_types();
     }
 }
-- 
2.31.1



