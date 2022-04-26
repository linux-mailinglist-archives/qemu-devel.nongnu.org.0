Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA3B0510048
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 16:21:08 +0200 (CEST)
Received: from localhost ([::1]:50216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njM3v-00053z-Ve
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 10:21:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1njLzR-0005SK-Ek
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 10:16:29 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:35336)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1njLzP-0005Wh-Nn
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 10:16:29 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 c190-20020a1c35c7000000b0038e37907b5bso1629380wma.0
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 07:16:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=q5ZWR4a9MyhZdY7QbLORjdQwhuCmA4Ze3zzZ+Jeh7gY=;
 b=XVGYH5kpZ6f+SWDjTjKOLxbEMHu9g4emoCE874YA6ZyDq8xqqJpXstzdpvNC4FxUV+
 xsNcScc9LoGScpayJbe3lrbNbR/q+jYy40HKkMQerlEpuiQLDhTcggZaIDfiU4efetOJ
 n1z83cs85kQsDqOoMYosCiXx4i7ZOU93WiWcuLsZj1uh5n98g9mF+kw7QrZ+ZM8mUkz6
 ZGBOn5EptOCVldfn+aYJGMUy64/N3Rzwf0HVq4R++h9hnLgKtLx+IzILfSHneNhEorsS
 /x7WwUuVedUV5VjBrPrK5w/Q58AdyZoY/J+dPGHQLUCdf9PXtyaeAoK0oUkVzGt7aAyP
 osZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=q5ZWR4a9MyhZdY7QbLORjdQwhuCmA4Ze3zzZ+Jeh7gY=;
 b=BETQlUkwE/7lWLcfYsM7fwjicUcdA898Phf0XbmsJ9m+bcktvKio9zROiv6cHB9+wV
 Tz5HNvT9SU3OyZSLsrprX6aW1dDm8vXtqZrdC673Aucyi/lEgCvSNPSJz2US43kQuLtY
 +djFgaLbHEMsEQiA1/vwP3Fc22SOQUruBD9UC8QJo2JP+cnWL4/W2hAl46sdXxP/UPuZ
 pkMTrIp8DpTRfpe8xs1E9bDr1kPjaZ9lbOGINMRqjJGocMi5QMX9kM6Rb0YdORyagBlO
 pENFvIF33/r+tofxUVduDbcUVPldlCsFlTYJYHR7TbZEKEA4ZyuyJc8ZI/XcD0H7XGir
 OpJA==
X-Gm-Message-State: AOAM532IbvUcLq6RuDrdGKThivz7CtxjtL2m4QMHlz3dXnoVEkpyfAel
 h6tIbXBXIgwVV4bDni7XD4Htb5Tmu9/aMA==
X-Google-Smtp-Source: ABdhPJwo+GSh2JzGHsA0w3+uRDh4M/tVM/mIQI6F7NBSwK4HbGCdhteNA1ADh4s/q+NCWmbNcrWe7A==
X-Received: by 2002:a05:600c:35c6:b0:393:ebf0:d530 with SMTP id
 r6-20020a05600c35c600b00393ebf0d530mr9947235wmq.34.1650982586293; 
 Tue, 26 Apr 2022 07:16:26 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:e3ec:5559:7c5c:1928])
 by smtp.gmail.com with ESMTPSA id
 o6-20020a05600c378600b0038eca3cdbb3sm11206464wmr.13.2022.04.26.07.16.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 07:16:25 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 5/8] qmp: add filtering of statistics by provider
Date: Tue, 26 Apr 2022 16:16:16 +0200
Message-Id: <20220426141619.304611-6-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220426141619.304611-1-pbonzini@redhat.com>
References: <20220426141619.304611-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x32a.google.com
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

Allow retrieving the statistics from a specific provider only.
This can be used in the future by HMP commands such as "info
sync-profile" or "info profile".  The next patch also adds
filter-by-provider capabilities to the HMP equivalent of
query-stats, "info stats".

Example:

{ "execute": "query-stats",
  "arguments": {
    "target": "vm",
    "providers": [
      { "provider": "kvm" } ] } }

The QAPI is a bit more verbose than just a list of StatsProvider,
so that it can be subsequently extended with filtering of statistics
by name.

Extracted from a patch by Mark Kanda.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 accel/kvm/kvm-all.c     |  3 ++-
 include/monitor/stats.h |  4 +++-
 monitor/hmp-cmds.c      |  2 +-
 monitor/qmp-cmds.c      | 33 +++++++++++++++++++++++++++++----
 qapi/stats.json         | 16 ++++++++++++++--
 5 files changed, 49 insertions(+), 9 deletions(-)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index bfd81039a1..b42008ac07 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -2644,7 +2644,8 @@ static int kvm_init(MachineState *ms)
     }
 
     if (kvm_check_extension(kvm_state, KVM_CAP_BINARY_STATS_FD)) {
-        add_stats_callbacks(query_stats_cb, query_stats_schemas_cb);
+        add_stats_callbacks(STATS_PROVIDER_KVM, query_stats_cb,
+                            query_stats_schemas_cb);
     }
 
     return 0;
