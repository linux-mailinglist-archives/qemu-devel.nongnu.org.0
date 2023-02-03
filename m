Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2994168928F
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 09:47:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNriR-0000F0-9e; Fri, 03 Feb 2023 03:46:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pNrhu-0008N6-EM
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 03:46:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pNrhm-0007VM-FQ
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 03:46:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675413957;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dk3m2y93Nyebt1YFx6+TAJe1N43fz4SMNnU4CuDpv8s=;
 b=FFhEYKP4dioZUw1xyf77YNi8e5L65xBG7jqENC53uqp/k9Hovsyzf/xH4k0GZ6+dYt48Q0
 5hQUHKXQAFx5EU4guTZH1AN4RkrSGQHVRE7kMDndcGjScRYAl0h8vVUfOz7tMPIYa/Buge
 UJZOjs8dC9yPdB5nD384KIuKiqRNpIo=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-127-QD3C93TGMVSYZ-Mee3yzuQ-1; Fri, 03 Feb 2023 03:45:54 -0500
X-MC-Unique: QD3C93TGMVSYZ-Mee3yzuQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0A8AD1C05EB4;
 Fri,  3 Feb 2023 08:45:54 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A38C42026D38;
 Fri,  3 Feb 2023 08:45:53 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id ED63621E6930; Fri,  3 Feb 2023 09:45:49 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org
Subject: [PULL 26/35] stats: Move HMP commands from monitor/ to stats/
Date: Fri,  3 Feb 2023 09:45:40 +0100
Message-Id: <20230203084549.2622302-27-armbru@redhat.com>
In-Reply-To: <20230203084549.2622302-1-armbru@redhat.com>
References: <20230203084549.2622302-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This moves these commands from MAINTAINERS section "Human
Monitor (HMP)" to section "Stats".

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20230124121946.1139465-24-armbru@redhat.com>
---
 monitor/hmp-cmds.c     | 234 --------------------------------------
 stats/stats-hmp-cmds.c | 247 +++++++++++++++++++++++++++++++++++++++++
 stats/meson.build      |   2 +-
 3 files changed, 248 insertions(+), 235 deletions(-)
 create mode 100644 stats/stats-hmp-cmds.c

diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index 34e98b0e0b..8a3d56bcde 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -20,11 +20,9 @@
 #include "qapi/error.h"
 #include "qapi/qapi-commands-control.h"
 #include "qapi/qapi-commands-misc.h"
-#include "qapi/qapi-commands-stats.h"
 #include "qapi/qmp/qdict.h"
 #include "qapi/qmp/qerror.h"
 #include "qemu/cutils.h"
-#include "hw/core/cpu.h"
 #include "hw/intc/intc.h"
 
 bool hmp_handle_error(Monitor *mon, Error *err)
@@ -226,235 +224,3 @@ void hmp_info_iothreads(Monitor *mon, const QDict *qdict)
 
     qapi_free_IOThreadInfoList(info_list);
 }
