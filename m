Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B941F2E4B
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Nov 2019 13:42:28 +0100 (CET)
Received: from localhost ([::1]:41644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iSh7K-00062a-Rs
	for lists+qemu-devel@lfdr.de; Thu, 07 Nov 2019 07:42:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58910)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richardw.yang@linux.intel.com>) id 1iSh4e-0003wb-Me
 for qemu-devel@nongnu.org; Thu, 07 Nov 2019 07:39:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richardw.yang@linux.intel.com>) id 1iSh4d-0002qa-Nb
 for qemu-devel@nongnu.org; Thu, 07 Nov 2019 07:39:40 -0500
Received: from mga06.intel.com ([134.134.136.31]:63430)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <richardw.yang@linux.intel.com>)
 id 1iSh4d-0002nd-Fw
 for qemu-devel@nongnu.org; Thu, 07 Nov 2019 07:39:39 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 07 Nov 2019 04:39:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,278,1569308400"; d="scan'208";a="377408585"
Received: from richard.sh.intel.com (HELO localhost) ([10.239.159.54])
 by orsmga005.jf.intel.com with ESMTP; 07 Nov 2019 04:39:35 -0800
From: Wei Yang <richardw.yang@linux.intel.com>
To: quintela@redhat.com,
	dgilbert@redhat.com
Subject: [Patch v2 1/6] migration/postcopy: reduce memset when it is zero page
 and matches_target_page_size
Date: Thu,  7 Nov 2019 20:39:02 +0800
Message-Id: <20191107123907.29791-2-richardw.yang@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191107123907.29791-1-richardw.yang@linux.intel.com>
References: <20191107123907.29791-1-richardw.yang@linux.intel.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 134.134.136.31
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
Cc: qemu-devel@nongnu.org, Wei Yang <richardw.yang@linux.intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In this case, page_buffer content would not be used.

Skip this to save some time.

Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 migration/ram.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/migration/ram.c b/migration/ram.c
index 99a98b2da4..7938a643d9 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -4091,7 +4091,13 @@ static int ram_load_postcopy(QEMUFile *f)
         switch (flags & ~RAM_SAVE_FLAG_CONTINUE) {
         case RAM_SAVE_FLAG_ZERO:
             ch = qemu_get_byte(f);
-            memset(page_buffer, ch, TARGET_PAGE_SIZE);
+            /*
+             * Can skip to set page_buffer when
+             * this is a zero page and (block->page_size == TARGET_PAGE_SIZE).
+             */
+            if (ch || !matches_target_page_size) {
+                memset(page_buffer, ch, TARGET_PAGE_SIZE);
+            }
             if (ch) {
                 all_zero = false;
             }
-- 
2.17.1


