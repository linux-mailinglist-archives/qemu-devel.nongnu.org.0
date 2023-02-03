Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6A49689291
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 09:48:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNriM-00006b-Fi; Fri, 03 Feb 2023 03:46:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pNrhs-0008LO-1a
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 03:46:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pNrhl-0007UL-Tf
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 03:46:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675413956;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lqVKZVF7r5I8Coms5It0htQYCXnldONuO37fWqivKso=;
 b=Jtg737bP30ocMY1Qb8MtQePyIUS4TnMir9sre+pkZl6uieZ21FQtjIWjSWlKscnKdGoF14
 okoa2bekUNWWNv1TDJdzF5g9WZYHE9V4oSkrPCDoimIcseaDg0R0/wqh6Motewfl9Fu9Jm
 yFnl07xMuuEhdAXxF9Lm3sZ68b0Dfo4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-544-yw-ozIaPNRqzwkNX70G9kA-1; Fri, 03 Feb 2023 03:45:52 -0500
X-MC-Unique: yw-ozIaPNRqzwkNX70G9kA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 75A2E3C1016D;
 Fri,  3 Feb 2023 08:45:52 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5167E2026D37;
 Fri,  3 Feb 2023 08:45:52 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id C64AA21E6901; Fri,  3 Feb 2023 09:45:49 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org
Subject: [PULL 10/35] hmp: Rename help_cmd() to hmp_help_cmd(),
 move declaration to hmp.h
Date: Fri,  3 Feb 2023 09:45:24 +0100
Message-Id: <20230203084549.2622302-11-armbru@redhat.com>
In-Reply-To: <20230203084549.2622302-1-armbru@redhat.com>
References: <20230203084549.2622302-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The next commit will move a caller of help_cmd() to a new file.
Including monitor/monitor-internal.h there just for help_cmd() feels
silly.  Better to provide it in monitor/hmp.h suitably renamed.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20230124121946.1139465-8-armbru@redhat.com>
---
 include/monitor/hmp.h      | 1 +
 monitor/monitor-internal.h | 1 -
 monitor/hmp.c              | 2 +-
 monitor/misc.c             | 8 ++++----
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/include/monitor/hmp.h b/include/monitor/hmp.h
index c25bec1863..5a75f4659c 100644
--- a/include/monitor/hmp.h
+++ b/include/monitor/hmp.h
@@ -18,6 +18,7 @@
 #include "qapi/qapi-types-common.h"
 
 bool hmp_handle_error(Monitor *mon, Error *err);
+void hmp_help_cmd(Monitor *mon, const char *name);
 
 void hmp_info_name(Monitor *mon, const QDict *qdict);
 void hmp_info_version(Monitor *mon, const QDict *qdict);
diff --git a/monitor/monitor-internal.h b/monitor/monitor-internal.h
index a2cdbbf646..53e3808054 100644
--- a/monitor/monitor-internal.h
+++ b/monitor/monitor-internal.h
@@ -186,7 +186,6 @@ void monitor_data_destroy_qmp(MonitorQMP *mon);
 void coroutine_fn monitor_qmp_dispatcher_co(void *data);
 
 int get_monitor_def(Monitor *mon, int64_t *pval, const char *name);
-void help_cmd(Monitor *mon, const char *name);
 void handle_hmp_command(MonitorHMP *mon, const char *cmdline);
 int hmp_compare_cmd(const char *name, const char *list);
 
diff --git a/monitor/hmp.c b/monitor/hmp.c
index 893e100581..844cf54c18 100644
--- a/monitor/hmp.c
+++ b/monitor/hmp.c
@@ -271,7 +271,7 @@ static void help_cmd_dump(Monitor *mon, const HMPCommand *cmds,
     }
 }
 
-void help_cmd(Monitor *mon, const char *name)
+void hmp_help_cmd(Monitor *mon, const char *name)
 {
     char *args[MAX_ARGS];
     int nb_args = 0;
diff --git a/monitor/misc.c b/monitor/misc.c
index 9da52939b2..240d137327 100644
--- a/monitor/misc.c
+++ b/monitor/misc.c
@@ -153,7 +153,7 @@ int hmp_compare_cmd(const char *name, const char *list)
 
 static void do_help_cmd(Monitor *mon, const QDict *qdict)
 {
-    help_cmd(mon, qdict_get_try_str(qdict, "name"));
+    hmp_help_cmd(mon, qdict_get_try_str(qdict, "name"));
 }
 
 static void hmp_trace_event(Monitor *mon, const QDict *qdict)
@@ -195,14 +195,14 @@ static void hmp_trace_file(Monitor *mon, const QDict *qdict)
         }
     } else {
         monitor_printf(mon, "unexpected argument \"%s\"\n", op);
-        help_cmd(mon, "trace-file");
+        hmp_help_cmd(mon, "trace-file");
     }
 }
 #endif
 
 static void hmp_info_help(Monitor *mon, const QDict *qdict)
 {
-    help_cmd(mon, "info");
+    hmp_help_cmd(mon, "info");
 }
 
 static void monitor_init_qmp_commands(void)
@@ -424,7 +424,7 @@ static void hmp_log(Monitor *mon, const QDict *qdict)
     } else {
         mask = qemu_str_to_log_mask(items);
         if (!mask) {
-            help_cmd(mon, "log");
+            hmp_help_cmd(mon, "log");
             return;
         }
     }
-- 
2.39.0


