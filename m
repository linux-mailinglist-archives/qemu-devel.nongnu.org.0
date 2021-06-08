Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B27839F2C8
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 11:48:21 +0200 (CEST)
Received: from localhost ([::1]:54794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqYLM-0002Az-MY
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 05:48:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lqYDn-0004bL-Bt
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 05:40:31 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:55877)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lqYDk-0001qY-0R
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 05:40:31 -0400
Received: by mail-wm1-x336.google.com with SMTP id g204so1390511wmf.5
 for <qemu-devel@nongnu.org>; Tue, 08 Jun 2021 02:40:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=J/jOftwZDa2RFQJpkwXjrQU/YDdcj+tfPzp2fAN/u3Q=;
 b=fbmvFC5G2olYdapW0dcnswicmUt/CagkADNkyuy05EVEAdbqZS9jQ3PPJMcvqKI05T
 Hus95Wdmge9MjnYMZw9liFgHuWyS/dc1wkXapVUAAoUMuYNAsMPEJYL4j9RpzRXak2zw
 eUiMn/oZKA984dPIgnj/2Om/pZIxzFxK5tu1RFh1p0xfrRGRt9Nab7i0azYL9J0TRXIw
 YGQ9wLNVOXrjOVDpfrM12jYheczlxeR5b54OuLXOTylsBK9HCorfh/fWbN6GAn69vGvx
 8HyJ/80vzwD/tDcbn5iBDObORHT+uWlL1BBKa4A4lFS+TtBa63KEJUYqvOcBkyygUbqq
 9xiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=J/jOftwZDa2RFQJpkwXjrQU/YDdcj+tfPzp2fAN/u3Q=;
 b=dk/6IDi8b5ZuHR6GHLRQSgTUDtly5XzVbefK1THPBxZAA5O6lpz6enPiHfxNtnGAKZ
 6uDoz+k/rEw3q5Q3Lv/vI20CnELB8t5Hhvd4QFrPcCWoGlfRjN9mEcHrtEzGScK4JQWl
 Zj+3gj8mMUirA+5hIajaD3HSt+EUyZn7xkL1d0wcc6OFLkSBcjACIlgxpIqePa0yw1A6
 rRewo0fsl/x0heSOlsN9Fcjl9mMWa0eWuYG52QEpsI0spQv28SmAu44q9r6N1EhRmHKY
 c77qnEyExW90HDHRlCDfmAwEhNIkgMDBHFPtkT0tWZAG6h/aasE2Z2bX/Yrm0apPGyNL
 /apg==
X-Gm-Message-State: AOAM530MMjGhE613BKLIdGLzJnzZYpKWvGspYIVZm84bpCvlJsP48S1V
 ep48iyHmxz1/fA5zkngc/bWdeZ4yI+s=
X-Google-Smtp-Source: ABdhPJzxRu199kMbVIzEiJ360DRqtnf/JkyfNpyIo36EXSYSvYFGD5J8K7BVy4Delx8+RFiu2dT6bw==
X-Received: by 2002:a05:600c:35c3:: with SMTP id
 r3mr3214766wmq.169.1623145226550; 
 Tue, 08 Jun 2021 02:40:26 -0700 (PDT)
Received: from avogadro.lan ([93.56.169.140])
 by smtp.gmail.com with ESMTPSA id d15sm8608764wri.58.2021.06.08.02.40.25
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Jun 2021 02:40:26 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 07/12] machine: move common smp_parse code to caller
Date: Tue,  8 Jun 2021 11:40:12 +0200
Message-Id: <20210608094017.392673-8-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210608094017.392673-1-pbonzini@redhat.com>
References: <20210608094017.392673-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x336.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
index d776c8cf20..1016ec9e1c 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -741,67 +741,59 @@ void machine_set_cpu_numa_node(MachineState *machine,
 
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
@@ -1135,7 +1127,9 @@ bool machine_smp_parse(MachineState *ms, QemuOpts *opts, Error **errp)
 {
     MachineClass *mc = MACHINE_GET_CLASS(ms);
 
-    mc->smp_parse(ms, opts);
+    if (opts) {
+        mc->smp_parse(ms, opts);
+    }
 
     /* sanity-check smp_cpus and max_cpus against mc */
     if (ms->smp.cpus < mc->min_cpus) {
@@ -1151,6 +1145,12 @@ bool machine_smp_parse(MachineState *ms, QemuOpts *opts, Error **errp)
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
index 92958e9ad7..e206ac85f3 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -712,69 +712,61 @@ void pc_acpi_smi_interrupt(void *opaque, int irq, int level)
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
2.31.1



