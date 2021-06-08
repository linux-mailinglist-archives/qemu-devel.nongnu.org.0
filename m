Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06DFF39F2CE
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 11:49:59 +0200 (CEST)
Received: from localhost ([::1]:59078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqYMv-00052e-6C
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 05:49:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lqYDk-0004YJ-OQ
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 05:40:29 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:33777)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lqYDi-0001nE-KA
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 05:40:28 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 s70-20020a1ca9490000b02901a589651424so1262735wme.0
 for <qemu-devel@nongnu.org>; Tue, 08 Jun 2021 02:40:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eaWfNNyaVagDad1eRt/V1RCmBUTKiX/vUI2Ausu/1+0=;
 b=H4Basa8zKJF3LcVumn5Llaqmeg02e6S+xe9JkesJaocpM9g/gYZgfWXSS94MMDrRZ5
 JQnvn7HF1ig/oihfLwhrqtCtPWH1Tt0N1+IQ+EgXNxx7VBvgjCb0MTqBvdVjrkP0+bTj
 bxpiynCxEgDONiMaH/LesEMlg9rZV74T0F6ZLM6baPhW/wfJChgaeiRNq57EFIXhkmdh
 2UhoHOPZImW6OoeEEcF3iVdcmZHpBaCT5929f8W7Ai/hOynVwtEIAwUUqFEr97XQkjOo
 E5H3pnT8wAkSMWKPSTs8Qd1EXPIPV/Nue4ZC7oYbZg+3uK19L7VQh3aWWrvRlGFxFXDW
 67jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=eaWfNNyaVagDad1eRt/V1RCmBUTKiX/vUI2Ausu/1+0=;
 b=V4/vTjvnWPZsaO1S2OfK2/uEBurSN30p6La2WlHwest+mgROoXIGA1ueMJCqWLjUs2
 Q7B96bRPzxdEpHbwfuK9KiR/whEH5Z9fiuDmJVMqN4g3lho2K+tpssz4YkKAvKWtTnk9
 l/0yedba0EXwhn26Jq0/++SoyGdNT7fISWq/k2VayKtZNw8qAFPwRAoDZZPsSNx5LNWA
 FCmNakd6sS0ePs2lgE3unUWqKb/D214gWvAxwo0QUmxj07QqYUC4/l3qdHun61eqaLXH
 qiPdZTHkjs/1P8x/bYnM0SO/QDG6UuepxwIhrWvYrng+r/q1KCErX6M669ALzNBb4GQn
 lN9g==
X-Gm-Message-State: AOAM531xUbyHJ1lzBd2mOO6jVvx/Tl/llxpi5TLi0G3faas9EV3oyPx9
 nQY9dpr8HZJT5kq0TukkIH2JrdrTgGk=
X-Google-Smtp-Source: ABdhPJwIB2L6NkS4SjqXjhISX6wIpD6AYTMirZ9JN6szqaz8/X38Jmc6Xd50KFSSpeCJiucSuvbgAg==
X-Received: by 2002:a05:600c:b43:: with SMTP id
 k3mr21104774wmr.18.1623145220931; 
 Tue, 08 Jun 2021 02:40:20 -0700 (PDT)
Received: from avogadro.lan ([93.56.169.140])
 by smtp.gmail.com with ESMTPSA id d15sm8608764wri.58.2021.06.08.02.40.20
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Jun 2021 02:40:20 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 01/12] qom: export more functions for use with
 non-UserCreatable objects
Date: Tue,  8 Jun 2021 11:40:06 +0200
Message-Id: <20210608094017.392673-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210608094017.392673-1-pbonzini@redhat.com>
References: <20210608094017.392673-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x335.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
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



