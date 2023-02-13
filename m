Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A5396941D3
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 10:47:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRVQb-0003Z5-62; Mon, 13 Feb 2023 04:47:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1pRVQV-0003Tb-FT
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 04:47:11 -0500
Received: from mga12.intel.com ([192.55.52.136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1pRVQQ-0002kj-Jn
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 04:47:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676281626; x=1707817626;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wd1xZfhVaYmef066D55fMcnFzYelruSafioU91jmNzE=;
 b=iybsgQCnlXWlGKFTL+IXYETvmAUw8GA+ZtwNytCU9rathj8knkqb7TLS
 OUTbO6dgD5ThBPDl3yyqz4OL0mfaTuzui9N10bAsErBmEqS6WHehgckL4
 hs81na8wGahUe9k3Z0lft8URhzlgKVybu8elpq4w1wdJH+nttw1Rf8aN/
 FeaF5+ZZz9AtJqhKTsYBrfXOkyWuaagIyxfBWDUOhpNqKNHj5lQT8Xr5m
 10dlWuHOLeyy25Acx6NOxvRF1qZk83KigMsirvn78YPXtW7U/Yjc7+T8u
 wuttzrpprH6NeRu/jQD90B8qN3P6t1CLGfSaOi7CADzgJ77ciKhGrbO96 g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="310487269"
X-IronPort-AV: E=Sophos;i="5.97,293,1669104000"; d="scan'208";a="310487269"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2023 01:46:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="670760685"
X-IronPort-AV: E=Sophos;i="5.97,293,1669104000"; d="scan'208";a="670760685"
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.112])
 by fmsmga007.fm.intel.com with ESMTP; 13 Feb 2023 01:46:08 -0800
From: Zhao Liu <zhao1.liu@linux.intel.com>
To: Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, Zhenyu Wang <zhenyu.z.wang@intel.com>,
 Dapeng Mi <dapeng1.mi@intel.com>,
 Zhuocheng Ding <zhuocheng.ding@intel.com>,
 Robert Hoo <robert.hu@linux.intel.com>,
 Sean Christopherson <seanjc@google.com>, Like Xu <like.xu.linux@gmail.com>,
 Zhao Liu <zhao1.liu@intel.com>
Subject: [RFC 48/52] machine: Support "-hybrid" command
Date: Mon, 13 Feb 2023 17:50:31 +0800
Message-Id: <20230213095035.158240-49-zhao1.liu@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230213095035.158240-1-zhao1.liu@linux.intel.com>
References: <20230213095035.158240-1-zhao1.liu@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=192.55.52.136;
 envelope-from=zhao1.liu@linux.intel.com; helo=mga12.intel.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Zhao Liu <zhao1.liu@intel.com>

Add "-hybrid" command parsing.

And now we have reason to move MachineState.topo initialization to its
original place [1], because we can't know whcih topologies should be
initialized before collecting all commands.

If "-hybrid" is set, initialize MachineState.topo as hybrid topology.
Otherwise, use smp topology as default.

[1]: 8b0e484 (machine: move SMP initialization from vl.c)

Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
---
 hw/core/machine-topo.c | 41 ++++++++++++++++++++++++++++++++++++++++-
 hw/core/machine.c      | 11 -----------
 include/hw/boards.h    |  1 +
 qemu-options.hx        |  7 +++++++
 softmmu/vl.c           | 33 +++++++++++++++++++++++++++++++++
 5 files changed, 81 insertions(+), 12 deletions(-)

diff --git a/hw/core/machine-topo.c b/hw/core/machine-topo.c
index 9e37de04ce75..f38b8c683026 100644
--- a/hw/core/machine-topo.c
+++ b/hw/core/machine-topo.c
@@ -177,6 +177,33 @@ unsigned int machine_topo_get_threads_per_socket(const MachineState *ms)
     return ms->topo.max_cpus / sockets;
 }
 
+void machine_init_topology_default(MachineState *ms, bool smp)
+{
+    MachineClass *mc = MACHINE_GET_CLASS(ms);
+
+    if (smp) {
+        /* default to mc->default_cpus */
+        ms->topo.cpus = mc->default_cpus;
+        ms->topo.max_cpus = mc->default_cpus;
+
+        ms->topo.topo_type = CPU_TOPO_TYPE_SMP;
+        ms->topo.smp.sockets = 1;
+        ms->topo.smp.dies = 1;
+        ms->topo.smp.clusters = 1;
+        ms->topo.smp.cores = 1;
+        ms->topo.smp.threads = 1;
+    } else {
+        ms->topo.cpus = 0;
+        ms->topo.max_cpus = 0;
+
+        ms->topo.topo_type = CPU_TOPO_TYPE_HYBRID;
+        ms->topo.hybrid.sockets = 1;
+        ms->topo.hybrid.dies = 1;
+        ms->topo.hybrid.clusters = 1;
+        ms->topo.hybrid.cluster_list = NULL;
+    }
+}
+
 /*
  * Report information of a machine's supported CPU topology hierarchy.
  * Topology members will be ordered from the largest to the smallest
@@ -231,6 +258,12 @@ void machine_parse_smp_config(MachineState *ms,
                               const SMPConfiguration *config, Error **errp)
 {
     MachineClass *mc = MACHINE_GET_CLASS(ms);
+
+    if (!machine_topo_is_smp(ms)) {
+        error_setg(errp, "Cannot set smp and hybrid at the same time");
+        return;
+    }
+
     unsigned cpus    = config->has_cpus ? config->cpus : 0;
     unsigned sockets = config->has_sockets ? config->sockets : 0;
     unsigned dies    = config->has_dies ? config->dies : 0;
@@ -608,8 +641,14 @@ static int parse_hybrid(void *opaque, QemuOpts *opts, Error **errp)
     g_autoptr(HybridOptions) config = NULL;
     MachineState *ms = MACHINE(opaque);
     Error *err = NULL;
-    Visitor *v = opts_visitor_new(opts);
+    Visitor *v;
+
+    if (machine_topo_is_smp(ms)) {
+        error_setg(errp, "Cannot set hybrid and smp at the same time");
+        return -1;
+    }
 
+    v = opts_visitor_new(opts);
     visit_type_HybridOptions(v, NULL, &config, errp);
     visit_free(v);
     if (!config) {
diff --git a/hw/core/machine.c b/hw/core/machine.c
index 08a0c117ce1b..212749f984d6 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -1093,17 +1093,6 @@ static void machine_initfn(Object *obj)
                                         "Table (HMAT)");
     }
 
-    /* default to mc->default_cpus */
-    ms->topo.cpus = mc->default_cpus;
-    ms->topo.max_cpus = mc->default_cpus;
-
-    ms->topo.topo_type = CPU_TOPO_TYPE_SMP;
-    ms->topo.smp.sockets = 1;
-    ms->topo.smp.dies = 1;
-    ms->topo.smp.clusters = 1;
-    ms->topo.smp.cores = 1;
-    ms->topo.smp.threads = 1;
-
     machine_copy_boot_config(ms, &(BootConfiguration){ 0 });
 }
 
