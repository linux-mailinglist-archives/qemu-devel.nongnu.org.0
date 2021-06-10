Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A72743A2D4D
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 15:42:45 +0200 (CEST)
Received: from localhost ([::1]:38088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrKxI-0007jV-Mq
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 09:42:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lrKqg-0001iX-7e
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 09:35:55 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:54809)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lrKqd-0005gG-Hm
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 09:35:53 -0400
Received: by mail-wm1-x329.google.com with SMTP id m3so966435wms.4
 for <qemu-devel@nongnu.org>; Thu, 10 Jun 2021 06:35:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oaLUCvek2OmNr6/JtAkUEqBmw58D1m2VU8lWk8Kuo/k=;
 b=WR9L9d0X9T5TedhasZu/4Rprgbelx3ipb7lYwfiawEZNqqDF927+zHJs1qT8a6nM9+
 cAGI61t71gNdROiHD4ILL7lwnY/L9JdJilgPLtrVvZb+OcTFuhe1if/YGQUUeSXkoTXq
 nMaF/58HoPa7y5i0En6uxvvO2TY9rUr1Z0VvsWMZFzk1WCo2+c8Eyi+lX38e/cenZNEt
 lB8/iXKMnspcnoa0xIDyXrNYYwiWw+9vZcQ1f0m+9yjxP87mZArPZWaaW7YF29jqZIWm
 nXkEw77dHYQQbnfLIWJ4e1o3d7NuZMcAJq+NUVfOG+GN96sLWENJFPrBjgJsKeLT2cdB
 dvtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=oaLUCvek2OmNr6/JtAkUEqBmw58D1m2VU8lWk8Kuo/k=;
 b=cPFGP6IfFjA0KwqzwmKuOLeyindy+6+dtNfaf5qCTAfMRUuJ0QUBdPTU5+OEJ0Ienl
 U/PIZq7ynrsAoiOW6HEOuFRurWmmoTDCZNemnjTzpx5HMICyyyhIVHPSvEu5bAg/5/Hq
 mxeNBL5siIrxl1w2ILkn30x/l6MyYGadsBXe8Cy716dCqDsrHjzjtDd/fj0XcQnVN89o
 2atbpFuEM19h7LgAkUrzzRBTmBHoJTTkbUIlSJQ6i0mllJy64t9wWv9vEFJ/jwZsj6PQ
 nOhO5+ZBlu57eIQ4yP0PFCb5tpc8FprXM2U6TrloHTlYj0DzMYIQHK4Q6Vu6/QE+63uT
 8zfA==
X-Gm-Message-State: AOAM533kle9WAo8TrjXit3LIFmtOAvbG5mKBRe1xIECjv/hm2scjoWhx
 Z6GfAfa//URdmXjP1Pp4jmD+1x9sRgIc0g==
X-Google-Smtp-Source: ABdhPJxuvuubkGCCwk2PN51iEPNQaDbhr774mj3nKi97abZZCbxHhzIByd1Uzk+SO18YXquZgSiyrw==
X-Received: by 2002:a05:600c:3790:: with SMTP id
 o16mr15164681wmr.41.1623332147335; 
 Thu, 10 Jun 2021 06:35:47 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id
 v8sm4032519wrc.29.2021.06.10.06.35.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jun 2021 06:35:46 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 08/11] machine: add error propagation to mc->smp_parse
Date: Thu, 10 Jun 2021 15:35:35 +0200
Message-Id: <20210610133538.608390-9-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210610133538.608390-1-pbonzini@redhat.com>
References: <20210610133538.608390-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x329.google.com
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



