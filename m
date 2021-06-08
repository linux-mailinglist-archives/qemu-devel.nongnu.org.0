Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B15839F30D
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 11:55:15 +0200 (CEST)
Received: from localhost ([::1]:49220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqYS1-0000TE-Ux
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 05:55:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lqYDo-0004eL-Gg
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 05:40:32 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:39463)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lqYDm-0001tq-7Q
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 05:40:32 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 l18-20020a1ced120000b029014c1adff1edso1455928wmh.4
 for <qemu-devel@nongnu.org>; Tue, 08 Jun 2021 02:40:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AEctVWm7LnklR94IVota7cJxBYDiTHrGLM7X/qOIhdI=;
 b=gWgEll28uykvnr0WORZQXz0wMYDTLQ69OOuVn157DoZnSsED9SKOW70U9F3+WHu38S
 aRhbWDMmjDEh4utqctqQt74pg82xWbiXM/Yu3AVQ80gADdVPrJo8pXlbXJYDWfeGNvx8
 WcMDsJqLNc0FDVbRD95pl6n8DM1udXIfbPFRqHGVNpsLgGCC4O56ddMDzRrE4nk0h3GM
 VnX9VDwhy0E/xQ45JIBjrcIDsSuGrlmMnV9VeHXH8mrsK/Kgvv8/WxE9N9KKove7jLZ7
 6CK9d1hWYa7QRnLL1f+FIcK/yoHUu3aQYspF7uIVmMIP5OFhwiBLuHXcb7mGdTgZQoxT
 crmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=AEctVWm7LnklR94IVota7cJxBYDiTHrGLM7X/qOIhdI=;
 b=BvTAKM96+K1h5FB/74TYVmBnpn3Ey0LfGQcCvlbvPkZ3ggc6OSnE0Sg26fj73yB2Cv
 UGE8DOIVxaanyee+fTAxm+sKM64+eudelyaPhCVNkrJbinZPiKzdGetCimEz1F1j1fWf
 88nxuab3bdYOO0O37FmPAMskg/zmqiCrCgSyY0GZmJLKLc9KBQ6rN+0/EY2SP+ymhyy2
 D9EqcjUQhKOWEKjLxjJzOK8aw5TDAJYaSpx9JdE20/4eckcl98lQGvh0mcXMm0u8Qg7y
 1o7hZyLqylflPOAxNn5U5JmLJ/T6x6NAL1THVng3buJsEE/RuGhLSRyJiGvMOILpMLYm
 1tIA==
X-Gm-Message-State: AOAM530YoROlePopplvWtQHj0JsVtHmbjcdzPioz/M1NOAzYrH2pYRPd
 24PyMFOmsX9OA046uXa3GeF1LgSNkVM=
X-Google-Smtp-Source: ABdhPJzSAbtUI2WmPcePg1t3Za0LbaRF7o34PXcCsGzwAlMx5FUYVxtTT+wgApnM42b6us7DBiom2A==
X-Received: by 2002:a05:600c:35c1:: with SMTP id
 r1mr3179229wmq.181.1623145228155; 
 Tue, 08 Jun 2021 02:40:28 -0700 (PDT)
Received: from avogadro.lan ([93.56.169.140])
 by smtp.gmail.com with ESMTPSA id d15sm8608764wri.58.2021.06.08.02.40.27
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Jun 2021 02:40:27 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 09/12] machine: pass QAPI struct to mc->smp_parse
Date: Tue,  8 Jun 2021 11:40:14 +0200
Message-Id: <20210608094017.392673-10-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210608094017.392673-1-pbonzini@redhat.com>
References: <20210608094017.392673-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x32b.google.com
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
index 5a9c97ccc5..9ad8341a31 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -739,12 +739,12 @@ void machine_set_cpu_numa_node(MachineState *machine,
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
@@ -754,8 +754,7 @@ static void smp_parse(MachineState *ms, QemuOpts *opts, Error **errp)
             sockets = sockets > 0 ? sockets : 1;
             cpus = cores * threads * sockets;
         } else {
-            ms->smp.max_cpus =
-                    qemu_opt_get_number(opts, "maxcpus", cpus);
+            ms->smp.max_cpus = config->has_maxcpus ? config->maxcpus : cpus;
             sockets = ms->smp.max_cpus / (cores * threads);
         }
     } else if (cores == 0) {
@@ -773,8 +772,7 @@ static void smp_parse(MachineState *ms, QemuOpts *opts, Error **errp)
         return;
     }
 
-    ms->smp.max_cpus =
-            qemu_opt_get_number(opts, "maxcpus", cpus);
+    ms->smp.max_cpus = config->has_maxcpus ? config->maxcpus : cpus;
 
     if (ms->smp.max_cpus < cpus) {
         error_setg(errp, "maxcpus must be equal to or greater than smp");
@@ -1129,7 +1127,22 @@ bool machine_smp_parse(MachineState *ms, QemuOpts *opts, Error **errp)
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
index cce275dcb1..8e1220db72 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -710,13 +710,13 @@ void pc_acpi_smi_interrupt(void *opaque, int irq, int level)
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
@@ -726,8 +726,7 @@ static void pc_smp_parse(MachineState *ms, QemuOpts *opts, Error **errp)
             sockets = sockets > 0 ? sockets : 1;
             cpus = cores * threads * dies * sockets;
         } else {
-            ms->smp.max_cpus =
-                    qemu_opt_get_number(opts, "maxcpus", cpus);
+            ms->smp.max_cpus = config->has_maxcpus ? config->maxcpus : cpus;
             sockets = ms->smp.max_cpus / (cores * threads * dies);
         }
     } else if (cores == 0) {
@@ -745,8 +744,7 @@ static void pc_smp_parse(MachineState *ms, QemuOpts *opts, Error **errp)
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
index 58a9c86b36..53fd7e60ff 100644
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
2.31.1



