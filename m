Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF89B420097
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Oct 2021 09:57:06 +0200 (CEST)
Received: from localhost ([::1]:54576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWwMr-0008Rs-Sb
	for lists+qemu-devel@lfdr.de; Sun, 03 Oct 2021 03:57:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mWw9J-0003Wg-Kp
 for qemu-devel@nongnu.org; Sun, 03 Oct 2021 03:43:05 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:36721)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mWw9H-0000rl-5L
 for qemu-devel@nongnu.org; Sun, 03 Oct 2021 03:43:05 -0400
Received: by mail-ed1-x52a.google.com with SMTP id l7so28172549edq.3
 for <qemu-devel@nongnu.org>; Sun, 03 Oct 2021 00:43:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fpK85ZIjHJ05jxJoXDyWdj2igy2Sl/lx3Pqb1u/G/W0=;
 b=MRDZdGwkQZTr4e6B83ex6nUcvslpxIAV9xascsN8sARDFACzIwwVoTd/rYByh8wfxj
 qr4XwqADYHtyrz19/RTU0wL6UFn8RxFkGq7SbUe4SDjKJtNFiHJhdUpdFEus9he7kO+u
 IgMj6MS0dC+GFbJGy4yjLwhcnxcT8gFK/D03GtygnwNQw8M9yCV68bB6KoNZdEnhAr71
 7TSbS5aiysRnbI9vrctNzOuB2LOwopM1orTG9eqSJU2A75eAmKdWKCUk9MDuZkp6Gz/E
 NMTMRTICIhcO2ehJ2rZZbQjN/YrJGQV6WcDyWA4JLkxB8yxQXZsPcrddvkS3/vd8sNVy
 0zAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=fpK85ZIjHJ05jxJoXDyWdj2igy2Sl/lx3Pqb1u/G/W0=;
 b=57847Mrq4IfdPwq0B4iljXM/q6IPQKmd6quRy967TUtQmzfq15uTFaG/5bBGY0g88O
 rbpRV+LzjEgCfTAltkyhF30txA1DQnRXxMNH/zibl6plNlaMnJasM/a2DrEcLX2PtJ1J
 XNchwBlhGbxK7A54jK+fzQZVKJ37NeH/cnqd3vpHZvfHWpHHtDeN/PBTikxa06jcrfBA
 GpH/WfJUk7N7OtD/ScCNWsjz+yezY71P1RSFAXlnvGLxLeoYU0CdTMo1mPc5lrx125jd
 P7jqQ22viz4jFE/f+0lPuslH2isoJX+wG8gPRjFoRLEe4milZebBheJuUU2sK85bRhnF
 QnWw==
X-Gm-Message-State: AOAM5314ey2rVSadr7I3nSss0PFtYn6mwDmGPVVibJayqVQ6SNQWuNNt
 PfuWI9AtZ9YBfpvAGEvTHKOpwIV56Bc=
X-Google-Smtp-Source: ABdhPJwxLqePI8fRu0mcQ3o6hef0iRCVml1rWtL/tj4gR840QA27Y5WRuWBUnMJ86sqgI/0kp7PwNw==
X-Received: by 2002:a05:6402:2793:: with SMTP id
 b19mr9737501ede.291.1633246981725; 
 Sun, 03 Oct 2021 00:43:01 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id n6sm5560856eds.10.2021.10.03.00.43.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Oct 2021 00:43:01 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 12/30] machine: Make smp_parse generic enough for all arches
Date: Sun,  3 Oct 2021 09:42:32 +0200
Message-Id: <20211003074250.60869-13-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211003074250.60869-1-pbonzini@redhat.com>
References: <20211003074250.60869-1-pbonzini@redhat.com>
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
Cc: Yanan Wang <wangyanan55@huawei.com>, Andrew Jones <drjones@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Yanan Wang <wangyanan55@huawei.com>

Currently the only difference between smp_parse and pc_smp_parse
is the support of dies parameter and the related error reporting.
With some arch compat variables like "bool dies_supported", we can
make smp_parse generic enough for all arches and the PC specific
one can be removed.

Making smp_parse() generic enough can reduce code duplication and
ease the code maintenance, and also allows extending the topology
with more arch specific members (e.g., clusters) in the future.

