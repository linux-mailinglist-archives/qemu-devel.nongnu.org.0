Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19FFD3AB80A
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 17:58:22 +0200 (CEST)
Received: from localhost ([::1]:40980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltuPN-0006Ro-4t
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 11:58:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ltuKW-0006p1-PZ
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 11:53:22 -0400
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:45668)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ltuKT-0001UH-E4
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 11:53:19 -0400
Received: by mail-ej1-x631.google.com with SMTP id hv20so4693512ejc.12
 for <qemu-devel@nongnu.org>; Thu, 17 Jun 2021 08:53:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5ylDY+0JSvlA4RffEZW471J4NjK7IbPmm9MIR9Ryzqk=;
 b=SAfocpMZplIGdsJc1YK+0x3sYubSN8L5uUXJH8jOefV+K+cPu2+U7Oyqo+gYDqfgPu
 l3TBL2gX5zKePAuiqmV4i1DB+VaIcu28XnK0MX/4ZSglUwv30cHD02tDS0TAVY1mRdyt
 3EhLjIDnUkoZ4xliZS+m65jF9VtbHnxMBqZILyvNtjfgYT4jTwUn05YeuDno5Hk0LXYK
 0YJYXI18dX1cZrlDVsExYibfrFH2Bv0dIdfkUvvZ5Q9qXmmWeQunOL/nlct2wMPaqaIW
 bd+hnEFKOViPSSyMlbUtueB/XX1iwElu43dqDuXMKUFdAeOuyjkc6MdbKhuw3OoMKN58
 rkog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=5ylDY+0JSvlA4RffEZW471J4NjK7IbPmm9MIR9Ryzqk=;
 b=ZiVCwHi9LjgwvT4DP6A5hJtD7BlhZIgh72Sf83iseRZYgDK80+obXz6OoqGHyy/VYe
 wsa1+IIBDvk1Ee9ICtp98+444p5i19ekxpNwhqEBxM8k8OoCkLlUf9CMDKPMf2pxQCVk
 t72n5SCM9zQXqFwVcNAhshwPVTNOklGvvAOqhXVXbVe0Yy7pZNTygvVYZ/JIOWu0QKB7
 GkDZXx5JvzAo4Bf88xjEDCmbOLo8WDBkgCgql+XlqeJ94b+TpYRzlejmIFDFOmi16+Gc
 B3fb9XwB3wNO12v3tlpjY1oSL/VSvZoR6pawUgDkuRlPPeuFASDAgwP/plZp18Uiam3s
 taog==
X-Gm-Message-State: AOAM530/KUYa+oQZtabsIXLNXguzIIuy2Yqk+umQMw17GHPBfiBrtoYC
 T6Ipzeqzu7rgvAgd3JC2Pz5+WYaTWvE=
X-Google-Smtp-Source: ABdhPJyg6JdY8TRJxKiDHnETn1Uf817kT3BrKf4unbzEGu3ag8PF+yH7O0xsGVmqhvHrr3THSuf3+Q==
X-Received: by 2002:a17:907:9813:: with SMTP id
 ji19mr6100726ejc.318.1623945195656; 
 Thu, 17 Jun 2021 08:53:15 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id p13sm4604061edh.79.2021.06.17.08.53.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 08:53:15 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 07/11] machine: move common smp_parse code to caller
Date: Thu, 17 Jun 2021 17:53:04 +0200
Message-Id: <20210617155308.928754-8-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210617155308.928754-1-pbonzini@redhat.com>
References: <20210617155308.928754-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x631.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Most of smp_parse and pc_smp_parse is guarded by an "if (opts)"
conditional, and the rest is common to both function.  Move the
conditional and the common code to the caller, machine_smp_parse.

Move the replay_add_blocker call after all errors are checked for.

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



