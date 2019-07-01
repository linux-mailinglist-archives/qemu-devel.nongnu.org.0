Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 793064200A
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jun 2019 10:56:08 +0200 (CEST)
Received: from localhost ([::1]:57682 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1haz39-0003oI-LA
	for lists+qemu-devel@lfdr.de; Wed, 12 Jun 2019 04:56:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57751)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <like.xu@linux.intel.com>) id 1hayro-00038U-1i
 for qemu-devel@nongnu.org; Wed, 12 Jun 2019 04:44:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <like.xu@linux.intel.com>) id 1hayri-0006Dy-IR
 for qemu-devel@nongnu.org; Wed, 12 Jun 2019 04:44:23 -0400
Received: from mga09.intel.com ([134.134.136.24]:33312)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <like.xu@linux.intel.com>)
 id 1hayr5-00061H-KN
 for qemu-devel@nongnu.org; Wed, 12 Jun 2019 04:44:18 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 12 Jun 2019 01:43:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,363,1557212400"; d="scan'208";a="184175095"
Received: from likexu-e5-2699-v4.sh.intel.com ([10.239.48.178])
 by fmsmga002.fm.intel.com with ESMTP; 12 Jun 2019 01:43:35 -0700
From: Like Xu <like.xu@linux.intel.com>
To: qemu-devel@nongnu.org,
	Eduardo Habkost <ehabkost@redhat.com>
Date: Wed, 12 Jun 2019 16:41:04 +0800
Message-Id: <20190612084104.34984-10-like.xu@linux.intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190612084104.34984-1-like.xu@linux.intel.com>
References: <20190612084104.34984-1-like.xu@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 134.134.136.24
Subject: [Qemu-devel]  [PATCH v3 9/9] vl.c: Add -smp,
 dies=* command line support and update doc
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, like.xu@linux.intel.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For PC target, users could configure the number of dies per one package
via command line with this patch, such as "-smp dies=2,cores=4".

The parsing rules of new cpu-topology model obey the same restrictions/logic
as the legacy socket/core/thread model especially on missing values computing.

Signed-off-by: Like Xu <like.xu@linux.intel.com>
---
 hw/i386/pc.c    | 32 ++++++++++++++++++--------------
 qemu-options.hx | 17 +++++++++--------
 vl.c            |  3 +++
 3 files changed, 30 insertions(+), 22 deletions(-)

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 63b44bd2bd..8a5da4f0c1 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -1543,10 +1543,13 @@ static void pc_new_cpu(PCMachineState *pcms, int64_t apic_id, Error **errp)
 
 void pc_smp_parse(MachineState *ms, QemuOpts *opts)
 {
-    /* copy it from legacy smp_parse() in vl.c */
+    PCMachineState *pcms = (PCMachineState *)
+        object_dynamic_cast(OBJECT(ms), TYPE_PC_MACHINE);
+
     if (opts) {
         unsigned cpus    = qemu_opt_get_number(opts, "cpus", 0);
         unsigned sockets = qemu_opt_get_number(opts, "sockets", 0);
+        unsigned dies = qemu_opt_get_number(opts, "dies", 1);
         unsigned cores   = qemu_opt_get_number(opts, "cores", 0);
         unsigned threads = qemu_opt_get_number(opts, "threads", 0);
 
@@ -1556,24 +1559,24 @@ void pc_smp_parse(MachineState *ms, QemuOpts *opts)
             threads = threads > 0 ? threads : 1;
             if (cpus == 0) {
                 sockets = sockets > 0 ? sockets : 1;
-                cpus = cores * threads * sockets;
+                cpus = cores * threads * dies * sockets;
             } else {
                 ms->smp.max_cpus =
                         qemu_opt_get_number(opts, "maxcpus", cpus);
-                sockets = ms->smp.max_cpus / (cores * threads);
+                sockets = ms->smp.max_cpus / (cores * threads * dies);
             }
         } else if (cores == 0) {
             threads = threads > 0 ? threads : 1;
-            cores = cpus / (sockets * threads);
+            cores = cpus / (sockets * dies * threads);
             cores = cores > 0 ? cores : 1;
         } else if (threads == 0) {
-            threads = cpus / (cores * sockets);
+            threads = cpus / (cores * dies * sockets);
             threads = threads > 0 ? threads : 1;
-        } else if (sockets * cores * threads < cpus) {
+        } else if (sockets * dies * cores * threads < cpus) {
             error_report("cpu topology: "
-                         "sockets (%u) * cores (%u) * threads (%u) < "
+                         "sockets (%u) * dies (%u) * cores (%u) * threads (%u) < "
                          "smp_cpus (%u)",
-                         sockets, cores, threads, cpus);
+                         sockets, dies, cores, threads, cpus);
             exit(1);
         }
 
