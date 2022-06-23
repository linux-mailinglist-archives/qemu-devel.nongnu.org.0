Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 814B255773C
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jun 2022 11:56:50 +0200 (CEST)
Received: from localhost ([::1]:53864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4JZx-0002za-J0
	for lists+qemu-devel@lfdr.de; Thu, 23 Jun 2022 05:56:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1o4J91-0000uo-Vq
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 05:29:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27633)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1o4J8z-00051E-Pj
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 05:28:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655976537;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Pp4Me2eDe7bsV/UvhVVYE1AU87VI+nsWkt7eVDLn984=;
 b=XDTe45yh4w0i5swxH2vUJkWoqGsvJo7OenAGOK4tHpQA8fEX6GU3EEfARdF2x1l7s1ViP3
 Ud/Nx/OiBPGcDfRShzkwI85WaXyuX0Z9CFjuFVy9A2MARavvJY7V1nWQgSboSZrX/GxsrD
 O+uYmO1RKAIPjBEikMGfyZUPRNZTiow=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-568-y_fQ3jpbOxi5ELc3fslqnA-1; Thu, 23 Jun 2022 05:28:55 -0400
X-MC-Unique: y_fQ3jpbOxi5ELc3fslqnA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 84B3380174C;
 Thu, 23 Jun 2022 09:28:55 +0000 (UTC)
Received: from dgilbert-t580.localhost (unknown [10.33.36.159])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8967040D282F;
 Thu, 23 Jun 2022 09:28:54 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, berrange@redhat.com, huangy81@chinatelecom.cn,
 quintela@redhat.com, leobras@redhat.com, peterx@redhat.com
Cc: jdenemar@redhat.com
Subject: [PULL 32/33] softmmu/dirtylimit: Implement dirty page rate limit
Date: Thu, 23 Jun 2022 10:28:09 +0100
Message-Id: <20220623092810.96234-33-dgilbert@redhat.com>
In-Reply-To: <20220623092810.96234-1-dgilbert@redhat.com>
References: <20220623092810.96234-1-dgilbert@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Message-Id: <80195172e377e3d96394b5b94425098260380bfa.1652931128.git.huangy81@chinatelecom.cn>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 hmp-commands-info.hx       |  13 +++
 hmp-commands.hx            |  32 ++++++
 include/monitor/hmp.h      |   3 +
 qapi/migration.json        |  80 +++++++++++++++
 softmmu/dirtylimit.c       | 194 +++++++++++++++++++++++++++++++++++++
 tests/qtest/qmp-cmd-test.c |   2 +
 6 files changed, 324 insertions(+)

diff --git a/hmp-commands-info.hx b/hmp-commands-info.hx
index 3ffa24bd67..188d9ece3b 100644
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
index c9d465735a..182e639d14 100644
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
index 2e89a97bd6..a618eb1e4e 100644
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
index 7102e474a6..e552ee4f43 100644
--- a/qapi/migration.json
+++ b/qapi/migration.json
@@ -1868,6 +1868,86 @@
 ##
 { 'command': 'query-dirty-rate', 'returns': 'DirtyRateInfo' }
 
+##
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
 ##
 # @snapshot-save:
 #
diff --git a/softmmu/dirtylimit.c b/softmmu/dirtylimit.c
index 76d0b44e02..c5ea24120e 100644
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
index 056b40e67f..af00712458 100644
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
2.36.1


