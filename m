Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 842993694A
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jun 2019 03:33:56 +0200 (CEST)
Received: from localhost ([127.0.0.1]:52634 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hYhHv-0006nK-MS
	for lists+qemu-devel@lfdr.de; Wed, 05 Jun 2019 21:33:55 -0400
Received: from eggs.gnu.org ([209.51.188.92]:40306)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richardw.yang@linux.intel.com>) id 1hYhGK-0006Dl-FV
	for qemu-devel@nongnu.org; Wed, 05 Jun 2019 21:32:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richardw.yang@linux.intel.com>) id 1hYhGJ-0001l1-2E
	for qemu-devel@nongnu.org; Wed, 05 Jun 2019 21:32:16 -0400
Received: from mga14.intel.com ([192.55.52.115]:32561)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <richardw.yang@linux.intel.com>)
	id 1hYhGI-0001jr-Pt
	for qemu-devel@nongnu.org; Wed, 05 Jun 2019 21:32:15 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	05 Jun 2019 18:32:13 -0700
X-ExtLoop1: 1
Received: from richard.sh.intel.com (HELO localhost) ([10.239.159.54])
	by FMSMGA003.fm.intel.com with ESMTP; 05 Jun 2019 18:32:12 -0700
From: Wei Yang <richardw.yang@linux.intel.com>
To: qemu-devel@nongnu.org
Date: Thu,  6 Jun 2019 09:31:38 +0800
Message-Id: <20190606013138.13312-3-richardw.yang@linux.intel.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190606013138.13312-1-richardw.yang@linux.intel.com>
References: <20190606013138.13312-1-richardw.yang@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 192.55.52.115
Subject: [Qemu-devel] [PATCH 2/2] migration/xbzrle: cleanup the handling
 cache miss condition
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Wei Yang <richardw.yang@linux.intel.com>, dgilbert@redhat.com,
	quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For cache miss condition not in last_stage, we need to insert data into
cache. When this step succeed, current_data should be updated. While no
matter these checks pass or not, -1 is returned.

Based on this, the logic in cache miss handling could be simplified a
little.

Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
---
 migration/ram.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index 878cd8de7a..67ba075cc4 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -1572,15 +1572,14 @@ static int save_xbzrle_page(RAMState *rs, uint8_t **current_data,
     if (!cache_is_cached(XBZRLE.cache, current_addr,
                          ram_counters.dirty_sync_count)) {
         xbzrle_counters.cache_miss++;
-        if (!last_stage) {
-            if (cache_insert(XBZRLE.cache, current_addr, *current_data,
-                             ram_counters.dirty_sync_count) == -1) {
-                return -1;
-            } else {
-                /* update *current_data when the page has been
-                   inserted into cache */
-                *current_data = get_cached_data(XBZRLE.cache, current_addr);
-            }
+        if (!last_stage &&
+            !cache_insert(XBZRLE.cache, current_addr, *current_data,
+                          ram_counters.dirty_sync_count)) {
+            /*
+             * update *current_data when the page has been inserted into
+             * cache
+             */
+            *current_data = get_cached_data(XBZRLE.cache, current_addr);
         }
         return -1;
     }
-- 
2.19.1


