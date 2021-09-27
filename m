Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42FA841A1F6
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Sep 2021 00:01:41 +0200 (CEST)
Received: from localhost ([::1]:38012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUygu-00025R-7q
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 18:01:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mUybc-0002dO-Gt
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 17:56:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38524)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mUybX-0002ry-F2
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 17:56:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632779766;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xd6BD/x/sTKuOfEvZBRNF9VFjqcuZKbWj3CEpGn+E8Y=;
 b=MndqAmpCIXI4tMKD+RAabgB1JpupdW49/EO3s8A5q947lhbSha9XaT87cJKtPpMF1/aE5j
 7esJ/BeEtE+0VZOsgbSmZBc9BkN77PqfTNpUno7KtL0NvhO88EDFagM0G7zEVNdRWiGuZs
 tB40XNDKcS3qjBLBH+/j0HKE33nNoV8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-193-_KrnYuJJMsGntjd6dXbuPA-1; Mon, 27 Sep 2021 17:56:05 -0400
X-MC-Unique: _KrnYuJJMsGntjd6dXbuPA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1CED018125C1;
 Mon, 27 Sep 2021 21:56:04 +0000 (UTC)
Received: from blue.redhat.com (ovpn-113-87.phx2.redhat.com [10.3.113.87])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 775A25D9D5;
 Mon, 27 Sep 2021 21:56:03 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 06/20] block: use int64_t instead of uint64_t in copy_range
 driver handlers
Date: Mon, 27 Sep 2021 16:55:31 -0500
Message-Id: <20210927215545.3930309-7-eblake@redhat.com>
In-Reply-To: <20210927215545.3930309-1-eblake@redhat.com>
References: <20210927215545.3930309-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 "open list:raw" <qemu-block@nongnu.org>, Peter Lieven <pl@kamp.de>,
 Hanna Reitz <hreitz@redhat.com>, Ronnie Sahlberg <ronniesahlberg@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

We are generally moving to int64_t for both offset and bytes parameters
on all io paths.

Main motivation is realization of 64-bit write_zeroes operation for
fast zeroing large disk chunks, up to the whole disk.

We chose signed type, to be consistent with off_t (which is signed) and
with possibility for signed return type (where negative value means
error).

So, convert driver copy_range handlers parameters which are already
64bit to signed type.

Now let's consider all callers. Simple

  git grep '\->bdrv_co_copy_range'

shows the only caller:

  bdrv_co_copy_range_internal(), which does bdrv_check_request32(),
  so everything is OK.

Still, the functions may be called directly, not only by drv->...
Let's check:

git grep '\.bdrv_co_copy_range_\(from\|to\)\s*=' | \
awk '{print $4}' | sed 's/,//' | sed 's/&//' | sort | uniq | \
while read func; do git grep "$func(" | \
grep -v "$func(BlockDriverState"; done

shows no more callers. So, we are done.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Message-Id: <20210903102807.27127-6-vsementsov@virtuozzo.com>
Signed-off-by: Eric Blake <eblake@redhat.com>
---
 include/block/block_int.h | 12 ++++++------
 block/file-posix.c        | 10 +++++-----
 block/iscsi.c             | 12 ++++++------
 block/qcow2.c             | 12 ++++++------
 block/raw-format.c        | 16 ++++++++--------
 5 files changed, 31 insertions(+), 31 deletions(-)

