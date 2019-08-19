Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 531F291CFF
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Aug 2019 08:22:30 +0200 (CEST)
Received: from localhost ([::1]:45258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hzb3l-00051Q-By
	for lists+qemu-devel@lfdr.de; Mon, 19 Aug 2019 02:22:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51782)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richardw.yang@linux.intel.com>) id 1hzb12-0002FC-DP
 for qemu-devel@nongnu.org; Mon, 19 Aug 2019 02:19:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richardw.yang@linux.intel.com>) id 1hzb11-0003GA-Ct
 for qemu-devel@nongnu.org; Mon, 19 Aug 2019 02:19:40 -0400
Received: from mga11.intel.com ([192.55.52.93]:9382)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <richardw.yang@linux.intel.com>)
 id 1hzb11-0003CJ-5W
 for qemu-devel@nongnu.org; Mon, 19 Aug 2019 02:19:39 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 Aug 2019 23:19:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,403,1559545200"; d="scan'208";a="180265824"
Received: from richard.sh.intel.com (HELO localhost) ([10.239.159.54])
 by orsmga003.jf.intel.com with ESMTP; 18 Aug 2019 23:19:37 -0700
From: Wei Yang <richardw.yang@linux.intel.com>
To: qemu-devel@nongnu.org
Date: Mon, 19 Aug 2019 14:18:43 +0800
Message-Id: <20190819061843.28642-4-richardw.yang@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190819061843.28642-1-richardw.yang@linux.intel.com>
References: <20190819061843.28642-1-richardw.yang@linux.intel.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 192.55.52.93
Subject: [Qemu-devel] [PATCH 3/3] migration: remove sent parameter in
 get_queued_page_not_dirty
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
Cc: pbonzini@redhat.com, Wei Yang <richardw.yang@linux.intel.com>,
 dgilbert@redhat.com, quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a cleanup for previous removal of unsentmap.

The sent parameter is not necessary now.

Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
---
 migration/ram.c        | 2 +-
 migration/trace-events | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index 066eb4755f..a6d3d09ebd 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -2348,7 +2348,7 @@ static bool get_queued_page(RAMState *rs, PageSearchStatus *pss)
             dirty = test_bit(page, block->bmap);
             if (!dirty) {
                 trace_get_queued_page_not_dirty(block->idstr, (uint64_t)offset,
-                       page, test_bit(page, block->bmap));
+                                                page);
             } else {
                 trace_get_queued_page(block->idstr, (uint64_t)offset, page);
             }
diff --git a/migration/trace-events b/migration/trace-events
index 00ffcd5930..858d415d56 100644
--- a/migration/trace-events
+++ b/migration/trace-events
@@ -76,7 +76,7 @@ qemu_file_fclose(void) ""
 
 # ram.c
 get_queued_page(const char *block_name, uint64_t tmp_offset, unsigned long page_abs) "%s/0x%" PRIx64 " page_abs=0x%lx"
-get_queued_page_not_dirty(const char *block_name, uint64_t tmp_offset, unsigned long page_abs, int sent) "%s/0x%" PRIx64 " page_abs=0x%lx (sent=%d)"
+get_queued_page_not_dirty(const char *block_name, uint64_t tmp_offset, unsigned long page_abs) "%s/0x%" PRIx64 " page_abs=0x%lx"
 migration_bitmap_sync_start(void) ""
 migration_bitmap_sync_end(uint64_t dirty_pages) "dirty_pages %" PRIu64
 migration_bitmap_clear_dirty(char *str, uint64_t start, uint64_t size, unsigned long page) "rb %s start 0x%"PRIx64" size 0x%"PRIx64" page 0x%lx"
-- 
2.17.1


