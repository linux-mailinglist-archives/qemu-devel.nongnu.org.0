Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8404955ABD5
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Jun 2022 19:50:35 +0200 (CEST)
Received: from localhost ([::1]:53932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o59vW-0000Gw-Hx
	for lists+qemu-devel@lfdr.de; Sat, 25 Jun 2022 13:50:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangy81@chinatelecom.cn>)
 id 1o59kX-0003Vv-N7
 for qemu-devel@nongnu.org; Sat, 25 Jun 2022 13:39:14 -0400
Received: from prt-mail.chinatelecom.cn ([42.123.76.228]:53192
 helo=chinatelecom.cn) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huangy81@chinatelecom.cn>) id 1o59kU-0007Sp-L5
 for qemu-devel@nongnu.org; Sat, 25 Jun 2022 13:39:13 -0400
HMM_SOURCE_IP: 172.18.0.48:34982.1285566443
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-171.223.97.81 (unknown [172.18.0.48])
 by chinatelecom.cn (HERMES) with SMTP id 686842800DC;
 Sun, 26 Jun 2022 01:39:06 +0800 (CST)
X-189-SAVE-TO-SEND: +huangy81@chinatelecom.cn
Received: from  ([172.18.0.48])
 by app0024 with ESMTP id dc045efe3ada48ac8e5216558279528f for
 qemu-devel@nongnu.org; Sun, 26 Jun 2022 01:39:09 CST
X-Transaction-ID: dc045efe3ada48ac8e5216558279528f
X-Real-From: huangy81@chinatelecom.cn
X-Receive-IP: 172.18.0.48
X-MEDUSA-Status: 0
From: huangy81@chinatelecom.cn
To: qemu-devel <qemu-devel@nongnu.org>
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Peter Xu <peterx@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 David Hildenbrand <david@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Hyman <huangy81@chinatelecom.cn>
Subject: [PATCH v25 7/8] softmmu/dirtylimit: Implement dirty page rate limit
Date: Sun, 26 Jun 2022 01:38:36 +0800
Message-Id: <4143f26706d413dd29db0b672fe58b3d3fbe34bc.1656177590.git.huangy81@chinatelecom.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1656177590.git.huangy81@chinatelecom.cn>
References: <cover.1656177590.git.huangy81@chinatelecom.cn>
In-Reply-To: <cover.1656177590.git.huangy81@chinatelecom.cn>
References: <cover.1656177590.git.huangy81@chinatelecom.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=42.123.76.228;
 envelope-from=huangy81@chinatelecom.cn; helo=chinatelecom.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

"query-vcpu-dirty-limit" success depends on enabling dirty
page rate limit, so just add it to the list of skipped
command to ensure qmp-cmd-test run successfully.

Signed-off-by: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
Acked-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Peter Xu <peterx@redhat.com>
---
 hmp-commands-info.hx       |  13 +++
 hmp-commands.hx            |  32 ++++++++
 include/monitor/hmp.h      |   3 +
 qapi/migration.json        |  80 +++++++++++++++++++
 softmmu/dirtylimit.c       | 194 +++++++++++++++++++++++++++++++++++++++++++++
 tests/qtest/qmp-cmd-test.c |   2 +
 6 files changed, 324 insertions(+)

diff --git a/hmp-commands-info.hx b/hmp-commands-info.hx
index 3ffa24b..188d9ec 100644
--- a/hmp-commands-info.hx
+++ b/hmp-commands-info.hx
@@ -865,6 +865,19 @@ SRST
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
index c9d4657..182e639 100644
--- a/hmp-commands.hx
+++ b/hmp-commands.hx
@@ -1768,3 +1768,35 @@ ERST
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
+        .help       = "set dirty page rate limit, use cpu_index to set limit"
+                      "\n\t\t\t\t\t on a specified virtual cpu",
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
+        .help       = "cancel dirty page rate limit, use cpu_index to cancel"
+                      "\n\t\t\t\t\t limit on a specified virtual cpu",
+        .cmd        = hmp_cancel_vcpu_dirty_limit,
+    },
diff --git a/include/monitor/hmp.h b/include/monitor/hmp.h
index 2e89a97..a618eb1 100644
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
 void hmp_info_stats(Monitor *mon, const QDict *qdict);
diff --git a/qapi/migration.json b/qapi/migration.json
index 7102e47..e552ee4 100644
--- a/qapi/migration.json
+++ b/qapi/migration.json
@@ -1869,6 +1869,86 @@
 { 'command': 'query-dirty-rate', 'returns': 'DirtyRateInfo' }
 
 ##
