Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2C43583E57
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jul 2022 14:09:33 +0200 (CEST)
Received: from localhost ([::1]:33300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oH2Ka-0003rH-O8
	for lists+qemu-devel@lfdr.de; Thu, 28 Jul 2022 08:09:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1oH2Bf-0001bg-PN
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 08:00:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:29103)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1oH2BZ-0001vo-3M
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 08:00:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659009612;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZlPntIRJj9BXF9pQct0SK0auD/ClxUCDfmxA47cebgo=;
 b=hMEnW7OK506phxxb99M2TwYWVkJiPZx1huAoJW739fk3S+uBC/RKdJvIWhNR2kMKmXYWPA
 M85X15bnHLLRaL+0kAW1ouHNifFhaiaYIx3gq2ptvh3YY6/C7le981BemHGFthefnHV6iA
 75WdM7ly0HO0mi3HRy85YGCZzVKKpKA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-551-jNkz-ik-PymEg-LUZcWOwg-1; Thu, 28 Jul 2022 08:00:09 -0400
X-MC-Unique: jNkz-ik-PymEg-LUZcWOwg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A34B4811E75;
 Thu, 28 Jul 2022 12:00:08 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.192.136])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 459EC18EB5;
 Thu, 28 Jul 2022 12:00:07 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Yanan Wang <wangyanan55@huawei.com>
Subject: [PATCH v2 4/6] migration: Make find_dirty_block() return a single
 parameter
Date: Thu, 28 Jul 2022 13:59:55 +0200
Message-Id: <20220728115957.5554-5-quintela@redhat.com>
In-Reply-To: <20220728115957.5554-1-quintela@redhat.com>
References: <20220728115957.5554-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We used to return two bools, just return a single int with the
following meaning:

old return / again / new return
false        false   PAGE_ALL_CLEAN
false        true    PAGE_TRY_AGAIN
true         true    PAGE_DIRTY_FOUND  /* We don't care about again at all */

Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/ram.c | 37 ++++++++++++++++++++++---------------
 1 file changed, 22 insertions(+), 15 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index c2c939ee03..1507ba1991 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -1532,17 +1532,23 @@ retry:
     return pages;
 }
 
+#define PAGE_ALL_CLEAN 0
+#define PAGE_TRY_AGAIN 1
+#define PAGE_DIRTY_FOUND 2
 /**
  * find_dirty_block: find the next dirty page and update any state
  * associated with the search process.
  *
- * Returns true if a page is found
+ * Returns:
+ *         PAGE_ALL_CLEAN: no dirty page found, give up
+ *         PAGE_TRY_AGAIN: no dirty page found, retry for next block
+ *         PAGE_DIRTY_FOUND: dirty page found
  *
  * @rs: current RAM state
  * @pss: data about the state of the current dirty page scan
  * @again: set to false if the search has scanned the whole of RAM
  */
-static bool find_dirty_block(RAMState *rs, PageSearchStatus *pss, bool *again)
+static int find_dirty_block(RAMState *rs, PageSearchStatus *pss)
 {
     /*
      * This is not a postcopy requested page, mark it "not urgent", and use
@@ -1558,8 +1564,7 @@ static bool find_dirty_block(RAMState *rs, PageSearchStatus *pss, bool *again)
          * We've been once around the RAM and haven't found anything.
          * Give up.
          */
-        *again = false;
-        return false;
+        return PAGE_ALL_CLEAN;
     }
     if (!offset_in_ramblock(pss->block,
                             ((ram_addr_t)pss->page) << TARGET_PAGE_BITS)) {
@@ -1588,13 +1593,10 @@ static bool find_dirty_block(RAMState *rs, PageSearchStatus *pss, bool *again)
             }
         }
         /* Didn't find anything this time, but try again on the new block */
-        *again = true;
-        return false;
+        return PAGE_TRY_AGAIN;
     } else {
-        /* Can go around again, but... */
-        *again = true;
-        /* We've found something so probably don't need to */
-        return true;
+        /* We've found something */
+        return PAGE_DIRTY_FOUND;
     }
 }
 
@@ -2538,7 +2540,7 @@ static int ram_find_and_save_block(RAMState *rs)
         pss.block = QLIST_FIRST_RCU(&ram_list.blocks);
     }
 
-    do {
+    while (true){
         if (!get_queued_page(rs, &pss)) {
             /*
              * Recover previous precopy ramblock/offset if postcopy has
@@ -2548,16 +2550,21 @@ static int ram_find_and_save_block(RAMState *rs)
                 postcopy_preempt_restore(rs, &pss, false);
             } else {
                 /* priority queue empty, so just search for something dirty */
-                bool again = true;
-                if (!find_dirty_block(rs, &pss, &again)) {
-                    if (!again) {
+                int res = find_dirty_block(rs, &pss);
+                if (res != PAGE_DIRTY_FOUND) {
+                    if (res == PAGE_ALL_CLEAN) {
                         break;
+                    } else if (res == PAGE_TRY_AGAIN) {
+                        continue;
                     }
                 }
             }
         }
         pages = ram_save_host_page(rs, &pss);
-    } while (!pages);
+        if (pages) {
+            break;
+        }
+    }
 
     rs->last_seen_block = pss.block;
     rs->last_page = pss.page;
-- 
2.37.1


