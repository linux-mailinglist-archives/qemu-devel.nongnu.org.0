Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6391E31A846
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Feb 2021 00:24:37 +0100 (CET)
Received: from localhost ([::1]:42272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAhng-00062t-Gs
	for lists+qemu-devel@lfdr.de; Fri, 12 Feb 2021 18:24:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lAhl1-00042L-Ba
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 18:21:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55055)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lAhky-0005pd-IO
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 18:21:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613172107;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9Syc51pVJJYsnbt2vRTpdjERhuppla9JwvabgLYlN38=;
 b=c+Izf/LP35wdimTSoeWuw1Hwza+5l/9M3WSlSloszFgdE5scR+xiT2GE9H1fZvu0BhgmYQ
 MhCyQnxCo/u+9iOucIUbC7J6FWjpXo8JkPEhv/bOi+v7UZdxxZAXBYIf7OxdcfARE6RQiW
 Olda8RHfoPjdvKAe1e6/a9q6SH77aLM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-169-nY01P2KrMsKPf38Ya8wrUg-1; Fri, 12 Feb 2021 18:21:45 -0500
X-MC-Unique: nY01P2KrMsKPf38Ya8wrUg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6D64F1005501;
 Fri, 12 Feb 2021 23:21:44 +0000 (UTC)
Received: from blue.redhat.com (ovpn-114-150.phx2.redhat.com [10.3.114.150])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F25F11F04C;
 Fri, 12 Feb 2021 23:21:42 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 4/5] block: return status from bdrv_append and friends
Date: Fri, 12 Feb 2021 17:21:33 -0600
Message-Id: <20210212232134.1462756-5-eblake@redhat.com>
In-Reply-To: <20210212232134.1462756-1-eblake@redhat.com>
References: <20210212232134.1462756-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.569,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Alberto Garcia <berto@igalia.com>,
 "open list:Block layer core" <qemu-block@nongnu.org>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

The recommended use of qemu error api assumes returning status together
with setting errp and avoid void functions with errp parameter. Let's
improve bdrv_append and some friends to reduce error-propagation
overhead in further patches.

Choose int return status, because bdrv_replace_node_common() has call
to bdrv_check_update_perm(), which reports int status, which seems
correct to propagate.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-Id: <20210202124956.63146-2-vsementsov@virtuozzo.com>
Reviewed-by: Alberto Garcia <berto@igalia.com>
Signed-off-by: Eric Blake <eblake@redhat.com>
---
 include/block/block.h | 12 ++++-----
 block.c               | 58 +++++++++++++++++++++++++++----------------
 2 files changed, 43 insertions(+), 27 deletions(-)

