Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F2C32FA713
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 18:09:51 +0100 (CET)
Received: from localhost ([::1]:52554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1Y2I-0002QD-5o
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 12:09:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l1XRW-0002YP-U9
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 11:31:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:33003)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l1XRQ-0001XC-Qv
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 11:31:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610987503;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8W9OdTC9JXFXVy+TmMTW+M6jXNMM1l1yzEIIravvNl8=;
 b=QhBN3WB1v5gSSWFawoICAXe2+lSA7uoP9z6iewIfLL7FM/1HFrvLFe5gT+as8MKpA6e8Ot
 fa+c+wEI9pbTnV4Q/WG5rhMRsG6t1CakiiH2whO1WcPNaYzM9fFCDLLhmry8L36ToFKete
 qP3r8ojxwigd5JoPaItIVUqk90TRJZg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-376-Z79reHwoPPKLXKy9ZXiw-g-1; Mon, 18 Jan 2021 11:31:41 -0500
X-MC-Unique: Z79reHwoPPKLXKy9ZXiw-g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 09B221005504
 for <qemu-devel@nongnu.org>; Mon, 18 Jan 2021 16:31:41 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 863F719C66;
 Mon, 18 Jan 2021 16:31:40 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 25/25] vl: switch -accel parsing to keyval
Date: Mon, 18 Jan 2021 11:31:13 -0500
Message-Id: <20210118163113.780171-26-pbonzini@redhat.com>
In-Reply-To: <20210118163113.780171-1-pbonzini@redhat.com>
References: <20210118163113.780171-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.175,
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
Cc: kwolf@redhat.com, imammedo@redhat.com, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Switch from QemuOpts to keyval.  This enables compound options
for accelerators.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 accel/accel.c          |   6 ++
 include/sysemu/accel.h |   1 +
 softmmu/vl.c           | 134 ++++++++++++++++++-----------------------
 3 files changed, 67 insertions(+), 74 deletions(-)

diff --git a/accel/accel.c b/accel/accel.c
index cb555e3b06..f7fdc2f5a8 100644
--- a/accel/accel.c
+++ b/accel/accel.c
@@ -46,6 +46,12 @@ AccelClass *accel_find(const char *opt_name)
     return ac;
 }
 
