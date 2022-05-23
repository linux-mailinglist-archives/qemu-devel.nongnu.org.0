Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2655D53118D
	for <lists+qemu-devel@lfdr.de>; Mon, 23 May 2022 17:18:33 +0200 (CEST)
Received: from localhost ([::1]:55070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nt9pI-0002cl-8v
	for lists+qemu-devel@lfdr.de; Mon, 23 May 2022 11:18:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nt9ek-0005pK-Ia
 for qemu-devel@nongnu.org; Mon, 23 May 2022 11:07:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:45722)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nt9ei-00009i-J5
 for qemu-devel@nongnu.org; Mon, 23 May 2022 11:07:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653318456;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ELvj6VgD11o8u/IhmceJwp3wsrjN9bVDxMSOiBdpaLs=;
 b=eR2hH0UYdPNx5BTm6X3nhE8tzp1cn0aUZhmy+nxWW2z9zJgnVI7m67mpgJtkvhkoBWF4p2
 ulG8Ml1X67Bd+Gjj9DJdR1VSegeb+PBKZBCl9haxyxAja3PwJnMedInbHd0XCTSe7XJsMi
 apCXTfIc2EccnNTlmzI8MUsOV0qsjLM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-641-Kx3xofe5OnaeDyDVUgxPrQ-1; Mon, 23 May 2022 11:07:34 -0400
X-MC-Unique: Kx3xofe5OnaeDyDVUgxPrQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 59C9729ABA2B;
 Mon, 23 May 2022 15:07:34 +0000 (UTC)
Received: from avogadro.redhat.com (unknown [10.39.195.170])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 82AFA40D1B98;
 Mon, 23 May 2022 15:07:33 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: armbru@redhat.com,
	Mark Kanda <mark.kanda@oracle.com>
Subject: [PATCH 8/8] hmp: add filtering of statistics by name
Date: Mon, 23 May 2022 17:07:22 +0200
Message-Id: <20220523150722.349700-8-pbonzini@redhat.com>
In-Reply-To: <20220523150722.349700-1-pbonzini@redhat.com>
References: <20220523150509.349412-1-pbonzini@redhat.com>
 <20220523150722.349700-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
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

Allow the user to request only a specific subset of statistics.
This can be useful when working on a feature or optimization that is
known to affect that statistic.

Extracted from a patch by Mark Kanda.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hmp-commands-info.hx |  8 ++++----
 monitor/hmp-cmds.c   | 35 +++++++++++++++++++++++++----------
 2 files changed, 29 insertions(+), 14 deletions(-)

diff --git a/hmp-commands-info.hx b/hmp-commands-info.hx
index d4d8a1e618..767aafd1ea 100644
--- a/hmp-commands-info.hx
+++ b/hmp-commands-info.hx
@@ -897,10 +897,10 @@ ERST
 
     {
         .name       = "stats",
-        .args_type  = "target:s,provider:s?",
-        .params     = "target [provider]",
-        .help       = "show statistics for the given target (vm or vcpu); optionally filter by "
-                      "provider",
+        .args_type  = "target:s,names:s?,provider:s?",
+        .params     = "target [names] [provider]",
+        .help       = "show statistics for the given target (vm or vcpu); optionally filter by"
+                      "name (comma-separated list, or * for all) and provider",
         .cmd        = hmp_info_stats,
     },
 
diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index 02a455090d..7fe8a9cdc8 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -2356,10 +2356,12 @@ static void print_stats_results(Monitor *mon, StatsTarget target,
 }
 
 /* Create the StatsFilter that is needed for an "info stats" invocation.  */
-static StatsFilter *stats_filter(StatsTarget target, int cpu_index,
-                                 StatsProvider provider)
+static StatsFilter *stats_filter(StatsTarget target, const char *names,
+                                 int cpu_index, StatsProvider provider)
 {
     StatsFilter *filter = g_malloc0(sizeof(*filter));
+    StatsProvider provider_idx;
+    StatsRequestList *request_list = NULL;
 
     filter->target = target;
     switch (target) {
@@ -2380,15 +2382,27 @@ static StatsFilter *stats_filter(StatsTarget target, int cpu_index,
         break;
     }
 
-    if (provider == STATS_PROVIDER__MAX) {
+    if (!names && provider == STATS_PROVIDER__MAX) {
         return filter;
     }
 
-    /* "info stats" can only query either one or all the providers.  */
-    StatsRequest *request = g_new0(StatsRequest, 1);
-    request->provider = provider;
-    StatsRequestList *request_list = g_new0(StatsRequestList, 1);
-    QAPI_LIST_PREPEND(request_list, request);
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
+                request->names = strList_from_comma_list(names);
+            }
+            QAPI_LIST_PREPEND(request_list, request);
+        }
+    }
+
     filter->has_providers = true;
     filter->providers = request_list;
     return filter;
@@ -2398,6 +2412,7 @@ void hmp_info_stats(Monitor *mon, const QDict *qdict)
 {
     const char *target_str = qdict_get_str(qdict, "target");
     const char *provider_str = qdict_get_try_str(qdict, "provider");
+    const char *names = qdict_get_try_str(qdict, "names");
 
     StatsProvider provider = STATS_PROVIDER__MAX;
     StatsTarget target;
@@ -2428,11 +2443,11 @@ void hmp_info_stats(Monitor *mon, const QDict *qdict)
 
     switch (target) {
     case STATS_TARGET_VM:
-        filter = stats_filter(target, -1, provider);
+        filter = stats_filter(target, names, -1, provider);
         break;
     case STATS_TARGET_VCPU: {}
         int cpu_index = monitor_get_cpu_index(mon);
-        filter = stats_filter(target, cpu_index, provider);
+        filter = stats_filter(target, names, cpu_index, provider);
         break;
     default:
         abort();
-- 
2.36.0


