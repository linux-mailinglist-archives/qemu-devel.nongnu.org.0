Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4869D25922B
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Sep 2020 17:05:18 +0200 (CEST)
Received: from localhost ([::1]:44770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kD7qX-0001z6-AM
	for lists+qemu-devel@lfdr.de; Tue, 01 Sep 2020 11:05:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kD7Nq-0000qt-Ct
 for qemu-devel@nongnu.org; Tue, 01 Sep 2020 10:35:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:48353)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kD7Nn-0007Jy-MV
 for qemu-devel@nongnu.org; Tue, 01 Sep 2020 10:35:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598970933;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9I6tpuJ8ZhqsLyNU2alfFpqGhDvU0NAilcsrF7AUCDI=;
 b=Ybw83p+oNVMtLTDaO9Tf03SWSWlKeh1YDSoiXFzkzqlpVOdDoA0wzoKnUa+giCc2gJxfFH
 EqjccJBXTP77m+QKqXkpxCjO1jGBi79NvdEY5bGV22opD+zTf52ghzIfgBYT110EXXOwaL
 2UDls5V9+W6zmnL87F6G7faSNnqXhfg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-450-XH7KOYl1P4Sn9nmZhy_xAg-1; Tue, 01 Sep 2020 10:35:31 -0400
X-MC-Unique: XH7KOYl1P4Sn9nmZhy_xAg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9559B8015A8;
 Tue,  1 Sep 2020 14:35:30 +0000 (UTC)
Received: from localhost (ovpn-113-83.ams2.redhat.com [10.36.113.83])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2743B7DA43;
 Tue,  1 Sep 2020 14:35:29 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v8 27/43] block: Use child access functions for QAPI queries
Date: Tue,  1 Sep 2020 16:34:08 +0200
Message-Id: <20200901143424.884735-28-mreitz@redhat.com>
In-Reply-To: <20200901143424.884735-1-mreitz@redhat.com>
References: <20200901143424.884735-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/31 23:17:53
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

query-block, query-named-block-nodes, and query-blockstats now return
any filtered child under "backing", not just bs->backing or COW
children.  This is so that filters do not interrupt the reported backing
chain.  This changes the output for iotest 184, as the throttled node
now appears as a backing child.

Signed-off-by: Max Reitz <mreitz@redhat.com>
Reviewed-by: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
---
 block/qapi.c               | 33 ++++++++++++++++++++-------------
 tests/qemu-iotests/184.out |  8 +++++++-
 2 files changed, 27 insertions(+), 14 deletions(-)

diff --git a/block/qapi.c b/block/qapi.c
index c57b42d86d..2628323b63 100644
--- a/block/qapi.c
+++ b/block/qapi.c
@@ -163,9 +163,13 @@ BlockDeviceInfo *bdrv_block_device_info(BlockBackend *blk,
             break;
         }
 
-        if (bs0->drv && bs0->backing) {
+        if (bs0->drv && bdrv_filter_or_cow_child(bs0)) {
+            /*
+             * Put any filtered child here (for backwards compatibility to when
+             * we put bs0->backing here, which might be any filtered child).
+             */
             info->backing_file_depth++;
-            bs0 = bs0->backing->bs;
+            bs0 = bdrv_filter_or_cow_bs(bs0);
             (*p_image_info)->has_backing_image = true;
             p_image_info = &((*p_image_info)->backing_image);
         } else {
@@ -174,9 +178,8 @@ BlockDeviceInfo *bdrv_block_device_info(BlockBackend *blk,
 
         /* Skip automatically inserted nodes that the user isn't aware of for
          * query-block (blk != NULL), but not for query-named-block-nodes */
-        while (blk && bs0->drv && bs0->implicit) {
-            bs0 = backing_bs(bs0);
-            assert(bs0);
+        if (blk) {
+            bs0 = bdrv_skip_implicit_filters(bs0);
         }
     }
 
@@ -362,9 +365,7 @@ static void bdrv_query_info(BlockBackend *blk, BlockInfo **p_info,
     char *qdev;
 
     /* Skip automatically inserted nodes that the user isn't aware of */
-    while (bs && bs->drv && bs->implicit) {
-        bs = backing_bs(bs);
-    }
+    bs = bdrv_skip_implicit_filters(bs);
 
     info->device = g_strdup(blk_name(blk));
     info->type = g_strdup("unknown");
@@ -527,6 +528,7 @@ static BlockStats *bdrv_query_bds_stats(BlockDriverState *bs,
                                         bool blk_level)
 {
     BdrvChild *parent_child;
+    BlockDriverState *filter_or_cow_bs;
     BlockStats *s = NULL;
 
     s = g_malloc0(sizeof(*s));
@@ -539,9 +541,8 @@ static BlockStats *bdrv_query_bds_stats(BlockDriverState *bs,
     /* Skip automatically inserted nodes that the user isn't aware of in
      * a BlockBackend-level command. Stay at the exact node for a node-level
      * command. */
-    while (blk_level && bs->drv && bs->implicit) {
-        bs = backing_bs(bs);
-        assert(bs);
+    if (blk_level) {
+        bs = bdrv_skip_implicit_filters(bs);
     }
 
     if (bdrv_get_node_name(bs)[0]) {
@@ -587,9 +588,15 @@ static BlockStats *bdrv_query_bds_stats(BlockDriverState *bs,
         s->parent = bdrv_query_bds_stats(parent_child->bs, blk_level);
     }
 
-    if (blk_level && bs->backing) {
+    filter_or_cow_bs = bdrv_filter_or_cow_bs(bs);
+    if (blk_level && filter_or_cow_bs) {
+        /*
+         * Put any filtered or COW child here (for backwards
+         * compatibility to when we put bs0->backing here, which might
+         * be either)
+         */
         s->has_backing = true;
-        s->backing = bdrv_query_bds_stats(bs->backing->bs, blk_level);
+        s->backing = bdrv_query_bds_stats(filter_or_cow_bs, blk_level);
     }
 
     return s;
diff --git a/tests/qemu-iotests/184.out b/tests/qemu-iotests/184.out
index dec4017ad5..87c73070e3 100644
--- a/tests/qemu-iotests/184.out
+++ b/tests/qemu-iotests/184.out
@@ -27,6 +27,12 @@ Testing:
             "iops_rd": 0,
             "detect_zeroes": "off",
             "image": {
+                "backing-image": {
+                    "virtual-size": 1073741824,
+                    "filename": "null-co://",
+                    "format": "null-co",
+                    "actual-size": 0
+                },
                 "virtual-size": 1073741824,
                 "filename": "json:{\"throttle-group\": \"group0\", \"driver\": \"throttle\", \"file\": {\"driver\": \"null-co\"}}",
                 "format": "throttle",
@@ -35,7 +41,7 @@ Testing:
             "iops_wr": 0,
             "ro": false,
             "node-name": "throttle0",
-            "backing_file_depth": 0,
+            "backing_file_depth": 1,
             "drv": "throttle",
             "iops": 0,
             "bps_wr": 0,
-- 
2.26.2


