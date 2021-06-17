Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 070913AB961
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 18:17:35 +0200 (CEST)
Received: from localhost ([::1]:55470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltuhy-0001pd-1q
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 12:17:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ltuKW-0006p2-PJ
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 11:53:22 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:35823)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ltuKT-0001UL-Oa
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 11:53:19 -0400
Received: by mail-ed1-x52a.google.com with SMTP id df12so2207288edb.2
 for <qemu-devel@nongnu.org>; Thu, 17 Jun 2021 08:53:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NsW6bhE3jhhDb6OGyNulY9l1vVYB3OpXnDEeg4R99GY=;
 b=JAiW5/h3DUG/Fyy7F4La4CwwNyQZebd+65yF7gynTuux4rzSLzJPH/KP1ba8VWOv9Y
 W9PpYgh7vgrf3+koOieRlVpPJnMWajl1VBXl7FFM20WPYzk31kPMMi4nR0y18kmGlVKf
 tIM+kV8DR/TYvrfz9z8RvseveA58/fWU3UUGv9blHQvEIJnpZydEZWC2KgJkCQHfLq/J
 /49sXZ/ESrE1fjgjmmtI6o/G3xh0jRmT4fymt2NV3arwNSGsXLKUgDMB6JUzUUQ6pjPa
 MsOWpkxeUsmVamLG3XOY6yaZOE9ddO9Azt4Mmhn+vYqzYK8B99CcoM9MlwIvjpplZ6tN
 8p3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=NsW6bhE3jhhDb6OGyNulY9l1vVYB3OpXnDEeg4R99GY=;
 b=KR+D6HRXlqSOmgDHSGty8R4wXXWLqv+fzzs0Ispd91+XeCHJfJ5/cRwH+M3ZrLqNcd
 WnhCsePahuV4yau9IyxMTEKXWJy/gi9a938AyAr24tLSq+DvC+1lTHUBODm8FehLtNuN
 L5WlnME09bn+0OLqSX5Z7uzShFNJXmrazgf5pBtyuBZwc1t07dN4fZR4+8ZU0VadwAeq
 TjRNf+t8wygd7MjDwv5Gpun9sEJNP+qTuvhL3pRPtIAMsYg8LeqFfVkAmDJmlK+9Qsu3
 BLP6od2JVK/hYd9+eSLTJdcWQimMUGkWpDZGYNRqzwe2zlrdIvUSlifwN7qVvHxae7rH
 tc3A==
X-Gm-Message-State: AOAM530HU0MC88eSfYJM0er6RsWAnIc5HZNldqQywiKWGovt77tNNoCa
 8tso5j4K6TCDgZsxDFKgKLLs25isAGM=
X-Google-Smtp-Source: ABdhPJzClEDfLLJG2+5X5VHOLaTDW7VWbYvHbIjFxPaGrIWTc6NPb4VWGW/7UsdbPGUkDjUhsZHkuw==
X-Received: by 2002:aa7:dd8d:: with SMTP id g13mr7692396edv.30.1623945196470; 
 Thu, 17 Jun 2021 08:53:16 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id p13sm4604061edh.79.2021.06.17.08.53.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 08:53:16 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 08/11] machine: add error propagation to mc->smp_parse
Date: Thu, 17 Jun 2021 17:53:05 +0200
Message-Id: <20210617155308.928754-9-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210617155308.928754-1-pbonzini@redhat.com>
References: <20210617155308.928754-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52a.google.com
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
Cc: =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Clean up the smp_parse functions to use Error** instead of exiting.

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
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



