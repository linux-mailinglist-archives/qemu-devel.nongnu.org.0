Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DE852CBA73
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 11:22:15 +0100 (CET)
Received: from localhost ([::1]:41866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkPH4-0003W5-FM
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 05:22:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kkO47-00042U-31
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 04:04:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:48619)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kkO3o-0004il-EV
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 04:04:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606899865;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=h2gd4Qwnb9UvGMWpvdgh4qcPhatPHlPYBMwou2Jh5rQ=;
 b=DZvvEJlC9lajbgcMImEA3Y4VedhFLZt33eSBCMExbZNXvY7NoZuuEyK848vspdGlfJEKPv
 zlH7yBQkuI8zepiEPO42xTNb7GBG4l+pe0e9leZUCRBHsRua/QqkATjUHnROtDIFu85ke1
 9gCxKZjmHANXf4ZayKQ3zcciL33c4/Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-304-d3fT4FtAO4uZfH2JBOEPUQ-1; Wed, 02 Dec 2020 04:04:22 -0500
X-MC-Unique: d3fT4FtAO4uZfH2JBOEPUQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EE9E4192CC47;
 Wed,  2 Dec 2020 09:03:50 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7B8455C1B4;
 Wed,  2 Dec 2020 09:03:50 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 22/28] qemu: use keyval for -object parsing
Date: Wed,  2 Dec 2020 04:02:59 -0500
Message-Id: <20201202090305.4129317-23-pbonzini@redhat.com>
In-Reply-To: <20201202090305.4129317-1-pbonzini@redhat.com>
References: <20201202090305.4129317-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 include/qom/object_interfaces.h | 65 +---------------------------
 qom/object_interfaces.c         | 75 ---------------------------------
 softmmu/vl.c                    | 75 +++++++++++++++++++++------------
 3 files changed, 48 insertions(+), 167 deletions(-)

diff --git a/include/qom/object_interfaces.h b/include/qom/object_interfaces.h
index ed0d7d663b..1caa4fca57 100644
--- a/include/qom/object_interfaces.h
+++ b/include/qom/object_interfaces.h
@@ -104,51 +104,6 @@ Object *user_creatable_add_type(const char *type, const char *id,
  */
 bool user_creatable_add_dict(const QDict *qdict, bool keyval, Error **errp);
 
-/**
- * user_creatable_add_opts:
- * @opts: the object definition
- * @errp: if an error occurs, a pointer to an area to store the error
- *
- * Create an instance of the user creatable object whose type
- * is defined in @opts by the 'qom-type' option, placing it
- * in the object composition tree with name provided by the
- * 'id' field. The remaining options in @opts are used to
- * initialize the object properties.
- *
- * Returns: the newly created object or NULL on error
- */
-Object *user_creatable_add_opts(QemuOpts *opts, Error **errp);
-
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
@@ -156,30 +111,12 @@ int user_creatable_add_opts_foreach(void *opaque,
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
  *
  * Prints help considering the other options given in @args (if "qom-type" is
- * given and valid, print properties for the type, otherwise print valid types)
- *
- * In contrast to user_creatable_print_help(), this function can't return that
- * no help was requested. It should only be called if we know that help is
- * requested and it will always print some help.
+ * given and valid, print properties for the type, otherwise print valid types).
  */
 void user_creatable_print_help_from_qdict(const QDict *args);
 
diff --git a/qom/object_interfaces.c b/qom/object_interfaces.c
index 80814ae7b5..107c378c27 100644
--- a/qom/object_interfaces.c
+++ b/qom/object_interfaces.c
@@ -141,60 +141,6 @@ out:
     return !!obj;
 }
 
