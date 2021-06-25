Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10C633B45B5
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Jun 2021 16:36:42 +0200 (CEST)
Received: from localhost ([::1]:44134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwmwj-0001N3-1O
	for lists+qemu-devel@lfdr.de; Fri, 25 Jun 2021 10:36:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lwmfT-0003sU-W8
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 10:18:52 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:33370)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lwmfS-0003Kr-6E
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 10:18:51 -0400
Received: by mail-ej1-x633.google.com with SMTP id bu12so15473741ejb.0
 for <qemu-devel@nongnu.org>; Fri, 25 Jun 2021 07:18:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tgRY/UoYrXPJogrdpYXe8mcUTWND/106oKlRBPU+jnw=;
 b=np+kbX7dvx9sRE6EVPkDNH5tOE5b6xShzH4jFxSBsTzB6WEurJT+kGv/xIJwO8Qnc6
 ySVP6pyVhtzqsOtPbm/dP8JVcDUuYOFLJZDwbEMRnL8K27y+Mdbzekdja8tn6Rz+hcze
 vho46DxYqYB14xgTy12jvaUDJlzXzOLrfepsYu/z8jXdAfP1ewqyn4wzsDlRn20d8Y25
 I3BFkROJj1rnAFAPRl2LTNbk0StCLQO7GtxkbWl0fWQCp7sCCgSxtxDpeTRf5NiksexB
 krbal+LpIhs23Liavgq1TTqKxZ4MKt9uV2apQNpOlS6WQIpvMnSetn4TzPbHLMRJ2FCn
 Ti4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=tgRY/UoYrXPJogrdpYXe8mcUTWND/106oKlRBPU+jnw=;
 b=bwlEXI3oVKM9jq9wofObCVz14GAYooO6fh9VXHnesL305zhEbKOqyReIUPXIxa9qyW
 8ul0icdlSubdALNnD80VtglIvO2HMuj400cidJTra9pUnnWTHnDS32qLE1+eFmcCXU9q
 ZSlzyH/ohc2eHVypfqCePfqSSJJMNi8HLDZMNE/mDyf4Rs5ygcUbv1oEjOyFpnfnqYUo
 IAFACW7Kd11NkRNSOjTQOsx4dRr1aTOJ0944xR4IbaSxB4Zj0a904zb8kw0jBixy1UUZ
 pXjn8QPV1Vjw33ab9vmG/V1nBYSMNFlxnZEY3sZjv6xILExxIT6AKfkRa5LBBVFvE/hk
 EYCg==
X-Gm-Message-State: AOAM5310mNw2Upm4QtZQM7ubHWhGeTc3xk7Ywjlo0nRQdv4mCXMP+3fU
 7BlAF7FCa0AezJgZRvFURDOQ2An9kKE=
X-Google-Smtp-Source: ABdhPJw2RnsKEB9UavF3nn7NgfvLr4Dwlssn32Nu7EBZT9XCxywugCNnFAqnyzbiSSzAQRg08nzgEg==
X-Received: by 2002:a17:907:7b82:: with SMTP id
 ne2mr10907064ejc.271.1624630728849; 
 Fri, 25 Jun 2021 07:18:48 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id c28sm326579ejc.102.2021.06.25.07.18.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Jun 2021 07:18:48 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 27/28] machine: pass QAPI struct to mc->smp_parse
Date: Fri, 25 Jun 2021 16:18:21 +0200
Message-Id: <20210625141822.1368639-28-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210625141822.1368639-1-pbonzini@redhat.com>
References: <20210625141822.1368639-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x633.google.com
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
Cc: =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

As part of converting -smp to a property with a QAPI type, define
the struct and use it to do the actual parsing.  machine_smp_parse
takes care of doing the QemuOpts->QAPI conversion by hand, for now.

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20210617155308.928754-10-pbonzini@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/core/machine.c   | 33 +++++++++++++++++++++++----------
 hw/i386/pc.c        | 18 ++++++++----------
 include/hw/boards.h |  2 +-
 qapi/machine.json   | 28 ++++++++++++++++++++++++++++
 4 files changed, 60 insertions(+), 21 deletions(-)

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
index e4d0f9b24f..c3210ee1fb 100644
--- a/qapi/machine.json
+++ b/qapi/machine.json
@@ -1284,3 +1284,31 @@
 ##
 { 'event': 'MEM_UNPLUG_ERROR',
   'data': { 'device': 'str', 'msg': 'str' } }
+
+##
+# @SMPConfiguration:
+#
+# Schema for CPU topology configuration.  "0" or a missing value lets
+# QEMU figure out a suitable value based on the ones that are provided.
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