diff --git a/include/hw/boards.h b/include/hw/boards.h
index 0395990139bc..c93bb1206244 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -41,6 +41,7 @@ void parse_hybrid_opts(MachineState *ms);
 void machine_free_hybrid_topology(MachineState *ms);
 void machine_validate_hybrid_topology(MachineState *ms, Error **errp);
 void machine_consolidate_hybrid_topology(MachineState *ms);
+void machine_init_topology_default(MachineState *ms, bool smp);
 
 /**
  * machine_class_allow_dynamic_sysbus_dev: Add type to list of valid devices
diff --git a/qemu-options.hx b/qemu-options.hx
index 3caf9da4c3af..8987972a8d5f 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -5605,6 +5605,13 @@ SRST
             (qemu) qom-set /objects/iothread1 poll-max-ns 100000
 ERST
 
+DEF("hybrid", HAS_ARG, QEMU_OPTION_hybrid,
+    "-hybrid socket,sockets=n"
+    "-hybrid die,dies=n"
+    "-hybrid cluster,clusters=n"
+    "-hybrid core,cores=n,coretype=core_type[,threads=threads][,clusterid=cluster]",
+    QEMU_ARCH_ALL)
+
 
 HXCOMM This is the last statement. Insert new options before this line!
 
diff --git a/softmmu/vl.c b/softmmu/vl.c
index 0547ad390f52..ce5e021006f8 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -500,6 +500,13 @@ static QemuOptsList qemu_action_opts = {
     },
 };
 
+static QemuOptsList qemu_hybrid_opts = {
+    .name = "hybrid",
+    .implied_opt_name = "type",
+    .head = QTAILQ_HEAD_INITIALIZER(qemu_hybrid_opts.head),
+    .desc = { { 0 } } /* validated with OptsVisitor */
+};
+
 const char *qemu_get_vm_name(void)
 {
     return qemu_name;
@@ -2010,6 +2017,17 @@ static void parse_memory_options(void)
     loc_pop(&loc);
 }
 
+static void qemu_machine_init_topology(MachineState *machine)
+{
+    bool is_smp = true;
+    QemuOptsList *list = qemu_find_opts("hybrid");
+
+    if (!QTAILQ_EMPTY(&list->head)) {
+        is_smp = false;
+    }
+    machine_init_topology_default(machine, is_smp);
+}
+
 static void qemu_create_machine(QDict *qdict)
 {
     MachineClass *machine_class = select_machine(qdict, &error_fatal);
@@ -2038,6 +2056,12 @@ static void qemu_create_machine(QDict *qdict)
         qemu_set_hw_version(machine_class->hw_version);
     }
 
+    /*
+     * Initialize cpu topology. If hybrid is set, initialize as hybrid
+     * topology. Otherwise, initialize as smp topology.
+     */
+    qemu_machine_init_topology(current_machine);
+
     /*
      * Get the default machine options from the machine if it is not already
      * specified either by the configuration file or by the command line.
@@ -2667,6 +2691,7 @@ void qemu_init(int argc, char **argv)
     qemu_add_opts(&qemu_semihosting_config_opts);
     qemu_add_opts(&qemu_fw_cfg_opts);
     qemu_add_opts(&qemu_action_opts);
+    qemu_add_opts(&qemu_hybrid_opts);
     module_call_init(MODULE_INIT_OPTS);
 
     error_init(argv[0]);
@@ -3489,6 +3514,13 @@ void qemu_init(int argc, char **argv)
             case QEMU_OPTION_nouserconfig:
                 /* Nothing to be parsed here. Especially, do not error out below. */
                 break;
+            case QEMU_OPTION_hybrid:
+                opts = qemu_opts_parse_noisily(qemu_find_opts("hybrid"),
+                                               optarg, true);
+                if (!opts) {
+                    exit(1);
+                }
+                break;
             default:
                 if (os_parse_cmd_args(popt->index, optarg)) {
                     error_report("Option not supported in this build");
@@ -3598,6 +3630,7 @@ void qemu_init(int argc, char **argv)
 
     qemu_resolve_machine_memdev();
     parse_numa_opts(current_machine);
+    parse_hybrid_opts(current_machine);
 
     if (vmstate_dump_file) {
         /* dump and exit */
-- 
2.34.1


