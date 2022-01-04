Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B307F4846E1
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Jan 2022 18:20:39 +0100 (CET)
Received: from localhost ([::1]:42476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4nUE-0004AM-SG
	for lists+qemu-devel@lfdr.de; Tue, 04 Jan 2022 12:20:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangy81@chinatelecom.cn>)
 id 1n4nOT-0004CY-AL
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 12:14:41 -0500
Received: from prt-mail.chinatelecom.cn ([42.123.76.226]:48564
 helo=chinatelecom.cn) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huangy81@chinatelecom.cn>) id 1n4nOP-00009b-KB
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 12:14:40 -0500
HMM_SOURCE_IP: 172.18.0.218:33794.643395762
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-125.69.40.99 (unknown [172.18.0.218])
 by chinatelecom.cn (HERMES) with SMTP id 50D03280029;
 Wed,  5 Jan 2022 01:14:33 +0800 (CST)
X-189-SAVE-TO-SEND: +huangy81@chinatelecom.cn
Received: from  ([172.18.0.218])
 by app0025 with ESMTP id 32b1d01a0447457bb4731a2a837a3495 for
 qemu-devel@nongnu.org; Wed, 05 Jan 2022 01:14:36 CST
X-Transaction-ID: 32b1d01a0447457bb4731a2a837a3495
X-Real-From: huangy81@chinatelecom.cn
X-Receive-IP: 172.18.0.218
X-MEDUSA-Status: 0
From: huangy81@chinatelecom.cn
To: qemu-devel <qemu-devel@nongnu.org>
Subject: [PATCH v11 4/4] softmmu/dirtylimit: implement dirty page rate limit
Date: Wed,  5 Jan 2022 01:14:09 +0800
Message-Id: <3c7304f10b44919bb328a62c2fae988e2abf2a6a.1641316375.git.huangy81@chinatelecom.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1641315745.git.huangy81@chinatelecom.cn>
References: <cover.1641315745.git.huangy81@chinatelecom.cn>
In-Reply-To: <cover.1641316375.git.huangy81@chinatelecom.cn>
References: <cover.1641316375.git.huangy81@chinatelecom.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=42.123.76.226;
 envelope-from=huangy81@chinatelecom.cn; helo=chinatelecom.cn
X-Spam_score_int: 0
X-Spam_score: -0.0
X-Spam_bar: /
X-Spam_report: (-0.0 / 5.0 requ) SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Introduce qmp commands "set-vcpu-dirty-limit",
"cancel-vcpu-dirty-limit", "query-vcpu-dirty-limit"
to enable, disable, query dirty page limit for virtual CPU.

Meanwhile, introduce corresponding hmp commands
"set_vcpu_dirty_limit", "cancel_vcpu_dirty_limit",
"info vcpu_dirty_limit" so the feature can be more usable.

Signed-off-by: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
---
 hmp-commands-info.hx  |  13 ++++
 hmp-commands.hx       |  32 ++++++++++
 include/monitor/hmp.h |   3 +
 qapi/migration.json   |  60 ++++++++++++++++++
 softmmu/dirtylimit.c  | 167 ++++++++++++++++++++++++++++++++++++++++++++++++++
 5 files changed, 275 insertions(+)

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
index 70a9136..416982c 100644
--- a/hmp-commands.hx
+++ b/hmp-commands.hx
@@ -1744,3 +1744,35 @@ ERST
                       "\n\t\t\t -b to specify dirty bitmap as method of calculation)",
         .cmd        = hmp_calc_dirty_rate,
     },
