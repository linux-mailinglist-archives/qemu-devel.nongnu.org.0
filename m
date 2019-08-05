Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CB6A80FB0
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Aug 2019 02:31:13 +0200 (CEST)
Received: from localhost ([::1]:49982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1huQu8-00029F-FO
	for lists+qemu-devel@lfdr.de; Sun, 04 Aug 2019 20:31:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41266)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richardw.yang@linux.intel.com>) id 1huQtP-0001jL-Ac
 for qemu-devel@nongnu.org; Sun, 04 Aug 2019 20:30:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richardw.yang@linux.intel.com>) id 1huQtN-0006Nf-1w
 for qemu-devel@nongnu.org; Sun, 04 Aug 2019 20:30:27 -0400
Received: from mga11.intel.com ([192.55.52.93]:49330)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <richardw.yang@linux.intel.com>)
 id 1huQtL-0005M7-4C
 for qemu-devel@nongnu.org; Sun, 04 Aug 2019 20:30:23 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 04 Aug 2019 17:29:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,347,1559545200"; d="scan'208";a="372919522"
Received: from richard.sh.intel.com (HELO localhost) ([10.239.159.54])
 by fmsmga005.fm.intel.com with ESMTP; 04 Aug 2019 17:29:16 -0700
From: Wei Yang <richardw.yang@linux.intel.com>
To: qemu-devel@nongnu.org
Date: Mon,  5 Aug 2019 08:28:47 +0800
Message-Id: <20190805002847.3284-1-richardw.yang@linux.intel.com>
X-Mailer: git-send-email 2.17.1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 192.55.52.93
Subject: [Qemu-devel] [PATCH v2] hmp: Remove migration capabilities from
 "info migrate"
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
 armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

With the growth of migration capabilities, it is not proper to display
them in "info migrate". Users are recommended to use "info
migrate_capabiltiies" to list them.

Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
Suggested-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

---
v2:
  * remove capabilities from "info migrate"
---
 monitor/hmp-cmds.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index 99ceb0846b..05a09987da 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -220,24 +220,13 @@ static char *SocketAddress_to_str(SocketAddress *addr)
 void hmp_info_migrate(Monitor *mon, const QDict *qdict)
 {
     MigrationInfo *info;
-    MigrationCapabilityStatusList *caps, *cap;
+    MigrationCapabilityStatusList *caps;
 
     info = qmp_query_migrate(NULL);
     caps = qmp_query_migrate_capabilities(NULL);
 
     migration_global_dump(mon);
 
-    /* do not display parameters during setup */
-    if (info->has_status && caps) {
-        monitor_printf(mon, "capabilities: ");
-        for (cap = caps; cap; cap = cap->next) {
-            monitor_printf(mon, "%s: %s ",
-                           MigrationCapability_str(cap->value->capability),
-                           cap->value->state ? "on" : "off");
-        }
-        monitor_printf(mon, "\n");
-    }
-
     if (info->has_status) {
         monitor_printf(mon, "Migration status: %s",
                        MigrationStatus_str(info->status));
-- 
2.17.1


