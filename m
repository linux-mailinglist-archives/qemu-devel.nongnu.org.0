Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2BDC1D1111
	for <lists+qemu-devel@lfdr.de>; Wed, 13 May 2020 13:19:45 +0200 (CEST)
Received: from localhost ([::1]:36636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jYpQO-0007E0-Tt
	for lists+qemu-devel@lfdr.de; Wed, 13 May 2020 07:19:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1jYpDy-0002f7-W9
 for qemu-devel@nongnu.org; Wed, 13 May 2020 07:06:55 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:54526
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1jYpDx-0003Wf-TS
 for qemu-devel@nongnu.org; Wed, 13 May 2020 07:06:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589368013;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=y4oIOOpzY0QP6g3ztpf4qjImiVu29vT8DWLV9l9bbvM=;
 b=Jma2N/vdQFMBSJfY543PO3jDmrvPlsqxw5JCNJPlK9yi/tndo8UDjECZYvQyEMCq7aIIOL
 bRERoxk5sYB4bxbN6RLz3bQNKwd5+cqD6h9SLMi4wF5hdPlaLuOZaNqw/yc54r5BB3YuJq
 PlFsu0A1f+XnU4uzTQyXQZyBs9fgpv8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-103-nDXb2nRyPiaQHlb6VbgLcA-1; Wed, 13 May 2020 07:06:51 -0400
X-MC-Unique: nDXb2nRyPiaQHlb6VbgLcA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8E69A53;
 Wed, 13 May 2020 11:06:50 +0000 (UTC)
Received: from localhost (unknown [10.40.193.218])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 24B0D5D9E8;
 Wed, 13 May 2020 11:06:49 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v4 24/34] block: Drop child_backing
Date: Wed, 13 May 2020 13:05:34 +0200
Message-Id: <20200513110544.176672-25-mreitz@redhat.com>
In-Reply-To: <20200513110544.176672-1-mreitz@redhat.com>
References: <20200513110544.176672-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=mreitz@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/13 03:05:18
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 include/block/block_int.h |  1 -
 block.c                   | 60 ++-------------------------------------
 2 files changed, 3 insertions(+), 58 deletions(-)

diff --git a/include/block/block_int.h b/include/block/block_int.h
index 4b09fa1124..0781d43af5 100644
--- a/include/block/block_int.h
+++ b/include/block/block_int.h
@@ -742,7 +742,6 @@ struct BdrvChildClass {
 
 extern const BdrvChildClass child_of_bds;
 extern const BdrvChildClass child_file;
-extern const BdrvChildClass child_backing;
 
 struct BdrvChild {
     BlockDriverState *bs;
diff --git a/block.c b/block.c
index 131ae20ffc..d138a3c261 100644
--- a/block.c
+++ b/block.c
@@ -1215,15 +1215,6 @@ static void bdrv_backing_attach(BdrvChild *c)
                     parent->backing_blocker);
 }
 
-/* XXX: Will be removed along with child_backing */
-static void bdrv_child_cb_attach_backing(BdrvChild *c)
-{
-    if (!(c->role & BDRV_CHILD_COW)) {
-        bdrv_backing_attach(c);
-    }
-    bdrv_child_cb_attach(c);
-}
-
 static void bdrv_backing_detach(BdrvChild *c)
 {
     BlockDriverState *parent = c->opaque;
@@ -1234,28 +1225,6 @@ static void bdrv_backing_detach(BdrvChild *c)
     parent->backing_blocker = NULL;
 }
 
-/* XXX: Will be removed along with child_backing */
-static void bdrv_child_cb_detach_backing(BdrvChild *c)
-{
-    if (!(c->role & BDRV_CHILD_COW)) {
-        bdrv_backing_detach(c);
-    }
-    bdrv_child_cb_detach(c);
-}
-
-/*
- * Returns the options and flags that bs->backing should get, based on the
- * given options and flags for the parent BDS
- */
-static void bdrv_backing_options(BdrvChildRole role, bool parent_is_format,
-                                 int *child_flags, QDict *child_options,
-                                 int parent_flags, QDict *parent_options)
-{
-    bdrv_inherited_options(BDRV_CHILD_COW, true,
-                           child_flags, child_options,
-                           parent_flags, parent_options);
-}
-
 static int bdrv_backing_update_filename(BdrvChild *c, BlockDriverState *base,
                                         const char *filename, Error **errp)
 {
@@ -1283,21 +1252,6 @@ static int bdrv_backing_update_filename(BdrvChild *c, BlockDriverState *base,
     return ret;
 }
 
-const BdrvChildClass child_backing = {
-    .parent_is_bds   = true,
-    .get_parent_desc = bdrv_child_get_parent_desc,
-    .attach          = bdrv_child_cb_attach_backing,
-    .detach          = bdrv_child_cb_detach_backing,
-    .inherit_options = bdrv_backing_options,
-    .drained_begin   = bdrv_child_cb_drained_begin,
-    .drained_poll    = bdrv_child_cb_drained_poll,
-    .drained_end     = bdrv_child_cb_drained_end,
-    .inactivate      = bdrv_child_cb_inactivate,
-    .update_filename = bdrv_backing_update_filename,
-    .can_set_aio_ctx = bdrv_child_cb_can_set_aio_ctx,
-    .set_aio_ctx     = bdrv_child_cb_set_aio_ctx,
-};
-
 /*
  * Returns the options and flags that a generic child of a BDS should
  * get, based on the given options and flags for the parent BDS.
@@ -2446,8 +2400,7 @@ static void bdrv_default_perms_for_cow(BlockDriverState *bs, BdrvChild *c,
                                        uint64_t perm, uint64_t shared,
                                        uint64_t *nperm, uint64_t *nshared)
 {
-    assert(child_class == &child_backing ||
-           (child_class == &child_of_bds && (role & BDRV_CHILD_COW)));
+    assert(child_class == &child_of_bds && (role & BDRV_CHILD_COW));
 
     /*
      * We want consistent read from backing files if the parent needs it.
@@ -2566,23 +2519,16 @@ void bdrv_format_default_perms(BlockDriverState *bs, BdrvChild *c,
                                uint64_t perm, uint64_t shared,
                                uint64_t *nperm, uint64_t *nshared)
 {
-    bool backing = (child_class == &child_backing);
-
     if (child_class == &child_of_bds) {
         bdrv_default_perms(bs, c, child_class, role, reopen_queue,
                            perm, shared, nperm, nshared);
         return;
     }
 
-    assert(child_class == &child_backing || child_class == &child_file);
+    assert(child_class == &child_file);
 
-    if (!backing) {
-        bdrv_default_perms_for_storage(bs, c, child_class, role, reopen_queue,
-                                       perm, shared, nperm, nshared);
-    } else {
-        bdrv_default_perms_for_cow(bs, c, child_class, role, reopen_queue,
+    bdrv_default_perms_for_storage(bs, c, child_class, role, reopen_queue,
                                    perm, shared, nperm, nshared);
-    }
 }
 
 void bdrv_default_perms(BlockDriverState *bs, BdrvChild *c,
-- 
2.26.2


