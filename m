Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E906D36F9A8
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 13:56:55 +0200 (CEST)
Received: from localhost ([::1]:36662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcRlO-0003VQ-Ul
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 07:56:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lcQmD-0005oo-Cd
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 06:53:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48632)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lcQmB-00039K-5S
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 06:53:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619780018;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DjIeT/WiWRDurtoI3vFNR7zyuT2KA+jSuQmbkmYbOOI=;
 b=aI8J9DM5P8CcWq+2bNBEwAcTAuuO5YpmIW2fhpjOy9rOGro1H2iCoV6xjGOampSiaYMXpl
 5YT51EgATNF0TqF0ZbMVMF7Bzmzzb9zY2ZiuQPhcrclXNxW4tSG/62D9t0exRXLGIxvoq7
 garb8ilS8B8LP+TnMe9sTxH8Z+AWsMg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-370-dd0A9VVoMGOxmXKKXZPKgw-1; Fri, 30 Apr 2021 06:53:36 -0400
X-MC-Unique: dd0A9VVoMGOxmXKKXZPKgw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C8B9950219;
 Fri, 30 Apr 2021 10:53:25 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-197.ams2.redhat.com [10.36.114.197])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D771017177;
 Fri, 30 Apr 2021 10:53:24 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 37/39] block: Add BDRV_O_NO_SHARE for blk_new_open()
Date: Fri, 30 Apr 2021 12:51:45 +0200
Message-Id: <20210430105147.125840-38-kwolf@redhat.com>
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

Normally, blk_new_open() just shares all permissions. This was fine
originally when permissions only protected against uses in the same
process because no other part of the code would actually get to access
the block nodes opened with blk_new_open(). However, since we use it for
file locking now, unsharing permissions becomes desirable.

Add a new BDRV_O_NO_SHARE flag that is used in blk_new_open() to unshare
any permissions that can be unshared.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
Message-Id: <20210422164344.283389-2-kwolf@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 include/block/block.h |  1 +
 block/block-backend.c | 19 +++++++++++++------
 2 files changed, 14 insertions(+), 6 deletions(-)

diff --git a/include/block/block.h b/include/block/block.h
index 8d5b3ecebd..82185965ff 100644
--- a/include/block/block.h
+++ b/include/block/block.h
@@ -102,6 +102,7 @@ typedef struct HDGeometry {
     uint32_t cylinders;
 } HDGeometry;
 
+#define BDRV_O_NO_SHARE    0x0001 /* don't share permissions */
 #define BDRV_O_RDWR        0x0002
 #define BDRV_O_RESIZE      0x0004 /* request permission for resizing the node */
 #define BDRV_O_SNAPSHOT    0x0008 /* open the file read only and save writes in a snapshot */
diff --git a/block/block-backend.c b/block/block-backend.c
index e4892fd6a5..6fca9853e1 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -407,15 +407,19 @@ BlockBackend *blk_new_open(const char *filename, const char *reference,
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
@@ -425,8 +429,11 @@ BlockBackend *blk_new_open(const char *filename, const char *reference,
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
@@ -435,7 +442,7 @@ BlockBackend *blk_new_open(const char *filename, const char *reference,
 
     blk->root = bdrv_root_attach_child(bs, "root", &child_root,
                                        BDRV_CHILD_FILTERED | BDRV_CHILD_PRIMARY,
-                                       perm, BLK_PERM_ALL, blk, errp);
+                                       perm, shared, blk, errp);
     if (!blk->root) {
         blk_unref(blk);
         return NULL;
-- 
2.30.2


