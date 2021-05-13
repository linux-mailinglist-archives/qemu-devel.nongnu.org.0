Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0B5E37FBB5
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 18:42:32 +0200 (CEST)
Received: from localhost ([::1]:47662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhEPu-0004CY-UW
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 12:42:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lhEDJ-0002Ww-4b
 for qemu-devel@nongnu.org; Thu, 13 May 2021 12:29:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39647)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lhED6-0003UK-9o
 for qemu-devel@nongnu.org; Thu, 13 May 2021 12:29:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620923355;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MaLIKqwKJBJhKNVErx6Hfd59liy+eolRDjzMv+cEjwc=;
 b=KTDY9i/CD7af4pMLn+0bGYvPCNOx/bbqsJmXbd4vxau9gvxcvsoOUBxBA1KpY+ocQsC+Gj
 utIEE7pE6/GUhysZj82QOX1YYkrVmoKKMHQVS7DiTYeE/fdPDlbR5Oq86gzOLMmugHnRNo
 y3GngMnj5Wpi544QvgPDp0br6ucLxdY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-146-9MwOsTc0PrC7Aj4TprEn5Q-1; Thu, 13 May 2021 12:29:13 -0400
X-MC-Unique: 9MwOsTc0PrC7Aj4TprEn5Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BFA731922038;
 Thu, 13 May 2021 16:29:12 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 52808BA6F;
 Thu, 13 May 2021 16:29:12 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 11/14] machine: add error propagation to mc->smp_parse
Date: Thu, 13 May 2021 12:28:58 -0400
Message-Id: <20210513162901.1310239-12-pbonzini@redhat.com>
In-Reply-To: <20210513162901.1310239-1-pbonzini@redhat.com>
References: <20210513162901.1310239-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: yang.zhong@intel.com, berrange@redhat.com, ehabkost@redhat.com,
 armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Clean up the smp_parse functions to use Error** instead of exiting.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/core/machine.c    | 34 +++++++++++++++++++---------------
 hw/i386/pc.c         | 28 ++++++++++++++--------------
 include/hw/boards.h  |  2 +-
 include/hw/i386/pc.h |  2 --
 4 files changed, 34 insertions(+), 32 deletions(-)

diff --git a/hw/core/machine.c b/hw/core/machine.c
index 7e57c287b0..70c297a7de 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -738,7 +738,7 @@ void machine_set_cpu_numa_node(MachineState *machine,
     }
 }
 
-static void smp_parse(MachineState *ms, QemuOpts *opts)
+static void smp_parse(MachineState *ms, QemuOpts *opts, Error **errp)
 {
     unsigned cpus    = qemu_opt_get_number(opts, "cpus", 0);
     unsigned sockets = qemu_opt_get_number(opts, "sockets", 0);
@@ -765,28 +765,28 @@ static void smp_parse(MachineState *ms, QemuOpts *opts)
         threads = cpus / (cores * sockets);
         threads = threads > 0 ? threads : 1;
     } else if (sockets * cores * threads < cpus) {
-        error_report("cpu topology: "
-                        "sockets (%u) * cores (%u) * threads (%u) < "
-                        "smp_cpus (%u)",
-                        sockets, cores, threads, cpus);
-        exit(1);
+        error_setg(errp, "cpu topology: "
+                   "sockets (%u) * cores (%u) * threads (%u) < "
+                   "smp_cpus (%u)",
+                   sockets, cores, threads, cpus);
+        return;
     }
 
     ms->smp.max_cpus =
             qemu_opt_get_number(opts, "maxcpus", cpus);
 
     if (ms->smp.max_cpus < cpus) {
-        error_report("maxcpus must be equal to or greater than smp");
-        exit(1);
+        error_setg(errp, "maxcpus must be equal to or greater than smp");
+        return;
     }
 
     if (sockets * cores * threads != ms->smp.max_cpus) {
-        error_report("Invalid CPU topology: "
-                        "sockets (%u) * cores (%u) * threads (%u) "
-                        "!= maxcpus (%u)",
-                        sockets, cores, threads,
-                        ms->smp.max_cpus);
-        exit(1);
+        error_setg(errp, "Invalid CPU topology: "
+                   "sockets (%u) * cores (%u) * threads (%u) "
+                   "!= maxcpus (%u)",
+                   sockets, cores, threads,
+                   ms->smp.max_cpus);
+        return;
     }
 
     ms->smp.cpus = cpus;
