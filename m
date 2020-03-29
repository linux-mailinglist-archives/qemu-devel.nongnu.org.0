Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B56C5196B69
	for <lists+qemu-devel@lfdr.de>; Sun, 29 Mar 2020 07:04:29 +0200 (CEST)
Received: from localhost ([::1]:34318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jIQ7Y-0002Gh-Q8
	for lists+qemu-devel@lfdr.de; Sun, 29 Mar 2020 01:04:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41643)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <maozhongyi@cmss.chinamobile.com>) id 1jIQ5M-00086C-5o
 for qemu-devel@nongnu.org; Sun, 29 Mar 2020 01:02:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <maozhongyi@cmss.chinamobile.com>) id 1jIQ5K-0005UV-QD
 for qemu-devel@nongnu.org; Sun, 29 Mar 2020 01:02:11 -0400
Received: from cmccmta3.chinamobile.com ([221.176.66.81]:48246)
 by eggs.gnu.org with esmtp (Exim 4.71)
 (envelope-from <maozhongyi@cmss.chinamobile.com>) id 1jIQ5K-0005K9-5V
 for qemu-devel@nongnu.org; Sun, 29 Mar 2020 01:02:10 -0400
Received: from spf.mail.chinamobile.com (unknown[172.16.121.11]) by
 rmmx-syy-dmz-app12-12012 (RichMail) with SMTP id 2eec5e802bb9d4a-f3cb7;
 Sun, 29 Mar 2020 13:01:45 +0800 (CST)
X-RM-TRANSID: 2eec5e802bb9d4a-f3cb7
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from maozy-host.localdomain (unknown[117.136.46.37])
 by rmsmtp-syy-appsvr06-12006 (RichMail) with SMTP id 2ee65e802baee64-267c4;
 Sun, 29 Mar 2020 13:01:45 +0800 (CST)
X-RM-TRANSID: 2ee65e802baee64-267c4
From: Mao Zhongyi <maozhongyi@cmss.chinamobile.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/3] migration/migration: improve error reporting for migrate
 parameters
Date: Sun, 29 Mar 2020 13:01:29 +0800
Message-Id: <20200329050131.26864-2-maozhongyi@cmss.chinamobile.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200329050131.26864-1-maozhongyi@cmss.chinamobile.com>
References: <20200329050131.26864-1-maozhongyi@cmss.chinamobile.com>
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

use QERR_INVALID_PARAMETER_VALUE instead of
"Parameter '%s' expects" for consistency.

Signed-off-by: Mao Zhongyi <maozhongyi@cmss.chinamobile.com>
---
 migration/migration.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index 2b7b5bccfa..e0223f3b15 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -1202,16 +1202,17 @@ static bool migrate_params_check(MigrationParameters *params, Error **errp)
     }
 
     if (params->has_max_bandwidth && (params->max_bandwidth > SIZE_MAX)) {
-        error_setg(errp, "Parameter 'max_bandwidth' expects an integer in the"
-                         " range of 0 to %zu bytes/second", SIZE_MAX);
+        error_setg(errp, QERR_INVALID_PARAMETER_VALUE,
+                   "max_bandwidth",
+                   "an integer in the range of 0 to '2^64 - 1' bytes/second");
         return false;
     }
 
     if (params->has_downtime_limit &&
         (params->downtime_limit > MAX_MIGRATE_DOWNTIME)) {
-        error_setg(errp, "Parameter 'downtime_limit' expects an integer in "
-                         "the range of 0 to %d milliseconds",
-                         MAX_MIGRATE_DOWNTIME);
+        error_setg(errp, QERR_INVALID_PARAMETER_VALUE,
+                   "downtime_limit",
+                   "an integer in the range of 0 to 2000000 milliseconds");
         return false;
     }
 
@@ -2108,9 +2109,9 @@ void qmp_migrate_set_speed(int64_t value, Error **errp)
 void qmp_migrate_set_downtime(double value, Error **errp)
 {
     if (value < 0 || value > MAX_MIGRATE_DOWNTIME_SECONDS) {
-        error_setg(errp, "Parameter 'downtime_limit' expects an integer in "
-                         "the range of 0 to %d seconds",
-                         MAX_MIGRATE_DOWNTIME_SECONDS);
+        error_setg(errp, QERR_INVALID_PARAMETER_VALUE,
+                   "downtime_limit",
+                   "an integer in the range of 0 to 2000 seconds");
         return;
     }
 
-- 
2.17.1




