Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3123F53117D
	for <lists+qemu-devel@lfdr.de>; Mon, 23 May 2022 17:11:55 +0200 (CEST)
Received: from localhost ([::1]:38956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nt9is-0007ug-6A
	for lists+qemu-devel@lfdr.de; Mon, 23 May 2022 11:11:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nt9ec-0005Vw-Mw
 for qemu-devel@nongnu.org; Mon, 23 May 2022 11:07:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43379)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nt9eZ-00008j-5k
 for qemu-devel@nongnu.org; Mon, 23 May 2022 11:07:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653318446;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=e5kH2e/JISKOgGdha6K82Aotay9TUJvqrB7EiF63p3U=;
 b=Exx0yp6TKNy1g56C4BxrDt0L+QF25ARPR0F1m+Nq0sFIQO4/uP4bld5uYwZOxWowwFOe3v
 hgAhY/+g9wzMyzUoCkoQ7Trt2mYztb4qN7X9lxvTRKKumtrEqOrtgkCOJFuBJWMuKFYKkT
 Ig5ACrCjCKFkYskSh4hF2D4v7epxUzk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-192-EM3eNqoON521LspWC52MfA-1; Mon, 23 May 2022 11:07:25 -0400
X-MC-Unique: EM3eNqoON521LspWC52MfA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C5DBE382ECC2;
 Mon, 23 May 2022 15:07:24 +0000 (UTC)
Received: from avogadro.redhat.com (unknown [10.39.195.170])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9608840C1438;
 Mon, 23 May 2022 15:07:23 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: armbru@redhat.com,
	Mark Kanda <mark.kanda@oracle.com>
Subject: [PATCH 1/8] qmp: Support for querying stats
Date: Mon, 23 May 2022 17:07:15 +0200
Message-Id: <20220523150722.349700-1-pbonzini@redhat.com>
In-Reply-To: <20220523150509.349412-1-pbonzini@redhat.com>
References: <20220523150509.349412-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
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

From: Mark Kanda <mark.kanda@oracle.com>

Gathering statistics is important for development, for monitoring and
for performance measurement.  There are tools such as kvm_stat that do
this and they rely on the _user_ knowing the interesting data points
rather than the tool (which can treat them as opaque).

The commands introduced in this commit introduce QMP support for
querying stats; the goal is to take the capabilities of these tools
and making them available throughout the whole virtualization stack,
so that one can observe, monitor and measure virtual machines without
having shell access + root on the host that runs them.

query-stats returns a list of all stats per target type (only VM
and vCPU to start); future commits add extra options for specifying
stat names, vCPU qom paths, and providers.  All these are used by the
HMP command "info stats".  Because of the development usecases around
statistics, a good HMP interface is important.

query-stats-schemas returns a list of stats included in each target
type, with an option for specifying the provider.  The concepts in the
schema are based on the KVM binary stats' own introspection data, just
translated to QAPI.

