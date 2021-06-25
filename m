Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2DE23B4594
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Jun 2021 16:30:20 +0200 (CEST)
Received: from localhost ([::1]:55222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwmqZ-0006b6-Ck
	for lists+qemu-devel@lfdr.de; Fri, 25 Jun 2021 10:30:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lwmfT-0003pp-E5
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 10:18:51 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:44959)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lwmfR-0003KT-Hj
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 10:18:51 -0400
Received: by mail-ej1-x630.google.com with SMTP id n2so4245030eju.11
 for <qemu-devel@nongnu.org>; Fri, 25 Jun 2021 07:18:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=urD9bcWBtakTOzRVsOR6rO1xdKgztkuvnTLHzYt41Aw=;
 b=QsGpSHoUYQYo73XaCg8AJJD6b4ewtwH8pRBCKP9WH1W3q0Q0Yr3IWLgUirlQcZItjk
 yh/mjyzl9s1H0n1SNAHe3kk06VrPaoXkGtgVCIOC7Cq40PJV++MZ7d4R1ZdG7c38Io6a
 aYU9S2MACzIxKLhjLRzERToDCovH9a7MyhLjmlrN+OuT0AaW9Bl7iWEzUjot1Qxp/tpy
 uUTvEZbCryUBuXKYhuA26c8y72QD53b/eU6vFZ0QC+xIrKNKN014dMOM6HrRhPsbi/Wr
 CK3FxG1aMXJfingFY2b0bkYUQxrYvJmtLx960wj3fi6XKgMxeruvgvxeLtoft9g1yn4l
 P0qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=urD9bcWBtakTOzRVsOR6rO1xdKgztkuvnTLHzYt41Aw=;
 b=QfgnkGp8uaEZsfgUoEY2fvTlTFIZOUOJ6XsK2x2YgWgtXVTipTI3N0AOyauQ9V+m/W
 k2nliL68yH+VvMgG3FXqIj03TU2DZlRo7QG7cIx4Jx5q+mGRTu/+srNYwrSfuoxsluFr
 Z9xjfht5zxOrLu5T1Zh4UYeg7o7JyZDcthXiK5P7271TOWUUDsUKf5OZ1WgH6av8GJfU
 8BBAkipmhrJOrrQ2OLVgR+nhJnwseyriqT6xgpBxeactSOYcfzW5sgljfqV43c88NbRz
 I4t2oeCp2GbX5ASnBvkx8GoskauCY8JFjEy/rPqvzrI40wHINuHyFC4blC5dXrFCnJHq
 XRsg==
X-Gm-Message-State: AOAM533COe48op31rvNjIQwl/bNahiUTnFDbxa55YC484EapUDVbBVCI
 759NLhH8I215XRljkWZ5SAfDScYoZBg=
X-Google-Smtp-Source: ABdhPJxeJ5uFZ+KlWXuRhjU8baE44hb1p97iMqL5PQUJwsMKfuobxeqcZ/ZZVnI86xWjru5a1HnmcQ==
X-Received: by 2002:a17:907:264c:: with SMTP id
 ar12mr11081729ejc.391.1624630728114; 
 Fri, 25 Jun 2021 07:18:48 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id c28sm326579ejc.102.2021.06.25.07.18.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Jun 2021 07:18:47 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 26/28] machine: add error propagation to mc->smp_parse
Date: Fri, 25 Jun 2021 16:18:20 +0200
Message-Id: <20210625141822.1368639-27-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210625141822.1368639-1-pbonzini@redhat.com>
References: <20210625141822.1368639-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x630.google.com
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

Clean up the smp_parse functions to use Error** instead of exiting.

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20210617155308.928754-9-pbonzini@redhat.com>
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



