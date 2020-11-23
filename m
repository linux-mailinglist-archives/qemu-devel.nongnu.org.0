Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D00A42C0D0D
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 15:16:36 +0100 (CET)
Received: from localhost ([::1]:53962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khCdv-0004e7-Ti
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 09:16:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1khCc8-0002or-BD
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 09:14:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:20485)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1khCc6-0007iA-69
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 09:14:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606140881;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PM2MiVUMIffOMkKcgIxggp1xjchgYUeK05DVXa5V/Pc=;
 b=Q+B1ZwtAdgxsNKT4TTDe+oaHijZfFYKX5v2nf/G4xRM1z6e1RxdG1jc1KGE3uIpBCvte6m
 e7znX3hr9jG+VrVqZ53a1bfLxHXYG5rpAGmZ/O1hy74TsazbYZkaSZQWRGymseEv4/eS52
 sMQqETE4+X/X+QSIlDbPn4zKT70NqDE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-582--sB8VIq6OP2t0e9-_9Flfg-1; Mon, 23 Nov 2020 09:14:39 -0500
X-MC-Unique: -sB8VIq6OP2t0e9-_9Flfg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2C43B100B719
 for <qemu-devel@nongnu.org>; Mon, 23 Nov 2020 14:14:38 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D23755D6D3;
 Mon, 23 Nov 2020 14:14:37 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 05/36] vl: extract qemu_init_subsystems
Date: Mon, 23 Nov 2020 09:14:04 -0500
Message-Id: <20201123141435.2726558-6-pbonzini@redhat.com>
In-Reply-To: <20201123141435.2726558-1-pbonzini@redhat.com>
References: <20201123141435.2726558-1-pbonzini@redhat.com>
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
Cc: Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Group a bunch of subsystem initializations that can be done right
after command line parsing.  Remove initializations that can be done
simply as global variable initializers.

Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 softmmu/vl.c | 94 ++++++++++++++++++++++++----------------------------
 1 file changed, 43 insertions(+), 51 deletions(-)

diff --git a/softmmu/vl.c b/softmmu/vl.c
index b8d65ac532..2832ab937e 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -128,7 +128,7 @@ bool enable_mlock = false;
 bool enable_cpu_pm = false;
 int nb_nics;
 NICInfo nd_table[MAX_NICS];
