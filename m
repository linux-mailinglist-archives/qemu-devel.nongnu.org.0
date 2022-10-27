Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E77C06101E0
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 21:40:47 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oo7gM-0001qN-C6; Thu, 27 Oct 2022 14:32:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oo7gE-0001Tb-Ft
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 14:32:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oo7g6-0002R9-FA
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 14:32:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666895549;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5kOsbvaV6j0SYAFPC0Xq47Pjz2VvQMB7agejxESRzPg=;
 b=YYAaAwcnmAx4OXkgSBkHwFyYoUmj+UMXmy/vQy9P+Sthv47ElXb8rtDouBvRE9zAV2ynyx
 4Czh8UC/giYKcZLNoIVVaCv6DaDVz8eU7kP4Zne/R7ExkHrs7kIE6NHMnPcGE4JXd9slMR
 6SKxbeq/7Wdn24oRZd+nD/zfjFFWSLk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-661-B4R8g_wAMzmLSbdfA5LakA-1; Thu, 27 Oct 2022 14:32:26 -0400
X-MC-Unique: B4R8g_wAMzmLSbdfA5LakA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DB919857D0D;
 Thu, 27 Oct 2022 18:32:25 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.194.12])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 27C411121320;
 Thu, 27 Oct 2022 18:32:25 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	stefanha@redhat.com,
	qemu-devel@nongnu.org
Subject: [PULL 15/58] block/snapshot: stress that we fallback to primary child
Date: Thu, 27 Oct 2022 20:31:03 +0200
Message-Id: <20221027183146.463129-16-kwolf@redhat.com>
In-Reply-To: <20221027183146.463129-1-kwolf@redhat.com>
References: <20221027183146.463129-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.515,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>

Actually what we chose is a primary child. Let's stress it in the code.

We are going to drop indirect pointer logic here in future. Actually
this commit simplifies the future work: we drop use of indirection in
the assertion now.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
Message-Id: <20220726201134.924743-9-vsementsov@yandex-team.ru>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block/snapshot.c | 30 ++++++++++--------------------
 1 file changed, 10 insertions(+), 20 deletions(-)

diff --git a/block/snapshot.c b/block/snapshot.c
index d6f53c3065..75e8d3a937 100644
--- a/block/snapshot.c
+++ b/block/snapshot.c
@@ -161,21 +161,14 @@ bool bdrv_snapshot_find_by_id_and_name(BlockDriverState *bs,
 static BdrvChild **bdrv_snapshot_fallback_ptr(BlockDriverState *bs)
 {
     BdrvChild **fallback;
-    BdrvChild *child;
+    BdrvChild *child = bdrv_primary_child(bs);
 
-    /*
-     * The only BdrvChild pointers that are safe to modify (and which
-     * we can thus return a reference to) are bs->file and
-     * bs->backing.
-     */
-    fallback = &bs->file;
-    if (!*fallback && bs->drv && bs->drv->is_filter) {
-        fallback = &bs->backing;
-    }
-
-    if (!*fallback) {
+    /* We allow fallback only to primary child */
+    if (!child) {
         return NULL;
     }
+    fallback = (child == bs->file ? &bs->file : &bs->backing);
+    assert(*fallback == child);
 
     /*
      * Check that there are no other children that would need to be
@@ -309,15 +302,12 @@ int bdrv_snapshot_goto(BlockDriverState *bs,
         }
 
         /*
-         * fallback_ptr is &bs->file or &bs->backing.  *fallback_ptr
-         * was closed above and set to NULL, but the .bdrv_open() call
-         * has opened it again, because we set the respective option
-         * (with the qdict_put_str() call above).
-         * Assert that .bdrv_open() has attached some child on
-         * *fallback_ptr, and that it has attached the one we wanted
-         * it to (i.e., fallback_bs).
+         * fallback was a primary child. It was closed above and set to NULL,
+         * but the .bdrv_open() call has opened it again, because we set the
+         * respective option (with the qdict_put_str() call above).
+         * Assert that .bdrv_open() has attached the right BDS as primary child.
          */
-        assert(*fallback_ptr && fallback_bs == (*fallback_ptr)->bs);
+        assert(bdrv_primary_bs(bs) == fallback_bs);
         bdrv_unref(fallback_bs);
         return ret;
     }
-- 
2.37.3


