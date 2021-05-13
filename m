Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0049337FBA4
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 18:37:54 +0200 (CEST)
Received: from localhost ([::1]:40382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhELQ-0007L0-Vq
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 12:37:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lhEDB-0002Ld-Jy
 for qemu-devel@nongnu.org; Thu, 13 May 2021 12:29:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33902)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lhED5-0003Tl-4P
 for qemu-devel@nongnu.org; Thu, 13 May 2021 12:29:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620923354;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=viKv+L/NizaIhWDUT8p9ZI7E1JUiGNs7wb8iI18iM+E=;
 b=cERcfgXPTySGG6g31FILmGj6L5Z7Cj0dEPUU4iQMbC8KC7cAAosFHJeYsL9kvcogVGJCwx
 2VlO6nMMeDKceEhrX/9N7h6KKbjQfAVZMiY4NFT6q6Xjgw4KrXZSIg/BO9l9FRP08+UXfb
 SlV2jQBhrGMCsJuhunDsQmOOWYK+57k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-582-LARmzPbjOUeCn5puHuzw_A-1; Thu, 13 May 2021 12:29:13 -0400
X-MC-Unique: LARmzPbjOUeCn5puHuzw_A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3837E107ACCD;
 Thu, 13 May 2021 16:29:12 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id ADE59BA6F;
 Thu, 13 May 2021 16:29:11 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 10/14] machine: move common smp_parse code to caller
Date: Thu, 13 May 2021 12:28:57 -0400
Message-Id: <20210513162901.1310239-11-pbonzini@redhat.com>
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

Most of smp_parse and pc_smp_parse is guarded by an "if (opts)"
conditional, and the rest is common to both function.  Move the
conditional and the common code to the caller, machine_smp_parse.

Move the replay_add_blocker call after all errors are checked for.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/core/machine.c | 112 ++++++++++++++++++++++----------------------
 hw/i386/pc.c      | 116 +++++++++++++++++++++-------------------------
 2 files changed, 110 insertions(+), 118 deletions(-)