There are two reasons to have a separate schema that is not tied to
the QAPI schema.  The first is the contents of the schemas: the new
introspection data provides different information than the QAPI data,
namely unit of measurement, how the numbers are gathered and change
(peak/instant/cumulative/histogram), and histogram bucket sizes.
There's really no reason to have this kind of metadata in the QAPI
introspection schema (except possibly for the unit of measure, but
there's a very weak justification).

Another reason is the dynamicity of the schema.  The QAPI introspection
data is very much static; and while QOM is somewhat more dynamic,
generally we consider that to be a bug rather than a feature these days.
On the other hand, the statistics that are exposed by QEMU might be
passed through from another source, such as KVM, and the disadvantages of
manually updating the QAPI schema for outweight the benefits from vetting
the statistics and filtering out anything that seems "too unstable".
Running old QEMU with new kernel is a supported usecase; if old QEMU
cannot expose statistics from a new kernel, or if a kernel developer
needs to change QEMU before gathering new info from the new kernel,
then that is a poor user interface.

The framework provides a method to register callbacks for these QMP
commands.  Most of the work in fact is done by the callbacks, and a
large majority of this patch is new QAPI structs and commands.

Examples (with KVM stats):

- Query all VM stats:

{ "execute": "query-stats", "arguments" : { "target": "vm" } }

{ "return": [
     { "provider": "kvm",
       "stats": [
          { "name": "max_mmu_page_hash_collisions", "value": 0 },
          { "name": "max_mmu_rmap_size", "value": 0 },
          { "name": "nx_lpage_splits", "value": 148 },
          ... ] },
     { "provider": "xyz",
       "stats": [ ... ] }
] }

- Query all vCPU stats:

{ "execute": "query-stats", "arguments" : { "target": "vcpu" } }

{ "return": [
     { "provider": "kvm",
       "qom_path": "/machine/unattached/device[0]"
       "stats": [
          { "name": "guest_mode", "value": 0 },
          { "name": "directed_yield_successful", "value": 0 },
          { "name": "directed_yield_attempted", "value": 106 },
          ... ] },
     { "provider": "kvm",
       "qom_path": "/machine/unattached/device[1]"
       "stats": [
          { "name": "guest_mode", "value": 0 },
          { "name": "directed_yield_successful", "value": 0 },
          { "name": "directed_yield_attempted", "value": 106 },
          ... ] },
] }

- Retrieve the schemas:

{ "execute": "query-stats-schemas" }

{ "return": [
    { "provider": "kvm",
      "target": "vcpu",
      "stats": [
         { "name": "guest_mode",
           "unit": "none",
           "base": 10,
           "exponent": 0,
           "type": "instant" },
        { "name": "directed_yield_successful",
           "unit": "none",
           "base": 10,
           "exponent": 0,
           "type": "cumulative" },
        ... ]
    },
    { "provider": "kvm",
      "target": "vm",
      "stats": [
        { "name": "max_mmu_page_hash_collisions",
           "unit": "none",
           "base": 10,
           "exponent": 0,
           "type": "peak" },
        ... ]
    },
    { "provider": "xyz",
      "target": "vm",
      "stats": [ ... ]
    }
] }

Signed-off-by: Mark Kanda <mark.kanda@oracle.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
v3->v4: correctly handle errors from the callbacks

 include/monitor/stats.h |  34 +++++++
 monitor/qmp-cmds.c      |  82 +++++++++++++++
 qapi/meson.build        |   1 +
 qapi/qapi-schema.json   |   1 +
 qapi/stats.json         | 215 ++++++++++++++++++++++++++++++++++++++++
 5 files changed, 333 insertions(+)
 create mode 100644 include/monitor/stats.h
 create mode 100644 qapi/stats.json

diff --git a/include/monitor/stats.h b/include/monitor/stats.h
new file mode 100644
index 0000000000..912eeadb2f
--- /dev/null
+++ b/include/monitor/stats.h
@@ -0,0 +1,34 @@
+/*
+ * Copyright (c) 2022 Oracle and/or its affiliates.
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.
+ * See the COPYING file in the top-level directory.
+ */
+
+#ifndef STATS_H
+#define STATS_H
+
+#include "qapi/qapi-types-stats.h"
+
+typedef void StatRetrieveFunc(StatsResultList **result, StatsTarget target,
+                              Error **errp);
+typedef void SchemaRetrieveFunc(StatsSchemaList **result, Error **errp);
+
+/*
+ * Register callbacks for the QMP query-stats command.
+ *
+ * @stats_fn: routine to query stats:
+ * @schema_fn: routine to query stat schemas:
+ */
+void add_stats_callbacks(StatRetrieveFunc *stats_fn,
+                         SchemaRetrieveFunc *schemas_fn);
+
+/*
+ * Helper routines for adding stats entries to the results lists.
+ */
+void add_stats_entry(StatsResultList **, StatsProvider, const char *id,
+                     StatsList *stats_list);
+void add_stats_schema(StatsSchemaList **, StatsProvider, StatsTarget,
+                      StatsSchemaValueList *);
+
+#endif /* STATS_H */
diff --git a/monitor/qmp-cmds.c b/monitor/qmp-cmds.c
index 1ebb89f46c..d65c5f0257 100644
--- a/monitor/qmp-cmds.c
+++ b/monitor/qmp-cmds.c
@@ -35,6 +35,7 @@
 #include "qapi/qapi-commands-control.h"
 #include "qapi/qapi-commands-machine.h"
 #include "qapi/qapi-commands-misc.h"
+#include "qapi/qapi-commands-stats.h"
 #include "qapi/qapi-commands-ui.h"
 #include "qapi/type-helpers.h"
 #include "qapi/qmp/qerror.h"
@@ -43,6 +44,7 @@
 #include "hw/acpi/acpi_dev_interface.h"
 #include "hw/intc/intc.h"
 #include "hw/rdma/rdma.h"
+#include "monitor/stats.h"
 
 NameInfo *qmp_query_name(Error **errp)
 {
@@ -441,3 +443,83 @@ HumanReadableText *qmp_x_query_irq(Error **errp)
 
     return human_readable_text_from_str(buf);
 }
+
+typedef struct StatsCallbacks {
+    StatRetrieveFunc *stats_cb;
+    SchemaRetrieveFunc *schemas_cb;
+    QTAILQ_ENTRY(StatsCallbacks) next;
+} StatsCallbacks;
+
+static QTAILQ_HEAD(, StatsCallbacks) stats_callbacks =
+    QTAILQ_HEAD_INITIALIZER(stats_callbacks);
+
+void add_stats_callbacks(StatRetrieveFunc *stats_fn,
+                         SchemaRetrieveFunc *schemas_fn)
+{
+    StatsCallbacks *entry = g_new(StatsCallbacks, 1);
+    entry->stats_cb = stats_fn;
+    entry->schemas_cb = schemas_fn;
+
+    QTAILQ_INSERT_TAIL(&stats_callbacks, entry, next);
+}
+
+StatsResultList *qmp_query_stats(StatsFilter *filter, Error **errp)
+{
+    StatsResultList *stats_results = NULL;
+    StatsCallbacks *entry;
+    ERRP_GUARD();
+
+    QTAILQ_FOREACH(entry, &stats_callbacks, next) {
+        entry->stats_cb(&stats_results, filter->target, errp);
+        if (*errp) {
+            qapi_free_StatsResultList(stats_results);
+            return NULL;
+        }
+    }
+
+    return stats_results;
+}
+
+StatsSchemaList *qmp_query_stats_schemas(Error **errp)
+{
+    StatsSchemaList *stats_results = NULL;
+    StatsCallbacks *entry;
+    ERRP_GUARD();
+
+    QTAILQ_FOREACH(entry, &stats_callbacks, next) {
+        entry->schemas_cb(&stats_results, errp);
+        if (*errp) {
+            qapi_free_StatsSchemaList(stats_results);
+            return NULL;
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
+    if (qom_path) {
+        entry->has_qom_path = true;
+        entry->qom_path = g_strdup(qom_path);
+    }
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
diff --git a/qapi/meson.build b/qapi/meson.build
index 656ef0e039..fd5c93d643 100644
--- a/qapi/meson.build
+++ b/qapi/meson.build
@@ -46,6 +46,7 @@ qapi_all_modules = [
   'replay',
   'run-state',
   'sockets',
+  'stats',
   'trace',
   'transaction',
   'yank',
diff --git a/qapi/qapi-schema.json b/qapi/qapi-schema.json
index 4912b9744e..92d7ecc52c 100644
--- a/qapi/qapi-schema.json
+++ b/qapi/qapi-schema.json
@@ -93,3 +93,4 @@
 { 'include': 'audio.json' }
 { 'include': 'acpi.json' }
 { 'include': 'pci.json' }
+{ 'include': 'stats.json' }
diff --git a/qapi/stats.json b/qapi/stats.json
new file mode 100644
index 0000000000..650d883297
--- /dev/null
+++ b/qapi/stats.json
@@ -0,0 +1,215 @@
+# -*- Mode: Python -*-
+# vim: filetype=python
+#
+# Copyright (c) 2022 Oracle and/or its affiliates.
+#
+# This work is licensed under the terms of the GNU GPL, version 2 or later.
+# See the COPYING file in the top-level directory.
+#
+# SPDX-License-Identifier: GPL-2.0-or-later
+
+##
+# = Statistics
+##
+
+##
+# @StatsType:
+#
+# Enumeration of statistics types
+#
+# @cumulative: stat is cumulative; value can only increase.
+# @instant: stat is instantaneous; value can increase or decrease.
+# @peak: stat is the peak value; value can only increase.
+# @linear-histogram: stat is a linear histogram.
+# @log2-histogram: stat is a logarithmic histogram, with one bucket
+#                  for each power of two.
+#
+# Since: 7.1
+##
+{ 'enum' : 'StatsType',
+  'data' : [ 'cumulative', 'instant', 'peak', 'linear-histogram', 'log2-histogram' ] }
+
+##
+# @StatsUnit:
+#
+# Enumeration of unit of measurement for statistics
+#
+# @bytes: stat reported in bytes.
+# @seconds: stat reported in seconds.
+# @cycles: stat reported in clock cycles.
+#
+# Since: 7.1
+##
+{ 'enum' : 'StatsUnit',
+  'data' : [ 'bytes', 'seconds', 'cycles' ] }
+
+##
+# @StatsProvider:
+#
+# Enumeration of statistics providers.
+#
+# Since: 7.1
+##
+{ 'enum': 'StatsProvider',
+  'data': [ ] }
+
+##
+# @StatsTarget:
+#
+# The kinds of objects on which one can request statistics.
+#
+# @vm: statistics that apply to the entire virtual machine or
+#      the entire QEMU process.
+#
+# @vcpu: statistics that apply to a single virtual CPU.
+#
+# Since: 7.1
+##
+{ 'enum': 'StatsTarget',
+  'data': [ 'vm', 'vcpu' ] }
+
+##
+# @StatsFilter:
+#
+# The arguments to the query-stats command; specifies a target for which to
+# request statistics.
+#
+# Since: 7.1
+##
+{ 'struct': 'StatsFilter',
+  'data': { 'target': 'StatsTarget' } }
+
+##
+# @StatsValue:
+#
+# @scalar: single unsigned 64-bit integers.
+# @list: list of unsigned 64-bit integers (used for histograms).
+#
+# Since: 7.1
+##
+{ 'alternate': 'StatsValue',
+  'data': { 'scalar': 'uint64',
+            'list': [ 'uint64' ] } }
+
+##
+# @Stats:
+#
+# @name: name of stat.
+# @value: stat value.
+#
+# Since: 7.1
+##
+{ 'struct': 'Stats',
+  'data': { 'name': 'str',
+            'value' : 'StatsValue' } }
+
+##
+# @StatsResult:
+#
+# @provider: provider for this set of statistics.
+#
+# @qom-path: Path to the object for which the statistics are returned,
+#            if the object is exposed in the QOM tree
+#
+# @stats: list of statistics.
+#
+# Since: 7.1
+##
+{ 'struct': 'StatsResult',
+  'data': { 'provider': 'StatsProvider',
+            '*qom-path': 'str',
+            'stats': [ 'Stats' ] } }
+
+##
+# @query-stats:
+#
+# Return runtime-collected statistics for objects such as the
+# VM or its vCPUs.
+#
+# The arguments are a StatsFilter and specify the provider and objects
+# to return statistics about.
+#
+# Returns: a list of StatsResult, one for each provider and object
+#          (e.g., for each vCPU).
+#
+# Since: 7.1
+##
+{ 'command': 'query-stats',
+  'data': 'StatsFilter',
+  'boxed': true,
+  'returns': [ 'StatsResult' ] }
+
+##
+# @StatsSchemaValue:
+#
+# Schema for a single statistic.
+#
+# @name: name of the statistic; each element of the schema is uniquely
+#        identified by a target, a provider (both available in @StatsSchema)
+#        and the name.
+#
+# @type: kind of statistic.
+#
+# @unit: basic unit of measure for the statistic; if missing, the statistic
+#        is a simple number or counter.
+#
+# @base: base for the multiple of @unit in which the statistic is measured.
+#        Only present if @exponent is non-zero; @base and @exponent together
+#        form a SI prefix (e.g., _nano-_ for ``base=10`` and ``exponent=-9``)
+#        or IEC binary prefix (e.g. _kibi-_ for ``base=2`` and ``exponent=10``)
+#
+# @exponent: exponent for the multiple of @unit in which the statistic is
+#            expressed, or 0 for the basic unit
+#
+# @bucket-size: Present when @type is "linear-histogram", contains the width
+#               of each bucket of the histogram.
+#
+# Since: 7.1
+##
+{ 'struct': 'StatsSchemaValue',
+  'data': { 'name': 'str',
+            'type': 'StatsType',
+            '*unit': 'StatsUnit',
+            '*base': 'int8',
+            'exponent': 'int16',
+            '*bucket-size': 'uint32' } }
+
+##
+# @StatsSchema:
+#
+# Schema for all available statistics for a provider and target.
+#
+# @provider: provider for this set of statistics.
+#
+# @target: the kind of object that can be queried through the provider.
+#
+# @stats: list of statistics.
+#
+# Since: 7.1
+##
+{ 'struct': 'StatsSchema',
+  'data': { 'provider': 'StatsProvider',
+            'target': 'StatsTarget',
+            'stats': [ 'StatsSchemaValue' ] } }
+
+##
+# @query-stats-schemas:
+#
+# Return the schema for all available runtime-collected statistics.
+#
+# Note: runtime-collected statistics and their names fall outside QEMU's
+# usual deprecation policies.  QEMU will try to keep the set of available
+# data stable, together with their names, but will not guarantee stability
+# at all costs; the same is true of providers that source statistics
+# externally, e.g. from Linux.  For example, if the same value is being
+# tracked with different names on different architectures or by different
+# providers, one of them might be renamed.  A statistic might go away if
+# an algorithm is changed or some code is removed; changing a default might
+# cause previously useful statistics to always report 0.  Such changes,
+# however, are expected to be rare.
+#
+# Since: 7.1
+##
+{ 'command': 'query-stats-schemas',
+  'data': { },
+  'returns': [ 'StatsSchema' ] }
-- 
2.36.0



