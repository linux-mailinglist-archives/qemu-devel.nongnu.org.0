Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C73AC2CBA24
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 11:08:29 +0100 (CET)
Received: from localhost ([::1]:60408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkP3k-0003Iq-Pp
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 05:08:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kkO43-0003tT-AK
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 04:04:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:32495)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kkO3m-0004jN-JK
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 04:04:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606899865;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=w45yXBHyKdelqRtXlpgyT7OmPFXb17QNL6HOsijFzVI=;
 b=KR8a7njXZX3NcKWV538cDF8rvKOFmZCgPaZLmOWKCt3H90Q/8fbsWsvXUDPNb4WbLtf9hU
 vNLRbcrKE2qTccr04KIhDqhPyelalJ039liELbQ65bYRqNsbcJWBo7kdXN1h+RvJL//Jsu
 7yPw8IhpudgXZnYTApRISJskKuKsXCI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-406-Xg8-Kvw1PDyS8-hfdsYqQw-1; Wed, 02 Dec 2020 04:04:23 -0500
X-MC-Unique: Xg8-Kvw1PDyS8-hfdsYqQw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CDFF9100E421;
 Wed,  2 Dec 2020 09:03:47 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5E9276085A;
 Wed,  2 Dec 2020 09:03:47 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 17/28] vl: plumb keyval-based options into -set and -readconfig
Date: Wed,  2 Dec 2020 04:02:54 -0500
Message-Id: <20201202090305.4129317-18-pbonzini@redhat.com>
In-Reply-To: <20201202090305.4129317-1-pbonzini@redhat.com>
References: <20201202090305.4129317-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.497,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: kwolf@redhat.com, imammedo@redhat.com, armbru@redhat.com,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add generic machinery to support parsing command line options with
keyval in -set and -readconfig, choosing between QDict and
QemuOpts as the underlying data structure.

The keyval_merge function is slightly heavyweight as a way to
do qemu_set_option for QDict-based options, but it will be put
to further use later to merge entire -readconfig sections together
with their command-line equivalents.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 include/block/qdict.h    |   2 -
 include/qapi/qmp/qdict.h |   3 +
 include/qemu/option.h    |   1 +
 softmmu/vl.c             | 131 ++++++++++++++++++++++++++++++++-------
 tests/test-keyval.c      |  32 ++++++++++
 util/keyval.c            |  36 +++++++++++
 6 files changed, 182 insertions(+), 23 deletions(-)

diff --git a/include/block/qdict.h b/include/block/qdict.h
index d8cb502d7d..ced2acfb92 100644
--- a/include/block/qdict.h
+++ b/include/block/qdict.h
@@ -20,8 +20,6 @@ void qdict_join(QDict *dest, QDict *src, bool overwrite);
 void qdict_extract_subqdict(QDict *src, QDict **dst, const char *start);
 void qdict_array_split(QDict *src, QList **dst);
 int qdict_array_entries(QDict *src, const char *subqdict);
-QObject *qdict_crumple(const QDict *src, Error **errp);
-void qdict_flatten(QDict *qdict);
 
 typedef struct QDictRenames {
     const char *from;
diff --git a/include/qapi/qmp/qdict.h b/include/qapi/qmp/qdict.h
index da942347a7..8eb1dc9500 100644
--- a/include/qapi/qmp/qdict.h
+++ b/include/qapi/qmp/qdict.h
@@ -66,4 +66,7 @@ const char *qdict_get_try_str(const QDict *qdict, const char *key);
 
 QDict *qdict_clone_shallow(const QDict *src);
 
+QObject *qdict_crumple(const QDict *src, Error **errp);
+void qdict_flatten(QDict *qdict);
+
 #endif /* QDICT_H */
diff --git a/include/qemu/option.h b/include/qemu/option.h
index 092e291c37..fffb03d848 100644
--- a/include/qemu/option.h
+++ b/include/qemu/option.h
@@ -151,5 +151,6 @@ QDict *keyval_parse_into(QDict *qdict, const char *params, const char *implied_k
                          bool *p_help, Error **errp);
 QDict *keyval_parse(const char *params, const char *implied_key,
                     bool *help, Error **errp);
+void keyval_merge(QDict *old, const QDict *new, Error **errp);
 
 #endif
diff --git a/softmmu/vl.c b/softmmu/vl.c
index 771af8bb85..de3e22c9eb 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -115,6 +115,7 @@
 #include "qapi/qapi-commands-migration.h"
 #include "qapi/qapi-commands-misc.h"
 #include "qapi/qapi-commands-ui.h"
+#include "qapi/qmp/qdict.h"
 #include "qapi/qmp/qerror.h"
 #include "sysemu/iothread.h"
 #include "qemu/guest-random.h"
@@ -2045,13 +2046,94 @@ static int global_init_func(void *opaque, QemuOpts *opts, Error **errp)
     return 0;
 }
 
