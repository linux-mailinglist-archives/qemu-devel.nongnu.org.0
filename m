Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56DCD2CB7D1
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 09:55:48 +0100 (CET)
Received: from localhost ([::1]:55946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkNvP-0007ch-87
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 03:55:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kkNCh-0003L7-TB
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 03:09:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:31719)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kkNCN-0003ja-2P
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 03:09:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606896552;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DP5v0aDuYSmiDSflO0D+wIrkUtHdRUtAOfcwnaOHby4=;
 b=htTIS0IknlQrtv8k+pdujO/JvsYb0KqBbvXZ+iL6UpPwhw27bgVUrYSpwlG3l63j+0KhoJ
 ck6aMhVyOroNWaSoBAzahzxSGkTfkL8Ss42O+AHRfsqlVN5SP3MqGTD/b3AL8sWm5eJTbx
 +zLNoN4xg843ckqg2iIKGDNIPwVa75k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-90-UroDX7jEM-W3mSGEvf783Q-1; Wed, 02 Dec 2020 03:09:10 -0500
X-MC-Unique: UroDX7jEM-W3mSGEvf783Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 08D161006C81
 for <qemu-devel@nongnu.org>; Wed,  2 Dec 2020 08:09:10 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C7C175D705
 for <qemu-devel@nongnu.org>; Wed,  2 Dec 2020 08:09:09 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 054/113] vl: split various early command line options to a
 separate function
Date: Wed,  2 Dec 2020 03:07:50 -0500
Message-Id: <20201202080849.4125477-55-pbonzini@redhat.com>
In-Reply-To: <20201202080849.4125477-1-pbonzini@redhat.com>
References: <20201202080849.4125477-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Various options affect the global state of QEMU including the rest of
qemu_init, and they need to be called very early.  Group them together
in a function that is called at the beginning.

Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 softmmu/vl.c | 200 ++++++++++++++++++++++++++++-----------------------
 1 file changed, 112 insertions(+), 88 deletions(-)

diff --git a/softmmu/vl.c b/softmmu/vl.c
index 2f2372bac7..9caff9fe8e 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -117,6 +117,7 @@
 
 #define MAX_VIRTIO_CONSOLES 1
 
+static const char *cpu_option;
 static const char *data_dir[16];
 static int data_dir_idx;
 enum vga_retrace_method vga_retrace_method = VGA_RETRACE_DUMB;
@@ -142,6 +143,9 @@ int vga_interface_type = VGA_NONE;
 static DisplayOptions dpy;
 static int num_serial_hds;
 static Chardev **serial_hds;
+static const char *log_mask;
+static const char *log_file;
+static bool list_data_dirs;
 Chardev *parallel_hds[MAX_PARALLEL_PORTS];
 int win2k_install_hack = 0;
 int singlestep = 0;
@@ -2866,6 +2870,105 @@ static char *find_datadir(void)
     return get_relocated_path(CONFIG_QEMU_DATADIR);
 }
 
