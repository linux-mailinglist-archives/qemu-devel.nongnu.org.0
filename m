Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 314472CB7EE
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 10:01:11 +0100 (CET)
Received: from localhost ([::1]:44846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkO0c-0006bj-79
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 04:01:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kkND1-0003T3-NO
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 03:09:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50195)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kkNCQ-0003lk-Sc
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 03:09:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606896557;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I/Zz9ixS9AU27fXqk7P4iB9oaNHfWk0Up7i6tGttSOc=;
 b=g67dVZ/tL7/kqWenhm9GoBAd3MTUUIAiUCIUXVXkSgEsCGBUV2xV4g9kM+SXJN1mnDUiMt
 0ptDp36124FudBjq2DSv3aEQkMshf4W6O5ZFKzTc7Qd2d6wcojC9QeL17nSfOBnMF1hVf8
 OQo/4WhhCUad7yiKgaKvrZn0+enSt7g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-557-AVHI8vb7M7-mnmbX8hTPgw-1; Wed, 02 Dec 2020 03:09:15 -0500
X-MC-Unique: AVHI8vb7M7-mnmbX8hTPgw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 036755708B
 for <qemu-devel@nongnu.org>; Wed,  2 Dec 2020 08:09:15 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BB42B10013BD
 for <qemu-devel@nongnu.org>; Wed,  2 Dec 2020 08:09:14 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 067/113] vl: separate qemu_create_late_backends
Date: Wed,  2 Dec 2020 03:08:03 -0500
Message-Id: <20201202080849.4125477-68-pbonzini@redhat.com>
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

"Late" backends are created after the machine.

Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 softmmu/vl.c | 64 ++++++++++++++++++++++++++--------------------------
 1 file changed, 32 insertions(+), 32 deletions(-)

diff --git a/softmmu/vl.c b/softmmu/vl.c
index aafcbec356..d9fe9f63c0 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -2759,11 +2759,41 @@ static void qemu_create_early_backends(void)
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
@@ -3377,7 +3407,6 @@ void qemu_init(int argc, char **argv, char **envp)
     ram_addr_t maxram_size;
     uint64_t ram_slots = 0;
     FILE *vmstate_dump_file = NULL;
-    Error *err = NULL;
     bool have_custom_ram_size;
 
     qemu_add_opts(&qemu_drive_opts);
@@ -4392,10 +4421,6 @@ void qemu_init(int argc, char **argv, char **envp)
      */
     migration_object_init();
 
-    if (qtest_chrdev) {
-        qtest_server_init(qtest_chrdev, qtest_log, &error_fatal);
-    }
-
     opts = qemu_opts_find(qemu_find_opts("boot-opts"), NULL);
     if (opts) {
         boot_order = qemu_opt_get(opts, "order");
@@ -4423,32 +4448,7 @@ void qemu_init(int argc, char **argv, char **envp)
         semihosting_arg_fallback(kernel_filename, kernel_cmdline);
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



