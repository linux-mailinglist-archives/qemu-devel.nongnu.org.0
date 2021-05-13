Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A324937FBCF
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 18:53:13 +0200 (CEST)
Received: from localhost ([::1]:38642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhEaG-0000p0-H9
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 12:53:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lhEDH-0002Sf-Cn
 for qemu-devel@nongnu.org; Thu, 13 May 2021 12:29:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41360)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lhED7-0003Uj-Tx
 for qemu-devel@nongnu.org; Thu, 13 May 2021 12:29:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620923356;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZNccPugVjVOzLgx/53bLQVRPvqP22s7Wh4n+2tEnJ24=;
 b=MqEyTDJ26/dSTTY1hrqmV0ZluOA8LbzwLcV3aGwnyQK9J5eE5r7DQnd+m2ri/sXDj8rG7P
 rNnm29TQGtMQDJQ1VBiuCBQKhD6nXyOWZJTNywg/foX0rloXS3d9eCIVczSo5/vhbMlt4g
 Ws9dzpXF9ytJaN9z+vMXeB/hTYLm1hQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-428-5lIRRvqcNcioxs1OhTbeAg-1; Thu, 13 May 2021 12:29:14 -0400
X-MC-Unique: 5lIRRvqcNcioxs1OhTbeAg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 53AC88005AD;
 Thu, 13 May 2021 16:29:13 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D9F14BA6F;
 Thu, 13 May 2021 16:29:12 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 12/14] machine: pass QAPI struct to mc->smp_parse
Date: Thu, 13 May 2021 12:28:59 -0400
Message-Id: <20210513162901.1310239-13-pbonzini@redhat.com>
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

As part of converting -smp to a property with a QAPI type, define
the struct and use it to do the actual parsing.  machine_smp_parse
takes care of doing the QemuOpts->QAPI conversion by hand, for now.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/core/machine.c   | 33 +++++++++++++++++++++++----------
 hw/i386/pc.c        | 18 ++++++++----------
 include/hw/boards.h |  2 +-
 qapi/machine.json   | 27 +++++++++++++++++++++++++++
 4 files changed, 59 insertions(+), 21 deletions(-)

diff --git a/hw/core/machine.c b/hw/core/machine.c
index 70c297a7de..7daca0b86a 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -738,12 +738,12 @@ void machine_set_cpu_numa_node(MachineState *machine,
     }
 }
 
-static void smp_parse(MachineState *ms, QemuOpts *opts, Error **errp)
+static void smp_parse(MachineState *ms, SMPConfiguration *config, Error **errp)
 {
-    unsigned cpus    = qemu_opt_get_number(opts, "cpus", 0);
-    unsigned sockets = qemu_opt_get_number(opts, "sockets", 0);
-    unsigned cores   = qemu_opt_get_number(opts, "cores", 0);
-    unsigned threads = qemu_opt_get_number(opts, "threads", 0);
+    unsigned cpus    = config->has_cpus ? config->cpus : 0;
+    unsigned sockets = config->has_sockets ? config->sockets : 0;
+    unsigned cores   = config->has_cores ? config->cores : 0;
+    unsigned threads = config->has_threads ? config->threads : 0;
 
     /* compute missing values, prefer sockets over cores over threads */
     if (cpus == 0 || sockets == 0) {
@@ -753,8 +753,7 @@ static void smp_parse(MachineState *ms, QemuOpts *opts, Error **errp)
             sockets = sockets > 0 ? sockets : 1;
             cpus = cores * threads * sockets;
         } else {
-            ms->smp.max_cpus =
-                    qemu_opt_get_number(opts, "maxcpus", cpus);
+            ms->smp.max_cpus = config->has_maxcpus ? config->maxcpus : cpus;
             sockets = ms->smp.max_cpus / (cores * threads);
         }
     } else if (cores == 0) {
@@ -772,8 +771,7 @@ static void smp_parse(MachineState *ms, QemuOpts *opts, Error **errp)
         return;
     }
 
