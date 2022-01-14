Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F56448EB5A
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jan 2022 15:14:42 +0100 (CET)
Received: from localhost ([::1]:59110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8NLl-0007ZF-N3
	for lists+qemu-devel@lfdr.de; Fri, 14 Jan 2022 09:14:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1n8N0m-0003K9-JA
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 08:53:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:48492)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1n8N0k-0000Ow-PX
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 08:53:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642168377;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HCxiaL2NAHJjXkUXBL66Fb6bAUA/Ps7WjTBLifcbmvY=;
 b=BWIP+sQs11uJ4n56IUoq2WdYegyicz8oGASquk8CIDm2dWml3dAuQEMdDI2oZfzMzxCdAn
 AdYkhALLU0fcnxWLffryvZhH3b/S7UrdIat9YjQrd78fa93cgLSHPdIRODr8eGmgYGCST6
 //FvavsfwFv1Nq+nGivt9bJ1Ql9obEQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-401-2nKMrE7GPkaQmKh1dQqKvQ-1; Fri, 14 Jan 2022 08:52:51 -0500
X-MC-Unique: 2nKMrE7GPkaQmKh1dQqKvQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BC5A71853020;
 Fri, 14 Jan 2022 13:52:50 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.194.212])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B9F43105B20E;
 Fri, 14 Jan 2022 13:52:49 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 15/16] block: drop BLK_PERM_GRAPH_MOD
Date: Fri, 14 Jan 2022 14:52:25 +0100
Message-Id: <20220114135226.185407-16-kwolf@redhat.com>
In-Reply-To: <20220114135226.185407-1-kwolf@redhat.com>
References: <20220114135226.185407-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.595,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

First, this permission never protected a node from being changed, as
generic child-replacing functions don't check it.

Second, it's a strange thing: it presents a permission of parent node
to change its child. But generally, children are replaced by different
mechanisms, like jobs or qmp commands, not by nodes.

Graph-mod permission is hard to understand. All other permissions
describe operations which done by parent node on its child: read,
write, resize. Graph modification operations are something completely
different.

The only place where BLK_PERM_GRAPH_MOD is used as "perm" (not shared
perm) is mirror_start_job, for s->target. Still modern code should use
bdrv_freeze_backing_chain() to protect from graph modification, if we
don't do it somewhere it may be considered as a bug. So, it's a bit
risky to drop GRAPH_MOD, and analyzing of possible loss of protection
is hard. But one day we should do it, let's do it now.

One more bit of information is that locking the corresponding byte in
file-posix doesn't make sense at all.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-Id: <20210902093754.2352-1-vsementsov@virtuozzo.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 qapi/block-core.json          |  7 ++-----
 include/block/block.h         |  9 +++++----
 block.c                       |  7 +------
 block/commit.c                |  1 -
 block/mirror.c                | 15 +++------------
 hw/block/block.c              |  3 +--
 scripts/render_block_graph.py |  1 -
 tests/qemu-iotests/273.out    |  4 ----
 8 files changed, 12 insertions(+), 35 deletions(-)

diff --git a/qapi/block-core.json b/qapi/block-core.json
index bd0b285245..9a5a3641d0 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -1878,14 +1878,11 @@
 #
 # @resize: This permission is required to change the size of a block node.
 #
-# @graph-mod: This permission is required to change the node that this
-#             BdrvChild points to.
-#
 # Since: 4.0
 ##
 { 'enum': 'BlockPermission',
-  'data': [ 'consistent-read', 'write', 'write-unchanged', 'resize',
-            'graph-mod' ] }
+  'data': [ 'consistent-read', 'write', 'write-unchanged', 'resize' ] }
+
 ##
 # @XDbgBlockGraphEdge:
 #
