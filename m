Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16342510041
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 16:18:56 +0200 (CEST)
Received: from localhost ([::1]:42304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njM1n-0008GA-3p
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 10:18:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1njLzO-0005RD-LC
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 10:16:26 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:38426)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1njLzM-0005W3-9N
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 10:16:26 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 1-20020a05600c248100b00393fbf11a05so580240wms.3
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 07:16:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CCO3cumqklouz/cXZlyJMH925uFvy/ejsoSwQmeA6f0=;
 b=Sn7kYMV6y1VsV4TV9HXiamz9doZCOUwBnPb5RCG+g6iAUkRnpkgVn0xYlgezMZ7XuM
 Vq69vzahhnl+APD58oqw2hFQU5jyCgMEynqj8BygqyQPXf5/1S0xqXRD7R+bY0PiWrTK
 bjWRYNgu6cwyNZDurE79c0GQyrpBzyX0mAwhZc2i4d5cQ/F+d/drIybu8S1eFpcY/83M
 ytTyBuDaqKTIdaLk8mgVVju5g6UfH9hlrqI9es2BsaJh81eX6ntimtJtd5/d1ybQ4Xh6
 T0t+aU1D0b6f3A/+t8jnLspFiAZGiU56vF2TbbkgpXj0BWNidJguq9qTAZsnxPcWtb5H
 oxxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=CCO3cumqklouz/cXZlyJMH925uFvy/ejsoSwQmeA6f0=;
 b=HCWHU1p2j7uT6cAPZ9SnrhJUZiaJiN+9xwkzYpJxKMR934C9rJqzfiq6ieoWiTYCOo
 xDvgjXpW3FIdmDB0RJbaIDldmWcrGBiLTjLgiyQSsYEx2xiUIymhWbJmOPkWDlwBQ1Jw
 tarsXH26eCh9rWQKYZXR1SyfNS9KvHoVoxDUDFDYo/12kR1wa8oY8Vvk/oLuzmB7sO0A
 1ZQ4GNNjPyRpOju9UtWW/K6u/zVc6n7lvW2J8APq3rmkjB6Noj27Wz4MeBUlfwFqNtPH
 mlS2pKCrpl9bjN2RLcti0XIrAqlKiB5vT2cgunWjR3PW2Ph+gImDhP/ZxUQWsp4vLlJt
 MDvg==
X-Gm-Message-State: AOAM533eWCKhxWk0EFMfZegBeAkQPGNHra8/GwaLaJe6T48AuhIzsnZd
 M0w2Pi663lvgIIQcEf+/nMxkcUuq2SIC7g==
X-Google-Smtp-Source: ABdhPJzWirqLIpkcjF3Ez7HLQva57A1i2n3sp0LuBhqVPy4m34lSmMWj7D7AD27py4qrXyAjoIBRTA==
X-Received: by 2002:a7b:c20c:0:b0:38f:fac1:fe05 with SMTP id
 x12-20020a7bc20c000000b0038ffac1fe05mr31261011wmi.144.1650982582433; 
 Tue, 26 Apr 2022 07:16:22 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:e3ec:5559:7c5c:1928])
 by smtp.gmail.com with ESMTPSA id
 o6-20020a05600c378600b0038eca3cdbb3sm11206464wmr.13.2022.04.26.07.16.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 07:16:22 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/8] qmp: Support for querying stats
Date: Tue, 26 Apr 2022 16:16:12 +0200
Message-Id: <20220426141619.304611-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220426141619.304611-1-pbonzini@redhat.com>
References: <20220426141619.304611-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x332.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: berrange@redhat.com, armbru@redhat.com, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Mark Kanda <mark.kanda@oracle.com>

Introduce QMP support for querying stats. Provide a framework for adding new
stats and support for the following commands:

- query-stats
Returns a list of all stats per target type (only VM and vCPU to start), with
additional options for specifying stat names, vCPU qom paths, and providers.

- query-stats-schemas
Returns a list of stats included in each target type, with an option for
specifying the provider.  The concepts in the schema are based on the
KVM binary stats' own introspection data, just translated to QAPI.

The framework provides a method to register callbacks for these QMP commands.
Most of the work in fact is done by the callbacks, and a large majority of
this patch is new QAPI structs and commands.

The first use-case will be for fd-based KVM stats (in an upcoming patch).

Examples (with fd-based KVM stats):

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
 include/monitor/stats.h |  33 +++++++
 monitor/qmp-cmds.c      |  71 +++++++++++++++
 qapi/meson.build        |   1 +
 qapi/qapi-schema.json   |   1 +
 qapi/stats.json         | 192 ++++++++++++++++++++++++++++++++++++++++
 5 files changed, 298 insertions(+)
 create mode 100644 include/monitor/stats.h
 create mode 100644 qapi/stats.json

diff --git a/include/monitor/stats.h b/include/monitor/stats.h
new file mode 100644
index 0000000000..89552ab06f
--- /dev/null
+++ b/include/monitor/stats.h
@@ -0,0 +1,33 @@
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
+typedef void StatRetrieveFunc(StatsResultList **result, StatsTarget target, Error **errp);
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
index 5e7302cbb9..97825b25fa 100644
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
@@ -426,3 +428,72 @@ HumanReadableText *qmp_x_query_irq(Error **errp)
 
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
+
+    QTAILQ_FOREACH(entry, &stats_callbacks, next) {
+        entry->stats_cb(&stats_results, filter->target, errp);
+    }
+
+    return stats_results;
+}
+
+StatsSchemaList *qmp_query_stats_schemas(Error **errp)
+{
+    StatsSchemaList *stats_results = NULL;
+    StatsCallbacks *entry;
+
+    QTAILQ_FOREACH(entry, &stats_callbacks, next) {
+        entry->schemas_cb(&stats_results, errp);
+    }
+
+    return stats_results;
+}
+
+void add_stats_entry(StatsResultList **stats_results, StatsProvider provider,
+                     const char *qom_path, StatsList *stats_list)
+{
+    StatsResult *entry = g_new0(StatsResult, 1);
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
index 0000000000..7454dd7daa
--- /dev/null
+++ b/qapi/stats.json
@@ -0,0 +1,192 @@
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
+# @linear-hist: stat is a linear histogram.
+# @log-hist: stat is a logarithmic histogram.
+#
+# Since: 7.1
+##
+{ 'enum' : 'StatsType',
+  'data' : [ 'cumulative', 'instant', 'peak', 'linear-hist', 'log-hist' ] }
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
+# @vm: the entire virtual machine.
+# @vcpu: a virtual CPU.
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
+# request statistics, and which statistics are requested from each provider.
+#
+# Since: 7.1
+##
+{ 'struct': 'StatsFilter',
+  'data': { 'target': 'StatsTarget' } }
+
+##
+# @StatsValue:
+#
+# @scalar: single uint64.
+# @list: list of uint64.
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
+# @qom-path: QOM path of the object for which the statistics are returned
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
+# @name: stat name.
+#
+# @type: kind of statistic, a @StatType.
+#
+# @unit: base unit of measurement for the statistics @StatUnit.
+#
+# @base: base for the multiple of @unit that the statistic uses, either 2 or 10.
+#        Only present if @exponent is non-zero.
+#
+# @exponent: exponent for the multiple of @unit that the statistic uses
+#
+# @bucket-size: Used with linear-hist to report the width of each bucket
+#               of the histogram.
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
+# @target: kind of object that can be queried through this provider.
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
+# Since: 7.1
+##
+{ 'command': 'query-stats-schemas',
+  'data': { },
+  'returns': [ 'StatsSchema' ] }
-- 
2.35.1



