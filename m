Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BEBF2510053
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 16:23:16 +0200 (CEST)
Received: from localhost ([::1]:57126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njM5z-0001LU-TG
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 10:23:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1njLzQ-0005SI-JC
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 10:16:29 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:34088)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1njLzO-0005WP-L1
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 10:16:28 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 ay36-20020a05600c1e2400b0038ebc885115so1145169wmb.1
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 07:16:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5M7XvC3bPFfoEdkPyYqPTJxbw77vg1qcVegS2S1ATho=;
 b=MF3ASCG9DSAX12wprVT5Q9z2ifcirq0sh9ihRMpodK2ZwAMuRJBXfJpVAFbj9D2WoD
 BBGatJjmBIuYvb4ko7IY4Z2FO/VzDl3NNoKejGVJYIFrbjcCT0KYElPKuXV2rsh2QUZr
 f0PeShervjzvTnUnlhrtoRc5UPrs5PiqEU3d5SHFByH/4szTIslAMr6KqETFv9FyLLCF
 yzfEpiiFH+voJTnQ40DzXN9d+um3xznapZ59P+APLZBrISUNBKfY2sziJ/Otasy8jcCO
 ojcVTudSQeZynGlKdjYrNmtRKZmaJuSb8LkRSWNt5ihIoWCFcKOjc54Sij8ID6jHHBR5
 O03w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=5M7XvC3bPFfoEdkPyYqPTJxbw77vg1qcVegS2S1ATho=;
 b=tm2h259CxD7SrSVthhPmc9/hRHcL0Dqdv+MapLaUBKNYJMuEK5wOCAhBxR9CYjVy3+
 2sD0jSsT60NacQpYBx2g14mfJFdG7TvoA//6RomQ3Fs+C1LRWa8ngmX80ahD82VOoxPt
 cVhggyIalVtOhnZzyg6dS+0ECszFjZ41vV7iyI4uKMaeUnQ3kuU/yZqmCxpCTQTU/Abg
 +KHwm08D6oxlBv0tSrVQI4z5xcIJYVmdRhksS64X/1HEOUO2EaTKZorXZACfeROCA2LK
 M9nZZzKURWmmRyDiKlp1AT7TdqX32rkrSGPLb8tXpGDtBQkWy9b9fYqupRElMY0t3pXk
 qy+Q==
X-Gm-Message-State: AOAM533owMq9W7KdHOsBfT+go5QV0bcHMI2aA9uEnz5ytvH4b+hyPWUV
 MCCYCop1KVitMSCYHg+Jvuwoag/sh1CJ0Q==
X-Google-Smtp-Source: ABdhPJwjTfCq1mdtcXxBWUrbZfhbgROZUrOjTYDLp6Y+Z7PeS/1P4vDwE5WL1lmMHW4OABiBztjsNQ==
X-Received: by 2002:a7b:cbd3:0:b0:38e:bc95:5048 with SMTP id
 n19-20020a7bcbd3000000b0038ebc955048mr21302974wmi.203.1650982585270; 
 Tue, 26 Apr 2022 07:16:25 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:e3ec:5559:7c5c:1928])
 by smtp.gmail.com with ESMTPSA id
 o6-20020a05600c378600b0038eca3cdbb3sm11206464wmr.13.2022.04.26.07.16.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 07:16:24 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/8] hmp: add basic "info stats" implementation
Date: Tue, 26 Apr 2022 16:16:15 +0200
Message-Id: <20220426141619.304611-5-pbonzini@redhat.com>
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

Add an HMP command to retrieve statistics collected at run-time.
The command will retrieve and print either all VM-level statistics,
or all vCPU-level statistics for the currently selected CPU.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hmp-commands-info.hx  |  13 +++
 include/monitor/hmp.h |   1 +
 monitor/hmp-cmds.c    | 189 ++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 203 insertions(+)

diff --git a/hmp-commands-info.hx b/hmp-commands-info.hx
index adfa085a9b..221feab8c0 100644
--- a/hmp-commands-info.hx
+++ b/hmp-commands-info.hx
@@ -894,3 +894,16 @@ SRST
   ``info via``
     Show guest mos6522 VIA devices.
 ERST
