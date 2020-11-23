Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 635F82C0D2B
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 15:24:01 +0100 (CET)
Received: from localhost ([::1]:51032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khCl6-0006c4-Cw
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 09:24:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1khCcK-00034C-6v
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 09:14:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:49256)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1khCcH-0007np-Q6
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 09:14:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606140893;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YkhOTqnc6rSFYqPS+LH9lYeYVI5mFH1qJRbS/5hzVE0=;
 b=hRM8jYqMK8KfWtS2bqeXhubYC1FwudOinXN7ueiEo9k8vbIwA2T2dZx+hq5YMouOvucCBJ
 vcALee27zPJSLAWOOlYj4OBLOU+fgM7fOrPD8dFTbb61Mc3XI6rj9qHIUPmhg4mQJd52rj
 yoQnHEsxdgGDKDjYT6Bo7V5UHsLfWtE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-588-7C7yMod7NxqdXUr6xHhjjg-1; Mon, 23 Nov 2020 09:14:51 -0500
X-MC-Unique: 7C7yMod7NxqdXUr6xHhjjg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 77017804011
 for <qemu-devel@nongnu.org>; Mon, 23 Nov 2020 14:14:48 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3659B5D9E2;
 Mon, 23 Nov 2020 14:14:48 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 17/36] vl: separate qemu_create_late_backends
Date: Mon, 23 Nov 2020 09:14:16 -0500
Message-Id: <20201123141435.2726558-18-pbonzini@redhat.com>
In-Reply-To: <20201123141435.2726558-1-pbonzini@redhat.com>
References: <20201123141435.2726558-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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

"Late" backends are created after the machine.

Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 softmmu/vl.c | 64 ++++++++++++++++++++++++++--------------------------
 1 file changed, 32 insertions(+), 32 deletions(-)

diff --git a/softmmu/vl.c b/softmmu/vl.c
index 0a61df55b8..b2ec2ba8ef 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -2755,11 +2755,41 @@ static void qemu_create_early_backends(void)
  * The remainder of object creation happens after the
  * creation of chardev, fsdev, net clients and device data types.
  */
-static bool object_create_delayed(const char *type, QemuOpts *opts)
+static bool object_create_late(const char *type, QemuOpts *opts)
 {
     return !object_create_early(type, opts);
 }
 
+static void qemu_create_late_backends(void)
+{
+    if (qtest_chrdev) {
+        qtest_server_init(qtest_chrdev, qtest_log, &error_fatal);
+    }
+
+    net_init_clients(&error_fatal);
+
+    qemu_opts_foreach(qemu_find_opts("object"),
+                      user_creatable_add_opts_foreach,
+                      object_create_late, &error_fatal);
+
+    if (tpm_init() < 0) {
+        exit(1);
+    }
+
+    qemu_opts_foreach(qemu_find_opts("mon"),
+                      mon_init_func, NULL, &error_fatal);
+
+    if (foreach_device_config(DEV_SERIAL, serial_parse) < 0)
+        exit(1);
+    if (foreach_device_config(DEV_PARALLEL, parallel_parse) < 0)
+        exit(1);
+    if (foreach_device_config(DEV_DEBUGCON, debugcon_parse) < 0)
+        exit(1);
+
+    /* now chardevs have been created we may have semihosting to connect */
+    qemu_semihosting_connect_chardevs();
+    qemu_semihosting_console_init();
+}
 
 static bool set_memory_options(uint64_t *ram_slots, ram_addr_t *maxram_size,
                                MachineClass *mc)
@@ -3378,7 +3408,6 @@ void qemu_init(int argc, char **argv, char **envp)
     ram_addr_t maxram_size;
     uint64_t ram_slots = 0;
     FILE *vmstate_dump_file = NULL;
-    Error *err = NULL;
     bool have_custom_ram_size;
 
     qemu_add_opts(&qemu_drive_opts);
@@ -4393,10 +4422,6 @@ void qemu_init(int argc, char **argv, char **envp)
      */
     migration_object_init();
 
-    if (qtest_chrdev) {
-        qtest_server_init(qtest_chrdev, qtest_log, &error_fatal);
-    }
-
     opts = qemu_opts_find(qemu_find_opts("boot-opts"), NULL);
     if (opts) {
         boot_order = qemu_opt_get(opts, "order");
@@ -4417,32 +4442,7 @@ void qemu_init(int argc, char **argv, char **envp)
         boot_order = machine_class->default_boot_order;
     }
 
-    if (net_init_clients(&err) < 0) {
-        error_report_err(err);
-        exit(1);
-    }
-
-    qemu_opts_foreach(qemu_find_opts("object"),
-                      user_creatable_add_opts_foreach,
-                      object_create_delayed, &error_fatal);
-
-    if (tpm_init() < 0) {
-        exit(1);
-    }
-
-    qemu_opts_foreach(qemu_find_opts("mon"),
-                      mon_init_func, NULL, &error_fatal);
-
-    if (foreach_device_config(DEV_SERIAL, serial_parse) < 0)
-        exit(1);
-    if (foreach_device_config(DEV_PARALLEL, parallel_parse) < 0)
-        exit(1);
-    if (foreach_device_config(DEV_DEBUGCON, debugcon_parse) < 0)
-        exit(1);
-
-    /* now chardevs have been created we may have semihosting to connect */
-    qemu_semihosting_connect_chardevs();
-    qemu_semihosting_console_init();
+    qemu_create_late_backends();
 
     current_machine->boot_order = boot_order;
 
-- 
2.26.2



