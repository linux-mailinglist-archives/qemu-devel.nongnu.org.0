Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10B8E36F977
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 13:39:50 +0200 (CEST)
Received: from localhost ([::1]:50320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcRUr-0002cP-4J
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 07:39:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lcQly-0005Dl-Uh
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 06:53:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43858)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lcQlp-0002xL-GZ
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 06:53:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619779996;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5nzzCpE86slvO2dMIOS5Z+9DVmIuJPgswUd5kRnIisY=;
 b=cMpacyOTpNWvoQyq8gai95hsDGggNm9IDDr32HjMnEfOrmXzJEagdKfO9FKmWWv4HaGVyK
 UkoYsRDyyKaxlr5P22VtTd8n+juXz97+8hssKYUQMos12nIbT+D7wqPOSRB6tLmjEgsyBn
 k/ObsxZUMYrSYCpvoJG6CuL14pBkZlM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-526-p0X9TVEvNomVsJZxwmyTuA-1; Fri, 30 Apr 2021 06:53:12 -0400
X-MC-Unique: p0X9TVEvNomVsJZxwmyTuA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DFAAD100AA32;
 Fri, 30 Apr 2021 10:53:10 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-197.ams2.redhat.com [10.36.114.197])
 by smtp.corp.redhat.com (Postfix) with ESMTP id ED3A567881;
 Fri, 30 Apr 2021 10:53:09 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 25/39] block: drop ignore_children for permission update
 functions
Date: Fri, 30 Apr 2021 12:51:33 +0200
Message-Id: <20210430105147.125840-26-kwolf@redhat.com>
In-Reply-To: <20210430105147.125840-1-kwolf@redhat.com>
References: <20210430105147.125840-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

This argument is always NULL. Drop it.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Message-Id: <20210428151804.439460-26-vsementsov@virtuozzo.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block.c | 38 +++++++++++---------------------------
 1 file changed, 11 insertions(+), 27 deletions(-)

