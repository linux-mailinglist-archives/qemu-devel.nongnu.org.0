Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 785016CAFC
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Jul 2019 10:39:39 +0200 (CEST)
Received: from localhost ([::1]:35516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ho1ww-0003VG-3G
	for lists+qemu-devel@lfdr.de; Thu, 18 Jul 2019 04:39:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55368)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richardw.yang@linux.intel.com>) id 1ho1wg-0002g9-3m
 for qemu-devel@nongnu.org; Thu, 18 Jul 2019 04:39:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richardw.yang@linux.intel.com>) id 1ho1wf-0006gS-94
 for qemu-devel@nongnu.org; Thu, 18 Jul 2019 04:39:22 -0400
Received: from mga14.intel.com ([192.55.52.115]:60716)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <richardw.yang@linux.intel.com>)
 id 1ho1wf-0005cq-0z
 for qemu-devel@nongnu.org; Thu, 18 Jul 2019 04:39:21 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 Jul 2019 01:38:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,276,1559545200"; d="scan'208";a="169793069"
Received: from richard.sh.intel.com (HELO localhost) ([10.239.159.54])
 by fmsmga007.fm.intel.com with ESMTP; 18 Jul 2019 01:38:13 -0700
From: Wei Yang <richardw.yang@linux.intel.com>
To: qemu-devel@nongnu.org
Date: Thu, 18 Jul 2019 16:37:47 +0800
Message-Id: <20190718083747.5859-1-richardw.yang@linux.intel.com>
X-Mailer: git-send-email 2.17.1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 192.55.52.115
Subject: [Qemu-devel] [PATCH] migration/postcopy: start_postcopy could be
 true only when migrate_postcopy() return true
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

There is only one place to set start_postcopy to true,
qmp_migrate_start_postcopy(), which make sure start_postcopy could be
set to true when migrate_postcopy() return true.

So start_postcopy is true implies the other one.

Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
---
 migration/migration.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index 719d125041..27ca10122f 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -3101,8 +3101,7 @@ static MigIterateState migration_iteration_run(MigrationState *s)
 
     if (pending_size && pending_size >= s->threshold_size) {
         /* Still a significant amount to transfer */
-        if (migrate_postcopy() && !in_postcopy &&
-            pend_pre <= s->threshold_size &&
+        if (!in_postcopy && pend_pre <= s->threshold_size &&
             atomic_read(&s->start_postcopy)) {
             if (postcopy_start(s)) {
                 error_report("%s: postcopy failed to start", __func__);
-- 
2.17.1