-Object *user_creatable_add_opts(QemuOpts *opts, Error **errp)
-{
-    Visitor *v;
-    QDict *pdict;
-    Object *obj;
-    const char *id = qemu_opts_id(opts);
-    char *type = qemu_opt_get_del(opts, "qom-type");
-
-    if (!type) {
-        error_setg(errp, QERR_MISSING_PARAMETER, "qom-type");
-        return NULL;
-    }
-    if (!id) {
-        error_setg(errp, QERR_MISSING_PARAMETER, "id");
-        qemu_opt_set(opts, "qom-type", type, &error_abort);
-        g_free(type);
-        return NULL;
-    }
-
-    qemu_opts_set_id(opts, NULL);
-    pdict = qemu_opts_to_qdict(opts, NULL);
-
-    v = opts_visitor_new(opts);
-    obj = user_creatable_add_type(type, id, pdict, v, errp);
-    visit_free(v);
-
-    qemu_opts_set_id(opts, (char *) id);
-    qemu_opt_set(opts, "qom-type", type, &error_abort);
-    g_free(type);
-    qobject_unref(pdict);
-    return obj;
-}
-
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
@@ -269,20 +215,6 @@ static bool user_creatable_print_type_properites(const char *type)
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
@@ -309,13 +241,6 @@ bool user_creatable_del(const char *id, Error **errp)
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
index de3e22c9eb..f083881f21 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -134,6 +134,7 @@ static const char *cpu_option;
 static const char *mem_path;
 static const char *incoming;
 static const char *loadvm;
+static GSList *object_opts_list = NULL;
 static ram_addr_t maxram_size;
 static uint64_t ram_slots;
 static int display_remote;
@@ -306,15 +307,6 @@ static QemuOptsList qemu_add_fd_opts = {
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
@@ -1675,12 +1667,8 @@ static int machine_set_property(void *opaque,
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
@@ -1773,6 +1761,22 @@ static void qemu_apply_machine_options(void)
     }
 }
 
+static void user_creatable_add_dict_foreach(void *data, void *opaque)
+{
+    bool (*type_opt_predicate)(const char *) = opaque;
+    const QDict *dict = data;
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
@@ -1799,9 +1803,9 @@ static void qemu_create_early_backends(void)
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
@@ -1830,9 +1834,9 @@ static void qemu_create_early_backends(void)
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
@@ -1843,9 +1847,9 @@ static void qemu_create_late_backends(void)
 
     net_init_clients(&error_fatal);
 
-    qemu_opts_foreach(qemu_find_opts("object"),
-                      user_creatable_add_opts_foreach,
-                      object_create_late, &error_fatal);
+    g_slist_foreach(object_opts_list,
+                    user_creatable_add_dict_foreach,
+                    object_create_late);
 
     if (tpm_init() < 0) {
         exit(1);
@@ -2052,6 +2056,9 @@ static int global_init_func(void *opaque, QemuOpts *opts, Error **errp)
  */
 static bool is_qemuopts_group(const char *group)
 {
+    if (g_str_equal(group, "object")) {
+        return false;
+    }
     return true;
 }
 
@@ -2061,6 +2068,9 @@ static bool is_qemuopts_group(const char *group)
  */
 static GSList **qemu_config_list(const char *group)
 {
+    if (g_str_equal(group, "object")) {
+        return &object_opts_list;
+    }
     return NULL;
 }
 
@@ -2643,7 +2653,6 @@ void qemu_init(int argc, char **argv, char **envp)
     qemu_add_opts(&qemu_smp_opts);
     qemu_add_opts(&qemu_boot_opts);
     qemu_add_opts(&qemu_add_fd_opts);
-    qemu_add_opts(&qemu_object_opts);
     qemu_add_opts(&qemu_tpmdev_opts);
     qemu_add_opts(&qemu_realtime_opts);
     qemu_add_opts(&qemu_overcommit_opts);
@@ -3427,12 +3436,18 @@ void qemu_init(int argc, char **argv, char **envp)
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
+                    qemu_record_config_group("object", args, &error_abort);
+                    break;
                 }
-                break;
             case QEMU_OPTION_realtime:
                 warn_report("'-realtime mlock=...' is deprecated, please use "
                              "'-overcommit mem-lock=...' instead");
@@ -3490,6 +3505,10 @@ void qemu_init(int argc, char **argv, char **envp)
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



