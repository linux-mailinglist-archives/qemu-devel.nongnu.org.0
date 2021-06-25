Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EF763B461F
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Jun 2021 16:50:14 +0200 (CEST)
Received: from localhost ([::1]:54724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwn9p-0002Eb-91
	for lists+qemu-devel@lfdr.de; Fri, 25 Jun 2021 10:50:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lwmfS-0003mP-Jw
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 10:18:50 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:38486)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lwmfQ-0003KF-LD
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 10:18:50 -0400
Received: by mail-ed1-x534.google.com with SMTP id q14so13621994eds.5
 for <qemu-devel@nongnu.org>; Fri, 25 Jun 2021 07:18:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/bIWGO6QOwJ/Qr0480AkBxbVNABvwpA6wvZiD7P+Log=;
 b=ps2eEkP+oYBBMZHDI7NExvvKjkAbYXnDOwun45HSQK+qSz4ZiCZMTmKhwBs4eJLu5A
 Zb6e8Tb7TXAbQHLc8k56Cc/fkBRjc6B+HpHqINXhUW+HyRcVa4s1/GLzxWINOIt1SOE9
 eJVG9lTlduaJ8KccKQC8JVutFOwV025eEY4gBSMs0SzUiEvXrMyHDQtgy3MI1RL3SPYc
 7jEWTHBwcfVsYOJK08RiSxXvQfn9i0lR//YIGxyIVVzekMz0iWW5P1VQuMzuRCGYMhZv
 8d24Fgm0CcLhNkaUcTmji5ZDoWhCsB3Hc7ZZVIfz8eOBFlemN92nX1WYd3zph0hok+GS
 dMiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=/bIWGO6QOwJ/Qr0480AkBxbVNABvwpA6wvZiD7P+Log=;
 b=lI2+hfNi7NVbyFiJb4yLHh/bxWlxl5t7Js/AEXG89NxLMcqYy+pMdsDo8R1yt5PqP4
 doF7TpgdkWvE2xG9WuI89wd1ntH0FFuRkGnK11CyfXz6eUM8Qvy0pTAebbXTAzTyKlzt
 0uKpMgBZdRILC/X3ZToJkkSviNKDFcZw1ZPMhzCPXfZZ5TOrzCUQ7zsdP7prjw8k0REf
 UED0FuBYjHi+7y0lhZbll/v4e2V9hmF42zrQ+rK5iYTR++UB6xB4TzKETg89mrz2ROqP
 rbIlvEmGzLf+ced16ADzTTMV5dxLXApLrfs5+0TKFNJfxtAKd3DoBGDQDMsNCZ9o5s43
 Sufw==
X-Gm-Message-State: AOAM533HF5zmMgsugtgASAHUUc0xNLTqnkx4euJqkmPbMX+aM8z7dVRA
 o2OqFq12F6pSZK+1DbkdyxqT5jM6h/k=
X-Google-Smtp-Source: ABdhPJzYu1PvEpFtCBl+RdJEtoVRps1vgVIlvzwch1vRWRcd1seZ1TaLnFGjauUYEFUip4jexqeh3A==
X-Received: by 2002:a05:6402:4393:: with SMTP id
 o19mr14853432edc.263.1624630727322; 
 Fri, 25 Jun 2021 07:18:47 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id c28sm326579ejc.102.2021.06.25.07.18.46
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Jun 2021 07:18:46 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 25/28] machine: move common smp_parse code to caller
Date: Fri, 25 Jun 2021 16:18:19 +0200
Message-Id: <20210625141822.1368639-26-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210625141822.1368639-1-pbonzini@redhat.com>
References: <20210625141822.1368639-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x534.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Message-Id: <20210617155308.928754-8-pbonzini@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/core/machine.c | 114 +++++++++++++++++++++++-----------------------
 hw/i386/pc.c      | 108 ++++++++++++++++++++-----------------------
 2 files changed, 107 insertions(+), 115 deletions(-)

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
+    unsigned cpus    = qemu_opt_get_number(opts, "cpus", 0);
+    unsigned sockets = qemu_opt_get_number(opts, "sockets", 0);
+    unsigned cores   = qemu_opt_get_number(opts, "cores", 0);
+    unsigned threads = qemu_opt_get_number(opts, "threads", 0);
 
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
-
-        ms->smp.max_cpus =
-                qemu_opt_get_number(opts, "maxcpus", cpus);
-
-        if (ms->smp.max_cpus < cpus) {
-            error_report("maxcpus must be equal to or greater than smp");
-            exit(1);
-        }
-
-        if (sockets * cores * threads != ms->smp.max_cpus) {
-            error_report("Invalid CPU topology: "
-                         "sockets (%u) * cores (%u) * threads (%u) "
-                         "!= maxcpus (%u)",
-                         sockets, cores, threads,
-                         ms->smp.max_cpus);
-            exit(1);
-        }
-
-        ms->smp.cpus = cpus;
-        ms->smp.cores = cores;
-        ms->smp.threads = threads;
-        ms->smp.sockets = sockets;
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
     }
 
-    if (ms->smp.cpus > 1) {
-        Error *blocker = NULL;
-        error_setg(&blocker, QERR_REPLAY_NOT_SUPPORTED, "smp");
-        replay_add_blocker(blocker);
+    ms->smp.max_cpus =
+            qemu_opt_get_number(opts, "maxcpus", cpus);
+
+    if (ms->smp.max_cpus < cpus) {
+        error_report("maxcpus must be equal to or greater than smp");
+        exit(1);
     }
+
+    if (sockets * cores * threads != ms->smp.max_cpus) {
+        error_report("Invalid CPU topology: "
+                        "sockets (%u) * cores (%u) * threads (%u) "
+                        "!= maxcpus (%u)",
+                        sockets, cores, threads,
+                        ms->smp.max_cpus);
+        exit(1);
+    }
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
+    unsigned cpus    = qemu_opt_get_number(opts, "cpus", 0);
+    unsigned sockets = qemu_opt_get_number(opts, "sockets", 0);
+    unsigned dies = qemu_opt_get_number(opts, "dies", 1);
+    unsigned cores   = qemu_opt_get_number(opts, "cores", 0);
+    unsigned threads = qemu_opt_get_number(opts, "threads", 0);
 
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
-        }
-
-        ms->smp.cpus = cpus;
-        ms->smp.cores = cores;
-        ms->smp.threads = threads;
-        ms->smp.sockets = sockets;
-        ms->smp.dies = dies;
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
     }
 
-    if (ms->smp.cpus > 1) {
-        Error *blocker = NULL;
-        error_setg(&blocker, QERR_REPLAY_NOT_SUPPORTED, "smp");
-        replay_add_blocker(blocker);
+    ms->smp.max_cpus =
+            qemu_opt_get_number(opts, "maxcpus", cpus);
+
+    if (ms->smp.max_cpus < cpus) {
+        error_report("maxcpus must be equal to or greater than smp");
+        exit(1);
     }
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



