Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDE9B39D290
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 03:25:24 +0200 (CEST)
Received: from localhost ([::1]:46920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lq416-0003Zy-1w
	for lists+qemu-devel@lfdr.de; Sun, 06 Jun 2021 21:25:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangy81@chinatelecom.cn>)
 id 1lq3yo-0008OU-Vm
 for qemu-devel@nongnu.org; Sun, 06 Jun 2021 21:23:02 -0400
Received: from prt-mail.chinatelecom.cn ([42.123.76.219]:40672
 helo=chinatelecom.cn) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huangy81@chinatelecom.cn>) id 1lq3yk-0002Ey-I3
 for qemu-devel@nongnu.org; Sun, 06 Jun 2021 21:23:02 -0400
HMM_SOURCE_IP: 172.18.0.48:56360.2112367000
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-182.138.181.182?logid-c3aef7583b2e4ecea3360270af8e2d74
 (unknown [172.18.0.48])
 by chinatelecom.cn (HERMES) with SMTP id 76DF4280097;
 Mon,  7 Jun 2021 09:12:04 +0800 (CST)
X-189-SAVE-TO-SEND: +huangy81@chinatelecom.cn
Received: from  ([172.18.0.48])
 by app0024 with ESMTP id c3aef7583b2e4ecea3360270af8e2d74 for
 qemu-devel@nongnu.org; Mon Jun  7 09:12:03 2021
X-Transaction-ID: c3aef7583b2e4ecea3360270af8e2d74
X-filter-score: filter<0>
X-Real-From: huangy81@chinatelecom.cn
X-Receive-IP: 172.18.0.48
X-MEDUSA-Status: 0
From: huangy81@chinatelecom.cn
To: qemu-devel@nongnu.org
Subject: [PATCH v3 2/7] hmp: Add "calc_dirty_rate" and "info dirty_rate" cmds
Date: Mon,  7 Jun 2021 09:11:57 +0800
Message-Id: <4cc0039fc3ad6145136770cf3b0f056c09a2910b.1623027729.git.huangy81@chinatelecom.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1623027729.git.huangy81@chinatelecom.cn>
References: <cover.1623027729.git.huangy81@chinatelecom.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=42.123.76.219;
 envelope-from=huangy81@chinatelecom.cn; helo=chinatelecom.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Hyman <huangy81@chinatelecom.cn>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Xu <peterx@redhat.com>

These two commands are missing when adding the QMP sister commands.
Add them, so developers can play with them easier.

Signed-off-by: Peter Xu <peterx@redhat.com>
Signed-off-by: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
---
 hmp-commands-info.hx  | 13 ++++++++++++
 hmp-commands.hx       | 14 +++++++++++++
 include/monitor/hmp.h |  2 ++
 migration/dirtyrate.c | 47 +++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 76 insertions(+)

diff --git a/hmp-commands-info.hx b/hmp-commands-info.hx
index b2347a6aea..fb59c27200 100644
--- a/hmp-commands-info.hx
+++ b/hmp-commands-info.hx
@@ -867,3 +867,16 @@ SRST
   ``info replay``
     Display the record/replay information: mode and the current icount.
 ERST
+
+    {
+        .name       = "dirty_rate",
+        .args_type  = "",
+        .params     = "",
+        .help       = "show dirty rate information",
+        .cmd        = hmp_info_dirty_rate,
+    },
+
+SRST
+  ``info dirty_rate``
+    Display the vcpu dirty rate information.
+ERST
diff --git a/hmp-commands.hx b/hmp-commands.hx
index 2d21fe5ad4..84dcc3aae6 100644
--- a/hmp-commands.hx
+++ b/hmp-commands.hx
@@ -1727,3 +1727,17 @@ ERST
         .flags      = "p",
     },
 
+SRST
+``calc_dirty_rate`` *second*
+  Start a round of dirty rate measurement with the period specified in *second*.
+  The result of the dirty rate measurement may be observed with ``info
+  dirty_rate`` command.
+ERST
+
+    {
+        .name       = "calc_dirty_rate",
+        .args_type  = "second:l,sample_pages_per_GB:l?",
+        .params     = "second [sample_pages_per_GB]",
+        .help       = "start a round of guest dirty rate measurement",
+        .cmd        = hmp_calc_dirty_rate,
+    },
diff --git a/include/monitor/hmp.h b/include/monitor/hmp.h
index 605d57287a..3baa1058e2 100644
--- a/include/monitor/hmp.h
+++ b/include/monitor/hmp.h
@@ -129,5 +129,7 @@ void hmp_info_replay(Monitor *mon, const QDict *qdict);
 void hmp_replay_break(Monitor *mon, const QDict *qdict);
 void hmp_replay_delete_break(Monitor *mon, const QDict *qdict);
 void hmp_replay_seek(Monitor *mon, const QDict *qdict);
+void hmp_info_dirty_rate(Monitor *mon, const QDict *qdict);
+void hmp_calc_dirty_rate(Monitor *mon, const QDict *qdict);
 
 #endif
diff --git a/migration/dirtyrate.c b/migration/dirtyrate.c
index 2ee3890721..320c56ba2c 100644
--- a/migration/dirtyrate.c
+++ b/migration/dirtyrate.c
@@ -20,6 +20,9 @@
 #include "ram.h"
 #include "trace.h"
 #include "dirtyrate.h"
+#include "monitor/hmp.h"
+#include "monitor/monitor.h"
+#include "qapi/qmp/qdict.h"
 
 static int CalculatingState = DIRTY_RATE_STATUS_UNSTARTED;
 static struct DirtyRateStat DirtyStat;
@@ -447,3 +450,47 @@ struct DirtyRateInfo *qmp_query_dirty_rate(Error **errp)
 {
     return query_dirty_rate_info();
 }
+
+void hmp_info_dirty_rate(Monitor *mon, const QDict *qdict)
+{
+    DirtyRateInfo *info = query_dirty_rate_info();
+
+    monitor_printf(mon, "Status: %s\n",
+                   DirtyRateStatus_str(info->status));
+    monitor_printf(mon, "Start Time: %"PRIi64" (ms)\n",
+                   info->start_time);
+    monitor_printf(mon, "Sample Pages: %"PRIu64" (per GB)\n",
+                   info->sample_pages);
+    monitor_printf(mon, "Period: %"PRIi64" (sec)\n",
+                   info->calc_time);
+    monitor_printf(mon, "Dirty rate: ");
+    if (info->has_dirty_rate) {
+        monitor_printf(mon, "%"PRIi64" (MB/s)\n", info->dirty_rate);
+    } else {
+        monitor_printf(mon, "(not ready)\n");
+    }
+    g_free(info);
+}
+
+void hmp_calc_dirty_rate(Monitor *mon, const QDict *qdict)
+{
+    int64_t sec = qdict_get_try_int(qdict, "second", 0);
+    int64_t sample_pages = qdict_get_try_int(qdict, "sample_pages_per_GB", -1);
+    bool has_sample_pages = (sample_pages != -1);
+    Error *err = NULL;
+
+    if (!sec) {
+        monitor_printf(mon, "Incorrect period length specified!\n");
+        return;
+    }
+
+    qmp_calc_dirty_rate(sec, has_sample_pages, sample_pages, &err);
+    if (err) {
+        hmp_handle_error(mon, err);
+        return;
+    }
+
+    monitor_printf(mon, "Starting dirty rate measurement with period %"PRIi64
+                   " seconds\n", sec);
+    monitor_printf(mon, "[Please use 'info dirty_rate' to check results]\n");
+}
-- 
2.18.2