+/*
+ * Return whether configuration group @group is stored in QemuOpts or
+ * in a list of QDicts.
+ */
+static bool is_qemuopts_group(const char *group)
+{
+    return true;
+}
+
+/*
+ * Return a pointer to a list of QDicts, used to store options for
+ * "-set GROUP.*".
+ */
+static GSList **qemu_config_list(const char *group)
+{
+    return NULL;
+}
+
+/*
+ * Return a pointer to a QDict inside the list starting at @head,
+ * used to store options for "-GROUP id=...".
+ */
+static QDict *qemu_find_config(GSList *head, const char *id)
+{
+    assert(id);
+    while (head) {
+        QDict *dict = head->data;
+        if (g_strcmp0(qdict_get_try_str(dict, "id"), id) == 0) {
+            return dict;
+        }
+        head = head->next;
+    }
+    return NULL;
+}
+
+static void qemu_record_config_group(const char *group, QDict *dict, Error **errp)
+{
+    GSList **p_head;
+
+    p_head = qemu_config_list(group);
+    if (p_head) {
+        *p_head = g_slist_prepend(*p_head, dict);
+    } else {
+        abort();
+    }
+}
+
+static void qemu_set_qdict_option(QDict *dict, const char *key, const char *value,
+                                  Error **errp)
+{
+    QDict *merge_dict;
+
+    merge_dict = qdict_new();
+    qdict_put_str(merge_dict, key, value);
+    keyval_merge(dict, merge_dict, errp);
+    qobject_unref(merge_dict);
+}
+
+/*
+ * Parse non-QemuOpts config file groups, pass the rest to
+ * qemu_config_do_parse.
+ */
+static void qemu_parse_config_group(const char *group, QDict *qdict,
+                                    void *opaque, Error **errp)
+{
+    if (is_qemuopts_group(group)) {
+        QObject *crumpled = qdict_crumple(qdict, errp);
+        if (!crumpled) {
+            return;
+        }
+        if (qobject_type(crumpled) != QTYPE_QDICT) {
+            assert(qobject_type(crumpled) == QTYPE_QLIST);
+            error_setg(errp, "Lists cannot be at top level of a configuration section");
+            return;
+        }
+        qemu_record_config_group(group, qobject_to(QDict, crumpled), errp);
+    } else {
+        qemu_config_do_parse(group, qdict, opaque, errp);
+    }
+}
+
 static void qemu_read_default_config_file(Error **errp)
 {
     int ret;
     Error *local_err = NULL;
     g_autofree char *file = get_relocated_path(CONFIG_QEMU_CONFDIR "/qemu.conf");
 
-    ret = qemu_read_config_file(file, qemu_config_do_parse, &local_err);
+    ret = qemu_read_config_file(file, qemu_parse_config_group, &local_err);
     if (ret < 0) {
         if (ret == -ENOENT) {
             error_free(local_err);
@@ -2061,37 +2143,45 @@ static void qemu_read_default_config_file(Error **errp)
     }
 }
 
-static int qemu_set_option(const char *str)
+static void qemu_set_option(const char *str, Error **errp)
 {
-    Error *local_err = NULL;
     char group[64], id[64], arg[64];
     QemuOptsList *list;
     QemuOpts *opts;
+    GSList **p_head;
+    QDict *dict;
     int rc, offset;
 
     rc = sscanf(str, "%63[^.].%63[^.].%63[^=]%n", group, id, arg, &offset);
     if (rc < 3 || str[offset] != '=') {
-        error_report("can't parse: \"%s\"", str);
-        return -1;
+        error_setg(errp, "can't parse: \"%s\"", str);
+        return;
     }
 
-    list = qemu_find_opts(group);
-    if (list == NULL) {
-        return -1;
+    p_head = qemu_config_list(group);
+    if (p_head) {
+        dict = qemu_find_config(*p_head, id);
+        if (!dict) {
+            goto not_found;
+        }
+        qemu_set_qdict_option(dict, arg, str + offset + 1, errp);
+        return;
     }
 
-    opts = qemu_opts_find(list, id);
-    if (!opts) {
-        error_report("there is no %s \"%s\" defined",
-                     list->name, id);
-        return -1;
+    list = qemu_find_opts_err(group, errp);
+    if (list) {
+        opts = qemu_opts_find(list, id);
+        if (!opts) {
+            goto not_found;
+        }
+        qemu_opt_set(opts, arg, str + offset + 1, errp);
+        return;
     }
 
-    if (!qemu_opt_set(opts, arg, str + offset + 1, &local_err)) {
-        error_report_err(local_err);
-        return -1;
-    }
-    return 0;
+    return;
+
+not_found:
+    error_setg(errp, "there is no %s \"%s\" defined", group, id);
 }
 
 static void user_register_global_props(void)
@@ -2642,8 +2732,7 @@ void qemu_init(int argc, char **argv, char **envp)
                 }
                 break;
             case QEMU_OPTION_set:
-                if (qemu_set_option(optarg) != 0)
-                    exit(1);
+                qemu_set_option(optarg, &error_fatal);
                 break;
             case QEMU_OPTION_global:
                 if (qemu_global_option(optarg) != 0)
@@ -3285,7 +3374,7 @@ void qemu_init(int argc, char **argv, char **envp)
                 qemu_plugin_opt_parse(optarg, &plugin_list);
                 break;
             case QEMU_OPTION_readconfig:
-                qemu_read_config_file(optarg, qemu_config_do_parse, &error_fatal);
+                qemu_read_config_file(optarg, qemu_parse_config_group, &error_fatal);
                 break;
             case QEMU_OPTION_spice:
                 olist = qemu_find_opts_err("spice", NULL);
diff --git a/tests/test-keyval.c b/tests/test-keyval.c
index 19f664f535..9b50a86407 100644
--- a/tests/test-keyval.c
+++ b/tests/test-keyval.c
@@ -737,6 +737,36 @@ static void test_keyval_visit_any(void)
     visit_free(v);
 }
 
+static void test_keyval_merge_success(void)
+{
+    QDict *old = keyval_parse("opt1=abc,opt2.sub1=def,opt2.sub2=ghi,opt3=xyz",
+                              NULL, NULL, &error_abort);
+    QDict *new = keyval_parse("opt1=ABC,opt2.sub2=GHI,opt2.sub3=JKL",
+                              NULL, NULL, &error_abort);
+    QDict *combined = keyval_parse("opt1=ABC,opt2.sub1=def,opt2.sub2=GHI,opt2.sub3=JKL,opt3=xyz",
+                                   NULL, NULL, &error_abort);
+    Error *err = NULL;
+
+    keyval_merge(old, new, &err);
+    g_assert(!err);
+    g_assert(qdict_is_equal(QOBJECT(combined), QOBJECT(old)));
+}
+
+static void test_keyval_merge_conflict(void)
+{
+    QDict *old = keyval_parse("opt2.sub1=def,opt2.sub2=ghi",
+                              NULL, NULL, &error_abort);
+    QDict *new = keyval_parse("opt2=ABC",
+                              NULL, NULL, &error_abort);
+    Error *err = NULL;
+
+    keyval_merge(new, old, &err);
+    error_free_or_abort(&err);
+
+    keyval_merge(old, new, &err);
+    error_free_or_abort(&err);
+}
+
 int main(int argc, char *argv[])
 {
     g_test_init(&argc, &argv, NULL);
@@ -750,6 +780,8 @@ int main(int argc, char *argv[])
     g_test_add_func("/keyval/visit/optional", test_keyval_visit_optional);
     g_test_add_func("/keyval/visit/alternate", test_keyval_visit_alternate);
     g_test_add_func("/keyval/visit/any", test_keyval_visit_any);
+    g_test_add_func("/keyval/merge/success", test_keyval_merge_success);
+    g_test_add_func("/keyval/merge/conflict", test_keyval_merge_conflict);
     g_test_run();
     return 0;
 }
diff --git a/util/keyval.c b/util/keyval.c
index 1d4ca12129..7c886dd402 100644
--- a/util/keyval.c
+++ b/util/keyval.c
@@ -315,6 +315,42 @@ static char *reassemble_key(GSList *key)
     return g_string_free(s, FALSE);
 }
 
