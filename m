Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E227531187
	for <lists+qemu-devel@lfdr.de>; Mon, 23 May 2022 17:16:14 +0200 (CEST)
Received: from localhost ([::1]:49346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nt9n3-000728-Oe
	for lists+qemu-devel@lfdr.de; Mon, 23 May 2022 11:16:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nt9el-0005rd-Bc
 for qemu-devel@nongnu.org; Mon, 23 May 2022 11:07:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45046)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nt9ej-00009t-Bj
 for qemu-devel@nongnu.org; Mon, 23 May 2022 11:07:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653318456;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jWJsr6yxVjbRD/uIh8DWVHS6y8TdKDs5i4FGVreGkNc=;
 b=TqEpTQnXonIXuyAFsKaAtwdIw2mMGsq8uzytJDGP/3TgV+Nm54EFu0SaoTDu+WpLcSAWif
 kmTGqD93vpRpmOKpuNoaTkyHt1Ojxt6CF+CTSA1YpxalpYyUSNj92BceHb9mAZRMIouYER
 xcfa9/RhoOzeDpwkFvcAakiHV2BBk20=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-20-DpiLXVfcNLSz9f5xbT_O8A-1; Mon, 23 May 2022 11:07:33 -0400
X-MC-Unique: DpiLXVfcNLSz9f5xbT_O8A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 383D229ABA2E;
 Mon, 23 May 2022 15:07:33 +0000 (UTC)
Received: from avogadro.redhat.com (unknown [10.39.195.170])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5E2E8400E400;
 Mon, 23 May 2022 15:07:32 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: armbru@redhat.com,
	Mark Kanda <mark.kanda@oracle.com>
Subject: [PATCH 7/8] qmp: add filtering of statistics by name
Date: Mon, 23 May 2022 17:07:21 +0200
Message-Id: <20220523150722.349700-7-pbonzini@redhat.com>
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

Allow retrieving only a subset of statistics.  This can be useful
for example in order to plot a subset of the statistics many times
a second.

KVM publishes ~40 statistics for each vCPU on x86; retrieving and
serializing all of them would be useless

Another use will be in HMP in the following patch; implementing the
filter in the backend is easy enough that it was deemed okay to make
this a public interface.

Example:

{ "execute": "query-stats",
  "arguments": {
    "target": "vcpu",
    "vcpus": [ "/machine/unattached/device[2]",
               "/machine/unattached/device[4]" ],
    "providers": [
      { "provider": "kvm",
        "names": [ "l1d_flush", "exits" ] } } }

{ "return": {
    "vcpus": [
      { "path": "/machine/unattached/device[2]"
        "providers": [
          { "provider": "kvm",
            "stats": [ { "name": "l1d_flush", "value": 41213 },
                       { "name": "exits", "value": 74291 } ] } ] },
      { "path": "/machine/unattached/device[4]"
        "providers": [
          { "provider": "kvm",
            "stats": [ { "name": "l1d_flush", "value": 16132 },
                       { "name": "exits", "value": 57922 } ] } ] } ] } }

Extracted from a patch by Mark Kanda.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
v3->v4: handle empty filter early by avoiding the query altogether

 accel/kvm/kvm-all.c     | 17 +++++++++++------
 include/monitor/stats.h |  4 ++--
 monitor/qmp-cmds.c      | 16 +++++++++++++---
 qapi/stats.json         |  6 +++++-
 4 files changed, 31 insertions(+), 12 deletions(-)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index 461b6cf927..a61d17719e 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -2311,7 +2311,7 @@ bool kvm_dirty_ring_enabled(void)
     return kvm_state->kvm_dirty_ring_size ? true : false;
 }
 
-static void query_stats_cb(StatsResultList **result, StatsTarget target,
+static void query_stats_cb(StatsResultList **result, StatsTarget target, strList *names,
                            strList *targets, Error **errp);
 static void query_stats_schemas_cb(StatsSchemaList **result, Error **errp);
 
@@ -3713,6 +3713,7 @@ typedef struct StatsArgs {
         StatsResultList **stats;
         StatsSchemaList **schema;
     } result;
+    strList *names;
     Error **errp;
 } StatsArgs;
 
@@ -3926,7 +3927,7 @@ static StatsDescriptors *find_stats_descriptors(StatsTarget target, int stats_fd
     return descriptors;
 }
 