diff --git a/include/monitor/stats.h b/include/monitor/stats.h
index 92a1df3072..acfd975df9 100644
--- a/include/monitor/stats.h
+++ b/include/monitor/stats.h
@@ -17,10 +17,12 @@ typedef void SchemaRetrieveFunc(StatsSchemaList **result, Error **errp);
 /*
  * Register callbacks for the QMP query-stats command.
  *
+ * @provider: stats provider
  * @stats_fn: routine to query stats:
  * @schema_fn: routine to query stat schemas:
  */
-void add_stats_callbacks(StatRetrieveFunc *stats_fn,
+void add_stats_callbacks(StatsProvider provider,
+                         StatRetrieveFunc *stats_fn,
                          SchemaRetrieveFunc *schemas_fn);
 
 /*
diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index 1ac00ba124..2085d88e7d 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -2377,7 +2377,7 @@ void hmp_info_stats(Monitor *mon, const QDict *qdict)
         goto exit_no_print;
     }
 
-    schema = qmp_query_stats_schemas(&err);
+    schema = qmp_query_stats_schemas(false, 0, &err);
     if (err) {
         goto exit;
     }
diff --git a/monitor/qmp-cmds.c b/monitor/qmp-cmds.c
index 5e3f4c9685..25962d8bb4 100644
--- a/monitor/qmp-cmds.c
+++ b/monitor/qmp-cmds.c
@@ -430,6 +430,7 @@ HumanReadableText *qmp_x_query_irq(Error **errp)
 }
 
 typedef struct StatsCallbacks {
+    StatsProvider provider;
     StatRetrieveFunc *stats_cb;
     SchemaRetrieveFunc *schemas_cb;
     QTAILQ_ENTRY(StatsCallbacks) next;
@@ -438,10 +439,12 @@ typedef struct StatsCallbacks {
 static QTAILQ_HEAD(, StatsCallbacks) stats_callbacks =
     QTAILQ_HEAD_INITIALIZER(stats_callbacks);
 
-void add_stats_callbacks(StatRetrieveFunc *stats_fn,
+void add_stats_callbacks(StatsProvider provider,
+                         StatRetrieveFunc *stats_fn,
                          SchemaRetrieveFunc *schemas_fn)
 {
     StatsCallbacks *entry = g_new(StatsCallbacks, 1);
+    entry->provider = provider;
     entry->stats_cb = stats_fn;
     entry->schemas_cb = schemas_fn;
 
@@ -464,6 +467,22 @@ static strList *stats_target_filter(StatsFilter *filter)
     }
 }
 
+static bool stats_provider_requested(StatsProvider provider,
+                                     StatsFilter *filter)
+{
+    StatsRequestList *request;
+
+    if (!filter->has_providers) {
+        return true;
+    }
+    for (request = filter->providers; request; request = request->next) {
+        if (request->value->provider == provider) {
+            return true;
+        }
+    }
+    return false;
+}
+
 StatsResultList *qmp_query_stats(StatsFilter *filter, Error **errp)
 {
     StatsResultList *stats_results = NULL;
@@ -471,19 +490,25 @@ StatsResultList *qmp_query_stats(StatsFilter *filter, Error **errp)
     StatsCallbacks *entry;
 
     QTAILQ_FOREACH(entry, &stats_callbacks, next) {
-        entry->stats_cb(&stats_results, filter->target, targets, errp);
+        if (stats_provider_requested(entry->provider, filter)) {
+            entry->stats_cb(&stats_results, filter->target, targets, errp);
+        }
     }
 
     return stats_results;
 }
 
-StatsSchemaList *qmp_query_stats_schemas(Error **errp)
+StatsSchemaList *qmp_query_stats_schemas(bool has_provider,
+                                         StatsProvider provider,
+                                         Error **errp)
 {
     StatsSchemaList *stats_results = NULL;
     StatsCallbacks *entry;
 
     QTAILQ_FOREACH(entry, &stats_callbacks, next) {
-        entry->schemas_cb(&stats_results, errp);
+        if (!has_provider || provider == entry->provider) {
+            entry->schemas_cb(&stats_results, errp);
+        }
     }
 
     return stats_results;
diff --git a/qapi/stats.json b/qapi/stats.json
index 26ee69588f..33ff6ea7a9 100644
--- a/qapi/stats.json
+++ b/qapi/stats.json
@@ -65,6 +65,18 @@
 { 'enum': 'StatsTarget',
   'data': [ 'vm', 'vcpu' ] }
 
+##
+# @StatsRequest:
+#
+# Indicates a set of statistics that should be returned by query-stats.
+#
+# @provider: provider for which to return statistics.
+#
+# Since: 7.1
+##
+{ 'struct': 'StatsRequest',
+  'data': { 'provider': 'StatsProvider' } }
+
 ##
 # @StatsVCPUFilter:
 #
@@ -84,7 +96,7 @@
 # Since: 7.1
 ##
 { 'union': 'StatsFilter',
-        'base': { 'target': 'StatsTarget' },
+        'base': { 'target': 'StatsTarget', '*providers': [ 'StatsRequest' ] },
   'discriminator': 'target',
   'data': { 'vcpu': 'StatsVCPUFilter' } }
 
@@ -200,5 +212,5 @@
 # Since: 7.1
 ##
 { 'command': 'query-stats-schemas',
-  'data': { },
+  'data': { '*provider': 'StatsProvider' },
   'returns': [ 'StatsSchema' ] }
-- 
2.35.1