+
+    {
+        .name       = "stats",
+        .args_type  = "target:s",
+        .params     = "target",
+        .help       = "show statistics; target is either vm or vcpu",
+        .cmd        = hmp_info_stats,
+    },
+
+SRST
+  ``stats``
+    Show runtime-collected statistics
+ERST
diff --git a/include/monitor/hmp.h b/include/monitor/hmp.h
index 96d014826a..2e89a97bd6 100644
--- a/include/monitor/hmp.h
+++ b/include/monitor/hmp.h
@@ -133,5 +133,6 @@ void hmp_info_dirty_rate(Monitor *mon, const QDict *qdict);
 void hmp_calc_dirty_rate(Monitor *mon, const QDict *qdict);
 void hmp_human_readable_text_helper(Monitor *mon,
                                     HumanReadableText *(*qmp_handler)(Error **));
+void hmp_info_stats(Monitor *mon, const QDict *qdict);
 
 #endif
diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index d8b98bed6c..1ac00ba124 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -40,6 +40,7 @@
 #include "qapi/qapi-commands-pci.h"
 #include "qapi/qapi-commands-rocker.h"
 #include "qapi/qapi-commands-run-state.h"
+#include "qapi/qapi-commands-stats.h"
 #include "qapi/qapi-commands-tpm.h"
 #include "qapi/qapi-commands-ui.h"
 #include "qapi/qapi-visit-net.h"
@@ -52,6 +53,7 @@
 #include "ui/console.h"
 #include "qemu/cutils.h"
 #include "qemu/error-report.h"
+#include "hw/core/cpu.h"
 #include "hw/intc/intc.h"
 #include "migration/snapshot.h"
 #include "migration/misc.h"
@@ -2223,3 +2225,190 @@ void hmp_info_memory_size_summary(Monitor *mon, const QDict *qdict)
     }
     hmp_handle_error(mon, err);
 }
