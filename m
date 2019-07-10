Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D52B63783
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Jul 2019 16:12:06 +0200 (CEST)
Received: from localhost ([::1]:50332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hkqqj-0000GH-R8
	for lists+qemu-devel@lfdr.de; Tue, 09 Jul 2019 10:12:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54522)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richardw.yang@linux.intel.com>) id 1hkqop-0007MV-BM
 for qemu-devel@nongnu.org; Tue, 09 Jul 2019 10:10:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richardw.yang@linux.intel.com>) id 1hkqoo-0008EN-0X
 for qemu-devel@nongnu.org; Tue, 09 Jul 2019 10:10:07 -0400
Received: from mga02.intel.com ([134.134.136.20]:42710)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <richardw.yang@linux.intel.com>)
 id 1hkqon-0008DN-Ni
 for qemu-devel@nongnu.org; Tue, 09 Jul 2019 10:10:05 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 09 Jul 2019 07:10:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,470,1557212400"; d="scan'208";a="176507551"
Received: from richard.sh.intel.com (HELO localhost) ([10.239.159.54])
 by orsmga002.jf.intel.com with ESMTP; 09 Jul 2019 07:10:04 -0700
From: Wei Yang <richardw.yang@linux.intel.com>
To: qemu-devel@nongnu.org
Date: Tue,  9 Jul 2019 22:09:24 +0800
Message-Id: <20190709140924.13291-4-richardw.yang@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190709140924.13291-1-richardw.yang@linux.intel.com>
References: <20190709140924.13291-1-richardw.yang@linux.intel.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 134.134.136.20
Subject: [Qemu-devel] [PATCH 3/3] migration/savevm: move non SaveStateEntry
 condition check out of iteration
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

in_postcopy and iterable_only are not SaveStateEntry specific, it would
be more proper to check them out of iteration.

Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
---
 migration/savevm.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/migration/savevm.c b/migration/savevm.c
index c41e13e322..8a2ada529e 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -1247,8 +1247,7 @@ void qemu_savevm_state_complete_postcopy(QEMUFile *f)
 }
 
 static
-int qemu_savevm_state_complete_precopy_iterable(QEMUFile *f, bool in_postcopy,
-                                                bool iterable_only)
+int qemu_savevm_state_complete_precopy_iterable(QEMUFile *f, bool in_postcopy)
 {
     SaveStateEntry *se;
     int ret;
@@ -1257,7 +1256,6 @@ int qemu_savevm_state_complete_precopy_iterable(QEMUFile *f, bool in_postcopy,
         if (!se->ops ||
             (in_postcopy && se->ops->has_postcopy &&
              se->ops->has_postcopy(se->opaque)) ||
-            (in_postcopy && !iterable_only) ||
             !se->ops->save_live_complete_precopy) {
             continue;
         }
@@ -1369,10 +1367,11 @@ int qemu_savevm_state_complete_precopy(QEMUFile *f, bool iterable_only,
 
     cpu_synchronize_all_states();
 
-    ret = qemu_savevm_state_complete_precopy_iterable(f, in_postcopy,
-                                                      iterable_only);
-    if (ret) {
-        return ret;
+    if (!in_postcopy || iterable_only) {
+        ret = qemu_savevm_state_complete_precopy_iterable(f, in_postcopy);
+        if (ret) {
+            return ret;
+        }
     }
 
     if (iterable_only) {
-- 
2.17.1