diff --git a/include/block/block_int.h b/include/block/block_int.h
index 2cf5f1722a7f..5536f49bc67c 100644
--- a/include/block/block_int.h
+++ b/include/block/block_int.h
@@ -314,10 +314,10 @@ struct BlockDriver {
      */
     int coroutine_fn (*bdrv_co_copy_range_from)(BlockDriverState *bs,
                                                 BdrvChild *src,
-                                                uint64_t offset,
+                                                int64_t offset,
                                                 BdrvChild *dst,
-                                                uint64_t dst_offset,
-                                                uint64_t bytes,
+                                                int64_t dst_offset,
+                                                int64_t bytes,
                                                 BdrvRequestFlags read_flags,
                                                 BdrvRequestFlags write_flags);

@@ -331,10 +331,10 @@ struct BlockDriver {
      */
     int coroutine_fn (*bdrv_co_copy_range_to)(BlockDriverState *bs,
                                               BdrvChild *src,
-                                              uint64_t src_offset,
+                                              int64_t src_offset,
                                               BdrvChild *dst,
-                                              uint64_t dst_offset,
-                                              uint64_t bytes,
+                                              int64_t dst_offset,
+                                              int64_t bytes,
                                               BdrvRequestFlags read_flags,
                                               BdrvRequestFlags write_flags);

diff --git a/block/file-posix.c b/block/file-posix.c
index 994f1c26ca7b..ed71e8d2dfee 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -3203,8 +3203,8 @@ static void raw_abort_perm_update(BlockDriverState *bs)
 }

 static int coroutine_fn raw_co_copy_range_from(
-        BlockDriverState *bs, BdrvChild *src, uint64_t src_offset,
-        BdrvChild *dst, uint64_t dst_offset, uint64_t bytes,
+        BlockDriverState *bs, BdrvChild *src, int64_t src_offset,
+        BdrvChild *dst, int64_t dst_offset, int64_t bytes,
         BdrvRequestFlags read_flags, BdrvRequestFlags write_flags)
 {
     return bdrv_co_copy_range_to(src, src_offset, dst, dst_offset, bytes,
@@ -3213,10 +3213,10 @@ static int coroutine_fn raw_co_copy_range_from(

 static int coroutine_fn raw_co_copy_range_to(BlockDriverState *bs,
                                              BdrvChild *src,
-                                             uint64_t src_offset,
+                                             int64_t src_offset,
                                              BdrvChild *dst,
-                                             uint64_t dst_offset,
-                                             uint64_t bytes,
+                                             int64_t dst_offset,
+                                             int64_t bytes,
                                              BdrvRequestFlags read_flags,
                                              BdrvRequestFlags write_flags)
 {
diff --git a/block/iscsi.c b/block/iscsi.c
index 852384086b61..01fdd1775f12 100644
--- a/block/iscsi.c
+++ b/block/iscsi.c
@@ -2169,10 +2169,10 @@ static void coroutine_fn iscsi_co_invalidate_cache(BlockDriverState *bs,

 static int coroutine_fn iscsi_co_copy_range_from(BlockDriverState *bs,
                                                  BdrvChild *src,
-                                                 uint64_t src_offset,
+                                                 int64_t src_offset,
                                                  BdrvChild *dst,
-                                                 uint64_t dst_offset,
-                                                 uint64_t bytes,
+                                                 int64_t dst_offset,
+                                                 int64_t bytes,
                                                  BdrvRequestFlags read_flags,
                                                  BdrvRequestFlags write_flags)
 {
@@ -2310,10 +2310,10 @@ static void iscsi_xcopy_data(struct iscsi_data *data,

 static int coroutine_fn iscsi_co_copy_range_to(BlockDriverState *bs,
                                                BdrvChild *src,
-                                               uint64_t src_offset,
+                                               int64_t src_offset,
                                                BdrvChild *dst,
-                                               uint64_t dst_offset,
-                                               uint64_t bytes,
+                                               int64_t dst_offset,
+                                               int64_t bytes,
                                                BdrvRequestFlags read_flags,
                                                BdrvRequestFlags write_flags)
 {
diff --git a/block/qcow2.c b/block/qcow2.c
index bb5455ed3dee..520ae37a296a 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -4026,9 +4026,9 @@ static coroutine_fn int qcow2_co_pdiscard(BlockDriverState *bs,

 static int coroutine_fn
 qcow2_co_copy_range_from(BlockDriverState *bs,
-                         BdrvChild *src, uint64_t src_offset,
-                         BdrvChild *dst, uint64_t dst_offset,
-                         uint64_t bytes, BdrvRequestFlags read_flags,
+                         BdrvChild *src, int64_t src_offset,
+                         BdrvChild *dst, int64_t dst_offset,
+                         int64_t bytes, BdrvRequestFlags read_flags,
                          BdrvRequestFlags write_flags)
 {
     BDRVQcow2State *s = bs->opaque;
@@ -4109,9 +4109,9 @@ out:

 static int coroutine_fn
 qcow2_co_copy_range_to(BlockDriverState *bs,
-                       BdrvChild *src, uint64_t src_offset,
-                       BdrvChild *dst, uint64_t dst_offset,
-                       uint64_t bytes, BdrvRequestFlags read_flags,
+                       BdrvChild *src, int64_t src_offset,
+                       BdrvChild *dst, int64_t dst_offset,
+                       int64_t bytes, BdrvRequestFlags read_flags,
                        BdrvRequestFlags write_flags)
 {
     BDRVQcow2State *s = bs->opaque;
diff --git a/block/raw-format.c b/block/raw-format.c
index d223298dfc26..345137813e5c 100644
--- a/block/raw-format.c
+++ b/block/raw-format.c
@@ -532,16 +532,16 @@ static int raw_probe_geometry(BlockDriverState *bs, HDGeometry *geo)

 static int coroutine_fn raw_co_copy_range_from(BlockDriverState *bs,
                                                BdrvChild *src,
-                                               uint64_t src_offset,
+                                               int64_t src_offset,
                                                BdrvChild *dst,
-                                               uint64_t dst_offset,
-                                               uint64_t bytes,
+                                               int64_t dst_offset,
+                                               int64_t bytes,
                                                BdrvRequestFlags read_flags,
                                                BdrvRequestFlags write_flags)
 {
     int ret;

-    ret = raw_adjust_offset(bs, (int64_t *)&src_offset, bytes, false);
+    ret = raw_adjust_offset(bs, &src_offset, bytes, false);
     if (ret) {
         return ret;
     }
@@ -551,16 +551,16 @@ static int coroutine_fn raw_co_copy_range_from(BlockDriverState *bs,

 static int coroutine_fn raw_co_copy_range_to(BlockDriverState *bs,
                                              BdrvChild *src,
-                                             uint64_t src_offset,
+                                             int64_t src_offset,
                                              BdrvChild *dst,
-                                             uint64_t dst_offset,
-                                             uint64_t bytes,
+                                             int64_t dst_offset,
+                                             int64_t bytes,
                                              BdrvRequestFlags read_flags,
                                              BdrvRequestFlags write_flags)
 {
     int ret;

-    ret = raw_adjust_offset(bs, (int64_t *)&dst_offset, bytes, true);
+    ret = raw_adjust_offset(bs, &dst_offset, bytes, true);
     if (ret) {
         return ret;
     }
-- 
2.31.1


