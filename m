Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 649F72C0D30
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 15:25:59 +0100 (CET)
Received: from localhost ([::1]:59364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khCn0-0001dl-CJ
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 09:25:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1khCcB-0002v1-GC
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 09:14:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22162)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1khCc9-0007jG-LD
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 09:14:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606140885;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CG45locCjFwoPcA5B0Ny4DYAZJCuqnv0J1XcSfjFwOM=;
 b=O2f6OHpK1fcxi5rvXyCrqvJbFaplfPiqONjM7P75Z5oymoK9h/sqI41+RqIXdOcYVtzdUK
 3LsmjglRhULfXDY7Yqw98VQR6K7E0e4D90hdUyvW1LAxA0Ri7OtbkKoJCiFKwolVvE1piC
 7yJfn//YeFoekUt84+P75ENC6tiTum4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-29-auNpljbEMYOhgLxv68_9JA-1; Mon, 23 Nov 2020 09:14:43 -0500
X-MC-Unique: auNpljbEMYOhgLxv68_9JA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 543EA81CBDB
 for <qemu-devel@nongnu.org>; Mon, 23 Nov 2020 14:14:42 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0483C5D6D3;
 Mon, 23 Nov 2020 14:14:41 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 09/36] vl: extract various command line desugaring snippets to
 a new function
Date: Mon, 23 Nov 2020 09:14:08 -0500
Message-Id: <20201123141435.2726558-10-pbonzini@redhat.com>
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
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Keep the machine initialization sequence free of miscellaneous command
line parsing actions.

The only difference is that preallocation will always be done with one
thread if -smp is not provided; previously it was using mc->default_cpus,
which is almost always 1 anyway.

Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 softmmu/vl.c | 40 ++++++++++++++++++++++------------------
 1 file changed, 22 insertions(+), 18 deletions(-)

diff --git a/softmmu/vl.c b/softmmu/vl.c
index acea4286e9..1c08505f3a 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -126,6 +126,7 @@ static const char *boot_once;
 static const char *incoming;
 static const char *loadvm;
 enum vga_retrace_method vga_retrace_method = VGA_RETRACE_DUMB;
+static int mem_prealloc; /* force preallocation of physical target memory */
 int display_opengl;
 const char* keyboard_layout = NULL;
 static ram_addr_t ram_size;
@@ -158,7 +159,7 @@ int fd_bootchk = 1;
 static int no_reboot;
 int no_shutdown = 0;
 int graphic_rotate = 0;
-const char *watchdog;
+static const char *watchdog;
 QEMUOptionRom option_rom[MAX_OPTION_ROMS];
 int nb_option_roms;
 int old_param = 0;
@@ -2910,6 +2911,25 @@ static void qemu_validate_options(void)
 #endif
 }
 
+static void qemu_process_sugar_options(void)
+{
+    if (mem_prealloc) {
+        char *val;
+
+        val = g_strdup_printf("%d",
+                 (uint32_t) qemu_opt_get_number(qemu_find_opts_singleton("smp-opts"), "cpus", 1));
+        object_register_sugar_prop("memory-backend", "prealloc-threads", val);
+        g_free(val);
+        object_register_sugar_prop("memory-backend", "prealloc", "on");
+    }
+
+    if (watchdog) {
+        int i = select_watchdog(watchdog);
+        if (i > 0)
+            exit (i == 1 ? 1 : 0);
+    }
+}
+
 static void qemu_process_early_options(void)
 {
     char **dirs;
@@ -3171,7 +3191,6 @@ static void qemu_machine_creation_done(void)
 
 void qemu_init(int argc, char **argv, char **envp)
 {
-    int i;
     int snapshot = 0;
     QemuOpts *opts, *machine_opts;
     QemuOpts *icount_opts = NULL, *accel_opts = NULL;
@@ -3190,7 +3209,6 @@ void qemu_init(int argc, char **argv, char **envp)
     bool have_custom_ram_size;
     BlockdevOptionsQueue bdo_queue = QSIMPLEQ_HEAD_INITIALIZER(bdo_queue);
     QemuPluginList plugin_list = QTAILQ_HEAD_INITIALIZER(plugin_list);
-    int mem_prealloc = 0; /* force preallocation of physical target memory */
 
     qemu_add_opts(&qemu_drive_opts);
     qemu_add_drive_opts(&qemu_legacy_drive_opts);
@@ -4102,6 +4120,7 @@ void qemu_init(int argc, char **argv, char **envp)
     loc_set_none();
 
     qemu_validate_options();
+    qemu_process_sugar_options();
 
     /*
      * These options affect everything else and should be processed
@@ -4155,15 +4174,6 @@ void qemu_init(int argc, char **argv, char **envp)
     machine_smp_parse(current_machine,
         qemu_opts_find(qemu_find_opts("smp-opts"), NULL), &error_fatal);
 
-    if (mem_prealloc) {
-        char *val;
-
-        val = g_strdup_printf("%d", current_machine->smp.cpus);
-        object_register_sugar_prop("memory-backend", "prealloc-threads", val);
-        g_free(val);
-        object_register_sugar_prop("memory-backend", "prealloc", "on");
-    }
-
     /*
      * Get the default machine options from the machine if it is not already
      * specified either by the configuration file or by the command line.
@@ -4422,12 +4432,6 @@ void qemu_init(int argc, char **argv, char **envp)
         select_vgahw(machine_class, vga_model);
     }
 
-    if (watchdog) {
-        i = select_watchdog(watchdog);
-        if (i > 0)
-            exit (i == 1 ? 1 : 0);
-    }
-
     /* This checkpoint is required by replay to separate prior clock
        reading from the other reads, because timer polling functions query
        clock values from the log. */
-- 
2.26.2



