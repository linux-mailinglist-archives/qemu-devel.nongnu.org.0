Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D99A66892AE
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 09:51:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNriC-0008W0-Hk; Fri, 03 Feb 2023 03:46:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pNrhq-0008Ka-7w
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 03:46:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pNrhl-0007Tz-5m
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 03:46:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675413955;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DYqhtMC3JRMyh+AP/oaCvEgbu1wI4LuYqBhew30oA1Y=;
 b=V46j1iVNX7OzesjNv5A6mvyTGra95MjldpD8WIRy7lbK9BfP0XdenJo7N2O8IoRoi5r9Em
 c95VsNtzVc2q8RYKqmPElUn9oLP2THhcj+Dk6wuexBxznJ/ccwg68Ez9k/7glhRQV+UNhW
 9+RkjLtzlYyRHNf21bx4cRoH+k21FBE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-550-zEFAbDqwMiWPe_Ma0efBKw-1; Fri, 03 Feb 2023 03:45:54 -0500
X-MC-Unique: zEFAbDqwMiWPe_Ma0efBKw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 173C4885628;
 Fri,  3 Feb 2023 08:45:54 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A4C55492B17;
 Fri,  3 Feb 2023 08:45:53 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id EB23821E692B; Fri,  3 Feb 2023 09:45:49 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org
Subject: [PULL 25/35] stats: Move QMP commands from monitor/ to stats/
Date: Fri,  3 Feb 2023 09:45:39 +0100
Message-Id: <20230203084549.2622302-26-armbru@redhat.com>
In-Reply-To: <20230203084549.2622302-1-armbru@redhat.com>
References: <20230203084549.2622302-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
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

This moves these commands from MAINTAINERS section "QMP" to new
section "Stats".  Status is Orphan.  Volunteers welcome!

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20230124121946.1139465-23-armbru@redhat.com>
---
 MAINTAINERS                         |   5 +
 meson.build                         |   1 +
 include/{monitor => sysemu}/stats.h |   0
 accel/kvm/kvm-all.c                 |   2 +-
 monitor/qmp-cmds.c                  | 152 --------------------------
 stats/stats-qmp-cmds.c              | 162 ++++++++++++++++++++++++++++
 stats/meson.build                   |   1 +
 7 files changed, 170 insertions(+), 153 deletions(-)
 rename include/{monitor => sysemu}/stats.h (100%)
 create mode 100644 stats/stats-qmp-cmds.c
 create mode 100644 stats/meson.build

diff --git a/MAINTAINERS b/MAINTAINERS
index b2f1d2518b..b377ac1476 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3038,6 +3038,11 @@ F: net/slirp.c
 F: include/net/slirp.h
 T: git https://people.debian.org/~sthibault/qemu.git slirp
 
+Stats
+S: Orphan
+F: include/sysemu/stats.h
+F: stats/
+
 Streams
 M: Edgar E. Iglesias <edgar.iglesias@gmail.com>
 S: Maintained
diff --git a/meson.build b/meson.build
index 6d3b665629..57b35d721e 100644
--- a/meson.build
+++ b/meson.build
@@ -3132,6 +3132,7 @@ subdir('monitor')
 subdir('net')
 subdir('replay')
 subdir('semihosting')
+subdir('stats')
 subdir('tcg')
 subdir('fpu')
 subdir('accel')
diff --git a/include/monitor/stats.h b/include/sysemu/stats.h
similarity index 100%
rename from include/monitor/stats.h
rename to include/sysemu/stats.h
diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index 7e6a6076b1..9b26582655 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -50,7 +50,7 @@
 #include "qemu/range.h"
 
 #include "hw/boards.h"
-#include "monitor/stats.h"
+#include "sysemu/stats.h"
 
 /* This check must be after config-host.h is included */
 #ifdef CONFIG_EVENTFD
diff --git a/monitor/qmp-cmds.c b/monitor/qmp-cmds.c
index 4a8d1e9a15..ab23e52f97 100644
--- a/monitor/qmp-cmds.c
+++ b/monitor/qmp-cmds.c
@@ -25,13 +25,11 @@
 #include "qapi/qapi-commands-acpi.h"
 #include "qapi/qapi-commands-control.h"
 #include "qapi/qapi-commands-misc.h"
-#include "qapi/qapi-commands-stats.h"
 #include "qapi/type-helpers.h"
 #include "hw/mem/memory-device.h"
 #include "hw/acpi/acpi_dev_interface.h"
 #include "hw/intc/intc.h"
 #include "hw/rdma/rdma.h"
-#include "monitor/stats.h"
 
 NameInfo *qmp_query_name(Error **errp)
 {
@@ -174,153 +172,3 @@ ACPIOSTInfoList *qmp_query_acpi_ospm_status(Error **errp)
 
     return head;
 }
