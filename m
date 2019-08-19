Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99E7291B78
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Aug 2019 05:29:27 +0200 (CEST)
Received: from localhost ([::1]:44290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hzYMI-0007Ql-Gt
	for lists+qemu-devel@lfdr.de; Sun, 18 Aug 2019 23:29:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49399)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richardw.yang@linux.intel.com>) id 1hzYLQ-00072G-Pe
 for qemu-devel@nongnu.org; Sun, 18 Aug 2019 23:28:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richardw.yang@linux.intel.com>) id 1hzYLP-0008IL-K6
 for qemu-devel@nongnu.org; Sun, 18 Aug 2019 23:28:32 -0400
Received: from mga12.intel.com ([192.55.52.136]:19984)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <richardw.yang@linux.intel.com>)
 id 1hzYLP-0008H3-Ch
 for qemu-devel@nongnu.org; Sun, 18 Aug 2019 23:28:31 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 Aug 2019 20:28:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,403,1559545200"; d="scan'208";a="378057779"
Received: from richard.sh.intel.com (HELO localhost) ([10.239.159.54])
 by fmsmga006.fm.intel.com with ESMTP; 18 Aug 2019 20:28:28 -0700
From: Wei Yang <richardw.yang@linux.intel.com>
To: qemu-devel@nongnu.org
Date: Mon, 19 Aug 2019 11:28:04 +0800
Message-Id: <20190819032804.8579-1-richardw.yang@linux.intel.com>
X-Mailer: git-send-email 2.17.1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 192.55.52.136
Subject: [Qemu-devel] [PATCH v2] migration: cleanup check on ops in
 savevm.handlers iterations
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

During migration, there are several places to iterate on
savevm.handlers. And on each iteration, we need to check its ops and
related callbacks before invoke it.

Generally, ops is the first element to check, and it is only necessary
to check it once.

This patch clean all the related part in savevm.c to check ops only once
in those iterations.

Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>

---
v2: rebase on latest upstream
---
 migration/savevm.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/migration/savevm.c b/migration/savevm.c
index 4a86128ac4..35426d1db8 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -1100,7 +1100,7 @@ void qemu_savevm_state_setup(QEMUFile *f)
         if (!se->ops || !se->ops->save_setup) {
             continue;
         }
-        if (se->ops && se->ops->is_active) {
+        if (se->ops->is_active) {
             if (!se->ops->is_active(se->opaque)) {
                 continue;
             }
@@ -1131,7 +1131,7 @@ int qemu_savevm_state_resume_prepare(MigrationState *s)
         if (!se->ops || !se->ops->resume_prepare) {
             continue;
         }
-        if (se->ops && se->ops->is_active) {
+        if (se->ops->is_active) {
             if (!se->ops->is_active(se->opaque)) {
                 continue;
             }
@@ -1227,7 +1227,7 @@ void qemu_savevm_state_complete_postcopy(QEMUFile *f)
         if (!se->ops || !se->ops->save_live_complete_postcopy) {
             continue;
         }
-        if (se->ops && se->ops->is_active) {
+        if (se->ops->is_active) {
             if (!se->ops->is_active(se->opaque)) {
                 continue;
             }
@@ -1264,7 +1264,7 @@ int qemu_savevm_state_complete_precopy_iterable(QEMUFile *f, bool in_postcopy)
             continue;
         }
 
-        if (se->ops && se->ops->is_active) {
+        if (se->ops->is_active) {
             if (!se->ops->is_active(se->opaque)) {
                 continue;
             }
@@ -1413,7 +1413,7 @@ void qemu_savevm_state_pending(QEMUFile *f, uint64_t threshold_size,
         if (!se->ops || !se->ops->save_live_pending) {
             continue;
         }
-        if (se->ops && se->ops->is_active) {
+        if (se->ops->is_active) {
             if (!se->ops->is_active(se->opaque)) {
                 continue;
             }
@@ -2334,7 +2334,7 @@ static int qemu_loadvm_state_setup(QEMUFile *f)
         if (!se->ops || !se->ops->load_setup) {
             continue;
         }
-        if (se->ops && se->ops->is_active) {
+        if (se->ops->is_active) {
             if (!se->ops->is_active(se->opaque)) {
                 continue;
             }
-- 
2.17.1


