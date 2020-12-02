Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 066F82CB7EB
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 10:00:52 +0100 (CET)
Received: from localhost ([::1]:43786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkO0I-00069K-Q4
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 04:00:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kkNCt-0003Pl-9j
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 03:09:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:21132)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kkNCO-0003kM-V0
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 03:09:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606896554;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aoEY9amDCE/ofBNeD9yLPxQ+BRv39mk4G7Kgodv+DFI=;
 b=JYW6/SWcN021Z49DLRsTW5uf8gsSaap45nlf75tniP0I5ESLekHZvHw86C92wQ+odkkWrn
 9IsvWrgSgpG186/cf4ekEanL2VRS/3UyjgwQRXN2uHI3XH4vhH3r+1yL1dGQDPxFNtF5xd
 MlaElkKYJiNfyCHxQ9QvU+HrLepcxb8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-246-hh1_JJXkN7WUtS0l4-OzJA-1; Wed, 02 Dec 2020 03:09:13 -0500
X-MC-Unique: hh1_JJXkN7WUtS0l4-OzJA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 53941185E48E
 for <qemu-devel@nongnu.org>; Wed,  2 Dec 2020 08:09:12 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 16FFA10013BD
 for <qemu-devel@nongnu.org>; Wed,  2 Dec 2020 08:09:12 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 060/113] vl: extract various command line desugaring snippets
 to a new function
Date: Wed,  2 Dec 2020 03:07:56 -0500
Message-Id: <20201202080849.4125477-61-pbonzini@redhat.com>
In-Reply-To: <20201202080849.4125477-1-pbonzini@redhat.com>
References: <20201202080849.4125477-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
index 98994e10fa..85b23d51be 100644
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
@@ -2914,6 +2915,25 @@ static void qemu_validate_options(void)
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
@@ -3175,7 +3195,6 @@ static void qemu_machine_creation_done(void)
 
 void qemu_init(int argc, char **argv, char **envp)
 {
-    int i;
     int snapshot = 0;
     QemuOpts *opts, *machine_opts;
     QemuOpts *icount_opts = NULL, *accel_opts = NULL;
@@ -3194,7 +3213,6 @@ void qemu_init(int argc, char **argv, char **envp)
     bool have_custom_ram_size;
     BlockdevOptionsQueue bdo_queue = QSIMPLEQ_HEAD_INITIALIZER(bdo_queue);
     QemuPluginList plugin_list = QTAILQ_HEAD_INITIALIZER(plugin_list);
-    int mem_prealloc = 0; /* force preallocation of physical target memory */
 
     qemu_add_opts(&qemu_drive_opts);
     qemu_add_drive_opts(&qemu_legacy_drive_opts);
@@ -4106,6 +4124,7 @@ void qemu_init(int argc, char **argv, char **envp)
     loc_set_none();
 
     qemu_validate_options();
+    qemu_process_sugar_options();
 
     /*
      * These options affect everything else and should be processed
@@ -4159,15 +4178,6 @@ void qemu_init(int argc, char **argv, char **envp)
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
@@ -4426,12 +4436,6 @@ void qemu_init(int argc, char **argv, char **envp)
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



