Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1215F55344E
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jun 2022 16:15:57 +0200 (CEST)
Received: from localhost ([::1]:34494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3efc-00046r-5X
	for lists+qemu-devel@lfdr.de; Tue, 21 Jun 2022 10:15:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1o3eVd-0003AK-AL
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 10:05:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42063)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1o3eVb-00007n-My
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 10:05:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655820335;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=J/MUBigceGvRp2LjYKVzNQe71uwZfeB9qhBxJavgDwQ=;
 b=Qfza+HMlojvBSjCOmYhDJuvTbncm/S63OLnJ7Iwh4oEdPInipUSzlkdEOZjYA/JV/ySTW0
 DmHqhxW8CLvJExfILMnigdYQEkAGkQVwXCNpLFiP5k+CmQpEmpjtNtdFXXFtz3wd1uE7+a
 XIt4bWUOq2g3KxnrKPOoWwygHjR6Iqs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-159-V-YPGMMUP2OOav77oRoI7g-1; Tue, 21 Jun 2022 10:05:29 -0400
X-MC-Unique: V-YPGMMUP2OOav77oRoI7g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3950D80B70A;
 Tue, 21 Jun 2022 14:05:29 +0000 (UTC)
Received: from secure.laptop (unknown [10.39.192.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AD5222166B29;
 Tue, 21 Jun 2022 14:05:26 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Juan Quintela <quintela@redhat.com>, Leonardo Bras <leobras@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Yanan Wang <wangyanan55@huawei.com>
Subject: [PATCH 4/5] migration: Make find_dirty_block() return a single
 parameter
Date: Tue, 21 Jun 2022 16:05:06 +0200
Message-Id: <20220621140507.1246-5-quintela@redhat.com>
In-Reply-To: <20220621140507.1246-1-quintela@redhat.com>
References: <20220621140507.1246-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
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
false        false   0
false        true    1
true         true    2  /* We don't care about again at all */

Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/ram.c | 37 +++++++++++++++++++------------------
 1 file changed, 19 insertions(+), 18 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index 1d4ff3185b..2c7289edad 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -1481,13 +1481,16 @@ retry:
  * find_dirty_block: find the next dirty page and update any state
  * associated with the search process.
  *
- * Returns true if a page is found
+ * Returns:
+ *         0: no page found, give up
+ *         1: no page found, retry
+ *         2: page found
  *
  * @rs: current RAM state
  * @pss: data about the state of the current dirty page scan
  * @again: set to false if the search has scanned the whole of RAM
  */
-static bool find_dirty_block(RAMState *rs, PageSearchStatus *pss, bool *again)
+static int find_dirty_block(RAMState *rs, PageSearchStatus *pss)
 {
     /* This is not a postcopy requested page */
     pss->postcopy_requested = false;
@@ -1499,8 +1502,7 @@ static bool find_dirty_block(RAMState *rs, PageSearchStatus *pss, bool *again)
          * We've been once around the RAM and haven't found anything.
          * Give up.
          */
-        *again = false;
-        return false;
+        return 0;
     }
     if (!offset_in_ramblock(pss->block,
                             ((ram_addr_t)pss->page) << TARGET_PAGE_BITS)) {
@@ -1529,13 +1531,10 @@ static bool find_dirty_block(RAMState *rs, PageSearchStatus *pss, bool *again)
             }
         }
         /* Didn't find anything this time, but try again on the new block */
-        *again = true;
-        return false;
+        return 1;
     } else {
-        /* Can go around again, but... */
-        *again = true;
-        /* We've found something so probably don't need to */
-        return true;
+        /* We've found something */
+        return 2;
     }
 }
 
@@ -2270,18 +2269,20 @@ static int ram_find_and_save_block(RAMState *rs)
         pss.block = QLIST_FIRST_RCU(&ram_list.blocks);
     }
 
-    do {
+    while (true){
         if (!get_queued_page(rs, &pss)) {
             /* priority queue empty, so just search for something dirty */
-            bool again = true;
-            if (!find_dirty_block(rs, &pss, &again)) {
-                if (!again) {
-                    break;
-                }
-            }
+            int res = find_dirty_block(rs, &pss);
+            if (res == 0) {
+                break;
+            } else if (res == 1)
+                continue;
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
2.34.1