-int autostart;
+int autostart = 1;
 static enum {
     RTC_BASE_UTC,
     RTC_BASE_LOCALTIME,
@@ -1228,7 +1228,8 @@ struct VMChangeStateEntry {
     int priority;
 };
 
-static QTAILQ_HEAD(, VMChangeStateEntry) vm_change_state_head;
+static QTAILQ_HEAD(, VMChangeStateEntry) vm_change_state_head =
+    QTAILQ_HEAD_INITIALIZER(vm_change_state_head);
 
 /**
  * qemu_add_vm_change_state_handler_prio:
@@ -2964,11 +2965,44 @@ static void qemu_maybe_daemonize(const char *pid_file)
     qemu_add_exit_notifier(&qemu_unlink_pidfile_notifier);
 }
 
+static void qemu_init_subsystems(void)
+{
+    Error *err;
+
+    os_set_line_buffering();
+
+    module_call_init(MODULE_INIT_TRACE);
+
+    qemu_init_cpu_list();
+    qemu_init_cpu_loop();
+    qemu_mutex_lock_iothread();
+
+    atexit(qemu_run_exit_notifiers);
+
+    module_call_init(MODULE_INIT_QOM);
+    module_call_init(MODULE_INIT_MIGRATION);
+
+    runstate_init();
+    precopy_infrastructure_init();
+    postcopy_infrastructure_init();
+    monitor_init_globals();
+
+    if (qcrypto_init(&err) < 0) {
+        error_reportf_err(err, "cannot initialize crypto: ");
+        exit(1);
+    }
+
+    os_setup_early_signal_handling();
+
+    bdrv_init_with_whitelist();
+    socket_init();
+}
 
 void qemu_init(int argc, char **argv, char **envp)
 {
     int i;
-    int snapshot, linux_boot;
+    int snapshot = 0;
+    int linux_boot;
     const char *initrd_filename;
     const char *kernel_filename, *kernel_cmdline;
     const char *boot_order = NULL;
@@ -2989,7 +3023,6 @@ void qemu_init(int argc, char **argv, char **envp)
     ram_addr_t maxram_size;
     uint64_t ram_slots = 0;
     FILE *vmstate_dump_file = NULL;
-    Error *main_loop_err = NULL;
     Error *err = NULL;
     const char *mem_path = NULL;
     bool have_custom_ram_size;
@@ -2997,22 +3030,6 @@ void qemu_init(int argc, char **argv, char **envp)
     QemuPluginList plugin_list = QTAILQ_HEAD_INITIALIZER(plugin_list);
     int mem_prealloc = 0; /* force preallocation of physical target memory */
 
-    os_set_line_buffering();
-
-    error_init(argv[0]);
-    module_call_init(MODULE_INIT_TRACE);
-
-    qemu_init_cpu_list();
-    qemu_init_cpu_loop();
-
-    qemu_mutex_lock_iothread();
-
-    atexit(qemu_run_exit_notifiers);
-    qemu_init_exec_dir(argv[0]);
-
-    module_call_init(MODULE_INIT_QOM);
-    module_call_init(MODULE_INIT_MIGRATION);
-
     qemu_add_opts(&qemu_drive_opts);
     qemu_add_drive_opts(&qemu_legacy_drive_opts);
     qemu_add_drive_opts(&qemu_common_drive_opts);
@@ -3047,27 +3064,10 @@ void qemu_init(int argc, char **argv, char **envp)
     qemu_add_opts(&qemu_fw_cfg_opts);
     module_call_init(MODULE_INIT_OPTS);
 
-    runstate_init();
-    precopy_infrastructure_init();
-    postcopy_infrastructure_init();
-    monitor_init_globals();
-
-    if (qcrypto_init(&err) < 0) {
-        error_reportf_err(err, "cannot initialize crypto: ");
-        exit(1);
-    }
-
-    QTAILQ_INIT(&vm_change_state_head);
-    os_setup_early_signal_handling();
-
-    cpu_option = NULL;
-    snapshot = 0;
-
-    nb_nics = 0;
-
-    bdrv_init_with_whitelist();
+    error_init(argv[0]);
+    qemu_init_exec_dir(argv[0]);
 
-    autostart = 1;
+    qemu_init_subsystems();
 
     /* first pass of option parsing */
     optind = 1;
@@ -3948,13 +3948,10 @@ void qemu_init(int argc, char **argv, char **envp)
     qemu_process_help_options();
     qemu_maybe_daemonize(pid_file);
 
-    if (qemu_init_main_loop(&main_loop_err)) {
-        error_report_err(main_loop_err);
-        exit(1);
-    }
+    qemu_init_main_loop(&error_fatal);
+    cpu_timers_init();
 
     user_register_global_props();
-
     replay_configure(icount_opts);
 
     if (incoming && !preconfig_exit_requested) {
@@ -3991,6 +3988,7 @@ void qemu_init(int argc, char **argv, char **envp)
     }
 
     cpu_exec_init_all();
+    page_size_init();
 
     if (machine_class->hw_version) {
         qemu_set_hw_version(machine_class->hw_version);
@@ -4133,9 +4131,6 @@ void qemu_init(int argc, char **argv, char **envp)
         exit(1);
     }
 
-    page_size_init();
-    socket_init();
-
     qemu_opts_foreach(qemu_find_opts("object"),
                       user_creatable_add_opts_foreach,
                       object_create_initial, &error_fatal);
@@ -4252,9 +4247,6 @@ void qemu_init(int argc, char **argv, char **envp)
         semihosting_arg_fallback(kernel_filename, kernel_cmdline);
     }
 
-    /* initialize cpu timers and VCPU throttle modules */
-    cpu_timers_init();
-
     if (default_net) {
         QemuOptsList *net = qemu_find_opts("net");
         qemu_opts_set(net, NULL, "type", "nic", &error_abort);
-- 
2.26.2



