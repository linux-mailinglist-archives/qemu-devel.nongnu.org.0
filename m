Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A304F54AE78
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jun 2022 12:37:44 +0200 (CEST)
Received: from localhost ([::1]:58544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o13vb-0005VL-O6
	for lists+qemu-devel@lfdr.de; Tue, 14 Jun 2022 06:37:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1o13nz-0001MJ-Qp; Tue, 14 Jun 2022 06:29:51 -0400
Received: from forwardcorp1p.mail.yandex.net
 ([2a02:6b8:0:1472:2741:0:8b6:217]:34404)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1o13nk-0000kn-79; Tue, 14 Jun 2022 06:29:51 -0400
Received: from sas1-3cba3404b018.qloud-c.yandex.net
 (sas1-3cba3404b018.qloud-c.yandex.net
 [IPv6:2a02:6b8:c08:bd26:0:640:3cba:3404])
 by forwardcorp1p.mail.yandex.net (Yandex) with ESMTP id BC79B2E124D;
 Tue, 14 Jun 2022 13:29:25 +0300 (MSK)
Received: from sas1-c73b4b4f4b95.qloud-c.yandex.net
 (sas1-c73b4b4f4b95.qloud-c.yandex.net [2a02:6b8:c08:12a9:0:640:c73b:4b4f])
 by sas1-3cba3404b018.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 AmVMJyhMp7-TPMCJ0fg; Tue, 14 Jun 2022 13:29:25 +0300
X-Yandex-Fwd: 2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1655202565; bh=2Kkx+UoDek2yQPFAJI4dU4sxm9y8W9vvQE8FStDc1BY=;
 h=Message-Id:References:Date:Subject:In-Reply-To:Cc:To:From;
 b=W6PEb9/RVR74JvFfvkkeA/xKDDnZ6gi/ehoH6pErhrRQD4PmBJQBd9LzUPm1GUuRj
 SGh6Be0xsOLlRhsI/T9ecT9alplhpgGE2RuwXYI/lbnZf00Rjdqq6yuME11Bzmd7hr
 RMoYx77CTUtFbLokoTs6K26IVU1JWMlCwq2G7/rU=
Authentication-Results: sas1-3cba3404b018.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from vsementsov-win.yandex-team.ru (unknown
 [2a02:6b8:b081:a427::1:2e])
 by sas1-c73b4b4f4b95.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 15x97ivcvu-TOMmXvEf; Tue, 14 Jun 2022 13:29:25 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, stefanha@redhat.com,
 eblake@redhat.com, hreitz@redhat.com, kwolf@redhat.com,
 vsementsov@yandex-team.ru, peter.maydell@linaro.org,
 Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
Subject: [PULL 06/10] block/copy-before-write: implement cbw-timeout option
Date: Tue, 14 Jun 2022 13:29:06 +0300
Message-Id: <20220614102910.1431380-7-vsementsov@yandex-team.ru>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220614102910.1431380-1-vsementsov@yandex-team.ru>
References: <20220614102910.1431380-1-vsementsov@yandex-team.ru>
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
Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
---
 block/copy-before-write.c | 23 ++++++++++++++++++++++-
 qapi/block-core.json      |  8 +++++++-
 2 files changed, 29 insertions(+), 2 deletions(-)

diff --git a/block/copy-before-write.c b/block/copy-before-write.c
index fc13c7cd44..1bc2e7f9ba 100644
--- a/block/copy-before-write.c
+++ b/block/copy-before-write.c
@@ -42,6 +42,7 @@ typedef struct BDRVCopyBeforeWriteState {
     BlockCopyState *bcs;
     BdrvChild *target;
     OnCbwError on_cbw_error;
+    uint32_t cbw_timeout_ns;
 
     /*
      * @lock: protects access to @access_bitmap, @done_bitmap and
@@ -83,6 +84,14 @@ static coroutine_fn int cbw_co_preadv(
     return bdrv_co_preadv(bs->file, offset, bytes, qiov, flags);
 }
 
+static void block_copy_cb(void *opaque)
+{
+    BlockDriverState *bs = opaque;
+
+    bs->in_flight--;
+    aio_wait_kick();
+}
+
 /*
  * Do copy-before-write operation.
  *
@@ -111,7 +120,16 @@ static coroutine_fn int cbw_do_copy_before_write(BlockDriverState *bs,
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
+    bs->in_flight++;
+    ret = block_copy(s->bcs, off, end - off, true, s->cbw_timeout_ns,
+                     block_copy_cb, bs);
     if (ret < 0 && s->on_cbw_error == ON_CBW_ERROR_BREAK_GUEST_WRITE) {
         return ret;
     }
@@ -377,6 +395,7 @@ static BlockdevOptions *cbw_parse_options(QDict *options, Error **errp)
      */
     qdict_extract_subqdict(options, NULL, "bitmap");
     qdict_del(options, "on-cbw-error");
+    qdict_del(options, "cbw-timeout");
 
 out:
     visit_free(v);
@@ -423,6 +442,8 @@ static int cbw_open(BlockDriverState *bs, QDict *options, int flags,
     }
     s->on_cbw_error = opts->has_on_cbw_error ? opts->on_cbw_error :
             ON_CBW_ERROR_BREAK_GUEST_WRITE;
+    s->cbw_timeout_ns = opts->has_cbw_timeout ?
+        opts->cbw_timeout * NANOSECONDS_PER_SECOND : 0;
 
     bs->total_sectors = bs->file->bs->total_sectors;
     bs->supported_write_flags = BDRV_REQ_WRITE_UNCHANGED |
diff --git a/qapi/block-core.json b/qapi/block-core.json
index 4abf26b42d..9fc06e7862 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -4198,12 +4198,18 @@
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


