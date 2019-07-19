Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACD7C6E179
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Jul 2019 09:12:20 +0200 (CEST)
Received: from localhost ([::1]:42730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hoN3z-0002kE-DQ
	for lists+qemu-devel@lfdr.de; Fri, 19 Jul 2019 03:12:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57539)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richardw.yang@linux.intel.com>) id 1hoN3m-0002Le-Nb
 for qemu-devel@nongnu.org; Fri, 19 Jul 2019 03:12:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richardw.yang@linux.intel.com>) id 1hoN3k-0007vL-0r
 for qemu-devel@nongnu.org; Fri, 19 Jul 2019 03:12:05 -0400
Received: from mga11.intel.com ([192.55.52.93]:49934)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <richardw.yang@linux.intel.com>)
 id 1hoN3g-0007sc-Kv
 for qemu-devel@nongnu.org; Fri, 19 Jul 2019 03:12:01 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 19 Jul 2019 00:11:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,281,1559545200"; d="scan'208";a="367175877"
Received: from richard.sh.intel.com (HELO localhost) ([10.239.159.54])
 by fmsmga005.fm.intel.com with ESMTP; 19 Jul 2019 00:11:54 -0700
From: Wei Yang <richardw.yang@linux.intel.com>
To: qemu-devel@nongnu.org
Date: Fri, 19 Jul 2019 15:11:29 +0800
Message-Id: <20190719071129.11880-1-richardw.yang@linux.intel.com>
X-Mailer: git-send-email 2.17.1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 192.55.52.93
Subject: [Qemu-devel] [PATCH] migration: use migration_in_postcopy() to
 check POSTCOPY_ACTIVE
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

Use common helper function to check the state.

Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
---
 migration/rdma.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/migration/rdma.c b/migration/rdma.c
index 3036221ee8..0e73e759ca 100644
--- a/migration/rdma.c
+++ b/migration/rdma.c
@@ -3140,7 +3140,7 @@ static size_t qemu_rdma_save_page(QEMUFile *f, void *opaque,
 
     CHECK_ERROR_STATE();
 
-    if (migrate_get_current()->state == MIGRATION_STATUS_POSTCOPY_ACTIVE) {
+    if (migration_in_postcopy()) {
         rcu_read_unlock();
         return RAM_SAVE_CONTROL_NOT_SUPP;
     }
@@ -3775,7 +3775,7 @@ static int qemu_rdma_registration_start(QEMUFile *f, void *opaque,
 
     CHECK_ERROR_STATE();
 
-    if (migrate_get_current()->state == MIGRATION_STATUS_POSTCOPY_ACTIVE) {
+    if (migration_in_postcopy()) {
         rcu_read_unlock();
         return 0;
     }
@@ -3810,7 +3810,7 @@ static int qemu_rdma_registration_stop(QEMUFile *f, void *opaque,
 
     CHECK_ERROR_STATE();
 
-    if (migrate_get_current()->state == MIGRATION_STATUS_POSTCOPY_ACTIVE) {
+    if (migration_in_postcopy()) {
         rcu_read_unlock();
         return 0;
     }
-- 
2.17.1


