Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DFE92DE65D
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 16:18:42 +0100 (CET)
Received: from localhost ([::1]:50246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqHWj-000785-Fb
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 10:18:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kqHRJ-0001Q4-0m
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 10:13:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20031)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kqHRG-0005F3-2n
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 10:13:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608304381;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FBKK5/o64NiNGzP+zRBp/vpj/NUN1zZjDdXc3aUXuU8=;
 b=X6M4/ZponxH4iDv5hsYjzKYFG4Pz9eQb6lirwU8rMKAWLafvAu89fsMjmeWBgxlz9wgnS1
 OybFfZ8Wr27SVd+mhLNQP9x24Vvvos7OKOjpeJBs5PvWWNUEGUBALW1Fi9BANcZ5/nqgaT
 n7Qgpufm4tvY+4/VJxX5D/K+RqqLmP4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-279-AKhHFtOVMxW2KhKquq8ouA-1; Fri, 18 Dec 2020 10:12:59 -0500
X-MC-Unique: AKhHFtOVMxW2KhKquq8ouA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D81AB8030A2;
 Fri, 18 Dec 2020 15:12:57 +0000 (UTC)
Received: from localhost (ovpn-114-84.ams2.redhat.com [10.36.114.84])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7A63A60C5F;
 Fri, 18 Dec 2020 15:12:57 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 03/30] block: bdrv_child_set_perm() drop redundant parameters.
Date: Fri, 18 Dec 2020 16:12:22 +0100
Message-Id: <20201218151249.715731-4-mreitz@redhat.com>
In-Reply-To: <20201218151249.715731-1-mreitz@redhat.com>
References: <20201218151249.715731-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

We must set the permission used for _check_.  Assert that we have
backup and drop extra arguments.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-Id: <20201106124241.16950-7-vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 block.c | 15 ++++-----------
 1 file changed, 4 insertions(+), 11 deletions(-)

diff --git a/block.c b/block.c
index 66ab6caa7d..f66388b9ea 100644
--- a/block.c
+++ b/block.c
@@ -1903,7 +1903,7 @@ static int bdrv_child_check_perm(BdrvChild *c, BlockReopenQueue *q,
                                  GSList *ignore_children,
                                  bool *tighten_restrictions, Error **errp);
 static void bdrv_child_abort_perm_update(BdrvChild *c);
-static void bdrv_child_set_perm(BdrvChild *c, uint64_t perm, uint64_t shared);
+static void bdrv_child_set_perm(BdrvChild *c);
 
 typedef struct BlockReopenQueueEntry {
      bool prepared;
@@ -2137,11 +2137,7 @@ static void bdrv_set_perm(BlockDriverState *bs)
 
     /* Update all children */
     QLIST_FOREACH(c, &bs->children, next) {
-        uint64_t cur_perm, cur_shared;
-        bdrv_child_perm(bs, c->bs, c, c->role, NULL,
-                        cumulative_perms, cumulative_shared_perms,
-                        &cur_perm, &cur_shared);
-        bdrv_child_set_perm(c, cur_perm, cur_shared);
+        bdrv_child_set_perm(c);
     }
 }
 
@@ -2304,13 +2300,10 @@ static int bdrv_child_check_perm(BdrvChild *c, BlockReopenQueue *q,
     return 0;
 }
 
-static void bdrv_child_set_perm(BdrvChild *c, uint64_t perm, uint64_t shared)
+static void bdrv_child_set_perm(BdrvChild *c)
 {
     c->has_backup_perm = false;
 
-    c->perm = perm;
-    c->shared_perm = shared;
-
     bdrv_set_perm(c->bs);
 }
 
@@ -2369,7 +2362,7 @@ int bdrv_child_try_set_perm(BdrvChild *c, uint64_t perm, uint64_t shared,
         return ret;
     }
 
-    bdrv_child_set_perm(c, perm, shared);
+    bdrv_child_set_perm(c);
 
     return 0;
 }
-- 
2.29.2


