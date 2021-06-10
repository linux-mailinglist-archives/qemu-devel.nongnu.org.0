Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F3ED3A2D51
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 15:44:58 +0200 (CEST)
Received: from localhost ([::1]:45856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrKzR-0004Se-N3
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 09:44:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lrKqg-0001iZ-Ic
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 09:35:55 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:42624)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lrKqd-0005gL-HY
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 09:35:54 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 l7-20020a05600c1d07b02901b0e2ebd6deso6450749wms.1
 for <qemu-devel@nongnu.org>; Thu, 10 Jun 2021 06:35:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AEctVWm7LnklR94IVota7cJxBYDiTHrGLM7X/qOIhdI=;
 b=J5pUoxIFecL/iMexfmXUMEl1++qTRXlAoODXvaSmj32MmoT7Q7wAViC4BUwoiKj4pm
 JCKzHkRcDXBlZS/c38bNtrzrcUjKs64LYGqxTR64DEa3SAyz+NDhC12Fo7MFF3UUZthf
 AacdkRHVfzCNx4jNalwHepL/8zmaJcqsTCzYvpyTbsMoBNHay+va5Nm4WnhpOLsNsHU1
 zIS2NfiFnByLorL4GT4B+e9oeGLRNSB+ZAhOJ1fjYFhcyC+X2Zbn3VocRkcy0WI5TkKP
 8uy+ouh0HEsu+drGnUniuyhKWrbNUk/4URr0Q4qSeHJbESDkERE8Q9ppLcLPbvUKoS4h
 uT7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=AEctVWm7LnklR94IVota7cJxBYDiTHrGLM7X/qOIhdI=;
 b=Wo4og35HCbRsWZcf8BI3q5ApLEe6UJjkwhPdPAJMAdo/uQb7pOGB/S8sC+sKacxMUe
 1MThnhcYhgJyR82uIGCTNRgoKKp1ZVJITuj7kBgfh+2X2vfl78uCBkInsQxYv7z0dPng
 cIplOnGKJguE+hO5ZuMsiRX2/gRpwIhfYxj0LqARabmA0Gk+b6HABuHBjfgTIYgrMska
 +3JLx53Qu18Gk2uACadr7PhK3UIVszjs+8tCltgPco+/Lp2tXCBplL9A8+lole4exYAO
 HzSA+yjli/ksu9/IKJpE9t55xsi1/k4eSJTFpnZzWi6UKj0Oirf33jn30csb4aYolkAO
 XCfg==
X-Gm-Message-State: AOAM530DT50bE+HL9tl1PZtU+k77qQIeV9t4HOAV/LLlh7aOk3w7+Fd9
 iXM+RHNDP/t9fVUNr7twFYemjJ3XZUdWFg==
X-Google-Smtp-Source: ABdhPJwaHW6yIip1QHA7yqEM1PKdYa0UXh/h9qiCxM3vjrYgfHiZgnQDJBKy49sp4Yh7z/mAQoO/xQ==
X-Received: by 2002:a7b:cd9a:: with SMTP id y26mr14866708wmj.81.1623332147999; 
 Thu, 10 Jun 2021 06:35:47 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id
 v8sm4032519wrc.29.2021.06.10.06.35.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jun 2021 06:35:47 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 09/11] machine: pass QAPI struct to mc->smp_parse
Date: Thu, 10 Jun 2021 15:35:36 +0200
Message-Id: <20210610133538.608390-10-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210610133538.608390-1-pbonzini@redhat.com>
References: <20210610133538.608390-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x331.google.com
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
Cc: berrange@redhat.com, armbru@redhat.com
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



