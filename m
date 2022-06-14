Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74B3C54AE75
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jun 2022 12:37:09 +0200 (CEST)
Received: from localhost ([::1]:56928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o13v1-0004I6-Vn
	for lists+qemu-devel@lfdr.de; Tue, 14 Jun 2022 06:37:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1o13nm-0001Dy-CL; Tue, 14 Jun 2022 06:29:38 -0400
Received: from forwardcorp1j.mail.yandex.net ([5.45.199.163]:42672)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1o13ne-0000kK-Vn; Tue, 14 Jun 2022 06:29:37 -0400
Received: from sas1-9c28cd37d27b.qloud-c.yandex.net
 (sas1-9c28cd37d27b.qloud-c.yandex.net
 [IPv6:2a02:6b8:c14:309b:0:640:9c28:cd37])
 by forwardcorp1j.mail.yandex.net (Yandex) with ESMTP id 1E5B92E1B24;
 Tue, 14 Jun 2022 13:29:21 +0300 (MSK)
Received: from sas1-c73b4b4f4b95.qloud-c.yandex.net
 (sas1-c73b4b4f4b95.qloud-c.yandex.net [2a02:6b8:c08:12a9:0:640:c73b:4b4f])
 by sas1-9c28cd37d27b.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 uwPWXKq3FJ-TKJ4Qp1Z; Tue, 14 Jun 2022 13:29:21 +0300
X-Yandex-Fwd: 2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1655202561; bh=DbRyq3mIXDnX/HUQkdyK9OLyyEamPRBQuSfXjoF8U6k=;
 h=Message-Id:References:Date:Subject:In-Reply-To:Cc:To:From;
 b=r4djV1DOC+77dxnKmUTA+r39/Y8Pjr9gJpxhwN0OuYkKZJNptKpzUMFy7+2q2UVg6
 LwGL+X+aqSYscjjTLNNCinSaL2tSLQYjMkHHTP57JSF8SrTpnb411B9Zq+TpsRa/Ng
 4iuEzK5bAeuuj9p9oCvnP0b3bRe1rhUMSONsyj5I=
Authentication-Results: sas1-9c28cd37d27b.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from vsementsov-win.yandex-team.ru (unknown
 [2a02:6b8:b081:a427::1:2e])
 by sas1-c73b4b4f4b95.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 15x97ivcvu-TKMm9xQU; Tue, 14 Jun 2022 13:29:20 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, stefanha@redhat.com,
 eblake@redhat.com, hreitz@redhat.com, kwolf@redhat.com,
 vsementsov@yandex-team.ru, peter.maydell@linaro.org,
 Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
Subject: [PULL 02/10] block/copy-before-write: add on-cbw-error open parameter
Date: Tue, 14 Jun 2022 13:29:02 +0300
Message-Id: <20220614102910.1431380-3-vsementsov@yandex-team.ru>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220614102910.1431380-1-vsementsov@yandex-team.ru>
References: <20220614102910.1431380-1-vsementsov@yandex-team.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=5.45.199.163;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1j.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Currently, behavior on copy-before-write operation failure is simple:
report error to the guest.

Let's implement alternative behavior: break the whole copy-before-write
process (and corresponding backup job or NBD client) but keep guest
working. It's needed if we consider guest stability as more important.

The realisation is simple: on copy-before-write failure we set
s->snapshot_ret and continue guest operations. s->snapshot_ret being
set will lead to all further snapshot API requests. Note that all
in-flight snapshot-API requests may still success: we do wait for them
on BREAK_SNAPSHOT-failure path in cbw_do_copy_before_write().

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
---
 block/copy-before-write.c | 32 ++++++++++++++++++++++++++++++--
 qapi/block-core.json      | 25 ++++++++++++++++++++++++-
 2 files changed, 54 insertions(+), 3 deletions(-)

diff --git a/block/copy-before-write.c b/block/copy-before-write.c
index e29c46cd7a..c8a11a09d2 100644
--- a/block/copy-before-write.c
+++ b/block/copy-before-write.c
@@ -41,6 +41,7 @@
 typedef struct BDRVCopyBeforeWriteState {
     BlockCopyState *bcs;
     BdrvChild *target;
+    OnCbwError on_cbw_error;
 
     /*
      * @lock: protects access to @access_bitmap, @done_bitmap and
@@ -65,6 +66,14 @@ typedef struct BDRVCopyBeforeWriteState {
      * node. These areas must not be rewritten by guest.
      */
     BlockReqList frozen_read_reqs;
+
+    /*
+     * @snapshot_error is normally zero. But on first copy-before-write failure
+     * when @on_cbw_error == ON_CBW_ERROR_BREAK_SNAPSHOT, @snapshot_error takes
+     * value of this error (<0). After that all in-flight and further
+     * snapshot-API requests will fail with that error.
+     */
+    int snapshot_error;
 } BDRVCopyBeforeWriteState;
 
 static coroutine_fn int cbw_co_preadv(
@@ -95,16 +104,27 @@ static coroutine_fn int cbw_do_copy_before_write(BlockDriverState *bs,
         return 0;
     }
 
+    if (s->snapshot_error) {
+        return 0;
+    }
+
     off = QEMU_ALIGN_DOWN(offset, cluster_size);
     end = QEMU_ALIGN_UP(offset + bytes, cluster_size);
 
     ret = block_copy(s->bcs, off, end - off, true);
-    if (ret < 0) {
+    if (ret < 0 && s->on_cbw_error == ON_CBW_ERROR_BREAK_GUEST_WRITE) {
         return ret;
     }
 
     WITH_QEMU_LOCK_GUARD(&s->lock) {
-        bdrv_set_dirty_bitmap(s->done_bitmap, off, end - off);
+        if (ret < 0) {
+            assert(s->on_cbw_error == ON_CBW_ERROR_BREAK_SNAPSHOT);
+            if (!s->snapshot_error) {
+                s->snapshot_error = ret;
+            }
+        } else {
+            bdrv_set_dirty_bitmap(s->done_bitmap, off, end - off);
+        }
         reqlist_wait_all(&s->frozen_read_reqs, off, end - off, &s->lock);
     }
 
@@ -176,6 +196,11 @@ static BlockReq *cbw_snapshot_read_lock(BlockDriverState *bs,
 
     QEMU_LOCK_GUARD(&s->lock);
 
+    if (s->snapshot_error) {
+        g_free(req);
+        return NULL;
+    }
+
     if (bdrv_dirty_bitmap_next_zero(s->access_bitmap, offset, bytes) != -1) {
         g_free(req);
         return NULL;
@@ -351,6 +376,7 @@ static BlockdevOptions *cbw_parse_options(QDict *options, Error **errp)
      * object for original options.
      */
     qdict_extract_subqdict(options, NULL, "bitmap");
+    qdict_del(options, "on-cbw-error");
 
 out:
     visit_free(v);
@@ -395,6 +421,8 @@ static int cbw_open(BlockDriverState *bs, QDict *options, int flags,
             return -EINVAL;
         }
     }
+    s->on_cbw_error = opts->has_on_cbw_error ? opts->on_cbw_error :
+            ON_CBW_ERROR_BREAK_GUEST_WRITE;
 
     bs->total_sectors = bs->file->bs->total_sectors;
     bs->supported_write_flags = BDRV_REQ_WRITE_UNCHANGED |
diff --git a/qapi/block-core.json b/qapi/block-core.json
index f0383c7925..4abf26b42d 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -4155,6 +4155,25 @@
   'base': 'BlockdevOptionsGenericFormat',
   'data': { '*bottom': 'str' } }
 
+##
+# @OnCbwError:
+#
+# An enumeration of possible behaviors for copy-before-write operation
+# failures.
+#
+# @break-guest-write: report the error to the guest. This way, the guest
+#                     will not be able to overwrite areas that cannot be
+#                     backed up, so the backup process remains valid.
+#
+# @break-snapshot: continue guest write. Doing so will make the provided
+#                  snapshot state invalid and any backup or export
+#                  process based on it will finally fail.
+#
+# Since: 7.1
+##
+{ 'enum': 'OnCbwError',
+  'data': [ 'break-guest-write', 'break-snapshot' ] }
+
 ##
 # @BlockdevOptionsCbw:
 #
@@ -4176,11 +4195,15 @@
 #          modifications (or removing) of specified bitmap doesn't
 #          influence the filter. (Since 7.0)
 #
+# @on-cbw-error: Behavior on failure of copy-before-write operation.
+#                Default is @break-guest-write. (Since 7.1)
+#
 # Since: 6.2
 ##
 { 'struct': 'BlockdevOptionsCbw',
   'base': 'BlockdevOptionsGenericFormat',
-  'data': { 'target': 'BlockdevRef', '*bitmap': 'BlockDirtyBitmap' } }
+  'data': { 'target': 'BlockdevRef', '*bitmap': 'BlockDirtyBitmap',
+            '*on-cbw-error': 'OnCbwError' } }
 
 ##
 # @BlockdevOptions:
-- 
2.25.1