+static void qemu_process_early_options(void)
+{
+    char **dirs;
+    int i;
+
+#ifdef CONFIG_SECCOMP
+    QemuOptsList *olist = qemu_find_opts_err("sandbox", NULL);
+    if (olist) {
+        qemu_opts_foreach(olist, parse_sandbox, NULL, &error_fatal);
+    }
+#endif
+
+    qemu_opts_foreach(qemu_find_opts("name"),
+                      parse_name, NULL, &error_fatal);
+
+#ifndef _WIN32
+    qemu_opts_foreach(qemu_find_opts("add-fd"),
+                      parse_add_fd, NULL, &error_fatal);
+
+    qemu_opts_foreach(qemu_find_opts("add-fd"),
+                      cleanup_add_fd, NULL, &error_fatal);
+#endif
+
+    if (!trace_init_backends()) {
+        exit(1);
+    }
+    trace_init_file();
+
+    /* Open the logfile at this point and set the log mask if necessary.  */
+    qemu_set_log_filename(log_file, &error_fatal);
+    if (log_mask) {
+        int mask;
+        mask = qemu_str_to_log_mask(log_mask);
+        if (!mask) {
+            qemu_print_log_usage(stdout);
+            exit(1);
+        }
+        qemu_set_log(mask);
+    } else {
+        qemu_set_log(0);
+    }
+
+    /* add configured firmware directories */
+    dirs = g_strsplit(CONFIG_QEMU_FIRMWAREPATH, G_SEARCHPATH_SEPARATOR_S, 0);
+    for (i = 0; dirs[i] != NULL; i++) {
+        qemu_add_data_dir(get_relocated_path(dirs[i]));
+    }
+    g_strfreev(dirs);
+
+    /* try to find datadir relative to the executable path */
+    qemu_add_data_dir(find_datadir());
+}
+
+static void qemu_process_help_options(void)
+{
+    int i;
+
+    /*
+     * Check for -cpu help and -device help before we call select_machine(),
+     * which will return an error if the architecture has no default machine
+     * type and the user did not specify one, so that the user doesn't need
+     * to say '-cpu help -machine something'.
+     */
+    if (cpu_option && is_help_option(cpu_option)) {
+        list_cpus(cpu_option);
+        exit(0);
+    }
+
+    if (qemu_opts_foreach(qemu_find_opts("device"),
+                          device_help_func, NULL, NULL)) {
+        exit(0);
+    }
+
+    /* -L help lists the data directories and exits. */
+    if (list_data_dirs) {
+        for (i = 0; i < data_dir_idx; i++) {
+            printf("%s\n", data_dir[i]);
+        }
+        exit(0);
+    }
+}
+
+static void qemu_maybe_daemonize(const char *pid_file)
+{
+    Error *err;
+
+    os_daemonize();
+    rcu_disable_atfork();
+
+    if (pid_file && !qemu_write_pidfile(pid_file, &err)) {
+        error_reportf_err(err, "cannot create PID file: ");
+        exit(1);
+    }
+
+    qemu_unlink_pidfile_notifier.notify = qemu_unlink_pidfile;
+    qemu_add_exit_notifier(&qemu_unlink_pidfile_notifier);
+}
+
+
 void qemu_init(int argc, char **argv, char **envp)
 {
     int i;
@@ -2882,21 +2985,16 @@ void qemu_init(int argc, char **argv, char **envp)
     const char *optarg;
     const char *loadvm = NULL;
     MachineClass *machine_class;
-    const char *cpu_option;
     const char *vga_model = NULL;
     const char *incoming = NULL;
     bool userconfig = true;
     bool nographic = false;
     int display_remote = 0;
-    const char *log_mask = NULL;
-    const char *log_file = NULL;
     ram_addr_t maxram_size;
     uint64_t ram_slots = 0;
     FILE *vmstate_dump_file = NULL;
     Error *main_loop_err = NULL;
     Error *err = NULL;
-    bool list_data_dirs = false;
-    char **dirs;
     const char *mem_path = NULL;
     bool have_custom_ram_size;
     BlockdevOptionsQueue bdo_queue = QSIMPLEQ_HEAD_INITIALIZER(bdo_queue);
@@ -3846,19 +3944,17 @@ void qemu_init(int argc, char **argv, char **envp)
     loc_set_none();
 
     /*
-     * Check for -cpu help and -device help before we call select_machine(),
-     * which will return an error if the architecture has no default machine
-     * type and the user did not specify one, so that the user doesn't need
-     * to say '-cpu help -machine something'.
+     * These options affect everything else and should be processed
+     * before daemonizing.
      */
-    if (cpu_option && is_help_option(cpu_option)) {
-        list_cpus(cpu_option);
-        exit(0);
-    }
+    qemu_process_early_options();
 
-    if (qemu_opts_foreach(qemu_find_opts("device"),
-                          device_help_func, NULL, NULL)) {
-        exit(0);
+    qemu_process_help_options();
+    qemu_maybe_daemonize(pid_file);
+
+    if (qemu_init_main_loop(&main_loop_err)) {
+        error_report_err(main_loop_err);
+        exit(1);
     }
 
     user_register_global_props();
@@ -3879,40 +3975,6 @@ void qemu_init(int argc, char **argv, char **envp)
     have_custom_ram_size = set_memory_options(&ram_slots, &maxram_size,
                                               machine_class);
 
-    os_daemonize();
-    rcu_disable_atfork();
-
-    if (pid_file && !qemu_write_pidfile(pid_file, &err)) {
-        error_reportf_err(err, "cannot create PID file: ");
-        exit(1);
-    }
-
-    qemu_unlink_pidfile_notifier.notify = qemu_unlink_pidfile;
-    qemu_add_exit_notifier(&qemu_unlink_pidfile_notifier);
-
-    if (qemu_init_main_loop(&main_loop_err)) {
-        error_report_err(main_loop_err);
-        exit(1);
-    }
-
-#ifdef CONFIG_SECCOMP
-    olist = qemu_find_opts_err("sandbox", NULL);
-    if (olist) {
-        qemu_opts_foreach(olist, parse_sandbox, NULL, &error_fatal);
-    }
-#endif
-
-    qemu_opts_foreach(qemu_find_opts("name"),
-                      parse_name, NULL, &error_fatal);
-
-#ifndef _WIN32
-    qemu_opts_foreach(qemu_find_opts("add-fd"),
-                      parse_add_fd, NULL, &error_fatal);
-
-    qemu_opts_foreach(qemu_find_opts("add-fd"),
-                      cleanup_add_fd, NULL, &error_fatal);
-#endif
-
     current_machine = MACHINE(object_new_with_class(OBJECT_CLASS(machine_class)));
     if (machine_help_func(qemu_get_machine_opts(), current_machine)) {
         exit(0);
@@ -3938,44 +4000,6 @@ void qemu_init(int argc, char **argv, char **envp)
         qemu_set_hw_version(machine_class->hw_version);
     }
 
-    if (!trace_init_backends()) {
-        exit(1);
-    }
-    trace_init_file();
-
-    /* Open the logfile at this point and set the log mask if necessary.
-     */
-    qemu_set_log_filename(log_file, &error_fatal);
-    if (log_mask) {
-        int mask;
-        mask = qemu_str_to_log_mask(log_mask);
-        if (!mask) {
-            qemu_print_log_usage(stdout);
-            exit(1);
-        }
-        qemu_set_log(mask);
-    } else {
-        qemu_set_log(0);
-    }
-
-    /* add configured firmware directories */
-    dirs = g_strsplit(CONFIG_QEMU_FIRMWAREPATH, G_SEARCHPATH_SEPARATOR_S, 0);
-    for (i = 0; dirs[i] != NULL; i++) {
-        qemu_add_data_dir(get_relocated_path(dirs[i]));
-    }
-    g_strfreev(dirs);
-
-    /* try to find datadir relative to the executable path */
-    qemu_add_data_dir(find_datadir());
-
-    /* -L help lists the data directories and exits. */
-    if (list_data_dirs) {
-        for (i = 0; i < data_dir_idx; i++) {
-            printf("%s\n", data_dir[i]);
-        }
-        exit(0);
-    }
-
     machine_smp_parse(current_machine,
         qemu_opts_find(qemu_find_opts("smp-opts"), NULL), &error_fatal);
 
-- 
2.26.2