diff --git a/hw/core/machine.c b/hw/core/machine.c
index 79efae89ce..7e57c287b0 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -740,67 +740,59 @@ void machine_set_cpu_numa_node(MachineState *machine,
 
 static void smp_parse(MachineState *ms, QemuOpts *opts)
 {
-    if (opts) {
-        unsigned cpus    = qemu_opt_get_number(opts, "cpus", 0);
-        unsigned sockets = qemu_opt_get_number(opts, "sockets", 0);
-        unsigned cores   = qemu_opt_get_number(opts, "cores", 0);
-        unsigned threads = qemu_opt_get_number(opts, "threads", 0);
-
-        /* compute missing values, prefer sockets over cores over threads */
-        if (cpus == 0 || sockets == 0) {
-            cores = cores > 0 ? cores : 1;
-            threads = threads > 0 ? threads : 1;
-            if (cpus == 0) {
-                sockets = sockets > 0 ? sockets : 1;
-                cpus = cores * threads * sockets;
-            } else {
-                ms->smp.max_cpus =
-                        qemu_opt_get_number(opts, "maxcpus", cpus);
-                sockets = ms->smp.max_cpus / (cores * threads);
-            }
-        } else if (cores == 0) {
-            threads = threads > 0 ? threads : 1;
-            cores = cpus / (sockets * threads);
-            cores = cores > 0 ? cores : 1;
-        } else if (threads == 0) {
-            threads = cpus / (cores * sockets);
-            threads = threads > 0 ? threads : 1;
-        } else if (sockets * cores * threads < cpus) {
-            error_report("cpu topology: "
-                         "sockets (%u) * cores (%u) * threads (%u) < "
-                         "smp_cpus (%u)",
-                         sockets, cores, threads, cpus);
-            exit(1);
-        }
-
-        ms->smp.max_cpus =
-                qemu_opt_get_number(opts, "maxcpus", cpus);
-
-        if (ms->smp.max_cpus < cpus) {
-            error_report("maxcpus must be equal to or greater than smp");
-            exit(1);
+    unsigned cpus    = qemu_opt_get_number(opts, "cpus", 0);
+    unsigned sockets = qemu_opt_get_number(opts, "sockets", 0);
+    unsigned cores   = qemu_opt_get_number(opts, "cores", 0);
+    unsigned threads = qemu_opt_get_number(opts, "threads", 0);
+
+    /* compute missing values, prefer sockets over cores over threads */
+    if (cpus == 0 || sockets == 0) {
+        cores = cores > 0 ? cores : 1;
+        threads = threads > 0 ? threads : 1;
+        if (cpus == 0) {
+            sockets = sockets > 0 ? sockets : 1;
+            cpus = cores * threads * sockets;
+        } else {
+            ms->smp.max_cpus =
+                    qemu_opt_get_number(opts, "maxcpus", cpus);
+            sockets = ms->smp.max_cpus / (cores * threads);
         }
+    } else if (cores == 0) {
+        threads = threads > 0 ? threads : 1;
+        cores = cpus / (sockets * threads);
+        cores = cores > 0 ? cores : 1;
+    } else if (threads == 0) {
+        threads = cpus / (cores * sockets);
+        threads = threads > 0 ? threads : 1;
+    } else if (sockets * cores * threads < cpus) {
+        error_report("cpu topology: "
+                        "sockets (%u) * cores (%u) * threads (%u) < "
+                        "smp_cpus (%u)",
+                        sockets, cores, threads, cpus);
+        exit(1);
+    }
 
-        if (sockets * cores * threads != ms->smp.max_cpus) {
-            error_report("Invalid CPU topology: "
-                         "sockets (%u) * cores (%u) * threads (%u) "
-                         "!= maxcpus (%u)",
-                         sockets, cores, threads,
-                         ms->smp.max_cpus);
-            exit(1);
-        }
+    ms->smp.max_cpus =
+            qemu_opt_get_number(opts, "maxcpus", cpus);
 
-        ms->smp.cpus = cpus;
-        ms->smp.cores = cores;
-        ms->smp.threads = threads;
-        ms->smp.sockets = sockets;
+    if (ms->smp.max_cpus < cpus) {
+        error_report("maxcpus must be equal to or greater than smp");
+        exit(1);
     }
 
-    if (ms->smp.cpus > 1) {
-        Error *blocker = NULL;
-        error_setg(&blocker, QERR_REPLAY_NOT_SUPPORTED, "smp");
-        replay_add_blocker(blocker);
+    if (sockets * cores * threads != ms->smp.max_cpus) {
+        error_report("Invalid CPU topology: "
+                        "sockets (%u) * cores (%u) * threads (%u) "
+                        "!= maxcpus (%u)",
+                        sockets, cores, threads,
+                        ms->smp.max_cpus);
+        exit(1);
     }
+
+    ms->smp.cpus = cpus;
+    ms->smp.cores = cores;
+    ms->smp.threads = threads;
+    ms->smp.sockets = sockets;
 }
 
 static void machine_class_init(ObjectClass *oc, void *data)
@@ -1134,7 +1126,9 @@ bool machine_smp_parse(MachineState *ms, QemuOpts *opts, Error **errp)
 {
     MachineClass *mc = MACHINE_GET_CLASS(ms);
 
-    mc->smp_parse(ms, opts);
+    if (opts) {
+        mc->smp_parse(ms, opts);
+    }
 
     /* sanity-check smp_cpus and max_cpus against mc */
     if (ms->smp.cpus < mc->min_cpus) {
@@ -1150,6 +1144,12 @@ bool machine_smp_parse(MachineState *ms, QemuOpts *opts, Error **errp)
                    mc->name, mc->max_cpus);
         return false;
     }
+
+    if (ms->smp.cpus > 1) {
+        Error *blocker = NULL;
+        error_setg(&blocker, QERR_REPLAY_NOT_SUPPORTED, "smp");
+        replay_add_blocker(blocker);
+    }
     return true;
 }
 
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 466e57acbe..2942ddf0f9 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -708,69 +708,61 @@ void pc_acpi_smi_interrupt(void *opaque, int irq, int level)
  */
 void pc_smp_parse(MachineState *ms, QemuOpts *opts)
 {
-    if (opts) {
-        unsigned cpus    = qemu_opt_get_number(opts, "cpus", 0);
-        unsigned sockets = qemu_opt_get_number(opts, "sockets", 0);
-        unsigned dies = qemu_opt_get_number(opts, "dies", 1);
-        unsigned cores   = qemu_opt_get_number(opts, "cores", 0);
-        unsigned threads = qemu_opt_get_number(opts, "threads", 0);
-
-        /* compute missing values, prefer sockets over cores over threads */
-        if (cpus == 0 || sockets == 0) {
-            cores = cores > 0 ? cores : 1;
-            threads = threads > 0 ? threads : 1;
-            if (cpus == 0) {
-                sockets = sockets > 0 ? sockets : 1;
-                cpus = cores * threads * dies * sockets;
-            } else {
-                ms->smp.max_cpus =
-                        qemu_opt_get_number(opts, "maxcpus", cpus);
-                sockets = ms->smp.max_cpus / (cores * threads * dies);
-            }
-        } else if (cores == 0) {
-            threads = threads > 0 ? threads : 1;
-            cores = cpus / (sockets * dies * threads);
-            cores = cores > 0 ? cores : 1;
-        } else if (threads == 0) {
-            threads = cpus / (cores * dies * sockets);
-            threads = threads > 0 ? threads : 1;
-        } else if (sockets * dies * cores * threads < cpus) {
-            error_report("cpu topology: "
-                         "sockets (%u) * dies (%u) * cores (%u) * threads (%u) < "
-                         "smp_cpus (%u)",
-                         sockets, dies, cores, threads, cpus);
-            exit(1);
-        }
-
-        ms->smp.max_cpus =
-                qemu_opt_get_number(opts, "maxcpus", cpus);
-
-        if (ms->smp.max_cpus < cpus) {
-            error_report("maxcpus must be equal to or greater than smp");
-            exit(1);
-        }
-
-        if (sockets * dies * cores * threads != ms->smp.max_cpus) {
-            error_report("Invalid CPU topology deprecated: "
-                         "sockets (%u) * dies (%u) * cores (%u) * threads (%u) "
-                         "!= maxcpus (%u)",
-                         sockets, dies, cores, threads,
-                         ms->smp.max_cpus);
-            exit(1);
+    unsigned cpus    = qemu_opt_get_number(opts, "cpus", 0);
+    unsigned sockets = qemu_opt_get_number(opts, "sockets", 0);
+    unsigned dies = qemu_opt_get_number(opts, "dies", 1);
+    unsigned cores   = qemu_opt_get_number(opts, "cores", 0);
+    unsigned threads = qemu_opt_get_number(opts, "threads", 0);
+
+    /* compute missing values, prefer sockets over cores over threads */
+    if (cpus == 0 || sockets == 0) {
+        cores = cores > 0 ? cores : 1;
+        threads = threads > 0 ? threads : 1;
+        if (cpus == 0) {
+            sockets = sockets > 0 ? sockets : 1;
+            cpus = cores * threads * dies * sockets;
+        } else {
+            ms->smp.max_cpus =
+                    qemu_opt_get_number(opts, "maxcpus", cpus);
+            sockets = ms->smp.max_cpus / (cores * threads * dies);
         }
-
-        ms->smp.cpus = cpus;
-        ms->smp.cores = cores;
-        ms->smp.threads = threads;
-        ms->smp.sockets = sockets;
-        ms->smp.dies = dies;
-    }
-
-    if (ms->smp.cpus > 1) {
-        Error *blocker = NULL;
-        error_setg(&blocker, QERR_REPLAY_NOT_SUPPORTED, "smp");
-        replay_add_blocker(blocker);
-    }
+    } else if (cores == 0) {
+        threads = threads > 0 ? threads : 1;
+        cores = cpus / (sockets * dies * threads);
+        cores = cores > 0 ? cores : 1;
+    } else if (threads == 0) {
+        threads = cpus / (cores * dies * sockets);
+        threads = threads > 0 ? threads : 1;
+    } else if (sockets * dies * cores * threads < cpus) {
+        error_report("cpu topology: "
+                        "sockets (%u) * dies (%u) * cores (%u) * threads (%u) < "
+                        "smp_cpus (%u)",
+                        sockets, dies, cores, threads, cpus);
+        exit(1);
+    }
+
+    ms->smp.max_cpus =
+            qemu_opt_get_number(opts, "maxcpus", cpus);
+
+    if (ms->smp.max_cpus < cpus) {
+        error_report("maxcpus must be equal to or greater than smp");
+        exit(1);
+    }
+
+    if (sockets * dies * cores * threads != ms->smp.max_cpus) {
+        error_report("Invalid CPU topology deprecated: "
+                        "sockets (%u) * dies (%u) * cores (%u) * threads (%u) "
+                        "!= maxcpus (%u)",
+                        sockets, dies, cores, threads,
+                        ms->smp.max_cpus);
+        exit(1);
+    }
+
+    ms->smp.cpus = cpus;
+    ms->smp.cores = cores;
+    ms->smp.threads = threads;
+    ms->smp.sockets = sockets;
+    ms->smp.dies = dies;
 }
 
 static
-- 
2.26.2



