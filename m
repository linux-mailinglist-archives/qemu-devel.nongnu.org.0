Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C73AF39F2D5
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 11:50:44 +0200 (CEST)
Received: from localhost ([::1]:33246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqYNf-0006do-Sh
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 05:50:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lqYDn-0004ch-TD
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 05:40:31 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:34407)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lqYDk-0001sb-Kf
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 05:40:31 -0400
Received: by mail-wr1-x436.google.com with SMTP id q5so20843621wrm.1
 for <qemu-devel@nongnu.org>; Tue, 08 Jun 2021 02:40:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oaLUCvek2OmNr6/JtAkUEqBmw58D1m2VU8lWk8Kuo/k=;
 b=ncrmjzGRu4FHsrsplib58RJGImVXhPO1gwSGsgZg/tCuf/VwasI67O917pAwX3Pa5l
 hbGaDNbMuMTAV6vjct/C2dB3BQu2qSbGw+Yu1Ua3tPxvOn9ZQ5uUJsHHn48pG75xnu74
 rC6JsdMBxilN8wC7SdRHUZXhn6I7Y2Jgv5QxsSUwAuPIWX+4As/jjavxnII+p4vsv2Z3
 l1ZWK0bRqgBhTbIFu82CCTH76pUbjjGA9W3x5oNIIsE8NfLZIkXS1kDJvFhVoN00ajDy
 xvEFejq3QOg4ay8CyJ7yE8Qjeyr8oneAof8UtKFyOW4gxIdWNA2sAMRfWO7DUc/wKTJK
 d7GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=oaLUCvek2OmNr6/JtAkUEqBmw58D1m2VU8lWk8Kuo/k=;
 b=lEPCXqnjvlPnuSOHscqD4sJToVVwJkcaz4maK8uO2zQOUkCmQFUgbt+8Sq3CSWPtgw
 ou9nDWLgj+IX02IxLhLV8OfyXx9YUdqdNAi1pFMT8Mc26IONo+Q/ivJi64FqaD4L7ICK
 u8qgp/cC6XIQPRsA6q8EG2+757FY9yyM4+5rtqH+AlN2bqLhJ5GcellSkDDA6//odNDp
 6SvIBOnD7APxNlzI2ZIoxraA7XZwU6tcySHaQmoR32WwIvPQGEhnzdw/NviTchllq98a
 SQD3t+IeAN5TNwm0yujYjaYFeeE3I33k3yeNuVO+VZCl043WYEswl1YdtPp/n29bctuM
 TSYA==
X-Gm-Message-State: AOAM533qjaJs/3Ya3KprBbOywJRTIjujS7vvOIX8kj0X8mj3PbC5Yj6Q
 yM/5l5iLIVlDKCOICSKClZu4RvVeFow=
X-Google-Smtp-Source: ABdhPJyvnXRZ/WTCtCxHdV36OPIIyThXK+WvAPAsWq0WlezDa2FeBENnSp0wIsG5Z4f41a2HEEiduw==
X-Received: by 2002:a5d:6485:: with SMTP id o5mr21220262wri.91.1623145227281; 
 Tue, 08 Jun 2021 02:40:27 -0700 (PDT)
Received: from avogadro.lan ([93.56.169.140])
 by smtp.gmail.com with ESMTPSA id d15sm8608764wri.58.2021.06.08.02.40.26
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Jun 2021 02:40:26 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 08/12] machine: add error propagation to mc->smp_parse
Date: Tue,  8 Jun 2021 11:40:13 +0200
Message-Id: <20210608094017.392673-9-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210608094017.392673-1-pbonzini@redhat.com>
References: <20210608094017.392673-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x436.google.com
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

Clean up the smp_parse functions to use Error** instead of exiting.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/core/machine.c    | 34 +++++++++++++++++++---------------
 hw/i386/pc.c         | 28 ++++++++++++++--------------
 include/hw/boards.h  |  2 +-
 include/hw/i386/pc.h |  2 --
 4 files changed, 34 insertions(+), 32 deletions(-)

diff --git a/hw/core/machine.c b/hw/core/machine.c
index 1016ec9e1c..5a9c97ccc5 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -739,7 +739,7 @@ void machine_set_cpu_numa_node(MachineState *machine,
     }
 }
 
