Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2EC43694D
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jun 2019 03:35:15 +0200 (CEST)
Received: from localhost ([127.0.0.1]:52642 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hYhJC-0007hk-T9
	for lists+qemu-devel@lfdr.de; Wed, 05 Jun 2019 21:35:14 -0400
Received: from eggs.gnu.org ([209.51.188.92]:40307)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richardw.yang@linux.intel.com>) id 1hYhGK-0006Dm-Fr
	for qemu-devel@nongnu.org; Wed, 05 Jun 2019 21:32:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richardw.yang@linux.intel.com>) id 1hYhGJ-0001kv-1Y
	for qemu-devel@nongnu.org; Wed, 05 Jun 2019 21:32:16 -0400
Received: from mga14.intel.com ([192.55.52.115]:32558)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <richardw.yang@linux.intel.com>)
	id 1hYhGI-0001j2-Pu
	for qemu-devel@nongnu.org; Wed, 05 Jun 2019 21:32:14 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	05 Jun 2019 18:32:11 -0700
X-ExtLoop1: 1
Received: from richard.sh.intel.com (HELO localhost) ([10.239.159.54])
	by FMSMGA003.fm.intel.com with ESMTP; 05 Jun 2019 18:32:10 -0700
From: Wei Yang <richardw.yang@linux.intel.com>
To: qemu-devel@nongnu.org
Date: Thu,  6 Jun 2019 09:31:37 +0800
Message-Id: <20190606013138.13312-2-richardw.yang@linux.intel.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190606013138.13312-1-richardw.yang@linux.intel.com>
References: <20190606013138.13312-1-richardw.yang@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 192.55.52.115
Subject: [Qemu-devel] [PATCH 1/2] migration/xbzrle: update cache and
 current_data in one place
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

When we are not in the last_stage, we need to update the cache if page
is not the same.

Currently this procedure is scattered in two places and mixed with
encoding status check.

This patch extract this general step out to make the code a little bit
easy to read.

Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
---
 migration/ram.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index e9b40d636d..878cd8de7a 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -1594,25 +1594,24 @@ static int save_xbzrle_page(RAMState *rs, uint8_t **current_data,
     encoded_len = xbzrle_encode_buffer(prev_cached_page, XBZRLE.current_buf,
                                        TARGET_PAGE_SIZE, XBZRLE.encoded_buf,
                                        TARGET_PAGE_SIZE);
+
+    /*
+     * we need to update the data in the cache, in order to get the same data
+     */
+    if (!last_stage && encoded_len != 0) {
+        memcpy(prev_cached_page, XBZRLE.current_buf, TARGET_PAGE_SIZE);
+        *current_data = prev_cached_page;
+    }
+
     if (encoded_len == 0) {
         trace_save_xbzrle_page_skipping();
         return 0;
     } else if (encoded_len == -1) {
         trace_save_xbzrle_page_overflow();
         xbzrle_counters.overflow++;
-        /* update data in the cache */
-        if (!last_stage) {
-            memcpy(prev_cached_page, *current_data, TARGET_PAGE_SIZE);
-            *current_data = prev_cached_page;
-        }
         return -1;
     }
 
-    /* we need to update the data in the cache, in order to get the same data */
-    if (!last_stage) {
-        memcpy(prev_cached_page, XBZRLE.current_buf, TARGET_PAGE_SIZE);
-    }
-
     /* Send XBZRLE based compressed page */
     bytes_xbzrle = save_page_header(rs, rs->f, block,
                                     offset | RAM_SAVE_FLAG_XBZRLE);
-- 
2.19.1