Suggested-by: Andrew Jones <drjones@redhat.com>
Suggested-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20210929025816.21076-13-wangyanan55@huawei.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/core/machine.c   | 91 +++++++++++++++++++++++++++++++++++----------
 hw/i386/pc.c        | 84 +----------------------------------------
 include/hw/boards.h |  9 +++++
 3 files changed, 81 insertions(+), 103 deletions(-)

diff --git a/hw/core/machine.c b/hw/core/machine.c
index 83cbdcce47..12872d7715 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -746,20 +746,69 @@ void machine_set_cpu_numa_node(MachineState *machine,
     }
 }
 
+/*
+ * Report information of a machine's supported CPU topology hierarchy.
+ * Topology members will be ordered from the largest to the smallest
+ * in the string.
+ */
+static char *cpu_hierarchy_to_string(MachineState *ms)
+{
+    MachineClass *mc = MACHINE_GET_CLASS(ms);
+    GString *s = g_string_new(NULL);
+
+    g_string_append_printf(s, "sockets (%u)", ms->smp.sockets);
+
+    if (mc->smp_props.dies_supported) {
+        g_string_append_printf(s, " * dies (%u)", ms->smp.dies);
+    }
+
+    g_string_append_printf(s, " * cores (%u)", ms->smp.cores);
+    g_string_append_printf(s, " * threads (%u)", ms->smp.threads);
+
+    return g_string_free(s, false);
+}
+
+/*
+ * smp_parse - Generic function used to parse the given SMP configuration
+ *
+ * Any missing parameter in "cpus/maxcpus/sockets/cores/threads" will be
+ * automatically computed based on the provided ones.
+ *
+ * In the calculation of omitted sockets/cores/threads: we prefer sockets
+ * over cores over threads before 6.2, while preferring cores over sockets
+ * over threads since 6.2.
+ *
+ * In the calculation of cpus/maxcpus: When both maxcpus and cpus are omitted,
+ * maxcpus will be computed from the given parameters and cpus will be set
+ * equal to maxcpus. When only one of maxcpus and cpus is given then the
+ * omitted one will be set to its given counterpart's value. Both maxcpus and
+ * cpus may be specified, but maxcpus must be equal to or greater than cpus.
+ *
+ * For compatibility, apart from the parameters that will be computed, newly
+ * introduced topology members which are likely to be target specific should
+ * be directly set as 1 if they are omitted (e.g. dies for PC since 4.1).
+ */
 static void smp_parse(MachineState *ms, SMPConfiguration *config, Error **errp)
 {
     MachineClass *mc = MACHINE_GET_CLASS(ms);
     unsigned cpus    = config->has_cpus ? config->cpus : 0;
     unsigned sockets = config->has_sockets ? config->sockets : 0;
+    unsigned dies    = config->has_dies ? config->dies : 0;
     unsigned cores   = config->has_cores ? config->cores : 0;
     unsigned threads = config->has_threads ? config->threads : 0;
     unsigned maxcpus = config->has_maxcpus ? config->maxcpus : 0;
 
-    if (config->has_dies && config->dies > 1) {
+    /*
+     * If not supported by the machine, a topology parameter must be
+     * omitted or specified equal to 1.
+     */
+    if (!mc->smp_props.dies_supported && dies > 1) {
         error_setg(errp, "dies not supported by this machine's CPU topology");
         return;
     }
 
+    dies = dies > 0 ? dies : 1;
+
     /* compute missing values based on the provided ones */
     if (cpus == 0 && maxcpus == 0) {
         sockets = sockets > 0 ? sockets : 1;
@@ -773,55 +822,57 @@ static void smp_parse(MachineState *ms, SMPConfiguration *config, Error **errp)
             if (sockets == 0) {
                 cores = cores > 0 ? cores : 1;
                 threads = threads > 0 ? threads : 1;
-                sockets = maxcpus / (cores * threads);
+                sockets = maxcpus / (dies * cores * threads);
             } else if (cores == 0) {
                 threads = threads > 0 ? threads : 1;
-                cores = maxcpus / (sockets * threads);
+                cores = maxcpus / (sockets * dies * threads);
             }
         } else {
             /* prefer cores over sockets since 6.2 */
             if (cores == 0) {
                 sockets = sockets > 0 ? sockets : 1;
                 threads = threads > 0 ? threads : 1;
-                cores = maxcpus / (sockets * threads);
+                cores = maxcpus / (sockets * dies * threads);
             } else if (sockets == 0) {
                 threads = threads > 0 ? threads : 1;
-                sockets = maxcpus / (cores * threads);
+                sockets = maxcpus / (dies * cores * threads);
             }
         }
 
         /* try to calculate omitted threads at last */
         if (threads == 0) {
-            threads = maxcpus / (sockets * cores);
+            threads = maxcpus / (sockets * dies * cores);
         }
     }
 
-    maxcpus = maxcpus > 0 ? maxcpus : sockets * cores * threads;
+    maxcpus = maxcpus > 0 ? maxcpus : sockets * dies * cores * threads;
     cpus = cpus > 0 ? cpus : maxcpus;
 
-    if (sockets * cores * threads != maxcpus) {
+    ms->smp.cpus = cpus;
+    ms->smp.sockets = sockets;
+    ms->smp.dies = dies;
+    ms->smp.cores = cores;
+    ms->smp.threads = threads;
+    ms->smp.max_cpus = maxcpus;
+
+    /* sanity-check of the computed topology */
+    if (sockets * dies * cores * threads != maxcpus) {
+        g_autofree char *topo_msg = cpu_hierarchy_to_string(ms);
         error_setg(errp, "Invalid CPU topology: "
                    "product of the hierarchy must match maxcpus: "
-                   "sockets (%u) * cores (%u) * threads (%u) "
-                   "!= maxcpus (%u)",
-                   sockets, cores, threads, maxcpus);
+                   "%s != maxcpus (%u)",
+                   topo_msg, maxcpus);
         return;
     }
 
     if (maxcpus < cpus) {
+        g_autofree char *topo_msg = cpu_hierarchy_to_string(ms);
         error_setg(errp, "Invalid CPU topology: "
                    "maxcpus must be equal to or greater than smp: "
-                   "sockets (%u) * cores (%u) * threads (%u) "
-                   "== maxcpus (%u) < smp_cpus (%u)",
-                   sockets, cores, threads, maxcpus, cpus);
+                   "%s == maxcpus (%u) < smp_cpus (%u)",
+                   topo_msg, maxcpus, cpus);
         return;
     }
