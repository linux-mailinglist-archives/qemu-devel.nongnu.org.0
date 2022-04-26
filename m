Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D6CA510042
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 16:18:58 +0200 (CEST)
Received: from localhost ([::1]:42404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njM1p-0008Lb-3i
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 10:18:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1njLzS-0005VN-Um
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 10:16:31 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:52190)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1njLzR-0005XC-7H
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 10:16:30 -0400
Received: by mail-wm1-x32c.google.com with SMTP id q20so11306849wmq.1
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 07:16:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xAT2NmAOUeByJ+TmZzvBSZ4oQ+VvE5Og9SzgEmZjzAw=;
 b=f7+eYTjDoItH2unp04LGAHPILFVzF0K7dIVBxPgGedgIin1DPrX6qrL3rzMXOYpL6m
 1uz0TW9nBkg6aOr8SCvVfwkYqHFhlXEBWRov7ni6TlLUMS6bM/Bj4B8CE8ZLeUPv06+B
 ZEPt63R4Vx4PztxYfWN/ZixLJ6u6/cCfeuyluWHM9WPOTPIldnDwU1hTQHqeV7tikarz
 rDc2dDOChrESqMO+gk6eD9F2DkZFjDiLLZNbWiG+KdsWh76VhmxxuZN/h5mbOdqp7u89
 hF/++NW3BZtyWxvXvFC+1wgybHnYyfzcsypjgjNzO0kPdqW7Ni40KsQFFtz7rUv1ht+M
 kihw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=xAT2NmAOUeByJ+TmZzvBSZ4oQ+VvE5Og9SzgEmZjzAw=;
 b=g0rpFe0444jjRty+i6nZSZRAN+zAKYmyozsk79HNGZicUORKU4WbSEYo1gQK0yS2ZU
 pb1v0FBnIxncBZRSUhd9Y/innMQ2TRQCRzgTHaamvSF9ViZSkIinBIJjUUi/qqNZtVdd
 CSxFHOJUSjSIoQ62QyU0THugZnQ/ZhYKd+4nLMm1fSjBBfZzyvYyw9c8hB9C4Qwnlf8o
 9wcvHeRTLah6dQbcd8eExnGWjUbapuV8qEyPWte07UlKVv6S360dCjXluHUjOlw6/3KN
 /yJIaloRRQgQsmvTkYyWUV7C8r7fvHx4zBUgB0uapxkMdEYJcARmE51HrWuG51Ezf6M1
 VFwA==
X-Gm-Message-State: AOAM531kxhDCsWY/UqlthOj3pr1ym1RWVXsSHM4gAj03+YnNQf0yXJeU
 /bAJn7NZiqF2qxOvDxQVWsbAJ3tdYAaHXQ==
X-Google-Smtp-Source: ABdhPJzR0kzyTauT5xthIx85AuM70mAi+r1Hy5aiu/hLz6R/FBHMNaYbaeBhZMl30kZfYQ7AcY9M+Q==
X-Received: by 2002:a1c:7416:0:b0:38e:b8b7:e271 with SMTP id
 p22-20020a1c7416000000b0038eb8b7e271mr29716725wmc.7.1650982587919; 
 Tue, 26 Apr 2022 07:16:27 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:e3ec:5559:7c5c:1928])
 by smtp.gmail.com with ESMTPSA id
 o6-20020a05600c378600b0038eca3cdbb3sm11206464wmr.13.2022.04.26.07.16.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 07:16:27 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 7/8] qmp: add filtering of statistics by name
Date: Tue, 26 Apr 2022 16:16:18 +0200
Message-Id: <20220426141619.304611-8-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220426141619.304611-1-pbonzini@redhat.com>
References: <20220426141619.304611-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x32c.google.com
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
 accel/kvm/kvm-all.c     | 18 +++++++++++-------
 include/monitor/stats.h |  4 ++--
 monitor/qmp-cmds.c      | 10 +++++++---
 qapi/stats.json         |  4 +++-
 4 files changed, 23 insertions(+), 13 deletions(-)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index b42008ac07..67253c5a5c 100644
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
+        if (!str_in_list(pdesc->name, names)) {
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
@@ -4066,14 +4070,15 @@ static void query_stats_cb(StatsResultList **result, StatsTarget target,
             error_setg(errp, "KVM stats: ioctl failed");
             return;
         }
-        query_stats(result, target, stats_fd, errp);
+        query_stats(result, target, names, stats_fd, errp);
         close(stats_fd);
         break;
     }
     case STATS_TARGET_VCPU:
     {
         StatsArgs stats_args;
         stats_args.result.stats = result;
+        stats_args.names = names;
         stats_args.errp = errp;
         CPU_FOREACH(cpu) {
             if (!str_in_list(cpu->parent_obj.canonical_path, targets)) {
diff --git a/include/monitor/stats.h b/include/monitor/stats.h
index acfd975df9..b4123044f7 100644
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
index 25962d8bb4..d0fdb17c82 100644
--- a/monitor/qmp-cmds.c
+++ b/monitor/qmp-cmds.c
@@ -468,15 +468,18 @@ static strList *stats_target_filter(StatsFilter *filter)
 }
 
 static bool stats_provider_requested(StatsProvider provider,
-                                     StatsFilter *filter)
+                                     StatsFilter *filter,
+                                     strList **p_names)
 {
     StatsRequestList *request;
 
     if (!filter->has_providers) {
+        *p_names = NULL;
         return true;
     }
     for (request = filter->providers; request; request = request->next) {
         if (request->value->provider == provider) {
+            *p_names = request->value->has_names ? request->value->names : NULL;
             return true;
         }
     }
@@ -490,8 +493,9 @@ StatsResultList *qmp_query_stats(StatsFilter *filter, Error **errp)
     StatsCallbacks *entry;
 
     QTAILQ_FOREACH(entry, &stats_callbacks, next) {
-        if (stats_provider_requested(entry->provider, filter)) {
-            entry->stats_cb(&stats_results, filter->target, targets, errp);
+        strList *names = NULL;
+        if (stats_provider_requested(entry->provider, filter, &names)) {
+            entry->stats_cb(&stats_results, filter->target, names, targets, errp);
         }
     }
 
diff --git a/qapi/stats.json b/qapi/stats.json
index 33ff6ea7a9..234fbcb7ca 100644
--- a/qapi/stats.json
+++ b/qapi/stats.json
@@ -71,11 +71,14 @@
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
-- 
2.35.1



