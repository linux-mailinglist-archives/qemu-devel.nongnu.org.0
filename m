Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B35741D110E
	for <lists+qemu-devel@lfdr.de>; Wed, 13 May 2020 13:19:37 +0200 (CEST)
Received: from localhost ([::1]:35840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jYpQG-0006ur-Nb
	for lists+qemu-devel@lfdr.de; Wed, 13 May 2020 07:19:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1jYpDj-000270-Q3
 for qemu-devel@nongnu.org; Wed, 13 May 2020 07:06:41 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:23896
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1jYpDi-0003Tt-VG
 for qemu-devel@nongnu.org; Wed, 13 May 2020 07:06:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589367998;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=X40Kgye7pKZZ1k386IYehbbXmLkA37XiBQs1LMS4Hmk=;
 b=ZOalPmrAoB/9w0nitiUXJ5jQBS1+ZoQGv4GTAXJcH+hAbJ83XlRsGXJBV2t/99ybJd1yQ9
 l7VcqM9D2IKUQ1BzEWBbpjqkGWX7B+7E14WRDrb3qsWdiKLClMXxG6kNaKtq95HR69w1Ve
 i1nHCtf2Rf2ua3m3XUVwF77tRdV/Loo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-41-QEQw_iInMdCraoJCYTLgIw-1; Wed, 13 May 2020 07:06:36 -0400
X-MC-Unique: QEQw_iInMdCraoJCYTLgIw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7931F19200C6;
 Wed, 13 May 2020 11:06:35 +0000 (UTC)
Received: from localhost (unknown [10.40.193.218])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0F8B26E6F2;
 Wed, 13 May 2020 11:06:34 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v4 18/34] block: Relax *perms_for_storage for data children
Date: Wed, 13 May 2020 13:05:28 +0200
Message-Id: <20200513110544.176672-19-mreitz@redhat.com>
In-Reply-To: <20200513110544.176672-1-mreitz@redhat.com>
References: <20200513110544.176672-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/13 04:17:42
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

We can be less restrictive about pure data children than those with
metadata on them, so let bdrv_default_perms_for_storage() handle
metadata children differently from pure data children.

As explained in the code, the restrictions on metadata children are
strictly stricter than those for pure data children, so in theory we
just have to distinguish between pure-data and all other storage
children (pure metadata or data+metadata).  In practice, that is not
obvious, though, so we have two independent code paths for metadata and
for data children, and data+metadata children will go through both
(without the path for data children doing anything meaningful).

Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 block.c | 58 +++++++++++++++++++++++++++++++++++++++++++++++----------
 1 file changed, 48 insertions(+), 10 deletions(-)

diff --git a/block.c b/block.c
index 5d17aa1cc3..5ff6cbd796 100644
--- a/block.c
+++ b/block.c
@@ -2528,19 +2528,57 @@ static void bdrv_default_perms_for_storage(BlockDriverState *bs, BdrvChild *c,
     bdrv_filter_default_perms(bs, c, child_class, role, reopen_queue,
                               perm, shared, &perm, &shared);
 
-    /* Format drivers may touch metadata even if the guest doesn't write */
-    if (bdrv_is_writable_after_reopen(bs, reopen_queue)) {
-        perm |= BLK_PERM_WRITE | BLK_PERM_RESIZE;
+    if (role & BDRV_CHILD_METADATA) {
+        /* Format drivers may touch metadata even if the guest doesn't write */
+        if (bdrv_is_writable_after_reopen(bs, reopen_queue)) {
+            perm |= BLK_PERM_WRITE | BLK_PERM_RESIZE;
+        }
+
+        /*
+         * bs->file always needs to be consistent because of the
+         * metadata. We can never allow other users to resize or write
+         * to it.
+         */
+        if (!(flags & BDRV_O_NO_IO)) {
+            perm |= BLK_PERM_CONSISTENT_READ;
+        }
+        shared &= ~(BLK_PERM_WRITE | BLK_PERM_RESIZE);
     }
 
-    /*
-     * bs->file always needs to be consistent because of the metadata. We
-     * can never allow other users to resize or write to it.
-     */
-    if (!(flags & BDRV_O_NO_IO)) {
-        perm |= BLK_PERM_CONSISTENT_READ;
+    if (role & BDRV_CHILD_DATA) {
+        /*
+         * Technically, everything in this block is a subset of the
+         * BDRV_CHILD_METADATA path taken above, and so this could
+         * be an "else if" branch.  However, that is not obvious, and
+         * this function is not performance critical, therefore we let
+         * this be an independent "if".
+         */
+
+        /*
+         * We cannot allow other users to resize the file because the
+         * format driver might have some assumptions about the size
+         * (e.g. because it is stored in metadata, or because the file
+         * is split into fixed-size data files).
+         */
+        shared &= ~BLK_PERM_RESIZE;
+
+        /*
+         * WRITE_UNCHANGED often cannot be performed as such on the
+         * data file.  For example, the qcow2 driver may still need to
+         * write copied clusters on copy-on-read.
+         */
+        if (perm & BLK_PERM_WRITE_UNCHANGED) {
+            perm |= BLK_PERM_WRITE;
+        }
+
+        /*
+         * If the data file is written to, the format driver may
+         * expect to be able to resize it by writing beyond the EOF.
+         */
+        if (perm & BLK_PERM_WRITE) {
+            perm |= BLK_PERM_RESIZE;
+        }
     }
-    shared &= ~(BLK_PERM_WRITE | BLK_PERM_RESIZE);
 
     if (bs->open_flags & BDRV_O_INACTIVE) {
         shared |= BLK_PERM_WRITE | BLK_PERM_RESIZE;
-- 
2.26.2


