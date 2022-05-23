Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6A01531180
	for <lists+qemu-devel@lfdr.de>; Mon, 23 May 2022 17:12:39 +0200 (CEST)
Received: from localhost ([::1]:41032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nt9ja-000147-Uu
	for lists+qemu-devel@lfdr.de; Mon, 23 May 2022 11:12:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nt9fT-0006Z7-7I
 for qemu-devel@nongnu.org; Mon, 23 May 2022 11:08:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60600)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nt9fR-0000DP-F6
 for qemu-devel@nongnu.org; Mon, 23 May 2022 11:08:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653318501;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xHIwgnKvODK2oFq4FtdMW3hr7+m+lBH1TYhbOyWqq4s=;
 b=WcPK0SXEHCKM51S1tfg6AfqdtoqaUD5LR+dKwxJDR98Oa08/1wYSsQ4YsfKHeht5oB17ji
 k38sQhwtslLW5Y4VQyZlhQ1VNmr0lCFViI78+zaZzASV49rz5SfZrcer1Tou6CAg6CuRim
 69ap5CMDHPZsYKXClbpKddQdDI8P+AY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-12-Sl0syMDPMeCFDJaUspyFNg-1; Mon, 23 May 2022 11:07:28 -0400
X-MC-Unique: Sl0syMDPMeCFDJaUspyFNg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3F2A62949BB5;
 Mon, 23 May 2022 15:07:28 +0000 (UTC)
Received: from avogadro.redhat.com (unknown [10.39.195.170])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 60810400E115;
 Mon, 23 May 2022 15:07:27 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: armbru@redhat.com,
	Mark Kanda <mark.kanda@oracle.com>
Subject: [PATCH 3/8] qmp: add filtering of statistics by target vCPU
Date: Mon, 23 May 2022 17:07:17 +0200
Message-Id: <20220523150722.349700-3-pbonzini@redhat.com>
In-Reply-To: <20220523150722.349700-1-pbonzini@redhat.com>
References: <20220523150509.349412-1-pbonzini@redhat.com>
 <20220523150722.349700-1-pbonzini@redhat.com>
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

Introduce a simple filtering of statistics, that allows to retrieve
statistics for a subset of the guest vCPUs.  This will be used for
example by the HMP monitor, in order to retrieve the statistics
for the currently selected CPU.

Example:
{ "execute": "query-stats",
  "arguments": {
    "target": "vcpu",
    "vcpus": [ "/machine/unattached/device[2]",
               "/machine/unattached/device[4]" ] } }

Extracted from a patch by Mark Kanda.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
v3->v4: renamed str_in_list to apply_str_list_filter
        handle empty filter early by avoiding the query altogether

 accel/kvm/kvm-all.c     |  9 +++++++--
 include/monitor/stats.h | 11 ++++++++++-
 monitor/qmp-cmds.c      | 34 +++++++++++++++++++++++++++++++++-
 qapi/stats.json         | 24 +++++++++++++++++++-----
 4 files changed, 69 insertions(+), 9 deletions(-)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index 6a6bbe2994..3ee431a431 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -2311,7 +2311,8 @@ bool kvm_dirty_ring_enabled(void)
     return kvm_state->kvm_dirty_ring_size ? true : false;
 }
 
-static void query_stats_cb(StatsResultList **result, StatsTarget target, Error **errp);
+static void query_stats_cb(StatsResultList **result, StatsTarget target,
+                           strList *targets, Error **errp);
 static void query_stats_schemas_cb(StatsSchemaList **result, Error **errp);
 
 static int kvm_init(MachineState *ms)
@@ -4049,7 +4050,8 @@ static void query_stats_schema_vcpu(CPUState *cpu, run_on_cpu_data data)
     close(stats_fd);
 }
 
