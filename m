Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7F452CB7A5
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 09:49:44 +0100 (CET)
Received: from localhost ([::1]:38880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkNpX-0000Uu-Su
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 03:49:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kkNCg-0003Hg-Hi
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 03:09:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:22915)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kkNCK-0003jC-UV
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 03:09:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606896552;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=O5P1C07imouEoYMx9sOMbnDgvjykRU4zlLCfdwh1mSY=;
 b=a1qy7+GxW7p+9KzKIuUDUPeR0XEO45hteaVqP3c6L1J78W+idNFlm3pALu/PREUy5hjIQP
 cVuW6sP6Goebbx4VsBrVMw0+W6acJYlo3fQKCLmpmkPb8QqiXarYiqIoPNa+/4CszMCOfY
 B1G8EzvGJ9VdOnk6J1IgOu3jC0TePSE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-20--k2zEYWkOLyKwXfm6bcKWQ-1; Wed, 02 Dec 2020 03:09:10 -0500
X-MC-Unique: -k2zEYWkOLyKwXfm6bcKWQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5C1FB8558EF
 for <qemu-devel@nongnu.org>; Wed,  2 Dec 2020 08:09:09 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 283465D705
 for <qemu-devel@nongnu.org>; Wed,  2 Dec 2020 08:09:09 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 052/113] vl: extract validation of -smp to machine.c
Date: Wed,  2 Dec 2020 03:07:48 -0500
Message-Id: <20201202080849.4125477-53-pbonzini@redhat.com>
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

Once smp_parse is done, the validation operates on the MachineState.
There is no reason for that code to be in vl.c.

Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Tested-by: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/core/machine.c   | 23 +++++++++++++++++++++++
 include/hw/boards.h |  1 +
 softmmu/vl.c        | 20 ++------------------
 3 files changed, 26 insertions(+), 18 deletions(-)

diff --git a/hw/core/machine.c b/hw/core/machine.c
index d0408049b5..cd298fac13 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -1074,6 +1074,29 @@ MemoryRegion *machine_consume_memdev(MachineState *machine,
     return ret;
 }
 
+bool machine_smp_parse(MachineState *ms, QemuOpts *opts, Error **errp)
+{
+    MachineClass *mc = MACHINE_GET_CLASS(ms);
+
+    mc->smp_parse(ms, opts);
+
+    /* sanity-check smp_cpus and max_cpus against mc */
+    if (ms->smp.cpus < mc->min_cpus) {
+        error_setg(errp, "Invalid SMP CPUs %d. The min CPUs "
+                   "supported by machine '%s' is %d",
+                   ms->smp.cpus,
+                   mc->name, mc->min_cpus);
+        return false;
+    } else if (ms->smp.max_cpus > mc->max_cpus) {
+        error_setg(errp, "Invalid SMP CPUs %d. The max CPUs "
+                   "supported by machine '%s' is %d",
+                   current_machine->smp.max_cpus,
+                   mc->name, mc->max_cpus);
+        return false;
+    }
+    return true;
+}
+
 void machine_run_board_init(MachineState *machine)
 {
     MachineClass *machine_class = MACHINE_GET_CLASS(machine);
diff --git a/include/hw/boards.h b/include/hw/boards.h
index a49e3a6b44..4537cfb5c6 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -26,6 +26,7 @@ OBJECT_DECLARE_TYPE(MachineState, MachineClass, MACHINE)
 extern MachineState *current_machine;
 
 void machine_run_board_init(MachineState *machine);
+bool machine_smp_parse(MachineState *ms, QemuOpts *opts, Error **errp);
 bool machine_usb(MachineState *machine);
 int machine_phandle_start(MachineState *machine);
 bool machine_dump_guest_core(MachineState *machine);
diff --git a/softmmu/vl.c b/softmmu/vl.c
index 3819a4abf2..69d54b27b9 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -3976,24 +3976,8 @@ void qemu_init(int argc, char **argv, char **envp)
         exit(0);
     }
 
-    machine_class->smp_parse(current_machine,
-        qemu_opts_find(qemu_find_opts("smp-opts"), NULL));
-
-    /* sanity-check smp_cpus and max_cpus against machine_class */
-    if (current_machine->smp.cpus < machine_class->min_cpus) {
-        error_report("Invalid SMP CPUs %d. The min CPUs "
-                     "supported by machine '%s' is %d",
-                     current_machine->smp.cpus,
-                     machine_class->name, machine_class->min_cpus);
-        exit(1);
-    }
-    if (current_machine->smp.max_cpus > machine_class->max_cpus) {
-        error_report("Invalid SMP CPUs %d. The max CPUs "
-                     "supported by machine '%s' is %d",
-                     current_machine->smp.max_cpus,
-                     machine_class->name, machine_class->max_cpus);
-        exit(1);
-    }
+    machine_smp_parse(current_machine,
+        qemu_opts_find(qemu_find_opts("smp-opts"), NULL), &error_fatal);
 
     if (mem_prealloc) {
         char *val;
-- 
2.26.2