diff --git a/include/block/block.h b/include/block/block.h
index e5dd22b034..9d4050220b 100644
--- a/include/block/block.h
+++ b/include/block/block.h
@@ -269,12 +269,13 @@ enum {
     BLK_PERM_RESIZE             = 0x08,
 
     /**
-     * This permission is required to change the node that this BdrvChild
-     * points to.
+     * There was a now-removed bit BLK_PERM_GRAPH_MOD, with value of 0x10. QEMU
+     * 6.1 and earlier may still lock the corresponding byte in block/file-posix
+     * locking.  So, implementing some new permission should be very careful to
+     * not interfere with this old unused thing.
      */
-    BLK_PERM_GRAPH_MOD          = 0x10,
 
-    BLK_PERM_ALL                = 0x1f,
+    BLK_PERM_ALL                = 0x0f,
 
     DEFAULT_PERM_PASSTHROUGH    = BLK_PERM_CONSISTENT_READ
                                  | BLK_PERM_WRITE
diff --git a/block.c b/block.c
index 10346b5011..7b3ce415d8 100644
--- a/block.c
+++ b/block.c
@@ -2485,7 +2485,6 @@ char *bdrv_perm_names(uint64_t perm)
         { BLK_PERM_WRITE,           "write" },
         { BLK_PERM_WRITE_UNCHANGED, "write unchanged" },
         { BLK_PERM_RESIZE,          "resize" },
-        { BLK_PERM_GRAPH_MOD,       "change children" },
         { 0, NULL }
     };
 
@@ -2601,8 +2600,7 @@ static void bdrv_default_perms_for_cow(BlockDriverState *bs, BdrvChild *c,
         shared = 0;
     }
 
-    shared |= BLK_PERM_CONSISTENT_READ | BLK_PERM_GRAPH_MOD |
-              BLK_PERM_WRITE_UNCHANGED;
+    shared |= BLK_PERM_CONSISTENT_READ | BLK_PERM_WRITE_UNCHANGED;
 
     if (bs->open_flags & BDRV_O_INACTIVE) {
         shared |= BLK_PERM_WRITE | BLK_PERM_RESIZE;
@@ -2720,7 +2718,6 @@ uint64_t bdrv_qapi_perm_to_blk_perm(BlockPermission qapi_perm)
         [BLOCK_PERMISSION_WRITE]            = BLK_PERM_WRITE,
         [BLOCK_PERMISSION_WRITE_UNCHANGED]  = BLK_PERM_WRITE_UNCHANGED,
         [BLOCK_PERMISSION_RESIZE]           = BLK_PERM_RESIZE,
-        [BLOCK_PERMISSION_GRAPH_MOD]        = BLK_PERM_GRAPH_MOD,
     };
 
     QEMU_BUILD_BUG_ON(ARRAY_SIZE(permissions) != BLOCK_PERMISSION__MAX);
