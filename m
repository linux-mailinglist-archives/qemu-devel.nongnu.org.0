Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D93737FB91
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 18:34:49 +0200 (CEST)
Received: from localhost ([::1]:33282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhEIS-0002ba-7H
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 12:34:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lhEDA-0002L0-0v
 for qemu-devel@nongnu.org; Thu, 13 May 2021 12:29:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59435)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lhED6-0003Tw-9e
 for qemu-devel@nongnu.org; Thu, 13 May 2021 12:29:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620923355;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BEDSmJdDTA38XYMTjvkWT16wPaTZYkKKf4rp7gUJZ1s=;
 b=dIxcWU3C9c3QMJTKvlSTZBIhl1AN0Jxow+34uuDy0XZ8w2CnjbkUAUa7G+oQIc5og0mpVj
 W06vbucY4aP1iqSZSYAooLwVxz4m9mPg3M6lQ2k8aMK83+1eeqDY9u0YxDGCbBPUIam0Ns
 5bWOyx7arShyF0TU/TGRqOVOoE3O/FQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-465-TNJnPMeFPY-4wA7ETT7kMA-1; Thu, 13 May 2021 12:29:11 -0400
X-MC-Unique: TNJnPMeFPY-4wA7ETT7kMA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BE8E5803620;
 Thu, 13 May 2021 16:29:10 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 25155687C3;
 Thu, 13 May 2021 16:29:10 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 08/14] vl: switch -accel parsing to keyval
Date: Thu, 13 May 2021 12:28:55 -0400
Message-Id: <20210513162901.1310239-9-pbonzini@redhat.com>
In-Reply-To: <20210513162901.1310239-1-pbonzini@redhat.com>
References: <20210513162901.1310239-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: yang.zhong@intel.com, berrange@redhat.com, ehabkost@redhat.com,
 armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Switch from QemuOpts to keyval.  This enables compound options
for accelerators as well as passing the options as JSON, using
for example -accel '{"accel":"kvm"}'.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 accel/accel-softmmu.c |   6 ++
 include/qemu/accel.h  |   1 +
 softmmu/vl.c          | 156 ++++++++++++++++++++++--------------------
 3 files changed, 87 insertions(+), 76 deletions(-)

diff --git a/accel/accel-softmmu.c b/accel/accel-softmmu.c
index 50fa5acaa4..37717a3757 100644
--- a/accel/accel-softmmu.c
+++ b/accel/accel-softmmu.c
@@ -30,6 +30,12 @@
 
 #include "accel-softmmu.h"
 
+bool accel_print_class_properties(const char *opt_name)
+{
+    g_autofree char *class_name = g_strdup_printf(ACCEL_CLASS_NAME("%s"), opt_name);
+    return type_print_class_properties(class_name);
+}
+
 int accel_init_machine(AccelState *accel, MachineState *ms)
 {
     AccelClass *acc = ACCEL_GET_CLASS(accel);
diff --git a/include/qemu/accel.h b/include/qemu/accel.h
index 4f4c283f6f..2c712d3846 100644
--- a/include/qemu/accel.h
+++ b/include/qemu/accel.h
@@ -70,6 +70,7 @@ AccelClass *accel_find(const char *opt_name);
 AccelState *current_accel(void);
 
 void accel_init_interfaces(AccelClass *ac);
+bool accel_print_class_properties(const char *opt_name);
 
 #ifndef CONFIG_USER_ONLY
 int accel_init_machine(AccelState *accel, MachineState *ms);
diff --git a/softmmu/vl.c b/softmmu/vl.c
index 6b670fb301..de844f08d7 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -155,6 +155,7 @@ static const char *incoming;
 static const char *loadvm;
 static const char *accelerators;
 static QDict *machine_opts_dict;
+static KeyvalConfigGroup accel_opts_list;
 static QTAILQ_HEAD(, ObjectOption) object_opts = QTAILQ_HEAD_INITIALIZER(object_opts);
 static ram_addr_t maxram_size;
 static uint64_t ram_slots;
@@ -245,20 +246,6 @@ static QemuOptsList qemu_option_rom_opts = {
     },
 };
 
-static QemuOptsList qemu_accel_opts = {
-    .name = "accel",
-    .implied_opt_name = "accel",
-    .head = QTAILQ_HEAD_INITIALIZER(qemu_accel_opts.head),
-    .desc = {
-        /*
-         * no elements => accept any
-         * sanity checking will happen later
-         * when setting accelerator properties
-         */
-        { }
-    },
-};
-
 static QemuOptsList qemu_boot_opts = {
     .name = "boot-opts",
     .implied_opt_name = "order",
@@ -1595,21 +1582,6 @@ static MachineClass *select_machine(QDict *qdict, Error **errp)
     return machine_class;
 }
 
