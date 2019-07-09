Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D195763782
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Jul 2019 16:11:55 +0200 (CEST)
Received: from localhost ([::1]:50330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hkqqZ-0000BM-2q
	for lists+qemu-devel@lfdr.de; Tue, 09 Jul 2019 10:11:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54515)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richardw.yang@linux.intel.com>) id 1hkqoo-0007MU-Ol
 for qemu-devel@nongnu.org; Tue, 09 Jul 2019 10:10:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richardw.yang@linux.intel.com>) id 1hkqon-0008E7-GH
 for qemu-devel@nongnu.org; Tue, 09 Jul 2019 10:10:06 -0400
Received: from mga02.intel.com ([134.134.136.20]:42710)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <richardw.yang@linux.intel.com>)
 id 1hkqon-0008DN-8T
 for qemu-devel@nongnu.org; Tue, 09 Jul 2019 10:10:05 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 09 Jul 2019 07:10:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,470,1557212400"; d="scan'208";a="176507530"
Received: from richard.sh.intel.com (HELO localhost) ([10.239.159.54])
 by orsmga002.jf.intel.com with ESMTP; 09 Jul 2019 07:10:02 -0700
From: Wei Yang <richardw.yang@linux.intel.com>
To: qemu-devel@nongnu.org
Date: Tue,  9 Jul 2019 22:09:23 +0800
Message-Id: <20190709140924.13291-3-richardw.yang@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190709140924.13291-1-richardw.yang@linux.intel.com>
References: <20190709140924.13291-1-richardw.yang@linux.intel.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 134.134.136.20
Subject: [Qemu-devel] [PATCH 2/3] migration/savevm: split
 qemu_savevm_state_complete_precopy() into two parts
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

This is a preparation patch for further cleanup.

No functional change, just wrap two major part of
qemu_savevm_state_complete_precopy() into function.

Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
---
 migration/savevm.c | 66 ++++++++++++++++++++++++++++++++++------------
 1 file changed, 49 insertions(+), 17 deletions(-)

diff --git a/migration/savevm.c b/migration/savevm.c
index becedcc1c6..c41e13e322 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -1246,23 +1246,12 @@ void qemu_savevm_state_complete_postcopy(QEMUFile *f)
     qemu_fflush(f);
 }
 
-int qemu_savevm_state_complete_precopy(QEMUFile *f, bool iterable_only,
-                                       bool inactivate_disks)
+static
+int qemu_savevm_state_complete_precopy_iterable(QEMUFile *f, bool in_postcopy,
+                                                bool iterable_only)
 {
-    QJSON *vmdesc;
-    int vmdesc_len;
     SaveStateEntry *se;
     int ret;
-    bool in_postcopy = migration_in_postcopy();
-    Error *local_err = NULL;
-
-    if (precopy_notify(PRECOPY_NOTIFY_COMPLETE, &local_err)) {
-        error_report_err(local_err);
-    }
-
-    trace_savevm_state_complete_precopy();
-
-    cpu_synchronize_all_states();
 
     QTAILQ_FOREACH(se, &savevm_state.handlers, entry) {
         if (!se->ops ||
@@ -1291,9 +1280,18 @@ int qemu_savevm_state_complete_precopy(QEMUFile *f, bool iterable_only,
         }
     }
 
-    if (iterable_only) {
-        goto flush;
-    }
+    return 0;
+}
+
+static
+int qemu_savevm_state_complete_precopy_non_iterable(QEMUFile *f,
+                                                    bool in_postcopy,
+                                                    bool inactivate_disks)
+{
+    QJSON *vmdesc;
+    int vmdesc_len;
+    SaveStateEntry *se;
+    int ret;
 
     vmdesc = qjson_new();
     json_prop_int(vmdesc, "page_size", qemu_target_page_size());
@@ -1353,6 +1351,40 @@ int qemu_savevm_state_complete_precopy(QEMUFile *f, bool iterable_only,
     }
     qjson_destroy(vmdesc);
 
+    return 0;
+}
+
+int qemu_savevm_state_complete_precopy(QEMUFile *f, bool iterable_only,
+                                       bool inactivate_disks)
+{
+    int ret;
+    Error *local_err = NULL;
+    bool in_postcopy = migration_in_postcopy();
+
+    if (precopy_notify(PRECOPY_NOTIFY_COMPLETE, &local_err)) {
+        error_report_err(local_err);
+    }
+
+    trace_savevm_state_complete_precopy();
+
+    cpu_synchronize_all_states();
+
+    ret = qemu_savevm_state_complete_precopy_iterable(f, in_postcopy,
+                                                      iterable_only);
+    if (ret) {
+        return ret;
+    }
+
+    if (iterable_only) {
+        goto flush;
+    }
+
+    ret = qemu_savevm_state_complete_precopy_non_iterable(f, in_postcopy,
+                                                          inactivate_disks);
+    if (ret) {
+        return ret;
+    }
+
 flush:
     qemu_fflush(f);
     return 0;
-- 
2.17.1