-static void smp_parse(MachineState *ms, QemuOpts *opts)
+static void smp_parse(MachineState *ms, QemuOpts *opts, Error **errp)
 {
     unsigned cpus    = qemu_opt_get_number(opts, "cpus", 0);
     unsigned sockets = qemu_opt_get_number(opts, "sockets", 0);
@@ -766,28 +766,28 @@ static void smp_parse(MachineState *ms, QemuOpts *opts)
         threads = cpus / (cores * sockets);
         threads = threads > 0 ? threads : 1;
     } else if (sockets * cores * threads < cpus) {
-        error_report("cpu topology: "
-                        "sockets (%u) * cores (%u) * threads (%u) < "
-                        "smp_cpus (%u)",
-                        sockets, cores, threads, cpus);
-        exit(1);
+        error_setg(errp, "cpu topology: "
+                   "sockets (%u) * cores (%u) * threads (%u) < "
+                   "smp_cpus (%u)",
+                   sockets, cores, threads, cpus);
+        return;
     }
 
     ms->smp.max_cpus =
             qemu_opt_get_number(opts, "maxcpus", cpus);
 
     if (ms->smp.max_cpus < cpus) {
-        error_report("maxcpus must be equal to or greater than smp");
-        exit(1);
+        error_setg(errp, "maxcpus must be equal to or greater than smp");
+        return;
     }
 
     if (sockets * cores * threads != ms->smp.max_cpus) {
-        error_report("Invalid CPU topology: "
-                        "sockets (%u) * cores (%u) * threads (%u) "
-                        "!= maxcpus (%u)",
-                        sockets, cores, threads,
-                        ms->smp.max_cpus);
-        exit(1);
+        error_setg(errp, "Invalid CPU topology: "
+                   "sockets (%u) * cores (%u) * threads (%u) "
+                   "!= maxcpus (%u)",
+                   sockets, cores, threads,
+                   ms->smp.max_cpus);
+        return;
     }
 
     ms->smp.cpus = cpus;
@@ -1126,9 +1126,13 @@ MemoryRegion *machine_consume_memdev(MachineState *machine,
 bool machine_smp_parse(MachineState *ms, QemuOpts *opts, Error **errp)
 {
     MachineClass *mc = MACHINE_GET_CLASS(ms);
+    ERRP_GUARD();
 
     if (opts) {
-        mc->smp_parse(ms, opts);
+        mc->smp_parse(ms, opts, errp);
+        if (*errp) {
+            return false;
+        }
     }
 
     /* sanity-check smp_cpus and max_cpus against mc */
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index e206ac85f3..cce275dcb1 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -710,7 +710,7 @@ void pc_acpi_smi_interrupt(void *opaque, int irq, int level)
  * This function is very similar to smp_parse()
  * in hw/core/machine.c but includes CPU die support.
  */
-void pc_smp_parse(MachineState *ms, QemuOpts *opts)
+static void pc_smp_parse(MachineState *ms, QemuOpts *opts, Error **errp)
 {
     unsigned cpus    = qemu_opt_get_number(opts, "cpus", 0);
     unsigned sockets = qemu_opt_get_number(opts, "sockets", 0);
@@ -738,28 +738,28 @@ void pc_smp_parse(MachineState *ms, QemuOpts *opts)
         threads = cpus / (cores * dies * sockets);
         threads = threads > 0 ? threads : 1;
     } else if (sockets * dies * cores * threads < cpus) {
-        error_report("cpu topology: "
-                        "sockets (%u) * dies (%u) * cores (%u) * threads (%u) < "
-                        "smp_cpus (%u)",
-                        sockets, dies, cores, threads, cpus);
-        exit(1);
+        error_setg(errp, "cpu topology: "
+                   "sockets (%u) * dies (%u) * cores (%u) * threads (%u) < "
+                   "smp_cpus (%u)",
+                   sockets, dies, cores, threads, cpus);
+        return;
     }
 
     ms->smp.max_cpus =
             qemu_opt_get_number(opts, "maxcpus", cpus);
 
     if (ms->smp.max_cpus < cpus) {
-        error_report("maxcpus must be equal to or greater than smp");
-        exit(1);
+        error_setg(errp, "maxcpus must be equal to or greater than smp");
+        return;
     }
 
     if (sockets * dies * cores * threads != ms->smp.max_cpus) {
-        error_report("Invalid CPU topology deprecated: "
-                        "sockets (%u) * dies (%u) * cores (%u) * threads (%u) "
-                        "!= maxcpus (%u)",
-                        sockets, dies, cores, threads,
-                        ms->smp.max_cpus);
-        exit(1);
+        error_setg(errp, "Invalid CPU topology deprecated: "
+                   "sockets (%u) * dies (%u) * cores (%u) * threads (%u) "
+                   "!= maxcpus (%u)",
+                   sockets, dies, cores, threads,
+                   ms->smp.max_cpus);
+        return;
     }
 
     ms->smp.cpus = cpus;
diff --git a/include/hw/boards.h b/include/hw/boards.h
index 87ae5cc300..0483d6af86 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -210,7 +210,7 @@ struct MachineClass {
     void (*reset)(MachineState *state);
     void (*wakeup)(MachineState *state);
     int (*kvm_type)(MachineState *machine, const char *arg);
-    void (*smp_parse)(MachineState *ms, QemuOpts *opts);
+    void (*smp_parse)(MachineState *ms, QemuOpts *opts, Error **errp);
 
     BlockInterfaceType block_default_type;
     int units_per_default_bus;
diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
index 4c2ca6d36a..87294f2632 100644
--- a/include/hw/i386/pc.h
+++ b/include/hw/i386/pc.h
@@ -138,8 +138,6 @@ extern int fd_bootchk;
 
 void pc_acpi_smi_interrupt(void *opaque, int irq, int level);
 
-void pc_smp_parse(MachineState *ms, QemuOpts *opts);
-
 void pc_guest_info_init(PCMachineState *pcms);
 
 #define PCI_HOST_PROP_PCI_HOLE_START   "pci-hole-start"
-- 
2.31.1