-static int object_parse_property_opt(Object *obj,
-                                     const char *name, const char *value,
-                                     const char *skip, Error **errp)
-{
-    if (g_str_equal(name, skip)) {
-        return 0;
-    }
-
-    if (!object_property_parse(obj, name, value, errp)) {
-        return -1;
-    }
-
-    return 0;
-}
-
 /* *Non*recursively replace underscores with dashes in QDict keys.  */
 static void keyval_dashify(QDict *qdict, Error **errp)
 {
@@ -2102,7 +2074,8 @@ static int global_init_func(void *opaque, QemuOpts *opts, Error **errp)
  */
 static bool is_qemuopts_group(const char *group)
 {
-    if (g_str_equal(group, "machine")) {
+    if (g_str_equal(group, "machine") ||
+        g_str_equal(group, "accel")) {
         return false;
     }
     return true;
@@ -2114,6 +2087,9 @@ static bool is_qemuopts_group(const char *group)
  */
 static KeyvalConfigGroup *qemu_config_list(const char *group)
 {
+    if (g_str_equal(group, "accel")) {
+        return &accel_opts_list;
+    }
     return NULL;
 }
 
@@ -2155,6 +2131,26 @@ static void qemu_record_config_group(const char *group, QDict *dict, bool from_j
     }
 }
 
+static QDict *qemu_parse_config_option(const char *group, const char *arg,
+                                       bool *help, Error **errp)
+{
+    QDict *args;
+
+    *help = false;
+    if (arg[0] == '{') {
+        args = (QDict*) qobject_from_json(arg, errp);
+        if (args) {
+            qemu_record_config_group(group, args, true, &error_abort);
+        }
+    } else {
+        args = keyval_parse(arg, group, help, errp);
+        if (args) {
+            qemu_record_config_group(group, args, false, &error_abort);
+        }
+    }
+    return args;
+}
+
 static void qemu_set_qdict_option(QDict *dict, const char *key, const char *value,
                                   Error **errp)
 {
@@ -2262,17 +2258,9 @@ static int do_configure_icount(void *opaque, QemuOpts *opts, Error **errp)
     return 0;
 }
 
-static int accelerator_set_property(void *opaque,
-                                const char *name, const char *value,
-                                Error **errp)
-{
-    return object_parse_property_opt(opaque, name, value, "accel", errp);
-}
-
-static int do_configure_accelerator(void *opaque, QemuOpts *opts, Error **errp)
+static bool do_configure_accelerator(KeyvalConfigEntry *e)
 {
-    bool *p_init_failed = opaque;
-    const char *acc = qemu_opt_get(opts, "accel");
+    const char *acc = qdict_get_try_str(e->dict, "accel");
     AccelClass *ac = accel_find(acc);
     AccelState *accel;
     int ret;
@@ -2281,38 +2269,36 @@ static int do_configure_accelerator(void *opaque, QemuOpts *opts, Error **errp)
     qtest_with_kvm = g_str_equal(acc, "kvm") && qtest_chrdev != NULL;
 
     if (!ac) {
-        *p_init_failed = true;
         if (!qtest_with_kvm) {
             error_report("invalid accelerator %s", acc);
         }
-        return 0;
+        return true;
     }
     accel = ACCEL(object_new_with_class(OBJECT_CLASS(ac)));
     object_apply_compat_props(OBJECT(accel));
-    qemu_opt_foreach(opts, accelerator_set_property,
-                     accel,
-                     &error_fatal);
+    qdict_del(e->dict, "accel");
+    object_set_properties_from_keyval(OBJECT(accel), e->dict, e->from_json, &error_fatal);
 
     ret = accel_init_machine(accel, current_machine);
     if (ret < 0) {
-        *p_init_failed = true;
         if (!qtest_with_kvm || ret != -ENOENT) {
-            error_report("failed to initialize %s: %s", acc, strerror(-ret));
+            error_report("failed to initialize %s: %s", ac->name, strerror(-ret));
         }
-        return 0;
+        return true;
     }
 
-    return 1;
+    return false;
 }
 
 static void configure_accelerators(const char *progname)
 {
     bool init_failed = false;
+    KeyvalConfigEntry *accel;
 
     qemu_opts_foreach(qemu_find_opts("icount"),
                       do_configure_icount, NULL, &error_fatal);
 
-    if (QTAILQ_EMPTY(&qemu_accel_opts.head)) {
+    if (QTAILQ_EMPTY(&accel_opts_list)) {
         char **accel_list, **tmp;
 
         if (accelerators == NULL) {
@@ -2345,7 +2331,9 @@ static void configure_accelerators(const char *progname)
              * such as "-machine accel=tcg,,thread=single".
              */
             if (accel_find(*tmp)) {
-                qemu_opts_parse_noisily(qemu_find_opts("accel"), *tmp, true);
+                QDict *qdict = qdict_new();
+                qdict_put_str(qdict, "accel", *tmp);
+                qemu_record_config_group("accel", qdict, true, &error_abort);
             } else {
                 init_failed = true;
                 error_report("invalid accelerator %s", *tmp);
@@ -2359,8 +2347,14 @@ static void configure_accelerators(const char *progname)
         }
     }
 
-    if (!qemu_opts_foreach(qemu_find_opts("accel"),
-                           do_configure_accelerator, &init_failed, &error_fatal)) {
+    QTAILQ_FOREACH_REVERSE(accel, &accel_opts_list, next) {
+        init_failed = do_configure_accelerator(accel);
+        if (current_accel()) {
+            break;
+        }
+    }
+
+    if (!current_accel()) {
         if (!init_failed) {
             error_report("no accelerator found");
         }
@@ -2378,6 +2372,27 @@ static void configure_accelerators(const char *progname)
     }
 }
 
+static void list_accelerators(void)
+{
+    printf("Accelerators supported in QEMU binary:\n");
+    GSList *el, *accel_list = object_class_get_list(TYPE_ACCEL,
+                                                    false);
+    for (el = accel_list; el; el = el->next) {
+        gchar *typename = g_strdup(object_class_get_name(
+                                   OBJECT_CLASS(el->data)));
+        /* omit qtest which is used for tests only */
+        if (g_strcmp0(typename, ACCEL_CLASS_NAME("qtest")) &&
+            g_str_has_suffix(typename, ACCEL_CLASS_SUFFIX)) {
+            gchar **optname = g_strsplit(typename,
+                                         ACCEL_CLASS_SUFFIX, 0);
+            printf("%s\n", optname[0]);
+            g_strfreev(optname);
+        }
+        g_free(typename);
+    }
+    g_slist_free(accel_list);
+}
+
 static void create_default_memdev(MachineState *ms, const char *path)
 {
     Object *obj;
@@ -2702,7 +2717,7 @@ void qmp_x_exit_preconfig(Error **errp)
 void qemu_init(int argc, char **argv, char **envp)
 {
     QemuOpts *opts;
-    QemuOpts *icount_opts = NULL, *accel_opts = NULL;
+    QemuOpts *icount_opts = NULL;
     QemuOptsList *olist;
     int optind;
     const char *optarg;
@@ -2726,7 +2741,6 @@ void qemu_init(int argc, char **argv, char **envp)
     qemu_add_opts(&qemu_trace_opts);
     qemu_plugin_add_opts();
     qemu_add_opts(&qemu_option_rom_opts);
-    qemu_add_opts(&qemu_accel_opts);
     qemu_add_opts(&qemu_mem_opts);
     qemu_add_opts(&qemu_smp_opts);
     qemu_add_opts(&qemu_boot_opts);
@@ -3283,30 +3297,20 @@ void qemu_init(int argc, char **argv, char **envp)
                     break;
                 }
             case QEMU_OPTION_accel:
-                accel_opts = qemu_opts_parse_noisily(qemu_find_opts("accel"),
-                                                     optarg, true);
-                optarg = qemu_opt_get(accel_opts, "accel");
-                if (!optarg || is_help_option(optarg)) {
-                    printf("Accelerators supported in QEMU binary:\n");
-                    GSList *el, *accel_list = object_class_get_list(TYPE_ACCEL,
-                                                                    false);
-                    for (el = accel_list; el; el = el->next) {
-                        gchar *typename = g_strdup(object_class_get_name(
-                                                   OBJECT_CLASS(el->data)));
-                        /* omit qtest which is used for tests only */
-                        if (g_strcmp0(typename, ACCEL_CLASS_NAME("qtest")) &&
-                            g_str_has_suffix(typename, ACCEL_CLASS_SUFFIX)) {
-                            gchar **optname = g_strsplit(typename,
-                                                         ACCEL_CLASS_SUFFIX, 0);
-                            printf("%s\n", optname[0]);
-                            g_strfreev(optname);
+                {
+                    bool help;
+                    QDict *args;
+
+                    args = qemu_parse_config_option("accel", optarg, &help, &error_fatal);
+                    if (help) {
+                        const char *type = qdict_get_try_str(args, "accel");
+                        if (!type || !accel_print_class_properties(type)) {
+                            list_accelerators();
                         }
-                        g_free(typename);
+                        exit(0);
                     }
-                    g_slist_free(accel_list);
-                    exit(0);
+                    break;
                 }
-                break;
             case QEMU_OPTION_usb:
                 qdict_put_str(machine_opts_dict, "usb", "on");
                 break;
-- 
2.26.2



