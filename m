Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E83AA3A17C4
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 16:47:43 +0200 (CEST)
Received: from localhost ([::1]:42332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqzUc-0006Qp-Vu
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 10:47:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lqzSw-0003hE-4a
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 10:45:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54045)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lqzSt-0005Y2-9h
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 10:45:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623249954;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pHlziamaUebz1rQ20fc/pINanMO3eYs762iYIZ+86L4=;
 b=dgjBsSs4OwKPvO/90Yc3LjgK8dc3e1tIq1uRB7O/Yqs5aG0vwNsV+t9JjUYoGAsLVjIisd
 9ZoybA6fNZmaWrLJOS5t2AmEitKkf0+OmUsyPlUDx7acJhrJkaiYykDf6K8sOnR7lS7mki
 J8vxs966sqL5HRSKfWvU50UGTVlUH1Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-604-q_szMJLYNGyZTwSYI0qFFA-1; Wed, 09 Jun 2021 10:45:52 -0400
X-MC-Unique: q_szMJLYNGyZTwSYI0qFFA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E2FE3C7403;
 Wed,  9 Jun 2021 14:45:51 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-113-168.ams2.redhat.com
 [10.36.113.168])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 978D41002EF0;
 Wed,  9 Jun 2021 14:45:50 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, huangy81@chinatelecom.cn, peterx@redhat.com,
 lizhijian@cn.fujitsu.com, leobras.c@gmail.com, pabeni@redhat.com
Subject: [PULL 9/9] hmp: Add "calc_dirty_rate" and "info dirty_rate" cmds
Date: Wed,  9 Jun 2021 15:45:12 +0100
Message-Id: <20210609144512.211746-10-dgilbert@redhat.com>
In-Reply-To: <20210609144512.211746-1-dgilbert@redhat.com>
References: <20210609144512.211746-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Xu <peterx@redhat.com>

These two commands are missing when adding the QMP sister commands.
Add them, so developers can play with them easier.

Signed-off-by: Peter Xu <peterx@redhat.com>
Signed-off-by: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
Message-Id: <4cc0039fc3ad6145136770cf3b0f056c09a2910b.1623027729.git.huangy81@chinatelecom.cn>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
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
2.31.1