@@ -1585,26 +1588,27 @@ void pc_smp_parse(MachineState *ms, QemuOpts *opts)
             exit(1);
         }
 
-        if (sockets * cores * threads > ms->smp.max_cpus) {
+        if (sockets * dies * cores * threads > ms->smp.max_cpus) {
             error_report("cpu topology: "
-                         "sockets (%u) * cores (%u) * threads (%u) > "
+                         "sockets (%u) * dies (%u) * cores (%u) * threads (%u) > "
                          "maxcpus (%u)",
-                         sockets, cores, threads,
+                         sockets, dies, cores, threads,
                          ms->smp.max_cpus);
             exit(1);
         }
 
-        if (sockets * cores * threads != ms->smp.max_cpus) {
+        if (sockets * dies * cores * threads != ms->smp.max_cpus) {
             warn_report("Invalid CPU topology deprecated: "
-                        "sockets (%u) * cores (%u) * threads (%u) "
+                        "sockets (%u) * dies (%u) * cores (%u) * threads (%u) "
                         "!= maxcpus (%u)",
-                        sockets, cores, threads,
+                        sockets, dies, cores, threads,
                         ms->smp.max_cpus);
         }
 
         ms->smp.cpus = cpus;
         ms->smp.cores = cores;
         ms->smp.threads = threads;
+        pcms->smp_dies = dies;
     }
 
     if (ms->smp.cpus > 1) {
diff --git a/qemu-options.hx b/qemu-options.hx
index 0d8beb4afd..a5b314a448 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -138,25 +138,26 @@ no incompatible TCG features have been enabled (e.g. icount/replay).
 ETEXI
 
 DEF("smp", HAS_ARG, QEMU_OPTION_smp,
-    "-smp [cpus=]n[,maxcpus=cpus][,cores=cores][,threads=threads][,sockets=sockets]\n"
+    "-smp [cpus=]n[,maxcpus=cpus][,cores=cores][,threads=threads][,dies=dies][,sockets=sockets]\n"
     "                set the number of CPUs to 'n' [default=1]\n"
     "                maxcpus= maximum number of total cpus, including\n"
     "                offline CPUs for hotplug, etc\n"
-    "                cores= number of CPU cores on one socket\n"
+    "                cores= number of CPU cores on one socket (for PC, it's on one die)\n"
     "                threads= number of threads on one CPU core\n"
+    "                dies= number of CPU dies on one socket (for PC only)\n"
     "                sockets= number of discrete sockets in the system\n",
         QEMU_ARCH_ALL)
 STEXI
-@item -smp [cpus=]@var{n}[,cores=@var{cores}][,threads=@var{threads}][,sockets=@var{sockets}][,maxcpus=@var{maxcpus}]
+@item -smp [cpus=]@var{n}[,cores=@var{cores}][,threads=@var{threads}][,dies=dies][,sockets=@var{sockets}][,maxcpus=@var{maxcpus}]
 @findex -smp
 Simulate an SMP system with @var{n} CPUs. On the PC target, up to 255
 CPUs are supported. On Sparc32 target, Linux limits the number of usable CPUs
 to 4.
-For the PC target, the number of @var{cores} per socket, the number
-of @var{threads} per cores and the total number of @var{sockets} can be
-specified. Missing values will be computed. If any on the three values is
-given, the total number of CPUs @var{n} can be omitted. @var{maxcpus}
-specifies the maximum number of hotpluggable CPUs.
+For the PC target, the number of @var{cores} per die, the number of @var{threads}
+per cores, the number of @var{dies} per packages and the total number of
+@var{sockets} can be specified. Missing values will be computed.
+If any on the three values is given, the total number of CPUs @var{n} can be omitted.
+@var{maxcpus} specifies the maximum number of hotpluggable CPUs.
 ETEXI
 
 DEF("numa", HAS_ARG, QEMU_OPTION_numa,
diff --git a/vl.c b/vl.c
index 53ea9b6d6f..c6d1339442 100644
--- a/vl.c
+++ b/vl.c
@@ -1231,6 +1231,9 @@ static QemuOptsList qemu_smp_opts = {
         }, {
             .name = "sockets",
             .type = QEMU_OPT_NUMBER,
+        }, {
+            .name = "dies",
+            .type = QEMU_OPT_NUMBER,
         }, {
             .name = "cores",
             .type = QEMU_OPT_NUMBER,
-- 
2.21.0


