Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 637D2398B0F
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 15:52:16 +0200 (CEST)
Received: from localhost ([::1]:60826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loRI7-0006Ru-FL
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 09:52:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1loRC6-0000LF-Na
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 09:46:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43222)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1loRC4-00076a-TT
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 09:46:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622641560;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uSczhTETjrLOl+SvUO6QOHAEcDO1fonXuQdHChJmCdE=;
 b=FxIFNm6iLudWJUKLyExXHi3tq//FwKjReXj7kwlFdHpt7nIsRPHinPl4IPME8ck606TQ8w
 tIcYwlyeiAS2KX8QmIefY81Rg86b3U+Tk5fhDctj6PM++QkgPNnUb8i0e0Tmb9YYhQv1VU
 d+p+3Nl50wEd5zEj0lUUWnPosQAAlHU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-507-iDwnJmA9M8i6xzWcp8aPvg-1; Wed, 02 Jun 2021 09:45:58 -0400
X-MC-Unique: iDwnJmA9M8i6xzWcp8aPvg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 622638B95A4;
 Wed,  2 Jun 2021 13:45:42 +0000 (UTC)
Received: from merkur.redhat.com (ovpn-114-240.ams2.redhat.com [10.36.114.240])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6E25160BD9;
 Wed,  2 Jun 2021 13:45:41 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 06/20] block: drop BlockDriverState::read_only
Date: Wed,  2 Jun 2021 15:45:15 +0200
Message-Id: <20210602134529.231756-7-kwolf@redhat.com>
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
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
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

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

This variable is just a cache for !(bs->open_flags & BDRV_O_RDWR),
which we have to synchronize everywhere. Let's just drop it and
consistently use bdrv_is_read_only().

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-Id: <20210527154056.70294-3-vsementsov@virtuozzo.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 include/block/block_int.h        | 1 -
 block.c                          | 7 +------
 tests/unit/test-block-iothread.c | 6 ------
 3 files changed, 1 insertion(+), 13 deletions(-)

diff --git a/include/block/block_int.h b/include/block/block_int.h
index b2c8b09d0f..09661a134b 100644
--- a/include/block/block_int.h
+++ b/include/block/block_int.h
@@ -843,7 +843,6 @@ struct BlockDriverState {
      * locking needed during I/O...
      */
     int open_flags; /* flags used to open the file, re-used for re-open */
-    bool read_only; /* if true, the media is read only */
     bool encrypted; /* if true, the media is encrypted */
     bool sg;        /* if true, the device is a /dev/sg* */
     bool probed;    /* if true, format was probed rather than specified */
diff --git a/block.c b/block.c
index 33e99d0c9e..84cb7212f7 100644
--- a/block.c
+++ b/block.c
@@ -265,7 +265,7 @@ void bdrv_parse_filename_strip_prefix(const char *filename, const char *prefix,
  * image is inactivated. */
 bool bdrv_is_read_only(BlockDriverState *bs)
 {
-    return bs->read_only;
+    return !(bs->open_flags & BDRV_O_RDWR);
 }
 
 int bdrv_can_set_read_only(BlockDriverState *bs, bool read_only,
@@ -317,7 +317,6 @@ int bdrv_apply_auto_read_only(BlockDriverState *bs, const char *errmsg,
         goto fail;
     }
 
-    bs->read_only = true;
     bs->open_flags &= ~BDRV_O_RDWR;
 
     return 0;
@@ -1549,7 +1548,6 @@ static int bdrv_open_driver(BlockDriverState *bs, BlockDriver *drv,
     }
 
     bs->drv = drv;
-    bs->read_only = !(bs->open_flags & BDRV_O_RDWR);
     bs->opaque = g_malloc0(drv->instance_size);
 
     if (drv->bdrv_file_open) {
@@ -1771,8 +1769,6 @@ static int bdrv_open_common(BlockDriverState *bs, BlockBackend *file,
     trace_bdrv_open_common(bs, filename ?: "", bs->open_flags,
                            drv->format_name);
 
-    bs->read_only = !(bs->open_flags & BDRV_O_RDWR);
-
     ro = bdrv_is_read_only(bs);
 
     if (use_bdrv_whitelist && !bdrv_is_whitelisted(drv, ro)) {
@@ -4548,7 +4544,6 @@ static void bdrv_reopen_commit(BDRVReopenState *reopen_state)
     bs->explicit_options   = reopen_state->explicit_options;
     bs->options            = reopen_state->options;
     bs->open_flags         = reopen_state->flags;
-    bs->read_only = !(reopen_state->flags & BDRV_O_RDWR);
     bs->detect_zeroes      = reopen_state->detect_zeroes;
 
     if (reopen_state->replace_backing_bs) {
diff --git a/tests/unit/test-block-iothread.c b/tests/unit/test-block-iothread.c
index 8cf172cb7a..c39e70b2f5 100644
--- a/tests/unit/test-block-iothread.c
+++ b/tests/unit/test-block-iothread.c
@@ -194,13 +194,11 @@ static void test_sync_op_truncate(BdrvChild *c)
     g_assert_cmpint(ret, ==, -EINVAL);
 
     /* Error: Read-only image */
-    c->bs->read_only = true;
     c->bs->open_flags &= ~BDRV_O_RDWR;
 
     ret = bdrv_truncate(c, 65536, false, PREALLOC_MODE_OFF, 0, NULL);
     g_assert_cmpint(ret, ==, -EACCES);
 
-    c->bs->read_only = false;
     c->bs->open_flags |= BDRV_O_RDWR;
 }
 
@@ -236,13 +234,11 @@ static void test_sync_op_flush(BdrvChild *c)
     g_assert_cmpint(ret, ==, 0);
 
     /* Early success: Read-only image */
-    c->bs->read_only = true;
     c->bs->open_flags &= ~BDRV_O_RDWR;
 
     ret = bdrv_flush(c->bs);
     g_assert_cmpint(ret, ==, 0);
 
-    c->bs->read_only = false;
     c->bs->open_flags |= BDRV_O_RDWR;
 }
 
@@ -256,13 +252,11 @@ static void test_sync_op_blk_flush(BlockBackend *blk)
     g_assert_cmpint(ret, ==, 0);
 
     /* Early success: Read-only image */
-    bs->read_only = true;
     bs->open_flags &= ~BDRV_O_RDWR;
 
     ret = blk_flush(blk);
     g_assert_cmpint(ret, ==, 0);
 
-    bs->read_only = false;
     bs->open_flags |= BDRV_O_RDWR;
 }
 
-- 
2.30.2


