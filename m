Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA387368556
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Apr 2021 18:57:45 +0200 (CEST)
Received: from localhost ([::1]:57464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZce8-0006eg-Qf
	for lists+qemu-devel@lfdr.de; Thu, 22 Apr 2021 12:57:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lZcR5-0003WP-5B
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 12:44:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29472)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lZcR2-0001W4-5D
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 12:44:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619109851;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rIj4O6y1cgm+6G6dJ4raz8VcNSvjLeIKrwwpmuiFdzM=;
 b=SfdR3Dmn3XiVwQgnUvY/rvoocM43v1Asjt3Prj1WLz64CkezktMO0+WvLQ3gNIVYINIrC7
 L15vhvk8E7ZbhbDff4McNndiKWwKCQXt9bbMAeUbUMqpCe3c3HoHbPLIZZ6pGCeGyXrx+p
 Aix+rgmSAu4GdMPYNjEYHxZPgF8yu7A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-590-n5mOLqUeOoGq5FugGPbtQQ-1; Thu, 22 Apr 2021 12:43:59 -0400
X-MC-Unique: n5mOLqUeOoGq5FugGPbtQQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2BE7F106907F;
 Thu, 22 Apr 2021 16:43:53 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-112-159.ams2.redhat.com [10.36.112.159])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3DE125C261;
 Thu, 22 Apr 2021 16:43:52 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v2 1/2] block: Add BDRV_O_NO_SHARE for blk_new_open()
Date: Thu, 22 Apr 2021 18:43:43 +0200
Message-Id: <20210422164344.283389-2-kwolf@redhat.com>
In-Reply-To: <20210422164344.283389-1-kwolf@redhat.com>
References: <20210422164344.283389-1-kwolf@redhat.com>
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
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: kwolf@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Normally, blk_new_open() just shares all permissions. This was fine
originally when permissions only protected against uses in the same
process because no other part of the code would actually get to access
the block nodes opened with blk_new_open(). However, since we use it for
file locking now, unsharing permissions becomes desirable.

Add a new BDRV_O_NO_SHARE flag that is used in blk_new_open() to unshare
any permissions that can be unshared.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 include/block/block.h |  1 +
 block/block-backend.c | 19 +++++++++++++------
 2 files changed, 14 insertions(+), 6 deletions(-)

diff --git a/include/block/block.h b/include/block/block.h
index b3f6e509d4..735db05a39 100644
--- a/include/block/block.h
+++ b/include/block/block.h
@@ -101,6 +101,7 @@ typedef struct HDGeometry {
     uint32_t cylinders;
 } HDGeometry;
 
+#define BDRV_O_NO_SHARE    0x0001 /* don't share permissons */
 #define BDRV_O_RDWR        0x0002
 #define BDRV_O_RESIZE      0x0004 /* request permission for resizing the node */
 #define BDRV_O_SNAPSHOT    0x0008 /* open the file read only and save writes in a snapshot */
diff --git a/block/block-backend.c b/block/block-backend.c
index 413af51f3b..61a10ea860 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -398,15 +398,19 @@ BlockBackend *blk_new_open(const char *filename, const char *reference,
     BlockBackend *blk;
     BlockDriverState *bs;
     uint64_t perm = 0;
+    uint64_t shared = BLK_PERM_ALL;
 
-    /* blk_new_open() is mainly used in .bdrv_create implementations and the
-     * tools where sharing isn't a concern because the BDS stays private, so we
-     * just request permission according to the flags.
+    /*
+     * blk_new_open() is mainly used in .bdrv_create implementations and the
+     * tools where sharing isn't a major concern because the BDS stays private
+     * and the file is generally not supposed to be used by a second process,
+     * so we just request permission according to the flags.
      *
      * The exceptions are xen_disk and blockdev_init(); in these cases, the
      * caller of blk_new_open() doesn't make use of the permissions, but they
      * shouldn't hurt either. We can still share everything here because the
-     * guest devices will add their own blockers if they can't share. */
+     * guest devices will add their own blockers if they can't share.
+     */
     if ((flags & BDRV_O_NO_IO) == 0) {
         perm |= BLK_PERM_CONSISTENT_READ;
         if (flags & BDRV_O_RDWR) {
@@ -416,8 +420,11 @@ BlockBackend *blk_new_open(const char *filename, const char *reference,
     if (flags & BDRV_O_RESIZE) {
         perm |= BLK_PERM_RESIZE;
     }
+    if (flags & BDRV_O_NO_SHARE) {
+        shared = BLK_PERM_CONSISTENT_READ | BLK_PERM_WRITE_UNCHANGED;
+    }
 
-    blk = blk_new(qemu_get_aio_context(), perm, BLK_PERM_ALL);
+    blk = blk_new(qemu_get_aio_context(), perm, shared);
     bs = bdrv_open(filename, reference, options, flags, errp);
     if (!bs) {
         blk_unref(blk);
@@ -426,7 +433,7 @@ BlockBackend *blk_new_open(const char *filename, const char *reference,
 
     blk->root = bdrv_root_attach_child(bs, "root", &child_root,
                                        BDRV_CHILD_FILTERED | BDRV_CHILD_PRIMARY,
-                                       blk->ctx, perm, BLK_PERM_ALL, blk, errp);
+                                       blk->ctx, perm, shared, blk, errp);
     if (!blk->root) {
         blk_unref(blk);
         return NULL;
-- 
2.30.2


