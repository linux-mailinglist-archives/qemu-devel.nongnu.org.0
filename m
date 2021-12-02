Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 821604668F0
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Dec 2021 18:15:15 +0100 (CET)
Received: from localhost ([::1]:47746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mspfu-0002ak-Gy
	for lists+qemu-devel@lfdr.de; Thu, 02 Dec 2021 12:15:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangy81@chinatelecom.cn>)
 id 1mspc7-0004as-E5
 for qemu-devel@nongnu.org; Thu, 02 Dec 2021 12:11:19 -0500
Received: from prt-mail.chinatelecom.cn ([42.123.76.226]:48167
 helo=chinatelecom.cn) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huangy81@chinatelecom.cn>) id 1mspc3-0001X7-6w
 for qemu-devel@nongnu.org; Thu, 02 Dec 2021 12:11:19 -0500
HMM_SOURCE_IP: 172.18.0.218:55170.1170008821
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-125.69.41.245 (unknown [172.18.0.218])
 by chinatelecom.cn (HERMES) with SMTP id 8E8BB2800AE;
 Fri,  3 Dec 2021 01:11:06 +0800 (CST)
X-189-SAVE-TO-SEND: +huangy81@chinatelecom.cn
Received: from  ([172.18.0.218])
 by app0025 with ESMTP id 0b3292cc32f24bff903f7ae834cb6b1c for
 qemu-devel@nongnu.org; Fri, 03 Dec 2021 01:11:12 CST
X-Transaction-ID: 0b3292cc32f24bff903f7ae834cb6b1c
X-Real-From: huangy81@chinatelecom.cn
X-Receive-IP: 172.18.0.218
X-MEDUSA-Status: 0
From: huangy81@chinatelecom.cn
To: qemu-devel <qemu-devel@nongnu.org>
Subject: [PATCH v8 3/3] cpus-common: implement dirty page limit on vCPU
Date: Fri,  3 Dec 2021 01:10:57 +0800
Message-Id: <c20e96b3c5a3f936483de636ec17d811d5b08f06.1638464552.git.huangy81@chinatelecom.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1638463260.git.huangy81@chinatelecom.cn>
References: <cover.1638463260.git.huangy81@chinatelecom.cn>
In-Reply-To: <cover.1638464552.git.huangy81@chinatelecom.cn>
References: <cover.1638464552.git.huangy81@chinatelecom.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=42.123.76.226;
 envelope-from=huangy81@chinatelecom.cn; helo=chinatelecom.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Juan Quintela <quintela@redhat.com>, Hyman <huangy81@chinatelecom.cn>,
 David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus ArmBruster <armbru@redhat.com>, Peter Xu <peterx@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>

Implement dirtyrate calculation periodically basing on
dirty-ring and throttle vCPU until it reachs the quota
dirty page rate given by user.

Introduce qmp commands "vcpu-dirty-limit", "query-vcpu-dirty-limit"
to enable, disable, query dirty page limit for virtual CPU.

Meanwhile, introduce corresponding hmp commands "vcpu_dirty_limit",
"info vcpu_dirty_limit" so developers can play with them easier.

Signed-off-by: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
---
 cpus-common.c         | 149 ++++++++++++++++++++++++++++++++++++++++++++++++++
 hmp-commands-info.hx  |  13 +++++
 hmp-commands.hx       |  16 ++++++
 include/hw/core/cpu.h |   9 +++
 include/monitor/hmp.h |   2 +
 qapi/migration.json   |  48 ++++++++++++++++
 softmmu/vl.c          |   1 +
 7 files changed, 238 insertions(+)

diff --git a/cpus-common.c b/cpus-common.c
index 6e73d3e..04b9bc9 100644
--- a/cpus-common.c
+++ b/cpus-common.c
@@ -23,6 +23,14 @@
 #include "hw/core/cpu.h"
 #include "sysemu/cpus.h"
 #include "qemu/lockable.h"
+#include "sysemu/dirtylimit.h"
+#include "sysemu/cpu-throttle.h"
+#include "sysemu/kvm.h"
+#include "monitor/hmp.h"
+#include "monitor/monitor.h"
+#include "qapi/qmp/qdict.h"
+#include "qapi/error.h"
+#include "qapi/qapi-commands-migration.h"
 
 static QemuMutex qemu_cpu_list_lock;
 static QemuCond exclusive_cond;
@@ -352,3 +360,144 @@ void process_queued_cpu_work(CPUState *cpu)
     qemu_mutex_unlock(&cpu->work_mutex);
     qemu_cond_broadcast(&qemu_work_cond);
 }