-static void query_stats(StatsResultList **result, StatsTarget target,
+static void query_stats(StatsResultList **result, StatsTarget target, strList *names,
                         int stats_fd, Error **errp)
 {
     struct kvm_stats_desc *kvm_stats_desc;
@@ -3969,6 +3970,9 @@ static void query_stats(StatsResultList **result, StatsTarget target,
 
         /* Add entry to the list */
         stats = (void *)stats_data + pdesc->offset;
+        if (!apply_str_list_filter(pdesc->name, names)) {
+            continue;
+        }
         stats_list = add_kvmstat_entry(pdesc, stats, stats_list, errp);
     }
 
@@ -4030,8 +4034,8 @@ static void query_stats_vcpu(CPUState *cpu, run_on_cpu_data data)
         error_propagate(kvm_stats_args->errp, local_err);
         return;
     }
-    query_stats(kvm_stats_args->result.stats, STATS_TARGET_VCPU, stats_fd,
-                kvm_stats_args->errp);
+    query_stats(kvm_stats_args->result.stats, STATS_TARGET_VCPU,
+                kvm_stats_args->names, stats_fd, kvm_stats_args->errp);
     close(stats_fd);
 }
 
@@ -4052,7 +4056,7 @@ static void query_stats_schema_vcpu(CPUState *cpu, run_on_cpu_data data)
 }
 
 static void query_stats_cb(StatsResultList **result, StatsTarget target,
-                           strList *targets, Error **errp)
+                           strList *names, strList *targets, Error **errp)
 {
     KVMState *s = kvm_state;
     CPUState *cpu;
@@ -4066,7 +4070,7 @@ static void query_stats_cb(StatsResultList **result, StatsTarget target,
             error_setg(errp, "KVM stats: ioctl failed");
             return;
         }
-        query_stats(result, target, stats_fd, errp);
+        query_stats(result, target, names, stats_fd, errp);
         close(stats_fd);
         break;
     }
@@ -4074,6 +4078,7 @@ static void query_stats_cb(StatsResultList **result, StatsTarget target,
     {
         StatsArgs stats_args;
         stats_args.result.stats = result;
+        stats_args.names = names;
         stats_args.errp = errp;
         CPU_FOREACH(cpu) {
             if (!apply_str_list_filter(cpu->parent_obj.canonical_path, targets)) {
diff --git a/include/monitor/stats.h b/include/monitor/stats.h
index 840c4ed08e..88f046f568 100644
--- a/include/monitor/stats.h
+++ b/include/monitor/stats.h
@@ -11,8 +11,8 @@
 #include "qapi/qapi-types-stats.h"
 
 typedef void StatRetrieveFunc(StatsResultList **result, StatsTarget target,
-                              strList *targets, Error **errp);
-typedef void SchemaRetrieveFunc(StatsSchemaList **result, Error **errp);
+                              strList *names, strList *targets, Error **errp);
+typedef void SchemaRetrieveFunc(StatsSchemaList **, Error **);
 
 /*
  * Register callbacks for the QMP query-stats command.
diff --git a/monitor/qmp-cmds.c b/monitor/qmp-cmds.c
index 7be0e7414a..e822f1b0a9 100644
--- a/monitor/qmp-cmds.c
+++ b/monitor/qmp-cmds.c
@@ -467,15 +467,24 @@ void add_stats_callbacks(StatsProvider provider,
 }
 
 static bool stats_provider_requested(StatsProvider provider,
-                                     StatsFilter *filter)
+                                     StatsFilter *filter,
+                                     strList **p_names)
 {
     StatsRequestList *request;
 
+    *p_names = NULL;
     if (!filter->has_providers) {
         return true;
     }
     for (request = filter->providers; request; request = request->next) {
         if (request->value->provider == provider) {
+            if (request->value->has_names) {
+                if (!request->value->names) {
+                    /* No names allowed is the same as skipping the provider.  */
+                    return false;
+                }
+                *p_names = request->value->names;
+            }
             return true;
         }
     }
@@ -506,8 +515,9 @@ StatsResultList *qmp_query_stats(StatsFilter *filter, Error **errp)
     }
 
     QTAILQ_FOREACH(entry, &stats_callbacks, next) {
-        if (stats_provider_requested(entry->provider, filter)) {
-            entry->stats_cb(&stats_results, filter->target, targets, errp);
+        strList *names = NULL;
+        if (stats_provider_requested(entry->provider, filter, &names)) {
+            entry->stats_cb(&stats_results, filter->target, names, targets, errp);
             if (*errp) {
                 qapi_free_StatsResultList(stats_results);
                 return NULL;
diff --git a/qapi/stats.json b/qapi/stats.json
index b75bb86124..2dbf188d36 100644
--- a/qapi/stats.json
+++ b/qapi/stats.json
@@ -74,11 +74,14 @@
 # Indicates a set of statistics that should be returned by query-stats.
 #
 # @provider: provider for which to return statistics.
+
+# @names: statistics to be returned (all if omitted).
 #
 # Since: 7.1
 ##
 { 'struct': 'StatsRequest',
-  'data': { 'provider': 'StatsProvider' } }
+  'data': { 'provider': 'StatsProvider',
+            '*names': [ 'str' ] } }
 
 ##
 # @StatsVCPUFilter:
@@ -98,6 +101,7 @@
 # that target:
 # - which vCPUs to request statistics for
 # - which provider to request statistics from
+# - which values to return within each provider
 #
 # Since: 7.1
 ##
-- 
2.36.0