+
+static void print_stats_schema_value(Monitor *mon, StatsSchemaValue *value)
+{
+    const char *prefix = "";
+    monitor_printf(mon, "    %s (%s", value->name, StatsType_str(value->type));
+
+    if (value->has_unit && value->unit == STATS_UNIT_SECONDS &&
+        (value->exponent == 0 || value->base == 10) &&
+        value->exponent >= -9 && value->exponent <= 0 &&
+        value->exponent % 3 == 0) {
+
+        static const char *si_prefix[] = { "", "milli", "micro", "nano" };
+        prefix = si_prefix[value->exponent / -3];
+
+    } else if (value->has_unit && value->unit == STATS_UNIT_BYTES &&
+               (value->exponent == 0 || value->base == 2) &&
+               value->exponent >= 0 && value->exponent <= 40 &&
+               value->exponent % 10 == 0) {
+
+        static const char *si_prefix[] = {
+            "", "kilo", "mega", "giga", "tera" };
+        prefix = si_prefix[value->exponent / 10];
+
+    } else if (value->exponent) {
+        /* Print the base and exponent as "x <base>^<exp>" */
+        monitor_printf(mon, ", * %d^%d", value->base,
+                       value->exponent);
+    }
+
+    if (value->has_unit) {
+        monitor_printf(mon, " %s%s", prefix, StatsUnit_str(value->unit));
+    }
+
+    /* Print bucket size for linear histograms */
+    if (value->type == STATS_TYPE_LINEAR_HIST && value->has_bucket_size) {
+        monitor_printf(mon, ", bucket size=%d", value->bucket_size);
+    }
+    monitor_printf(mon, ")");
+}
+
+static StatsSchemaValueList *find_schema_value_list(
+    StatsSchemaList *list, StatsProvider provider,
+    StatsTarget target)
+{
+    StatsSchemaList *node;
+
+    for (node = list; node; node = node->next) {
+        if (node->value->provider == provider &&
+            node->value->target == target) {
+            return node->value->stats;
+        }
+    }
+    return NULL;
+}
+
+static void print_stats_results(Monitor *mon, StatsTarget target,
+                                StatsResult *result,
+                                StatsSchemaList *schema)
+{
+    /* Find provider schema */
+    StatsSchemaValueList *schema_value_list =
+        find_schema_value_list(schema, result->provider, target);
+    StatsList *stats_list;
+
+    if (!schema_value_list) {
+        monitor_printf(mon, "failed to find schema list for %s\n",
+                       StatsProvider_str(result->provider));
+        return;
+    }
+
+    monitor_printf(mon, "provider: %s\n",
+                   StatsProvider_str(result->provider));
+
+    for (stats_list = result->stats; stats_list;
+             stats_list = stats_list->next,
+             schema_value_list = schema_value_list->next) {
+
+        Stats *stats = stats_list->value;
+        StatsValue *stats_value = stats->value;
+        StatsSchemaValue *schema_value = schema_value_list->value;
+
+        /* Find schema entry */
+        while (!g_str_equal(stats->name, schema_value->name)) {
+            if (!schema_value_list->next) {
+                monitor_printf(mon, "failed to find schema entry for %s\n",
+                               stats->name);
+                return;
+            }
+            schema_value_list = schema_value_list->next;
+            schema_value = schema_value_list->value;
+        }
+
+        print_stats_schema_value(mon, schema_value);
+
+        if (stats_value->type == QTYPE_QNUM) {
+            monitor_printf(mon, ": %" PRId64 "\n", stats_value->u.scalar);
+        } else if (stats_value->type == QTYPE_QLIST) {
+            uint64List *list;
+            int i;
+
+            monitor_printf(mon, ": ");
+            for (list = stats_value->u.list, i = 1;
+                 list;
+                 list = list->next, i++) {
+                monitor_printf(mon, "[%d]=%" PRId64 " ", i, list->value);
+            }
+            monitor_printf(mon, "\n");
+        }
+    }
+}
+
+/* Create the StatsFilter that is needed for an "info stats" invocation.  */
+static StatsFilter *stats_filter(StatsTarget target, int cpu_index)
+{
+    StatsFilter *filter = g_malloc0(sizeof(*filter));
+
+    filter->target = target;
+    switch (target) {
+    case STATS_TARGET_VM:
+        break;
+    case STATS_TARGET_VCPU:
+    {
+        strList *vcpu_list = NULL;
+        CPUState *cpu = qemu_get_cpu(cpu_index);
+        char *canonical_path = object_get_canonical_path(OBJECT(cpu));
+
+        QAPI_LIST_PREPEND(vcpu_list, canonical_path);
+        filter->u.vcpu.has_vcpus = true;
+        filter->u.vcpu.vcpus = vcpu_list;
+        break;
+    }
+    default:
+        break;
+    }
+    return filter;
+}
+
+void hmp_info_stats(Monitor *mon, const QDict *qdict)
+{
+    const char *target_str = qdict_get_str(qdict, "target");
+    StatsTarget target;
+    Error *err = NULL;
+    StatsResultList *stats = NULL;
+    StatsSchemaList *schema = NULL;
+    StatsFilter *filter = NULL;
+
+    target = qapi_enum_parse(&StatsTarget_lookup, target_str, -1, &err);
+    if (err) {
+        monitor_printf(mon, "invalid stats target %s\n", target_str);
+        goto exit_no_print;
+    }
+
+    schema = qmp_query_stats_schemas(&err);
+    if (err) {
+        goto exit;
+    }
+
+    switch (target) {
+    case STATS_TARGET_VM:
+        filter = stats_filter(target, -1);
+       break;
+    case STATS_TARGET_VCPU: {}
+        int cpu_index = monitor_get_cpu_index(mon);
+        filter = stats_filter(target, cpu_index);
+        break;
+    default:
+        abort();
+    }
+
+    stats = qmp_query_stats(filter, &err);
+    if (err) {
+        goto exit;
+    }
+    if (stats) {
+        print_stats_results(mon, target, stats->value, schema);
+    }
+    qapi_free_StatsFilter(filter);
+    qapi_free_StatsSchemaList(schema);
+    qapi_free_StatsResultList(stats);
+
+exit:
+    if (err) {
+        monitor_printf(mon, "%s\n", error_get_pretty(err));
+    }
+exit_no_print:
+    error_free(err);
+}
-- 
2.35.1



