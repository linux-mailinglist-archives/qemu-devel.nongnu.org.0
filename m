Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F975157FC
	for <lists+qemu-devel@lfdr.de>; Tue,  7 May 2019 05:19:57 +0200 (CEST)
Received: from localhost ([127.0.0.1]:38935 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hNqe4-0003TF-AS
	for lists+qemu-devel@lfdr.de; Mon, 06 May 2019 23:19:56 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39447)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richardw.yang@linux.intel.com>) id 1hNqd3-0003AN-Gi
	for qemu-devel@nongnu.org; Mon, 06 May 2019 23:18:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richardw.yang@linux.intel.com>) id 1hNqd2-00078W-JS
	for qemu-devel@nongnu.org; Mon, 06 May 2019 23:18:53 -0400
Received: from mga17.intel.com ([192.55.52.151]:6048)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <richardw.yang@linux.intel.com>)
	id 1hNqd2-0005i8-Bb
	for qemu-devel@nongnu.org; Mon, 06 May 2019 23:18:52 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
	by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	06 May 2019 20:17:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,440,1549958400"; d="scan'208";a="142082249"
Received: from richard.sh.intel.com (HELO localhost) ([10.239.159.54])
	by orsmga006.jf.intel.com with ESMTP; 06 May 2019 20:17:44 -0700
From: Wei Yang <richardw.yang@linux.intel.com>
To: qemu-devel@nongnu.org
Date: Tue,  7 May 2019 11:17:03 +0800
Message-Id: <20190507031703.856-1-richardw.yang@linux.intel.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 192.55.52.151
Subject: [Qemu-devel] [PATCH] migratioin/ram: leave RAMBlock->bmap blank on
 allocating
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

During migration, we would sync bitmap from ram_list.dirty_memory to
RAMBlock.bmap in cpu_physical_memory_sync_dirty_bitmap().

Since we set RAMBlock.bmap and ram_list.dirty_memory both to all 1, this
means at the first round this sync is meaningless and is a duplicated
work.

Leaving RAMBlock->bmap blank on allocating would have a side effect on
migration_dirty_pages, since it is calculated from the result of
cpu_physical_memory_sync_dirty_bitmap(). To keep it right, we need to
set migration_dirty_pages to 0 in ram_state_init().

Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
---
 migration/ram.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index 95c51109d2..417874707d 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -3151,12 +3151,7 @@ static int ram_state_init(RAMState **rsp)
     qemu_mutex_init(&(*rsp)->src_page_req_mutex);
     QSIMPLEQ_INIT(&(*rsp)->src_page_requests);
 
-    /*
-     * Count the total number of pages used by ram blocks not including any
-     * gaps due to alignment or unplugs.
-     */
-    (*rsp)->migration_dirty_pages = ram_bytes_total() >> TARGET_PAGE_BITS;
-
+    (*rsp)->migration_dirty_pages = 0;
     ram_state_reset(*rsp);
 
     return 0;
@@ -3172,7 +3167,6 @@ static void ram_list_init_bitmaps(void)
         RAMBLOCK_FOREACH_NOT_IGNORED(block) {
             pages = block->max_length >> TARGET_PAGE_BITS;
             block->bmap = bitmap_new(pages);
-            bitmap_set(block->bmap, 0, pages);
             if (migrate_postcopy_ram()) {
                 block->unsentmap = bitmap_new(pages);
                 bitmap_set(block->unsentmap, 0, pages);
-- 
2.19.1


