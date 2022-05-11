Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63F45522EED
	for <lists+qemu-devel@lfdr.de>; Wed, 11 May 2022 11:06:16 +0200 (CEST)
Received: from localhost ([::1]:48386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1noiIR-00063b-4n
	for lists+qemu-devel@lfdr.de; Wed, 11 May 2022 05:06:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1noi1c-0006Ow-M6
 for qemu-devel@nongnu.org; Wed, 11 May 2022 04:48:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:21442)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1noi1a-0002pc-Hx
 for qemu-devel@nongnu.org; Wed, 11 May 2022 04:48:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652258929;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bYYsmUhllq7zUdd9AGdqTLKz4C4YtebNoSyzxMdVboE=;
 b=eFCtrVG2QA500Enk0/mB5iOYg33RhW/e8V66xAzGFXRjTu+Do7Js1zQ/QycuAWOQPIyQJE
 ebklkvmXXXZg/oAcSh2AwZcJstdz3LNc7q2EeNspE4MV9a5zV4ECcbQqfYyprfd/66S21U
 QRbubIlmIBC1WwvmrRGF4aVsYKCDvDE=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-367-U8826ojNN_ezUHeNEBkvIQ-1; Wed, 11 May 2022 04:48:47 -0400
X-MC-Unique: U8826ojNN_ezUHeNEBkvIQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 o24-20020a05600c379800b003943412e81dso485024wmr.6
 for <qemu-devel@nongnu.org>; Wed, 11 May 2022 01:48:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bYYsmUhllq7zUdd9AGdqTLKz4C4YtebNoSyzxMdVboE=;
 b=mL6GJkgmg95loIqssFdL6VQRkwbZR3srooXZWdhfPsCCY103ZNaMUxSwkBmSGcLqc5
 be1yD+jLZZ91n5eTvxyCNZrll9wgwiUQW6jSTtHHP2/tgeKWjX6X3/U/olHzRYjs/G7O
 ypYl7esruKPyRS3ubtbxcmKNqfAp7MshmbGympfEXAgVM77SwXUzMvgNzzxihFb+Ppz3
 9tsGjO2aYvdFW3cikHtYYK2Yy7ISPWGDQMGMUUaLZufLWmqYW1zGTIKHBv1No4WSMqYp
 KDqqt/07Kw/OSnU2nTioYZ1P3jVTh4FLIEwPvIjXUsSoQETCN/RAbInTaw1+9CzF07Ry
 1XfQ==
X-Gm-Message-State: AOAM53139SU9txIuDJq3Nq6AlojtJcZMdBCUKABAu0L9jbsr2o3ntM19
 7sRPkINnaIQEQSryhWz9v+EF17SU6k7Y3iYkMcGErgKaQHHPekSA4TK5YB2ESvXXTezmD3CPSA2
 87vjWmV1NS5AbbspFATkzFRSTKk/xNed/0zJpXKxNb82YRMH9EVXankaoLRHzS/5xSRc=
X-Received: by 2002:a5d:4045:0:b0:20a:cac6:d33d with SMTP id
 w5-20020a5d4045000000b0020acac6d33dmr22685470wrp.657.1652258925567; 
 Wed, 11 May 2022 01:48:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy0ydLEhXgNNX6GA1uinFEdxsSKLX2T0ioz/TNTQ2afmONumlsNnhmrNm6dnweBunaJx5xd+w==
X-Received: by 2002:a5d:4045:0:b0:20a:cac6:d33d with SMTP id
 w5-20020a5d4045000000b0020acac6d33dmr22685444wrp.657.1652258925247; 
 Wed, 11 May 2022 01:48:45 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 m36-20020a05600c3b2400b003942a244edbsm1853833wms.32.2022.05.11.01.48.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 May 2022 01:48:44 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: armbru@redhat.com,
	dgilbert@redhat.com,
	berrange@redhat.com
Subject: [PATCH v2 3/8] qmp: add filtering of statistics by target vCPU
Date: Wed, 11 May 2022 10:48:28 +0200
Message-Id: <20220511084833.195963-4-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220511084833.195963-1-pbonzini@redhat.com>
References: <20220511084833.195963-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
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
 accel/kvm/kvm-all.c     |  9 +++++++--
 include/monitor/stats.h |  9 ++++++++-
 monitor/qmp-cmds.c      | 34 +++++++++++++++++++++++++++++++++-
 qapi/stats.json         | 24 +++++++++++++++++++-----
 4 files changed, 67 insertions(+), 9 deletions(-)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index 6a6bbe2994..28f8a45205 100644
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
+            if (!str_in_list(cpu->parent_obj.canonical_path, targets)) {
+                continue;
+            }
             run_on_cpu(cpu, query_stats_vcpu, RUN_ON_CPU_HOST_PTR(&stats_args));
         }
         break;
diff --git a/include/monitor/stats.h b/include/monitor/stats.h
index 89552ab06f..92a1df3072 100644
--- a/include/monitor/stats.h
+++ b/include/monitor/stats.h
@@ -10,7 +10,8 @@
 
 #include "qapi/qapi-types-stats.h"
 
-typedef void StatRetrieveFunc(StatsResultList **result, StatsTarget target, Error **errp);
+typedef void StatRetrieveFunc(StatsResultList **result, StatsTarget target,
+                              strList *targets, Error **errp);
 typedef void SchemaRetrieveFunc(StatsSchemaList **result, Error **errp);
 
 /*
@@ -30,4 +31,10 @@ void add_stats_entry(StatsResultList **, StatsProvider, const char *id,
 void add_stats_schema(StatsSchemaList **, StatsProvider, StatsTarget,
                       StatsSchemaValueList *);
 
+/*
+ * True if a string matches the filter passed to the stats_fn callabck,
+ * false otherwise.
+ */
+bool str_in_list(const char *string, strList *list);
+
 #endif /* STATS_H */
diff --git a/monitor/qmp-cmds.c b/monitor/qmp-cmds.c
index d83faeca88..1ec7409bc2 100644
--- a/monitor/qmp-cmds.c
+++ b/monitor/qmp-cmds.c
@@ -463,13 +463,30 @@ void add_stats_callbacks(StatRetrieveFunc *stats_fn,
     QTAILQ_INSERT_TAIL(&stats_callbacks, entry, next);
 }
 
+static strList *stats_target_filter(StatsFilter *filter)
+{
+    switch (filter->target) {
+    case STATS_TARGET_VM:
+        return NULL;
+    case STATS_TARGET_VCPU:
+        if (!filter->u.vcpu.has_vcpus) {
+            return NULL;
+        }
+        return filter->u.vcpu.vcpus;
+        break;
+    default:
+        abort();
+    }
+}
+
 StatsResultList *qmp_query_stats(StatsFilter *filter, Error **errp)
 {
     StatsResultList *stats_results = NULL;
+    strList *targets = stats_target_filter(filter);
     StatsCallbacks *entry;
 
     QTAILQ_FOREACH(entry, &stats_callbacks, next) {
-        entry->stats_cb(&stats_results, filter->target, errp);
+        entry->stats_cb(&stats_results, filter->target, targets, errp);
     }
 
     return stats_results;
@@ -512,3 +529,18 @@ void add_stats_schema(StatsSchemaList **schema_results,
     entry->stats = stats_list;
     QAPI_LIST_PREPEND(*schema_results, entry);
 }
+
+bool str_in_list(const char *string, strList *list)
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
index 06d2296a49..eb13377358 100644
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
+# @vcpus: list of qom paths for the desired vCPU objects.
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


