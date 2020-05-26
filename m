Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31185198E39
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Mar 2020 10:24:32 +0200 (CEST)
Received: from localhost ([::1]:33824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jJCCF-0005O0-7T
	for lists+qemu-devel@lfdr.de; Tue, 31 Mar 2020 04:24:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56469)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <maozhongyi@cmss.chinamobile.com>) id 1jJCAT-0003gA-Iz
 for qemu-devel@nongnu.org; Tue, 31 Mar 2020 04:22:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <maozhongyi@cmss.chinamobile.com>) id 1jJCAR-0001EB-WA
 for qemu-devel@nongnu.org; Tue, 31 Mar 2020 04:22:41 -0400
Received: from cmccmta3.chinamobile.com ([221.176.66.81]:4969)
 by eggs.gnu.org with esmtp (Exim 4.71)
 (envelope-from <maozhongyi@cmss.chinamobile.com>) id 1jJCAQ-00019W-7r
 for qemu-devel@nongnu.org; Tue, 31 Mar 2020 04:22:39 -0400
Received: from spf.mail.chinamobile.com (unknown[172.16.121.9]) by
 rmmx-syy-dmz-app09-12009 (RichMail) with SMTP id 2ee95e82fdbda0e-25970;
 Tue, 31 Mar 2020 16:22:21 +0800 (CST)
X-RM-TRANSID: 2ee95e82fdbda0e-25970
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from localhost.localdomain (unknown[112.25.154.146])
 by rmsmtp-syy-appsvr05-12005 (RichMail) with SMTP id 2ee55e82fdb5ba9-276ae;
 Tue, 31 Mar 2020 16:22:21 +0800 (CST)
X-RM-TRANSID: 2ee55e82fdb5ba9-276ae
From: Mao Zhongyi <maozhongyi@cmss.chinamobile.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 3/3] migration: move the units of migrate parameters from
 milliseconds to ms
Date: Tue, 31 Mar 2020 16:22:07 +0800
Message-Id: <474bb6cf67defb8be9de5035c11aee57a680557a.1585641083.git.maozhongyi@cmss.chinamobile.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1585641083.git.maozhongyi@cmss.chinamobile.com>
References: <cover.1585641083.git.maozhongyi@cmss.chinamobile.com>
In-Reply-To: <cover.1585641083.git.maozhongyi@cmss.chinamobile.com>
References: <cover.1585641083.git.maozhongyi@cmss.chinamobile.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 221.176.66.81
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
Cc: dgilbert@redhat.com, Mao Zhongyi <maozhongyi@cmss.chinamobile.com>,
 quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Mao Zhongyi <maozhongyi@cmss.chinamobile.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
---
 migration/migration.c | 2 +-
 monitor/hmp-cmds.c    | 8 ++++----
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index 5a6436d035..b3d36d1467 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -1214,7 +1214,7 @@ static bool migrate_params_check(MigrationParameters *params, Error **errp)
         error_setg(errp, QERR_INVALID_PARAMETER_VALUE,
                    "downtime_limit",
                    "an integer in the range of 0 to "
-                    stringify(MAX_MIGRATE_DOWNTIME)" milliseconds");
+                    stringify(MAX_MIGRATE_DOWNTIME)" ms");
         return false;
     }
 
diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index 63097ddcc8..c5de8af1ee 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -231,18 +231,18 @@ void hmp_info_migrate(Monitor *mon, const QDict *qdict)
             monitor_printf(mon, "\n");
         }
 
-        monitor_printf(mon, "total time: %" PRIu64 " milliseconds\n",
+        monitor_printf(mon, "total time: %" PRIu64 " ms\n",
                        info->total_time);
         if (info->has_expected_downtime) {
-            monitor_printf(mon, "expected downtime: %" PRIu64 " milliseconds\n",
+            monitor_printf(mon, "expected downtime: %" PRIu64 " ms\n",
                            info->expected_downtime);
         }
         if (info->has_downtime) {
-            monitor_printf(mon, "downtime: %" PRIu64 " milliseconds\n",
+            monitor_printf(mon, "downtime: %" PRIu64 " ms\n",
                            info->downtime);
         }
         if (info->has_setup_time) {
-            monitor_printf(mon, "setup: %" PRIu64 " milliseconds\n",
+            monitor_printf(mon, "setup: %" PRIu64 " ms\n",
                            info->setup_time);
         }
     }
-- 
2.17.1




