Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC7DC55FA3C
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Jun 2022 10:20:32 +0200 (CEST)
Received: from localhost ([::1]:34808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6Sw2-0003k9-Ih
	for lists+qemu-devel@lfdr.de; Wed, 29 Jun 2022 04:20:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1o6Srb-0001C4-3v; Wed, 29 Jun 2022 04:15:55 -0400
Received: from forwardcorp1p.mail.yandex.net
 ([2a02:6b8:0:1472:2741:0:8b6:217]:41386)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1o6SrX-0006d9-4b; Wed, 29 Jun 2022 04:15:54 -0400
Received: from myt6-79704c0e15e4.qloud-c.yandex.net
 (myt6-79704c0e15e4.qloud-c.yandex.net
 [IPv6:2a02:6b8:c12:239b:0:640:7970:4c0e])
 by forwardcorp1p.mail.yandex.net (Yandex) with ESMTP id F1DF42E0DA5;
 Wed, 29 Jun 2022 11:15:40 +0300 (MSK)
Received: from myt6-81d8ab6a9f9d.qloud-c.yandex.net
 (myt6-81d8ab6a9f9d.qloud-c.yandex.net [2a02:6b8:c12:520a:0:640:81d8:ab6a])
 by myt6-79704c0e15e4.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 VnUiuymng2-FeJCMXKj; Wed, 29 Jun 2022 11:15:40 +0300
X-Yandex-Fwd: 2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1656490540; bh=oqbbi5UHF2ABntWZBFnCzysXMTTmy6MfBtaQHnufEFc=;
 h=Message-Id:References:Date:Subject:In-Reply-To:Cc:To:From;
 b=mxhQwTZRIYjo5SAyEBojmlfSrWAqtbxWHPYpZODlVH/frjzlDFRvV9arCTFn5qudI
 kibzGDKFEHHp0I4zYjXexOHrcaUD7MNUp/VH2Xnm14AhpXX7cs5HGAq6rO7h+WNBfo
 J8Om0eX0qV3M1zoPX7r8ujmw1yTWsVzw7G2a9QH0=
Authentication-Results: myt6-79704c0e15e4.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from vsementsov-win.yandex-team.ru (unknown
 [2a02:6b8:b081:232::1:2a])
 by myt6-81d8ab6a9f9d.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 2dQcHHKpZi-FeMq3Olw; Wed, 29 Jun 2022 11:15:40 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, hreitz@redhat.com, vsementsov@yandex-team.ru,
 peter.maydell@linaro.org,
 Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
Subject: [PULL v2 6/9] block/copy-before-write: implement cbw-timeout option
Date: Wed, 29 Jun 2022 11:15:17 +0300
Message-Id: <20220629081517.446432-3-vsementsov@yandex-team.ru>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220629081517.446432-1-vsementsov@yandex-team.ru>
References: <20220629081517.446432-1-vsementsov@yandex-team.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a02:6b8:0:1472:2741:0:8b6:217;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1p.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>

In some scenarios, when copy-before-write operations lasts too long
time, it's better to cancel it.

Most useful would be to use the new option together with
on-cbw-error=break-snapshot: this way if cbw operation takes too long
time we'll just cancel backup process but do not disturb the guest too
much.

Note the tricky point of realization: we keep additional point in
bs->in_flight during block_copy operation even if it's timed-out.
Background "cancelled" block_copy operations will finish at some point
and will want to access state. We should care to not free the state in
.bdrv_close() earlier.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
  [vsementsov: use bdrv_inc_in_flight()/bdrv_dec_in_flight() instead of
   direct manipulation on bs->in_flight]
Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
---
 block/copy-before-write.c | 22 +++++++++++++++++++++-
 qapi/block-core.json      |  8 +++++++-
 2 files changed, 28 insertions(+), 2 deletions(-)

diff --git a/block/copy-before-write.c b/block/copy-before-write.c
index fc13c7cd44..c24b8dd117 100644
--- a/block/copy-before-write.c
+++ b/block/copy-before-write.c
@@ -42,6 +42,7 @@ typedef struct BDRVCopyBeforeWriteState {
     BlockCopyState *bcs;
     BdrvChild *target;
     OnCbwError on_cbw_error;
+    uint32_t cbw_timeout_ns;
 
     /*
      * @lock: protects access to @access_bitmap, @done_bitmap and
@@ -83,6 +84,13 @@ static coroutine_fn int cbw_co_preadv(
     return bdrv_co_preadv(bs->file, offset, bytes, qiov, flags);
 }
 
+static void block_copy_cb(void *opaque)
+{
+    BlockDriverState *bs = opaque;
+
+    bdrv_dec_in_flight(bs);
+}
+
 /*
  * Do copy-before-write operation.
  *
@@ -111,7 +119,16 @@ static coroutine_fn int cbw_do_copy_before_write(BlockDriverState *bs,
     off = QEMU_ALIGN_DOWN(offset, cluster_size);
     end = QEMU_ALIGN_UP(offset + bytes, cluster_size);
 
-    ret = block_copy(s->bcs, off, end - off, true, 0, NULL, NULL);
+    /*
+     * Increase in_flight, so that in case of timed-out block-copy, the
+     * remaining background block_copy() request (which can't be immediately
+     * cancelled by timeout) is presented in bs->in_flight. This way we are
+     * sure that on bs close() we'll previously wait for all timed-out but yet
+     * running block_copy calls.
+     */
+    bdrv_inc_in_flight(bs);
+    ret = block_copy(s->bcs, off, end - off, true, s->cbw_timeout_ns,
+                     block_copy_cb, bs);
     if (ret < 0 && s->on_cbw_error == ON_CBW_ERROR_BREAK_GUEST_WRITE) {
         return ret;
     }
@@ -377,6 +394,7 @@ static BlockdevOptions *cbw_parse_options(QDict *options, Error **errp)
      */
     qdict_extract_subqdict(options, NULL, "bitmap");
     qdict_del(options, "on-cbw-error");
+    qdict_del(options, "cbw-timeout");
 
 out:
     visit_free(v);
@@ -423,6 +441,8 @@ static int cbw_open(BlockDriverState *bs, QDict *options, int flags,
     }
     s->on_cbw_error = opts->has_on_cbw_error ? opts->on_cbw_error :
             ON_CBW_ERROR_BREAK_GUEST_WRITE;
+    s->cbw_timeout_ns = opts->has_cbw_timeout ?
+        opts->cbw_timeout * NANOSECONDS_PER_SECOND : 0;
 
     bs->total_sectors = bs->file->bs->total_sectors;
     bs->supported_write_flags = BDRV_REQ_WRITE_UNCHANGED |
diff --git a/qapi/block-core.json b/qapi/block-core.json
index 3e8456a94a..2173e7734a 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -4227,12 +4227,18 @@
 # @on-cbw-error: Behavior on failure of copy-before-write operation.
 #                Default is @break-guest-write. (Since 7.1)
 #
+# @cbw-timeout: Zero means no limit. Non-zero sets the timeout in seconds
+#               for copy-before-write operation. When a timeout occurs,
+#               the respective copy-before-write operation will fail, and
+#               the @on-cbw-error parameter will decide how this failure
+#               is handled. Default 0. (Since 7.1)
+#
 # Since: 6.2
 ##
 { 'struct': 'BlockdevOptionsCbw',
   'base': 'BlockdevOptionsGenericFormat',
   'data': { 'target': 'BlockdevRef', '*bitmap': 'BlockDirtyBitmap',
-            '*on-cbw-error': 'OnCbwError' } }
+            '*on-cbw-error': 'OnCbwError', '*cbw-timeout': 'uint32' } }
 
 ##
 # @BlockdevOptions:
-- 
2.25.1