+
+SRST
+``set_vcpu_dirty_limit``
+  Set dirty page rate limit on virtual CPU, the information about all the
+  virtual CPU dirty limit status can be observed with ``info vcpu_dirty_limit``
+  command.
+ERST
+
+    {
+        .name       = "set_vcpu_dirty_limit",
+        .args_type  = "dirty_rate:l,cpu_index:l?",
+        .params     = "dirty_rate [cpu_index]",
+        .help       = "set dirty page rate limit, use cpu_index to set limit on a "
+                      "\n\t\t specified virtual cpu",
+        .cmd        = hmp_set_vcpu_dirty_limit,
+    },
+
+SRST
+``cancel_vcpu_dirty_limit``
+  Cancel dirty page rate limit on virtual CPU, the information about all the
+  virtual CPU dirty limit status can be observed with ``info vcpu_dirty_limit``
+  command.
+ERST
+
+    {
+        .name       = "cancel_vcpu_dirty_limit",
+        .args_type  = "cpu_index:l?",
+        .params     = "[cpu_index]",
+        .help       = "cancel dirty page rate limit, use cpu_index to cancel limit "
+                      "\n\t\t on a specified virtual cpu",
+        .cmd        = hmp_cancel_vcpu_dirty_limit,
+    },
diff --git a/include/monitor/hmp.h b/include/monitor/hmp.h
index 96d0148..478820e 100644
--- a/include/monitor/hmp.h
+++ b/include/monitor/hmp.h
@@ -131,6 +131,9 @@ void hmp_replay_delete_break(Monitor *mon, const QDict *qdict);
 void hmp_replay_seek(Monitor *mon, const QDict *qdict);
 void hmp_info_dirty_rate(Monitor *mon, const QDict *qdict);
 void hmp_calc_dirty_rate(Monitor *mon, const QDict *qdict);
+void hmp_set_vcpu_dirty_limit(Monitor *mon, const QDict *qdict);
+void hmp_cancel_vcpu_dirty_limit(Monitor *mon, const QDict *qdict);
+void hmp_info_vcpu_dirty_limit(Monitor *mon, const QDict *qdict);
 void hmp_human_readable_text_helper(Monitor *mon,
                                     HumanReadableText *(*qmp_handler)(Error **));
 
diff --git a/qapi/migration.json b/qapi/migration.json
index ac5fa56..9d406f4 100644
--- a/qapi/migration.json
+++ b/qapi/migration.json
@@ -1869,6 +1869,66 @@
             'current-rate': 'int64' } }
 
 ##
+# @set-vcpu-dirty-limit:
+#
+# Set the upper limit of dirty page rate for virtual CPU.
+#
+# Requires KVM with accelerator property "dirty-ring-size" set.
+# A virtual CPU's dirty page rate is a measure of its memory load.
+# To observe dirty page rates, use @calc-dirty-rate.
+#
+# @cpu-index: index of virtual CPU, default is all.
+#
+# @dirty-rate: upper limit of dirty page rate for virtual CPU.
+#
+# Since: 7.0
+#
+# Example:
+#   {"execute": "set-vcpu-dirty-limit"}
+#    "arguments": { "dirty-rate": 200,
+#                   "cpu-index": 1 } }
+#
+##
+{ 'command': 'set-vcpu-dirty-limit',
+  'data': { '*cpu-index': 'uint64',
+            'dirty-rate': 'uint64' } }
+
+##
+# @cancel-vcpu-dirty-limit:
+#
+# Cancel the upper limit of dirty page rate for virtual CPU.
+#
+# Cancel the dirty page limit for the vCPU which has been set with
+# set-vcpu-dirty-limit command. Note that this command requires
+# support from dirty ring, same as the "set-vcpu-dirty-limit".
+#
+# @cpu-index: index of virtual CPU, default is all.
+#
+# Since: 7.0
+#
+# Example:
+#   {"execute": "cancel-vcpu-dirty-limit"}
+#    "arguments": { "cpu-index": 1 } }
+#
+##
+{ 'command': 'cancel-vcpu-dirty-limit',
+  'data': { '*cpu-index': 'uint64'} }
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
diff --git a/softmmu/dirtylimit.c b/softmmu/dirtylimit.c
index c9f5745..071f3b9 100644
--- a/softmmu/dirtylimit.c
+++ b/softmmu/dirtylimit.c
@@ -14,8 +14,12 @@
 #include "qapi/error.h"
 #include "qemu/main-loop.h"
 #include "qapi/qapi-commands-migration.h"
+#include "qapi/qmp/qdict.h"
+#include "qapi/error.h"
 #include "sysemu/dirtyrate.h"
 #include "sysemu/dirtylimit.h"
+#include "monitor/hmp.h"
+#include "monitor/monitor.h"
 #include "exec/memory.h"
 #include "hw/boards.h"
 #include "sysemu/kvm.h"
@@ -475,3 +479,166 @@ void dirtylimit_vcpu_execute(CPUState *cpu)
         usleep(cpu->throttle_us_per_full);
     }
 }
