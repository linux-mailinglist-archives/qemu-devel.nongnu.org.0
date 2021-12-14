Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19ABF474164
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Dec 2021 12:21:42 +0100 (CET)
Received: from localhost ([::1]:53416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mx5sL-0006Ox-6f
	for lists+qemu-devel@lfdr.de; Tue, 14 Dec 2021 06:21:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangy81@chinatelecom.cn>)
 id 1mx5f6-0003dF-FB
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 06:08:00 -0500
Received: from prt-mail.chinatelecom.cn ([42.123.76.223]:41277
 helo=chinatelecom.cn) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huangy81@chinatelecom.cn>) id 1mx5f1-0007Wh-Hb
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 06:07:59 -0500
HMM_SOURCE_IP: 172.18.0.218:48586.2140870327
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-118.116.19.154 (unknown [172.18.0.218])
 by chinatelecom.cn (HERMES) with SMTP id D32ED2800BA;
 Tue, 14 Dec 2021 19:07:44 +0800 (CST)
X-189-SAVE-TO-SEND: +huangy81@chinatelecom.cn
Received: from  ([172.18.0.218])
 by app0025 with ESMTP id dc2b3206073c4924ad418b54750933c9 for
 qemu-devel@nongnu.org; Tue, 14 Dec 2021 19:07:47 CST
X-Transaction-ID: dc2b3206073c4924ad418b54750933c9
X-Real-From: huangy81@chinatelecom.cn
X-Receive-IP: 172.18.0.218
X-MEDUSA-Status: 0
From: huangy81@chinatelecom.cn
To: qemu-devel <qemu-devel@nongnu.org>
Subject: [PATCH v10 3/3] cpus-common: implement dirty page limit on virtual CPU
Date: Tue, 14 Dec 2021 19:07:34 +0800
Message-Id: <d54bfe75d5d64e64a21bda977d40f62579cd0222.1639479557.git.huangy81@chinatelecom.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1639479557.git.huangy81@chinatelecom.cn>
References: <cover.1639479557.git.huangy81@chinatelecom.cn>
In-Reply-To: <cover.1639479557.git.huangy81@chinatelecom.cn>
References: <cover.1639479557.git.huangy81@chinatelecom.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=42.123.76.223;
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
Cc: Eduardo Habkost <eduardo@habkost.net>, David Hildenbrand <david@redhat.com>,
 Hyman <huangy81@chinatelecom.cn>, Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus ArmBruster <armbru@redhat.com>, Peter Xu <peterx@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>

Implement dirtyrate calculation periodically basing on
dirty-ring and throttle virtual CPU until it reachs the quota
dirty page rate given by user.

Introduce qmp commands "vcpu-dirty-limit", "query-vcpu-dirty-limit"
to enable, disable, query dirty page limit for virtual CPU.

Meanwhile, introduce corresponding hmp commands "vcpu_dirty_limit",
"info vcpu_dirty_limit" so developers can play with them easier.

Signed-off-by: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
---
 cpus-common.c         | 155 ++++++++++++++++++++++++++++++++++++++++++++++++++
 hmp-commands-info.hx  |  13 +++++
 hmp-commands.hx       |  17 ++++++
 include/monitor/hmp.h |   2 +
 qapi/migration.json   |  44 ++++++++++++++
 5 files changed, 231 insertions(+)

diff --git a/cpus-common.c b/cpus-common.c
index 6e73d3e..37c3584 100644
--- a/cpus-common.c
+++ b/cpus-common.c
@@ -23,6 +23,15 @@
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
+#include "hw/boards.h"
 
 static QemuMutex qemu_cpu_list_lock;
 static QemuCond exclusive_cond;
@@ -352,3 +361,149 @@ void process_queued_cpu_work(CPUState *cpu)
     qemu_mutex_unlock(&cpu->work_mutex);
     qemu_cond_broadcast(&qemu_work_cond);
 }