+bool accel_print_class_properties(const char *opt_name)
+{
+    g_autofree char *class_name = g_strdup_printf(ACCEL_CLASS_NAME("%s"), opt_name);
+    return type_print_class_properties(class_name);
+}
+
 int accel_init_machine(AccelState *accel, MachineState *ms)
 {
     AccelClass *acc = ACCEL_GET_CLASS(accel);
diff --git a/include/sysemu/accel.h b/include/sysemu/accel.h
index e08b8ab8fa..737db49d21 100644
--- a/include/sysemu/accel.h
+++ b/include/sysemu/accel.h
@@ -67,6 +67,7 @@ typedef struct AccelClass {
     OBJECT_GET_CLASS(AccelClass, (obj), TYPE_ACCEL)
 
 AccelClass *accel_find(const char *opt_name);
+bool accel_print_class_properties(const char *opt_name);
 int accel_init_machine(AccelState *accel, MachineState *ms);
 
 /* Called just before os_setup_post (ie just before drop OS privs) */
diff --git a/softmmu/vl.c b/softmmu/vl.c
index ff906d541d..b87ab08ea6 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -139,6 +139,7 @@ static const char *loadvm;
 static const char *accelerators;
 static QDict *machine_opts_dict;
 static GSList *object_opts_list = NULL;
+static GSList *accel_opts_list = NULL;
 static ram_addr_t maxram_size;
 static uint64_t ram_slots;
 static int display_remote;
@@ -229,20 +230,6 @@ static QemuOptsList qemu_option_rom_opts = {
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
@@ -1567,21 +1554,6 @@ static MachineClass *select_machine(QDict *qdict, Error **errp)
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
@@ -2036,7 +2008,8 @@ static int global_init_func(void *opaque, QemuOpts *opts, Error **errp)
 static bool is_qemuopts_group(const char *group)
 {
     if (g_str_equal(group, "object") ||
-        g_str_equal(group, "machine")) {
+        g_str_equal(group, "machine") ||
+        g_str_equal(group, "accel")) {
         return false;
     }
     return true;
@@ -2050,6 +2023,8 @@ static GSList **qemu_config_list(const char *group)
 {
     if (g_str_equal(group, "object")) {
         return &object_opts_list;
+    } else if (g_str_equal(group, "accel")) {
+        return &accel_opts_list;
     }
     return NULL;
 }
@@ -2188,22 +2163,20 @@ static int do_configure_icount(void *opaque, QemuOpts *opts, Error **errp)
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
+static void do_configure_accelerator(void *data, void *opaque)
 {
     bool *p_init_failed = opaque;
-    const char *acc = qemu_opt_get(opts, "accel");
+    QDict *qdict = data;
+    const char *acc = qdict_get_try_str(qdict, "accel");
     AccelClass *ac = accel_find(acc);
     AccelState *accel;
     int ret;
     bool qtest_with_kvm;
 
+    if (current_accel()) {
+        return;
+    }
+
     qtest_with_kvm = g_str_equal(acc, "kvm") && qtest_chrdev != NULL;
 
     if (!ac) {
@@ -2211,24 +2184,20 @@ static int do_configure_accelerator(void *opaque, QemuOpts *opts, Error **errp)
         if (!qtest_with_kvm) {
             error_report("invalid accelerator %s", acc);
         }
-        return 0;
+        return;
     }
     accel = ACCEL(object_new_with_class(OBJECT_CLASS(ac)));
     object_apply_compat_props(OBJECT(accel));
-    qemu_opt_foreach(opts, accelerator_set_property,
-                     accel,
-                     &error_fatal);
+    qdict_del(qdict, "accel");
+    object_set_properties_from_keyval(OBJECT(accel), qdict, &error_fatal);
 
     ret = accel_init_machine(accel, current_machine);
     if (ret < 0) {
         *p_init_failed = true;
         if (!qtest_with_kvm || ret != -ENOENT) {
-            error_report("failed to initialize %s: %s", acc, strerror(-ret));
+            error_report("failed to initialize %s: %s", ac->name, strerror(-ret));
         }
-        return 0;
     }
-
-    return 1;
 }
 
 static void configure_accelerators(const char *progname)
@@ -2238,7 +2207,7 @@ static void configure_accelerators(const char *progname)
     qemu_opts_foreach(qemu_find_opts("icount"),
                       do_configure_icount, NULL, &error_fatal);
 
-    if (QTAILQ_EMPTY(&qemu_accel_opts.head)) {
+    if (!accel_opts_list) {
         char **accel_list, **tmp;
 
         if (accelerators == NULL) {
@@ -2271,7 +2240,9 @@ static void configure_accelerators(const char *progname)
              * such as "-machine accel=tcg,,thread=single".
              */
             if (accel_find(*tmp)) {
-                qemu_opts_parse_noisily(qemu_find_opts("accel"), *tmp, true);
+                QDict *qdict = qdict_new();
+                qdict_put_str(qdict, "accel", *tmp);
+                accel_opts_list = g_slist_prepend(accel_opts_list, qdict);
             } else {
                 init_failed = true;
                 error_report("invalid accelerator %s", *tmp);
@@ -2285,8 +2256,12 @@ static void configure_accelerators(const char *progname)
         }
     }
 
-    if (!qemu_opts_foreach(qemu_find_opts("accel"),
-                           do_configure_accelerator, &init_failed, &error_fatal)) {
+    accel_opts_list = g_slist_reverse(accel_opts_list);
+    g_slist_foreach(accel_opts_list,
+                    do_configure_accelerator,
+                    &init_failed);
+
+    if (!current_accel()) {
         if (!init_failed) {
             error_report("no accelerator found");
         }
@@ -2304,6 +2279,27 @@ static void configure_accelerators(const char *progname)
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
@@ -2627,7 +2623,7 @@ void qmp_x_exit_preconfig(Error **errp)
 void qemu_init(int argc, char **argv, char **envp)
 {
     QemuOpts *opts;
-    QemuOpts *icount_opts = NULL, *accel_opts = NULL;
+    QemuOpts *icount_opts = NULL;
     QemuOptsList *olist;
     int optind;
     const char *optarg;
@@ -2651,7 +2647,6 @@ void qemu_init(int argc, char **argv, char **envp)
     qemu_add_opts(&qemu_trace_opts);
     qemu_plugin_add_opts();
     qemu_add_opts(&qemu_option_rom_opts);
-    qemu_add_opts(&qemu_accel_opts);
     qemu_add_opts(&qemu_mem_opts);
     qemu_add_opts(&qemu_smp_opts);
     qemu_add_opts(&qemu_boot_opts);
@@ -3207,30 +3202,21 @@ void qemu_init(int argc, char **argv, char **envp)
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
+                    QDict *args;
+                    bool help;
+
+                    args = keyval_parse(optarg, "accel", &help, &error_fatal);
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
+                    qemu_record_config_group("accel", args, &error_abort);
+                    break;
                 }
-                break;
             case QEMU_OPTION_usb:
                 qdict_put_str(machine_opts_dict, "usb", "on");
                 break;
-- 
2.26.2