+# @DirtyLimitInfo:
+#
+# Dirty page rate limit information of a virtual CPU.
+#
+# @cpu-index: index of a virtual CPU.
+#
+# @limit-rate: upper limit of dirty page rate (MB/s) for a virtual
+#              CPU, 0 means unlimited.
+#
+# @current-rate: current dirty page rate (MB/s) for a virtual CPU.
+#
+# Since: 7.1
+#
+##
+{ 'struct': 'DirtyLimitInfo',
+  'data': { 'cpu-index': 'int',
+            'limit-rate': 'uint64',
+            'current-rate': 'uint64' } }
+
+##
+# @set-vcpu-dirty-limit:
+#
+# Set the upper limit of dirty page rate for virtual CPUs.
+#
+# Requires KVM with accelerator property "dirty-ring-size" set.
+# A virtual CPU's dirty page rate is a measure of its memory load.
+# To observe dirty page rates, use @calc-dirty-rate.
+#
+# @cpu-index: index of a virtual CPU, default is all.
+#
+# @dirty-rate: upper limit of dirty page rate (MB/s) for virtual CPUs.
+#
+# Since: 7.1
+#
+# Example:
+#   {"execute": "set-vcpu-dirty-limit"}
+#    "arguments": { "dirty-rate": 200,
+#                   "cpu-index": 1 } }
+#
+##
+{ 'command': 'set-vcpu-dirty-limit',
+  'data': { '*cpu-index': 'int',
+            'dirty-rate': 'uint64' } }
+
+##
+# @cancel-vcpu-dirty-limit:
+#
+# Cancel the upper limit of dirty page rate for virtual CPUs.
+#
+# Cancel the dirty page limit for the vCPU which has been set with
+# set-vcpu-dirty-limit command. Note that this command requires
+# support from dirty ring, same as the "set-vcpu-dirty-limit".
+#
+# @cpu-index: index of a virtual CPU, default is all.
+#
+# Since: 7.1
+#
+# Example:
+#   {"execute": "cancel-vcpu-dirty-limit"}
+#    "arguments": { "cpu-index": 1 } }
+#
+##
+{ 'command': 'cancel-vcpu-dirty-limit',
+  'data': { '*cpu-index': 'int'} }
+
+##
+# @query-vcpu-dirty-limit:
+#
+# Returns information about virtual CPU dirty page rate limits, if any.
+#
+# Since: 7.1
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
index e5a4f97..8d98cb7 100644
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
@@ -405,3 +409,193 @@ void dirtylimit_vcpu_execute(CPUState *cpu)
         usleep(cpu->throttle_us_per_full);
     }
 }
+
+static void dirtylimit_init(void)
+{
+    dirtylimit_state_initialize();
+    dirtylimit_change(true);
+    vcpu_dirty_rate_stat_initialize();
+    vcpu_dirty_rate_stat_start();
+}
+
+static void dirtylimit_cleanup(void)
+{
+    vcpu_dirty_rate_stat_stop();
+    vcpu_dirty_rate_stat_finalize();
+    dirtylimit_change(false);
+    dirtylimit_state_finalize();
+}
+
+void qmp_cancel_vcpu_dirty_limit(bool has_cpu_index,
+                                 int64_t cpu_index,
+                                 Error **errp)
+{
+    if (!kvm_enabled() || !kvm_dirty_ring_enabled()) {
+        return;
+    }
+
+    if (has_cpu_index && !dirtylimit_vcpu_index_valid(cpu_index)) {
+        error_setg(errp, "incorrect cpu index specified");
+        return;
+    }
+
+    if (!dirtylimit_in_service()) {
+        return;
+    }
+
+    dirtylimit_state_lock();
+
+    if (has_cpu_index) {
+        dirtylimit_set_vcpu(cpu_index, 0, false);
+    } else {
+        dirtylimit_set_all(0, false);
+    }
+
+    if (!dirtylimit_state->limited_nvcpu) {
+        dirtylimit_cleanup();
+    }
+
+    dirtylimit_state_unlock();
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
+void qmp_set_vcpu_dirty_limit(bool has_cpu_index,
+                              int64_t cpu_index,
+                              uint64_t dirty_rate,
+                              Error **errp)
+{
+    if (!kvm_enabled() || !kvm_dirty_ring_enabled()) {
+        error_setg(errp, "dirty page limit feature requires KVM with"
+                   " accelerator property 'dirty-ring-size' set'");
+        return;
+    }
+
+    if (has_cpu_index && !dirtylimit_vcpu_index_valid(cpu_index)) {
+        error_setg(errp, "incorrect cpu index specified");
+        return;
+    }
+
+    if (!dirty_rate) {
+        qmp_cancel_vcpu_dirty_limit(has_cpu_index, cpu_index, errp);
+        return;
+    }
+
+    dirtylimit_state_lock();
+
+    if (!dirtylimit_in_service()) {
+        dirtylimit_init();
+    }
+
+    if (has_cpu_index) {
+        dirtylimit_set_vcpu(cpu_index, dirty_rate, true);
+    } else {
+        dirtylimit_set_all(dirty_rate, true);
+    }
+
+    dirtylimit_state_unlock();
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
+        dirtylimit_state_unlock();
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
diff --git a/tests/qtest/qmp-cmd-test.c b/tests/qtest/qmp-cmd-test.c
index 056b40e..af00712 100644
--- a/tests/qtest/qmp-cmd-test.c
+++ b/tests/qtest/qmp-cmd-test.c
@@ -110,6 +110,8 @@ static bool query_is_ignored(const char *cmd)
         "query-sev-capabilities",
         "query-sgx",
         "query-sgx-capabilities",
+        /* Success depends on enabling dirty page rate limit */
+        "query-vcpu-dirty-limit",
         NULL
     };
     int i;
-- 
1.8.3.1


