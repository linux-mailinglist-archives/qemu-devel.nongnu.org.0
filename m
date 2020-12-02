Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E57F42CB7D2
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 09:55:53 +0100 (CET)
Received: from localhost ([::1]:56602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkNvU-0007uc-UO
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 03:55:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kkNCj-0003OI-SS
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 03:09:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54245)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kkNCN-0003k7-45
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 03:09:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606896553;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pCVh5j20ZuWqQl9mnKBGxJHe1C2rUICIaNHahVRGm+8=;
 b=Ix8/9InQnFL6D5+3FHj97Al3WLA3msmlrQP5UoIXf3KrAS8ybRrt2L+PnfPq6MD0dbBfQw
 iUZUrTzKfpnhPTjFTjG66+DnIYQ/BdPx3YniW0oThO6Xth/la2/DTOuaRkYJCqhhvQTQUe
 Vb0YRKcTyTK1VX137wwadj0k8sFiRxk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-471-za5qrbQZNX6EQJm_VbI1RQ-1; Wed, 02 Dec 2020 03:09:12 -0500
X-MC-Unique: za5qrbQZNX6EQJm_VbI1RQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 575275708C
 for <qemu-devel@nongnu.org>; Wed,  2 Dec 2020 08:09:11 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 22FDA5D705
 for <qemu-devel@nongnu.org>; Wed,  2 Dec 2020 08:09:11 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 058/113] vl: extract various command line validation snippets
 to a new function
Date: Wed,  2 Dec 2020 03:07:54 -0500
Message-Id: <20201202080849.4125477-59-pbonzini@redhat.com>
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
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.497,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/core/machine.c |  1 +
 softmmu/vl.c      | 78 +++++++++++++++++++++++------------------------
 2 files changed, 40 insertions(+), 39 deletions(-)

diff --git a/hw/core/machine.c b/hw/core/machine.c
index 5260155962..7ef3de5ce5 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -880,6 +880,7 @@ static void machine_initfn(Object *obj)
     ms->dump_guest_core = true;
     ms->mem_merge = true;
     ms->enable_graphics = true;
+    ms->kernel_cmdline = g_strdup("");
 
     if (mc->nvdimm_supported) {
         Object *obj = OBJECT(ms);
diff --git a/softmmu/vl.c b/softmmu/vl.c
index 90f9782107..71b5263d05 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -123,6 +123,7 @@ static int data_dir_idx;
 static const char *mem_path;
 static const char *boot_order;
 static const char *boot_once;
+static const char *incoming;
 enum vga_retrace_method vga_retrace_method = VGA_RETRACE_DUMB;
 int display_opengl;
 const char* keyboard_layout = NULL;
@@ -2874,6 +2875,39 @@ static char *find_datadir(void)
     return get_relocated_path(CONFIG_QEMU_DATADIR);
 }
 
+static void qemu_validate_options(void)
+{
+    QemuOpts *machine_opts = qemu_get_machine_opts();
+    const char *kernel_filename = qemu_opt_get(machine_opts, "kernel");
+    const char *initrd_filename = qemu_opt_get(machine_opts, "initrd");
+    const char *kernel_cmdline = qemu_opt_get(machine_opts, "append");
+
+    if (kernel_filename == NULL) {
+         if (kernel_cmdline != NULL) {
+              error_report("-append only allowed with -kernel option");
+              exit(1);
+          }
+
+          if (initrd_filename != NULL) {
+              error_report("-initrd only allowed with -kernel option");
+              exit(1);
+          }
+    }
+
+    if (incoming && !preconfig_exit_requested) {
+        error_report("'preconfig' and 'incoming' options are "
+                     "mutually exclusive");
+        exit(EXIT_FAILURE);
+    }
+
+#ifdef CONFIG_CURSES
+    if (is_daemonized() && dpy.type == DISPLAY_TYPE_CURSES) {
+        error_report("curses display cannot be used with -daemonize");
+        exit(1);
+    }
+#endif
+}
+
 static void qemu_process_early_options(void)
 {
     char **dirs;
@@ -3137,9 +3171,6 @@ void qemu_init(int argc, char **argv, char **envp)
 {
     int i;
     int snapshot = 0;
-    int linux_boot;
-    const char *initrd_filename;
-    const char *kernel_filename, *kernel_cmdline;
     QemuOpts *opts, *machine_opts;
     QemuOpts *icount_opts = NULL, *accel_opts = NULL;
     QemuOptsList *olist;
@@ -3148,7 +3179,6 @@ void qemu_init(int argc, char **argv, char **envp)
     const char *loadvm = NULL;
     MachineClass *machine_class;
     const char *vga_model = NULL;
-    const char *incoming = NULL;
     bool userconfig = true;
     bool nographic = false;
     int display_remote = 0;
@@ -4070,6 +4100,8 @@ void qemu_init(int argc, char **argv, char **envp)
      */
     loc_set_none();
 
+    qemu_validate_options();
+
     /*
      * These options affect everything else and should be processed
      * before daemonizing.
@@ -4085,12 +4117,6 @@ void qemu_init(int argc, char **argv, char **envp)
     user_register_global_props();
     replay_configure(icount_opts);
 
-    if (incoming && !preconfig_exit_requested) {
-        error_report("'preconfig' and 'incoming' options are "
-                     "mutually exclusive");
-        exit(EXIT_FAILURE);
-    }
-
     configure_rtc(qemu_find_opts_singleton("rtc"));
 
     machine_class = select_machine();
@@ -4195,12 +4221,6 @@ void qemu_init(int argc, char **argv, char **envp)
             error_report("-nographic cannot be used with -daemonize");
             exit(1);
         }
-#ifdef CONFIG_CURSES
-        if (dpy.type == DISPLAY_TYPE_CURSES) {
-            error_report("curses display cannot be used with -daemonize");
-            exit(1);
-        }
-#endif
     }
 
     if (nographic) {
@@ -4331,11 +4351,6 @@ void qemu_init(int argc, char **argv, char **envp)
         qtest_server_init(qtest_chrdev, qtest_log, &error_fatal);
     }
 
-    machine_opts = qemu_get_machine_opts();
-    kernel_filename = qemu_opt_get(machine_opts, "kernel");
-    initrd_filename = qemu_opt_get(machine_opts, "initrd");
-    kernel_cmdline = qemu_opt_get(machine_opts, "append");
-
     opts = qemu_opts_find(qemu_find_opts("boot-opts"), NULL);
     if (opts) {
         boot_order = qemu_opt_get(opts, "order");
@@ -4356,24 +4371,9 @@ void qemu_init(int argc, char **argv, char **envp)
         boot_order = machine_class->default_boot_order;
     }
 
-    if (!kernel_cmdline) {
-        kernel_cmdline = "";
-        current_machine->kernel_cmdline = (char *)kernel_cmdline;
-    }
-
-    linux_boot = (kernel_filename != NULL);
-
-    if (!linux_boot && *kernel_cmdline != '\0') {
-        error_report("-append only allowed with -kernel option");
-        exit(1);
-    }
-
-    if (!linux_boot && initrd_filename != NULL) {
-        error_report("-initrd only allowed with -kernel option");
-        exit(1);
-    }
-
-    if (semihosting_enabled() && !semihosting_get_argc() && kernel_filename) {
+    if (semihosting_enabled() && !semihosting_get_argc()) {
+        const char *kernel_filename = qemu_opt_get(machine_opts, "kernel");
+        const char *kernel_cmdline = qemu_opt_get(machine_opts, "append");
         /* fall back to the -kernel/-append */
         semihosting_arg_fallback(kernel_filename, kernel_cmdline);
     }
-- 
2.26.2