-    ms->smp.max_cpus =
-            qemu_opt_get_number(opts, "maxcpus", cpus);
+    ms->smp.max_cpus = config->has_maxcpus ? config->maxcpus : cpus;
 
     if (ms->smp.max_cpus < cpus) {
         error_setg(errp, "maxcpus must be equal to or greater than smp");
@@ -1128,7 +1126,22 @@ bool machine_smp_parse(MachineState *ms, QemuOpts *opts, Error **errp)
     ERRP_GUARD();
 
     if (opts) {
-        mc->smp_parse(ms, opts, errp);
+        SMPConfiguration config = {
+            .has_cpus = !!qemu_opt_get(opts, "cpus"),
+            .cpus = qemu_opt_get_number(opts, "cpus", 0),
+            .has_sockets = !!qemu_opt_get(opts, "sockets"),
+            .sockets = qemu_opt_get_number(opts, "sockets", 0),
+            .has_dies = !!qemu_opt_get(opts, "dies"),
+            .dies = qemu_opt_get_number(opts, "dies", 0),
+            .has_cores = !!qemu_opt_get(opts, "cores"),
+            .cores = qemu_opt_get_number(opts, "cores", 0),
+            .has_threads = !!qemu_opt_get(opts, "threads"),
+            .threads = qemu_opt_get_number(opts, "threads", 0),
+            .has_maxcpus = !!qemu_opt_get(opts, "maxcpus"),
+            .maxcpus = qemu_opt_get_number(opts, "maxcpus", 0),
+        };
+
+        mc->smp_parse(ms, &config, errp);
         if (*errp) {
             return false;
         }
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 1760e94ff5..14ed30bb78 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -706,13 +706,13 @@ void pc_acpi_smi_interrupt(void *opaque, int irq, int level)
  * This function is very similar to smp_parse()
  * in hw/core/machine.c but includes CPU die support.
  */
-static void pc_smp_parse(MachineState *ms, QemuOpts *opts, Error **errp)
+static void pc_smp_parse(MachineState *ms, SMPConfiguration *config, Error **errp)
 {
-    unsigned cpus    = qemu_opt_get_number(opts, "cpus", 0);
-    unsigned sockets = qemu_opt_get_number(opts, "sockets", 0);
-    unsigned dies = qemu_opt_get_number(opts, "dies", 1);
-    unsigned cores   = qemu_opt_get_number(opts, "cores", 0);
-    unsigned threads = qemu_opt_get_number(opts, "threads", 0);
+    unsigned cpus    = config->has_cpus ? config->cpus : 0;
+    unsigned sockets = config->has_sockets ? config->sockets : 0;
+    unsigned dies    = config->has_dies ? config->dies : 1;
+    unsigned cores   = config->has_cores ? config->cores : 0;
+    unsigned threads = config->has_threads ? config->threads : 0;
 
     /* compute missing values, prefer sockets over cores over threads */
     if (cpus == 0 || sockets == 0) {
@@ -722,8 +722,7 @@ static void pc_smp_parse(MachineState *ms, QemuOpts *opts, Error **errp)
             sockets = sockets > 0 ? sockets : 1;
             cpus = cores * threads * dies * sockets;
         } else {
-            ms->smp.max_cpus =
-                    qemu_opt_get_number(opts, "maxcpus", cpus);
+            ms->smp.max_cpus = config->has_maxcpus ? config->maxcpus : cpus;
             sockets = ms->smp.max_cpus / (cores * threads * dies);
         }
     } else if (cores == 0) {
@@ -741,8 +740,7 @@ static void pc_smp_parse(MachineState *ms, QemuOpts *opts, Error **errp)
         return;
     }
 
-    ms->smp.max_cpus =
-            qemu_opt_get_number(opts, "maxcpus", cpus);
+    ms->smp.max_cpus = config->has_maxcpus ? config->maxcpus : cpus;
 
     if (ms->smp.max_cpus < cpus) {
         error_setg(errp, "maxcpus must be equal to or greater than smp");
diff --git a/include/hw/boards.h b/include/hw/boards.h
index 0483d6af86..1eae4427e8 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -210,7 +210,7 @@ struct MachineClass {
     void (*reset)(MachineState *state);
     void (*wakeup)(MachineState *state);
     int (*kvm_type)(MachineState *machine, const char *arg);
-    void (*smp_parse)(MachineState *ms, QemuOpts *opts, Error **errp);
+    void (*smp_parse)(MachineState *ms, SMPConfiguration *config, Error **errp);
 
     BlockInterfaceType block_default_type;
     int units_per_default_bus;
diff --git a/qapi/machine.json b/qapi/machine.json
index 6e90d463fc..3a6a21fd01 100644
--- a/qapi/machine.json
+++ b/qapi/machine.json
@@ -1274,3 +1274,30 @@
 ##
 { 'event': 'MEM_UNPLUG_ERROR',
   'data': { 'device': 'str', 'msg': 'str' } }
+
+##
+# @SMPConfiguration:
+#
+# Schema for CPU topology configuration.
+#
+# @cpus: number of virtual CPUs in the virtual machine
+#
+# @sockets: number of sockets in the CPU topology
+#
+# @dies: number of dies per socket in the CPU topology
+#
+# @cores: number of cores per thread in the CPU topology
+#
+# @threads: number of threads per core in the CPU topology
+#
+# @maxcpus: maximum number of hotpluggable virtual CPUs in the virtual machine
+#
+# Since: 6.1
+##
+{ 'struct': 'SMPConfiguration', 'data': {
+     '*cpus': 'int',
+     '*sockets': 'int',
+     '*dies': 'int',
+     '*cores': 'int',
+     '*threads': 'int',
+     '*maxcpus': 'int' } }
-- 
2.26.2