diff --git a/block.c b/block.c
index 68dfd822dd..46af5852ab 100644
--- a/block.c
+++ b/block.c
@@ -1988,7 +1988,6 @@ static int bdrv_fill_options(QDict **options, const char *filename,
 static int bdrv_check_update_perm(BlockDriverState *bs, BlockReopenQueue *q,
                                   uint64_t new_used_perm,
                                   uint64_t new_shared_perm,
-                                  GSList *ignore_children,
                                   Error **errp);
 
 typedef struct BlockReopenQueueEntry {
@@ -2065,9 +2064,7 @@ static bool bdrv_a_allow_b(BdrvChild *a, BdrvChild *b, Error **errp)
     return false;
 }
 
-static bool bdrv_parent_perms_conflict(BlockDriverState *bs,
-                                       GSList *ignore_children,
-                                       Error **errp)
+static bool bdrv_parent_perms_conflict(BlockDriverState *bs, Error **errp)
 {
     BdrvChild *a, *b;
 
@@ -2077,12 +2074,8 @@ static bool bdrv_parent_perms_conflict(BlockDriverState *bs,
      * directions.
      */
     QLIST_FOREACH(a, &bs->parents, next_parent) {
-        if (g_slist_find(ignore_children, a)) {
-            continue;
-        }
-
         QLIST_FOREACH(b, &bs->parents, next_parent) {
-            if (a == b || g_slist_find(ignore_children, b)) {
+            if (a == b) {
                 continue;
             }
 
@@ -2310,7 +2303,6 @@ static void bdrv_replace_child_safe(BdrvChild *child, BlockDriverState *new_bs,
 static int bdrv_node_check_perm(BlockDriverState *bs, BlockReopenQueue *q,
                                 uint64_t cumulative_perms,
                                 uint64_t cumulative_shared_perms,
-                                GSList *ignore_children,
                                 Transaction *tran, Error **errp)
 {
     BlockDriver *drv = bs->drv;
@@ -2393,7 +2385,6 @@ static int bdrv_check_perm_common(GSList *list, BlockReopenQueue *q,
                                   bool use_cumulative_perms,
                                   uint64_t cumulative_perms,
                                   uint64_t cumulative_shared_perms,
-                                  GSList *ignore_children,
                                   Transaction *tran, Error **errp)
 {
     int ret;
@@ -2404,7 +2395,7 @@ static int bdrv_check_perm_common(GSList *list, BlockReopenQueue *q,
 
         ret = bdrv_node_check_perm(bs, q, cumulative_perms,
                                    cumulative_shared_perms,
-                                   ignore_children, tran, errp);
+                                   tran, errp);
         if (ret < 0) {
             return ret;
         }
@@ -2415,7 +2406,7 @@ static int bdrv_check_perm_common(GSList *list, BlockReopenQueue *q,
     for ( ; list; list = list->next) {
         bs = list->data;
 
-        if (bdrv_parent_perms_conflict(bs, ignore_children, errp)) {
+        if (bdrv_parent_perms_conflict(bs, errp)) {
             return -EINVAL;
         }
 
@@ -2424,7 +2415,7 @@ static int bdrv_check_perm_common(GSList *list, BlockReopenQueue *q,
 
         ret = bdrv_node_check_perm(bs, q, cumulative_perms,
                                    cumulative_shared_perms,
-                                   ignore_children, tran, errp);
+                                   tran, errp);
         if (ret < 0) {
             return ret;
         }
@@ -2435,19 +2426,17 @@ static int bdrv_check_perm_common(GSList *list, BlockReopenQueue *q,
 
 static int bdrv_check_perm(BlockDriverState *bs, BlockReopenQueue *q,
                            uint64_t cumulative_perms,
-                           uint64_t cumulative_shared_perms,
-                           GSList *ignore_children, Error **errp)
+                           uint64_t cumulative_shared_perms, Error **errp)
 {
     g_autoptr(GSList) list = bdrv_topological_dfs(NULL, NULL, bs);
     return bdrv_check_perm_common(list, q, true, cumulative_perms,
-                                  cumulative_shared_perms, ignore_children,
-                                  NULL, errp);
+                                  cumulative_shared_perms, NULL, errp);
 }
 
 static int bdrv_list_refresh_perms(GSList *list, BlockReopenQueue *q,
                                    Transaction *tran, Error **errp)
 {
-    return bdrv_check_perm_common(list, q, false, 0, 0, NULL, tran, errp);
+    return bdrv_check_perm_common(list, q, false, 0, 0, tran, errp);
 }
 
 /*
@@ -2576,7 +2565,6 @@ char *bdrv_perm_names(uint64_t perm)
 static int bdrv_check_update_perm(BlockDriverState *bs, BlockReopenQueue *q,
                                   uint64_t new_used_perm,
                                   uint64_t new_shared_perm,
-                                  GSList *ignore_children,
                                   Error **errp)
 {
     BdrvChild *c;
@@ -2588,10 +2576,6 @@ static int bdrv_check_update_perm(BlockDriverState *bs, BlockReopenQueue *q,
     assert(new_shared_perm & BLK_PERM_WRITE_UNCHANGED);
 
     QLIST_FOREACH(c, &bs->parents, next_parent) {
-        if (g_slist_find(ignore_children, c)) {
-            continue;
-        }
-
         if ((new_used_perm & c->shared_perm) != new_used_perm) {
             char *user = bdrv_child_user_desc(c);
             char *perm_names = bdrv_perm_names(new_used_perm & ~c->shared_perm);
@@ -2621,7 +2605,7 @@ static int bdrv_check_update_perm(BlockDriverState *bs, BlockReopenQueue *q,
     }
 
     return bdrv_check_perm(bs, q, cumulative_perms, cumulative_shared_perms,
-                           ignore_children, errp);
+                           errp);
 }
 
 static int bdrv_refresh_perms(BlockDriverState *bs, Error **errp)
@@ -4244,7 +4228,7 @@ int bdrv_reopen_multiple(BlockReopenQueue *bs_queue, Error **errp)
     QTAILQ_FOREACH(bs_entry, bs_queue, entry) {
         BDRVReopenState *state = &bs_entry->state;
         ret = bdrv_check_perm(state->bs, bs_queue, state->perm,
-                              state->shared_perm, NULL, errp);
+                              state->shared_perm, errp);
         if (ret < 0) {
             goto cleanup_perm;
         }
@@ -4256,7 +4240,7 @@ int bdrv_reopen_multiple(BlockReopenQueue *bs_queue, Error **errp)
                             bs_queue, state->perm, state->shared_perm,
                             &nperm, &nshared);
             ret = bdrv_check_update_perm(state->new_backing_bs, NULL,
-                                         nperm, nshared, NULL, errp);
+                                         nperm, nshared, errp);
             if (ret < 0) {
                 goto cleanup_perm;
             }
-- 
2.30.2


