Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40D202CB7BB
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 09:52:29 +0100 (CET)
Received: from localhost ([::1]:47270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkNsC-00042Z-8R
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 03:52:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kkNDE-0003cg-LT
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 03:10:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59550)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kkNCW-0003ng-Fp
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 03:10:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606896562;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jRh0lPFjxnHpgU8ABm16exNUk8vxMf4S2bG9go1SF68=;
 b=GrkqiCYH2Tar+q1StWbKwyyLSaZOTib+wK6oiXYze0SDmATktpHqinxnjPfJ7EdJPPd+ry
 JE+6fOsheSnd1QDNK2gcLYck2EJaR7V8dWNxdM4BrrKJDQd3IC/a1IBTZw/9fkbkUV/14c
 jnw0Mzt0UkCULU/MupFyfnOW+fjiT3k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-539-NQmvsr3cPOi1Ca1Mu5A_1A-1; Wed, 02 Dec 2020 03:09:20 -0500
X-MC-Unique: NQmvsr3cPOi1Ca1Mu5A_1A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E9DCA8558EF
 for <qemu-devel@nongnu.org>; Wed,  2 Dec 2020 08:09:19 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B505B60854
 for <qemu-devel@nongnu.org>; Wed,  2 Dec 2020 08:09:19 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 080/113] vl: clean up -boot variables
Date: Wed,  2 Dec 2020 03:08:16 -0500
Message-Id: <20201202080849.4125477-81-pbonzini@redhat.com>
In-Reply-To: <20201202080849.4125477-1-pbonzini@redhat.com>
References: <20201202080849.4125477-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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

Move more of them into MachineState, in preparation for moving initialization
of the machine out of vl.c.

Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 include/hw/boards.h |  1 +
 softmmu/vl.c        | 12 ++++++------
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/include/hw/boards.h b/include/hw/boards.h
index 4537cfb5c6..b9233af54a 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -283,6 +283,7 @@ struct MachineState {
     ram_addr_t maxram_size;
     uint64_t   ram_slots;
     const char *boot_order;
+    const char *boot_once;
     char *kernel_filename;
     char *kernel_cmdline;
     char *initrd_filename;
diff --git a/softmmu/vl.c b/softmmu/vl.c
index 43a0a45b68..77ee044c42 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -130,8 +130,6 @@ typedef QSIMPLEQ_HEAD(, BlockdevOptionsQueueEntry) BlockdevOptionsQueue;
 
 static const char *cpu_option;
 static const char *mem_path;
-static const char *boot_order;
-static const char *boot_once;
 static const char *incoming;
 static const char *loadvm;
 static ram_addr_t maxram_size;
@@ -2472,6 +2470,8 @@ static void qemu_apply_machine_options(void)
 {
     MachineClass *machine_class = MACHINE_GET_CLASS(current_machine);
     QemuOpts *machine_opts = qemu_get_machine_opts();
+    const char *boot_order = NULL;
+    const char *boot_once = NULL;
     QemuOpts *opts;
 
     qemu_opt_foreach(machine_opts, machine_set_property, current_machine,
@@ -2501,6 +2501,7 @@ static void qemu_apply_machine_options(void)
     }
 
     current_machine->boot_order = boot_order;
+    current_machine->boot_once = boot_once;
 
     if (semihosting_enabled() && !semihosting_get_argc()) {
         const char *kernel_filename = qemu_opt_get(machine_opts, "kernel");
@@ -2508,7 +2509,6 @@ static void qemu_apply_machine_options(void)
         /* fall back to the -kernel/-append */
         semihosting_arg_fallback(kernel_filename, kernel_cmdline);
     }
-
 }
 
 static void qemu_create_early_backends(void)
@@ -3220,9 +3220,9 @@ static void qemu_machine_creation_done(void)
 
     qdev_prop_check_globals();
 
-    if (boot_once) {
-        qemu_boot_set(boot_once, &error_fatal);
-        qemu_register_reset(restore_boot_order, g_strdup(boot_order));
+    if (current_machine->boot_once) {
+        qemu_boot_set(current_machine->boot_once, &error_fatal);
+        qemu_register_reset(restore_boot_order, g_strdup(current_machine->boot_order));
     }
 
     if (foreach_device_config(DEV_GDB, gdbserver_start) < 0) {
-- 
2.26.2



