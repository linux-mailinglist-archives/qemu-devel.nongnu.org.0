Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D680D510043
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 16:18:58 +0200 (CEST)
Received: from localhost ([::1]:42562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njM1p-0008RI-NY
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 10:18:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1njLzS-0005Tl-5y
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 10:16:30 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:38418)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1njLzQ-0005Wo-Gl
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 10:16:29 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 1-20020a05600c248100b00393fbf11a05so580406wms.3
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 07:16:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YNwi7yiy0wJwLLwFYiA87411z8l8mI9z7jlr8cryUNk=;
 b=VjIUHyZ2I1BksECiKr/Gt1YbT31webuKXCIU21J2dx7v6ly97MneEBNBX+r0b3gLIr
 9Tr8c+uMjU12z1e/c8huTAmiPDSUcBAjDuMOmors+VNNk1nojPpTMHqYS23hPLbnNe0u
 solgbeqbzE8Q0rMa4c+Fnz8MMA9oo6l1s1rM7LbZY5mdK2IztVM4x1EQ+7GV3Myqk7PU
 xeyr1wwgjE1Rx5p57BUBDZ/I9EjI2v+7p/5JJtgx1ZWeGgehGz6D5+avoRFqRVsT0WiE
 lP2gx7yi00dNnO/oMFTV00/swzbI1zqKc/bHN4+XjtfPTzwdVSFzl+ZfWh0Bu82JJWw3
 CQOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=YNwi7yiy0wJwLLwFYiA87411z8l8mI9z7jlr8cryUNk=;
 b=OFZ+WrALHpHnbfbcBBcID2EBwv5ReoKRfoRYcHtu+ZbGKA6wfVAtQHJ2iuRfpmr5pB
 pLvPjf43vt3MYoK4+ycxLjcYQR9r3X9Hv6yW49+iXgXPPo3OFkVdYOqBHlmug7iKPJ/C
 G6QWB39Igfs1z/cXcNNXEB73d0xDgCEgwCvZvC1gHFT8qh+bpWEF9RQ5i17UWdM2INt3
 rLhFJh4DqLQByPtFr8I3NB4dghbuJc/uZcM9h/L2bjZc9yi7oYQMJLtW6DexQw88JESS
 VQdS9tqEHUzoC3KI7epgERdy9tuKNmNX+idH9lZfKyPhc+pt3KxGea3nY5asfvoLzpAE
 u2Iw==
X-Gm-Message-State: AOAM530aJOEM6piMcB2/L2HtXPbKF3WiUJp00sEW7eZPwZqel/Nejphq
 CTSG9YEQMC/OxFr1iIbloYqEDNqSIKZP2Q==
X-Google-Smtp-Source: ABdhPJz18gTr1szt67NbKED4STTxycVo5GAXEQlxup6fl9bExgiPFqc039WlPgAtqgBh8NFMwKU75Q==
X-Received: by 2002:a05:600c:5c8:b0:393:eba0:8ac7 with SMTP id
 p8-20020a05600c05c800b00393eba08ac7mr10000291wmd.108.1650982587102; 
 Tue, 26 Apr 2022 07:16:27 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:e3ec:5559:7c5c:1928])
 by smtp.gmail.com with ESMTPSA id
 o6-20020a05600c378600b0038eca3cdbb3sm11206464wmr.13.2022.04.26.07.16.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 07:16:26 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 6/8] hmp: add filtering of statistics by provider
Date: Tue, 26 Apr 2022 16:16:17 +0200
Message-Id: <20220426141619.304611-7-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220426141619.304611-1-pbonzini@redhat.com>
References: <20220426141619.304611-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x329.google.com
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

Allow the user to request statistics for a single provider of interest.
Extracted from a patch by Mark Kanda.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hmp-commands-info.hx |  7 ++++---
 monitor/hmp-cmds.c   | 46 +++++++++++++++++++++++++++++++++++---------
 2 files changed, 41 insertions(+), 12 deletions(-)

diff --git a/hmp-commands-info.hx b/hmp-commands-info.hx
index 221feab8c0..1a3e16175f 100644
--- a/hmp-commands-info.hx
+++ b/hmp-commands-info.hx
@@ -897,9 +897,10 @@ ERST
 
     {
         .name       = "stats",
-        .args_type  = "target:s",
-        .params     = "target",
-        .help       = "show statistics; target is either vm or vcpu",
+        .args_type  = "target:s,provider:s?",
+        .params     = "target [provider]",
+        .help       = "show statistics for the given target (vm or vcpu); optionally filter by "
+	              "provider",
         .cmd        = hmp_info_stats,
     },
 
diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index 2085d88e7d..2bce9d7016 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -2281,6 +2281,7 @@ static StatsSchemaValueList *find_schema_value_list(
 }
 
 static void print_stats_results(Monitor *mon, StatsTarget target,
+                                bool show_provider,
                                 StatsResult *result,
                                 StatsSchemaList *schema)
 {
@@ -2295,8 +2296,10 @@ static void print_stats_results(Monitor *mon, StatsTarget target,
         return;
     }
 
-    monitor_printf(mon, "provider: %s\n",
-                   StatsProvider_str(result->provider));
+    if (show_provider) {
+        monitor_printf(mon, "provider: %s\n",
+                       StatsProvider_str(result->provider));
+    }
 
     for (stats_list = result->stats; stats_list;
              stats_list = stats_list->next,
@@ -2337,7 +2340,8 @@ static void print_stats_results(Monitor *mon, StatsTarget target,
 }
 
 /* Create the StatsFilter that is needed for an "info stats" invocation.  */
-static StatsFilter *stats_filter(StatsTarget target, int cpu_index)
+static StatsFilter *stats_filter(StatsTarget target, int cpu_index,
+                                 StatsProvider provider)
 {
     StatsFilter *filter = g_malloc0(sizeof(*filter));
 
@@ -2359,15 +2363,31 @@ static StatsFilter *stats_filter(StatsTarget target, int cpu_index)
     default:
         break;
     }
+
+    if (provider == STATS_PROVIDER__MAX) {
+        return filter;
+    }
+
+    /* "info stats" can only query either one or all the providers.  */
+    StatsRequest *request = g_new0(StatsRequest, 1);
+    request->provider = provider;
+    StatsRequestList *request_list = g_new0(StatsRequestList, 1);
+    QAPI_LIST_PREPEND(request_list, request);
+    filter->has_providers = true;
+    filter->providers = request_list;
     return filter;
 }
 
 void hmp_info_stats(Monitor *mon, const QDict *qdict)
 {
     const char *target_str = qdict_get_str(qdict, "target");
+    const char *provider_str = qdict_get_try_str(qdict, "provider");
+
+    StatsProvider provider = STATS_PROVIDER__MAX;
     StatsTarget target;
     Error *err = NULL;
     StatsResultList *stats = NULL;
+    StatsResultList *entry;
     StatsSchemaList *schema = NULL;
     StatsFilter *filter = NULL;
 
@@ -2376,19 +2396,27 @@ void hmp_info_stats(Monitor *mon, const QDict *qdict)
         monitor_printf(mon, "invalid stats target %s\n", target_str);
         goto exit_no_print;
     }
+    if (provider_str) {
+        provider = qapi_enum_parse(&StatsProvider_lookup, provider_str, -1, &err);
+        if (err) {
+            monitor_printf(mon, "invalid stats provider %s\n", provider_str);
+            goto exit_no_print;
+        }
+    }
 
-    schema = qmp_query_stats_schemas(false, 0, &err);
+    schema = qmp_query_stats_schemas(provider_str ? true : false,
+                                     provider, &err);
     if (err) {
         goto exit;
     }
 
     switch (target) {
     case STATS_TARGET_VM:
-        filter = stats_filter(target, -1);
-       break;
+        filter = stats_filter(target, -1, provider);
+        break;
     case STATS_TARGET_VCPU: {}
         int cpu_index = monitor_get_cpu_index(mon);
-        filter = stats_filter(target, cpu_index);
+        filter = stats_filter(target, cpu_index, provider);
         break;
     default:
         abort();
@@ -2398,8 +2426,8 @@ void hmp_info_stats(Monitor *mon, const QDict *qdict)
     if (err) {
         goto exit;
     }
-    if (stats) {
-        print_stats_results(mon, target, stats->value, schema);
+    for (entry = stats; entry; entry = entry->next) {
+        print_stats_results(mon, target, provider_str == NULL, entry->value, schema);
     }
     qapi_free_StatsFilter(filter);
     qapi_free_StatsSchemaList(schema);
-- 
2.35.1



