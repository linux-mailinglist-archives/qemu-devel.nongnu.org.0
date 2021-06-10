Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 533363A2D3D
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 15:40:13 +0200 (CEST)
Received: from localhost ([::1]:57080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrKuq-0001Vo-DM
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 09:40:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lrKqY-0001ay-3C
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 09:35:46 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:43782)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lrKqV-0005cq-V8
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 09:35:45 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 3-20020a05600c0243b029019f2f9b2b8aso6455858wmj.2
 for <qemu-devel@nongnu.org>; Thu, 10 Jun 2021 06:35:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eaWfNNyaVagDad1eRt/V1RCmBUTKiX/vUI2Ausu/1+0=;
 b=lfLrOopv4BLpgD6gZpy9fzPZ1eV7wMIWZa4eHg5rBnr0CTPmr7vsBUi9gbVYvI1QIF
 zR3Pk/dmziOMiOhcRb+DJtif3cmXkt83vEVcbjYvba+ZX1K9ORjVFOjC5e15NpM87Nji
 yBzqfC6+X+Zz1xz0NIC0OeuBCPJv7wrvq9HWMQDP/VosaQlrExznFCfErElVTb/knFEY
 7f9M5ZcMqQxxIMehyk6zRU59qwz4aEMykQuXxAb05rHa5tUDImnOjSp0Qe1jp1T5fS6L
 PY0xSxYeIHPZ3wn8oOR7IZZfEFowDkcywA12vanc1n+ByYNpPNLTk4Eh6QVhyFf4ZWGz
 7qvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=eaWfNNyaVagDad1eRt/V1RCmBUTKiX/vUI2Ausu/1+0=;
 b=K9NlFVGEYP6griQD1mg8Wz6uPV3xX7lO6PMZxtQajvbZ0SgQXd8mChSTWExYpSwUYs
 3C+m6FFiUKz1ABEOHtMyzL2W4yJZPC0j8/VKXw/qzJZ49VCW0+8etL+JvF3q4y2ilL/m
 3mdEbWWjrx0S8yTQBA0NADsVEocNRc2mkLni4GyxlDmSyyY4nB1PzOGou5paZwUMmrPn
 MmZvu/b4MsygXK2D+j0eYLpRiSqwXC9KZVeLqEsXtPqpukfIF8WoXTeB/JKe+lxjd+we
 977YTWE4aPieCypjMC3INM+x1MKICZ24x2ldoBs+Yk1tSuu7mAtL1k354uGub1h+I8Ho
 qp2Q==
X-Gm-Message-State: AOAM5333+PgpMICxcWCv0C1gzIBSQLy56nFgPseyyYKH2z7p6ElLr4Js
 +yEgSo3Sgk6xZn05H/VT+d5z60zkC4Hy0A==
X-Google-Smtp-Source: ABdhPJytjESN3QODT+YUkerqJjdJ3+aeWhUjfPIagGYjNxKXc2D982WDYlmbn2PddvdMxMO3j0mgXQ==
X-Received: by 2002:a05:600c:3b11:: with SMTP id
 m17mr5249700wms.150.1623332141085; 
 Thu, 10 Jun 2021 06:35:41 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id
 v8sm4032519wrc.29.2021.06.10.06.35.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jun 2021 06:35:40 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 01/11] qom: export more functions for use with
 non-UserCreatable objects
Date: Thu, 10 Jun 2021 15:35:28 +0200
Message-Id: <20210610133538.608390-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210610133538.608390-1-pbonzini@redhat.com>
References: <20210610133538.608390-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x334.google.com
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
Cc: berrange@redhat.com, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Machines and accelerators are not user-creatable but they are going
to share similar command-line parsing machinery.  Export functions
that will be used with -machine and -accel in softmmu/vl.c.

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



