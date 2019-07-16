Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0A316A019
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Jul 2019 02:54:56 +0200 (CEST)
Received: from localhost ([::1]:44656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hnBk7-0005yH-2q
	for lists+qemu-devel@lfdr.de; Mon, 15 Jul 2019 20:54:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54008)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richardw.yang@linux.intel.com>) id 1hnBjv-0005Xe-BH
 for qemu-devel@nongnu.org; Mon, 15 Jul 2019 20:54:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richardw.yang@linux.intel.com>) id 1hnBju-0007hq-1l
 for qemu-devel@nongnu.org; Mon, 15 Jul 2019 20:54:43 -0400
Received: from mga09.intel.com ([134.134.136.24]:27652)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <richardw.yang@linux.intel.com>)
 id 1hnBjt-0007e1-Od
 for qemu-devel@nongnu.org; Mon, 15 Jul 2019 20:54:41 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 15 Jul 2019 17:54:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,494,1557212400"; d="scan'208";a="167494647"
Received: from richard.sh.intel.com (HELO localhost) ([10.239.159.54])
 by fmsmga008.fm.intel.com with ESMTP; 15 Jul 2019 17:54:38 -0700
From: Wei Yang <richardw.yang@linux.intel.com>
To: qemu-devel@nongnu.org
Date: Tue, 16 Jul 2019 08:54:11 +0800
Message-Id: <20190716005411.4156-1-richardw.yang@linux.intel.com>
X-Mailer: git-send-email 2.17.1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 134.134.136.24
Subject: [Qemu-devel] [PATCH] migration: consolidate time info into
 populate_time_info
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
Cc: Wei Yang <richardw.yang@linux.intel.com>, dgilbert@redhat.com,
 quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Consolidate time information fill up into its function for better
readability.

Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
---
 migration/migration.c | 40 ++++++++++++++++++++++------------------
 1 file changed, 22 insertions(+), 18 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index 47fe22d327..18ef933105 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -822,6 +822,25 @@ bool migration_is_setup_or_active(int state)
     }
 }
 
+static void populate_time_info(MigrationInfo *info, MigrationState *s)
+{
+    info->has_status = true;
+    info->has_setup_time = true;
+    info->setup_time = s->setup_time;
+    if (s->state == MIGRATION_STATUS_COMPLETED) {
+        info->has_total_time = true;
+        info->total_time = s->total_time;
+        info->has_downtime = true;
+        info->downtime = s->downtime;
+    } else {
+        info->has_total_time = true;
+        info->total_time = qemu_clock_get_ms(QEMU_CLOCK_REALTIME) -
+                           s->start_time;
+        info->has_expected_downtime = true;
+        info->expected_downtime = s->expected_downtime;
+    }
+}
+
 static void populate_ram_info(MigrationInfo *info, MigrationState *s)
 {
     info->has_ram = true;
@@ -907,16 +926,8 @@ static void fill_source_migration_info(MigrationInfo *info)
     case MIGRATION_STATUS_DEVICE:
     case MIGRATION_STATUS_POSTCOPY_PAUSED:
     case MIGRATION_STATUS_POSTCOPY_RECOVER:
-         /* TODO add some postcopy stats */
-        info->has_status = true;
-        info->has_total_time = true;
-        info->total_time = qemu_clock_get_ms(QEMU_CLOCK_REALTIME)
-            - s->start_time;
-        info->has_expected_downtime = true;
-        info->expected_downtime = s->expected_downtime;
-        info->has_setup_time = true;
-        info->setup_time = s->setup_time;
-
+        /* TODO add some postcopy stats */
+        populate_time_info(info, s);
         populate_ram_info(info, s);
         populate_disk_info(info);
         break;
@@ -925,14 +936,7 @@ static void fill_source_migration_info(MigrationInfo *info)
         /* TODO: display COLO specific information (checkpoint info etc.) */
         break;
     case MIGRATION_STATUS_COMPLETED:
-        info->has_status = true;
-        info->has_total_time = true;
-        info->total_time = s->total_time;
-        info->has_downtime = true;
-        info->downtime = s->downtime;
-        info->has_setup_time = true;
-        info->setup_time = s->setup_time;
-
+        populate_time_info(info, s);
         populate_ram_info(info, s);
         break;
     case MIGRATION_STATUS_FAILED:
-- 
2.17.1


