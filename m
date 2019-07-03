Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7F1F5EE3C
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Jul 2019 23:22:04 +0200 (CEST)
Received: from localhost ([::1]:40740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1himhY-00084O-0d
	for lists+qemu-devel@lfdr.de; Wed, 03 Jul 2019 17:22:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37993)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <ehabkost@redhat.com>) id 1himUr-00065b-Mp
 for qemu-devel@nongnu.org; Wed, 03 Jul 2019 17:09:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <ehabkost@redhat.com>) id 1himUq-0006ks-DR
 for qemu-devel@nongnu.org; Wed, 03 Jul 2019 17:08:57 -0400
Received: from mx1.redhat.com ([209.132.183.28]:47140)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <ehabkost@redhat.com>) id 1himUq-0006kT-5M
 for qemu-devel@nongnu.org; Wed, 03 Jul 2019 17:08:56 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 67C9B4DB10;
 Wed,  3 Jul 2019 21:08:55 +0000 (UTC)
Received: from localhost (ovpn-116-30.gru2.redhat.com [10.97.116.30])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E954810018F9;
 Wed,  3 Jul 2019 21:08:54 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <rth@twiddle.net>
Date: Wed,  3 Jul 2019 18:07:48 -0300
Message-Id: <20190703210821.27550-11-ehabkost@redhat.com>
In-Reply-To: <20190703210821.27550-1-ehabkost@redhat.com>
References: <20190703210821.27550-1-ehabkost@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.29]); Wed, 03 Jul 2019 21:08:55 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL v5 10/43] vl.c: Replace smp global variables
 with smp machine properties
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
Cc: Like Xu <like.xu@linux.intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Like Xu <like.xu@linux.intel.com>

The global smp variables in vl.c are completely replaced with machine properties.

Form this commit, the smp_cpus/smp_cores/smp_threads/max_cpus are deprecated
and only machine properties within MachineState are fully applied and enabled.

Signed-off-by: Like Xu <like.xu@linux.intel.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20190518205428.90532-11-like.xu@linux.intel.com>
Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 vl.c | 53 ++++++++++++++++++++++++++---------------------------
 1 file changed, 26 insertions(+), 27 deletions(-)

diff --git a/vl.c b/vl.c
index d657faec03..56aa221385 100644
--- a/vl.c
+++ b/vl.c
@@ -163,10 +163,6 @@ static Chardev **serial_hds;
 Chardev *parallel_hds[MAX_PARALLEL_PORTS];
 int win2k_install_hack = 0;
 int singlestep = 0;
-int smp_cpus;
-unsigned int max_cpus;
-int smp_cores = 1;
-int smp_threads = 1;
 int acpi_enabled = 1;
 int no_hpet = 0;
 int fd_bootchk = 1;
@@ -1265,8 +1261,9 @@ static void smp_parse(QemuOpts *opts)
                 sockets = sockets > 0 ? sockets : 1;
                 cpus = cores * threads * sockets;
             } else {
-                max_cpus = qemu_opt_get_number(opts, "maxcpus", cpus);
-                sockets = max_cpus / (cores * threads);
+                current_machine->smp.max_cpus =
+                        qemu_opt_get_number(opts, "maxcpus", cpus);
+                sockets = current_machine->smp.max_cpus / (cores * threads);
             }
         } else if (cores == 0) {
             threads = threads > 0 ? threads : 1;
@@ -1283,34 +1280,37 @@ static void smp_parse(QemuOpts *opts)
             exit(1);
         }
 
-        max_cpus = qemu_opt_get_number(opts, "maxcpus", cpus);
+        current_machine->smp.max_cpus =
+                qemu_opt_get_number(opts, "maxcpus", cpus);
 
-        if (max_cpus < cpus) {
+        if (current_machine->smp.max_cpus < cpus) {
             error_report("maxcpus must be equal to or greater than smp");
             exit(1);
         }
 
-        if (sockets * cores * threads > max_cpus) {
+        if (sockets * cores * threads > current_machine->smp.max_cpus) {
             error_report("cpu topology: "
                          "sockets (%u) * cores (%u) * threads (%u) > "
                          "maxcpus (%u)",
-                         sockets, cores, threads, max_cpus);
+                         sockets, cores, threads,
+                         current_machine->smp.max_cpus);
             exit(1);
         }
 
-        if (sockets * cores * threads != max_cpus) {
+        if (sockets * cores * threads != current_machine->smp.max_cpus) {
             warn_report("Invalid CPU topology deprecated: "
                         "sockets (%u) * cores (%u) * threads (%u) "
                         "!= maxcpus (%u)",
-                        sockets, cores, threads, max_cpus);
+                        sockets, cores, threads,
+                        current_machine->smp.max_cpus);
         }
 
-        smp_cpus = cpus;
-        smp_cores = cores;
-        smp_threads = threads;
+        current_machine->smp.cpus = cpus;
+        current_machine->smp.cores = cores;
+        current_machine->smp.threads = threads;
     }
 
-    if (smp_cpus > 1) {
+    if (current_machine->smp.cpus > 1) {
         Error *blocker = NULL;
         error_setg(&blocker, QERR_REPLAY_NOT_SUPPORTED, "smp");
         replay_add_blocker(blocker);
@@ -4009,26 +4009,25 @@ int main(int argc, char **argv, char **envp)
     machine_class->default_cpus = machine_class->default_cpus ?: 1;
 
     /* default to machine_class->default_cpus */
-    smp_cpus = machine_class->default_cpus;
-    max_cpus = machine_class->default_cpus;
+    current_machine->smp.cpus = machine_class->default_cpus;
+    current_machine->smp.max_cpus = machine_class->default_cpus;
+    current_machine->smp.cores = 1;
+    current_machine->smp.threads = 1;
 
     smp_parse(qemu_opts_find(qemu_find_opts("smp-opts"), NULL));
 
-    current_machine->smp.cpus = smp_cpus;
-    current_machine->smp.max_cpus = max_cpus;
-    current_machine->smp.cores = smp_cores;
-    current_machine->smp.threads = smp_threads;
-
     /* sanity-check smp_cpus and max_cpus against machine_class */
-    if (smp_cpus < machine_class->min_cpus) {
+    if (current_machine->smp.cpus < machine_class->min_cpus) {
         error_report("Invalid SMP CPUs %d. The min CPUs "
-                     "supported by machine '%s' is %d", smp_cpus,
+                     "supported by machine '%s' is %d",
+                     current_machine->smp.cpus,
                      machine_class->name, machine_class->min_cpus);
         exit(1);
     }
-    if (max_cpus > machine_class->max_cpus) {
+    if (current_machine->smp.max_cpus > machine_class->max_cpus) {
         error_report("Invalid SMP CPUs %d. The max CPUs "
-                     "supported by machine '%s' is %d", max_cpus,
+                     "supported by machine '%s' is %d",
+                     current_machine->smp.max_cpus,
                      machine_class->name, machine_class->max_cpus);
         exit(1);
     }
-- 
2.18.0.rc1.1.g3f1ff2140


