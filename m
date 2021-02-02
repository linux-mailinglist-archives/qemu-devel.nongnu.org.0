Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33CDE30CF53
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 23:49:15 +0100 (CET)
Received: from localhost ([::1]:48228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l74Ty-0001aI-7O
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 17:49:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l74Qv-0007eB-HU
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 17:46:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46201)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l74Qg-0005vh-2i
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 17:46:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612305948;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LWVHozr4BZlme0MW/Vy8UqZ7e+8EZueafEJnVVl628c=;
 b=MkYiAS7OvvW0U1gSDBNLRGOjhj9Vz27oYHV20Z9nor5lqS5C29JS9HSmwmBMLWrYIGQ1Wh
 hZlT8bCKI2/DFgEsUpFHNhfhGi8x4qyc+3kyvCDCTv4E7qolVqQM8Kz8u8e5EH3Bjbk2OK
 Bj8E2Ne/6Lg/0di6P0ZinQoO+798/jU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-187-vTmHBNK7NFKRrw8I0g_xYA-1; Tue, 02 Feb 2021 17:45:44 -0500
X-MC-Unique: vTmHBNK7NFKRrw8I0g_xYA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BF99F800D55;
 Tue,  2 Feb 2021 22:45:43 +0000 (UTC)
Received: from blue.redhat.com (ovpn-112-103.phx2.redhat.com [10.3.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 305E910016F5;
 Tue,  2 Feb 2021 22:45:43 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 11/20] block/io: support int64_t bytes in
 bdrv_co_do_pwrite_zeroes()
Date: Tue,  2 Feb 2021 16:45:20 -0600
Message-Id: <20210202224529.642055-12-eblake@redhat.com>
In-Reply-To: <20210202224529.642055-1-eblake@redhat.com>
References: <20210202224529.642055-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.386,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 "open list:Block I/O path" <qemu-block@nongnu.org>,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
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

So, prepare bdrv_co_do_pwrite_zeroes() now.

Callers are safe, as converting int to int64_t is safe. Concentrate on
'bytes' usage in the function (thx to Eric Blake):

    compute 'int tail' via % 'int alignment' - safe
    fragmentation loop 'int num' - still fragments with a cap on
      max_transfer

    use of 'num' within the loop
    MIN(bytes, max_transfer) as well as %alignment - still works, so
         calculations in if (head) {} are safe
    clamp size by 'int max_write_zeroes' - safe
    drv->bdrv_co_pwrite_zeroes(int) - safe because of clamping
    clamp size by 'int max_transfer' - safe
    buf allocation is still clamped to max_transfer
    qemu_iovec_init_buf(size_t) - safe because of clamping
    bdrv_driver_pwritev(uint64_t) - safe

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-Id: <20201211183934.169161-11-vsementsov@virtuozzo.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Eric Blake <eblake@redhat.com>
---
 block/io.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/block/io.c b/block/io.c
index cb5064155b6a..98d9f5bdf48a 100644
--- a/block/io.c
+++ b/block/io.c
@@ -41,7 +41,7 @@

 static void bdrv_parent_cb_resize(BlockDriverState *bs);
 static int coroutine_fn bdrv_co_do_pwrite_zeroes(BlockDriverState *bs,
-    int64_t offset, int bytes, BdrvRequestFlags flags);
+    int64_t offset, int64_t bytes, BdrvRequestFlags flags);

 static void bdrv_parent_drained_begin(BlockDriverState *bs, BdrvChild *ignore,
                                       bool ignore_bds_parents)
@@ -1819,7 +1819,7 @@ int coroutine_fn bdrv_co_preadv_part(BdrvChild *child,
 }

 static int coroutine_fn bdrv_co_do_pwrite_zeroes(BlockDriverState *bs,
-    int64_t offset, int bytes, BdrvRequestFlags flags)
+    int64_t offset, int64_t bytes, BdrvRequestFlags flags)
 {
     BlockDriver *drv = bs->drv;
     QEMUIOVector qiov;
@@ -1834,6 +1834,8 @@ static int coroutine_fn bdrv_co_do_pwrite_zeroes(BlockDriverState *bs,
                         bs->bl.request_alignment);
     int max_transfer = MIN_NON_ZERO(bs->bl.max_transfer, MAX_BOUNCE_BUFFER);

+    bdrv_check_request(offset, bytes, &error_abort);
+
     if (!drv) {
         return -ENOMEDIUM;
     }
@@ -1849,7 +1851,7 @@ static int coroutine_fn bdrv_co_do_pwrite_zeroes(BlockDriverState *bs,
     assert(max_write_zeroes >= bs->bl.request_alignment);

     while (bytes > 0 && !ret) {
-        int num = bytes;
+        int64_t num = bytes;

         /* Align request.  Block drivers can expect the "bulk" of the request
          * to be aligned, and that unaligned requests do not cross cluster
-- 
2.30.0


