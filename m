Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A68EA1D110A
	for <lists+qemu-devel@lfdr.de>; Wed, 13 May 2020 13:18:39 +0200 (CEST)
Received: from localhost ([::1]:58908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jYpPK-0004VG-OK
	for lists+qemu-devel@lfdr.de; Wed, 13 May 2020 07:18:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1jYpDW-0001an-OQ
 for qemu-devel@nongnu.org; Wed, 13 May 2020 07:06:26 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:38292
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1jYpDV-0003QZ-Ox
 for qemu-devel@nongnu.org; Wed, 13 May 2020 07:06:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589367983;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+ppdqD1YxpXBf4Kp6jqKPRqDwoKSCIpRNBkaFcKB2hY=;
 b=HglEmPK26fNbYWjpcrASCGQJziiieQicPE29/ESUXg1gckyLNxwOOkeZvsWQW/H+EZVkdH
 lSkiJhZ98k0tSFaskpWXp8SLCJIeLze5X2PiliTgEtVurTxTi+To2cVqCXSWprzAgyDNh/
 DlfRa9Ku4XeUfLY4WdqyY7rE78SJqg4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-163-4czibvWtO6WrVizePFg9qg-1; Wed, 13 May 2020 07:06:21 -0400
X-MC-Unique: 4czibvWtO6WrVizePFg9qg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 845A819200C2;
 Wed, 13 May 2020 11:06:20 +0000 (UTC)
Received: from localhost (unknown [10.40.193.218])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1AA1A707CC;
 Wed, 13 May 2020 11:06:19 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v4 12/34] block: Unify bdrv_child_cb_attach()
Date: Wed, 13 May 2020 13:05:22 +0200
Message-Id: <20200513110544.176672-13-mreitz@redhat.com>
In-Reply-To: <20200513110544.176672-1-mreitz@redhat.com>
References: <20200513110544.176672-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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

Make bdrv_child_cb_attach() call bdrv_backing_attach() for children with
a COW role (and drop the reverse call from bdrv_backing_attach()), so it
can be used for any child (with a proper role set).

Because so far no child has a proper role set, we need a temporary new
callback for child_backing.attach that ensures bdrv_backing_attach() is
called for all COW children that do not have their role set yet.

(Also, move bdrv_child_cb_attach() down to group it with
bdrv_inherited_options().)

Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 block.c | 27 ++++++++++++++++++++-------
 1 file changed, 20 insertions(+), 7 deletions(-)

diff --git a/block.c b/block.c
index b3b978a092..755704a54c 100644
--- a/block.c
+++ b/block.c
@@ -84,6 +84,7 @@ static BlockDriverState *bdrv_open_inherit(const char *filename,
 static void bdrv_inherited_options(BdrvChildRole role, bool parent_is_format,
                                    int *child_flags, QDict *child_options,
                                    int parent_flags, QDict *parent_options);
+static void bdrv_child_cb_attach(BdrvChild *child);
 
 /* If non-zero, use only whitelisted block drivers */
 static int use_bdrv_whitelist;
@@ -1099,12 +1100,6 @@ static void bdrv_child_cb_drained_end(BdrvChild *child,
     bdrv_drained_end_no_poll(bs, drained_end_counter);
 }
 
-static void bdrv_child_cb_attach(BdrvChild *child)
-{
-    BlockDriverState *bs = child->opaque;
-    bdrv_apply_subtree_drain(child, bs);
-}
-
 static void bdrv_child_cb_detach(BdrvChild *child)
 {
     BlockDriverState *bs = child->opaque;
@@ -1252,7 +1247,14 @@ static void bdrv_backing_attach(BdrvChild *c)
                     parent->backing_blocker);
     bdrv_op_unblock(backing_hd, BLOCK_OP_TYPE_BACKUP_TARGET,
                     parent->backing_blocker);
+}
 
+/* XXX: Will be removed along with child_backing */
+static void bdrv_child_cb_attach_backing(BdrvChild *c)
+{
+    if (!(c->role & BDRV_CHILD_COW)) {
+        bdrv_backing_attach(c);
+    }
     bdrv_child_cb_attach(c);
 }
 
@@ -1311,7 +1313,7 @@ static int bdrv_backing_update_filename(BdrvChild *c, BlockDriverState *base,
 const BdrvChildClass child_backing = {
     .parent_is_bds   = true,
     .get_parent_desc = bdrv_child_get_parent_desc,
-    .attach          = bdrv_backing_attach,
+    .attach          = bdrv_child_cb_attach_backing,
     .detach          = bdrv_backing_detach,
     .inherit_options = bdrv_backing_options,
     .drained_begin   = bdrv_child_cb_drained_begin,
@@ -1403,6 +1405,17 @@ static void bdrv_inherited_options(BdrvChildRole role, bool parent_is_format,
     *child_flags = flags;
 }
 
+static void bdrv_child_cb_attach(BdrvChild *child)
+{
+    BlockDriverState *bs = child->opaque;
+
+    if (child->role & BDRV_CHILD_COW) {
+        bdrv_backing_attach(child);
+    }
+
+    bdrv_apply_subtree_drain(child, bs);
+}
+
 static int bdrv_open_flags(BlockDriverState *bs, int flags)
 {
     int open_flags = flags;
-- 
2.26.2