@@ -1125,9 +1125,13 @@ MemoryRegion *machine_consume_memdev(MachineState *machine,
 bool machine_smp_parse(MachineState *ms, QemuOpts *opts, Error **errp)
 {
     MachineClass *mc = MACHINE_GET_CLASS(ms);
+    ERRP_GUARD();
 
     if (opts) {
-        mc->smp_parse(ms, opts);
+        mc->smp_parse(ms, opts, errp);
+        if (*errp) {
+            return false;
+        }
     }
 
     /* sanity-check smp_cpus and max_cpus against mc */
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 2942ddf0f9..1760e94ff5 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -706,7 +706,7 @@ void pc_acpi_smi_interrupt(void *opaque, int irq, int level)
  * This function is very similar to smp_parse()
  * in hw/core/machine.c but includes CPU die support.
  */
-void pc_smp_parse(MachineState *ms, QemuOpts *opts)
+static void pc_smp_parse(MachineState *ms, QemuOpts *opts, Error **errp)
 {
     unsigned cpus    = qemu_opt_get_number(opts, "cpus", 0);
     unsigned sockets = qemu_opt_get_number(opts, "sockets", 0);
@@ -734,28 +734,28 @@ void pc_smp_parse(MachineState *ms, QemuOpts *opts)
         threads = cpus / (cores * dies * sockets);
         threads = threads > 0 ? threads : 1;
     } else if (sockets * dies * cores * threads < cpus) {
-        error_report("cpu topology: "
-                        "sockets (%u) * dies (%u) * cores (%u) * threads (%u) < "
-                        "smp_cpus (%u)",
-                        sockets, dies, cores, threads, cpus);
-        exit(1);
+        error_setg(errp, "cpu topology: "
+                   "sockets (%u) * dies (%u) * cores (%u) * threads (%u) < "
+                   "smp_cpus (%u)",
+                   sockets, dies, cores, threads, cpus);
+        return;
     }
 
     ms->smp.max_cpus =
             qemu_opt_get_number(opts, "maxcpus", cpus);
 
     if (ms->smp.max_cpus < cpus) {
-        error_report("maxcpus must be equal to or greater than smp");
-        exit(1);
+        error_setg(errp, "maxcpus must be equal to or greater than smp");
+        return;
     }
 
     if (sockets * dies * cores * threads != ms->smp.max_cpus) {
-        error_report("Invalid CPU topology deprecated: "
-                        "sockets (%u) * dies (%u) * cores (%u) * threads (%u) "
-                        "!= maxcpus (%u)",
-                        sockets, dies, cores, threads,
-                        ms->smp.max_cpus);
-        exit(1);
+        error_setg(errp, "Invalid CPU topology deprecated: "
+                   "sockets (%u) * dies (%u) * cores (%u) * threads (%u) "
+                   "!= maxcpus (%u)",
+                   sockets, dies, cores, threads,
+                   ms->smp.max_cpus);
+        return;
     }
 
     ms->smp.cpus = cpus;
diff --git a/include/hw/boards.h b/include/hw/boards.h
index 87ae5cc300..0483d6af86 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -210,7 +210,7 @@ struct MachineClass {
     void (*reset)(MachineState *state);
     void (*wakeup)(MachineState *state);
     int (*kvm_type)(MachineState *machine, const char *arg);
-    void (*smp_parse)(MachineState *ms, QemuOpts *opts);
+    void (*smp_parse)(MachineState *ms, QemuOpts *opts, Error **errp);
 
     BlockInterfaceType block_default_type;
     int units_per_default_bus;
diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
index 4c2ca6d36a..87294f2632 100644
--- a/include/hw/i386/pc.h
+++ b/include/hw/i386/pc.h
@@ -138,8 +138,6 @@ extern int fd_bootchk;
 
 void pc_acpi_smi_interrupt(void *opaque, int irq, int level);
 
-void pc_smp_parse(MachineState *ms, QemuOpts *opts);
-
 void pc_guest_info_init(PCMachineState *pcms);
 
 #define PCI_HOST_PROP_PCI_HOLE_START   "pci-hole-start"
-- 
2.26.2