+
+void qmp_set_vcpu_dirty_limit(bool has_cpu_index,
+                              uint64_t cpu_index,
+                              uint64_t dirty_rate,
+                              Error **errp)
+{
+    if (!kvm_enabled() || !kvm_dirty_ring_enabled()) {
+        error_setg(errp, "dirty page limit feature requires KVM with"
+                   " accelerator property 'dirty-ring-size' set'");
+        return;
+    }
+
+    if (!dirtylimit_in_service()) {
+        vcpu_dirty_rate_stat_initialize();
+        vcpu_dirty_rate_stat_start();
+    }
+
+    if (has_cpu_index && !dirtylimit_vcpu_index_valid(cpu_index)) {
+        error_setg(errp, "incorrect cpu index specified");
+        return;
+    }
+
+    if (has_cpu_index) {
+        dirtylimit_set_vcpu(cpu_index, dirty_rate, true);
+    } else {
+        dirtylimit_set_all(dirty_rate, true);
+    }
+}
+
+void qmp_cancel_vcpu_dirty_limit(bool has_cpu_index,
+                                 uint64_t cpu_index,
+                                 Error **errp)
+{
+    if (!kvm_enabled() || !kvm_dirty_ring_enabled()) {
+        return;
+    }
+
+    if (!dirtylimit_in_service()) {
+        return;
+    }
+
+    if (has_cpu_index && !dirtylimit_vcpu_index_valid(cpu_index)) {
+        error_setg(errp, "incorrect cpu index specified");
+        return;
+    }
+
+    if (has_cpu_index) {
+        dirtylimit_set_vcpu(cpu_index, 0, false);
+    } else {
+        dirtylimit_set_all(0, false);
+    }
+
+    if (!dirtylimit_in_service()) {
+        vcpu_dirty_rate_stat_stop();
+        vcpu_dirty_rate_stat_finalize();
+    }
+}
+
+void hmp_set_vcpu_dirty_limit(Monitor *mon, const QDict *qdict)
+{
+    int64_t dirty_rate = qdict_get_int(qdict, "dirty_rate");
+    int64_t cpu_index = qdict_get_try_int(qdict, "cpu_index", -1);
+    Error *err = NULL;
+
+    qmp_set_vcpu_dirty_limit(!!(cpu_index != -1), cpu_index, dirty_rate, &err);
+    if (err) {
+        hmp_handle_error(mon, err);
+        return;
+    }
+
+    monitor_printf(mon, "[Please use 'info vcpu_dirty_limit' to query "
+                   "dirty limit for virtual CPU]\n");
+}
+
+void hmp_cancel_vcpu_dirty_limit(Monitor *mon, const QDict *qdict)
+{
+    int64_t cpu_index = qdict_get_try_int(qdict, "cpu_index", -1);
+    Error *err = NULL;
+
+    qmp_cancel_vcpu_dirty_limit(!!(cpu_index != -1), cpu_index, &err);
+    if (err) {
+        hmp_handle_error(mon, err);
+        return;
+    }
+
+    monitor_printf(mon, "[Please use 'info vcpu_dirty_limit' to query "
+                   "dirty limit for virtual CPU]\n");
+}
+
+static struct DirtyLimitInfo *dirtylimit_query_vcpu(int cpu_index)
+{
+    DirtyLimitInfo *info = NULL;
+
+    info = g_malloc0(sizeof(*info));
+    info->cpu_index = cpu_index;
+    info->limit_rate = dirtylimit_vcpu_get_state(cpu_index)->quota;
+    info->current_rate = vcpu_dirty_rate_get(cpu_index);
+
+    return info;
+}
+
+static struct DirtyLimitInfoList *dirtylimit_query_all(void)
+{
+    int i, index;
+    DirtyLimitInfo *info = NULL;
+    DirtyLimitInfoList *head = NULL, **tail = &head;
+
+    dirtylimit_state_lock();
+
+    if (!dirtylimit_in_service()) {
+        return NULL;
+    }
+
+    for (i = 0; i < dirtylimit_state->max_cpus; i++) {
+        index = dirtylimit_state->states[i].cpu_index;
+        if (dirtylimit_vcpu_get_state(index)->enabled) {
+            info = dirtylimit_query_vcpu(index);
+            QAPI_LIST_APPEND(tail, info);
+        }
+    }
+
+    dirtylimit_state_unlock();
+
+    return head;
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
-- 
1.8.3.1