-
-    ms->smp.cpus = cpus;
-    ms->smp.sockets = sockets;
-    ms->smp.cores = cores;
-    ms->smp.threads = threads;
-    ms->smp.max_cpus = maxcpus;
 }
 
 static void machine_get_smp(Object *obj, Visitor *v, const char *name,
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 6cc32f4048..28e1b83b9d 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -710,88 +710,6 @@ void pc_acpi_smi_interrupt(void *opaque, int irq, int level)
     }
 }
 
-/*
- * This function is very similar to smp_parse()
- * in hw/core/machine.c but includes CPU die support.
- */
-static void pc_smp_parse(MachineState *ms, SMPConfiguration *config, Error **errp)
-{
-    MachineClass *mc = MACHINE_GET_CLASS(ms);
-    unsigned cpus    = config->has_cpus ? config->cpus : 0;
-    unsigned sockets = config->has_sockets ? config->sockets : 0;
-    unsigned dies    = config->has_dies ? config->dies : 0;
-    unsigned cores   = config->has_cores ? config->cores : 0;
-    unsigned threads = config->has_threads ? config->threads : 0;
-    unsigned maxcpus = config->has_maxcpus ? config->maxcpus : 0;
-
-    /* directly default dies to 1 if it's omitted */
-    dies = dies > 0 ? dies : 1;
-
-    /* compute missing values based on the provided ones */
-    if (cpus == 0 && maxcpus == 0) {
-        sockets = sockets > 0 ? sockets : 1;
-        cores = cores > 0 ? cores : 1;
-        threads = threads > 0 ? threads : 1;
-    } else {
-        maxcpus = maxcpus > 0 ? maxcpus : cpus;
-
-        if (mc->smp_prefer_sockets) {
-            /* prefer sockets over cores before 6.2 */
-            if (sockets == 0) {
-                cores = cores > 0 ? cores : 1;
-                threads = threads > 0 ? threads : 1;
-                sockets = maxcpus / (dies * cores * threads);
-            } else if (cores == 0) {
-                threads = threads > 0 ? threads : 1;
-                cores = maxcpus / (sockets * dies * threads);
-            }
-        } else {
-            /* prefer cores over sockets since 6.2 */
-            if (cores == 0) {
-                sockets = sockets > 0 ? sockets : 1;
-                threads = threads > 0 ? threads : 1;
-                cores = maxcpus / (sockets * dies * threads);
-            } else if (sockets == 0) {
-                threads = threads > 0 ? threads : 1;
-                sockets = maxcpus / (dies * cores * threads);
-            }
-        }
-
-        /* try to calculate omitted threads at last */
-        if (threads == 0) {
-            threads = maxcpus / (sockets * dies * cores);
-        }
-    }
-
-    maxcpus = maxcpus > 0 ? maxcpus : sockets * dies * cores * threads;
-    cpus = cpus > 0 ? cpus : maxcpus;
-
-    if (sockets * dies * cores * threads != maxcpus) {
-        error_setg(errp, "Invalid CPU topology: "
-                   "product of the hierarchy must match maxcpus: "
-                   "sockets (%u) * dies (%u) * cores (%u) * threads (%u) "
-                   "!= maxcpus (%u)",
-                   sockets, dies, cores, threads, maxcpus);
-        return;
-    }
-
-    if (maxcpus < cpus) {
-        error_setg(errp, "Invalid CPU topology: "
-                   "maxcpus must be equal to or greater than smp: "
-                   "sockets (%u) * dies (%u) * cores (%u) * threads (%u) "
-                   "== maxcpus (%u) < smp_cpus (%u)",
-                   sockets, dies, cores, threads, maxcpus, cpus);
-        return;
-    }
-
-    ms->smp.cpus = cpus;
-    ms->smp.sockets = sockets;
-    ms->smp.dies = dies;
-    ms->smp.cores = cores;
-    ms->smp.threads = threads;
-    ms->smp.max_cpus = maxcpus;
-}
-
 static
 void pc_machine_done(Notifier *notifier, void *data)
 {
@@ -1755,7 +1673,6 @@ static void pc_machine_class_init(ObjectClass *oc, void *data)
     mc->auto_enable_numa_with_memdev = true;
     mc->has_hotpluggable_cpus = true;
     mc->default_boot_order = "cad";
-    mc->smp_parse = pc_smp_parse;
     mc->block_default_type = IF_IDE;
     mc->max_cpus = 255;
     mc->reset = pc_machine_reset;
@@ -1766,6 +1683,7 @@ static void pc_machine_class_init(ObjectClass *oc, void *data)
     hc->unplug = pc_machine_device_unplug_cb;
     mc->default_cpu_type = TARGET_DEFAULT_CPU_TYPE;
     mc->nvdimm_supported = true;
+    mc->smp_props.dies_supported = true;
     mc->default_ram_id = "pc.ram";
 
     object_class_property_add(oc, PC_MACHINE_MAX_RAM_BELOW_4G, "size",
diff --git a/include/hw/boards.h b/include/hw/boards.h
index 2a1bba86c0..72a23e4e0f 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -108,6 +108,14 @@ typedef struct {
     CPUArchId cpus[];
 } CPUArchIdList;
 
+/**
+ * SMPCompatProps:
+ * @dies_supported - whether dies are supported by the machine
+ */
+typedef struct {
+    bool dies_supported;
+} SMPCompatProps;
+
 /**
  * MachineClass:
  * @deprecation_reason: If set, the machine is marked as deprecated. The
@@ -248,6 +256,7 @@ struct MachineClass {
     bool numa_mem_supported;
     bool auto_enable_numa;
     bool smp_prefer_sockets;
+    SMPCompatProps smp_props;
     const char *default_ram_id;
 
     HotplugHandler *(*get_hotplug_handler)(MachineState *machine,
-- 
2.31.1