+
+void qmp_vcpu_dirty_limit(bool enable,
+                          bool has_cpu_index,
+                          uint64_t cpu_index,
+                          bool has_dirty_rate,
+                          uint64_t dirty_rate,
+                          Error **errp)
+{
+    static bool initialized;
+
+    if (!kvm_enabled() || !kvm_dirty_ring_enabled()) {
+        if (enable) {
+            error_setg(errp, "dirty page limit feature requires KVM with"
+                       " accelerator property 'dirty-ring-size' set'");
+        }
+        return;
+    }
+
+    if (!enable && !dirtylimit_in_service()) {
+        return;
+    }
+
+    if (!initialized) {
+        MachineState *ms = MACHINE(qdev_get_machine());
+        dirtylimit_calc_state_init(ms->smp.max_cpus);
+        dirtylimit_state_init(ms->smp.max_cpus);
+        initialized = true;
+    }
+
+    if (enable && !has_dirty_rate) {
+        error_setg(errp, "enable dirty page limit feature requires"
+                   " 'dirty-rate' set'");
+        return;
+    }
+
+    if (has_cpu_index && !dirtylimit_is_vcpu_index_valid(cpu_index)) {
+        error_setg(errp, "incorrect cpu index specified");
+        return;
+    }
+
+    if (enable) {
+        dirtylimit_calc_start();
+        if (has_cpu_index) {
+            dirtylimit_vcpu(cpu_index, dirty_rate);
+        } else {
+            dirtylimit_all(dirty_rate);
+        }
+    } else {
+        if (has_cpu_index) {
+            dirtylimit_cancel_vcpu(cpu_index);
+        } else {
+            dirtylimit_cancel_all();
+        }
+
+        if (!dirtylimit_in_service()) {
+            dirtylimit_calc_quit();
+            dirtylimit_state_finalize();
+            dirtylimit_calc_state_finalize();
+            initialized = false;
+        }
+    }
+}
+
+void hmp_vcpu_dirty_limit(Monitor *mon, const QDict *qdict)
+{
+    bool global = qdict_get_try_bool(qdict, "global", false);
+    bool enable = qdict_get_bool(qdict, "enable");
+    int64_t cpu_index = qdict_get_try_int(qdict, "cpu_index", -1);
+    int64_t dirty_rate = qdict_get_try_int(qdict, "dirty_rate", -1);
+    Error *err = NULL;
+
+    if (enable && dirty_rate < 0) {
+        monitor_printf(mon, "Dirty page limit requires dirty_rate set!\n");
+        return;
+    }
+
+    if (enable && !global && cpu_index < 0) {
+        monitor_printf(mon, "Dirty page limit requires cpu_index set!\n");
+        return;
+    }
+
+    if (global && cpu_index != -1) {
+        monitor_printf(mon, "Either global option or cpu_index can be set!\n");
+        return;
+    }
+
+    if (global) {
+        if (enable) {
+            qmp_vcpu_dirty_limit(true, false, -1, true, dirty_rate, &err);
+        } else {
+            qmp_vcpu_dirty_limit(false, false, -1, false, -1, &err);
+        }
+    } else {
+        if (enable) {
+            qmp_vcpu_dirty_limit(true, true, cpu_index, true, dirty_rate, &err);
+        } else {
+            qmp_vcpu_dirty_limit(false, true, cpu_index, false, -1, &err);
+        }
+    }
+
+    if (err) {
+        hmp_handle_error(mon, err);
+        return;
+    }
+
+    monitor_printf(mon, "[Please use 'info vcpu_dirty_limit' to query "
+                   "dirty limit for virtual CPU]\n");
+}
+
+struct DirtyLimitInfoList *qmp_query_vcpu_dirty_limit(Error **errp)
+{
+    if (!dirtylimit_in_service()) {
+        error_setg(errp, "dirty page limit not enabled");
+        return NULL;
+    }
+
+    return dirtylimit_query_all();
+}
+
+void hmp_info_vcpu_dirty_limit(Monitor *mon, const QDict *qdict)
+{
+    DirtyLimitInfoList *limit, *head, *info = NULL;
+    Error *err = NULL;
+
+    if (!dirtylimit_in_service()) {
+        monitor_printf(mon, "Dirty page limit not enabled!\n");
+        return;
+    }
+
+    info = qmp_query_vcpu_dirty_limit(&err);
+    if (err) {
+        hmp_handle_error(mon, err);
+        return;
+    }
+
+    head = info;
+    for (limit = head; limit != NULL; limit = limit->next) {
+        monitor_printf(mon, "vcpu[%"PRIi64"], limit rate %"PRIi64 " (MB/s),"
+                            " current rate %"PRIi64 " (MB/s)\n",
+                            limit->value->cpu_index,
+                            limit->value->limit_rate,
+                            limit->value->current_rate);
+    }
+
+    g_free(info);
+}
diff --git a/hmp-commands-info.hx b/hmp-commands-info.hx
index 407a1da..5dd3001 100644
--- a/hmp-commands-info.hx
+++ b/hmp-commands-info.hx
@@ -863,6 +863,19 @@ SRST
     Display the vcpu dirty rate information.
 ERST
 
+    {
+        .name       = "vcpu_dirty_limit",
+        .args_type  = "",
+        .params     = "",
+        .help       = "show dirty page limit information of all vCPU",
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
index 70a9136..ef0f7cc 100644
--- a/hmp-commands.hx
+++ b/hmp-commands.hx
@@ -1744,3 +1744,20 @@ ERST
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
+        .args_type  = "global:-g,enable:b,cpu_index:l?,dirty_rate:l?",
+        .params     = "[-g] on|off [cpu_index] [dirty_rate]",
+        .help       = "turn on,off dirty page rate limit"
+                      "\n\t\t (use -g to affect all vCPU, cpu_index required be set to -1 if"
+                      "\n\t\t enable all vCPU. dirty_rate should be specified if turned on)",
+        .cmd        = hmp_vcpu_dirty_limit,
+    },
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
index ac5fa56..7d8da4f 100644
--- a/qapi/migration.json
+++ b/qapi/migration.json
@@ -1869,6 +1869,50 @@
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
+# @enable: true to enable, false to disable.
+#
+# @cpu-index: index of virtual CPU, default is all.
+#
+# @dirty-rate: upper limit of dirty page rate for virtual CPU, to
+#              cancel dirty limit, this field will be ignored.
+#
+# Since: 7.0
+#
+# Example:
+#   {"execute": "vcpu-dirty-limit"}
+#    "arguments": { "enable": true,
+#                   "cpu-index": 1,
+#                   "dirty-rate": 200 } }
+#
+##
+{ 'command': 'vcpu-dirty-limit',
+  'data': { 'enable': 'bool',
+            '*cpu-index': 'uint64',
+            '*dirty-rate': 'uint64'} }
+
+##
+# @query-vcpu-dirty-limit:
+#
+# Returns information about all virtual CPU dirty limit if enabled.
+#
+# Since: 7.0
+#
+# Example:
+#   {"execute": "query-vcpu-dirty-limit"}
+#
+##
+{ 'command': 'query-vcpu-dirty-limit',
+  'returns': [ 'DirtyLimitInfo' ] }
+
+##
 # @snapshot-save:
 #
 # Save a VM snapshot
-- 
1.8.3.1


