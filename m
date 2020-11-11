Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63D742AF3A6
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Nov 2020 15:32:58 +0100 (CET)
Received: from localhost ([::1]:35090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcrBB-0000C1-Ff
	for lists+qemu-devel@lfdr.de; Wed, 11 Nov 2020 09:32:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kcr4K-00005L-UU
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 09:25:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21790)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kcr4H-0001sd-O0
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 09:25:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605104749;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RQXJSzQQfttjqwsE01yl5wP/l5XoHRDd+FvY3XMnwSI=;
 b=I4+Ejw34PirnB+2OEOC047H5rgjnJQXYExYVMjL7rWxYRt8Ue6r9oBMpPEde3skBmO4gyF
 TVHM/80Chtxh16Sm1z7oO8P7QtxPF2oed5UZywo9qIlcZLhXQjetSABl+t16sPQUhTbR5V
 iZvLCGtcuDzGrFQuEHp4Tv9wVJGfnXY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-181-Xps8wpKFOqaqXIloXoOKVg-1; Wed, 11 Nov 2020 09:25:47 -0500
X-MC-Unique: Xps8wpKFOqaqXIloXoOKVg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4533B8CD801
 for <qemu-devel@nongnu.org>; Wed, 11 Nov 2020 14:25:46 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AD7E25DA74;
 Wed, 11 Nov 2020 14:25:42 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 12/12] qemu: use keyval for -object parsing
Date: Wed, 11 Nov 2020 09:25:37 -0500
Message-Id: <20201111142537.1213209-13-pbonzini@redhat.com>
In-Reply-To: <20201111142537.1213209-1-pbonzini@redhat.com>
References: <20201111142537.1213209-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/11 01:49:01
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: kwolf@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 include/qom/object_interfaces.h | 44 ----------------
 qom/object_interfaces.c         | 42 ---------------
 softmmu/vl.c                    | 93 ++++++++++++++++++++++-----------
 3 files changed, 63 insertions(+), 116 deletions(-)

diff --git a/include/qom/object_interfaces.h b/include/qom/object_interfaces.h
index abb23eaea3..77a4d5cf98 100644
--- a/include/qom/object_interfaces.h
+++ b/include/qom/object_interfaces.h
@@ -119,36 +119,6 @@ bool user_creatable_add_dict(QDict *qdict, bool keyval, Error **errp);
  */
 Object *user_creatable_add_opts(QemuOpts *opts, Error **errp);
 
-
-/**
- * user_creatable_add_opts_predicate:
- * @type: the QOM type to be added
- *
- * A callback function to determine whether an object
- * of type @type should be created. Instances of this
- * callback should be passed to user_creatable_add_opts_foreach
- */
-typedef bool (*user_creatable_add_opts_predicate)(const char *type);
-
-/**
- * user_creatable_add_opts_foreach:
- * @opaque: a user_creatable_add_opts_predicate callback or NULL
- * @opts: options to create
- * @errp: unused
- *
- * An iterator callback to be used in conjunction with
- * the qemu_opts_foreach() method for creating a list of
- * objects from a set of QemuOpts
- *
- * The @opaque parameter can be passed a user_creatable_add_opts_predicate
- * callback to filter which types of object are created during iteration.
- * When it fails, report the error.
- *
- * Returns: 0 on success, -1 when an error was reported.
- */
-int user_creatable_add_opts_foreach(void *opaque,
-                                    QemuOpts *opts, Error **errp);
-
 /**
  * user_creatable_print_types:
  *
@@ -156,20 +126,6 @@ int user_creatable_add_opts_foreach(void *opaque,
  */
 void user_creatable_print_types(void);
 