+
+void qmp_vcpu_dirty_limit(int64_t cpu_index,
+                          bool enable,
+                          uint64_t dirty_rate,
+                          Error **errp)
+{
+    if (!kvm_enabled() || !kvm_dirty_ring_enabled()) {
+        error_setg(errp, "dirty page limit feature requires KVM with"
+                   " accelerator property 'dirty-ring-size' set'");
+        return;
+    }
+
+    if (!dirtylimit_is_vcpu_index_valid(cpu_index)) {
+        error_setg(errp, "cpu index out of range");
+        return;
+    }
+
+    if (enable) {
+        dirtylimit_calc();
+        dirtylimit_vcpu(cpu_index, dirty_rate);
+    } else {
+        if (!dirtylimit_enabled(cpu_index)) {
+            error_setg(errp, "dirty page limit for CPU %ld not set",
+                       cpu_index);
+            return;
+        }
+
+        if (!dirtylimit_cancel_vcpu(cpu_index)) {
+            dirtylimit_calc_quit();
+        }
+    }
+}
+
+void hmp_vcpu_dirty_limit(Monitor *mon, const QDict *qdict)
+{
+    int64_t cpu_index = qdict_get_try_int(qdict, "cpu_index", -1);
+    int64_t dirty_rate = qdict_get_try_int(qdict, "dirty_rate", -1);
+    bool enable = qdict_get_bool(qdict, "enable");
+    Error *err = NULL;
+
+    if (enable && dirty_rate < 0) {
+        monitor_printf(mon, "Enabling dirty limit requires dirty_rate set!\n");
+        return;
+    }
+
+    if (!dirtylimit_is_vcpu_index_valid(cpu_index)) {
+        monitor_printf(mon, "Incorrect cpu index specified!\n");
+        return;
+    }
+
+    qmp_vcpu_dirty_limit(cpu_index, enable, dirty_rate, &err);
+
+    if (err) {
+        hmp_handle_error(mon, err);
+        return;
+    }
+
+    monitor_printf(mon, "Enabling dirty page rate limit with %"PRIi64
+                   " MB/s\n", dirty_rate);
+
+    monitor_printf(mon, "[Please use 'info vcpu_dirty_limit' to query "
+                   "dirty limit for virtual CPU]\n");
+}
+
+struct DirtyLimitInfoList *qmp_query_vcpu_dirty_limit(bool has_cpu_index,
+                                                      int64_t cpu_index,
+                                                      Error **errp)
+{
+    DirtyLimitInfo *info = NULL;
+    DirtyLimitInfoList *head = NULL, **tail = &head;
+
+    if (has_cpu_index &&
+        (!dirtylimit_is_vcpu_index_valid(cpu_index))) {
+        error_setg(errp, "cpu index out of range");
+        return NULL;
+    }
+
+    if (has_cpu_index) {
+        info = dirtylimit_query_vcpu(cpu_index);
+        QAPI_LIST_APPEND(tail, info);
+    } else {
+        CPUState *cpu;
+        CPU_FOREACH(cpu) {
+            if (!cpu->unplug) {
+                info = dirtylimit_query_vcpu(cpu->cpu_index);
+                QAPI_LIST_APPEND(tail, info);
+            }
+        }
+    }
+
+    return head;
+}
+
+void hmp_info_vcpu_dirty_limit(Monitor *mon, const QDict *qdict)
+{
+    DirtyLimitInfoList *limit, *head, *info = NULL;
+    int64_t cpu_index = qdict_get_try_int(qdict, "cpu_index", -1);
+    Error *err = NULL;
+
+    if (cpu_index >=0 &&
+        !dirtylimit_is_vcpu_index_valid(cpu_index)) {
+        monitor_printf(mon, "cpu index out of range\n");
+        return;
+    }
+
+    if (cpu_index < 0) {
+        info = qmp_query_vcpu_dirty_limit(false, -1, &err);
+    } else {
+        info = qmp_query_vcpu_dirty_limit(true, cpu_index, &err);
+    }
+
+    if (err) {
+        hmp_handle_error(mon, err);
+        return;
+    }
+
+    head = info;
+    for (limit = head; limit != NULL; limit = limit->next) {
+        monitor_printf(mon, "vcpu[%"PRIi64"], Enable: %s",
+                       limit->value->cpu_index,
+                       limit->value->enable ? "true" : "false");
+        if (limit->value->enable) {
+            monitor_printf(mon, ", limit rate %"PRIi64 " (MB/s),"
+                           " current rate %"PRIi64 " (MB/s)\n",
+                           limit->value->limit_rate,
+                           limit->value->current_rate);
+        } else {
+            monitor_printf(mon, "\n");
+        }
+    }
+}
+
+void dirtylimit_setup(int max_cpus)
+{
+    if (!kvm_enabled() || !kvm_dirty_ring_enabled()) {
+        return;
+    }
+
+    dirtylimit_calc_state_init(max_cpus);
+    dirtylimit_state_init(max_cpus);
+}
diff --git a/hmp-commands-info.hx b/hmp-commands-info.hx
index 407a1da..aff28d9 100644
--- a/hmp-commands-info.hx
+++ b/hmp-commands-info.hx
@@ -863,6 +863,19 @@ SRST
     Display the vcpu dirty rate information.
 ERST
 
