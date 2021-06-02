Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5F9A398B14
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 15:52:53 +0200 (CEST)
Received: from localhost ([::1]:35132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loRIi-0008Cl-SF
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 09:52:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1loRCL-0001Gc-H3
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 09:46:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41299)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1loRCF-0007DJ-Du
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 09:46:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622641570;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f2W5gvsMWQvXwqrXI35bDSg8iBskGbDI3OVULsgLVDk=;
 b=ZyPu9vEfQNxyGU+fCrkhrEglgl8pqlrLBns9BBb+eJgfkCDFv50WmqfaP3rXbb4rtc3lST
 YinNJW2kE8YmDqpHbRfprbwddZGXfr7TW+dpHmCpcZ6F+AVAs8kjB5fm+ZxZmxbYI+prl6
 r5shEpx6OX52k67u7+6qnFfV0dfjEuE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-592-Wd_h7IKhPjK-HflvLmNKeg-1; Wed, 02 Jun 2021 09:46:07 -0400
X-MC-Unique: Wd_h7IKhPjK-HflvLmNKeg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 970AE814602;
 Wed,  2 Jun 2021 13:45:43 +0000 (UTC)
Received: from merkur.redhat.com (ovpn-114-240.ams2.redhat.com [10.36.114.240])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A422C19814;
 Wed,  2 Jun 2021 13:45:42 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 07/20] block: drop BlockBackendRootState::read_only
Date: Wed,  2 Jun 2021 15:45:16 +0200
Message-Id: <20210602134529.231756-8-kwolf@redhat.com>
In-Reply-To: <20210602134529.231756-1-kwolf@redhat.com>
References: <20210602134529.231756-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

Instead of keeping additional boolean field, let's store the
information in BDRV_O_RDWR bit of BlockBackendRootState::open_flags.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-Id: <20210527154056.70294-4-vsementsov@virtuozzo.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 include/block/block_int.h |  1 -
 block/block-backend.c     | 10 ++--------
 blockdev.c                |  3 +--
 3 files changed, 3 insertions(+), 11 deletions(-)

diff --git a/include/block/block_int.h b/include/block/block_int.h
index 09661a134b..057d88b1fc 100644
--- a/include/block/block_int.h
+++ b/include/block/block_int.h
@@ -1007,7 +1007,6 @@ struct BlockDriverState {
 
 struct BlockBackendRootState {
     int open_flags;
-    bool read_only;
     BlockdevDetectZeroesOptions detect_zeroes;
 };
 
diff --git a/block/block-backend.c b/block/block-backend.c
index 21b834e9df..d1a33a2c8e 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -1852,7 +1852,7 @@ bool blk_supports_write_perm(BlockBackend *blk)
     if (bs) {
         return !bdrv_is_read_only(bs);
     } else {
-        return !blk->root_state.read_only;
+        return blk->root_state.open_flags & BDRV_O_RDWR;
     }
 }
 
@@ -2269,7 +2269,6 @@ void blk_update_root_state(BlockBackend *blk)
     assert(blk->root);
 
     blk->root_state.open_flags    = blk->root->bs->open_flags;
-    blk->root_state.read_only     = bdrv_is_read_only(blk->root->bs);
     blk->root_state.detect_zeroes = blk->root->bs->detect_zeroes;
 }
 
@@ -2288,12 +2287,7 @@ bool blk_get_detect_zeroes_from_root_state(BlockBackend *blk)
  */
 int blk_get_open_flags_from_root_state(BlockBackend *blk)
 {
-    int bs_flags;
-
-    bs_flags = blk->root_state.read_only ? 0 : BDRV_O_RDWR;
-    bs_flags |= blk->root_state.open_flags & ~BDRV_O_RDWR;
-
-    return bs_flags;
+    return blk->root_state.open_flags;
 }
 
 BlockBackendRootState *blk_get_root_state(BlockBackend *blk)
diff --git a/blockdev.c b/blockdev.c
index 834c2304a1..f08192deda 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -583,8 +583,7 @@ static BlockBackend *blockdev_init(const char *file, QDict *bs_opts,
 
         blk = blk_new(qemu_get_aio_context(), 0, BLK_PERM_ALL);
         blk_rs = blk_get_root_state(blk);
-        blk_rs->open_flags    = bdrv_flags;
-        blk_rs->read_only     = read_only;
+        blk_rs->open_flags    = bdrv_flags | (read_only ? 0 : BDRV_O_RDWR);
         blk_rs->detect_zeroes = detect_zeroes;
 
         qobject_unref(bs_opts);
-- 
2.30.2