-/**
- * user_creatable_print_help:
- * @type: the QOM type to be added
- * @opts: options to create
- *
- * Prints help if requested in @type or @opts. Note that if @type is neither
- * "help"/"?" nor a valid user creatable type, no help will be printed
- * regardless of @opts.
- *
- * Returns: true if a help option was found and help was printed, false
- * otherwise.
- */
-bool user_creatable_print_help(const char *type, QemuOpts *opts);
-
 /**
  * user_creatable_print_help_from_qdict:
  * @args: options to create
diff --git a/qom/object_interfaces.c b/qom/object_interfaces.c
index f7dcdf18e2..08d1f5c0d5 100644
--- a/qom/object_interfaces.c
+++ b/qom/object_interfaces.c
@@ -171,27 +171,6 @@ Object *user_creatable_add_opts(QemuOpts *opts, Error **errp)
     return obj;
 }
 
-
-int user_creatable_add_opts_foreach(void *opaque, QemuOpts *opts, Error **errp)
-{
-    bool (*type_opt_predicate)(const char *, QemuOpts *) = opaque;
-    Object *obj = NULL;
-    const char *type;
-
-    type = qemu_opt_get(opts, "qom-type");
-    if (type && type_opt_predicate &&
-        !type_opt_predicate(type, opts)) {
-        return 0;
-    }
-
-    obj = user_creatable_add_opts(opts, errp);
-    if (!obj) {
-        return -1;
-    }
-    object_unref(obj);
-    return 0;
-}
-
 char *object_property_help(const char *name, const char *type,
                            QObject *defval, const char *description)
 {
@@ -266,20 +245,6 @@ static bool user_creatable_print_type_properites(const char *type)
     return true;
 }
 
-bool user_creatable_print_help(const char *type, QemuOpts *opts)
-{
-    if (is_help_option(type)) {
-        user_creatable_print_types();
-        return true;
-    }
-
-    if (qemu_opt_has_help_opt(opts)) {
-        return user_creatable_print_type_properites(type);
-    }
-
-    return false;
-}
-
 void user_creatable_print_help_from_qdict(const QDict *args)
 {
     const char *type = qdict_get_try_str(args, "qom-type");
@@ -306,13 +271,6 @@ bool user_creatable_del(const char *id, Error **errp)
         return false;
     }
 
-    /*
-     * if object was defined on the command-line, remove its corresponding
-     * option group entry
-     */
-    qemu_opts_del(qemu_opts_find(qemu_find_opts_err("object", &error_abort),
-                                 id));
-
     object_unparent(obj);
     return true;
 }
diff --git a/softmmu/vl.c b/softmmu/vl.c
index 9b3b687a85..bb4dc87a29 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -116,6 +116,7 @@
 #include "qapi/qapi-commands-migration.h"
 #include "qapi/qapi-commands-misc.h"
 #include "qapi/qapi-commands-ui.h"
+#include "qapi/qmp/qdict.h"
 #include "qapi/qmp/qerror.h"
 #include "sysemu/iothread.h"
 #include "qemu/guest-random.h"
@@ -136,6 +137,7 @@ static const char *boot_order;
 static const char *boot_once;
 static const char *incoming;
 static const char *loadvm;
+static GSList *object_opts_list = NULL;
 static ram_addr_t maxram_size;
 static uint64_t ram_slots;
 static int display_remote;
@@ -308,15 +310,6 @@ static QemuOptsList qemu_add_fd_opts = {
     },
 };
 