+/* Merge two dictionaries.  */
+static void keyval_do_merge(QDict *old, const QDict *new, GString *str, Error **errp)
+{
+    size_t save_len = str->len;
+    const QDictEntry *ent;
+    QObject *old_value;
+
+    for (ent = qdict_first(new); ent; ent = qdict_next(new, ent)) {
+        old_value = qdict_get(old, ent->key);
+        if (old_value && qobject_type(old_value) != qobject_type(ent->value)) {
+            error_setg(errp, "Parameter '%s%s' used inconsistently", str->str, ent->key);
+            return;
+        }
+        if (!old_value || qobject_type(ent->value) != QTYPE_QDICT) {
+            qobject_ref(ent->value);
+            qdict_put_obj(old, ent->key, ent->value);
+            continue;
+        }
+
+        /* Merge sub-dictionaries.  */
+        g_string_append(str, ent->key);
+        g_string_append_c(str, '.');
+        keyval_do_merge(qobject_to(QDict, old_value),
+                        qobject_to(QDict, ent->value),
+                        str, errp);
+        g_string_truncate(str, save_len);
+    }
+}
+
+void keyval_merge(QDict *old, const QDict *new, Error **errp)
+{
+    GString *str = g_string_new("");
+    keyval_do_merge(old, new, str, errp);
+    g_string_free(str, TRUE);
+}
+
 /*
  * Listify @cur recursively.
  * Replace QDicts whose keys are all valid list indexes by QLists.
-- 
2.26.2