-static void query_stats_cb(StatsResultList **result, StatsTarget target, Error **errp)
+static void query_stats_cb(StatsResultList **result, StatsTarget target,
+                           strList *targets, Error **errp)
 {
     KVMState *s = kvm_state;
     CPUState *cpu;
@@ -4073,6 +4075,9 @@ static void query_stats_cb(StatsResultList **result, StatsTarget target, Error *
         stats_args.result.stats = result;
         stats_args.errp = errp;
         CPU_FOREACH(cpu) {
+            if (!apply_str_list_filter(cpu->parent_obj.canonical_path, targets)) {
+                continue;
+            }
             run_on_cpu(cpu, query_stats_vcpu, RUN_ON_CPU_HOST_PTR(&stats_args));
         }
         break;
diff --git a/include/monitor/stats.h b/include/monitor/stats.h
index 912eeadb2f..8c50feeaa9 100644
--- a/include/monitor/stats.h
+++ b/include/monitor/stats.h
@@ -11,7 +11,7 @@
 #include "qapi/qapi-types-stats.h"
 
 typedef void StatRetrieveFunc(StatsResultList **result, StatsTarget target,
-                              Error **errp);
+                              strList *targets, Error **errp);
 typedef void SchemaRetrieveFunc(StatsSchemaList **result, Error **errp);
 
 /*
@@ -31,4 +31,13 @@ void add_stats_entry(StatsResultList **, StatsProvider, const char *id,
 void add_stats_schema(StatsSchemaList **, StatsProvider, StatsTarget,
                       StatsSchemaValueList *);
 
+/*
+ * True if a string matches the filter passed to the stats_fn callabck,
+ * false otherwise.
+ *
+ * Note that an empty list means no filtering, i.e. all strings will
+ * return true.
+ */
+bool apply_str_list_filter(const char *string, strList *list);
+
 #endif /* STATS_H */
diff --git a/monitor/qmp-cmds.c b/monitor/qmp-cmds.c
index d65c5f0257..ebf6f49446 100644
--- a/monitor/qmp-cmds.c
+++ b/monitor/qmp-cmds.c
@@ -466,11 +466,28 @@ void add_stats_callbacks(StatRetrieveFunc *stats_fn,
 StatsResultList *qmp_query_stats(StatsFilter *filter, Error **errp)
 {
     StatsResultList *stats_results = NULL;
+    strList *targets = NULL;
     StatsCallbacks *entry;
     ERRP_GUARD();
 
+    switch (filter->target) {
+    case STATS_TARGET_VM:
+        break;
+    case STATS_TARGET_VCPU:
+        if (filter->u.vcpu.has_vcpus) {
+            if (!filter->u.vcpu.vcpus) {
+                /* No targets allowed?  Return no statistics.  */
+                return NULL;
+            }
+            targets = filter->u.vcpu.vcpus;
+        }
+        break;
+    default:
+        abort();
+    }
+
     QTAILQ_FOREACH(entry, &stats_callbacks, next) {
-        entry->stats_cb(&stats_results, filter->target, errp);
+        entry->stats_cb(&stats_results, filter->target, targets, errp);
         if (*errp) {
             qapi_free_StatsResultList(stats_results);
             return NULL;
@@ -523,3 +540,18 @@ void add_stats_schema(StatsSchemaList **schema_results,
     entry->stats = stats_list;
     QAPI_LIST_PREPEND(*schema_results, entry);
 }
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
diff --git a/qapi/stats.json b/qapi/stats.json
index 1129ba49bc..e8ed907793 100644
--- a/qapi/stats.json
+++ b/qapi/stats.json
@@ -69,15 +69,29 @@
   'data': [ 'vm', 'vcpu' ] }
 
 ##
-# @StatsFilter:
+# @StatsVCPUFilter:
 #
-# The arguments to the query-stats command; specifies a target for which to
-# request statistics.
+# @vcpus: list of QOM paths for the desired vCPU objects.
 #
 # Since: 7.1
 ##
-{ 'struct': 'StatsFilter',
-  'data': { 'target': 'StatsTarget' } }
+{ 'struct': 'StatsVCPUFilter',
+  'data': { '*vcpus': [ 'str' ] } }
+
+##
+# @StatsFilter:
+#
+# The arguments to the query-stats command; specifies a target for which to
+# request statistics and optionally the required subset of information for
+# that target:
+# - which vCPUs to request statistics for
+#
+# Since: 7.1
+##
+{ 'union': 'StatsFilter',
+        'base': { 'target': 'StatsTarget' },
+  'discriminator': 'target',
+  'data': { 'vcpu': 'StatsVCPUFilter' } }
 
 ##
 # @StatsValue:
-- 
2.36.0