-static QemuOptsList qemu_object_opts = {
-    .name = "object",
-    .implied_opt_name = "qom-type",
-    .head = QTAILQ_HEAD_INITIALIZER(qemu_object_opts.head),
-    .desc = {
-        { }
-    },
-};
-
 static QemuOptsList qemu_tpmdev_opts = {
     .name = "tpmdev",
     .implied_opt_name = "type",
@@ -1678,12 +1671,8 @@ static int machine_set_property(void *opaque,
  * cannot be created here, as it depends on the chardev
  * already existing.
  */
-static bool object_create_early(const char *type, QemuOpts *opts)
+static bool object_create_early(const char *type)
 {
-    if (user_creatable_print_help(type, opts)) {
-        exit(0);
-    }
-
     /*
      * Objects should not be made "delayed" without a reason.  If you
      * add one, state the reason in a comment!
@@ -1769,6 +1758,22 @@ static void qemu_apply_machine_options(void)
     current_machine->boot_order = boot_order;
 }
 
+static void user_creatable_add_dict_foreach(void *data, void *opaque)
+{
+    bool (*type_opt_predicate)(const char *) = opaque;
+    QDict *dict = data;
+    const char *type = qdict_get_try_str(dict, "qom-type");
+
+    if (!type) {
+        error_report("Parameter 'qom-type' is missing");
+    }
+    if (type_opt_predicate && !type_opt_predicate(type)) {
+        return;
+    }
+
+    user_creatable_add_dict(dict, true, &error_fatal);
+}
+
 static void qemu_create_early_backends(void)
 {
     MachineClass *machine_class = MACHINE_GET_CLASS(current_machine);
@@ -1795,9 +1800,9 @@ static void qemu_create_early_backends(void)
         exit(1);
     }
 
-    qemu_opts_foreach(qemu_find_opts("object"),
-                      user_creatable_add_opts_foreach,
-                      object_create_early, &error_fatal);
+    g_slist_foreach(object_opts_list,
+                    user_creatable_add_dict_foreach,
+                    object_create_early);
 
     /* spice needs the timers to be initialized by this point */
     /* spice must initialize before audio as it changes the default auiodev */
@@ -1826,9 +1831,9 @@ static void qemu_create_early_backends(void)
  * The remainder of object creation happens after the
  * creation of chardev, fsdev, net clients and device data types.
  */
-static bool object_create_late(const char *type, QemuOpts *opts)
+static bool object_create_late(const char *type)
 {
-    return !object_create_early(type, opts);
+    return !object_create_early(type);
 }
 
 static void qemu_create_late_backends(void)
@@ -1839,9 +1844,9 @@ static void qemu_create_late_backends(void)
 
     net_init_clients(&error_fatal);
 
-    qemu_opts_foreach(qemu_find_opts("object"),
-                      user_creatable_add_opts_foreach,
-                      object_create_late, &error_fatal);
+    g_slist_foreach(object_opts_list,
+                    user_creatable_add_dict_foreach,
+                    object_create_late);
 
     if (tpm_init() < 0) {
         exit(1);
@@ -2041,13 +2046,32 @@ static int global_init_func(void *opaque, QemuOpts *opts, Error **errp)
     return 0;
 }
 
+/*
+ * Parse non-QemuOpts config file groups, pass the rest to
+ * qemu_config_do_parse.
+ */
+static void qemu_parse_config_group(const char *group, QDict *qdict,
+                                    void *opaque, Error **errp)
+{
+    if (g_str_equal(group, "object")) {
+        QObject *crumpled = qdict_crumple(qdict, errp);
+        if (!crumpled) {
+            return;
+        }
+        object_opts_list = g_slist_prepend(object_opts_list, crumpled);
+        return;
+    }
+
+    qemu_config_do_parse(group, qdict, opaque, errp);
+}
+
 static void qemu_read_default_config_file(Error **errp)
 {
     int ret;
     Error *local_err = NULL;
     g_autofree char *file = get_relocated_path(CONFIG_QEMU_CONFDIR "/qemu.conf");
 
-    ret = qemu_read_config_file(file, qemu_config_do_parse, &local_err);
+    ret = qemu_read_config_file(file, qemu_parse_config_group, &local_err);
     if (ret < 0 && ret != -ENOENT) {
         error_propagate(errp, local_err);
     }
@@ -2561,7 +2585,6 @@ void qemu_init(int argc, char **argv, char **envp)
     qemu_add_opts(&qemu_smp_opts);
     qemu_add_opts(&qemu_boot_opts);
     qemu_add_opts(&qemu_add_fd_opts);
-    qemu_add_opts(&qemu_object_opts);
     qemu_add_opts(&qemu_tpmdev_opts);
     qemu_add_opts(&qemu_realtime_opts);
     qemu_add_opts(&qemu_overcommit_opts);
@@ -3289,7 +3312,7 @@ void qemu_init(int argc, char **argv, char **envp)
                 qemu_plugin_opt_parse(optarg, &plugin_list);
                 break;
             case QEMU_OPTION_readconfig:
-                qemu_read_config_file(optarg, qemu_config_do_parse, &error_fatal);
+                qemu_read_config_file(optarg, qemu_parse_config_group, &error_fatal);
                 break;
             case QEMU_OPTION_spice:
                 olist = qemu_find_opts_err("spice", NULL);
@@ -3361,12 +3384,18 @@ void qemu_init(int argc, char **argv, char **envp)
 #endif
                 break;
             case QEMU_OPTION_object:
-                opts = qemu_opts_parse_noisily(qemu_find_opts("object"),
-                                               optarg, true);
-                if (!opts) {
-                    exit(1);
+                {
+                    QDict *args;
+                    bool help;
+
+                    args = keyval_parse(optarg, "qom-type", &help, &error_fatal);
+                    if (help) {
+                        user_creatable_print_help_from_qdict(args);
+                        exit(EXIT_SUCCESS);
+                    }
+                    object_opts_list = g_slist_prepend(object_opts_list, args);
+                    break;
                 }
-                break;
             case QEMU_OPTION_realtime:
                 warn_report("'-realtime mlock=...' is deprecated, please use "
                              "'-overcommit mem-lock=...' instead");
@@ -3424,6 +3453,10 @@ void qemu_init(int argc, char **argv, char **envp)
             }
         }
     }
+
+    /* Cleanup after option parsing loop.  */
+    object_opts_list = g_slist_reverse(object_opts_list);
+
     /*
      * Clear error location left behind by the loop.
      * Best done right after the loop.  Do not insert code here!
-- 
2.26.2