-
-static void print_stats_schema_value(Monitor *mon, StatsSchemaValue *value)
-{
-    const char *unit = NULL;
-    monitor_printf(mon, "    %s (%s%s", value->name, StatsType_str(value->type),
-                   value->has_unit || value->exponent ? ", " : "");
-
-    if (value->has_unit) {
-        if (value->unit == STATS_UNIT_SECONDS) {
-            unit = "s";
-        } else if (value->unit == STATS_UNIT_BYTES) {
-            unit = "B";
-        }
-    }
-
-    if (unit && value->base == 10 &&
-        value->exponent >= -18 && value->exponent <= 18 &&
-        value->exponent % 3 == 0) {
-        monitor_puts(mon, si_prefix(value->exponent));
-    } else if (unit && value->base == 2 &&
-               value->exponent >= 0 && value->exponent <= 60 &&
-               value->exponent % 10 == 0) {
-
-        monitor_puts(mon, iec_binary_prefix(value->exponent));
-    } else if (value->exponent) {
-        /* Use exponential notation and write the unit's English name */
-        monitor_printf(mon, "* %d^%d%s",
-                       value->base, value->exponent,
-                       value->has_unit ? " " : "");
-        unit = NULL;
-    }
-
-    if (value->has_unit) {
-        monitor_puts(mon, unit ? unit : StatsUnit_str(value->unit));
-    }
-
-    /* Print bucket size for linear histograms */
-    if (value->type == STATS_TYPE_LINEAR_HISTOGRAM && value->has_bucket_size) {
-        monitor_printf(mon, ", bucket size=%d", value->bucket_size);
-    }
-    monitor_printf(mon, ")");
-}
-
-static StatsSchemaValueList *find_schema_value_list(
-    StatsSchemaList *list, StatsProvider provider,
-    StatsTarget target)
-{
-    StatsSchemaList *node;
-
-    for (node = list; node; node = node->next) {
-        if (node->value->provider == provider &&
-            node->value->target == target) {
-            return node->value->stats;
-        }
-    }
-    return NULL;
-}
-
-static void print_stats_results(Monitor *mon, StatsTarget target,
-                                bool show_provider,
-                                StatsResult *result,
-                                StatsSchemaList *schema)
-{
-    /* Find provider schema */
-    StatsSchemaValueList *schema_value_list =
-        find_schema_value_list(schema, result->provider, target);
-    StatsList *stats_list;
-
-    if (!schema_value_list) {
-        monitor_printf(mon, "failed to find schema list for %s\n",
-                       StatsProvider_str(result->provider));
-        return;
-    }
-
-    if (show_provider) {
-        monitor_printf(mon, "provider: %s\n",
-                       StatsProvider_str(result->provider));
-    }
-
-    for (stats_list = result->stats; stats_list;
-             stats_list = stats_list->next,
-             schema_value_list = schema_value_list->next) {
-
-        Stats *stats = stats_list->value;
-        StatsValue *stats_value = stats->value;
-        StatsSchemaValue *schema_value = schema_value_list->value;
-
-        /* Find schema entry */
-        while (!g_str_equal(stats->name, schema_value->name)) {
-            if (!schema_value_list->next) {
-                monitor_printf(mon, "failed to find schema entry for %s\n",
-                               stats->name);
-                return;
-            }
-            schema_value_list = schema_value_list->next;
-            schema_value = schema_value_list->value;
-        }
-
-        print_stats_schema_value(mon, schema_value);
-
-        if (stats_value->type == QTYPE_QNUM) {
-            monitor_printf(mon, ": %" PRId64 "\n", stats_value->u.scalar);
-        } else if (stats_value->type == QTYPE_QBOOL) {
-            monitor_printf(mon, ": %s\n", stats_value->u.boolean ? "yes" : "no");
-        } else if (stats_value->type == QTYPE_QLIST) {
-            uint64List *list;
-            int i;
-
-            monitor_printf(mon, ": ");
-            for (list = stats_value->u.list, i = 1;
-                 list;
-                 list = list->next, i++) {
-                monitor_printf(mon, "[%d]=%" PRId64 " ", i, list->value);
-            }
-            monitor_printf(mon, "\n");
-        }
-    }
-}
-
-/* Create the StatsFilter that is needed for an "info stats" invocation.  */
-static StatsFilter *stats_filter(StatsTarget target, const char *names,
-                                 int cpu_index, StatsProvider provider)
-{
-    StatsFilter *filter = g_malloc0(sizeof(*filter));
-    StatsProvider provider_idx;
-    StatsRequestList *request_list = NULL;
-
-    filter->target = target;
-    switch (target) {
-    case STATS_TARGET_VM:
-        break;
-    case STATS_TARGET_VCPU:
-    {
-        strList *vcpu_list = NULL;
-        CPUState *cpu = qemu_get_cpu(cpu_index);
-        char *canonical_path = object_get_canonical_path(OBJECT(cpu));
-
-        QAPI_LIST_PREPEND(vcpu_list, canonical_path);
-        filter->u.vcpu.has_vcpus = true;
-        filter->u.vcpu.vcpus = vcpu_list;
-        break;
-    }
-    default:
-        break;
-    }
-
-    if (!names && provider == STATS_PROVIDER__MAX) {
-        return filter;
-    }
-
-    /*
-     * "info stats" can only query either one or all the providers.  Querying
-     * by name, but not by provider, requires the creation of one filter per
-     * provider.
-     */
-    for (provider_idx = 0; provider_idx < STATS_PROVIDER__MAX; provider_idx++) {
-        if (provider == STATS_PROVIDER__MAX || provider == provider_idx) {
-            StatsRequest *request = g_new0(StatsRequest, 1);
-            request->provider = provider_idx;
-            if (names && !g_str_equal(names, "*")) {
-                request->has_names = true;
-                request->names = hmp_split_at_comma(names);
-            }
-            QAPI_LIST_PREPEND(request_list, request);
-        }
-    }
-
-    filter->has_providers = true;
-    filter->providers = request_list;
-    return filter;
-}
-
-void hmp_info_stats(Monitor *mon, const QDict *qdict)
-{
-    const char *target_str = qdict_get_str(qdict, "target");
-    const char *provider_str = qdict_get_try_str(qdict, "provider");
-    const char *names = qdict_get_try_str(qdict, "names");
-
-    StatsProvider provider = STATS_PROVIDER__MAX;
-    StatsTarget target;
-    Error *err = NULL;
-    g_autoptr(StatsSchemaList) schema = NULL;
-    g_autoptr(StatsResultList) stats = NULL;
-    g_autoptr(StatsFilter) filter = NULL;
-    StatsResultList *entry;
-
-    target = qapi_enum_parse(&StatsTarget_lookup, target_str, -1, &err);
-    if (err) {
-        monitor_printf(mon, "invalid stats target %s\n", target_str);
-        goto exit_no_print;
-    }
-    if (provider_str) {
-        provider = qapi_enum_parse(&StatsProvider_lookup, provider_str, -1, &err);
-        if (err) {
-            monitor_printf(mon, "invalid stats provider %s\n", provider_str);
-            goto exit_no_print;
-        }
-    }
-
-    schema = qmp_query_stats_schemas(provider_str ? true : false,
-                                     provider, &err);
-    if (err) {
-        goto exit;
-    }
-
-    switch (target) {
-    case STATS_TARGET_VM:
-        filter = stats_filter(target, names, -1, provider);
-        break;
-    case STATS_TARGET_VCPU: {}
-        int cpu_index = monitor_get_cpu_index(mon);
-        filter = stats_filter(target, names, cpu_index, provider);
-        break;
-    default:
-        abort();
-    }
-
-    stats = qmp_query_stats(filter, &err);
-    if (err) {
-        goto exit;
-    }
-    for (entry = stats; entry; entry = entry->next) {
-        print_stats_results(mon, target, provider_str == NULL, entry->value, schema);
-    }
-
-exit:
-    if (err) {
-        monitor_printf(mon, "%s\n", error_get_pretty(err));
-    }
-exit_no_print:
-    error_free(err);
-}
diff --git a/stats/stats-hmp-cmds.c b/stats/stats-hmp-cmds.c
new file mode 100644
index 0000000000..531e35d128
--- /dev/null
+++ b/stats/stats-hmp-cmds.c
@@ -0,0 +1,247 @@
+/*
+ * HMP commands related to stats
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or
+ * (at your option) any later version.
+ */
+
+#include "qemu/osdep.h"
+#include "qapi/qapi-commands-stats.h"
+#include "monitor/hmp.h"
+#include "monitor/monitor.h"
+#include "qemu/cutils.h"
+#include "hw/core/cpu.h"
+#include "qapi/qmp/qdict.h"
+#include "qapi/error.h"
+
+static void print_stats_schema_value(Monitor *mon, StatsSchemaValue *value)
+{
+    const char *unit = NULL;
+    monitor_printf(mon, "    %s (%s%s", value->name, StatsType_str(value->type),
+                   value->has_unit || value->exponent ? ", " : "");
+
+    if (value->has_unit) {
+        if (value->unit == STATS_UNIT_SECONDS) {
+            unit = "s";
+        } else if (value->unit == STATS_UNIT_BYTES) {
+            unit = "B";
+        }
+    }
+
+    if (unit && value->base == 10 &&
+        value->exponent >= -18 && value->exponent <= 18 &&
+        value->exponent % 3 == 0) {
+        monitor_puts(mon, si_prefix(value->exponent));
+    } else if (unit && value->base == 2 &&
+               value->exponent >= 0 && value->exponent <= 60 &&
+               value->exponent % 10 == 0) {
+
+        monitor_puts(mon, iec_binary_prefix(value->exponent));
+    } else if (value->exponent) {
+        /* Use exponential notation and write the unit's English name */
+        monitor_printf(mon, "* %d^%d%s",
+                       value->base, value->exponent,
+                       value->has_unit ? " " : "");
+        unit = NULL;
+    }
+
+    if (value->has_unit) {
+        monitor_puts(mon, unit ? unit : StatsUnit_str(value->unit));
+    }
+
+    /* Print bucket size for linear histograms */
+    if (value->type == STATS_TYPE_LINEAR_HISTOGRAM && value->has_bucket_size) {
+        monitor_printf(mon, ", bucket size=%d", value->bucket_size);
+    }
+    monitor_printf(mon, ")");
+}
+
+static StatsSchemaValueList *find_schema_value_list(
+    StatsSchemaList *list, StatsProvider provider,
+    StatsTarget target)
+{
+    StatsSchemaList *node;
+
+    for (node = list; node; node = node->next) {
+        if (node->value->provider == provider &&
+            node->value->target == target) {
+            return node->value->stats;
+        }
+    }
+    return NULL;
+}
+
+static void print_stats_results(Monitor *mon, StatsTarget target,
+                                bool show_provider,
+                                StatsResult *result,
+                                StatsSchemaList *schema)
+{
+    /* Find provider schema */
+    StatsSchemaValueList *schema_value_list =
+        find_schema_value_list(schema, result->provider, target);
+    StatsList *stats_list;
+
+    if (!schema_value_list) {
+        monitor_printf(mon, "failed to find schema list for %s\n",
+                       StatsProvider_str(result->provider));
+        return;
+    }
+
+    if (show_provider) {
+        monitor_printf(mon, "provider: %s\n",
+                       StatsProvider_str(result->provider));
+    }
+
+    for (stats_list = result->stats; stats_list;
+             stats_list = stats_list->next,
+             schema_value_list = schema_value_list->next) {
+
+        Stats *stats = stats_list->value;
+        StatsValue *stats_value = stats->value;
+        StatsSchemaValue *schema_value = schema_value_list->value;
+
+        /* Find schema entry */
+        while (!g_str_equal(stats->name, schema_value->name)) {
+            if (!schema_value_list->next) {
+                monitor_printf(mon, "failed to find schema entry for %s\n",
+                               stats->name);
+                return;
+            }
+            schema_value_list = schema_value_list->next;
+            schema_value = schema_value_list->value;
+        }
+
+        print_stats_schema_value(mon, schema_value);
+
+        if (stats_value->type == QTYPE_QNUM) {
+            monitor_printf(mon, ": %" PRId64 "\n", stats_value->u.scalar);
+        } else if (stats_value->type == QTYPE_QBOOL) {
+            monitor_printf(mon, ": %s\n", stats_value->u.boolean ? "yes" : "no");
+        } else if (stats_value->type == QTYPE_QLIST) {
+            uint64List *list;
+            int i;
+
+            monitor_printf(mon, ": ");
+            for (list = stats_value->u.list, i = 1;
+                 list;
+                 list = list->next, i++) {
+                monitor_printf(mon, "[%d]=%" PRId64 " ", i, list->value);
+            }
+            monitor_printf(mon, "\n");
+        }
+    }
+}
+
+/* Create the StatsFilter that is needed for an "info stats" invocation.  */
+static StatsFilter *stats_filter(StatsTarget target, const char *names,
+                                 int cpu_index, StatsProvider provider)
+{
+    StatsFilter *filter = g_malloc0(sizeof(*filter));
+    StatsProvider provider_idx;
+    StatsRequestList *request_list = NULL;
+
+    filter->target = target;
+    switch (target) {
+    case STATS_TARGET_VM:
+        break;
+    case STATS_TARGET_VCPU:
+    {
+        strList *vcpu_list = NULL;
+        CPUState *cpu = qemu_get_cpu(cpu_index);
+        char *canonical_path = object_get_canonical_path(OBJECT(cpu));
+
+        QAPI_LIST_PREPEND(vcpu_list, canonical_path);
+        filter->u.vcpu.has_vcpus = true;
+        filter->u.vcpu.vcpus = vcpu_list;
+        break;
+    }
+    default:
+        break;
+    }
+
+    if (!names && provider == STATS_PROVIDER__MAX) {
+        return filter;
+    }
+
+    /*
+     * "info stats" can only query either one or all the providers.  Querying
+     * by name, but not by provider, requires the creation of one filter per
+     * provider.
+     */
+    for (provider_idx = 0; provider_idx < STATS_PROVIDER__MAX; provider_idx++) {
+        if (provider == STATS_PROVIDER__MAX || provider == provider_idx) {
+            StatsRequest *request = g_new0(StatsRequest, 1);
+            request->provider = provider_idx;
+            if (names && !g_str_equal(names, "*")) {
+                request->has_names = true;
+                request->names = hmp_split_at_comma(names);
+            }
+            QAPI_LIST_PREPEND(request_list, request);
+        }
+    }
+
+    filter->has_providers = true;
+    filter->providers = request_list;
+    return filter;
+}
+
+void hmp_info_stats(Monitor *mon, const QDict *qdict)
+{
+    const char *target_str = qdict_get_str(qdict, "target");
+    const char *provider_str = qdict_get_try_str(qdict, "provider");
+    const char *names = qdict_get_try_str(qdict, "names");
+
+    StatsProvider provider = STATS_PROVIDER__MAX;
+    StatsTarget target;
+    Error *err = NULL;
+    g_autoptr(StatsSchemaList) schema = NULL;
+    g_autoptr(StatsResultList) stats = NULL;
+    g_autoptr(StatsFilter) filter = NULL;
+    StatsResultList *entry;
+
+    target = qapi_enum_parse(&StatsTarget_lookup, target_str, -1, &err);
+    if (err) {
+        monitor_printf(mon, "invalid stats target %s\n", target_str);
+        goto exit_no_print;
+    }
+    if (provider_str) {
+        provider = qapi_enum_parse(&StatsProvider_lookup, provider_str, -1, &err);
+        if (err) {
+            monitor_printf(mon, "invalid stats provider %s\n", provider_str);
+            goto exit_no_print;
+        }
+    }
+
+    schema = qmp_query_stats_schemas(provider_str ? true : false,
+                                     provider, &err);
+    if (err) {
+        goto exit;
+    }
+
+    switch (target) {
+    case STATS_TARGET_VM:
+        filter = stats_filter(target, names, -1, provider);
+        break;
+    case STATS_TARGET_VCPU: {}
+        int cpu_index = monitor_get_cpu_index(mon);
+        filter = stats_filter(target, names, cpu_index, provider);
+        break;
+    default:
+        abort();
+    }
+
+    stats = qmp_query_stats(filter, &err);
+    if (err) {
+        goto exit;
+    }
+    for (entry = stats; entry; entry = entry->next) {
+        print_stats_results(mon, target, provider_str == NULL, entry->value, schema);
+    }
+
+exit:
+    if (err) {
+        monitor_printf(mon, "%s\n", error_get_pretty(err));
+    }
+exit_no_print:
+    error_free(err);
+}
diff --git a/stats/meson.build b/stats/meson.build
index 4ddb4d096b..c4153f979e 100644
--- a/stats/meson.build
+++ b/stats/meson.build
@@ -1 +1 @@
-softmmu_ss.add(files('stats-qmp-cmds.c'))
+softmmu_ss.add(files('stats-hmp-cmds.c', 'stats-qmp-cmds.c'))
-- 
2.39.0