diff --git a/include/block/block.h b/include/block/block.h
index 0a9f2c187cdb..2c235a29e822 100644
--- a/include/block/block.h
+++ b/include/block/block.h
@@ -356,10 +356,10 @@ int bdrv_create(BlockDriver *drv, const char* filename,
 int bdrv_create_file(const char *filename, QemuOpts *opts, Error **errp);

 BlockDriverState *bdrv_new(void);
-void bdrv_append(BlockDriverState *bs_new, BlockDriverState *bs_top,
-                 Error **errp);
-void bdrv_replace_node(BlockDriverState *from, BlockDriverState *to,
-                       Error **errp);
+int bdrv_append(BlockDriverState *bs_new, BlockDriverState *bs_top,
+                Error **errp);
+int bdrv_replace_node(BlockDriverState *from, BlockDriverState *to,
+                      Error **errp);
 BlockDriverState *bdrv_insert_node(BlockDriverState *bs, QDict *node_options,
                                    int flags, Error **errp);

@@ -373,8 +373,8 @@ BdrvChild *bdrv_open_child(const char *filename,
                            BdrvChildRole child_role,
                            bool allow_none, Error **errp);
 BlockDriverState *bdrv_open_blockdev_ref(BlockdevRef *ref, Error **errp);
-void bdrv_set_backing_hd(BlockDriverState *bs, BlockDriverState *backing_hd,
-                         Error **errp);
+int bdrv_set_backing_hd(BlockDriverState *bs, BlockDriverState *backing_hd,
+                        Error **errp);
 int bdrv_open_backing_file(BlockDriverState *bs, QDict *parent_options,
                            const char *bdref_key, Error **errp);
 BlockDriverState *bdrv_open(const char *filename, const char *reference,
diff --git a/block.c b/block.c
index 4e52b1c588cd..fdb0261cb324 100644
--- a/block.c
+++ b/block.c
@@ -2827,14 +2827,15 @@ static BdrvChildRole bdrv_backing_role(BlockDriverState *bs)
  * Sets the bs->backing link of a BDS. A new reference is created; callers
  * which don't need their own reference any more must call bdrv_unref().
  */
-void bdrv_set_backing_hd(BlockDriverState *bs, BlockDriverState *backing_hd,
-                         Error **errp)
+int bdrv_set_backing_hd(BlockDriverState *bs, BlockDriverState *backing_hd,
+                        Error **errp)
 {
+    int ret = 0;
     bool update_inherits_from = bdrv_chain_contains(bs, backing_hd) &&
         bdrv_inherits_from_recursive(backing_hd, bs);

     if (bdrv_is_backing_chain_frozen(bs, child_bs(bs->backing), errp)) {
-        return;
+        return -EPERM;
     }

     if (backing_hd) {
@@ -2853,15 +2854,22 @@ void bdrv_set_backing_hd(BlockDriverState *bs, BlockDriverState *backing_hd,

     bs->backing = bdrv_attach_child(bs, backing_hd, "backing", &child_of_bds,
                                     bdrv_backing_role(bs), errp);
+    if (!bs->backing) {
+        ret = -EPERM;
+        goto out;
+    }
+
     /* If backing_hd was already part of bs's backing chain, and
      * inherits_from pointed recursively to bs then let's update it to
      * point directly to bs (else it will become NULL). */
-    if (bs->backing && update_inherits_from) {
+    if (update_inherits_from) {
         backing_hd->inherits_from = bs;
     }

 out:
     bdrv_refresh_limits(bs, NULL);
+
+    return ret;
 }

 /*
@@ -4532,9 +4540,9 @@ static bool should_update_child(BdrvChild *c, BlockDriverState *to)
  * With auto_skip=false the error is returned if from has a parent which should
  * not be updated.
  */
-static void bdrv_replace_node_common(BlockDriverState *from,
-                                     BlockDriverState *to,
-                                     bool auto_skip, Error **errp)
+static int bdrv_replace_node_common(BlockDriverState *from,
+                                    BlockDriverState *to,
+                                    bool auto_skip, Error **errp)
 {
     BdrvChild *c, *next;
     GSList *list = NULL, *p;
@@ -4556,11 +4564,13 @@ static void bdrv_replace_node_common(BlockDriverState *from,
             if (auto_skip) {
                 continue;
             }
+            ret = -EINVAL;
             error_setg(errp, "Should not change '%s' link to '%s'",
                        c->name, from->node_name);
             goto out;
         }
         if (c->frozen) {
+            ret = -EPERM;
             error_setg(errp, "Cannot change '%s' link to '%s'",
                        c->name, from->node_name);
             goto out;
@@ -4591,14 +4601,18 @@ static void bdrv_replace_node_common(BlockDriverState *from,

     bdrv_set_perm(to);

+    ret = 0;
+
 out:
     g_slist_free(list);
     bdrv_drained_end(from);
     bdrv_unref(from);
+
+    return ret;
 }

-void bdrv_replace_node(BlockDriverState *from, BlockDriverState *to,
-                       Error **errp)
+int bdrv_replace_node(BlockDriverState *from, BlockDriverState *to,
+                      Error **errp)
 {
     return bdrv_replace_node_common(from, to, true, errp);
 }
@@ -4619,28 +4633,30 @@ void bdrv_replace_node(BlockDriverState *from, BlockDriverState *to,
  * parents of bs_top after bdrv_append() returns. If the caller needs to keep a
  * reference of its own, it must call bdrv_ref().
  */
-void bdrv_append(BlockDriverState *bs_new, BlockDriverState *bs_top,
-                 Error **errp)
+int bdrv_append(BlockDriverState *bs_new, BlockDriverState *bs_top,
+                Error **errp)
 {
-    Error *local_err = NULL;
-
-    bdrv_set_backing_hd(bs_new, bs_top, &local_err);
-    if (local_err) {
-        error_propagate(errp, local_err);
+    int ret = bdrv_set_backing_hd(bs_new, bs_top, errp);
+    if (ret < 0) {
         goto out;
     }

-    bdrv_replace_node(bs_top, bs_new, &local_err);
-    if (local_err) {
-        error_propagate(errp, local_err);
+    ret = bdrv_replace_node(bs_top, bs_new, errp);
+    if (ret < 0) {
         bdrv_set_backing_hd(bs_new, NULL, &error_abort);
         goto out;
     }

-    /* bs_new is now referenced by its new parents, we don't need the
-     * additional reference any more. */
+    ret = 0;
+
 out:
+    /*
+     * bs_new is now referenced by its new parents, we don't need the
+     * additional reference any more.
+     */
     bdrv_unref(bs_new);
+
+    return ret;
 }

 static void bdrv_delete(BlockDriverState *bs)
-- 
2.30.1


