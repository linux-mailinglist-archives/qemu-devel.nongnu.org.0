Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 573B1319139
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 18:40:05 +0100 (CET)
Received: from localhost ([::1]:49106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAFwi-000065-DV
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 12:40:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lAFgL-0000Ls-D0
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 12:23:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:44990)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lAFg6-0006VI-HX
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 12:23:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613064169;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ff2CjLDkPwbNKLJ5BQSgrJBV7Fz9U1wA0Z0fwv02+Fg=;
 b=P+2FSOPhCMw5PvwO2NFeX0nisSC/3la6QNzSGAKjplHXXbWX9eknPeLhWve4rDBuQJs/pc
 KUUtIAgxWs2diN7Po1zKc/D8OfquM+KQsb6cbwPMpaEoJEIzJC4aLI7vxjqc0co6/EIAaX
 BHwVQuWlnulic9fzhm6IFfmTmpPSzDM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-218-L655VliEMm2LabJ2IAVicw-1; Thu, 11 Feb 2021 12:22:47 -0500
X-MC-Unique: L655VliEMm2LabJ2IAVicw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B43FE835E21;
 Thu, 11 Feb 2021 17:22:46 +0000 (UTC)
Received: from localhost (ovpn-114-199.ams2.redhat.com [10.36.114.199])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 42CF11A8A3;
 Thu, 11 Feb 2021 17:22:46 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH 1/2] block/mirror: Fix mirror_top's permissions
Date: Thu, 11 Feb 2021 18:22:41 +0100
Message-Id: <20210211172242.146671-2-mreitz@redhat.com>
In-Reply-To: <20210211172242.146671-1-mreitz@redhat.com>
References: <20210211172242.146671-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.569,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

mirror_top currently shares all permissions, and takes only the WRITE
permission (if some parent has taken that permission, too).

That is wrong, though; mirror_top is a filter, so it should take
permissions like any other filter does.  For example, if the parent
needs CONSISTENT_READ, we need to take that, too, and if it cannot share
the WRITE permission, we cannot share it either.

The exception is when mirror_top is used for active commit, where we
cannot take CONSISTENT_READ (because it is deliberately unshared above
the base node) and where we must share WRITE (so that it is shared for
all images in the backing chain, so the mirror job can take it for the
target BB).

Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 block/mirror.c | 32 +++++++++++++++++++++++++-------
 1 file changed, 25 insertions(+), 7 deletions(-)

diff --git a/block/mirror.c b/block/mirror.c
index 8e1ad6eceb..1edfc3cc14 100644
--- a/block/mirror.c
+++ b/block/mirror.c
@@ -89,6 +89,7 @@ typedef struct MirrorBlockJob {
 typedef struct MirrorBDSOpaque {
     MirrorBlockJob *job;
     bool stop;
+    bool is_commit;
 } MirrorBDSOpaque;
 
 struct MirrorOp {
@@ -1513,13 +1514,27 @@ static void bdrv_mirror_top_child_perm(BlockDriverState *bs, BdrvChild *c,
         return;
     }
 
-    /* Must be able to forward guest writes to the real image */
-    *nperm = 0;
-    if (perm & BLK_PERM_WRITE) {
-        *nperm |= BLK_PERM_WRITE;
-    }
+    bdrv_default_perms(bs, c, role, reopen_queue,
+                       perm, shared, nperm, nshared);
 
-    *nshared = BLK_PERM_ALL;
+    if (s->is_commit) {
+        /*
+         * For commit jobs, we cannot take CONSISTENT_READ, because
+         * that permission is unshared for everything above the base
+         * node (except for filters on the base node).
+         * We also have to force-share the WRITE permission, or
+         * otherwise we would block ourselves at the base node (if
+         * writes are blocked for a node, they are also blocked for
+         * its backing file).
+         * (We could also share RESIZE, because it may be needed for
+         * the target if its size is less than the top node's; but
+         * bdrv_default_perms_for_cow() automatically shares RESIZE
+         * for backing nodes if WRITE is shared, so there is no need
+         * to do it here.)
+         */
+        *nperm &= ~BLK_PERM_CONSISTENT_READ;
+        *nshared |= BLK_PERM_WRITE;
+    }
 }
 
 /* Dummy node that provides consistent read to its users without requiring it
@@ -1583,6 +1598,8 @@ static BlockJob *mirror_start_job(
         return NULL;
     }
 
+    target_is_backing = bdrv_chain_contains(bs, target);
+
     /* In the case of active commit, add dummy driver to provide consistent
      * reads on the top, while disabling it in the intermediate nodes, and make
      * the backing chain writable. */
@@ -1605,6 +1622,8 @@ static BlockJob *mirror_start_job(
     bs_opaque = g_new0(MirrorBDSOpaque, 1);
     mirror_top_bs->opaque = bs_opaque;
 
+    bs_opaque->is_commit = target_is_backing;
+
     /* bdrv_append takes ownership of the mirror_top_bs reference, need to keep
      * it alive until block_job_create() succeeds even if bs has no parent. */
     bdrv_ref(mirror_top_bs);
@@ -1646,7 +1665,6 @@ static BlockJob *mirror_start_job(
     target_perms = BLK_PERM_WRITE;
     target_shared_perms = BLK_PERM_WRITE_UNCHANGED;
 
-    target_is_backing = bdrv_chain_contains(bs, target);
     if (target_is_backing) {
         int64_t bs_size, target_size;
         bs_size = bdrv_getlength(bs);
-- 
2.29.2