@@ -5546,8 +5543,6 @@ int bdrv_drop_intermediate(BlockDriverState *top, BlockDriverState *base,
     update_inherits_from = bdrv_inherits_from_recursive(base, explicit_top);
 
     /* success - we can delete the intermediate states, and link top->base */
-    /* TODO Check graph modification op blockers (BLK_PERM_GRAPH_MOD) once
-     * we've figured out how they should work. */
     if (!backing_file_str) {
         bdrv_refresh_filename(base);
         backing_file_str = base->filename;
diff --git a/block/commit.c b/block/commit.c
index 10cc5ff451..b1fc7b908b 100644
--- a/block/commit.c
+++ b/block/commit.c
@@ -370,7 +370,6 @@ void commit_start(const char *job_id, BlockDriverState *bs,
     s->base = blk_new(s->common.job.aio_context,
                       base_perms,
                       BLK_PERM_CONSISTENT_READ
-                      | BLK_PERM_GRAPH_MOD
                       | BLK_PERM_WRITE_UNCHANGED);
     ret = blk_insert_bs(s->base, base, errp);
     if (ret < 0) {
diff --git a/block/mirror.c b/block/mirror.c
index 959e3dfbd6..69b2c1c697 100644
--- a/block/mirror.c
+++ b/block/mirror.c
@@ -1139,10 +1139,7 @@ static void mirror_complete(Job *job, Error **errp)
         replace_aio_context = bdrv_get_aio_context(s->to_replace);
         aio_context_acquire(replace_aio_context);
 
-        /* TODO Translate this into permission system. Current definition of
-         * GRAPH_MOD would require to request it for the parents; they might
-         * not even be BlockDriverStates, however, so a BdrvChild can't address
-         * them. May need redefinition of GRAPH_MOD. */
+        /* TODO Translate this into child freeze system. */
         error_setg(&s->replace_blocker,
                    "block device is in use by block-job-complete");
         bdrv_op_block_all(s->to_replace, s->replace_blocker);
@@ -1666,7 +1663,7 @@ static BlockJob *mirror_start_job(
     s = block_job_create(job_id, driver, NULL, mirror_top_bs,
                          BLK_PERM_CONSISTENT_READ,
                          BLK_PERM_CONSISTENT_READ | BLK_PERM_WRITE_UNCHANGED |
-                         BLK_PERM_WRITE | BLK_PERM_GRAPH_MOD, speed,
+                         BLK_PERM_WRITE, speed,
                          creation_flags, cb, opaque, errp);
     if (!s) {
         goto fail;
@@ -1710,9 +1707,7 @@ static BlockJob *mirror_start_job(
             target_perms |= BLK_PERM_RESIZE;
         }
 
-        target_shared_perms |= BLK_PERM_CONSISTENT_READ
-                            |  BLK_PERM_WRITE
-                            |  BLK_PERM_GRAPH_MOD;
+        target_shared_perms |= BLK_PERM_CONSISTENT_READ | BLK_PERM_WRITE;
     } else if (bdrv_chain_contains(bs, bdrv_skip_filters(target))) {
         /*
          * We may want to allow this in the future, but it would
@@ -1723,10 +1718,6 @@ static BlockJob *mirror_start_job(
         goto fail;
     }
 
-    if (backing_mode != MIRROR_LEAVE_BACKING_CHAIN) {
-        target_perms |= BLK_PERM_GRAPH_MOD;
-    }
-
     s->target = blk_new(s->common.job.aio_context,
                         target_perms, target_shared_perms);
     ret = blk_insert_bs(s->target, target, errp);
diff --git a/hw/block/block.c b/hw/block/block.c
index d47ebf005a..25f45df723 100644
--- a/hw/block/block.c
+++ b/hw/block/block.c
@@ -171,8 +171,7 @@ bool blkconf_apply_backend_options(BlockConf *conf, bool readonly,
         perm |= BLK_PERM_WRITE;
     }
 
-    shared_perm = BLK_PERM_CONSISTENT_READ | BLK_PERM_WRITE_UNCHANGED |
-                  BLK_PERM_GRAPH_MOD;
+    shared_perm = BLK_PERM_CONSISTENT_READ | BLK_PERM_WRITE_UNCHANGED;
     if (resizable) {
         shared_perm |= BLK_PERM_RESIZE;
     }
diff --git a/scripts/render_block_graph.py b/scripts/render_block_graph.py
index da6acf050d..42288a3cfb 100755
--- a/scripts/render_block_graph.py
+++ b/scripts/render_block_graph.py
@@ -35,7 +35,6 @@ def perm(arr):
     s = 'w' if 'write' in arr else '_'
     s += 'r' if 'consistent-read' in arr else '_'
     s += 'u' if 'write-unchanged' in arr else '_'
-    s += 'g' if 'graph-mod' in arr else '_'
     s += 's' if 'resize' in arr else '_'
     return s
 
diff --git a/tests/qemu-iotests/273.out b/tests/qemu-iotests/273.out
index 4e840b6730..6a74a8138b 100644
--- a/tests/qemu-iotests/273.out
+++ b/tests/qemu-iotests/273.out
@@ -204,7 +204,6 @@ Testing: -blockdev file,node-name=base,filename=TEST_DIR/t.IMGFMT.base -blockdev
                 "name": "file",
                 "parent": 5,
                 "shared-perm": [
-                    "graph-mod",
                     "write-unchanged",
                     "consistent-read"
                 ],
@@ -219,7 +218,6 @@ Testing: -blockdev file,node-name=base,filename=TEST_DIR/t.IMGFMT.base -blockdev
                 "name": "backing",
                 "parent": 5,
                 "shared-perm": [
-                    "graph-mod",
                     "resize",
                     "write-unchanged",
                     "write",
@@ -233,7 +231,6 @@ Testing: -blockdev file,node-name=base,filename=TEST_DIR/t.IMGFMT.base -blockdev
                 "name": "file",
                 "parent": 3,
                 "shared-perm": [
-                    "graph-mod",
                     "write-unchanged",
                     "consistent-read"
                 ],
@@ -246,7 +243,6 @@ Testing: -blockdev file,node-name=base,filename=TEST_DIR/t.IMGFMT.base -blockdev
                 "name": "backing",
                 "parent": 3,
                 "shared-perm": [
-                    "graph-mod",
                     "resize",
                     "write-unchanged",
                     "write",
-- 
2.31.1