-
-typedef struct StatsCallbacks {
-    StatsProvider provider;
-    StatRetrieveFunc *stats_cb;
-    SchemaRetrieveFunc *schemas_cb;
-    QTAILQ_ENTRY(StatsCallbacks) next;
-} StatsCallbacks;
-
-static QTAILQ_HEAD(, StatsCallbacks) stats_callbacks =
-    QTAILQ_HEAD_INITIALIZER(stats_callbacks);
-
-void add_stats_callbacks(StatsProvider provider,
-                         StatRetrieveFunc *stats_fn,
-                         SchemaRetrieveFunc *schemas_fn)
-{
-    StatsCallbacks *entry = g_new(StatsCallbacks, 1);
-    entry->provider = provider;
-    entry->stats_cb = stats_fn;
-    entry->schemas_cb = schemas_fn;
-
-    QTAILQ_INSERT_TAIL(&stats_callbacks, entry, next);
-}
-
-static bool invoke_stats_cb(StatsCallbacks *entry,
-                            StatsResultList **stats_results,
-                            StatsFilter *filter, StatsRequest *request,
-                            Error **errp)
-{
-    ERRP_GUARD();
-    strList *targets = NULL;
-    strList *names = NULL;
-
-    if (request) {
-        if (request->provider != entry->provider) {
-            return true;
-        }
-        if (request->has_names && !request->names) {
-            return true;
-        }
-        names = request->has_names ? request->names : NULL;
-    }
-
-    switch (filter->target) {
-    case STATS_TARGET_VM:
-        break;
-    case STATS_TARGET_VCPU:
-        if (filter->u.vcpu.has_vcpus) {
-            if (!filter->u.vcpu.vcpus) {
-                /* No targets allowed?  Return no statistics.  */
-                return true;
-            }
-            targets = filter->u.vcpu.vcpus;
-        }
-        break;
-    default:
-        abort();
-    }
-
-    entry->stats_cb(stats_results, filter->target, names, targets, errp);
-    if (*errp) {
-        qapi_free_StatsResultList(*stats_results);
-        *stats_results = NULL;
-        return false;
-    }
-    return true;
-}
-
-StatsResultList *qmp_query_stats(StatsFilter *filter, Error **errp)
-{
-    StatsResultList *stats_results = NULL;
-    StatsCallbacks *entry;
-    StatsRequestList *request;
-
-    QTAILQ_FOREACH(entry, &stats_callbacks, next) {
-        if (filter->has_providers) {
-            for (request = filter->providers; request; request = request->next) {
-                if (!invoke_stats_cb(entry, &stats_results, filter,
-                                     request->value, errp)) {
-                    break;
-                }
-            }
-        } else {
-            if (!invoke_stats_cb(entry, &stats_results, filter, NULL, errp)) {
-                break;
-            }
-        }
-    }
-
-    return stats_results;
-}
-
-StatsSchemaList *qmp_query_stats_schemas(bool has_provider,
-                                         StatsProvider provider,
-                                         Error **errp)
-{
-    ERRP_GUARD();
-    StatsSchemaList *stats_results = NULL;
-    StatsCallbacks *entry;
-
-    QTAILQ_FOREACH(entry, &stats_callbacks, next) {
-        if (!has_provider || provider == entry->provider) {
-            entry->schemas_cb(&stats_results, errp);
-            if (*errp) {
-                qapi_free_StatsSchemaList(stats_results);
-                return NULL;
-            }
-        }
-    }
-
-    return stats_results;
-}
-
-void add_stats_entry(StatsResultList **stats_results, StatsProvider provider,
-                     const char *qom_path, StatsList *stats_list)
-{
-    StatsResult *entry = g_new0(StatsResult, 1);
-
-    entry->provider = provider;
-    entry->qom_path = g_strdup(qom_path);
-    entry->stats = stats_list;
-
-    QAPI_LIST_PREPEND(*stats_results, entry);
-}
-
-void add_stats_schema(StatsSchemaList **schema_results,
-                      StatsProvider provider, StatsTarget target,
-                      StatsSchemaValueList *stats_list)
-{
-    StatsSchema *entry = g_new0(StatsSchema, 1);
-
-    entry->provider = provider;
-    entry->target = target;
-    entry->stats = stats_list;
-    QAPI_LIST_PREPEND(*schema_results, entry);
-}
-
-bool apply_str_list_filter(const char *string, strList *list)
-{
-    strList *str_list = NULL;
-
-    if (!list) {
-        return true;
-    }
-    for (str_list = list; str_list; str_list = str_list->next) {
-        if (g_str_equal(string, str_list->value)) {
-            return true;
-        }
-    }
-    return false;
-}
diff --git a/stats/stats-qmp-cmds.c b/stats/stats-qmp-cmds.c
new file mode 100644
index 0000000000..bc973747fb
--- /dev/null
+++ b/stats/stats-qmp-cmds.c
@@ -0,0 +1,162 @@
+/*
+ * QMP commands related to stats
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or
+ * (at your option) any later version.
+ */
+
+#include "qemu/osdep.h"
+#include "sysemu/stats.h"
+#include "qapi/qapi-commands-stats.h"
+#include "qemu/queue.h"
+#include "qapi/error.h"
+
+typedef struct StatsCallbacks {
+    StatsProvider provider;
+    StatRetrieveFunc *stats_cb;
+    SchemaRetrieveFunc *schemas_cb;
+    QTAILQ_ENTRY(StatsCallbacks) next;
+} StatsCallbacks;
+
+static QTAILQ_HEAD(, StatsCallbacks) stats_callbacks =
+    QTAILQ_HEAD_INITIALIZER(stats_callbacks);
+
+void add_stats_callbacks(StatsProvider provider,
+                         StatRetrieveFunc *stats_fn,
+                         SchemaRetrieveFunc *schemas_fn)
+{
+    StatsCallbacks *entry = g_new(StatsCallbacks, 1);
+    entry->provider = provider;
+    entry->stats_cb = stats_fn;
+    entry->schemas_cb = schemas_fn;
+
+    QTAILQ_INSERT_TAIL(&stats_callbacks, entry, next);
+}
+
+static bool invoke_stats_cb(StatsCallbacks *entry,
+                            StatsResultList **stats_results,
+                            StatsFilter *filter, StatsRequest *request,
+                            Error **errp)
+{
+    ERRP_GUARD();
+    strList *targets = NULL;
+    strList *names = NULL;
+
+    if (request) {
+        if (request->provider != entry->provider) {
+            return true;
+        }
+        if (request->has_names && !request->names) {
+            return true;
+        }
+        names = request->has_names ? request->names : NULL;
+    }
+
+    switch (filter->target) {
+    case STATS_TARGET_VM:
+        break;
+    case STATS_TARGET_VCPU:
+        if (filter->u.vcpu.has_vcpus) {
+            if (!filter->u.vcpu.vcpus) {
+                /* No targets allowed?  Return no statistics.  */
+                return true;
+            }
+            targets = filter->u.vcpu.vcpus;
+        }
+        break;
+    default:
+        abort();
+    }
+
+    entry->stats_cb(stats_results, filter->target, names, targets, errp);
+    if (*errp) {
+        qapi_free_StatsResultList(*stats_results);
+        *stats_results = NULL;
+        return false;
+    }
+    return true;
+}
+
+StatsResultList *qmp_query_stats(StatsFilter *filter, Error **errp)
+{
+    StatsResultList *stats_results = NULL;
+    StatsCallbacks *entry;
+    StatsRequestList *request;
+
+    QTAILQ_FOREACH(entry, &stats_callbacks, next) {
+        if (filter->has_providers) {
+            for (request = filter->providers; request; request = request->next) {
+                if (!invoke_stats_cb(entry, &stats_results, filter,
+                                     request->value, errp)) {
+                    break;
+                }
+            }
+        } else {
+            if (!invoke_stats_cb(entry, &stats_results, filter, NULL, errp)) {
+                break;
+            }
+        }
+    }
+
+    return stats_results;
+}
+
+StatsSchemaList *qmp_query_stats_schemas(bool has_provider,
+                                         StatsProvider provider,
+                                         Error **errp)
+{
+    ERRP_GUARD();
+    StatsSchemaList *stats_results = NULL;
+    StatsCallbacks *entry;
+
+    QTAILQ_FOREACH(entry, &stats_callbacks, next) {
+        if (!has_provider || provider == entry->provider) {
+            entry->schemas_cb(&stats_results, errp);
+            if (*errp) {
+                qapi_free_StatsSchemaList(stats_results);
+                return NULL;
+            }
+        }
+    }
+
+    return stats_results;
+}
+
+void add_stats_entry(StatsResultList **stats_results, StatsProvider provider,
+                     const char *qom_path, StatsList *stats_list)
+{
+    StatsResult *entry = g_new0(StatsResult, 1);
+
+    entry->provider = provider;
+    entry->qom_path = g_strdup(qom_path);
+    entry->stats = stats_list;
+
+    QAPI_LIST_PREPEND(*stats_results, entry);
+}
+
+void add_stats_schema(StatsSchemaList **schema_results,
+                      StatsProvider provider, StatsTarget target,
+                      StatsSchemaValueList *stats_list)
+{
+    StatsSchema *entry = g_new0(StatsSchema, 1);
+
+    entry->provider = provider;
+    entry->target = target;
+    entry->stats = stats_list;
+    QAPI_LIST_PREPEND(*schema_results, entry);
+}
+
+bool apply_str_list_filter(const char *string, strList *list)
+{
+    strList *str_list = NULL;
+
+    if (!list) {
+        return true;
+    }
+    for (str_list = list; str_list; str_list = str_list->next) {
+        if (g_str_equal(string, str_list->value)) {
+            return true;
+        }
+    }
+    return false;
+}
diff --git a/stats/meson.build b/stats/meson.build
new file mode 100644
index 0000000000..4ddb4d096b
--- /dev/null
+++ b/stats/meson.build
@@ -0,0 +1 @@
+softmmu_ss.add(files('stats-qmp-cmds.c'))
-- 
2.39.0