+    {
+        .name       = "vcpu_dirty_limit",
+        .args_type  = "cpu_index:l?",
+        .params     = "cpu_index",
+        .help       = "show dirty page limit information",
+        .cmd        = hmp_info_vcpu_dirty_limit,
+    },
+
+SRST
+  ``info vcpu_dirty_limit``
+    Display the vcpu dirty page limit information.
+ERST
+
 #if defined(TARGET_I386)
     {
         .name       = "sgx",
diff --git a/hmp-commands.hx b/hmp-commands.hx
index 70a9136..1839fa4 100644
--- a/hmp-commands.hx
+++ b/hmp-commands.hx
@@ -1744,3 +1744,19 @@ ERST
                       "\n\t\t\t -b to specify dirty bitmap as method of calculation)",
         .cmd        = hmp_calc_dirty_rate,
     },
+
+SRST
+``vcpu_dirty_limit``
+  Start dirty page rate limit on a virtual CPU, the information about all the
+  virtual CPU dirty limit status can be observed with ``info vcpu_dirty_limit``
+  command.
+ERST
+
+    {
+        .name       = "vcpu_dirty_limit",
+        .args_type  = "cpu_index:l,enable:b,dirty_rate:l?",
+        .params     = "cpu_index on|off [dirty_rate]",
+        .help       = "enable, disable dirty page rate limit on a virtual CPU"
+                      "(dirty_rate should be specified dirty_rate if enable)",
+        .cmd        = hmp_vcpu_dirty_limit,
+    },
diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index e948e81..11df012 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -881,6 +881,15 @@ void end_exclusive(void);
  */
 void qemu_init_vcpu(CPUState *cpu);
 
+/**
+ * dirtylimit_setup:
+ *
+ * Initializes the global state of dirtylimit calculation and
+ * dirtylimit itself. This is prepared for vCPU dirtylimit which
+ * could be triggered during vm lifecycle.
+ */
+void dirtylimit_setup(int max_cpus);
+
 #define SSTEP_ENABLE  0x1  /* Enable simulated HW single stepping */
 #define SSTEP_NOIRQ   0x2  /* Do not use IRQ while single stepping */
 #define SSTEP_NOTIMER 0x4  /* Do not Timers while single stepping */
diff --git a/include/monitor/hmp.h b/include/monitor/hmp.h
index 96d0148..04879a2 100644
--- a/include/monitor/hmp.h
+++ b/include/monitor/hmp.h
@@ -131,6 +131,8 @@ void hmp_replay_delete_break(Monitor *mon, const QDict *qdict);
 void hmp_replay_seek(Monitor *mon, const QDict *qdict);
 void hmp_info_dirty_rate(Monitor *mon, const QDict *qdict);
 void hmp_calc_dirty_rate(Monitor *mon, const QDict *qdict);
+void hmp_info_vcpu_dirty_limit(Monitor *mon, const QDict *qdict);
+void hmp_vcpu_dirty_limit(Monitor *mon, const QDict *qdict);
 void hmp_human_readable_text_helper(Monitor *mon,
                                     HumanReadableText *(*qmp_handler)(Error **));
 
diff --git a/qapi/migration.json b/qapi/migration.json
index 3da8fdf..dc15b3f 100644
--- a/qapi/migration.json
+++ b/qapi/migration.json
@@ -1872,6 +1872,54 @@
             'current-rate': 'int64' } }
 
 ##
+# @vcpu-dirty-limit:
+#
+# Set or cancel the upper limit of dirty page rate for a virtual CPU.
+#
+# Requires KVM with accelerator property "dirty-ring-size" set.
+# A virtual CPU's dirty page rate is a measure of its memory load.
+# To observe dirty page rates, use @calc-dirty-rate.
+#
+# @cpu-index: index of virtual CPU.
+#
+# @enable: true to enable, false to disable.
+#
+# @dirty-rate: upper limit of dirty page rate for virtual CPU.
+#
+# Since: 7.0
+#
+# Example:
+#   {"execute": "vcpu-dirty-limit"}
+#    "arguments": { "cpu-index": 0,
+#                   "enable": true,
+#                   "dirty-rate": 200 } }
+#
+##
+{ 'command': 'vcpu-dirty-limit',
+  'data': { 'cpu-index': 'int',
+            'enable': 'bool',
+            'dirty-rate': 'uint64'} }
+
+##
+# @query-vcpu-dirty-limit:
+#
+# Returns information about the virtual CPU dirty limit status.
+#
+# @cpu-index: index of the virtual CPU to query, if not specified, all
+#             virtual CPUs will be queried.
+#
+# Since: 7.0
+#
+# Example:
+#   {"execute": "query-vcpu-dirty-limit"}
+#    "arguments": { "cpu-index": 0 } }
+#
+##
+{ 'command': 'query-vcpu-dirty-limit',
+  'data': { '*cpu-index': 'int' },
+  'returns': [ 'DirtyLimitInfo' ] }
+
+##
 # @snapshot-save:
 #
 # Save a VM snapshot
diff --git a/softmmu/vl.c b/softmmu/vl.c
index 620a1f1..0f83ce3 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -3777,5 +3777,6 @@ void qemu_init(int argc, char **argv, char **envp)
     qemu_init_displays();
     accel_setup_post(current_machine);
     os_setup_post();
+    dirtylimit_setup(current_machine->smp.max_cpus);
     resume_mux_open();
 }
-- 
1.8.3.1


