Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 229E92CB81F
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 10:09:10 +0100 (CET)
Received: from localhost ([::1]:41006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkO8L-0000wM-3V
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 04:09:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kkND3-0003TC-KG
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 03:09:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34719)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kkNCR-0003ly-49
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 03:09:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606896558;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Y9qS1cxkyeyi3EauORRpX5WKTwXo+zi0c2sRfQek578=;
 b=XK6WPGB4xXwcNho426le5AHNDUdl4AFHa5t6IPQWeRhnEbpBPm6AHyL5B4rg5iwgJtgeqq
 z0hCdt9jwuInkQfVsRklN6vWm5csbl/NdeXGiRxv9OYB0OK9/xawJYJPz1mag0hhj2dWBR
 sX7PDvDJniu554hbGJVmqHsl6rg8fsw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-95-4lm-MdBmMpGGxWGPdarYWw-1; Wed, 02 Dec 2020 03:09:16 -0500
X-MC-Unique: 4lm-MdBmMpGGxWGPdarYWw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C0A261006C83
 for <qemu-devel@nongnu.org>; Wed,  2 Dec 2020 08:09:15 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 811F810016F6
 for <qemu-devel@nongnu.org>; Wed,  2 Dec 2020 08:09:15 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 069/113] vl: separate qemu_apply_machine_options
Date: Wed,  2 Dec 2020 03:08:05 -0500
Message-Id: <20201202080849.4125477-70-pbonzini@redhat.com>
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

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 softmmu/vl.c | 81 +++++++++++++++++++++++++++++-----------------------
 1 file changed, 45 insertions(+), 36 deletions(-)

diff --git a/softmmu/vl.c b/softmmu/vl.c
index 5af52454ee..acf09b2040 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -2704,6 +2704,49 @@ static bool object_create_early(const char *type, QemuOpts *opts)
     return true;
 }
 
+static void qemu_apply_machine_options(void)
+{
+    MachineClass *machine_class = MACHINE_GET_CLASS(current_machine);
+    QemuOpts *machine_opts = qemu_get_machine_opts();
+    QemuOpts *opts;
+
+    qemu_opt_foreach(machine_opts, machine_set_property, current_machine,
+                     &error_fatal);
+    current_machine->ram_size = ram_size;
+    current_machine->maxram_size = maxram_size;
+    current_machine->ram_slots = ram_slots;
+
+    opts = qemu_opts_find(qemu_find_opts("boot-opts"), NULL);
+    if (opts) {
+        boot_order = qemu_opt_get(opts, "order");
+        if (boot_order) {
+            validate_bootdevices(boot_order, &error_fatal);
+        }
+
+        boot_once = qemu_opt_get(opts, "once");
+        if (boot_once) {
+            validate_bootdevices(boot_once, &error_fatal);
+        }
+
+        boot_menu = qemu_opt_get_bool(opts, "menu", boot_menu);
+        boot_strict = qemu_opt_get_bool(opts, "strict", false);
+    }
+
+    if (!boot_order) {
+        boot_order = machine_class->default_boot_order;
+    }
+
+    current_machine->boot_order = boot_order;
+
+    if (semihosting_enabled() && !semihosting_get_argc()) {
+        const char *kernel_filename = qemu_opt_get(machine_opts, "kernel");
+        const char *kernel_cmdline = qemu_opt_get(machine_opts, "append") ?: "";
+        /* fall back to the -kernel/-append */
+        semihosting_arg_fallback(kernel_filename, kernel_cmdline);
+    }
+
+}
+
 static void qemu_create_early_backends(void)
 {
     MachineClass *machine_class = MACHINE_GET_CLASS(current_machine);
@@ -3448,7 +3491,7 @@ static void qemu_machine_creation_done(void)
 
 void qemu_init(int argc, char **argv, char **envp)
 {
-    QemuOpts *opts, *machine_opts;
+    QemuOpts *opts;
     QemuOpts *icount_opts = NULL, *accel_opts = NULL;
     QemuOptsList *olist;
     int optind;
@@ -4387,12 +4430,7 @@ void qemu_init(int argc, char **argv, char **envp)
     qemu_create_default_devices();
     qemu_create_early_backends();
 
-    machine_opts = qemu_get_machine_opts();
-    qemu_opt_foreach(machine_opts, machine_set_property, current_machine,
-                     &error_fatal);
-    current_machine->ram_size = ram_size;
-    current_machine->maxram_size = maxram_size;
-    current_machine->ram_slots = ram_slots;
+    qemu_apply_machine_options();
 
     /*
      * Note: uses machine properties such as kernel-irqchip, must run
@@ -4428,37 +4466,8 @@ void qemu_init(int argc, char **argv, char **envp)
      */
     migration_object_init();
 
-    opts = qemu_opts_find(qemu_find_opts("boot-opts"), NULL);
-    if (opts) {
-        boot_order = qemu_opt_get(opts, "order");
-        if (boot_order) {
-            validate_bootdevices(boot_order, &error_fatal);
-        }
-
-        boot_once = qemu_opt_get(opts, "once");
-        if (boot_once) {
-            validate_bootdevices(boot_once, &error_fatal);
-        }
-
-        boot_menu = qemu_opt_get_bool(opts, "menu", boot_menu);
-        boot_strict = qemu_opt_get_bool(opts, "strict", false);
-    }
-
-    if (!boot_order) {
-        boot_order = machine_class->default_boot_order;
-    }
-
-    if (semihosting_enabled() && !semihosting_get_argc()) {
-        const char *kernel_filename = qemu_opt_get(machine_opts, "kernel");
-        const char *kernel_cmdline = qemu_opt_get(machine_opts, "append");
-        /* fall back to the -kernel/-append */
-        semihosting_arg_fallback(kernel_filename, kernel_cmdline);
-    }
-
     qemu_create_late_backends();
 
-    current_machine->boot_order = boot_order;
-
     /* parse features once if machine provides default cpu_type */
     current_machine->cpu_type = machine_class->default_cpu_type;
     if (cpu_option) {
-- 
2.26.2



